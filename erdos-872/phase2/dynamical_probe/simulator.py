from __future__ import annotations

import argparse
import bisect
import csv
import importlib.util
import json
import math
import random
import statistics
import sys
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Any


ROOT = Path("/Users/omisverycool/erdos-harness/erdos-872/phase2/dynamical_probe")
RESULTS_PATH = ROOT / "results.csv"
SUMMARY_PATH = ROOT / "results_summary.csv"
ANALYSIS_PATH = ROOT / "ANALYSIS.md"
GROUND_TRUTH_PATH = ROOT / "ground_truth.md"
LOG_PATH = ROOT / "logs" / "dynamical_probe.log"
PHASE1_EXACT_PATH = ROOT.parent.parent / "phase1" / "exact_minimax_v2.py"

SHORTENERS = (
    "S_slp_odd",
    "S_adaptive_prime",
    "S_carrier_snipe",
    "S_primorial_anchor",
    "S_pair_response",
    "S_harmonic",
)
PROLONGERS = (
    "P_block_product",
    "P_interval_top",
    "P_heuristic_maxdeg",
    "P_random",
)
N_VALUES = (10**3, 10**4, 10**5, 10**6)
RANDOM_SEEDS = tuple(range(10))


def log_line(message: str) -> None:
    LOG_PATH.parent.mkdir(parents=True, exist_ok=True)
    stamp = time.strftime("%Y-%m-%d %H:%M:%S")
    with LOG_PATH.open("a", encoding="utf-8") as handle:
        handle.write(f"[{stamp}] {message}\n")


def build_spf(limit: int) -> list[int]:
    spf = list(range(limit + 1))
    for p in range(2, int(limit**0.5) + 1):
        if spf[p] != p:
            continue
        start = p * p
        for q in range(start, limit + 1, p):
            if spf[q] == q:
                spf[q] = p
    return spf


