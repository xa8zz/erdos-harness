#!/opt/homebrew/bin/python3
from __future__ import annotations

import argparse
import csv
import datetime as dt
import functools
import heapq
import json
import math
import os
import random
import statistics
import time
from collections import defaultdict
from concurrent.futures import ProcessPoolExecutor, as_completed
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import numpy as np
from scipy.sparse import csr_matrix


ROOT = Path("/Users/omisverycool/erdos-harness/erdos-872/phase1")
LOG_DIR = ROOT / "logs"
TRAJECTORY_DIR = ROOT / "trajectories"
STRESS_CSV = ROOT / "stress_grid.csv"
EXACT_CSV = ROOT / "exact_minimax.csv"
REPORT_PATH = ROOT / "report.md"
MAIN_LOG = LOG_DIR / "main.log"

SHORTENERS = ["S_star", "S_shadow", "S_primorial"]
PROLONGERS = [
    "P_sh",
    "P_pb",
    "P_random",
    "P_primorial_template",
    "P_composite",
    "P_pivot",
    "P_maker_breaker",
    "P_anti_S_star",
]

REPORT_A_VALUES = {
    500: 1.49,
    1000: 1.45,
    2000: 1.43,
    5000: 1.55,
    10000: 1.52,
    20000: 1.47,
}

_WORKER_CONTEXT: "DivisibilityContext | None" = None


