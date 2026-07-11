#!/usr/bin/env python3
"""Finite adversarial checks for the proposed unconditional T2 potentials.

This is not a proof. It exhausts small weighted activation states and fuzzes
larger activation and residual-fiber states. A failure writes a replayable
JSON counterexample and exits nonzero.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from fractions import Fraction
import itertools
import json
from pathlib import Path
import random
from typing import Iterable, Sequence


Edge = tuple[int, int]


def edges_on(n: int) -> tuple[Edge, ...]:
    return tuple(itertools.combinations(range(n), 2))


def activation_coeff(captured_count: int) -> Fraction:
    return (Fraction(1, 8), Fraction(1, 4), Fraction(1, 2))[captured_count]


@dataclass(frozen=True)
class ActivationState:
    n: int
    captured: frozenset[int]
    weights: tuple[int, ...]

    @property
    def edges(self) -> tuple[Edge, ...]:
        return edges_on(self.n)

    def live_indices(self) -> tuple[int, ...]:
        return tuple(i for i, w in enumerate(self.weights) if w > 0)

    def edge_potential(self, edge_index: int) -> Fraction:
        u, v = self.edges[edge_index]
        c = int(u in self.captured) + int(v in self.captured)
        return activation_coeff(c) * self.weights[edge_index]

    def star(self, vertex: int) -> Fraction:
        if vertex in self.captured:
            return Fraction(0)
        return sum(
            (self.edge_potential(i) for i in self.live_indices() if vertex in self.edges[i]),
            Fraction(0),
        )


def choose_activation_edge(state: ActivationState) -> int | None:
    live = state.live_indices()
    if not live:
        return None
    uncaptured = [v for v in range(state.n) if v not in state.captured]
    stars = {v: state.star(v) for v in uncaptured}
    h = max(stars.values(), default=Fraction(0))
    k = max(state.edge_potential(i) for i in live)
    if h >= k and h > 0:
        v = min(x for x, value in stars.items() if value == h)
        incident = [i for i in live if v in state.edges[i]]
        return max(incident, key=lambda i: (state.edge_potential(i), state.weights[i], -i))
    return max(live, key=lambda i: (state.edge_potential(i), state.weights[i], -i))


def activation_maker_gain(state: ActivationState, chosen: int) -> tuple[Fraction, ActivationState]:
    before = sum((state.edge_potential(i) for i in state.live_indices()), Fraction(0))
    u, v = state.edges[chosen]
    captured = state.captured | {u, v}
    weights = list(state.weights)
    chosen_weight = weights[chosen]
    weights[chosen] = 0
    after_state = ActivationState(state.n, frozenset(captured), tuple(weights))
    after = sum((after_state.edge_potential(i) for i in after_state.live_indices()), Fraction(0))
    # The played target plus the remaining secured tokens contribute exactly w.
    gain = Fraction(chosen_weight) + after - before
    return gain, after_state


def activation_worst_reply_loss(state: ActivationState) -> tuple[Fraction, dict[str, object]]:
    worst = Fraction(0)
    witness: dict[str, object] = {"kind": "none"}
    for v in range(state.n):
        loss = state.star(v)
        if loss > worst:
            worst = loss
            witness = {"kind": "vertex", "vertex": v}
    for i in state.live_indices():
        loss = state.edge_potential(i)
        if loss > worst:
            worst = loss
            witness = {"kind": "pair", "edge": state.edges[i], "edge_index": i}
    return worst, witness


def activation_case(state: ActivationState) -> dict[str, object] | None:
    chosen = choose_activation_edge(state)
    if chosen is None:
        return None
    gain, after = activation_maker_gain(state, chosen)
    loss, reply = activation_worst_reply_loss(after)
    if gain < loss:
        return {
            "family": "activation",
            "n": state.n,
            "captured": sorted(state.captured),
            "weights": list(state.weights),
            "edges": [list(edge) for edge in state.edges],
            "chosen_index": chosen,
            "chosen_edge": list(state.edges[chosen]),
            "maker_gain": str(gain),
            "reply_loss": str(loss),
            "reply": reply,
        }
    return None


@dataclass(frozen=True)
class Fiber:
    n: int
    activated: bool
    captured_sides: frozenset[int]
    live_edges: frozenset[Edge]

    def coeff(self, edge: Edge) -> Fraction:
        if not self.activated:
            return Fraction(1, 8)
        c = int(edge[0] in self.captured_sides) + int(edge[1] in self.captured_sides)
        return (Fraction(1, 4), Fraction(1, 2), Fraction(1))[c]

    def side_threat(self, vertex: int) -> Fraction:
        if not self.activated or vertex in self.captured_sides:
            return Fraction(0)
        return sum((self.coeff(e) for e in self.live_edges if vertex in e), Fraction(0))

    def q_threat(self) -> Fraction:
        return Fraction(len(self.live_edges), 8) if not self.activated else Fraction(0)


def fiber_total(fiber: Fiber) -> Fraction:
    return sum((fiber.coeff(e) for e in fiber.live_edges), Fraction(0))


def choose_residual_move(fibers: Sequence[Fiber]) -> tuple[int, Edge] | None:
    threats: list[tuple[Fraction, str, int, int | None]] = []
    for fi, fiber in enumerate(fibers):
        if not fiber.live_edges:
            continue
        if fiber.activated:
            for v in range(fiber.n):
                if v not in fiber.captured_sides:
                    threats.append((fiber.side_threat(v), "side", fi, v))
        else:
            threats.append((fiber.q_threat(), "q", fi, None))
    h = max((item[0] for item in threats), default=Fraction(0))
    if h == 0:
        for fi, fiber in enumerate(fibers):
            if fiber.live_edges:
                return fi, min(fiber.live_edges)
        return None
    _, kind, fi, vertex = min(
        (item for item in threats if item[0] == h),
        key=lambda item: (item[1], item[2], -1 if item[3] is None else item[3]),
    )
    fiber = fibers[fi]
    if kind == "q":
        degrees = {v: sum(1 for e in fiber.live_edges if v in e) for v in range(fiber.n)}
        u = max(degrees, key=lambda v: (degrees[v], -v))
        incident = [e for e in fiber.live_edges if u in e]
        return fi, max(incident, key=lambda e: (degrees[e[0]] + degrees[e[1]], -e[0], -e[1]))
    assert vertex is not None
    incident = [e for e in fiber.live_edges if vertex in e]
    type_zero = [
        e for e in incident
        if e[0] not in fiber.captured_sides and e[1] not in fiber.captured_sides
    ]
    if type_zero:
        return fi, max(type_zero, key=lambda e: (fiber.side_threat(e[0]) + fiber.side_threat(e[1]), -e[0], -e[1]))
    return fi, max(incident, key=lambda e: (fiber.coeff(e), -e[0], -e[1]))


def apply_residual_maker(fibers: Sequence[Fiber], fi: int, chosen: Edge) -> tuple[Fraction, tuple[Fiber, ...]]:
    before = sum((fiber_total(f) for f in fibers), Fraction(0))
    updated = list(fibers)
    fiber = fibers[fi]
    live = set(fiber.live_edges)
    live.remove(chosen)
    updated[fi] = Fiber(
        fiber.n,
        True,
        frozenset(fiber.captured_sides | set(chosen)),
        frozenset(live),
    )
    after = sum((fiber_total(f) for f in updated), Fraction(0))
    return Fraction(1) + after - before, tuple(updated)


def residual_replies(fibers: Sequence[Fiber]) -> Iterable[tuple[Fraction, dict[str, object]]]:
    for fi, fiber in enumerate(fibers):
        if not fiber.live_edges:
            continue
        if not fiber.activated:
            yield fiber.q_threat(), {"kind": "q", "fiber": fi}
        for v in range(fiber.n):
            if (not fiber.activated) or v not in fiber.captured_sides:
                loss = sum((fiber.coeff(e) for e in fiber.live_edges if v in e), Fraction(0))
                yield loss, {"kind": "side", "fiber": fi, "vertex": v}
        # Exact-target replies add one real move and remove coefficient <= 1.
        for edge in fiber.live_edges:
            yield max(Fraction(0), fiber.coeff(edge) - 1), {
                "kind": "exact",
                "fiber": fi,
                "edge": list(edge),
            }


def residual_case(fibers: Sequence[Fiber]) -> dict[str, object] | None:
    choice = choose_residual_move(fibers)
    if choice is None:
        return None
    fi, edge = choice
    gain, after = apply_residual_maker(fibers, fi, edge)
    loss, reply = max(residual_replies(after), key=lambda item: item[0], default=(Fraction(0), {"kind": "none"}))
    if gain < loss:
        return {
            "family": "residual",
            "fibers": [
                {
                    "n": f.n,
                    "activated": f.activated,
                    "captured_sides": sorted(f.captured_sides),
                    "live_edges": [list(e) for e in sorted(f.live_edges)],
                }
                for f in fibers
            ],
            "chosen_fiber": fi,
            "chosen_edge": list(edge),
            "maker_gain": str(gain),
            "reply_loss": str(loss),
            "reply": reply,
        }
    return None


def random_activation_state(rng: random.Random, max_n: int, max_weight: int) -> ActivationState:
    n = rng.randint(2, max_n)
    weights = tuple(rng.randint(0, max_weight) for _ in edges_on(n))
    captured = frozenset(v for v in range(n) if rng.random() < 0.5)
    return ActivationState(n, captured, weights)


def random_fiber(rng: random.Random, max_n: int) -> Fiber:
    n = rng.randint(2, max_n)
    activated = rng.random() < 0.7
    captured = frozenset(v for v in range(n) if activated and rng.random() < 0.5)
    live = frozenset(e for e in edges_on(n) if rng.random() < 0.45)
    return Fiber(n, activated, captured, live)


def write_failure(path: Path, failure: dict[str, object]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(failure, indent=2, sort_keys=True) + "\n")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--seed", type=int, default=872)
    parser.add_argument("--random-cases", type=int, default=100_000)
    parser.add_argument("--max-random-n", type=int, default=9)
    parser.add_argument("--max-weight", type=int, default=4)
    parser.add_argument("--exhaustive-n", type=int, default=4)
    parser.add_argument("--exhaustive-residual-n", type=int, default=5)
    parser.add_argument("--artifact", type=Path, required=True)
    parser.add_argument("--repro", type=Path, required=True)
    args = parser.parse_args()

    activation_checked = 0
    residual_checked = 0
    for n in range(2, args.exhaustive_n + 1):
        edge_count = len(edges_on(n))
        for weights in itertools.product(range(args.max_weight + 1), repeat=edge_count):
            if not any(weights):
                continue
            for mask in range(1 << n):
                state = ActivationState(
                    n,
                    frozenset(v for v in range(n) if mask & (1 << v)),
                    tuple(weights),
                )
                activation_checked += 1
                failure = activation_case(state)
                if failure:
                    write_failure(args.repro, failure)
                    return 1

    for n in range(2, args.exhaustive_residual_n + 1):
        all_edges = edges_on(n)
        for edge_mask in range(1, 1 << len(all_edges)):
            live = frozenset(
                edge for i, edge in enumerate(all_edges) if edge_mask & (1 << i)
            )
            unactivated = (Fiber(n, False, frozenset(), live),)
            residual_checked += 1
            failure = residual_case(unactivated)
            if failure:
                write_failure(args.repro, failure)
                return 1
            for captured_mask in range(1 << n):
                captured = frozenset(
                    v for v in range(n) if captured_mask & (1 << v)
                )
                activated = (Fiber(n, True, captured, live),)
                residual_checked += 1
                failure = residual_case(activated)
                if failure:
                    write_failure(args.repro, failure)
                    return 1

    rng = random.Random(args.seed)
    for _ in range(args.random_cases):
        state = random_activation_state(rng, args.max_random_n, args.max_weight)
        activation_checked += 1
        failure = activation_case(state)
        if failure:
            write_failure(args.repro, failure)
            return 1

        fibers = tuple(random_fiber(rng, args.max_random_n) for _ in range(rng.randint(1, 4)))
        residual_checked += 1
        failure = residual_case(fibers)
        if failure:
            write_failure(args.repro, failure)
            return 1

    result = {
        "category": "finite-adversarial-check",
        "fixture": "t2-safe-edge-potentials",
        "status": "passed",
        "seed": args.seed,
        "activation_states_checked": activation_checked,
        "residual_states_checked": residual_checked,
        "exhaustive_activation_n": args.exhaustive_n,
        "exhaustive_residual_n": args.exhaustive_residual_n,
        "activation_weight_range": [0, args.max_weight],
        "max_random_n": args.max_random_n,
        "caveat": "Finite evidence only; this supplements, but does not replace, the symbolic proof and arithmetic-wrapper audit.",
    }
    args.artifact.parent.mkdir(parents=True, exist_ok=True)
    args.artifact.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
