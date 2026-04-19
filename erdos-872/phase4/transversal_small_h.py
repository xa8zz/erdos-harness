from __future__ import annotations

import argparse
import csv
import math
import random
import time
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path
from typing import Callable

import networkx as nx
import numpy as np
from scipy.optimize import Bounds, LinearConstraint, milp


VertexPolicy = Callable[["StateView", random.Random], int]
EdgePolicy = Callable[["StateView", random.Random], int]


@dataclass(frozen=True)
class PolicyRegistry:
    shortener: dict[str, VertexPolicy]
    prolonger: dict[str, EdgePolicy]


@dataclass(frozen=True)
class SolveSummary:
    N: int
    h: int
    T_star: int
    static_cover_lower: float
    static_cover_exact: int
    ratio_to_lower: float
    ratio_to_exact: float
    positions_evaluated: int
    elapsed_seconds: float
    principal_variation: tuple[tuple[str, tuple[int, ...]], ...]


@dataclass(frozen=True)
class StateView:
    hypergraph: "TopFacetHypergraph"
    claimed_mask: int
    captured_mask: int
    unresolved_edges_mask: int
    available_vertices_mask: int
    shortener_turn: bool


class TopFacetHypergraph:
    """Complete top-facet hypergraph on (h-1)-subsets of [N]."""

    def __init__(self, N: int, h: int):
        if not (2 <= h <= N):
            raise ValueError("require 2 <= h <= N")
        self.N = N
        self.h = h
        self.ground = tuple(range(N))
        self.vertices = tuple(combinations(self.ground, h - 1))
        self.edges = tuple(combinations(self.ground, h))
        self.vertex_count = len(self.vertices)
        self.edge_count = len(self.edges)
        self.vertex_index = {vertex: index for index, vertex in enumerate(self.vertices)}
        self.edge_vertex_indices = tuple(
            tuple(self.vertex_index[tuple(sorted(set(edge) - {point}))] for point in edge)
            for edge in self.edges
        )
        self.edge_vertex_masks = tuple(
            sum(1 << vertex for vertex in edge_vertices) for edge_vertices in self.edge_vertex_indices
        )
        incident_masks = [0] * self.vertex_count
        for edge_index, edge_mask in enumerate(self.edge_vertex_masks):
            remaining = edge_mask
            while remaining:
                bit = remaining & -remaining
                vertex_index = bit.bit_length() - 1
                incident_masks[vertex_index] |= 1 << edge_index
                remaining ^= bit
        self.incident_edge_masks = tuple(incident_masks)
        self.vertex_degrees = tuple(mask.bit_count() for mask in self.incident_edge_masks)
        self.all_vertices_mask = (1 << self.vertex_count) - 1
        self.all_edges_mask = (1 << self.edge_count) - 1

    def vertex_label(self, vertex_index: int) -> tuple[int, ...]:
        return self.vertices[vertex_index]

    def edge_label(self, edge_index: int) -> tuple[int, ...]:
        return self.edges[edge_index]

    def unresolved_edges_mask(self, claimed_mask: int, captured_mask: int) -> int:
        hit_edges = 0
        claimed = claimed_mask
        while claimed:
            bit = claimed & -claimed
            vertex_index = bit.bit_length() - 1
            hit_edges |= self.incident_edge_masks[vertex_index]
            claimed ^= bit

        fully_captured_edges = 0
        for edge_index, edge_mask in enumerate(self.edge_vertex_masks):
            if edge_mask & ~captured_mask == 0:
                fully_captured_edges |= 1 << edge_index
        return self.all_edges_mask & ~(hit_edges | fully_captured_edges)

    def available_vertices_mask(self, unresolved_edges_mask: int, blocked_mask: int) -> int:
        available = 0
        unresolved = unresolved_edges_mask
        while unresolved:
            bit = unresolved & -unresolved
            edge_index = bit.bit_length() - 1
            available |= self.edge_vertex_masks[edge_index]
            unresolved ^= bit
        return available & ~blocked_mask

    def state_view(self, claimed_mask: int, captured_mask: int, shortener_turn: bool) -> StateView:
        unresolved = self.unresolved_edges_mask(claimed_mask, captured_mask)
        blocked = claimed_mask | captured_mask
        available = self.available_vertices_mask(unresolved, blocked)
        return StateView(
            hypergraph=self,
            claimed_mask=claimed_mask,
            captured_mask=captured_mask,
            unresolved_edges_mask=unresolved,
            available_vertices_mask=available,
            shortener_turn=shortener_turn,
        )

    def available_vertex_indices(self, state: StateView) -> tuple[int, ...]:
        return tuple(_iter_bits(state.available_vertices_mask))

    def unresolved_edge_indices(self, state: StateView) -> tuple[int, ...]:
        return tuple(_iter_bits(state.unresolved_edges_mask))

    def vertex_hit_count(self, unresolved_edges_mask: int, vertex_index: int) -> int:
        return (self.incident_edge_masks[vertex_index] & unresolved_edges_mask).bit_count()

    def edge_available_vertex_count(self, available_vertices_mask: int, edge_index: int) -> int:
        return (self.edge_vertex_masks[edge_index] & available_vertices_mask).bit_count()


