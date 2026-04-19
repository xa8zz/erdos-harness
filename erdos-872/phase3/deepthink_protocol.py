from __future__ import annotations

import argparse
import bisect
import csv
import json
import math
import time
from pathlib import Path
from typing import Any


ROOT = Path("/Users/omisverycool/erdos-harness/erdos-872/phase3")
CSV_PATH = ROOT / "deepthink_protocol.csv"
SUMMARY_PATH = ROOT / "deepthink_protocol_summary.md"
LOG_PATH = ROOT / "logs" / "deepthink_protocol.log"

N_VALUES = (1000, 3000, 10000, 30000, 100000, 300000, 1000000)
SHORTENERS = ("S_race", "S_smallest_legal_prime", "S_smallest_legal")


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


def floor_power_fraction(n: int, numerator: int, denominator: int) -> int:
    target = n**numerator
    guess = max(1, int(round(n ** (numerator / denominator))))
    while (guess + 1) ** denominator <= target:
        guess += 1
    while guess**denominator > target:
        guess -= 1
    return guess


class DeepThinkContext:
    def __init__(self, n: int):
        if n < 2:
            raise ValueError("n must be at least 2")
        self.n = n
        self.sqrt_n = math.isqrt(n)
        self.y_s = floor_power_fraction(n, 1, 6)
        self.y_m = floor_power_fraction(n, 1, 3)
        self.y_L = floor_power_fraction(n, 5, 6)
        self.spf = build_spf(n)
        self.primes = tuple(value for value in range(2, n + 1) if self.spf[value] == value)
        self.odd_primes = tuple(prime for prime in self.primes if prime % 2 == 1)
        self.prime_flag = bytearray(n + 1)
        for prime in self.primes:
            self.prime_flag[prime] = 1

        self.small_primes = tuple(prime for prime in self.primes if prime <= self.y_s)
        self.padding_primes = tuple(prime for prime in self.primes if self.y_s < prime <= self.y_m)
        self.medium_primes = tuple(prime for prime in self.primes if self.y_m < prime <= self.y_L)
        self.large_primes = tuple(prime for prime in self.primes if self.y_L < prime <= n // 2)
        self.divisor_cache: dict[int, tuple[int, ...]] = {}

    def is_prime(self, value: int) -> bool:
        return 2 <= value <= self.n and bool(self.prime_flag[value])

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

    def count_primes_up_to(self, cutoff: int) -> int:
        return bisect.bisect_right(self.primes, cutoff)


class DeepThinkGame:
    def __init__(self, context: DeepThinkContext, shortener_name: str):
        self.ctx = context
        self.shortener_name = shortener_name

        self.legal = bytearray(context.n + 1)
        for value in range(2, context.n + 1):
            self.legal[value] = 1
        self.played = bytearray(context.n + 1)
        self.legal_count = context.n - 1
        self.played_values: list[int] = []
        self.played_roles: list[str] = []

        self.smallest_pointer = 2
        self.odd_prime_pointer = 0
        self.shortener_small_pointer = 0
        self.shortener_padding_pointer = 0
        self.shortener_medium_pointer = 0
        self.shortener_large_pointer = 0

        self.protocol_phase = 1
        self.phase1_index = 0
        self.phase2_pairs: list[tuple[int, int]] = []
        self.phase2_index = 0
        self.phase3_p_star: int | None = None
        self.phase3_index = 0

        self.phase1_moves = 0
        self.phase2_moves = 0
        self.phase3_moves = 0
        self.phase4_moves = 0
        self.phase1_successful_small = bytearray(context.n + 1)
        self.B_blocked: tuple[int, ...] = tuple()
        self.phase3_blocked_qs: list[int] = []

        self.shortener_large_preempted = bytearray(context.n + 1)
        self.shortener_small_preempted = bytearray(context.n + 1)
        self.shortener_large_primes_preempted = 0
        self.shortener_small_primes_preempted = 0

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

    def _clear_legal(self, value: int) -> None:
        if self.legal[value]:
            self.legal[value] = 0
            self.legal_count -= 1

    def smallest_legal_integer(self) -> int | None:
        while self.smallest_pointer <= self.ctx.n and not self.legal[self.smallest_pointer]:
            self.smallest_pointer += 1
        if self.smallest_pointer > self.ctx.n:
            return None
        return self.smallest_pointer

    def _smallest_legal_from_list(self, values: tuple[int, ...], pointer_name: str) -> int | None:
        index = getattr(self, pointer_name)
        while index < len(values) and not self.legal[values[index]]:
            index += 1
        setattr(self, pointer_name, index)
        if index >= len(values):
            return None
        return values[index]

    def smallest_legal_odd_prime(self) -> int | None:
        return self._smallest_legal_from_list(self.ctx.odd_primes, "odd_prime_pointer")

    def phase1_candidate(self, small_prime: int) -> tuple[int, tuple[int, ...]]:
        block = small_prime
        attached: list[int] = []
        for prime in self.ctx.padding_primes:
            if not self.legal[prime]:
                continue
            if block * prime > self.ctx.sqrt_n:
                break
            block *= prime
            attached.append(prime)
        return block, tuple(attached)

    def phase3_candidate(self, p_star: int, q: int) -> int | None:
        product = p_star * q
        if product > self.ctx.n:
            return None
        return product

    def play_move(self, value: int, role: str, phase_tag: str | None = None, meta: dict[str, Any] | None = None) -> None:
        if not self.verify_move_is_legal(value):
            raise ValueError(f"illegal move {value}")

        for divisor in self.ctx.divisors(value):
            self._clear_legal(divisor)
        for multiple in range(value * 2, self.ctx.n + 1, value):
            self._clear_legal(multiple)

        self.played[value] = 1
        self.played_values.append(value)
        self.played_roles.append(role)

        if role == "shortener":
            self._record_shortener_move(value)
        else:
            self._record_prolonger_move(value, phase_tag, meta or {})

    def _record_shortener_move(self, value: int) -> None:
        if not self.ctx.is_prime(value):
            return
        if self.ctx.y_L < value <= self.ctx.n // 2 and not self.shortener_large_preempted[value]:
            self.shortener_large_preempted[value] = 1
            self.shortener_large_primes_preempted += 1
        if value <= self.ctx.y_s and not self.phase1_successful_small[value] and not self.shortener_small_preempted[value]:
            self.shortener_small_preempted[value] = 1
            self.shortener_small_primes_preempted += 1

    def _record_prolonger_move(self, value: int, phase_tag: str | None, meta: dict[str, Any]) -> None:
        if phase_tag == "phase1":
            self.phase1_moves += 1
            self.phase1_successful_small[meta["small_prime"]] = 1
        elif phase_tag == "phase2":
            self.phase2_moves += 1
        elif phase_tag == "phase3":
            self.phase3_moves += 1
            self.phase3_blocked_qs.append(meta["q"])
        elif phase_tag == "phase4":
            self.phase4_moves += 1

    def _finalize_phase1(self) -> None:
        self.B_blocked = tuple(prime for prime in self.ctx.small_primes if self.phase1_successful_small[prime])
        self.phase2_pairs = []
        for left_index, left in enumerate(self.B_blocked):
            for right in self.B_blocked[left_index + 1 :]:
                self.phase2_pairs.append((left, right))
        self.phase2_index = 0
        self.protocol_phase = 2
        log_line(
            f"n={self.ctx.n} shortener={self.shortener_name} phase1 complete: "
            f"B_blocked={self.B_blocked or tuple()} phase1_moves={self.phase1_moves}"
        )

    def _finalize_phase2(self) -> None:
        self.phase3_p_star = self.B_blocked[0] if self.B_blocked else None
        self.phase3_index = 0
        self.protocol_phase = 3
        log_line(
            f"n={self.ctx.n} shortener={self.shortener_name} phase2 complete: "
            f"phase2_moves={self.phase2_moves} p_star={self.phase3_p_star}"
        )

    def choose_shortener_move(self) -> int | None:
        if self.shortener_name == "S_race":
            move = self._smallest_legal_from_list(self.ctx.large_primes, "shortener_large_pointer")
            if move is not None:
                return move
            move = self._smallest_legal_from_list(self.ctx.small_primes, "shortener_small_pointer")
            if move is not None:
                return move
            move = self._smallest_legal_from_list(self.ctx.medium_primes, "shortener_medium_pointer")
            if move is not None:
                return move
            move = self._smallest_legal_from_list(self.ctx.padding_primes, "shortener_padding_pointer")
            if move is not None:
                return move
            return self.smallest_legal_integer()
        if self.shortener_name == "S_smallest_legal_prime":
            return self.smallest_legal_odd_prime() or self.smallest_legal_integer()
        if self.shortener_name == "S_smallest_legal":
            return self.smallest_legal_integer()
        raise ValueError(f"unknown shortener strategy {self.shortener_name}")

    def choose_prolonger_move(self) -> tuple[int | None, str | None, dict[str, Any]]:
        while True:
            if self.protocol_phase == 1:
                while self.phase1_index < len(self.ctx.small_primes):
                    small_prime = self.ctx.small_primes[self.phase1_index]
                    self.phase1_index += 1
                    if not self.legal[small_prime]:
                        log_line(
                            f"n={self.ctx.n} shortener={self.shortener_name} phase1 skip p={small_prime}: carrier not legal"
                        )
                        continue
                    block, attached = self.phase1_candidate(small_prime)
                    if not attached:
                        log_line(
                            f"n={self.ctx.n} shortener={self.shortener_name} phase1 skip p={small_prime}: no padding fits"
                        )
                        continue
                    if self.verify_move_is_legal(block):
                        return block, "phase1", {"small_prime": small_prime}
                    log_line(
                        f"n={self.ctx.n} shortener={self.shortener_name} phase1 skip p={small_prime}: block={block} illegal"
                    )
                self._finalize_phase1()
                continue

            if self.protocol_phase == 2:
                while self.phase2_index < len(self.phase2_pairs):
                    left, right = self.phase2_pairs[self.phase2_index]
                    self.phase2_index += 1
                    candidate = left * right
                    if candidate <= self.ctx.n and self.verify_move_is_legal(candidate):
                        return candidate, "phase2", {"pair": (left, right)}
                self._finalize_phase2()
                continue

            if self.protocol_phase == 3:
                if self.phase3_p_star is None:
                    self.protocol_phase = 4
                    continue
                while self.phase3_index < len(self.ctx.large_primes):
                    q = self.ctx.large_primes[self.phase3_index]
                    self.phase3_index += 1
                    candidate = self.phase3_candidate(self.phase3_p_star, q)
                    if candidate is None:
                        break
                    if self.verify_move_is_legal(candidate):
                        return candidate, "phase3", {"q": q}
                self.protocol_phase = 4
                log_line(
                    f"n={self.ctx.n} shortener={self.shortener_name} phase3 complete: "
                    f"phase3_moves={self.phase3_moves}"
                )
                continue

            move = self.smallest_legal_integer()
            if move is None:
                return None, None, {}
            return move, "phase4", {}

    def replay_legal_map(self) -> bytearray:
        legal = bytearray(self.ctx.n + 1)
        for value in range(2, self.ctx.n + 1):
            legal[value] = 1
        for value in self.played_values:
            if not legal[value]:
                raise AssertionError(f"replay found illegal move {value}")
            for divisor in self.ctx.divisors(value):
                legal[divisor] = 0
            for multiple in range(value * 2, self.ctx.n + 1, value):
                legal[multiple] = 0
        return legal

    def assert_replay_consistent(self) -> None:
        replay = self.replay_legal_map()
        if replay != self.legal:
            raise AssertionError("legal-map mismatch against replay")
        if any(replay[2:]):
            raise AssertionError("final position is not maximal")

    def measurements(self, wall_seconds: float) -> dict[str, Any]:
        L = len(self.played_values)
        log_n = math.log(self.ctx.n)
        log_log_n = math.log(log_n)
        return {
            "n": self.ctx.n,
            "shortener": self.shortener_name,
            "L": L,
            "L_log_n_over_n": L * log_n / self.ctx.n,
            "L_log_n_over_n_loglog_n": L * log_n / (self.ctx.n * log_log_n),
            "phase1_moves": self.phase1_moves,
            "phase2_moves": self.phase2_moves,
            "phase3_moves": self.phase3_moves,
            "phase4_moves": self.phase4_moves,
            "B_blocked_size": len(self.B_blocked),
            "Q_blocked_size": len(self.phase3_blocked_qs),
            "shortener_large_primes_preempted": self.shortener_large_primes_preempted,
            "shortener_small_primes_preempted": self.shortener_small_primes_preempted,
            "wall_seconds": wall_seconds,
        }


def play_match(
    context: DeepThinkContext,
    shortener: str,
    *,
    return_game: bool = False,
) -> dict[str, Any] | tuple[dict[str, Any], DeepThinkGame]:
    game = DeepThinkGame(context, shortener)
    start = time.perf_counter()
    turn = "prolonger"
    while True:
        if turn == "prolonger":
            move, phase_tag, meta = game.choose_prolonger_move()
            if move is None:
                break
            game.play_move(move, role="prolonger", phase_tag=phase_tag, meta=meta)
            turn = "shortener"
        else:
            move = game.choose_shortener_move()
            if move is None:
                break
            game.play_move(move, role="shortener")
            turn = "prolonger"
    wall_seconds = time.perf_counter() - start
    game.assert_replay_consistent()
    result = game.measurements(wall_seconds)
    if return_game:
        return result, game
    return result


def write_csv_rows(rows: list[dict[str, Any]]) -> None:
    fieldnames = [
        "n",
        "shortener",
        "L",
        "L_log_n_over_n",
        "L_log_n_over_n_loglog_n",
        "phase1_moves",
        "phase2_moves",
        "phase3_moves",
        "phase4_moves",
        "B_blocked_size",
        "Q_blocked_size",
        "shortener_large_primes_preempted",
        "shortener_small_primes_preempted",
    ]
    with CSV_PATH.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow({key: row[key] for key in fieldnames})


def ratio_or_zero(numerator: int, denominator: int) -> float:
    if denominator == 0:
        return 0.0
    return numerator / denominator


def is_flat(values: list[float], tolerance: float = 1.18) -> bool:
    if not values:
        return False
    positive = [value for value in values if value > 0.0]
    if not positive:
        return False
    return max(positive) / min(positive) <= tolerance


def build_summary(rows: list[dict[str, Any]]) -> str:
    context_by_n = {row["n"]: DeepThinkContext(int(row["n"])) for row in rows}
    table_lines = [
        "| n | shortener | L log n / n | L log n / (n log log n) | B_blocked / pi(y_s) | Q_blocked / (pi(n/2)-pi(y_L)) |",
        "| --- | --- | ---: | ---: | ---: | ---: |",
    ]
    for row in rows:
        context = context_by_n[int(row["n"])]
        b_ratio = ratio_or_zero(int(row["B_blocked_size"]), len(context.small_primes))
        q_ratio = ratio_or_zero(int(row["Q_blocked_size"]), len(context.large_primes))
        table_lines.append(
            "| "
            + " | ".join(
                [
                    str(row["n"]),
                    str(row["shortener"]),
                    f"{float(row['L_log_n_over_n']):.6f}",
                    f"{float(row['L_log_n_over_n_loglog_n']):.6f}",
                    f"{b_ratio:.6f}",
                    f"{q_ratio:.6f}",
                ]
            )
            + " |"
        )

    race_rows = [row for row in rows if row["shortener"] == "S_race"]
    race_rows.sort(key=lambda row: int(row["n"]))
    race_log = [float(row["L_log_n_over_n"]) for row in race_rows]
    race_loglog = [float(row["L_log_n_over_n_loglog_n"]) for row in race_rows]
    tail_log = race_log[-3:]
    tail_loglog = race_loglog[-3:]
    race_b_ratios = [
        ratio_or_zero(int(row["B_blocked_size"]), len(context_by_n[int(row["n"])].small_primes))
        for row in race_rows
    ]
    race_q_ratios = [
        ratio_or_zero(int(row["Q_blocked_size"]), len(context_by_n[int(row["n"])].large_primes))
        for row in race_rows
    ]

    if is_flat(tail_loglog):
        verdict = "Consistent with Theta(n log log n / log n)"
        race_behavior = (
            "For `S_race`, `L log n / (n log log n)` is roughly flat on the largest three n values, "
            f"with empirical constant about {sum(tail_loglog) / len(tail_loglog):.3f}."
        )
    elif tail_loglog[-1] < tail_loglog[0] * 0.85 and is_flat(tail_log):
        verdict = "Consistent with Theta(n / log n)"
        race_behavior = (
            "For `S_race`, the loglog-normalized statistic decays on the largest three n values, while "
            f"`L log n / n` is roughly flat with empirical constant about {sum(tail_log) / len(tail_log):.3f}."
        )
    else:
        verdict = "Inconclusive"
        race_behavior = (
            "For `S_race`, neither normalization is cleanly flat at this scale. "
            f"Tail values are log-only={tail_log} and loglog-normalized={tail_loglog}."
        )

    ratio_lines = []
    for row in race_rows:
        context = context_by_n[int(row["n"])]
        b_ratio = ratio_or_zero(int(row["B_blocked_size"]), len(context.small_primes))
        q_ratio = ratio_or_zero(int(row["Q_blocked_size"]), len(context.large_primes))
        ratio_lines.append(
            f"- n = {row['n']}: |B_blocked|/pi(y_s) = {b_ratio:.3f}, "
            f"|Q_blocked|/(pi(n/2)-pi(y_L)) = {q_ratio:.3f}"
        )

    lines = [
        "# DeepThink Protocol Summary",
        "",
        "Convention: thresholds use exact integer floors of rational powers, so this implementation takes "
        f"`y_s = floor(n^(1/6))`, `y_m = floor(n^(1/3))`, `y_L = floor(n^(5/6))`. "
        f"In particular, at `n = 1000` we get `(y_s, y_m, y_L) = ({context_by_n[1000].y_s}, {context_by_n[1000].y_m}, {context_by_n[1000].y_L})`.",
        "",
        "## Results Table",
        "",
        *table_lines,
        "",
        "## S_race Stabilization Check",
        "",
        race_behavior,
        (
            "Across the full grid, `L log n / n` drifts from "
            f"{race_log[0]:.3f} to {race_log[-1]:.3f}, while `L log n / (n log log n)` drifts from "
            f"{race_loglog[0]:.3f} to {race_loglog[-1]:.3f}."
        ),
        "",
        f"Top-line verdict: **{verdict}**.",
        "",
        "## Blocked-Set Ratios for S_race",
        "",
        *ratio_lines,
        "",
        (
            "Mechanism check: the large-prime blocked ratio is very close to the predicted `1/2`, but the small-prime "
            f"blocked ratio is not. Empirically, `|B_blocked|/pi(y_s)` stays in the range "
            f"[{min(race_b_ratios):.3f}, {max(race_b_ratios):.3f}] while the large-prime ratio stays in "
            f"[{min(race_q_ratios):.3f}, {max(race_q_ratios):.3f}]."
        ),
        "",
        "## Notes",
        "",
        "- `phase1_moves`, `phase2_moves`, `phase3_moves`, and `phase4_moves` count successful Prolonger moves in those phases only.",
        "- `B_blocked_size` is the number of small-prime carriers successfully realized in Phase 1; `Q_blocked_size` is the number of successful Phase 3 large-prime blocks.",
        "- In this implementation, a padding prime used inside a successful Phase 1 block is automatically illegal afterwards because it divides the played block, so the Shortener's padding-steal priority is equivalent to 'smallest currently legal padding prime'.",
        "- Every completed run replay-verifies the final legal map, which simultaneously checks the played history stayed an antichain and the terminal position is maximal.",
    ]
    return "\n".join(lines) + "\n"


def run_grid() -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    LOG_PATH.parent.mkdir(parents=True, exist_ok=True)
    log_line("starting deepthink protocol grid")
    for n in N_VALUES:
        context = DeepThinkContext(n)
        log_line(
            f"n={n} thresholds=(y_s={context.y_s}, y_m={context.y_m}, y_L={context.y_L}) "
            f"small={len(context.small_primes)} padding={len(context.padding_primes)} large={len(context.large_primes)}"
        )
        for shortener in SHORTENERS:
            log_line(f"start n={n} shortener={shortener}")
            result = play_match(context, shortener)
            rows.append(result)
            log_line(
                f"done n={n} shortener={shortener} "
                f"L={result['L']} phase1={result['phase1_moves']} phase2={result['phase2_moves']} "
                f"phase3={result['phase3_moves']} phase4={result['phase4_moves']} "
                f"B_blocked={result['B_blocked_size']} Q_blocked={result['Q_blocked_size']}"
            )
    return rows


def rebuild_summary_from_csv() -> None:
    with CSV_PATH.open(newline="", encoding="utf-8") as handle:
        rows = list(csv.DictReader(handle))
    for row in rows:
        row["n"] = int(row["n"])
        for key in (
            "L",
            "phase1_moves",
            "phase2_moves",
            "phase3_moves",
            "phase4_moves",
            "B_blocked_size",
            "Q_blocked_size",
            "shortener_large_primes_preempted",
            "shortener_small_primes_preempted",
        ):
            row[key] = int(row[key])
        for key in ("L_log_n_over_n", "L_log_n_over_n_loglog_n"):
            row[key] = float(row[key])
    SUMMARY_PATH.write_text(build_summary(rows), encoding="utf-8")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="DeepThink protocol empirical falsifier")
    parser.add_argument("--n", type=int, help="run a single n value")
    parser.add_argument("--shortener", choices=SHORTENERS, help="run a single shortener")
    parser.add_argument("--json", action="store_true", help="print single-run output as JSON")
    parser.add_argument("--rebuild-summary", action="store_true", help="rebuild summary from existing CSV")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    if args.rebuild_summary:
        rebuild_summary_from_csv()
        return

    if args.n is not None:
        if args.shortener is None:
            raise SystemExit("--shortener is required with --n")
        result = play_match(DeepThinkContext(args.n), args.shortener)
        if args.json:
            print(json.dumps(result, indent=2, sort_keys=True))
            return
        print(json.dumps(result, indent=2))
        return

    rows = run_grid()
    write_csv_rows(rows)
    SUMMARY_PATH.write_text(build_summary(rows), encoding="utf-8")


if __name__ == "__main__":
    main()
