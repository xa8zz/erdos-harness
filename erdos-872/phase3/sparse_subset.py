from __future__ import annotations

import argparse
import bisect
import csv
import heapq
import json
import math
import time
from fractions import Fraction
from pathlib import Path
from typing import Any


ROOT = Path("/Users/omisverycool/erdos-harness/erdos-872/phase3")
CSV_PATH = ROOT / "sparse_subset.csv"
SUMMARY_PATH = ROOT / "sparse_subset_summary.md"
LOG_PATH = ROOT / "logs" / "sparse_subset.log"

N_VALUES = (10_000, 30_000, 100_000, 300_000, 1_000_000)
PARAM_PAIRS = ((0.35, 0.45), (0.40, 0.49))
GREEDY_TARGET_FRACTIONS = (Fraction(1, 10), Fraction(1, 5), Fraction(1, 2), Fraction(1, 1))
GREEDY_SEED_K = 10


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


def floor_power_fraction(n: int, exponent: Fraction) -> int:
    numerator = exponent.numerator
    denominator = exponent.denominator
    target = n**numerator
    guess = max(1, int(n ** float(exponent)))
    while (guess + 1) ** denominator <= target:
        guess += 1
    while guess**denominator > target:
        guess -= 1
    return guess


def ceil_power_fraction(n: int, exponent: Fraction) -> int:
    floor_value = floor_power_fraction(n, exponent)
    numerator = exponent.numerator
    denominator = exponent.denominator
    if floor_value**denominator == n**numerator:
        return floor_value
    return floor_value + 1


def format_fraction(frac: Fraction) -> str:
    return f"{float(frac):.2f}"


def ratio_value(numerator: int, denominator: int) -> float:
    if denominator <= 0:
        return math.inf
    return numerator / denominator


def normalized_ratio(numerator: int, denominator: int, n: int) -> float:
    if denominator <= 0:
        return math.inf
    return (numerator / denominator) * math.log(math.log(n))


def is_isolated(requirements: tuple[int, int, int], selected: set[int]) -> bool:
    return all(carrier in selected for carrier in requirements)


def verify_antichain(values: set[int] | list[int] | tuple[int, ...], limit: int) -> bool:
    seen = bytearray(limit + 1)
    ordered = sorted(values)
    for value in ordered:
        if value < 2 or value > limit:
            return False
        if seen[value]:
            return False
        seen[value] = 1
    for value in ordered:
        for multiple in range(value * 2, limit + 1, value):
            if seen[multiple]:
                return False
    return True


class SparseSubsetContext:
    def __init__(self, n: int):
        if n < 2:
            raise ValueError("n must be at least 2")
        self.n = n
        self.spf = build_spf(n)
        self.primes = tuple(value for value in range(2, n + 1) if self.spf[value] == value)
        self.odd_primes = tuple(prime for prime in self.primes if prime % 2 == 1)
        self.full_carrier_count = self._count_full_carrier_family()

    def _count_full_carrier_family(self) -> int:
        total = 0
        for index, a in enumerate(self.odd_primes):
            max_b = self.n // (2 * a)
            if max_b <= a:
                break
            hi = bisect.bisect_right(self.odd_primes, max_b)
            total += max(0, hi - (index + 1))
        return total