def _iter_bits(mask: int):
    while mask:
        bit = mask & -mask
        yield bit.bit_length() - 1
        mask ^= bit


def _choose_one_bit(mask: int) -> int:
    return (mask & -mask).bit_length() - 1


class ExactTopFacetSolver:
    """Exact Pro-first minimax on the top-facet hypergraph."""

    def __init__(self, N: int, h: int):
        self.hypergraph = TopFacetHypergraph(N, h)
        self.transposition: dict[tuple[int, int, bool], int] = {}
        self.iso_buckets: dict[tuple[object, ...], list[tuple[tuple[int, int, bool], nx.Graph, int]]] = {}
        self.graph_cache: dict[tuple[int, int], nx.Graph] = {}

    def _state_signature(self, claimed_mask: int, captured_mask: int, shortener_turn: bool) -> tuple[object, ...]:
        state = self.hypergraph.state_view(claimed_mask, captured_mask, shortener_turn)
        claimed_counts = [0] * self.hypergraph.N
        captured_counts = [0] * self.hypergraph.N
        claimed = claimed_mask
        while claimed:
            bit = claimed & -claimed
            vertex_index = bit.bit_length() - 1
            for point in self.hypergraph.vertex_label(vertex_index):
                claimed_counts[point] += 1
            claimed ^= bit
        captured = captured_mask
        while captured:
            bit = captured & -captured
            vertex_index = bit.bit_length() - 1
            for point in self.hypergraph.vertex_label(vertex_index):
                captured_counts[point] += 1
            captured ^= bit
        ground_signature = tuple(sorted(zip(claimed_counts, captured_counts)))
        return (
            shortener_turn,
            claimed_mask.bit_count(),
            captured_mask.bit_count(),
            state.unresolved_edges_mask.bit_count(),
            ground_signature,
        )

    def _state_graph(self, claimed_mask: int, captured_mask: int) -> nx.Graph:
        key = (claimed_mask, captured_mask)
        cached = self.graph_cache.get(key)
        if cached is not None:
            return cached
        graph = nx.Graph()
        for point in self.hypergraph.ground:
            graph.add_node(("g", point), kind="ground")
        claimed = claimed_mask
        while claimed:
            bit = claimed & -claimed
            vertex_index = bit.bit_length() - 1
            node = ("c", vertex_index)
            graph.add_node(node, kind="claimed")
            for point in self.hypergraph.vertex_label(vertex_index):
                graph.add_edge(node, ("g", point))
            claimed ^= bit
        captured = captured_mask
        while captured:
            bit = captured & -captured
            vertex_index = bit.bit_length() - 1
            node = ("p", vertex_index)
            graph.add_node(node, kind="captured")
            for point in self.hypergraph.vertex_label(vertex_index):
                graph.add_edge(node, ("g", point))
            captured ^= bit
        self.graph_cache[key] = graph
        return graph

    def _lookup_value(self, claimed_mask: int, captured_mask: int, shortener_turn: bool) -> int | None:
        key = (claimed_mask, captured_mask, shortener_turn)
        cached = self.transposition.get(key)
        if cached is not None:
            return cached
        signature = self._state_signature(claimed_mask, captured_mask, shortener_turn)
        bucket = self.iso_buckets.get(signature)
        if not bucket:
            return None
        graph = self._state_graph(claimed_mask, captured_mask)
        node_match = lambda left, right: left["kind"] == right["kind"]
        for _, representative_graph, value in bucket:
            matcher = nx.isomorphism.GraphMatcher(graph, representative_graph, node_match=node_match)
            if matcher.is_isomorphic():
                self.transposition[key] = value
                return value
        return None

    def _store_value(self, claimed_mask: int, captured_mask: int, shortener_turn: bool, value: int) -> None:
        key = (claimed_mask, captured_mask, shortener_turn)
        self.transposition[key] = value
        signature = self._state_signature(claimed_mask, captured_mask, shortener_turn)
        bucket = self.iso_buckets.setdefault(signature, [])
        bucket.append((key, self._state_graph(claimed_mask, captured_mask), value))

    def _ordered_shortener_moves(self, state: StateView) -> tuple[int, ...]:
        hypergraph = self.hypergraph
        return tuple(
            sorted(
                hypergraph.available_vertex_indices(state),
                key=lambda vertex_index: (
                    -hypergraph.vertex_hit_count(state.unresolved_edges_mask, vertex_index),
                    -hypergraph.vertex_degrees[vertex_index],
                    hypergraph.vertex_label(vertex_index),
                ),
            )
        )

    def _ordered_prolonger_moves(self, state: StateView) -> tuple[int, ...]:
        hypergraph = self.hypergraph
        available_vertices = state.available_vertices_mask
        return tuple(
            sorted(
                hypergraph.unresolved_edge_indices(state),
                key=lambda edge_index: (
                    hypergraph.edge_available_vertex_count(available_vertices, edge_index),
                    tuple(
                        sorted(
                            (
                                hypergraph.vertex_hit_count(state.unresolved_edges_mask, vertex_index)
                                for vertex_index in hypergraph.edge_vertex_indices[edge_index]
                            ),
                            reverse=True,
                        )
                    ),
                    hypergraph.edge_label(edge_index),
                ),
            )
        )

    def _solve_value(self, claimed_mask: int, captured_mask: int, shortener_turn: bool) -> int:
        cached = self._lookup_value(claimed_mask, captured_mask, shortener_turn)
        if cached is not None:
            return cached

        state = self.hypergraph.state_view(claimed_mask, captured_mask, shortener_turn)
        if state.unresolved_edges_mask == 0:
            self._store_value(claimed_mask, captured_mask, shortener_turn, 0)
            return 0

        if shortener_turn:
            best_value = math.inf
            for vertex_index in self._ordered_shortener_moves(state):
                child_value = 1 + self._solve_value(
                    claimed_mask | (1 << vertex_index),
                    captured_mask,
                    False,
                )
                if child_value < best_value:
                    best_value = child_value
            self._store_value(claimed_mask, captured_mask, shortener_turn, int(best_value))
            return int(best_value)

        best_value = -1
        for edge_index in self._ordered_prolonger_moves(state):
            child_value = self._solve_value(
                claimed_mask,
                captured_mask | self.hypergraph.edge_vertex_masks[edge_index],
                True,
            )
            if child_value > best_value:
                best_value = child_value
        self._store_value(claimed_mask, captured_mask, shortener_turn, best_value)
        return best_value

    def _principal_variation(self) -> tuple[tuple[str, tuple[int, ...]], ...]:
        claimed_mask = 0
        captured_mask = 0
        shortener_turn = False
        line: list[tuple[str, tuple[int, ...]]] = []
        while True:
            current_value = self._solve_value(claimed_mask, captured_mask, shortener_turn)
            state = self.hypergraph.state_view(claimed_mask, captured_mask, shortener_turn)
            if state.unresolved_edges_mask == 0:
                break
            if shortener_turn:
                chosen = None
                for vertex_index in self._ordered_shortener_moves(state):
                    candidate = 1 + self._solve_value(
                        claimed_mask | (1 << vertex_index),
                        captured_mask,
                        False,
                    )
                    if candidate == current_value:
                        chosen = vertex_index
                        break
                if chosen is None:
                    break
                claimed_mask |= 1 << chosen
                line.append(("S", self.hypergraph.vertex_label(chosen)))
                shortener_turn = False
                continue

            chosen = None
            for edge_index in self._ordered_prolonger_moves(state):
                candidate = self._solve_value(
                    claimed_mask,
                    captured_mask | self.hypergraph.edge_vertex_masks[edge_index],
                    True,
                )
                if candidate == current_value:
                    chosen = edge_index
                    break
            if chosen is None:
                break
            captured_mask |= self.hypergraph.edge_vertex_masks[chosen]
            line.append(("P", self.hypergraph.edge_label(chosen)))
            shortener_turn = True
        return tuple(line)

    def solve(self) -> dict[str, object]:
        started = time.time()
        T_star = self._solve_value(0, 0, False)
        elapsed = time.time() - started
        return {
            "N": self.hypergraph.N,
            "h": self.hypergraph.h,
            "T_star": T_star,
            "positions_evaluated": len(self.transposition),
            "elapsed_seconds": elapsed,
            "principal_variation": self._principal_variation(),
        }


