from __future__ import annotations

import math
import random
from typing import Any, Iterable


def _available_vertices(state: Any) -> tuple[int, ...]:
    return state.hypergraph.available_vertex_indices(state)


def _unresolved_edges(state: Any) -> tuple[int, ...]:
    return state.hypergraph.unresolved_edge_indices(state)


def _claimed_ground_points(state: Any) -> frozenset[int]:
    points: set[int] = set()
    claimed = state.claimed_mask
    while claimed:
        bit = claimed & -claimed
        vertex_index = bit.bit_length() - 1
        points.update(state.hypergraph.vertex_label(vertex_index))
        claimed ^= bit
    return frozenset(points)


def _vertex_hit_score(state: Any, vertex_index: int) -> tuple[object, ...]:
    hypergraph = state.hypergraph
    return (
        hypergraph.vertex_hit_count(state.unresolved_edges_mask, vertex_index),
        hypergraph.vertex_degrees[vertex_index],
        tuple(-value for value in hypergraph.vertex_label(vertex_index)),
    )


def choose_max_degree_vertex(state: Any) -> int:
    return max(_available_vertices(state), key=lambda vertex_index: _vertex_hit_score(state, vertex_index))


def make_shortener_sigma():
    """Greedy sigma extracted from the exact small instances.

    Rule:
    1. Among available vertices, maximize unresolved-edge degree.
    2. Break ties by initial degree.
    3. Break remaining ties lexicographically on the vertex label.
    """

    def sigma(state: Any, rng: random.Random | None = None) -> int:
        del rng
        return choose_max_degree_vertex(state)

    return sigma


def prolonger_max_claimed_overlap(state: Any, rng: random.Random | None = None) -> int:
    del rng
    hypergraph = state.hypergraph
    claimed_points = _claimed_ground_points(state)

    def score(edge_index: int) -> tuple[object, ...]:
        overlap_mass = 0
        for vertex_index in hypergraph.edge_vertex_indices[edge_index]:
            overlap_mass += len(set(hypergraph.vertex_label(vertex_index)) & claimed_points)
        return (
            overlap_mass,
            -_post_capture_resolved_count(state, edge_index),
            tuple(-value for value in hypergraph.edge_label(edge_index)),
        )

    return max(_unresolved_edges(state), key=score)


def make_prolonger_lookahead_one(shortener_policy):
    def policy(state: Any, rng: random.Random | None = None) -> int:
        hypergraph = state.hypergraph
        chooser = rng if rng is not None else random.Random(0)

        def score(edge_index: int) -> tuple[object, ...]:
            next_captured = state.captured_mask | hypergraph.edge_vertex_masks[edge_index]
            short_state = hypergraph.state_view(state.claimed_mask, next_captured, True)
            if short_state.unresolved_edges_mask == 0:
                return (
                    -1,
                    -math.inf,
                    tuple(-value for value in hypergraph.edge_label(edge_index)),
                )
            reply = shortener_policy(short_state, chooser)
            next_claimed = state.claimed_mask | (1 << reply)
            after_reply = hypergraph.state_view(next_claimed, next_captured, False)
            return (
                after_reply.unresolved_edges_mask.bit_count(),
                hypergraph.vertex_hit_count(short_state.unresolved_edges_mask, reply),
                tuple(-value for value in hypergraph.edge_label(edge_index)),
            )

        return max(_unresolved_edges(state), key=score)

    return policy


def prolonger_random_degree_weighted(state: Any, rng: random.Random | None = None) -> int:
    chooser = rng if rng is not None else random.Random(0)
    hypergraph = state.hypergraph
    edges = list(_unresolved_edges(state))
    weights = [
        1
        + sum(
            hypergraph.vertex_hit_count(state.unresolved_edges_mask, vertex_index)
            for vertex_index in hypergraph.edge_vertex_indices[edge_index]
        )
        for edge_index in edges
    ]
    return chooser.choices(edges, weights=weights, k=1)[0]


def _post_capture_resolved_count(state: Any, edge_index: int) -> int:
    hypergraph = state.hypergraph
    next_captured = state.captured_mask | hypergraph.edge_vertex_masks[edge_index]
    next_unresolved = hypergraph.unresolved_edges_mask(state.claimed_mask, next_captured)
    return state.unresolved_edges_mask.bit_count() - next_unresolved.bit_count()


def audit_shortener_policy_against_exact(
    policy,
    cases: Iterable[tuple[int, int]],
) -> list[dict[str, object]]:
    from transversal_small_h import ExactTopFacetSolver

    audits: list[dict[str, object]] = []
    for N, h in cases:
        solver = ExactTopFacetSolver(N, h)
        solver.solve()
        total_states = 0
        mismatch_count = 0
        unique_optimal_count = 0
        flexible_state_count = 0
        sigma_max_degree_count = 0
        non_max_degree_optimal_states = 0

        for claimed_mask, captured_mask, shortener_turn in solver.solved_states(shortener_turn=True):
            state = solver.hypergraph.state_view(claimed_mask, captured_mask, shortener_turn)
            if state.unresolved_edges_mask == 0:
                continue
            total_states += 1
            optimal_moves = solver.optimal_shortener_moves(claimed_mask, captured_mask)
            chosen = policy(state, None)
            if chosen not in optimal_moves:
                mismatch_count += 1
            if len(optimal_moves) == 1:
                unique_optimal_count += 1
            else:
                flexible_state_count += 1

            max_hit = max(
                state.hypergraph.vertex_hit_count(state.unresolved_edges_mask, vertex_index)
                for vertex_index in _available_vertices(state)
            )
            chosen_hit = state.hypergraph.vertex_hit_count(state.unresolved_edges_mask, chosen)
            if chosen_hit == max_hit:
                sigma_max_degree_count += 1
            if any(
                state.hypergraph.vertex_hit_count(state.unresolved_edges_mask, vertex_index) < max_hit
                for vertex_index in optimal_moves
            ):
                non_max_degree_optimal_states += 1

        audits.append(
            {
                "N": N,
                "h": h,
                "total_states": total_states,
                "mismatch_count": mismatch_count,
                "unique_optimal_count": unique_optimal_count,
                "flexible_state_count": flexible_state_count,
                "sigma_max_degree_count": sigma_max_degree_count,
                "non_max_degree_optimal_states": non_max_degree_optimal_states,
            }
        )
    return audits


def audit_shortener_policy_on_principal_variations(
    policy,
    cases: Iterable[tuple[int, int]],
) -> list[dict[str, object]]:
    from transversal_small_h import ExactTopFacetSolver

    audits: list[dict[str, object]] = []
    for N, h in cases:
        solver = ExactTopFacetSolver(N, h)
        result = solver.solve()
        claimed_mask = 0
        captured_mask = 0
        mismatches = 0
        replies = 0
        for role, label in result["principal_variation"]:
            if role == "P":
                edge_index = solver.hypergraph.edges.index(label)
                captured_mask |= solver.hypergraph.edge_vertex_masks[edge_index]
                continue
            replies += 1
            state = solver.hypergraph.state_view(claimed_mask, captured_mask, True)
            chosen = policy(state, None)
            if solver.hypergraph.vertex_label(chosen) != label:
                mismatches += 1
            claimed_mask |= 1 << solver.hypergraph.vertex_index[label]
        audits.append(
            {
                "N": N,
                "h": h,
                "reply_count": replies,
                "mismatch_count": mismatches,
            }
        )
    return audits