class SparseSubsetInstance:
    def __init__(self, context: SparseSubsetContext, beta: float | Fraction, gamma: float | Fraction):
        self.context = context
        self.beta = beta if isinstance(beta, Fraction) else Fraction(str(beta))
        self.gamma = gamma if isinstance(gamma, Fraction) else Fraction(str(gamma))
        self.delta = self.beta / 2
        self.beta_label = format_fraction(self.beta)
        self.gamma_label = format_fraction(self.gamma)
        self.delta_label = format_fraction(self.delta)

        q_min = ceil_power_fraction(context.n, self.beta)
        q_max = floor_power_fraction(context.n, self.gamma)
        q_left = bisect.bisect_left(context.primes, q_min)
        q_right = bisect.bisect_right(context.primes, q_max)
        self.Q = context.primes[q_left:q_right]

        a_max = floor_power_fraction(context.n, self.delta)
        a_right = bisect.bisect_right(context.odd_primes, a_max)
        self.A = context.odd_primes[:a_right]

        self.m_requirements = self._enumerate_mq()
        self.m_values = tuple(sorted(self.m_requirements))
        self.carrier_values = tuple(sorted({carrier for req in self.m_requirements.values() for carrier in req}))
        self.carrier_index = {carrier: index for index, carrier in enumerate(self.carrier_values)}
        self.m_carrier_ids: list[tuple[int, int, int]] = []
        self.carrier_to_m: list[list[int]] = [[] for _ in self.carrier_values]
        for m_index, m in enumerate(self.m_values):
            carrier_ids = tuple(self.carrier_index[carrier] for carrier in self.m_requirements[m])
            self.m_carrier_ids.append(carrier_ids)
            for carrier_id in carrier_ids:
                self.carrier_to_m[carrier_id].append(m_index)
        self.degrees = [len(members) for members in self.carrier_to_m]
        self.degree_order = sorted(
            range(len(self.carrier_values)),
            key=lambda carrier_id: (-self.degrees[carrier_id], self.carrier_values[carrier_id]),
        )

    def _enumerate_mq(self) -> dict[int, tuple[int, int, int]]:
        out: dict[int, tuple[int, int, int]] = {}
        odd_primes = self.context.odd_primes
        for q in self.Q:
            max_a = math.isqrt(self.context.n // q)
            a_hi = bisect.bisect_right(odd_primes, max_a)
            for a_index in range(a_hi):
                a = odd_primes[a_index]
                if a == q:
                    continue
                lower = max(a + 1, (self.context.n // (3 * q * a)) + 1)
                upper = self.context.n // (q * a)
                if lower > upper:
                    continue
                b_left = bisect.bisect_left(odd_primes, lower)
                b_right = bisect.bisect_right(odd_primes, upper)
                for b in odd_primes[b_left:b_right]:
                    if b == q or b == a or b <= a:
                        continue
                    m = q * a * b
                    if m <= self.context.n // 3 or m > self.context.n:
                        continue
                    factors = tuple(sorted((q, a, b)))
                    requirements = tuple(
                        sorted(
                            (
                                2 * factors[0] * factors[1],
                                2 * factors[0] * factors[2],
                                2 * factors[1] * factors[2],
                            )
                        )
                    )
                    prior = out.get(m)
                    if prior is None:
                        out[m] = requirements
                    elif prior != requirements:
                        raise AssertionError(f"inconsistent req(m) for {m}: {prior} vs {requirements}")
        return out

    def build_explicit_subset(self) -> set[int]:
        selected: set[int] = set()
        odd_primes = self.context.odd_primes
        for a in self.A:
            for q in self.Q:
                carrier = 2 * q * a
                if carrier <= self.context.n:
                    selected.add(carrier)
                lower = (self.context.n // (3 * q * a)) + 1
                upper = self.context.n // (q * a)
                if lower > upper:
                    continue
                b_left = bisect.bisect_left(odd_primes, lower)
                b_right = bisect.bisect_right(odd_primes, upper)
                for b in odd_primes[b_left:b_right]:
                    if b == a or b == q:
                        continue
                    selected.add(2 * a * b)
                    selected.add(2 * q * b)
        return selected

    def covered_count(self, selected: set[int]) -> int:
        count = 0
        for m in self.m_values:
            if is_isolated(self.m_requirements[m], selected):
                count += 1
        return count

    def greedy_trajectory(self, seed_k: int = GREEDY_SEED_K) -> tuple[list[int], list[tuple[int, int]]]:
        carrier_count = len(self.carrier_values)
        m_count = len(self.m_values)
        if carrier_count == 0 or m_count == 0:
            return [], [(0, 0)]

        selected = bytearray(carrier_count)
        cover_count = bytearray(m_count)
        current_gain = [0] * carrier_count
        versions = [0] * carrier_count
        heap: list[tuple[int, int, int, int]] = []
        selected_order: list[int] = []
        history: list[tuple[int, int]] = [(0, 0)]
        covered_total = 0
        bootstrap_index = 0

        def push(carrier_id: int) -> None:
            heapq.heappush(
                heap,
                (
                    -current_gain[carrier_id],
                    -self.degrees[carrier_id],
                    self.carrier_values[carrier_id],
                    versions[carrier_id],
                    carrier_id,
                ),
            )

        def update_gain(carrier_id: int, delta: int) -> None:
            if selected[carrier_id]:
                return
            current_gain[carrier_id] += delta
            versions[carrier_id] += 1
            push(carrier_id)

        def select_carrier(carrier_id: int) -> None:
            nonlocal covered_total
            if selected[carrier_id]:
                return
            selected[carrier_id] = 1
            selected_order.append(carrier_id)
            for m_index in self.carrier_to_m[carrier_id]:
                prior = cover_count[m_index]
                if prior >= 3:
                    continue
                cover_count[m_index] = prior + 1
                if prior == 1:
                    for other_carrier in self.m_carrier_ids[m_index]:
                        if other_carrier != carrier_id and not selected[other_carrier]:
                            update_gain(other_carrier, 1)
                            break
                elif prior == 2:
                    covered_total += 1
            history.append((len(selected_order), covered_total))

        for carrier_id in range(carrier_count):
            push(carrier_id)

        initial_seed = min(seed_k, carrier_count)
        for _ in range(initial_seed):
            while bootstrap_index < carrier_count and selected[self.degree_order[bootstrap_index]]:
                bootstrap_index += 1
            if bootstrap_index >= carrier_count:
                break
            select_carrier(self.degree_order[bootstrap_index])
            bootstrap_index += 1

        while covered_total < m_count and len(selected_order) < carrier_count:
            while heap:
                neg_gain, _, _, version, carrier_id = heap[0]
                if selected[carrier_id] or version != versions[carrier_id] or -neg_gain != current_gain[carrier_id]:
                    heapq.heappop(heap)
                    continue
                break
            if heap and current_gain[heap[0][4]] > 0:
                carrier_id = heapq.heappop(heap)[4]
                select_carrier(carrier_id)
                continue
            while bootstrap_index < carrier_count and selected[self.degree_order[bootstrap_index]]:
                bootstrap_index += 1
            if bootstrap_index >= carrier_count:
                break
            select_carrier(self.degree_order[bootstrap_index])
            bootstrap_index += 1

        return selected_order, history

    def greedy_row_for_target(
        self,
        method_label: str,
        target: int,
        selected_order: list[int],
        history: list[tuple[int, int]],
    ) -> dict[str, Any]:
        if not self.m_values:
            return {
                "method": method_label,
                "S_size": 0,
                "R_covered": 0,
                "selected": set(),
            }
        for s_size, covered in history:
            if covered >= target:
                selected = {self.carrier_values[carrier_id] for carrier_id in selected_order[:s_size]}
                return {
                    "method": method_label,
                    "S_size": s_size,
                    "R_covered": covered,
                    "selected": selected,
                }
        selected = {self.carrier_values[carrier_id] for carrier_id in selected_order}
        return {
            "method": method_label,
            "S_size": len(selected),
            "R_covered": history[-1][1],
            "selected": selected,
        }


def run_instance(instance: SparseSubsetInstance) -> list[dict[str, Any]]:
    log_line(
        f"start n={instance.context.n} beta={instance.beta_label} gamma={instance.gamma_label} delta={instance.delta_label} "
        f"|Q|={len(instance.Q)} |A|={len(instance.A)} |M_Q|={len(instance.m_values)} |U_carr|={len(instance.carrier_values)} "
        f"|E_Q|={instance.context.full_carrier_count}"
    )
    if not verify_antichain(set(instance.carrier_values), instance.context.n):
        raise AssertionError("carrier universe is not an antichain")

    rows: list[dict[str, Any]] = []
    log_log_n = math.log(math.log(instance.context.n))

    selected_order, history = instance.greedy_trajectory()
    if instance.m_values:
        targets = [
            (
                f"greedy_R=|M_Q|/{fraction.denominator}" if fraction.numerator == 1 and fraction.denominator != 1 else "greedy_R=|M_Q|",
                max(1, math.ceil(len(instance.m_values) * float(fraction))),
            )
            for fraction in GREEDY_TARGET_FRACTIONS
        ]
    else:
        targets = [("greedy_R=|M_Q|/10", 0), ("greedy_R=|M_Q|/5", 0), ("greedy_R=|M_Q|/2", 0), ("greedy_R=|M_Q|", 0)]
    for method_label, target in targets:
        result = instance.greedy_row_for_target(method_label, target, selected_order, history)
        selected = result.pop("selected")
        if not verify_antichain(selected, instance.context.n):
            raise AssertionError(f"greedy subset failed antichain check for target {target}")
        ratio = ratio_value(result["S_size"], result["R_covered"])
        rows.append(
            {
                "n": instance.context.n,
                "beta": instance.beta_label,
                "gamma": instance.gamma_label,
                **result,
                "ratio": ratio,
                "ratio_times_loglog_n": ratio * log_log_n if math.isfinite(ratio) else math.inf,
                "|M_Q|": len(instance.m_values),
                "|U_carr|": len(instance.carrier_values),
            }
        )
        log_line(
            f"done greedy n={instance.context.n} beta={instance.beta_label} gamma={instance.gamma_label} "
            f"method={method_label} target={target} S={result['S_size']} R={result['R_covered']} ratio={ratio:.6f}"
        )

    explicit_selected = instance.build_explicit_subset()
    if not verify_antichain(explicit_selected, instance.context.n):
        raise AssertionError("explicit subset failed antichain check")
    explicit_covered = instance.covered_count(explicit_selected)
    explicit_ratio = ratio_value(len(explicit_selected), explicit_covered)
    rows.append(
        {
            "n": instance.context.n,
            "beta": instance.beta_label,
            "gamma": instance.gamma_label,
            "method": "explicit",
            "S_size": len(explicit_selected),
            "R_covered": explicit_covered,
            "ratio": explicit_ratio,
            "ratio_times_loglog_n": explicit_ratio * log_log_n if math.isfinite(explicit_ratio) else math.inf,
            "|M_Q|": len(instance.m_values),
            "|U_carr|": len(instance.carrier_values),
        }
    )
    log_line(
        f"done explicit n={instance.context.n} beta={instance.beta_label} gamma={instance.gamma_label} "
        f"S={len(explicit_selected)} R={explicit_covered} ratio={explicit_ratio:.6f}"
    )
    return rows


def write_csv(rows: list[dict[str, Any]]) -> None:
    fieldnames = [
        "n",
        "beta",
        "gamma",
        "method",
        "S_size",
        "R_covered",
        "ratio",
        "ratio_times_loglog_n",
        "|M_Q|",
        "|U_carr|",
    ]
    with CSV_PATH.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow({key: row[key] for key in fieldnames})


def verdict_from_series(values: list[float]) -> str:
    if not values:
        return "Inconclusive at this scale"
    finite = [value for value in values if math.isfinite(value)]
    if len(finite) < 3:
        return "Inconclusive at this scale"
    tail = finite[-3:]
    if tail[-1] <= tail[0] * 1.05:
        return "Sparse-subset rescue empirically works"
    if tail[-1] >= tail[0] * 1.20:
        return "Sparse-subset rescue does NOT work"
    return "Inconclusive at this scale"


def build_summary(rows: list[dict[str, Any]], e_counts: dict[int, int]) -> str:
    grouped: dict[tuple[str, str], list[dict[str, Any]]] = {}
    for row in rows:
        grouped.setdefault((row["beta"], row["gamma"]), []).append(row)

    table_lines = ["# Sparse Subset Summary", ""]
    for key in sorted(grouped):
        beta, gamma = key
        block = grouped[key]
        methods = sorted({row["method"] for row in block})
        ns = sorted({int(row["n"]) for row in block})
        table_lines.extend(
            [
                f"## (beta, gamma) = ({beta}, {gamma})",
                "",
                "| method | " + " | ".join(str(n) for n in ns) + " |",
                "| --- | " + " | ".join("---:" for _ in ns) + " |",
            ]
        )
        for method in methods:
            row_map = {int(row["n"]): row for row in block if row["method"] == method}
            table_lines.append(
                "| "
                + method
                + " | "
                + " | ".join(f"{float(row_map[n]['ratio_times_loglog_n']):.6f}" for n in ns)
                + " |"
            )
        table_lines.append("")

    best_by_n = []
    for n in sorted(e_counts):
        candidates = [row for row in rows if int(row["n"]) == n and math.isfinite(float(row["ratio_times_loglog_n"]))]
        if not candidates:
            continue
        best = min(candidates, key=lambda row: float(row["ratio_times_loglog_n"]))
        best_by_n.append((n, best))

    verdict = verdict_from_series([float(best["ratio_times_loglog_n"]) for _, best in best_by_n])

    best_explicit_candidates = [
        row for row in rows if row["method"] == "explicit" and int(row["n"]) == 1_000_000 and row["R_covered"] > 0
    ]
    best_explicit = min(best_explicit_candidates, key=lambda row: float(row["ratio"])) if best_explicit_candidates else None

    sanity_lines = []
    for beta, gamma in PARAM_PAIRS:
        beta_label = format_fraction(Fraction(str(beta)))
        gamma_label = format_fraction(Fraction(str(gamma)))
        match = next(
            (
                row
                for row in rows
                if int(row["n"]) == 1_000_000
                and row["beta"] == beta_label
                and row["gamma"] == gamma_label
                and row["method"] == "explicit"
            ),
            None,
        )
        if match is not None:
            sanity_lines.append(
                f"- At n = 10^6 with (beta, gamma) = ({beta_label}, {gamma_label}), "
                f"|M_Q| = {match['|M_Q|']} and |U_carr| = {match['|U_carr|']}."
            )

    e_table = [
        "| n | |E_Q| full count |",
        "| --- | ---: |",
        *[f"| {n} | {e_counts[n]} |" for n in sorted(e_counts)],
    ]

    best_lines = [
        f"- n = {n}: best observed method `{best['method']}` at (beta, gamma) = "
        f"({best['beta']}, {best['gamma']}) gives ratio {(float(best['ratio'])):.6f} and "
        f"(S/R) log log n = {float(best['ratio_times_loglog_n']):.6f}."
        for n, best in best_by_n
    ]

    explicit_line = (
        f"- Best explicit construction at n = 10^6: (beta, gamma) = ({best_explicit['beta']}, {best_explicit['gamma']}), "
        f"S/R = {float(best_explicit['ratio']):.6f}, (S/R) log log n = {float(best_explicit['ratio_times_loglog_n']):.6f}, "
        f"S = {best_explicit['S_size']}, R = {best_explicit['R_covered']}."
        if best_explicit is not None
        else "- No explicit construction covered any M_Q element at n = 10^6."
    )

    lines = [
        *table_lines,
        "## Best Observed Normalized Ratios",
        "",
        *best_lines,
        "",
        f"Top-line verdict: **{verdict}**.",
        "",
        "## Best Explicit Construction",
        "",
        explicit_line,
        "",
        "## Full Carrier Family Context",
        "",
        *e_table,
        "",
        "## Sanity Checks",
        "",
        *sanity_lines,
        "",
        "## Notes",
        "",
        "- Greedy uses one deterministic trajectory per instance: a degree-ordered bootstrap, then lazy marginal-gain updates that count newly completed triples only.",
        "- `R_covered` counts integers m with all three required carriers present; duplicate `(q, {a, b})` representations are deduplicated on the integer m.",
        "- Every reported subset S passes an explicit antichain check.",
    ]
    return "\n".join(lines) + "\n"


def run_grid() -> tuple[list[dict[str, Any]], dict[int, int]]:
    rows: list[dict[str, Any]] = []
    e_counts: dict[int, int] = {}
    log_line("starting sparse-subset grid")
    for n in N_VALUES:
        context = SparseSubsetContext(n)
        e_counts[n] = context.full_carrier_count
        for beta, gamma in PARAM_PAIRS:
            instance = SparseSubsetInstance(context, beta, gamma)
            rows.extend(run_instance(instance))
    return rows, e_counts


def rebuild_summary_from_csv() -> dict[int, int]:
    with CSV_PATH.open(newline="", encoding="utf-8") as handle:
        rows = list(csv.DictReader(handle))
    parsed: list[dict[str, Any]] = []
    for row in rows:
        parsed.append(
            {
                "n": int(row["n"]),
                "beta": row["beta"],
                "gamma": row["gamma"],
                "method": row["method"],
                "S_size": int(row["S_size"]),
                "R_covered": int(row["R_covered"]),
                "ratio": float(row["ratio"]),
                "ratio_times_loglog_n": float(row["ratio_times_loglog_n"]),
                "|M_Q|": int(row["|M_Q|"]),
                "|U_carr|": int(row["|U_carr|"]),
            }
        )
    e_counts = {n: SparseSubsetContext(n).full_carrier_count for n in N_VALUES}
    SUMMARY_PATH.write_text(build_summary(parsed, e_counts), encoding="utf-8")
    return e_counts


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Sparse-subset closeout measurement")
    parser.add_argument("--n", type=int, help="run a single n value")
    parser.add_argument("--beta", type=float, help="single beta value")
    parser.add_argument("--gamma", type=float, help="single gamma value")
    parser.add_argument("--json", action="store_true", help="print single-instance rows as JSON")
    parser.add_argument("--rebuild-summary", action="store_true", help="rebuild the markdown summary from the CSV")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    if args.rebuild_summary:
        rebuild_summary_from_csv()
        return
    if args.n is not None:
        if args.beta is None or args.gamma is None:
            raise SystemExit("--beta and --gamma are required with --n")
        instance = SparseSubsetInstance(SparseSubsetContext(args.n), args.beta, args.gamma)
        rows = run_instance(instance)
        if args.json:
            print(json.dumps(rows, indent=2, sort_keys=True))
        else:
            print(json.dumps(rows, indent=2))
        return
    rows, e_counts = run_grid()
    write_csv(rows)
    SUMMARY_PATH.write_text(build_summary(rows, e_counts), encoding="utf-8")


if __name__ == "__main__":
    main()