def brute_force_game_value(N: int, h: int) -> dict[str, int]:
    """Independent exhaustive solver for small sanity checks."""
    hypergraph = TopFacetHypergraph(N, h)
    cache: dict[tuple[int, int, bool], int] = {}

    def solve(claimed_mask: int, captured_mask: int, shortener_turn: bool) -> int:
        key = (claimed_mask, captured_mask, shortener_turn)
        cached = cache.get(key)
        if cached is not None:
            return cached
        state = hypergraph.state_view(claimed_mask, captured_mask, shortener_turn)
        if state.unresolved_edges_mask == 0:
            cache[key] = 0
            return 0
        if shortener_turn:
            best = math.inf
            for vertex_index in hypergraph.available_vertex_indices(state):
                best = min(best, 1 + solve(claimed_mask | (1 << vertex_index), captured_mask, False))
            cache[key] = int(best)
            return int(best)
        best = -1
        for edge_index in hypergraph.unresolved_edge_indices(state):
            best = max(best, solve(claimed_mask, captured_mask | hypergraph.edge_vertex_masks[edge_index], True))
        cache[key] = best
        return best

    return {"T_star": solve(0, 0, False), "positions_evaluated": len(cache)}


class StaticCoverSolver:
    """Exact minimum static hitting set on the initial hypergraph."""

    def __init__(self, N: int, h: int):
        self.hypergraph = TopFacetHypergraph(N, h)
        self.best = self.hypergraph.vertex_count + 1
        self.memo: dict[int, int] = {}

    def _greedy_cover(self, uncovered_edges_mask: int) -> int:
        chosen = 0
        uncovered = uncovered_edges_mask
        while uncovered:
            best_vertex = max(
                range(self.hypergraph.vertex_count),
                key=lambda vertex_index: (self.hypergraph.incident_edge_masks[vertex_index] & uncovered).bit_count(),
            )
            cover = self.hypergraph.incident_edge_masks[best_vertex] & uncovered
            if cover == 0:
                return self.best
            uncovered &= ~cover
            chosen += 1
        return chosen

    def _lower_bound(self, uncovered_edges_mask: int) -> int:
        if uncovered_edges_mask == 0:
            return 0
        max_cover = max(
            (self.hypergraph.incident_edge_masks[vertex_index] & uncovered_edges_mask).bit_count()
            for vertex_index in range(self.hypergraph.vertex_count)
        )
        if max_cover == 0:
            return self.hypergraph.vertex_count + 1
        return math.ceil(uncovered_edges_mask.bit_count() / max_cover)

    def _branch(self, uncovered_edges_mask: int, chosen_so_far: int) -> None:
        if uncovered_edges_mask == 0:
            self.best = min(self.best, chosen_so_far)
            return
        optimistic = chosen_so_far + self._lower_bound(uncovered_edges_mask)
        if optimistic >= self.best:
            return
        greedy_total = chosen_so_far + self._greedy_cover(uncovered_edges_mask)
        if greedy_total < self.best:
            self.best = greedy_total
        cached = self.memo.get(uncovered_edges_mask)
        if cached is not None and chosen_so_far >= cached:
            return
        self.memo[uncovered_edges_mask] = chosen_so_far

        pivot_edge_index = _choose_one_bit(uncovered_edges_mask)
        candidate_vertices = sorted(
            self.hypergraph.edge_vertex_indices[pivot_edge_index],
            key=lambda vertex_index: (
                -(self.hypergraph.incident_edge_masks[vertex_index] & uncovered_edges_mask).bit_count(),
                self.hypergraph.vertex_label(vertex_index),
            ),
        )
        for vertex_index in candidate_vertices:
            covered = self.hypergraph.incident_edge_masks[vertex_index] & uncovered_edges_mask
            self._branch(uncovered_edges_mask & ~covered, chosen_so_far + 1)

    def solve(self) -> int:
        try:
            return self._solve_via_milp()
        except Exception:
            self._branch(self.hypergraph.all_edges_mask, 0)
            return self.best

    def _solve_via_milp(self) -> int:
        costs = np.ones(self.hypergraph.vertex_count, dtype=float)
        constraints = np.zeros((self.hypergraph.edge_count, self.hypergraph.vertex_count), dtype=float)
        for edge_index, vertices in enumerate(self.hypergraph.edge_vertex_indices):
            for vertex_index in vertices:
                constraints[edge_index, vertex_index] = 1.0
        result = milp(
            c=costs,
            integrality=np.ones(self.hypergraph.vertex_count, dtype=int),
            bounds=Bounds(
                np.zeros(self.hypergraph.vertex_count, dtype=float),
                np.ones(self.hypergraph.vertex_count, dtype=float),
            ),
            constraints=LinearConstraint(
                constraints,
                np.ones(self.hypergraph.edge_count, dtype=float),
                np.full(self.hypergraph.edge_count, np.inf),
            ),
        )
        if not result.success or result.x is None:
            raise RuntimeError(f"static cover MILP failed: {result.message}")
        return int(round(result.fun))


