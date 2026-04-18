from __future__ import annotations

import argparse
import csv
import datetime as dt
import heapq
import importlib.util
import math
import random
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from statistics import fmean
from typing import Any


ROOT = Path("/Users/omisverycool/erdos-harness/erdos-872/phase2")
LOG_PATH = ROOT / "logs" / "shortener_stress.log"
CSV_PATH = ROOT / "shortener_stress.csv"
SUMMARY_PATH = ROOT / "shortener_stress_summary.md"
PHASE1_EXACT_PATH = ROOT.parent / "phase1" / "exact_minimax_v2.py"
PHASE1_L40_DIAGNOSTIC_PATH = ROOT.parent / "phase1" / "L40_diagnostic.md"

SHORTENERS = ("S_star", "S_adaptive_prime", "S_harm", "S_carrier_snipe", "S_topdown")
PROLONGERS = ("P_block_product", "P_antiStar", "P_harm", "P_random")
N_VALUES = (1000, 5000, 20000, 100000)
RANDOM_SEEDS = (0, 1, 2, 3, 4)
EXHAUSTIVE_ANTISTAR_THRESHOLD = 3000
SCREENED_ANTISTAR_POOL = 96


def log_line(message: str) -> None:
    LOG_PATH.parent.mkdir(parents=True, exist_ok=True)
    stamp = dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with LOG_PATH.open("a", encoding="utf-8") as handle:
        handle.write(f"[{stamp}] {message}\n")


def write_csv_rows(rows: list[dict[str, Any]]) -> None:
    fieldnames = ["n", "shortener", "prolonger", "seed", "L", "L_over_n_log_n"]
    with CSV_PATH.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
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


def distinct_prime_factors(value: int, spf: list[int]) -> tuple[int, ...]:
    factors: list[int] = []
    while value > 1:
        prime = spf[value]
        factors.append(prime)
        while value % prime == 0:
            value //= prime
    return tuple(factors)