def load_exact_solver() -> Any:
    spec = importlib.util.spec_from_file_location("phase1_exact_minimax_v2_probe", PHASE1_EXACT_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load exact solver from {PHASE1_EXACT_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


class IndexedMaxHeap:
    def __init__(self, limit: int, values: list[int], better: Any):
        self.heap = values[:]
        self.position = [-1] * (limit + 1)
        self.better = better
        for index, value in enumerate(self.heap):
            self.position[value] = index
        for index in range((len(self.heap) // 2) - 1, -1, -1):
            self._sift_down(index)

    def __bool__(self) -> bool:
        return bool(self.heap)

    def contains(self, value: int) -> bool:
        return value < len(self.position) and self.position[value] >= 0

    def peek(self) -> int | None:
        if not self.heap:
            return None
        return self.heap[0]

    def remove(self, value: int) -> None:
        index = self.position[value]
        if index < 0:
            return
        last = self.heap.pop()
        self.position[value] = -1
        if index == len(self.heap):
            return
        self.heap[index] = last
        self.position[last] = index
        self._sift_up(index)
        self._sift_down(index)

    def decreased(self, value: int) -> None:
        index = self.position[value]
        if index >= 0:
            self._sift_down(index)

    def _sift_up(self, index: int) -> None:
        while index > 0:
            parent = (index - 1) // 2
            if not self.better(self.heap[index], self.heap[parent]):
                break
            self._swap(index, parent)
            index = parent

    def _sift_down(self, index: int) -> None:
        size = len(self.heap)
        while True:
            left = 2 * index + 1
            right = left + 1
            best = index
            if left < size and self.better(self.heap[left], self.heap[best]):
                best = left
            if right < size and self.better(self.heap[right], self.heap[best]):
                best = right
            if best == index:
                return
            self._swap(index, best)
            index = best

    def _swap(self, left: int, right: int) -> None:
        self.heap[left], self.heap[right] = self.heap[right], self.heap[left]
        self.position[self.heap[left]] = left
        self.position[self.heap[right]] = right


class ProbeContext:
    def __init__(self, n: int):
        if n < 2:
            raise ValueError("n must be at least 2")
        self.n = n
        self.upper_start = (n // 2) + 1
        self.spf = build_spf(n)
        self.primes = [value for value in range(2, n + 1) if self.spf[value] == value]
        self.odd_primes = [prime for prime in self.primes if prime % 2 == 1]
        self.primorials = self._build_primorials()
        self.tau = [0] * (n + 1)
        self.omega = [0] * (n + 1)
        self.harmonic = [0.0] * (n + 1)
        self._build_arithmetic_tables()
        self.divisor_cache: dict[int, tuple[int, ...]] = {}

    def _build_primorials(self) -> list[int]:
        primorials: list[int] = []
        product = 1
        for prime in self.primes:
            product *= prime
            if product > self.n:
                break
            primorials.append(product)
        return primorials

    def _build_arithmetic_tables(self) -> None:
        self.tau[1] = 1
        for value in range(2, self.n + 1):
            prime = self.spf[value]
            rest = value // prime
            exponent = 1
            while rest % prime == 0:
                rest //= prime
                exponent += 1
            self.tau[value] = self.tau[rest] * (exponent + 1)
            self.omega[value] = self.omega[rest] + 1
            self.harmonic[value] = self.harmonic[rest] + (1.0 / prime)

    def prime_factors(self, value: int) -> tuple[int, ...]:
        out: list[int] = []
        while value > 1:
            prime = self.spf[value]
            out.append(prime)
            while value % prime == 0:
                value //= prime
        return tuple(out)

    def dominant_prime_factor(self, value: int) -> int:
        prime = 1
        while value > 1:
            prime = self.spf[value]
            while value % prime == 0:
                value //= prime
        return prime

    def divisors(self, value: int) -> tuple[int, ...]:
        cached = self.divisor_cache.get(value)
        if cached is not None:
            return cached
        factors: list[tuple[int, int]] = []
        probe = value
        while probe > 1:
            prime = self.spf[probe]
            exponent = 0
            while probe % prime == 0:
                probe //= prime
                exponent += 1
            factors.append((prime, exponent))
        divisors = [1]
        for prime, exponent in factors:
            base = 1
            prior = divisors[:]
            for _ in range(exponent):
                base *= prime
                for divisor in prior:
                    divisors.append(divisor * base)
        result = tuple(sorted(divisor for divisor in divisors if divisor >= 2))
        self.divisor_cache[value] = result
        return result


@dataclass
class GameMetrics:
    L: int
    abs_L_over_n: float
    L_times_logn_over_n: float
    P_size: int
    sum_inv_p: float
    max_p_in_B: int
    num_primes_in_B: int
    sum_omega: int
    log_log_n: float
    ratio_to_loglog: float
    wall_seconds: float


class ProbeGame:
    def __init__(self, context: ProbeContext, shortener: str, prolonger: str, seed: int = 0):
        self.ctx = context
        self.shortener_name = shortener
        self.prolonger_name = prolonger
        self.rng = random.Random(seed)

        self.legal = bytearray(context.n + 1)
        self.played = bytearray(context.n + 1)
        self.legal_values = list(range(2, context.n + 1))
        self.position = [-1] * (context.n + 1)
        for index, value in enumerate(self.legal_values):
            self.legal[value] = 1
            self.position[value] = index

        self.legal_divisor_count = [0] * (context.n + 1)
        self.legal_multiples_count = [0] * (context.n + 1)
        for value in range(2, context.n + 1):
            self.legal_divisor_count[value] = context.tau[value] - 1
            self.legal_multiples_count[value] = context.n // value

        self.shortener_turns = 0
        self.prolonger_turns = 0
        self.last_prolonger_move: int | None = None
        self.move_history: list[int] = []
        self.role_history: list[str] = []

        self.support_a = bytearray(context.n + 1)
        self.support_p = bytearray(context.n + 1)
        self.support_p_sorted: list[int] = []
        self.sum_inv_p = 0.0
        self.max_p_in_B = 0
        self.sum_omega = 0

        self.smallest_pointer = 2
        self.upper_pointer = context.upper_start
        self.prime_pointer = 0
        self.odd_prime_pointer = 0
        self.block_pointer = 0
        self.multiple_pointer: dict[int, int] = {}

        self.harmonic_score: list[float] | None = None
        self.harmonic_heap: IndexedMaxHeap | None = None
        if shortener == "S_harmonic":
            self.harmonic_score = context.harmonic[:]
            self.harmonic_heap = IndexedMaxHeap(
                context.n,
                list(range(2, context.n + 1)),
                self._harmonic_better,
            )

        self.degree_heap: IndexedMaxHeap | None = None
        if prolonger in {"P_heuristic_maxdeg", "P_block_product"}:
            self.degree_heap = IndexedMaxHeap(
                context.n,
                list(range(2, context.n + 1)),
                self._degree_better,
            )

    def _harmonic_better(self, left: int, right: int) -> bool:
        assert self.harmonic_score is not None
        left_score = self.harmonic_score[left]
        right_score = self.harmonic_score[right]
        if left_score != right_score:
            return left_score > right_score
        return left < right

    def _degree_score(self, value: int) -> int:
        return self.legal_divisor_count[value] + self.legal_multiples_count[value] - 1

    def _degree_better(self, left: int, right: int) -> bool:
        left_score = self._degree_score(left)
        right_score = self._degree_score(right)
        if left_score != right_score:
            return left_score > right_score
        return left < right

    def is_legal(self, value: int) -> bool:
        return 2 <= value <= self.ctx.n and bool(self.legal[value])

    def verify_move_is_legal(self, value: int) -> bool:
        if not self.is_legal(value):
            return False
        for divisor in self.ctx.divisors(value):
            if self.played[divisor]:
                return False
        for multiple in range(value, self.ctx.n + 1, value):
            if self.played[multiple]:
                return False
        return True

    def _remove_legal_value(self, value: int) -> None:
        index = self.position[value]
        if index < 0:
            return
        last = self.legal_values[-1]
        self.legal_values[index] = last
        self.position[last] = index
        self.legal_values.pop()
        self.position[value] = -1
        self.legal[value] = 0
        if self.harmonic_heap is not None:
            self.harmonic_heap.remove(value)
        if self.degree_heap is not None:
            self.degree_heap.remove(value)

    def _update_removed_counts(self, removed: list[int]) -> None:
        for dead in removed:
            for divisor in self.ctx.divisors(dead):
                self.legal_multiples_count[divisor] -= 1
                if self.degree_heap is not None and self.legal[divisor]:
                    self.degree_heap.decreased(divisor)
            for multiple in range(dead, self.ctx.n + 1, dead):
                self.legal_divisor_count[multiple] -= 1
                if self.degree_heap is not None and self.legal[multiple]:
                    self.degree_heap.decreased(multiple)

    def _record_prime_support(self, role: str, move: int) -> None:
        factors = self.ctx.prime_factors(move)
        if role == "prolonger":
            self.prolonger_turns += 1
            self.sum_omega += len(factors)
        else:
            self.shortener_turns += 1
        for prime in factors:
            if not self.support_a[prime]:
                self.support_a[prime] = 1
                if self.harmonic_score is not None:
                    decrement = 1.0 / prime
                    for multiple in range(prime, self.ctx.n + 1, prime):
                        self.harmonic_score[multiple] -= decrement
                        if self.harmonic_heap is not None and self.legal[multiple]:
                            self.harmonic_heap.decreased(multiple)
            if role == "prolonger" and not self.support_p[prime]:
                self.support_p[prime] = 1
                self.sum_inv_p += 1.0 / prime
                self.max_p_in_B = max(self.max_p_in_B, prime)
                bisect.insort(self.support_p_sorted, prime)

    def play_move(self, value: int, role: str) -> list[int]:
        if not self.verify_move_is_legal(value):
            raise ValueError(f"illegal move {value}")

        removed: list[int] = []
        for divisor in self.ctx.divisors(value):
            if self.legal[divisor]:
                removed.append(divisor)
                self._remove_legal_value(divisor)
        for multiple in range(value * 2, self.ctx.n + 1, value):
            if self.legal[multiple]:
                removed.append(multiple)
                self._remove_legal_value(multiple)

        self._update_removed_counts(removed)
        self.played[value] = 1
        self._record_prime_support(role, value)
        if role == "prolonger":
            self.last_prolonger_move = value
        self.move_history.append(value)
        self.role_history.append(role)
        return removed

    def smallest_legal_integer(self) -> int | None:
        while self.smallest_pointer <= self.ctx.n and not self.legal[self.smallest_pointer]:
            self.smallest_pointer += 1
        if self.smallest_pointer > self.ctx.n:
            return None
        return self.smallest_pointer

    def smallest_legal_upper(self) -> int | None:
        while self.upper_pointer <= self.ctx.n and not self.legal[self.upper_pointer]:
            self.upper_pointer += 1
        if self.upper_pointer > self.ctx.n:
            return None
        return self.upper_pointer

    def smallest_legal_prime(self) -> int | None:
        primes = self.ctx.primes
        while self.prime_pointer < len(primes) and not self.legal[primes[self.prime_pointer]]:
            self.prime_pointer += 1
        if self.prime_pointer >= len(primes):
            return None
        return primes[self.prime_pointer]

    def smallest_legal_odd_prime(self) -> int | None:
        primes = self.ctx.odd_primes
        while self.odd_prime_pointer < len(primes) and not self.legal[primes[self.odd_prime_pointer]]:
            self.odd_prime_pointer += 1
        if self.odd_prime_pointer >= len(primes):
            return None
        return primes[self.odd_prime_pointer]

    def current_prime_block(self) -> tuple[tuple[int, ...], int | None]:
        primes = self.ctx.primes
        while self.block_pointer < len(primes) and not self.legal[primes[self.block_pointer]]:
            self.block_pointer += 1
        product = 1
        block: list[int] = []
        for index in range(self.block_pointer, len(primes)):
            prime = primes[index]
            if not self.legal[prime]:
                continue
            candidate = product * prime
            if candidate > self.ctx.n:
                break
            block.append(prime)
            product = candidate
        return tuple(block), (product if block else None)

    def smallest_legal_multiple(self, prime: int) -> int | None:
        multiplier = self.multiple_pointer.get(prime, 1)
        while prime * multiplier <= self.ctx.n and not self.legal[prime * multiplier]:
            multiplier += 1
        self.multiple_pointer[prime] = multiplier
        if prime * multiplier > self.ctx.n:
            return None
        return prime * multiplier

    def _adaptive_prime_move(self) -> int | None:
        if self.last_prolonger_move is not None:
            for prime in self.ctx.prime_factors(self.last_prolonger_move):
                if self.legal[prime]:
                    return prime
        return self.smallest_legal_odd_prime() or self.smallest_legal_integer()

    def _carrier_snipe_move(self) -> int | None:
        for prime in self.support_p_sorted:
            candidate = self.smallest_legal_multiple(prime)
            if candidate is not None:
                return candidate
        return self.smallest_legal_integer()

    def _primorial_anchor_move(self) -> int | None:
        step = self.shortener_turns + 1
        upper = self.ctx.n / step
        lower = self.ctx.n / (step + 1)
        for primorial in self.ctx.primorials:
            if lower < primorial <= upper and self.legal[primorial]:
                return primorial
        return self.smallest_legal_integer()

    def _pair_response_move(self) -> int | None:
        if self.last_prolonger_move is not None:
            bound = self.ctx.dominant_prime_factor(self.last_prolonger_move)
            for prime in self.ctx.primes:
                if prime > bound:
                    break
                if not self.support_a[prime] and self.legal[prime]:
                    return prime
        return self.smallest_legal_prime() or self.smallest_legal_integer()

    def _harmonic_move(self) -> int | None:
        if self.harmonic_heap is None:
            return self.smallest_legal_integer()
        return self.harmonic_heap.peek()

    def _maxdeg_move(self) -> int | None:
        if self.degree_heap is None:
            return self.smallest_legal_integer()
        return self.degree_heap.peek()

    def choose_move(self, role: str) -> int | None:
        if not self.legal_values:
            return None
        if role == "shortener":
            if self.shortener_name == "S_slp_odd":
                return self.smallest_legal_odd_prime() or self.smallest_legal_integer()
            if self.shortener_name == "S_adaptive_prime":
                return self._adaptive_prime_move()
            if self.shortener_name == "S_carrier_snipe":
                return self._carrier_snipe_move()
            if self.shortener_name == "S_primorial_anchor":
                return self._primorial_anchor_move()
            if self.shortener_name == "S_pair_response":
                return self._pair_response_move()
            if self.shortener_name == "S_harmonic":
                return self._harmonic_move() or self.smallest_legal_integer()
            raise ValueError(f"unknown shortener strategy {self.shortener_name}")

        if self.prolonger_name == "P_block_product":
            block, product = self.current_prime_block()
            if block and product is not None and self.legal[product]:
                return product
            candidate = self._maxdeg_move()
            return candidate or self.smallest_legal_upper() or self.smallest_legal_integer()
        if self.prolonger_name == "P_interval_top":
            target = self.ctx.upper_start + self.prolonger_turns
            if target <= self.ctx.n and self.legal[target]:
                return target
            return self.smallest_legal_upper() or self.smallest_legal_integer()
        if self.prolonger_name == "P_heuristic_maxdeg":
            return self._maxdeg_move() or self.smallest_legal_integer()
        if self.prolonger_name == "P_random":
            return self.rng.choice(self.legal_values)
        raise ValueError(f"unknown prolonger strategy {self.prolonger_name}")

    def measurements(self) -> dict[str, Any]:
        L = len(self.move_history)
        log_log_n = math.log(math.log(self.ctx.n))
        num_primes = len(self.support_p_sorted)
        return {
            "L": L,
            "abs_L_over_n": L / self.ctx.n,
            "L_times_logn_over_n": L * math.log(self.ctx.n) / self.ctx.n,
            "P_size": self.prolonger_turns,
            "sum_inv_p": self.sum_inv_p,
            "max_p_in_B": self.max_p_in_B,
            "num_primes_in_B": num_primes,
            "sum_omega": self.sum_omega,
            "log_log_n": log_log_n,
            "ratio_to_loglog": self.sum_inv_p / log_log_n if log_log_n > 0 else 0.0,
        }


def play_match(
    context: ProbeContext,
    shortener: str,
    prolonger: str,
    seed: int,
    *,
    capture_support: bool = False,
) -> dict[str, Any]:
    game = ProbeGame(context, shortener, prolonger, seed=seed)
    start = time.perf_counter()
    turn = "prolonger"
    while True:
        move = game.choose_move(turn)
        if move is None:
            break
        game.play_move(move, role=turn)
        turn = "shortener" if turn == "prolonger" else "prolonger"
    wall_seconds = time.perf_counter() - start
    result = {
        "shortener": shortener,
        "prolonger": prolonger,
        "n": context.n,
        "seed": seed,
        **game.measurements(),
        "wall_seconds": wall_seconds,
    }
    if capture_support:
        result["support_p_primes"] = game.support_p_sorted[:]
    return result


def append_result_row(path: Path, row: dict[str, Any]) -> None:
    fieldnames = [
        "shortener",
        "prolonger",
        "n",
        "seed",
        "L",
        "abs_L_over_n",
        "L_times_logn_over_n",
        "P_size",
        "sum_inv_p",
        "max_p_in_B",
        "num_primes_in_B",
        "sum_omega",
        "log_log_n",
        "ratio_to_loglog",
        "wall_seconds",
    ]
    path.parent.mkdir(parents=True, exist_ok=True)
    exists = path.exists()
    with path.open("a", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        if not exists:
            writer.writeheader()
        writer.writerow({key: row[key] for key in fieldnames})


def summarize_results(rows: list[dict[str, Any]]) -> list[dict[str, Any]]:
    grouped: dict[tuple[str, str, int], list[dict[str, Any]]] = {}
    for row in rows:
        key = (row["shortener"], row["prolonger"], int(row["n"]))
        grouped.setdefault(key, []).append(row)
    summary_rows: list[dict[str, Any]] = []
    for (shortener, prolonger, n), items in sorted(grouped.items()):
        def mean_of(key: str) -> float:
            return statistics.fmean(float(item[key]) for item in items)

        def stdev_of(key: str) -> float:
            values = [float(item[key]) for item in items]
            return statistics.pstdev(values) if len(values) > 1 else 0.0

        summary_rows.append(
            {
                "shortener": shortener,
                "prolonger": prolonger,
                "n": n,
                "runs": len(items),
                "L_mean": mean_of("L"),
                "L_stdev": stdev_of("L"),
                "sum_inv_p_mean": mean_of("sum_inv_p"),
                "sum_inv_p_stdev": stdev_of("sum_inv_p"),
                "ratio_to_loglog_mean": mean_of("ratio_to_loglog"),
                "ratio_to_loglog_stdev": stdev_of("ratio_to_loglog"),
                "L_times_logn_over_n_mean": mean_of("L_times_logn_over_n"),
                "L_times_logn_over_n_stdev": stdev_of("L_times_logn_over_n"),
                "wall_seconds_mean": mean_of("wall_seconds"),
            }
        )
    return summary_rows


def write_summary_csv(path: Path, rows: list[dict[str, Any]]) -> None:
    fieldnames = [
        "shortener",
        "prolonger",
        "n",
        "runs",
        "L_mean",
        "L_stdev",
        "sum_inv_p_mean",
        "sum_inv_p_stdev",
        "ratio_to_loglog_mean",
        "ratio_to_loglog_stdev",
        "L_times_logn_over_n_mean",
        "L_times_logn_over_n_stdev",
        "wall_seconds_mean",
    ]
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)


def build_analysis(rows: list[dict[str, Any]], summary_rows: list[dict[str, Any]]) -> str:
    if not summary_rows:
        return "# Dynamical Carrier Probe Analysis\n\nNo runs were available.\n"

    summary_lookup = {
        (row["shortener"], row["prolonger"], int(row["n"])): row
        for row in summary_rows
    }
    available_shorteners = sorted({str(row["shortener"]) for row in summary_rows})
    available_prolongers = sorted({str(row["prolonger"]) for row in summary_rows})
    available_ns = sorted({int(row["n"]) for row in summary_rows})
    shortener_lines: list[str] = []
    for shortener in available_shorteners:
        worst = []
        for n in available_ns:
            candidates = [
                summary_lookup[(shortener, prolonger, n)]
                for prolonger in available_prolongers
                if (shortener, prolonger, n) in summary_lookup
            ]
            if not candidates:
                continue
            worst_row = max(candidates, key=lambda item: float(item["sum_inv_p_mean"]))
            worst.append(
                f"{n}: {worst_row['prolonger']} -> "
                f"sum 1/p {float(worst_row['sum_inv_p_mean']):.3f}, "
                f"ratio/loglog {float(worst_row['ratio_to_loglog_mean']):.3f}"
            )
        if worst:
            last_ratios = [float(entry.split("ratio/loglog ")[1]) for entry in worst]
            if len(last_ratios) >= 2 and max(last_ratios) / max(1e-9, min(last_ratios)) < 1.4:
                scaling = "roughly log log n (ratio stabilizes)"
            elif len(last_ratios) >= 2 and last_ratios[-1] < last_ratios[0] * 0.8:
                scaling = "sub-log-log signal (ratio decays)"
            elif len(last_ratios) >= 2 and last_ratios[-1] > last_ratios[0] * 1.4:
                scaling = "faster than log log n (ratio grows)"
            else:
                scaling = "inconclusive / lower-order drift"
            shortener_lines.append(f"- `{shortener}`: {scaling}. " + "; ".join(worst))

    best_by_n: list[str] = []
    for n in available_ns:
        shortener_best: list[tuple[str, str, float]] = []
        for shortener in available_shorteners:
            candidates = [
                summary_lookup[(shortener, prolonger, n)]
                for prolonger in available_prolongers
                if (shortener, prolonger, n) in summary_lookup
            ]
            if not candidates:
                continue
            worst = max(candidates, key=lambda item: float(item["sum_inv_p_mean"]))
            shortener_best.append((shortener, worst["prolonger"], float(worst["sum_inv_p_mean"])))
        if shortener_best:
            winner = min(shortener_best, key=lambda item: item[2])
            tied = [item for item in shortener_best if abs(item[2] - winner[2]) <= 1e-12]
            if len(tied) == 1:
                best_by_n.append(
                    f"- n = {n}: `{winner[0]}` minimizes the worst-case reciprocal mass "
                    f"({winner[2]:.3f}), attained by `{winner[1]}`."
                )
            else:
                names = ", ".join(f"`{item[0]}`" for item in tied)
                prolongers = ", ".join(sorted({f"`{item[1]}`" for item in tied}))
                best_by_n.append(
                    f"- n = {n}: {names} tie for the smallest tested worst-case reciprocal mass "
                    f"({winner[2]:.3f}), with worst opponent {prolongers}."
                )

    largest_n = max(available_ns)
    largest_n_worst = {
        shortener: max(
            float(summary_lookup[(shortener, prolonger, largest_n)]["sum_inv_p_mean"])
            for prolonger in available_prolongers
            if (shortener, prolonger, largest_n) in summary_lookup
        )
        for shortener in available_shorteners
    }
    best_shortener = min(
        available_shorteners,
        key=lambda shortener: largest_n_worst[shortener],
    )
    co_best_shorteners = [
        shortener for shortener, value in sorted(largest_n_worst.items())
        if abs(value - largest_n_worst[best_shortener]) <= 1e-12
    ]
    worst_prolonger = max(
        available_prolongers,
        key=lambda prolonger: float(summary_lookup[(best_shortener, prolonger, largest_n)]["sum_inv_p_mean"])
        if (best_shortener, prolonger, largest_n) in summary_lookup
        else -1.0,
    )
    support_run = play_match(
        ProbeContext(largest_n),
        best_shortener,
        worst_prolonger,
        0,
        capture_support=True,
    )
    support_primes = support_run["support_p_primes"]
    total_mass = sum(1.0 / prime for prime in support_primes)

    def support_mass(bound: int) -> float:
        return sum(1.0 / prime for prime in support_primes if prime <= bound)

    small_100 = support_mass(100)
    small_1000 = support_mass(1000)

    l_values = [float(row["L_times_logn_over_n"]) for row in rows]
    mass_values = [float(row["sum_inv_p"]) for row in rows]
    corr = 0.0
    if len(l_values) >= 2:
        l_mean = statistics.fmean(l_values)
        m_mean = statistics.fmean(mass_values)
        numerator = sum((left - l_mean) * (right - m_mean) for left, right in zip(l_values, mass_values))
        denom_left = math.sqrt(sum((value - l_mean) ** 2 for value in l_values))
        denom_right = math.sqrt(sum((value - m_mean) ** 2 for value in mass_values))
        if denom_left and denom_right:
            corr = numerator / (denom_left * denom_right)

    best_shortener_ratios: list[str] = []
    for n in available_ns:
        candidates = [
            summary_lookup[(best_shortener, prolonger, n)]
            for prolonger in available_prolongers
            if (best_shortener, prolonger, n) in summary_lookup
        ]
        if candidates:
            worst = max(candidates, key=lambda item: float(item["sum_inv_p_mean"]))
            best_shortener_ratios.append(
                f"{n}: {float(worst['ratio_to_loglog_mean']):.3f} via `{worst['prolonger']}`"
            )

    pair_response_notes: list[str] = []
    if "S_pair_response" in available_shorteners:
        interval_rows = [
            summary_lookup[("S_pair_response", prolonger, n)]
            for prolonger in ("P_interval_top", "P_random")
            for n in available_ns
            if ("S_pair_response", prolonger, n) in summary_lookup
        ]
        if interval_rows:
            interval_only = [
                row for row in interval_rows if row["prolonger"] == "P_interval_top"
            ]
            random_only = [
                row for row in interval_rows if row["prolonger"] == "P_random"
            ]
            if interval_only:
                pair_response_notes.append(
                    "- `S_pair_response` is the only tested Shortener that materially suppresses `P_interval_top`: "
                    + "; ".join(
                        f"{int(row['n'])}: {float(row['ratio_to_loglog_mean']):.3f}"
                        for row in interval_only
                    )
                )
            if random_only:
                pair_response_notes.append(
                    "- Against `P_random`, `S_pair_response` also stays well below the block-product regime: "
                    + "; ".join(
                        f"{int(row['n'])}: {float(row['ratio_to_loglog_mean']):.3f}"
                        for row in random_only
                    )
                )

    lines = [
        "# Dynamical Carrier Probe Analysis",
        "",
        "## 1. Worst-case scaling by Shortener",
        "",
        *shortener_lines,
        "",
        "## 2. Best Shortener / worst Prolonger by n",
        "",
        *best_by_n,
        "",
        "## 3. Prime-mass concentration for the best Shortener",
        "",
        (
            f"- At the largest tested n = {largest_n}, the smallest tested worst-case reciprocal mass is "
            f"{largest_n_worst[best_shortener]:.3f}, achieved by "
            + ", ".join(f"`{shortener}`" for shortener in co_best_shorteners)
            + f". The representative support breakdown below uses `{best_shortener}` against `{worst_prolonger}`."
        ),
        (
            f"- Reciprocal mass concentration: primes <= 100 contribute {small_100:.3f} "
            f"({(small_100 / total_mass * 100.0) if total_mass else 0.0:.1f}%), "
            f"and primes <= 1000 contribute {small_1000:.3f} "
            f"({(small_1000 / total_mass * 100.0) if total_mass else 0.0:.1f}%) of total mass {total_mass:.3f}."
        ),
        (
            f"- Largest carrier prime observed in that representative run: {max(support_primes) if support_primes else 0}. "
            "That indicates substantial small-prime concentration, but not a finite-prime collapse."
        ),
        "",
        "## 4. Correlation between game length and reciprocal mass",
        "",
        f"- Pearson correlation across raw runs between `L log n / n` and `sum 1/p`: {corr:.3f}.",
        (
            "- Interpretation: positive means larger reciprocal-mass carrier sets tend to coincide with longer games, "
            "while negative means the larger-mass runs here tend to finish sooner."
        ),
        "",
        "## 5. Ratio decay check for the best candidate",
        "",
        f"- `{best_shortener}` worst-case `sum_inv_p / log log n` trajectory: " + "; ".join(best_shortener_ratios),
        *pair_response_notes,
        "- A clean dynamical carrier bound would need this ratio to decay convincingly with n. The table above is the empirical signal to watch.",
        "",
        "## Caveats",
        "",
        "- This writeup reflects the `run_all.py` default `practical` sweep: full deterministic coverage, full `P_random` coverage through `n = 10^5`, and `n = 10^6` random runs only for `S_slp_odd`, `S_adaptive_prime`, `S_primorial_anchor`, and `S_pair_response`.",
        "- `S_adaptive_prime` is ported from the existing Phase 2 implementation in `shortener_stress.py`, where it mostly behaves like a fallback prime-picker because literal prime divisors of Prolonger’s last move are often immediately illegal.",
        "- `P_block_product` here is generalized to all primes rather than odd primes only, since the measured carrier set `B(P)` is defined over all prime divisors.",
    ]
    return "\n".join(lines) + "\n"


def build_ground_truth() -> str:
    solver_module = load_exact_solver()
    lines = ["# Small-n Ground Truth", ""]
    for n in (20, 30, 40, 50):
        solver = solver_module.ExactSolverV2(n)
        solution = solver.solve()
        variation = solution["principal_variation"]
        game = ProbeGame(ProbeContext(n), "S_slp_odd", "P_interval_top", seed=0)
        match_counts = {shortener: 0 for shortener in SHORTENERS}
        shortener_turn_index = 0
        for move in variation:
            role = "prolonger" if len(game.move_history) % 2 == 0 else "shortener"
            if role == "shortener":
                shortener_turn_index += 1
                for shortener in SHORTENERS:
                    candidate_game = ProbeGame(game.ctx, shortener, "P_interval_top", seed=0)
                    for prior_move, prior_role in zip(game.move_history, game.role_history):
                        candidate_game.play_move(prior_move, prior_role)
                    if candidate_game.choose_move("shortener") == move:
                        match_counts[shortener] += 1
            game.play_move(move, role)
        ranking = sorted(match_counts.items(), key=lambda item: (-item[1], item[0]))
        lines.append(
            f"- n = {n}: `L(n) = {solution['L_n']}`; best candidate match counts = "
            + ", ".join(f"`{name}` {count}" for name, count in ranking[:3])
        )
    return "\n".join(lines) + "\n"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Single-run dynamical carrier probe simulator")
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--shortener", required=True, choices=SHORTENERS)
    parser.add_argument("--prolonger", required=True, choices=PROLONGERS)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--json", action="store_true", help="print the row as JSON")
    parser.add_argument("--capture-support", action="store_true", help="include the Prolonger prime support in output")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    result = play_match(
        ProbeContext(args.n),
        args.shortener,
        args.prolonger,
        args.seed,
        capture_support=args.capture_support,
    )
    if args.json:
        print(json.dumps(result, indent=2, sort_keys=True))
        return
    ordered = {
        "shortener": result["shortener"],
        "prolonger": result["prolonger"],
        "n": result["n"],
        "seed": result["seed"],
        "L": result["L"],
        "abs_L_over_n": result["abs_L_over_n"],
        "L_times_logn_over_n": result["L_times_logn_over_n"],
        "P_size": result["P_size"],
        "sum_inv_p": result["sum_inv_p"],
        "max_p_in_B": result["max_p_in_B"],
        "num_primes_in_B": result["num_primes_in_B"],
        "sum_omega": result["sum_omega"],
        "log_log_n": result["log_log_n"],
        "ratio_to_loglog": result["ratio_to_loglog"],
        "wall_seconds": result["wall_seconds"],
    }
    print(json.dumps(ordered, indent=2, sort_keys=False))


if __name__ == "__main__":
    main()