def shortener_max_degree(state: StateView, rng: random.Random) -> int:
    hypergraph = state.hypergraph
    return max(
        hypergraph.available_vertex_indices(state),
        key=lambda vertex_index: (
            hypergraph.vertex_hit_count(state.unresolved_edges_mask, vertex_index),
            hypergraph.vertex_degrees[vertex_index],
            tuple(-value for value in hypergraph.vertex_label(vertex_index)),
        ),
    )


def shortener_min_edge_best_vertex(state: StateView, rng: random.Random) -> int:
    hypergraph = state.hypergraph
    pivot_edge = min(
        hypergraph.unresolved_edge_indices(state),
        key=lambda edge_index: (
            hypergraph.edge_available_vertex_count(state.available_vertices_mask, edge_index),
            hypergraph.edge_label(edge_index),
        ),
    )
    return max(
        (
            vertex_index
            for vertex_index in hypergraph.edge_vertex_indices[pivot_edge]
            if state.available_vertices_mask & (1 << vertex_index)
        ),
        key=lambda vertex_index: (
            hypergraph.vertex_hit_count(state.unresolved_edges_mask, vertex_index),
            hypergraph.vertex_degrees[vertex_index],
            tuple(-value for value in hypergraph.vertex_label(vertex_index)),
        ),
    )