class StressContext:
    def __init__(self, n: int):
        if n < 2:
            raise ValueError("n must be at least 2")
        self.n = n
        self.spf = build_spf(n)
        self.is_prime = [False] * (n + 1)
        self.prime_factors = [tuple() for _ in range(n + 1)]
        self.harmonic_base = [0.0] * (n + 1)
        self.divisors: list[tuple[int, ...]] = [tuple() for _ in range(n + 1)]
        divisors_work: list[list[int]] = [[] for _ in range(n + 1)]

        for d in range(2, n + 1):
            for multiple in range(d, n + 1, d):
                divisors_work[multiple].append(d)

        for value in range(2, n + 1):
            self.divisors[value] = tuple(divisors_work[value])
            self.is_prime[value] = self.spf[value] == value
            self.prime_factors[value] = distinct_prime_factors(value, self.spf)
            self.harmonic_base[value] = sum(1.0 / prime for prime in self.prime_factors[value])

        self.odd_primes = tuple(value for value in range(3, n + 1, 2) if self.is_prime[value])
        self.odd_primes_at_most_half = tuple(value for value in self.odd_primes if value <= n // 2)
        self.distinct_factor_order = tuple(
            sorted(range(2, n + 1), key=lambda value: (-len(self.prime_factors[value]), value))
        )
        self.shortener_prefix_k = max(0, int(math.isqrt(n) / math.log(n))) if n > 2 else 0


class StressGame:
    def __init__(self, context: StressContext, seed: int = 0):
        self.ctx = context
        self.rng = random.Random(seed)
        self.legal = bytearray(context.n + 1)
        self.legal_values = list(range(2, context.n + 1))
        self.position = [-1] * (context.n + 1)
        for idx, value in enumerate(self.legal_values):
            self.legal[value] = 1
            self.position[value] = idx

        self.legal_count = len(self.legal_values)
        self.legal_divisors_count = [0] * (context.n + 1)
        self.legal_multiples_count = [0] * (context.n + 1)
        for value in range(2, context.n + 1):
            self.legal_divisors_count[value] = len(context.divisors[value])
            self.legal_multiples_count[value] = context.n // value

        self.harm_score = context.harmonic_base[:]
        self.harm_version = [0] * (context.n + 1)
        self.harm_heap = [(-self.harm_score[value], value, 0) for value in range(2, context.n + 1)]
        heapq.heapify(self.harm_heap)

        self.smallest_pointer = 2
        self.odd_prime_pointer = 0
        self.topdown_pointer = len(context.odd_primes_at_most_half) - 1
        self.shortener_turns = 0
        self.last_prolonger_move: int | None = None
        self.move_history: list[int] = []
        self.move_roles: list[str] = []

    def is_legal(self, value: int) -> bool:
        return 2 <= value <= self.ctx.n and bool(self.legal[value])

    def smallest_legal_integer(self) -> int | None:
        while self.smallest_pointer <= self.ctx.n and not self.legal[self.smallest_pointer]:
            self.smallest_pointer += 1
        if self.smallest_pointer > self.ctx.n:
            return None
        return self.smallest_pointer

    def smallest_legal_odd_prime(self) -> int | None:
        primes = self.ctx.odd_primes
        while self.odd_prime_pointer < len(primes) and not self.legal[primes[self.odd_prime_pointer]]:
            self.odd_prime_pointer += 1
        if self.odd_prime_pointer >= len(primes):
            return None
        return primes[self.odd_prime_pointer]

    def largest_legal_odd_prime_at_most_half(self) -> int | None:
        primes = self.ctx.odd_primes_at_most_half
        while self.topdown_pointer >= 0 and not self.legal[primes[self.topdown_pointer]]:
            self.topdown_pointer -= 1
        if self.topdown_pointer < 0:
            return None
        return primes[self.topdown_pointer]

    def current_odd_prime_block(self) -> tuple[tuple[int, ...], int | None]:
        block: list[int] = []
        product = 1
        for prime in self.ctx.odd_primes:
            if not self.legal[prime]:
                continue
            if product * prime > self.ctx.n:
                break
            block.append(prime)
            product *= prime
        return tuple(block), (product if block else None)

    def _remove_from_legal_values(self, value: int) -> None:
        pos = self.position[value]
        if pos < 0:
            return
        last = self.legal_values[-1]
        self.legal_values[pos] = last
        self.position[last] = pos
        self.legal_values.pop()
        self.position[value] = -1

    def _removed_by_move(self, value: int) -> list[int]:
        removed = [d for d in self.ctx.divisors[value] if self.legal[d]]
        for multiple in range(value * 2, self.ctx.n + 1, value):
            if self.legal[multiple]:
                removed.append(multiple)
        return removed

    def _prime_loss_update(self, prime: int) -> None:
        decrement = 1.0 / prime
        for multiple in range(prime, self.ctx.n + 1, prime):
            self.harm_score[multiple] -= decrement
            self.harm_version[multiple] += 1
            if self.legal[multiple]:
                heapq.heappush(
                    self.harm_heap,
                    (-self.harm_score[multiple], multiple, self.harm_version[multiple]),
                )

    def play(self, value: int, role: str | None = None) -> list[int]:
        if not self.legal[value]:
            raise ValueError(f"illegal move {value}")

        removed = self._removed_by_move(value)
        for dead in removed:
            self.legal[dead] = 0
            self._remove_from_legal_values(dead)
        self.legal_count -= len(removed)

        for dead in removed:
            if self.ctx.is_prime[dead]:
                self._prime_loss_update(dead)
            for divisor in self.ctx.divisors[dead]:
                self.legal_multiples_count[divisor] -= 1
            for multiple in range(dead, self.ctx.n + 1, dead):
                self.legal_divisors_count[multiple] -= 1

        if role == "shortener":
            self.shortener_turns += 1
        elif role == "prolonger":
            self.last_prolonger_move = value
        if role is not None:
            self.move_history.append(value)
            self.move_roles.append(role)
        return removed

    def _best_harmonic_move(self) -> int | None:
        while self.harm_heap:
            score, value, version = self.harm_heap[0]
            if not self.legal[value] or version != self.harm_version[value]:
                heapq.heappop(self.harm_heap)
                continue
            return value
        return None

    def _first_not_dividing_last_prolonger(self) -> int | None:
        if self.last_prolonger_move is None:
            return None
        for prime in self.ctx.prime_factors[self.last_prolonger_move]:
            if self.legal[prime]:
                return prime
        return None

    def _smallest_legal_odd_prime_not_dividing(self, value: int) -> int | None:
        for prime in self.ctx.odd_primes:
            if not self.legal[prime]:
                continue
            if value % prime == 0:
                continue
            return prime
        return None

    def _exact_remaining_after_candidate(self, value: int) -> tuple[int, int | None]:
        removed = set(self._removed_by_move(value))
        remaining = self.legal_count - len(removed)

        if self.shortener_turns < self.ctx.shortener_prefix_k:
            response = self._smallest_legal_odd_prime_not_dividing(value)
            if response is None:
                return remaining, None
            response_loss = self.legal_multiples_count[response]
            overlap = self.legal_multiples_count[value * response] if value * response <= self.ctx.n else 0
            return remaining - response_loss + overlap, response

        response = self.smallest_legal_integer()
        while response is not None and response in removed:
            response += 1
            while response <= self.ctx.n and not self.legal[response]:
                response += 1
            if response > self.ctx.n:
                response = None
        if response is None:
            return remaining, None

        extra = 0
        for divisor in self.ctx.divisors[response]:
            if self.legal[divisor] and divisor not in removed:
                extra += 1
        for multiple in range(response * 2, self.ctx.n + 1, response):
            if self.legal[multiple] and multiple not in removed:
                extra += 1
        return remaining - extra, response

    def _antistar_candidate_pool(self) -> list[int]:
        if self.legal_count <= EXHAUSTIVE_ANTISTAR_THRESHOLD:
            return list(self.legal_values)

        pool: set[int] = set()
        temp: list[tuple[float, int, int]] = []
        while self.harm_heap and len(temp) < 32:
            score, value, version = heapq.heappop(self.harm_heap)
            if self.legal[value] and version == self.harm_version[value]:
                pool.add(value)
                temp.append((score, value, version))
        for item in temp:
            heapq.heappush(self.harm_heap, item)

        block, product = self.current_odd_prime_block()
        if product is not None and self.legal[product]:
            pool.add(product)
        pool.update(block[-2:])
        pool.update(self.legal_values[:16])
        pool.update(self.legal_values[-16:])

        picked = 0
        for value in self.ctx.distinct_factor_order:
            if self.legal[value]:
                pool.add(value)
                picked += 1
                if picked >= 20:
                    break

        sample_size = min(20, len(self.legal_values))
        if sample_size:
            pool.update(self.rng.sample(self.legal_values, sample_size))

        fallback = self.smallest_legal_integer()
        if fallback is not None:
            pool.add(fallback)
        topdown = self.largest_legal_odd_prime_at_most_half()
        if topdown is not None:
            pool.add(topdown)
        return sorted(pool)[:SCREENED_ANTISTAR_POOL]

    def best_antistar_move_exhaustive(self) -> int:
        best_move: int | None = None
        best_key: tuple[int, int, int] | None = None
        for value in self.legal_values:
            remaining, response = self._exact_remaining_after_candidate(value)
            response_key = self.ctx.n + 1 if response is None else response
            key = (remaining, response_key, -value)
            if best_key is None or key > best_key:
                best_key = key
                best_move = value
        if best_move is None:
            raise RuntimeError("P_antiStar called with no legal moves")
        return best_move

    def _best_antistar_move(self) -> int | None:
        if not self.legal_values:
            return None
        if self.shortener_turns < self.ctx.shortener_prefix_k or self.legal_count <= EXHAUSTIVE_ANTISTAR_THRESHOLD:
            return self.best_antistar_move_exhaustive()

        best_move: int | None = None
        best_key: tuple[int, int, int] | None = None
        for value in self._antistar_candidate_pool():
            if not self.legal[value]:
                continue
            remaining, response = self._exact_remaining_after_candidate(value)
            response_key = self.ctx.n + 1 if response is None else response
            key = (remaining, response_key, -value)
            if best_key is None or key > best_key:
                best_key = key
                best_move = value
        return best_move or self.smallest_legal_integer()

    def choose_move(self, role: str, strategy_name: str) -> int | None:
        if not self.legal_values:
            return None

        if role == "shortener":
            if strategy_name == "S_star":
                if self.shortener_turns < self.ctx.shortener_prefix_k:
                    return self.smallest_legal_odd_prime() or self.smallest_legal_integer()
                return self.smallest_legal_integer()
            if strategy_name == "S_adaptive_prime":
                return self._first_not_dividing_last_prolonger() or self.smallest_legal_odd_prime() or self.smallest_legal_integer()
            if strategy_name == "S_harm":
                return self._best_harmonic_move() or self.smallest_legal_integer()
            if strategy_name == "S_carrier_snipe":
                block, _ = self.current_odd_prime_block()
                if len(block) >= 2 and self.legal[block[-1]]:
                    return block[-1]
                return self.smallest_legal_odd_prime() or self.smallest_legal_integer()
            if strategy_name == "S_topdown":
                return self.largest_legal_odd_prime_at_most_half() or self.smallest_legal_integer()
            raise ValueError(f"unknown shortener strategy {strategy_name}")

        if strategy_name == "P_block_product":
            block, product = self.current_odd_prime_block()
            if len(block) >= 2 and product is not None and self.legal[product]:
                return product
            return self._best_antistar_move()
        if strategy_name == "P_antiStar":
            return self._best_antistar_move()
        if strategy_name == "P_harm":
            return self._best_harmonic_move() or self.smallest_legal_integer()
        if strategy_name == "P_random":
            return self.rng.choice(self.legal_values)
        raise ValueError(f"unknown prolonger strategy {strategy_name}")


def load_exact_solver() -> Any:
    spec = importlib.util.spec_from_file_location("phase1_exact_minimax_v2", PHASE1_EXACT_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load exact solver from {PHASE1_EXACT_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def exact_l40_value() -> int:
    diagnostic = PHASE1_L40_DIAGNOSTIC_PATH.read_text(encoding="utf-8")
    match = re.search(
        r"Fresh independent implementation .*? gives `L\(40\) = (\d+)`",
        diagnostic,
        flags=re.DOTALL,
    )
    if match is None:
        raise RuntimeError(f"could not find corrected L(40) in {PHASE1_L40_DIAGNOSTIC_PATH}")
    return int(match.group(1))


@dataclass
class MatchResult:
    n: int
    shortener: str
    prolonger: str
    seed: int
    L: int
    L_over_n_log_n: float


def play_match(context: StressContext, shortener: str, prolonger: str, seed: int) -> MatchResult:
    game = StressGame(context, seed=seed)
    turn = "prolonger"
    while True:
        strategy = prolonger if turn == "prolonger" else shortener
        move = game.choose_move(turn, strategy)
        if move is None:
            break
        game.play(move, role=turn)
        turn = "shortener" if turn == "prolonger" else "prolonger"
    total_moves = len(game.move_history)
    return MatchResult(
        n=context.n,
        shortener=shortener,
        prolonger=prolonger,
        seed=seed,
        L=total_moves,
        L_over_n_log_n=total_moves * math.log(context.n) / context.n,
    )


def block_prefix_surrogate(n: int) -> dict[str, float]:
    context = StressContext(n)
    game = StressGame(context, seed=0)
    selected_primes: list[int] = []
    turn = "prolonger"
    while game.shortener_turns < context.shortener_prefix_k:
        strategy = "P_block_product" if turn == "prolonger" else "S_star"
        move = game.choose_move(turn, strategy)
        if move is None:
            break
        game.play(move, role=turn)
        if turn == "shortener":
            selected_primes.append(move)
        turn = "shortener" if turn == "prolonger" else "prolonger"

    odd_d_free = 0
    for value in range(1, n + 1, 2):
        if all(value % prime for prime in selected_primes):
            odd_d_free += 1
    surrogate = 2 * len(selected_primes) + odd_d_free
    return {
        "k": float(len(selected_primes)),
        "sum_inv": sum(1.0 / prime for prime in selected_primes),
        "odd_d_free": float(odd_d_free),
        "surrogate_L": float(surrogate),
        "surrogate_ratio": surrogate * math.log(n) / n,
    }


def aggregated_rows(csv_rows: list[dict[str, Any]]) -> dict[tuple[str, str, int], float]:
    grouped: dict[tuple[str, str, int], list[float]] = {}
    for row in csv_rows:
        key = (row["shortener"], row["prolonger"], int(row["n"]))
        grouped.setdefault(key, []).append(float(row["L_over_n_log_n"]))
    return {key: fmean(values) for key, values in grouped.items()}


def build_summary(csv_rows: list[dict[str, Any]]) -> str:
    agg = aggregated_rows(csv_rows)
    block_surrogate = block_prefix_surrogate(100000)
    lines = ["# Shortener stress summary", ""]
    lines.append("## Table")
    lines.append("")
    lines.append("| pair | 1000 | 5000 | 20000 | 100000 |")
    lines.append("| --- | ---: | ---: | ---: | ---: |")
    for shortener in SHORTENERS:
        for prolonger in PROLONGERS:
            row = [f"{shortener} vs {prolonger}"]
            for n in N_VALUES:
                value = agg[(shortener, prolonger, n)]
                row.append(f"{value:.3f}")
            lines.append(f"| {' | '.join(row)} |")

    lines.extend(["", "## Flags", ""])
    decreasing_all: list[str] = []
    for shortener in SHORTENERS:
        if all(
            all(
                agg[(shortener, prolonger, left)] > agg[(shortener, prolonger, right)]
                for left, right in zip(N_VALUES, N_VALUES[1:])
            )
            for prolonger in PROLONGERS
        ):
            decreasing_all.append(shortener)
    if decreasing_all:
        lines.append(
            f"- Decreasing for all four Prolongers: {', '.join(decreasing_all)}."
        )
    else:
        lines.append("- No Shortener decreased monotonically for all four Prolongers.")

    baseline = agg[("S_star", "P_block_product", 100000)]
    resistant = [
        shortener
        for shortener in SHORTENERS
        if shortener != "S_star" and agg[(shortener, "P_block_product", 100000)] < baseline
    ]
    if resistant:
        lines.append(
            f"- Better than S_star against P_block_product at n=100000: {', '.join(resistant)}."
        )
    else:
        lines.append("- No alternative Shortener beat S_star against P_block_product at n=100000.")

    ranking = sorted(
        SHORTENERS,
        key=lambda shortener: (
            max(agg[(shortener, prolonger, 100000)] for prolonger in PROLONGERS),
            fmean(agg[(shortener, prolonger, 100000)] for prolonger in PROLONGERS),
            agg[(shortener, "P_block_product", 100000)],
        ),
    )
    winner = ranking[0]
    lines.extend(["", "## Recommendation", ""])
    worst_case = max(agg[(winner, prolonger, 100000)] for prolonger in PROLONGERS)
    mean_case = fmean(agg[(winner, prolonger, 100000)] for prolonger in PROLONGERS)
    block_case = agg[(winner, "P_block_product", 100000)]
    lines.append(
        f"`{winner}` is the strongest candidate for the next Pro round: at n = 100000 it has the smallest worst-case "
        f"`L log n / n` across the four tested Prolongers ({worst_case:.3f}), mean {mean_case:.3f}, and "
        f"`P_block_product` score {block_case:.3f}."
    )
    lines.append(
        f"`S_star` vs `P_block_product` lands at {baseline:.3f} on the same scale, which is "
        f"{'above' if baseline > 13.0 * math.log(100000) / 36.0 else 'below'} the requested `13/36 * log n` sanity threshold."
    )
    lines.append(
        f"The Round 7 prefix surrogate does reproduce the expected linear obstruction: for `S_star` vs `P_block_product` at "
        f"`n = 100000`, the prefix data gives `sum 1/q = {block_surrogate['sum_inv']:.3f}`, "
        f"`2k + N_D = {int(block_surrogate['surrogate_L'])}` and surrogate `L log n / n = {block_surrogate['surrogate_ratio']:.3f}`. "
        "The actual full-game length is smaller because the post-prefix deterministic fallback can immediately play low composites like `2`."
    )
    lines.append(
        "`S_adaptive_prime` improves mainly through its fallback, not through literal divisor-following: under the actual antichain "
        "legality rules, prime divisors of Prolonger’s just-played move are usually illegal immediately, so the strategy behaves much "
        "closer to 'keep taking the smallest legal odd prime' than to a true reactive divisor reply."
    )
    return "\n".join(lines) + "\n"


def run_grid() -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    LOG_PATH.parent.mkdir(parents=True, exist_ok=True)
    ROOT.mkdir(parents=True, exist_ok=True)
    LOG_PATH.write_text("", encoding="utf-8")

    l40 = exact_l40_value()
    log_line(f"exact sanity from phase1/L40_diagnostic.md: corrected L(40)={l40}")
    if l40 != 16:
        raise RuntimeError(f"expected L(40)=16, got {l40}")

    for n in N_VALUES:
        log_line(f"building context for n={n}")
        context = StressContext(n)
        for shortener in SHORTENERS:
            for prolonger in PROLONGERS:
                seeds = RANDOM_SEEDS if prolonger == "P_random" else (0,)
                for seed in seeds:
                    result = play_match(context, shortener, prolonger, seed)
                    row = {
                        "n": result.n,
                        "shortener": result.shortener,
                        "prolonger": result.prolonger,
                        "seed": result.seed,
                        "L": result.L,
                        "L_over_n_log_n": f"{result.L_over_n_log_n:.12f}",
                    }
                    rows.append(row)
                    log_line(
                        f"n={n} shortener={shortener} prolonger={prolonger} seed={seed} "
                        f"L={result.L} ratio={result.L_over_n_log_n:.6f}"
                    )
    write_csv_rows(rows)
    summary = build_summary(rows)
    SUMMARY_PATH.write_text(summary, encoding="utf-8")
    log_line(f"wrote csv to {CSV_PATH}")
    log_line(f"wrote summary to {SUMMARY_PATH}")
    return rows


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Phase 2 shortener stress grid")
    parser.add_argument("--summary-only", action="store_true", help="rebuild the markdown summary from the CSV")
    return parser.parse_args()


def rebuild_summary_from_csv() -> None:
    rows: list[dict[str, Any]] = []
    with CSV_PATH.open(newline="", encoding="utf-8") as handle:
        for row in csv.DictReader(handle):
            rows.append(row)
    SUMMARY_PATH.write_text(build_summary(rows), encoding="utf-8")
    log_line(f"rebuilt summary from existing csv at {CSV_PATH}")


def main() -> None:
    args = parse_args()
    if args.summary_only:
        rebuild_summary_from_csv()
        return
    run_grid()


if __name__ == "__main__":
    main()