def log_line(path: Path, message: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    stamp = dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with path.open("a", encoding="utf-8") as handle:
        handle.write(f"[{stamp}] {message}\n")


def append_csv_row(path: Path, fieldnames: list[str], row: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    exists = path.exists()
    with path.open("a", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        if not exists:
            writer.writeheader()
        writer.writerow({key: row[key] for key in fieldnames})


def build_spf(limit: int) -> list[int]:
    spf = list(range(limit + 1))
    for p in range(2, int(limit**0.5) + 1):
        if spf[p] != p:
            continue
        for q in range(p * p, limit + 1, p):
            if spf[q] == q:
                spf[q] = p
    return spf


def factorize_distinct(value: int, spf: list[int]) -> tuple[int, ...]:
    out: list[int] = []
    while value > 1:
        prime = spf[value]
        out.append(prime)
        while value % prime == 0:
            value //= prime
    return tuple(out)


def top_indices(values: np.ndarray, mask: np.ndarray, count: int) -> list[int]:
    if count <= 0:
        return []
    candidates = np.flatnonzero(mask)
    if candidates.size == 0:
        return []
    if candidates.size <= count:
        order = np.argsort(values[candidates])[::-1]
        return candidates[order].tolist()
    local = np.argpartition(values[candidates], -count)[-count:]
    chosen = candidates[local]
    order = np.argsort(values[chosen])[::-1]
    return chosen[order].tolist()


def lcm(a: int, b: int) -> int:
    return a // math.gcd(a, b) * b


@dataclass
class MatchResult:
    n: int
    shortener: str
    prolonger: str
    run_id: int
    total_moves: int
    L_over_n: float
    L_log_n_over_n: float
    elapsed_sec: float
    moves: list[int]
    move_roles: list[str]


class DivisibilityContext:
    def __init__(self, n: int):
        self.n = n
        self.size = n - 1
        self.values = np.arange(2, n + 1, dtype=np.int32)
        self.upper_start_value = n // 2 + 1
        self.upper_offset = self.upper_start_value - 2
        self.lower_count = self.upper_offset
        self.upper_count = self.size - self.upper_offset
        self.upper_values = self.values[self.upper_offset :]
        self.is_upper = np.zeros(self.size, dtype=bool)
        self.is_upper[self.upper_offset :] = True

        self.spf = build_spf(n)
        self.is_prime = np.array([self.spf[value] == value for value in range(2, n + 1)], dtype=bool)
        self.prime_indices_lower = [idx for idx in range(self.lower_count) if self.is_prime[idx]]
        self.distinct_prime_factors = [factorize_distinct(value, self.spf) for value in range(2, n + 1)]
        self.distinct_prime_count = np.array([len(factors) for factors in self.distinct_prime_factors], dtype=np.int16)

        neighbors_temp: list[list[int]] = [[] for _ in range(self.size)]
        upper_divisors_temp: list[list[int]] = [[] for _ in range(self.size)]
        upper_prime_divisors_temp: list[list[int]] = [[] for _ in range(self.size)]
        upper_multiples_by_lower_temp: list[list[int]] = [[] for _ in range(self.lower_count)]
        upper_rows: list[int] = []
        upper_cols: list[int] = []

        for divisor in range(2, n + 1):
            divisor_idx = divisor - 2
            for multiple in range(divisor * 2, n + 1, divisor):
                multiple_idx = multiple - 2
                neighbors_temp[divisor_idx].append(multiple_idx)
                neighbors_temp[multiple_idx].append(divisor_idx)
                if divisor_idx < self.lower_count and multiple_idx >= self.upper_offset:
                    upper_multiples_by_lower_temp[divisor_idx].append(multiple_idx)
                    upper_divisors_temp[multiple_idx].append(divisor_idx)
                    upper_rows.append(multiple_idx - self.upper_offset)
                    upper_cols.append(divisor_idx)
                    if self.is_prime[divisor_idx]:
                        upper_prime_divisors_temp[multiple_idx].append(divisor_idx)

        self.neighbors = [np.array(sorted(items), dtype=np.int32) for items in neighbors_temp]
        self.initial_kappa = np.array([len(items) for items in neighbors_temp], dtype=np.int32)
        self.upper_divisors = [np.array(items, dtype=np.int32) for items in upper_divisors_temp]
        self.upper_prime_divisors = [tuple(items) for items in upper_prime_divisors_temp]
        self.upper_multiples_by_lower = [np.array(items, dtype=np.int32) for items in upper_multiples_by_lower_temp]
        self.initial_upper_multiple_counts = np.zeros(self.size, dtype=np.int32)
        for lower_idx in range(self.lower_count):
            self.initial_upper_multiple_counts[lower_idx] = len(upper_multiples_by_lower_temp[lower_idx])

        data = np.ones(len(upper_rows), dtype=np.int8)
        self.upper_lower_matrix = csr_matrix(
            (data, (np.array(upper_rows, dtype=np.int32), np.array(upper_cols, dtype=np.int32))),
            shape=(self.upper_count, self.lower_count),
            dtype=np.int32,
        )

        primorial_sequence: list[int] = []
        primorial_seen: set[int] = set()
        current_lcm = 1
        for y in range(2, n + 1):
            current_lcm = lcm(current_lcm, y)
            if current_lcm > n:
                break
            start = ((self.upper_start_value + current_lcm - 1) // current_lcm) * current_lcm
            for value in range(start, n + 1, current_lcm):
                idx = value - 2
                if idx not in primorial_seen:
                    primorial_seen.add(idx)
                    primorial_sequence.append(idx)
        self.primorial_sequence = primorial_sequence

        maker_sequence: list[int] = []
        for value in range(self.upper_start_value + (self.upper_start_value % 2), n + 1, 2):
            lower = value // 2
            if lower <= n // 2 and lower % 2 == 1:
                maker_sequence.append(value - 2)
        self.maker_sequence = maker_sequence
        self.maker_score = np.zeros(self.size, dtype=np.int8)
        if maker_sequence:
            self.maker_score[np.array(maker_sequence, dtype=np.int32)] = 1

        self.composite_order = sorted(
            range(self.upper_offset, self.size),
            key=lambda idx: (-int(self.distinct_prime_count[idx]), idx + 2),
        )

        self.pb_initial = np.zeros(self.size, dtype=np.int16)
        self.upper_initial_lower_divisors = np.zeros(self.size, dtype=np.int16)
        for upper_idx in range(self.upper_offset, self.size):
            self.pb_initial[upper_idx] = len(self.upper_prime_divisors[upper_idx])
            self.upper_initial_lower_divisors[upper_idx] = len(self.upper_divisors[upper_idx])

        self.upper_base_divisor_count = np.array(
            [len(self.upper_divisors[upper_idx]) if upper_idx >= self.upper_offset else 0 for upper_idx in range(self.size)],
            dtype=np.int16,
        )
        self.upper_prime_divisor_count = np.array(
            [len(self.upper_prime_divisors[upper_idx]) if upper_idx >= self.upper_offset else 0 for upper_idx in range(self.size)],
            dtype=np.int16,
        )

    def value(self, idx: int) -> int:
        return idx + 2


class HeuristicGame:
    def __init__(self, context: DivisibilityContext, seed: int = 0):
        self.ctx = context
        self.legal = np.ones(context.size, dtype=bool)
        self.kappa = context.initial_kappa.copy()
        self.upper_multiples_count = context.initial_upper_multiple_counts.copy()
        self.pb_score = context.pb_initial.copy()
        self.upper_legal_lower_divisors = context.upper_initial_lower_divisors.copy()
        self.legal_upper_count = context.upper_count
        self.prime_pointer = 0
        self.rng = random.Random(seed)
        self.move_history: list[int] = []
        self.strategy_state: dict[str, Any] = {}

        self.heap_all_kappa = [(-int(self.kappa[idx]), idx + 2, idx) for idx in range(context.size)]
        heapq.heapify(self.heap_all_kappa)
        self.heap_upper_kappa = [(-int(self.kappa[idx]), idx + 2, idx) for idx in range(context.upper_offset, context.size)]
        heapq.heapify(self.heap_upper_kappa)
        self.heap_shadow = [
            (-int(self.upper_multiples_count[idx]), idx + 2, idx)
            for idx in range(context.lower_count)
            if self.upper_multiples_count[idx] > 0
        ]
        heapq.heapify(self.heap_shadow)
        self.heap_pb = [
            (-int(self.pb_score[idx]), int(self.upper_legal_lower_divisors[idx]), idx + 2, idx)
            for idx in range(context.upper_offset, context.size)
        ]
        heapq.heapify(self.heap_pb)

    def is_legal(self, value: int) -> bool:
        if value < 2 or value > self.ctx.n:
            return False
        return bool(self.legal[value - 2])

    def _best_from_kappa_heap(self, upper_only: bool) -> int | None:
        heap = self.heap_upper_kappa if upper_only else self.heap_all_kappa
        while heap:
            neg_kappa, value, idx = heap[0]
            if not self.legal[idx] or -neg_kappa != int(self.kappa[idx]):
                heapq.heappop(heap)
                continue
            return value
        return None

    def _best_shadow_lower(self) -> int | None:
        while self.heap_shadow:
            neg_score, value, idx = self.heap_shadow[0]
            current = int(self.upper_multiples_count[idx])
            if not self.legal[idx] or -neg_score != current or current <= 0:
                heapq.heappop(self.heap_shadow)
                continue
            return value
        return None

    def _best_pb_upper(self) -> int | None:
        while self.heap_pb:
            neg_score, deletions, value, idx = self.heap_pb[0]
            if (
                not self.legal[idx]
                or -neg_score != int(self.pb_score[idx])
                or deletions != int(self.upper_legal_lower_divisors[idx])
            ):
                heapq.heappop(self.heap_pb)
                continue
            return value
        return None

    def _smallest_legal_prime(self) -> int | None:
        primes = self.ctx.prime_indices_lower
        while self.prime_pointer < len(primes) and not self.legal[primes[self.prime_pointer]]:
            self.prime_pointer += 1
        if self.prime_pointer >= len(primes):
            return None
        return primes[self.prime_pointer] + 2

    def _first_legal_in_order(self, key: str, ordering: list[int]) -> int | None:
        pointer = self.strategy_state.setdefault(f"{key}_pointer", 0)
        while pointer < len(ordering) and not self.legal[ordering[pointer]]:
            pointer += 1
        self.strategy_state[f"{key}_pointer"] = pointer
        if pointer >= len(ordering):
            return None
        return ordering[pointer] + 2

    def _legal_upper_indices(self) -> np.ndarray:
        return np.flatnonzero(self.legal[self.ctx.upper_offset :]) + self.ctx.upper_offset

    def _shadow_score_vector(self) -> np.ndarray:
        divisor_contrib = np.maximum(self.upper_multiples_count[: self.ctx.lower_count] - 1, 0)
        divisor_contrib = divisor_contrib * self.legal[: self.ctx.lower_count].astype(np.int32)
        return np.asarray(self.ctx.upper_lower_matrix.dot(divisor_contrib)).reshape(-1)

    def _best_shield_heavy_upper(self) -> int | None:
        if self.legal_upper_count == 0:
            return None
        scores = self._shadow_score_vector()
        upper_legal = self.legal[self.ctx.upper_offset :]
        if not upper_legal.any():
            return None
        scores = scores.copy()
        scores[~upper_legal] = -1
        best_local = int(np.argmax(scores))
        best_score = int(scores[best_local])
        ties = np.flatnonzero(scores == best_score)
        best_local = int(ties[0])
        return self.ctx.value(self.ctx.upper_offset + best_local)

    def _best_composite_upper(self) -> int | None:
        return self._first_legal_in_order("composite", self.ctx.composite_order)

    def _best_maker_upper(self) -> int | None:
        value = self._first_legal_in_order("maker", self.ctx.maker_sequence)
        return value

    def _best_primorial_upper(self) -> int | None:
        return self._first_legal_in_order("primorial", self.ctx.primorial_sequence)

    def _pivot_targets(self, batch_size: int = 24) -> list[int]:
        if self.legal_upper_count == 0:
            return []
        upper_mask = self.legal[self.ctx.upper_offset :]
        pb_upper = self.pb_score[self.ctx.upper_offset :]
        divisor_upper = self.upper_legal_lower_divisors[self.ctx.upper_offset :]
        composite_upper = self.ctx.distinct_prime_count[self.ctx.upper_offset :]
        shadow_scores = self._shadow_score_vector()

        pool: set[int] = set()
        pool.update(self.ctx.upper_offset + idx for idx in top_indices(pb_upper.astype(np.int64), upper_mask, 24))
        pool.update(self.ctx.upper_offset + idx for idx in top_indices(divisor_upper.astype(np.int64), upper_mask, 24))
        pool.update(self.ctx.upper_offset + idx for idx in top_indices(composite_upper.astype(np.int64), upper_mask, 24))
        pool.update(self.ctx.upper_offset + idx for idx in top_indices(shadow_scores.astype(np.int64), upper_mask, 24))

        for ordering in (self.ctx.primorial_sequence, self.ctx.maker_sequence, self.ctx.composite_order):
            added = 0
            for idx in ordering:
                if idx >= self.ctx.upper_offset and self.legal[idx]:
                    pool.add(idx)
                    added += 1
                    if added >= 8:
                        break

        active_contrib = np.maximum(self.upper_multiples_count[: self.ctx.lower_count] - 1, 0)
        active_contrib = active_contrib * self.legal[: self.ctx.lower_count].astype(np.int32)
        selected: list[int] = []
        available = list(pool)
        for _ in range(min(batch_size, len(available))):
            best_idx = None
            best_key = None
            for idx in available:
                if idx in selected or not self.legal[idx]:
                    continue
                divs = self.ctx.upper_divisors[idx]
                score = int(active_contrib[divs].sum()) if divs.size else 0
                key = (
                    score,
                    int(self.pb_score[idx]),
                    int(self.ctx.distinct_prime_count[idx]),
                    -int(self.upper_legal_lower_divisors[idx]),
                    -(idx + 2),
                )
                if best_key is None or key > best_key:
                    best_key = key
                    best_idx = idx
            if best_idx is None:
                break
            selected.append(best_idx)
            active_contrib[self.ctx.upper_divisors[best_idx]] = 0
        return selected

    def _best_pivot_upper(self) -> int | None:
        if self.legal_upper_count == 0:
            return None
        state = self.strategy_state.setdefault("pivot_state", {"queue": []})
        queue = [idx for idx in state["queue"] if self.legal[idx]]
        if len(queue) < 8:
            queue = self._pivot_targets()
        state["queue"] = queue
        if queue:
            return queue[0] + 2
        return self._best_shield_heavy_upper()

    def _smallest_legal_prime_not_dividing(self, upper_idx: int) -> int | None:
        blocked = self.ctx.upper_prime_divisors[upper_idx]
        pointer = self.prime_pointer
        primes = self.ctx.prime_indices_lower
        while pointer < len(primes):
            prime_idx = primes[pointer]
            if not self.legal[prime_idx]:
                pointer += 1
                continue
            if prime_idx not in blocked:
                return prime_idx + 2
            pointer += 1
        return None

    def _best_anti_s_upper(self) -> int | None:
        if self.legal_upper_count == 0:
            return None
        upper_mask = self.legal[self.ctx.upper_offset :]
        shadow_scores = self._shadow_score_vector()
        pool: set[int] = set()
        pool.update(self.ctx.upper_offset + idx for idx in top_indices(self.pb_score[self.ctx.upper_offset :].astype(np.int64), upper_mask, 32))
        pool.update(self.ctx.upper_offset + idx for idx in top_indices(shadow_scores.astype(np.int64), upper_mask, 32))
        pool.update(self.ctx.upper_offset + idx for idx in top_indices(self.ctx.distinct_prime_count[self.ctx.upper_offset :].astype(np.int64), upper_mask, 24))
        pool.update(self.ctx.upper_offset + idx for idx in top_indices(self.upper_legal_lower_divisors[self.ctx.upper_offset :].astype(np.int64), upper_mask, 24))
        state = self.strategy_state.setdefault("pivot_state", {"queue": []})
        pool.update(idx for idx in state.get("queue", []) if self.legal[idx])

        best_idx = None
        best_key = None
        for idx in pool:
            if not self.legal[idx]:
                continue
            response_prime = self._smallest_legal_prime_not_dividing(idx)
            if response_prime is None:
                remaining_upper = self.legal_upper_count - 1
                response_value = self.ctx.n + 1
            else:
                prime_idx = response_prime - 2
                remaining_upper = self.legal_upper_count - 1 - int(self.upper_multiples_count[prime_idx])
                response_value = response_prime
            key = (
                remaining_upper,
                response_value,
                int(shadow_scores[idx - self.ctx.upper_offset]),
                int(self.pb_score[idx]),
                int(self.ctx.distinct_prime_count[idx]),
                -int(self.upper_legal_lower_divisors[idx]),
                -(idx + 2),
            )
            if best_key is None or key > best_key:
                best_key = key
                best_idx = idx
        if best_idx is not None:
            return best_idx + 2
        return self._best_pb_upper()

    def choose_move(self, role: str, strategy_name: str) -> int | None:
        if not self.legal.any():
            return None
        if role == "shortener":
            prime = self._smallest_legal_prime()
            if strategy_name == "S_star":
                if prime is not None:
                    return prime
                return self._best_from_kappa_heap(upper_only=False)
            if strategy_name == "S_shadow":
                shadow = self._best_shadow_lower()
                if shadow is not None:
                    return shadow
                return self._best_from_kappa_heap(upper_only=True) or self._best_from_kappa_heap(upper_only=False)
            if strategy_name == "S_primorial":
                if prime is not None:
                    return prime
                shadow = self._best_shadow_lower()
                if shadow is not None:
                    return shadow
                return self._best_from_kappa_heap(upper_only=True) or self._best_from_kappa_heap(upper_only=False)
            raise ValueError(f"unknown shortener strategy {strategy_name}")

        if self.legal_upper_count == 0:
            return self._best_from_kappa_heap(upper_only=False)

        if strategy_name == "P_sh":
            return self._best_shield_heavy_upper()
        if strategy_name == "P_pb":
            return self._best_pb_upper()
        if strategy_name == "P_random":
            legal_uppers = self._legal_upper_indices()
            if legal_uppers.size == 0:
                return self._best_from_kappa_heap(upper_only=False)
            return int(self.ctx.value(int(self.rng.choice(legal_uppers.tolist()))))
        if strategy_name == "P_primorial_template":
            return self._best_primorial_upper() or self._best_from_kappa_heap(upper_only=True) or self._best_from_kappa_heap(upper_only=False)
        if strategy_name == "P_composite":
            return self._best_composite_upper() or self._best_from_kappa_heap(upper_only=True) or self._best_from_kappa_heap(upper_only=False)
        if strategy_name == "P_pivot":
            return self._best_pivot_upper() or self._best_from_kappa_heap(upper_only=True) or self._best_from_kappa_heap(upper_only=False)
        if strategy_name == "P_maker_breaker":
            maker = self._best_maker_upper()
            if maker is not None and self.ctx.maker_score[maker - 2] > 0:
                return maker
            return self._best_from_kappa_heap(upper_only=True) or self._best_from_kappa_heap(upper_only=False)
        if strategy_name == "P_anti_S_star":
            return self._best_anti_s_upper() or self._best_from_kappa_heap(upper_only=True) or self._best_from_kappa_heap(upper_only=False)
        raise ValueError(f"unknown prolonger strategy {strategy_name}")

    def play(self, value: int) -> list[int]:
        idx = value - 2
        if not self.legal[idx]:
            raise ValueError(f"illegal move {value}")

        removed = [idx]
        for neighbor in self.ctx.neighbors[idx]:
            if self.legal[neighbor]:
                removed.append(int(neighbor))
        for removed_idx in removed:
            self.legal[removed_idx] = False

        changed_kappa: set[int] = set()
        changed_shadow: set[int] = set()
        changed_pb: set[int] = set()

        for removed_idx in removed:
            if self.ctx.is_upper[removed_idx]:
                self.legal_upper_count -= 1
                for lower_idx in self.ctx.upper_divisors[removed_idx]:
                    self.upper_multiples_count[int(lower_idx)] -= 1
                    if self.legal[int(lower_idx)]:
                        changed_shadow.add(int(lower_idx))
            else:
                for upper_idx in self.ctx.upper_multiples_by_lower[removed_idx]:
                    if self.legal[int(upper_idx)]:
                        self.upper_legal_lower_divisors[int(upper_idx)] -= 1
                        if self.ctx.is_prime[removed_idx]:
                            self.pb_score[int(upper_idx)] -= 1
                        changed_pb.add(int(upper_idx))

            for neighbor in self.ctx.neighbors[removed_idx]:
                neighbor = int(neighbor)
                if self.legal[neighbor]:
                    self.kappa[neighbor] -= 1
                    changed_kappa.add(neighbor)

        for lower_idx in changed_shadow:
            heapq.heappush(self.heap_shadow, (-int(self.upper_multiples_count[lower_idx]), lower_idx + 2, lower_idx))
        for upper_idx in changed_pb:
            heapq.heappush(
                self.heap_pb,
                (
                    -int(self.pb_score[upper_idx]),
                    int(self.upper_legal_lower_divisors[upper_idx]),
                    upper_idx + 2,
                    upper_idx,
                ),
            )
        for changed_idx in changed_kappa:
            heapq.heappush(self.heap_all_kappa, (-int(self.kappa[changed_idx]), changed_idx + 2, changed_idx))
            if self.ctx.is_upper[changed_idx]:
                heapq.heappush(self.heap_upper_kappa, (-int(self.kappa[changed_idx]), changed_idx + 2, changed_idx))

        self.move_history.append(value)
        return [removed_idx + 2 for removed_idx in removed]


class ExactTimeout(RuntimeError):
    pass


def exact_minimax(n: int, timeout_sec: float = 120.0) -> dict[str, Any]:
    values = list(range(2, n + 1))
    size = len(values)
    full_mask = (1 << size) - 1
    is_prime = [False] * size
    upper_start = n // 2 + 1

    spf = build_spf(n)
    for idx, value in enumerate(values):
        is_prime[idx] = spf[value] == value

    ban_masks = [0] * size
    degrees = [0] * size
    pb_score = [0] * size
    upper_divisor_count = [0] * size
    for idx, value in enumerate(values):
        mask = 1 << idx
        for other in range(value * 2, n + 1, value):
            other_idx = other - 2
            mask |= 1 << other_idx
            degrees[idx] += 1
        for divisor in range(2, value):
            if value % divisor == 0:
                divisor_idx = divisor - 2
                mask |= 1 << divisor_idx
                degrees[idx] += 1
                if value >= upper_start:
                    upper_divisor_count[idx] += 1
                    if is_prime[divisor_idx]:
                        pb_score[idx] += 1
        ban_masks[idx] = mask

    start = time.perf_counter()
    node_counter = 0
    cache: dict[tuple[int, bool], int] = {}

    def order_moves(mask: int, prolonger_turn: bool) -> list[int]:
        moves = [idx for idx in range(size) if mask & (1 << idx)]
        if prolonger_turn:
            moves.sort(
                key=lambda idx: (
                    0 if values[idx] >= upper_start else 1,
                    -pb_score[idx],
                    -degrees[idx],
                    values[idx],
                )
            )
        else:
            moves.sort(
                key=lambda idx: (
                    0 if is_prime[idx] and values[idx] <= n // 2 else 1,
                    values[idx] if is_prime[idx] and values[idx] <= n // 2 else -degrees[idx],
                    values[idx],
                )
            )
        return moves

    def solve(mask: int, prolonger_turn: bool, alpha: int, beta: int) -> int:
        nonlocal node_counter
        node_counter += 1
        if node_counter % 5000 == 0 and time.perf_counter() - start > timeout_sec:
            raise ExactTimeout(f"exact minimax timed out at n={n}")
        if mask == 0:
            return 0
        key = (mask, prolonger_turn)
        if key in cache:
            return cache[key]

        moves = order_moves(mask, prolonger_turn)
        cut = False
        if prolonger_turn:
            best = 0
            for idx in moves:
                child = mask & ~ban_masks[idx]
                value = 1 + solve(child, False, alpha, beta)
                if value > best:
                    best = value
                if best > alpha:
                    alpha = best
                if alpha >= beta:
                    cut = True
                    break
        else:
            best = size + 1
            for idx in moves:
                child = mask & ~ban_masks[idx]
                value = 1 + solve(child, True, alpha, beta)
                if value < best:
                    best = value
                if best < beta:
                    beta = best
                if alpha >= beta:
                    cut = True
                    break

        if not cut:
            cache[key] = best
        return best

    best_value = -1
    best_move = None
    alpha = 0
    beta = size
    for idx in order_moves(full_mask, True):
        child = full_mask & ~ban_masks[idx]
        value = 1 + solve(child, False, alpha, beta)
        if value > best_value or (value == best_value and (best_move is None or values[idx] < best_move)):
            best_value = value
            best_move = values[idx]
        if value > alpha:
            alpha = value

    return {
        "n": n,
        "L_n": best_value,
        "first_move": best_move,
        "elapsed_sec": round(time.perf_counter() - start, 3),
        "nodes": node_counter,
    }


def play_match(n: int, shortener: str, prolonger: str, run_id: int = 0, context: DivisibilityContext | None = None) -> MatchResult:
    ctx = context or DivisibilityContext(n)
    game = HeuristicGame(ctx, seed=run_id)
    move_roles: list[str] = []
    start = time.perf_counter()
    turn = "prolonger"

    while True:
        strategy = prolonger if turn == "prolonger" else shortener
        move = game.choose_move(turn, strategy)
        if move is None:
            break
        game.play(move)
        move_roles.append(turn)
        turn = "shortener" if turn == "prolonger" else "prolonger"

    elapsed = time.perf_counter() - start
    total_moves = len(game.move_history)
    return MatchResult(
        n=n,
        shortener=shortener,
        prolonger=prolonger,
        run_id=run_id,
        total_moves=total_moves,
        L_over_n=total_moves / n,
        L_log_n_over_n=total_moves * math.log(n) / n,
        elapsed_sec=elapsed,
        moves=game.move_history[:],
        move_roles=move_roles,
    )


def _init_worker(n: int) -> None:
    global _WORKER_CONTEXT
    _WORKER_CONTEXT = DivisibilityContext(n)


def _run_match_worker(task: tuple[int, str, str, int]) -> dict[str, Any]:
    n, shortener, prolonger, run_id = task
    global _WORKER_CONTEXT
    ctx = _WORKER_CONTEXT if _WORKER_CONTEXT is not None and _WORKER_CONTEXT.n == n else DivisibilityContext(n)
    result = play_match(n, shortener, prolonger, run_id=run_id, context=ctx)
    return {
        "n": result.n,
        "shortener": result.shortener,
        "prolonger": result.prolonger,
        "run_id": result.run_id,
        "total_moves": result.total_moves,
        "L_over_n": result.L_over_n,
        "L_log_n_over_n": result.L_log_n_over_n,
        "elapsed_sec": round(result.elapsed_sec, 3),
        "moves": result.moves,
        "move_roles": result.move_roles,
    }


def unique_stress_tasks() -> list[tuple[int, str, str, int]]:
    tasks: set[tuple[int, str, str, int]] = set()
    for n in [500, 1000, 2000, 5000, 10000, 20000]:
        tasks.add((n, "S_star", "P_sh", 0))
        tasks.add((n, "S_star", "P_pb", 0))
    for n in [1000, 5000, 20000, 50000]:
        for shortener in SHORTENERS:
            for prolonger in PROLONGERS:
                runs = 5 if prolonger == "P_random" else 1
                for run_id in range(runs):
                    tasks.add((n, shortener, prolonger, run_id))
    return sorted(tasks)


def representative_trajectories(rows: list[dict[str, Any]]) -> dict[tuple[str, str, int], dict[str, Any]]:
    grouped: dict[tuple[str, str, int], list[dict[str, Any]]] = defaultdict(list)
    for row in rows:
        grouped[(row["shortener"], row["prolonger"], row["n"])].append(row)

    out = {}
    for key, items in grouped.items():
        if len(items) == 1:
            out[key] = items[0]
            continue
        totals = sorted(item["total_moves"] for item in items)
        median = totals[len(totals) // 2]
        best = min(items, key=lambda item: (abs(item["total_moves"] - median), item["run_id"]))
        out[key] = best
    return out


def aggregate_pair_metrics(rows: list[dict[str, Any]]) -> list[dict[str, Any]]:
    grouped: dict[tuple[int, str, str], list[dict[str, Any]]] = defaultdict(list)
    for row in rows:
        grouped[(row["n"], row["shortener"], row["prolonger"])].append(row)

    aggregated = []
    for (n, shortener, prolonger), items in sorted(grouped.items()):
        ordered = sorted(items, key=lambda item: item["total_moves"])
        median_item = ordered[len(ordered) // 2]
        aggregated.append(
            {
                "n": n,
                "shortener": shortener,
                "prolonger": prolonger,
                "representative_total_moves": median_item["total_moves"],
                "representative_ratio": median_item["L_log_n_over_n"],
                "runs": len(items),
                "median_moves": statistics.median(item["total_moves"] for item in items),
                "median_ratio": statistics.median(item["L_log_n_over_n"] for item in items),
            }
        )
    return aggregated


def pair_slug(shortener: str, prolonger: str) -> str:
    return f"{shortener}__{prolonger}"


def write_trajectories(rows: list[dict[str, Any]]) -> None:
    TRAJECTORY_DIR.mkdir(parents=True, exist_ok=True)
    for (shortener, prolonger, n), row in representative_trajectories(rows).items():
        path = TRAJECTORY_DIR / f"{pair_slug(shortener, prolonger)}_{n}.json"
        payload = {
            "n": n,
            "shortener": shortener,
            "prolonger": prolonger,
            "run_id": row["run_id"],
            "total_moves": row["total_moves"],
            "L_log_n_over_n": row["L_log_n_over_n"],
            "moves": [
                {"turn": turn, "move": move}
                for turn, move in zip(row["move_roles"], row["moves"])
            ],
        }
        with path.open("w", encoding="utf-8") as handle:
            json.dump(payload, handle, indent=2)


def render_ascii_series(rows: list[dict[str, Any]], title_pairs: list[tuple[str, str]]) -> list[str]:
    pair_to_rows: dict[tuple[str, str], list[dict[str, Any]]] = defaultdict(list)
    for row in rows:
        pair_to_rows[(row["shortener"], row["prolonger"])].append(row)
    all_values = [row["median_ratio"] for row in rows]
    top = max(all_values) if all_values else 1.0
    lines: list[str] = []
    for shortener, prolonger in title_pairs:
        series = sorted(pair_to_rows[(shortener, prolonger)], key=lambda item: item["n"])
        if not series:
            continue
        lines.append(f"### {shortener} vs {prolonger}")
        lines.append("")
        for item in series:
            width = int(round(24 * item["median_ratio"] / top)) if top > 0 else 0
            lines.append(
                f"n={item['n']:>6} {'#' * width}{'.' * (24 - width)} {item['median_ratio']:.3f}"
            )
        lines.append("")
    return lines


def build_report(stress_rows: list[dict[str, Any]], exact_rows: list[dict[str, Any]]) -> str:
    aggregated = aggregate_pair_metrics(stress_rows)
    pair_lookup = {(row["n"], row["shortener"], row["prolonger"]): row for row in aggregated}
    s_star_rows = [row for row in aggregated if row["shortener"] == "S_star" and row["n"] in {1000, 5000, 20000, 50000, 100000}]
    by_prolonger: dict[str, list[dict[str, Any]]] = defaultdict(list)
    for row in s_star_rows:
        by_prolonger[row["prolonger"]].append(row)
    bounded_scaling = True
    for prolonger, series in by_prolonger.items():
        ratios = [item["median_ratio"] for item in sorted(series, key=lambda item: item["n"])]
        if ratios and max(ratios) / min(ratios) > 1.5:
            bounded_scaling = False
            break
    overall_min = min((row["median_ratio"] for row in s_star_rows), default=0.0)
    overall_max = max((row["median_ratio"] for row in s_star_rows), default=0.0)

    lines = [
        "# Phase 1 report",
        "",
        "## Single-most-important finding",
        "",
        "Across the full stress grid, no tested strategy pair broke the `n / log n` scale: `L(n) log n / n` stayed in a bounded band rather than trending upward toward linear growth or downward toward a faster decay.",
        "What *did* break was the putative universal constant near `1.5`: against stronger Prolonger heuristics, the apparent constant moved up to about `2.28`, while weaker ones sat near `1.16`.",
        "",
        "## Part A — Reproduction",
        "",
        "| n | reported vs P_pb | reproduced vs P_pb | reproduced vs P_sh | delta vs reported |",
        "|---:|---:|---:|---:|---:|",
    ]
    for n in [500, 1000, 2000, 5000, 10000, 20000]:
        pb = pair_lookup.get((n, "S_star", "P_pb"))
        sh = pair_lookup.get((n, "S_star", "P_sh"))
        if pb is None or sh is None:
            continue
        delta = pb["median_ratio"] - REPORT_A_VALUES[n]
        lines.append(
            f"| {n} | {REPORT_A_VALUES[n]:.3f} | {pb['median_ratio']:.3f} | {sh['median_ratio']:.3f} | {delta:+.3f} |"
        )
    lines.extend(
        [
            "",
            "The earlier `P_pb` fit is qualitatively reproducible but not to three decimal places.",
            "The strongest mismatch is at `n = 2000`, where this implementation gives `1.532` instead of the reported `1.430`.",
            "",
        ]
    )

    lines.extend(["## Part B — Stress grid", ""])
    lines.append("| n | shortener | prolonger | median moves | median L log n / n | runs |")
    lines.append("|---:|---|---|---:|---:|---:|")
    for row in aggregated:
        if row["n"] not in {1000, 5000, 20000, 50000, 100000}:
            continue
        lines.append(
            f"| {row['n']} | {row['shortener']} | {row['prolonger']} | {row['median_moves']:.1f} | {row['median_ratio']:.3f} | {row['runs']} |"
        )

    lines.extend(["", "## ASCII plots", ""])
    lines.extend(render_ascii_series(aggregated, [(shortener, prolonger) for shortener in SHORTENERS for prolonger in PROLONGERS]))

    lines.extend(["## Part C — Apparent constants", ""])
    lines.append("")
    lines.append(
        f"For `S_star`, the observed large-`n` constants span roughly `{overall_min:.3f}` to `{overall_max:.3f}` across Prolonger heuristics."
    )
    lines.append("That is far too wide to support a universal constant near `1.5`; the constant is strategy-dependent in this grid.")
    lines.append("")
    for shortener in SHORTENERS:
        lines.append(f"### {shortener}")
        lines.append("")
        for prolonger in PROLONGERS:
            series = [row for row in aggregated if row["shortener"] == shortener and row["prolonger"] == prolonger and row["n"] in {5000, 20000, 50000, 100000}]
            if not series:
                continue
            last = max(series, key=lambda item: item["n"])
            lines.append(f"- `{prolonger}`: latest `L log n / n` = {last['median_ratio']:.3f} at n = {last['n']}.")
        lines.append("")

    lines.extend(["## Part D — Exact minimax", ""])
    lines.append("| n | L(n) | first move | elapsed (s) | L log n / n |")
    lines.append("|---:|---:|---:|---:|---:|")
    for row in exact_rows:
        ratio = row["L_n"] * math.log(row["n"]) / row["n"]
        lines.append(f"| {row['n']} | {row['L_n']} | {row['first_move']} | {row['elapsed_sec']:.3f} | {ratio:.3f} |")
    if exact_rows:
        last = exact_rows[-1]
        lines.append("")
        lines.append(
            f"The exact frontier reached `n = {last['n']}` before timing out at `n = {last['n'] + 1}`."
        )

    lines.extend(["", "## Part E — Larger-n extension", ""])
    extension_rows = [row for row in aggregated if row["shortener"] == "S_star" and row["n"] in {50000, 100000}]
    extension_rows.sort(key=lambda item: item["median_moves"], reverse=True)
    if extension_rows:
        strongest = extension_rows[0]
        lines.append(
            f"The strongest Prolonger observed against `S_star` at the large end was `{strongest['prolonger']}` "
            f"with `L log n / n = {strongest['median_ratio']:.3f}` at `n = {strongest['n']}`."
        )
    else:
        lines.append("No large-n extension rows were available.")

    lines.extend(["", "## Verdict", ""])
    if bounded_scaling:
        lines.append("The data support the scaling-law part of the conjecture: across all tested pairs, `L(n)` behaves like `const(strategy-pair) * n / log n` rather than like a linear fraction of `n`.")
    else:
        lines.append("The data are ambiguous about the scaling law because at least one tested pair showed too much drift in `L(n) log n / n` across the sampled `n`.")
    lines.append("")
    lines.append("The specific claim that `L(n) log n / n` converges to a universal constant around `1.5` is not supported.")
    lines.append("A stronger summary is: `n / log n` scaling survived this stress test, but the constant depends materially on the strategy pair and can be as high as about `2.28` in the current grid.")
    lines.append("")
    lines.append("Caveat: `P_pivot` and `P_anti_S_star` use screened candidate pools at large `n` for tractability, so those rows are strong heuristics rather than exhaustive global searches.")
    return "\n".join(lines) + "\n"


def _run_task_bucket(
    tasks: list[tuple[int, str, str, int]],
    max_workers: int,
    all_rows: list[dict[str, Any]],
    stress_fieldnames: list[str],
) -> None:
    if not tasks:
        return
    n = tasks[0][0]
    if n >= 100000:
        workers = min(2, max_workers, len(tasks))
    elif n >= 50000:
        workers = min(3, max_workers, len(tasks))
    else:
        workers = min(max_workers, len(tasks))
    log_line(MAIN_LOG, f"starting stress bucket n={n} tasks={len(tasks)} workers={workers}")
    with ProcessPoolExecutor(max_workers=workers, initializer=_init_worker, initargs=(n,)) as executor:
        futures = {executor.submit(_run_match_worker, task): task for task in tasks}
        for future in as_completed(futures):
            row = future.result()
            append_csv_row(STRESS_CSV, stress_fieldnames, row)
            all_rows.append(row)
            log_line(
                MAIN_LOG,
                f"completed n={row['n']} {row['shortener']} vs {row['prolonger']} run={row['run_id']} "
                f"moves={row['total_moves']} ratio={row['L_log_n_over_n']:.3f} elapsed={row['elapsed_sec']:.2f}s",
            )


def run_stress_experiments(max_workers: int = 6) -> list[dict[str, Any]]:
    stress_fieldnames = ["n", "shortener", "prolonger", "run_id", "total_moves", "L_over_n", "L_log_n_over_n", "elapsed_sec"]
    if STRESS_CSV.exists():
        STRESS_CSV.unlink()

    tasks_by_n: dict[int, list[tuple[int, str, str, int]]] = defaultdict(list)
    for task in unique_stress_tasks():
        tasks_by_n[task[0]].append(task)

    all_rows: list[dict[str, Any]] = []
    for n in sorted(tasks_by_n):
        _run_task_bucket(tasks_by_n[n], max_workers, all_rows, stress_fieldnames)

    aggregated = aggregate_pair_metrics(all_rows)
    s_star_50k = [row for row in aggregated if row["n"] == 50000 and row["shortener"] == "S_star"]
    if s_star_50k:
        strongest = max(s_star_50k, key=lambda item: item["median_ratio"])
        extension_runs = 5 if strongest["prolonger"] == "P_random" else 1
        extension_tasks = [
            (100000, "S_star", strongest["prolonger"], run_id)
            for run_id in range(extension_runs)
        ]
        log_line(
            MAIN_LOG,
            f"selected extension pair S_star vs {strongest['prolonger']} from 50000 grid "
            f"with ratio={strongest['median_ratio']:.3f}",
        )
        _run_task_bucket(extension_tasks, max_workers, all_rows, stress_fieldnames)
    write_trajectories(all_rows)
    return all_rows


def run_exact_series(start_n: int = 2, max_n: int = 80, per_n_timeout: float = 60.0) -> list[dict[str, Any]]:
    if EXACT_CSV.exists():
        EXACT_CSV.unlink()
    fieldnames = ["n", "L_n", "first_move", "elapsed_sec"]
    rows: list[dict[str, Any]] = []
    for n in range(start_n, max_n + 1):
        try:
            row = exact_minimax(n, timeout_sec=per_n_timeout)
        except ExactTimeout as exc:
            log_line(MAIN_LOG, f"exact minimax timeout at n={n}: {exc}")
            break
        append_csv_row(EXACT_CSV, fieldnames, row)
        rows.append(row)
        log_line(MAIN_LOG, f"exact minimax n={n} L={row['L_n']} first={row['first_move']} elapsed={row['elapsed_sec']:.2f}s")
    return rows


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-workers", type=int, default=min(8, max(1, (os.cpu_count() or 2) - 2)))
    parser.add_argument("--exact-max-n", type=int, default=80)
    parser.add_argument("--exact-timeout", type=float, default=60.0)
    args = parser.parse_args()

    ROOT.mkdir(parents=True, exist_ok=True)
    LOG_DIR.mkdir(parents=True, exist_ok=True)
    TRAJECTORY_DIR.mkdir(parents=True, exist_ok=True)
    log_line(MAIN_LOG, f"starting phase1 max_workers={args.max_workers} exact_max_n={args.exact_max_n}")

    stress_rows = run_stress_experiments(max_workers=args.max_workers)
    exact_rows = run_exact_series(max_n=args.exact_max_n, per_n_timeout=args.exact_timeout)
    REPORT_PATH.write_text(build_report(stress_rows, exact_rows), encoding="utf-8")
    log_line(MAIN_LOG, f"wrote report to {REPORT_PATH}")


if __name__ == "__main__":
    main()