def shortener_random_high_degree(state: StateView, rng: random.Random) -> int:
    hypergraph = state.hypergraph
    ranked = sorted(
        hypergraph.available_vertex_indices(state),
        key=lambda vertex_index: (
            hypergraph.vertex_hit_count(state.unresolved_edges_mask, vertex_index),
            hypergraph.vertex_degrees[vertex_index],
            tuple(-value for value in hypergraph.vertex_label(vertex_index)),
        ),
        reverse=True,
    )
    window = max(1, min(5, len(ranked)))
    return rng.choice(ranked[:window])


def prolonger_smallest_neighborhood(state: StateView, rng: random.Random) -> int:
    hypergraph = state.hypergraph
    return min(
        hypergraph.unresolved_edge_indices(state),
        key=lambda edge_index: (
            _post_capture_resolved_count(hypergraph, state, edge_index),
            tuple(
                sorted(
                    hypergraph.vertex_hit_count(state.unresolved_edges_mask, vertex_index)
                    for vertex_index in hypergraph.edge_vertex_indices[edge_index]
                )
            ),
            hypergraph.edge_label(edge_index),
        ),
    )


def prolonger_random(state: StateView, rng: random.Random) -> int:
    return rng.choice(state.hypergraph.unresolved_edge_indices(state))


def prolonger_highest_degree_vertex(state: StateView, rng: random.Random) -> int:
    hypergraph = state.hypergraph
    return max(
        hypergraph.unresolved_edge_indices(state),
        key=lambda edge_index: (
            max(
                hypergraph.vertex_hit_count(state.unresolved_edges_mask, vertex_index)
                for vertex_index in hypergraph.edge_vertex_indices[edge_index]
            ),
            sum(
                hypergraph.vertex_hit_count(state.unresolved_edges_mask, vertex_index)
                for vertex_index in hypergraph.edge_vertex_indices[edge_index]
            ),
            tuple(-value for value in hypergraph.edge_label(edge_index)),
        ),
    )


def _edge_captured_overlap(hypergraph: TopFacetHypergraph, state: StateView, edge_index: int) -> int:
    return (hypergraph.edge_vertex_masks[edge_index] & state.captured_mask).bit_count()


def _edge_new_capture_count(hypergraph: TopFacetHypergraph, state: StateView, edge_index: int) -> int:
    return (hypergraph.edge_vertex_masks[edge_index] & ~state.captured_mask).bit_count()


def _edge_core_vertex_count(
    hypergraph: TopFacetHypergraph,
    edge_index: int,
    core_points: tuple[int, ...],
) -> int:
    if len(core_points) >= hypergraph.h:
        return 0
    edge = hypergraph.edge_label(edge_index)
    if not set(core_points).issubset(edge):
        return 0
    return hypergraph.h - len(core_points)


def _fixed_core_policy(state: StateView, core_points: tuple[int, ...]) -> int:
    hypergraph = state.hypergraph
    return max(
        hypergraph.unresolved_edge_indices(state),
        key=lambda edge_index: (
            _edge_core_vertex_count(hypergraph, edge_index, core_points),
            _edge_captured_overlap(hypergraph, state, edge_index),
            -_post_capture_resolved_count(hypergraph, state, edge_index),
            -_edge_new_capture_count(hypergraph, state, edge_index),
            tuple(-value for value in hypergraph.edge_label(edge_index)),
        ),
    )


def prolonger_fixed_pair_core(state: StateView, rng: random.Random) -> int:
    return _fixed_core_policy(state, (0, 1))


def prolonger_fixed_triple_core(state: StateView, rng: random.Random) -> int:
    return _fixed_core_policy(state, (0, 1, 2))


def prolonger_max_captured_overlap(state: StateView, rng: random.Random) -> int:
    hypergraph = state.hypergraph
    return max(
        hypergraph.unresolved_edge_indices(state),
        key=lambda edge_index: (
            _edge_captured_overlap(hypergraph, state, edge_index),
            -_post_capture_resolved_count(hypergraph, state, edge_index),
            -_edge_new_capture_count(hypergraph, state, edge_index),
            _edge_core_vertex_count(hypergraph, edge_index, (0, 1)),
            tuple(-value for value in hypergraph.edge_label(edge_index)),
        ),
    )


def prolonger_pair_core_overlap(state: StateView, rng: random.Random) -> int:
    hypergraph = state.hypergraph
    return max(
        hypergraph.unresolved_edge_indices(state),
        key=lambda edge_index: (
            _edge_core_vertex_count(hypergraph, edge_index, (0, 1)),
            _edge_captured_overlap(hypergraph, state, edge_index),
            -_post_capture_resolved_count(hypergraph, state, edge_index),
            -_edge_new_capture_count(hypergraph, state, edge_index),
            tuple(-value for value in hypergraph.edge_label(edge_index)),
        ),
    )


def prolonger_weighted_overlap_random(state: StateView, rng: random.Random) -> int:
    hypergraph = state.hypergraph
    candidates = list(hypergraph.unresolved_edge_indices(state))
    weights = []
    for edge_index in candidates:
        overlap = _edge_captured_overlap(hypergraph, state, edge_index)
        pair_core = _edge_core_vertex_count(hypergraph, edge_index, (0, 1))
        resolved_penalty = _post_capture_resolved_count(hypergraph, state, edge_index)
        weight = (1 + overlap) ** 3 * (1 + pair_core) / (1 + resolved_penalty)
        weights.append(weight)
    return rng.choices(candidates, weights=weights, k=1)[0]


def build_policy_registry() -> PolicyRegistry:
    return PolicyRegistry(
        shortener={
            "max_degree": shortener_max_degree,
            "min_edge_best_vertex": shortener_min_edge_best_vertex,
            "random_high_degree": shortener_random_high_degree,
        },
        prolonger={
            "smallest_neighborhood": prolonger_smallest_neighborhood,
            "random": prolonger_random,
            "highest_degree_vertex": prolonger_highest_degree_vertex,
            "fixed_pair_core": prolonger_fixed_pair_core,
            "fixed_triple_core": prolonger_fixed_triple_core,
            "max_captured_overlap": prolonger_max_captured_overlap,
            "pair_core_overlap": prolonger_pair_core_overlap,
            "weighted_overlap_random": prolonger_weighted_overlap_random,
        },
    )


def _post_capture_resolved_count(hypergraph: TopFacetHypergraph, state: StateView, edge_index: int) -> int:
    next_captured = state.captured_mask | hypergraph.edge_vertex_masks[edge_index]
    next_unresolved = hypergraph.unresolved_edges_mask(state.claimed_mask, next_captured)
    return state.unresolved_edges_mask.bit_count() - next_unresolved.bit_count()


def simulate_game(
    N: int,
    h: int,
    shortener_policy: VertexPolicy,
    prolonger_policy: EdgePolicy,
    seed: int = 0,
) -> dict[str, object]:
    hypergraph = TopFacetHypergraph(N, h)
    rng = random.Random(seed)
    claimed_mask = 0
    captured_mask = 0
    shortener_moves = 0
    transcript: list[tuple[str, tuple[int, ...]]] = []

    while True:
        pro_state = hypergraph.state_view(claimed_mask, captured_mask, False)
        if pro_state.unresolved_edges_mask == 0:
            break
        edge_index = prolonger_policy(pro_state, rng)
        captured_mask |= hypergraph.edge_vertex_masks[edge_index]
        transcript.append(("P", hypergraph.edge_label(edge_index)))

        short_state = hypergraph.state_view(claimed_mask, captured_mask, True)
        if short_state.unresolved_edges_mask == 0:
            break
        vertex_index = shortener_policy(short_state, rng)
        claimed_mask |= 1 << vertex_index
        shortener_moves += 1
        transcript.append(("S", hypergraph.vertex_label(vertex_index)))

    return {
        "N": N,
        "h": h,
        "T": shortener_moves,
        "transcript": tuple(transcript),
    }


def run_grid(
    exact_limits: dict[int, int] | None = None,
    static_cover_exact_limits: dict[int, int] | None = None,
    heuristic_trials: int = 32,
    instances: list[tuple[int, int]] | None = None,
    registry: PolicyRegistry | None = None,
) -> list[dict[str, object]]:
    if exact_limits is None:
        exact_limits = {3: 8, 4: 7, 5: 6}
    if static_cover_exact_limits is None:
        static_cover_exact_limits = {3: 12, 4: 9, 5: 8}
    if instances is None:
        instances = [
            (N, h)
            for h, max_N in ((3, 12), (4, 10), (5, 8))
            for N in range(h + 1, max_N + 1)
        ]
    if registry is None:
        registry = build_policy_registry()

    results: list[dict[str, object]] = []
    for N, h in instances:
        row: dict[str, object] = {
            "N": N,
            "h": h,
            "vertex_count": math.comb(N, h - 1),
            "edge_count": math.comb(N, h),
        }
        static_lower = row["edge_count"] / (N - h + 1)
        row["tau_lower"] = static_lower
        static_cover_limit = static_cover_exact_limits.get(h, h)
        row["tau_exact"] = StaticCoverSolver(N, h).solve() if N <= static_cover_limit else None
        exact_limit = exact_limits.get(h, h)
        if N <= exact_limit:
            exact = ExactTopFacetSolver(N, h).solve()
            row["T_star"] = exact["T_star"]
            row["exact_positions"] = exact["positions_evaluated"]
            row["exact_elapsed_seconds"] = exact["elapsed_seconds"]
            row["principal_variation"] = exact["principal_variation"]
            row["g_lower"] = exact["T_star"] / static_lower
            row["g_exact"] = (
                exact["T_star"] / row["tau_exact"] if row["tau_exact"] is not None else None
            )
        else:
            row["T_star"] = None
            row["exact_positions"] = None
            row["exact_elapsed_seconds"] = None
            row["principal_variation"] = ()
            row["g_lower"] = None
            row["g_exact"] = None

        for short_name, shortener_policy in registry.shortener.items():
            for pro_name, prolonger_policy in registry.prolonger.items():
                scores = [
                    simulate_game(N, h, shortener_policy, prolonger_policy, seed)["T"]
                    for seed in range(heuristic_trials)
                ]
                key_prefix = f"{short_name}__{pro_name}"
                row[f"{key_prefix}__mean"] = sum(scores) / len(scores)
                row[f"{key_prefix}__max"] = max(scores)
                row[f"{key_prefix}__min"] = min(scores)
        results.append(row)
    return results


def write_results(
    rows: list[dict[str, object]],
    csv_path: Path,
) -> None:
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = sorted({key for row in rows for key in row})
    with csv_path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def main() -> None:
    parser = argparse.ArgumentParser(description="Empirical top-facet transversal game exploration")
    parser.add_argument(
        "--csv",
        type=Path,
        default=Path("transversal_small_h_results.csv"),
        help="Where to write the result table",
    )
    parser.add_argument(
        "--heuristic-trials",
        type=int,
        default=16,
        help="Number of random trials for each heuristic pairing",
    )
    parser.add_argument(
        "--exact-limit",
        action="append",
        default=[],
        help="Override exact limits as h:N (for example 3:8)",
    )
    parser.add_argument(
        "--static-cover-limit",
        action="append",
        default=[],
        help="Override exact static-cover limits as h:N (for example 4:9)",
    )
    parser.add_argument(
        "--instance",
        action="append",
        default=[],
        help="Run only the specified N:h instance (repeatable, for example 10:6)",
    )
    args = parser.parse_args()

    exact_limits = {3: 8, 4: 7, 5: 6}
    for item in args.exact_limit:
        h_text, N_text = item.split(":", 1)
        exact_limits[int(h_text)] = int(N_text)
    static_cover_exact_limits = {3: 12, 4: 9, 5: 8}
    for item in args.static_cover_limit:
        h_text, N_text = item.split(":", 1)
        static_cover_exact_limits[int(h_text)] = int(N_text)
    instances = None
    if args.instance:
        instances = []
        for item in args.instance:
            N_text, h_text = item.split(":", 1)
            instances.append((int(N_text), int(h_text)))

    rows = run_grid(
        exact_limits=exact_limits,
        static_cover_exact_limits=static_cover_exact_limits,
        heuristic_trials=args.heuristic_trials,
        instances=instances,
    )
    write_results(rows, args.csv)

    for row in rows:
        T_star = "-" if row["T_star"] is None else row["T_star"]
        g_exact = "-" if row["g_exact"] is None else f"{row['g_exact']:.3f}"
        tau_exact = "-" if row["tau_exact"] is None else row["tau_exact"]
        print(
            f"N={row['N']:>2} h={row['h']} "
            f"T*={T_star:>3} tau_exact={tau_exact:>3} "
            f"tau_lower={row['tau_lower']:.2f} g_exact={g_exact}"
        )


if __name__ == "__main__":
    main()
