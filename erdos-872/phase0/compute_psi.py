#!/opt/homebrew/bin/python3
from __future__ import annotations

import argparse
import csv
import datetime as dt
import json
import math
import os
import statistics
import time
from collections import Counter, defaultdict
from concurrent.futures import ProcessPoolExecutor, as_completed
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Sequence

import numpy as np
from scipy.optimize import Bounds, LinearConstraint, milp
from scipy.sparse import csr_matrix
from scipy.sparse.csgraph import maximum_flow


ROOT = Path("/Users/omisverycool/erdos-harness/erdos-872/phase0")
LOG_DIR = ROOT / "logs"
STRUCTURAL_DIR = ROOT / "structural"
CSV_PATH = ROOT / "psi_grid.csv"
REPORT_PATH = ROOT / "report.md"
MAIN_LOG = LOG_DIR / "main.log"
ALPHAS = [0.30, 0.40, 0.50, 0.60, 0.70]
DEFAULT_NS = [5000, 10000, 20000]


def log_line(path: Path, message: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    stamp = dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with path.open("a", encoding="utf-8") as handle:
        handle.write(f"[{stamp}] {message}\n")


def build_spf(limit: int) -> list[int]:
    spf = list(range(limit + 1))
    for p in range(2, int(limit**0.5) + 1):
        if spf[p] != p:
            continue
        for q in range(p * p, limit + 1, p):
            if spf[q] == q:
                spf[q] = p
    return spf


def factorize_int(value: int, spf: Sequence[int]) -> list[tuple[int, int]]:
    out: list[tuple[int, int]] = []
    while value > 1:
        prime = spf[value]
        exp = 0
        while value % prime == 0:
            value //= prime
            exp += 1
        out.append((prime, exp))
    return out


def divisors_from_factorization(factors: Sequence[tuple[int, int]]) -> list[int]:
    divisors = [1]
    for prime, exp in factors:
        cur = []
        mult = 1
        for _ in range(exp):
            mult *= prime
            cur.extend(d * mult for d in divisors)
        divisors.extend(cur)
    return divisors


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


def fmt_alpha(alpha: float) -> str:
    return f"{alpha:.2f}"


def fmt_factorization(factors: Sequence[tuple[int, int]]) -> str:
    parts = []
    for prime, exp in factors:
        parts.append(str(prime) if exp == 1 else f"{prime}^{exp}")
    return " * ".join(parts)


def ascii_bar(value: float, upper: float, width: int = 24) -> str:
    if upper <= 0:
        return ""
    filled = max(0, min(width, int(round(width * value / upper))))
    return "#" * filled + "." * (width - filled)


@dataclass(frozen=True)
class StrategyConfig:
    name: str
    top_weight: int
    top_prime: int
    top_count: int
    top_h: int
    top_squarefree: int
    top_omega: int
    top_odd: int


STRATEGIES = [
    StrategyConfig("diverse", top_weight=6, top_prime=4, top_count=4, top_h=4, top_squarefree=2, top_omega=2, top_odd=2),
    StrategyConfig("h_bias", top_weight=4, top_prime=3, top_count=3, top_h=8, top_squarefree=2, top_omega=2, top_odd=0),
    StrategyConfig("squarefree", top_weight=4, top_prime=5, top_count=3, top_h=2, top_squarefree=6, top_omega=5, top_odd=2),
]


class DivisibilityInstance:
    def __init__(self, n: int):
        self.n = n
        self.lower = np.arange(2, n // 2 + 1, dtype=np.int32)
        self.upper = np.arange(n // 2 + 1, n + 1, dtype=np.int32)
        self.lower_count = int(self.lower.size)
        self.upper_count = int(self.upper.size)
        self.weights = np.array([n // x - n // (2 * x) - 1 for x in self.lower], dtype=np.int64)
        self.weight_sum = int(self.weights.sum())
        self.spf = build_spf(n)
        self.is_prime_lower = np.array([self.spf[x] == x for x in self.lower], dtype=bool)
        self.in_h = np.array([(u % 4 == 2) or (3 * u > 2 * n and u % 4 == 0) for u in self.upper], dtype=bool)
        self.is_odd_upper = (self.upper % 2 == 1)

        edge_src: list[int] = []
        edge_dst: list[int] = []
        for idx, x in enumerate(self.lower):
            for y in range(2 * int(x), n // 2 + 1, int(x)):
                edge_src.append(idx)
                edge_dst.append(int(y) - 2)
        self.edge_rows = np.array(edge_src, dtype=np.int32)
        self.edge_cols = np.array([self.lower_count + d for d in edge_dst], dtype=np.int32)
        self.inf_capacity = self.weight_sum + 1

        self.upper_divisors: list[np.ndarray] = []
        upper_multiples = [[] for _ in range(self.lower_count)]
        factorization_map: dict[int, list[tuple[int, int]]] = {}
        omega = []
        squarefree = []
        divisor_counts = []
        divisor_weight = []
        prime_cover_weight = []

        for upper_idx, u in enumerate(self.upper):
            factors = factorize_int(int(u), self.spf)
            factorization_map[int(u)] = factors
            divisors = [d for d in divisors_from_factorization(factors) if 2 <= d <= n // 2]
            divisors.sort()
            div_idx = np.array([d - 2 for d in divisors], dtype=np.int32)
            self.upper_divisors.append(div_idx)
            for lower_idx in div_idx:
                upper_multiples[int(lower_idx)].append(upper_idx)
            omega.append(len(factors))
            squarefree.append(all(exp == 1 for _, exp in factors))
            divisor_counts.append(int(div_idx.size))
            divisor_weight.append(int(self.weights[div_idx].sum()) if div_idx.size else 0)
            prime_cover_weight.append(int(self.weights[div_idx[self.is_prime_lower[div_idx]]].sum()) if div_idx.size else 0)

        self.factorization_map = factorization_map
        self.omega_upper = np.array(omega, dtype=np.int16)
        self.squarefree_upper = np.array(squarefree, dtype=bool)
        self.divisor_counts = np.array(divisor_counts, dtype=np.int32)
        self.base_score_weight = np.array(divisor_weight, dtype=np.int64)
        self.base_score_prime = np.array(prime_cover_weight, dtype=np.int64)
        self.upper_multiples_by_lower = [np.array(v, dtype=np.int32) for v in upper_multiples]
        self.population_stats = {
            "mean_omega": float(np.mean(self.omega_upper)),
            "squarefree_fraction": float(np.mean(self.squarefree_upper)),
            "h_fraction": float(np.mean(self.in_h)),
            "mean_divisor_count": float(np.mean(self.divisor_counts)),
        }

    def beta_from_active(self, active_mask: np.ndarray) -> int:
        active_w = self.weights * active_mask.astype(np.int64)
        total = int(active_w.sum())
        if total == 0:
            return 0
        s = 2 * self.lower_count
        t = s + 1
        left = np.arange(self.lower_count, dtype=np.int32)
        right = self.lower_count + left
        rows = np.concatenate(
            [np.full(self.lower_count, s, dtype=np.int32), right, self.edge_rows]
        )
        cols = np.concatenate(
            [left, np.full(self.lower_count, t, dtype=np.int32), self.edge_cols]
        )
        data = np.concatenate(
            [
                active_w,
                active_w,
                np.full(self.edge_rows.size, self.inf_capacity, dtype=np.int64),
            ]
        )
        cap = csr_matrix((data, (rows, cols)), shape=(2 * self.lower_count + 2, 2 * self.lower_count + 2), dtype=np.int64)
        result = maximum_flow(cap, s, t)
        return total - int(result.flow_value)

    def beta(self, shields: Sequence[int]) -> int:
        active = np.ones(self.lower_count, dtype=bool)
        for u in shields:
            div_idx = self.upper_divisors[int(u) - (self.n // 2 + 1)]
            active[div_idx] = False
        return self.beta_from_active(active)

    def apply_shield(self, active: np.ndarray, score_weight: np.ndarray, score_prime: np.ndarray, score_count: np.ndarray, upper_idx: int) -> np.ndarray:
        newly_deleted = self.upper_divisors[upper_idx][active[self.upper_divisors[upper_idx]]]
        if newly_deleted.size == 0:
            return newly_deleted
        active[newly_deleted] = False
        for lower_idx in newly_deleted:
            impacted = self.upper_multiples_by_lower[int(lower_idx)]
            if impacted.size == 0:
                continue
            score_weight[impacted] -= self.weights[int(lower_idx)]
            score_count[impacted] -= 1
            if self.is_prime_lower[int(lower_idx)]:
                score_prime[impacted] -= self.weights[int(lower_idx)]
        return newly_deleted

    def candidate_pool(self, selected: np.ndarray, score_weight: np.ndarray, score_prime: np.ndarray, score_count: np.ndarray, config: StrategyConfig) -> list[int]:
        available = (~selected) & (score_weight > 0)
        pool: set[int] = set()
        pool.update(top_indices(score_weight, available, config.top_weight))
        pool.update(top_indices(score_prime, available, config.top_prime))
        pool.update(top_indices(score_count.astype(np.int64), available, config.top_count))
        pool.update(top_indices(score_weight, available & self.in_h, config.top_h))
        pool.update(top_indices(score_weight, available & self.squarefree_upper, config.top_squarefree))
        pool.update(top_indices(score_weight + 2 * score_prime, available & (self.omega_upper >= 3), config.top_omega))
        pool.update(top_indices(score_weight, available & self.is_odd_upper, config.top_odd))
        return sorted(pool)

    def shield_payload(self, upper_idx: int) -> dict:
        value = int(self.upper[upper_idx])
        factors = self.factorization_map[value]
        return {
            "value": value,
            "factorization": {str(p): int(e) for p, e in factors},
            "factorization_str": fmt_factorization(factors),
            "distinct_primes": [int(p) for p, _ in factors],
            "omega": len(factors),
            "squarefree": all(exp == 1 for _, exp in factors),
            "in_H_n": bool(self.in_h[upper_idx]),
            "divisor_count_in_L": int(self.divisor_counts[upper_idx]),
            "divisor_weight_sum_in_L": int(self.base_score_weight[upper_idx]),
            "mod_4": value % 4,
            "mod_12": value % 12,
        }


def run_strategy(task: tuple[int, int, StrategyConfig]) -> dict:
    n, k_max, config = task
    instance = DivisibilityInstance(n)
    log_path = LOG_DIR / f"trajectory_n{n}_{config.name}.log"
    log_line(log_path, f"start n={n} strategy={config.name} k_max={k_max}")
    start = time.perf_counter()

    selected = np.zeros(instance.upper_count, dtype=bool)
    active = np.ones(instance.lower_count, dtype=bool)
    score_weight = instance.base_score_weight.copy()
    score_prime = instance.base_score_prime.copy()
    score_count = instance.divisor_counts.copy()
    chosen: list[int] = []
    beta_history = [instance.beta_from_active(active)]
    elapsed_history = [0.0]

    for step in range(1, k_max + 1):
        pool = instance.candidate_pool(selected, score_weight, score_prime, score_count, config)
        if not pool:
            log_line(log_path, f"step={step} no useful candidates remain; freezing at beta={beta_history[-1]}")
            break

        best_idx = None
        best_beta = None
        best_score = None
        for upper_idx in pool:
            div_idx = instance.upper_divisors[upper_idx]
            if div_idx.size == 0 or not active[div_idx].any():
                candidate_beta = beta_history[-1]
            else:
                candidate_active = active.copy()
                candidate_active[div_idx] = False
                candidate_beta = instance.beta_from_active(candidate_active)
            approx = int(score_weight[upper_idx] + score_prime[upper_idx] + score_count[upper_idx])
            if best_beta is None or candidate_beta < best_beta or (candidate_beta == best_beta and approx > best_score):
                best_idx = upper_idx
                best_beta = candidate_beta
                best_score = approx

        assert best_idx is not None and best_beta is not None
        selected[best_idx] = True
        chosen.append(int(instance.upper[best_idx]))
        instance.apply_shield(active, score_weight, score_prime, score_count, best_idx)
        beta_history.append(int(best_beta))
        elapsed_history.append(time.perf_counter() - start)
        if step == 1 or step == k_max or step % max(10, k_max // 10) == 0:
            log_line(log_path, f"step={step} strategy={config.name} chosen={chosen[-1]} beta={best_beta}")

    if len(beta_history) <= k_max:
        final_beta = beta_history[-1]
        final_elapsed = elapsed_history[-1]
        while len(beta_history) <= k_max:
            beta_history.append(final_beta)
            elapsed_history.append(final_elapsed)

    log_line(log_path, f"done n={n} strategy={config.name} elapsed={time.perf_counter()-start:.2f}s final_beta={beta_history[-1]}")
    return {
        "n": n,
        "strategy": config.name,
        "selected": chosen,
        "beta_history": beta_history,
        "elapsed_history": elapsed_history,
    }


def sniping_audit(payloads: Sequence[dict]) -> dict:
    distinct_prime_sets = [set(item["distinct_primes"]) for item in payloads]
    prime_to_shields: dict[int, set[int]] = defaultdict(set)
    for idx, primes in enumerate(distinct_prime_sets):
        for prime in primes:
            prime_to_shields[prime].add(idx)
    universe = sorted(prime_to_shields)
    prime_index = {prime: idx for idx, prime in enumerate(universe)}
    width = len(universe)
    omega_dist = Counter(item["omega"] for item in payloads)
    top_support = Counter({prime: len(shields) for prime, shields in prime_to_shields.items()}).most_common(10)

    best_prime_sets = {}
    for k_star in [1, 5, 10, 50]:
        if not payloads:
            best_prime_sets[str(k_star)] = {"chosen_primes": [], "killed": 0, "fraction": 0.0}
            continue
        if width <= k_star:
            best_prime_sets[str(k_star)] = {"chosen_primes": universe, "killed": len(payloads), "fraction": 1.0}
            continue
        var_count = width + len(payloads)
        objective = np.concatenate([np.zeros(width), -np.ones(len(payloads))])
        lb = np.zeros(var_count)
        ub = np.ones(var_count)
        integrality = np.ones(var_count)
        rows = [np.concatenate([np.ones(width), np.zeros(len(payloads))])]
        rhs = [float(k_star)]
        for shield_idx, primes in enumerate(distinct_prime_sets):
            row = np.zeros(var_count)
            for prime in primes:
                row[prime_index[prime]] = -1.0
            row[width + shield_idx] = 1.0
            rows.append(row)
            rhs.append(0.0)
        constraints = LinearConstraint(np.vstack(rows), -np.inf, np.array(rhs))
        result = milp(c=objective, constraints=constraints, bounds=Bounds(lb, ub), integrality=integrality)
        if result.x is None:
            chosen = []
            killed = 0
        else:
            chosen = [universe[i] for i, value in enumerate(result.x[:width]) if value > 0.5]
            killed = int(round(result.x[width:].sum()))
        best_prime_sets[str(k_star)] = {
            "chosen_primes": chosen,
            "killed": killed,
            "fraction": killed / len(payloads),
        }

    return {
        "omega_distribution": {str(k): int(v) for k, v in sorted(omega_dist.items())},
        "prime_dependency_width": width,
        "top_prime_support": [{"prime": int(p), "count": int(c)} for p, c in top_support],
        "best_prime_snipes": best_prime_sets,
    }


def structural_summary(instance: DivisibilityInstance, shields: Sequence[int], n: int, alpha: float, budget_k: int, beta_value: int, strategy: str) -> dict:
    payloads = [instance.shield_payload(int(u) - (n // 2 + 1)) for u in shields]
    in_h_fraction = statistics.fmean(item["in_H_n"] for item in payloads) if payloads else 0.0
    squarefree_fraction = statistics.fmean(item["squarefree"] for item in payloads) if payloads else 0.0
    mean_omega = statistics.fmean(item["omega"] for item in payloads) if payloads else 0.0
    mean_divisor_count = statistics.fmean(item["divisor_count_in_L"] for item in payloads) if payloads else 0.0
    mod4 = Counter(item["mod_4"] for item in payloads)
    mod12 = Counter(item["mod_12"] for item in payloads)

    core_candidates = [2, 6, 30, 210]
    primorial_signals = []
    for core in core_candidates:
        frac = (sum(item["value"] % core == 0 for item in payloads) / len(payloads)) if payloads else 0.0
        primorial_signals.append({"core": core, "fraction_divisible": frac})

    return {
        "n": n,
        "alpha": alpha,
        "k_budget": budget_k,
        "selected_size": len(shields),
        "beta_min": beta_value,
        "beta_min_over_n": beta_value / n,
        "mertens_pred": 0.5 * math.log(1.0 / alpha),
        "gap": beta_value / n - 0.5 * math.log(1.0 / alpha),
        "strategy": strategy,
        "population_baseline": instance.population_stats,
        "selected_stats": {
            "in_H_fraction": in_h_fraction,
            "squarefree_fraction": squarefree_fraction,
            "mean_omega": mean_omega,
            "mean_divisor_count_in_L": mean_divisor_count,
            "mod_4_counts": {str(k): int(v) for k, v in sorted(mod4.items())},
            "mod_12_counts": {str(k): int(v) for k, v in sorted(mod12.items())},
            "primorial_signal": primorial_signals,
        },
        "sniping_audit": sniping_audit(payloads),
        "shields": payloads,
    }


def select_best_rows(results: list[dict], n: int, alphas: Sequence[float]) -> list[dict]:
    rows = []
    instance = DivisibilityInstance(n)
    for alpha in alphas:
        budget_k = int(n**alpha)
        best = min(results, key=lambda item: item["beta_history"][budget_k])
        beta_value = int(best["beta_history"][budget_k])
        row = {
            "n": n,
            "alpha": fmt_alpha(alpha),
            "k": budget_k,
            "beta_min": beta_value,
            "beta_min_over_n": beta_value / n,
            "mertens_pred": 0.5 * math.log(1.0 / alpha),
            "gap": beta_value / n - 0.5 * math.log(1.0 / alpha),
            "elapsed_sec": round(float(best["elapsed_history"][budget_k]), 3),
            "strategy": best["strategy"],
            "selected": best["selected"][:budget_k],
            "structural": structural_summary(instance, best["selected"][:budget_k], n, alpha, budget_k, beta_value, best["strategy"]),
        }
        rows.append(row)
    return rows


def write_csv(rows: Sequence[dict]) -> None:
    with CSV_PATH.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(
            handle,
            fieldnames=["n", "alpha", "k", "beta_min", "beta_min_over_n", "mertens_pred", "gap", "elapsed_sec"],
        )
        writer.writeheader()
        for row in sorted(rows, key=lambda item: (item["n"], float(item["alpha"]))):
            writer.writerow({key: row[key] for key in writer.fieldnames})


def write_structural(rows: Sequence[dict]) -> None:
    STRUCTURAL_DIR.mkdir(parents=True, exist_ok=True)
    for row in rows:
        path = STRUCTURAL_DIR / f"{row['n']}_{row['alpha']}.json"
        with path.open("w", encoding="utf-8") as handle:
            json.dump(row["structural"], handle, indent=2)


def cell_commentary(row: dict) -> str:
    stats = row["structural"]["selected_stats"]
    snipe = row["structural"]["sniping_audit"]["best_prime_snipes"]
    top_one = snipe["1"]["chosen_primes"]
    primorial = stats["primorial_signal"]
    h_frac = stats["in_H_fraction"]
    squarefree = stats["squarefree_fraction"]
    mean_omega = stats["mean_omega"]
    pop = row["structural"]["population_baseline"]
    parts = []
    parts.append("strongly H_n-biased" if h_frac >= 0.7 else "moderately H_n-biased" if h_frac >= 0.45 else "not especially H_n-biased")
    parts.append("squarefree-leaning" if squarefree >= max(0.6, pop["squarefree_fraction"]) else "composite-heavy")
    parts.append("high-omega" if mean_omega >= pop["mean_omega"] + 0.5 else "ordinary-omega")
    if primorial[1]["fraction_divisible"] >= 0.8:
        parts.append("heavily 6-divisible")
    elif primorial[0]["fraction_divisible"] >= 0.9:
        parts.append("almost entirely even")
    brittle = snipe["10"]["fraction"]
    if snipe["1"]["fraction"] >= 0.9 and top_one:
        parts.append(f"one-prime brittle (prime {top_one[0]} kills almost all)")
    elif brittle >= 0.75:
        parts.append("brittle to 10-prime sniping")
    elif brittle <= 0.35:
        parts.append("fairly robust to 10-prime sniping")
    else:
        parts.append("moderately exposed to 10-prime sniping")
    return ", ".join(parts)


def build_report(rows: Sequence[dict], all_results: dict[int, list[dict]]) -> str:
    rows = sorted(rows, key=lambda item: (item["n"], float(item["alpha"])))
    max_y = max(max(row["beta_min_over_n"], row["mertens_pred"]) for row in rows)
    lines = [
        "# Phase 0 report",
        "",
        "These are heuristic upper bounds on `psi_n(alpha)` produced by exact `beta(P)` solves inside greedy shield searches.",
        "The Mertens term is a proven lower bound, so tightness is suggested only when the heuristic upper bounds sit close to it.",
        "",
        "## Empirical grid",
        "",
        "| n | alpha | k | beta_min/n | (1/2)log(1/alpha) | gap | elapsed (s) |",
        "|---:|---:|---:|---:|---:|---:|---:|",
    ]
    for row in rows:
        lines.append(
            f"| {row['n']} | {row['alpha']} | {row['k']} | {row['beta_min_over_n']:.4f} | {row['mertens_pred']:.4f} | {row['gap']:.4f} | {row['elapsed_sec']:.2f} |"
        )

    lines.extend(["", "## ASCII plot", ""])
    for n in sorted({row["n"] for row in rows}):
        lines.append(f"### n = {n}")
        lines.append("")
        lines.append("`pred` = proven lower bound, `emp` = heuristic upper bound from the best strategy prefix")
        lines.append("")
        for row in [item for item in rows if item["n"] == n]:
            lines.append(
                f"alpha={row['alpha']} pred {ascii_bar(row['mertens_pred'], max_y)} {row['mertens_pred']:.3f} | "
                f"emp {ascii_bar(row['beta_min_over_n'], max_y)} {row['beta_min_over_n']:.3f}"
            )
        lines.append("")

    lines.extend(["## Structural notes", ""])
    for row in rows:
        lines.append(
            f"- `(n, alpha)=({row['n']}, {row['alpha']})`, strategy `{row['strategy']}`: {cell_commentary(row)}."
        )
        lines.append(
            f"  H_n fraction {row['structural']['selected_stats']['in_H_fraction']:.2%}; "
            f"squarefree fraction {row['structural']['selected_stats']['squarefree_fraction']:.2%}; "
            f"mean omega {row['structural']['selected_stats']['mean_omega']:.2f}; "
            f"prime dependency width {row['structural']['sniping_audit']['prime_dependency_width']}."
        )

    lines.extend(["", "## Sniping audit", ""])
    for row in rows:
        snipe = row["structural"]["sniping_audit"]["best_prime_snipes"]
        lines.append(
            f"- `(n, alpha)=({row['n']}, {row['alpha']})`: kill fractions with best primes are "
            f"k*=1 -> {snipe['1']['fraction']:.2%} via {snipe['1']['chosen_primes']}, "
            f"k*=5 -> {snipe['5']['fraction']:.2%} via {snipe['5']['chosen_primes']}, "
            f"k*=10 -> {snipe['10']['fraction']:.2%}, "
            f"k*=50 -> {snipe['50']['fraction']:.2%}."
        )

    gaps = [row["gap"] for row in rows]
    best_gap = min(gaps)
    median_gap = statistics.median(gaps)
    lines.extend(["", "## Assessment", ""])
    if best_gap <= 0.05 and median_gap <= 0.10:
        lines.append("The grid is broadly consistent with `psi(alpha)` being close to the Mertens lower bound at this scale.")
        lines.append("Because the search is heuristic, this is evidence for tightness, not proof.")
    elif median_gap >= 0.15:
        lines.append("The heuristic upper bounds remain materially above the Mertens lower bound across much of the grid.")
        lines.append("That leans toward `psi` being strictly larger, but the conclusion is not airtight because the outer minimization over `P` is heuristic.")
    else:
        lines.append("The current grid is inconclusive: the best heuristic constructions improve meaningfully over naive choices, but the remaining gap to the lower bound is still nontrivial.")
    lines.append("")
    lines.append("The most trustworthy signal here is not just the gap, but the structure of the best shield sets.")
    lines.append("If the best sets are very brittle under prime sniping, that weakens the online Prolonger outlook even if the offline values look promising.")
    lines.append("")
    lines.append("## Runtime notes")
    lines.append("")
    for n, result_list in sorted(all_results.items()):
        total = sum(item["elapsed_history"][-1] for item in result_list)
        strategies = ", ".join(item["strategy"] for item in result_list)
        lines.append(f"- `n={n}` used strategies `{strategies}` with combined trajectory time {total:.2f}s.")

    return "\n".join(lines) + "\n"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--ns", nargs="*", type=int, default=DEFAULT_NS)
    parser.add_argument("--alphas", nargs="*", type=float, default=ALPHAS)
    parser.add_argument("--max-workers", type=int, default=min(6, max(1, (os.cpu_count() or 2) - 2)))
    args = parser.parse_args()

    ROOT.mkdir(parents=True, exist_ok=True)
    LOG_DIR.mkdir(parents=True, exist_ok=True)
    STRUCTURAL_DIR.mkdir(parents=True, exist_ok=True)
    log_line(MAIN_LOG, f"starting phase0 ns={args.ns} alphas={args.alphas} workers={args.max_workers}")

    tasks = []
    k_by_n = {n: int(max(n**alpha for alpha in args.alphas)) for n in args.ns}
    for n in args.ns:
        for config in STRATEGIES:
            tasks.append((n, k_by_n[n], config))

    results_by_n: dict[int, list[dict]] = defaultdict(list)
    with ProcessPoolExecutor(max_workers=min(args.max_workers, len(tasks))) as executor:
        futures = {executor.submit(run_strategy, task): task for task in tasks}
        for future in as_completed(futures):
            n, _, config = futures[future]
            result = future.result()
            results_by_n[n].append(result)
            log_line(MAIN_LOG, f"completed n={n} strategy={config.name} elapsed={result['elapsed_history'][-1]:.2f}s")

    all_rows = []
    for n in args.ns:
        rows = select_best_rows(results_by_n[n], n, args.alphas)
        all_rows.extend(rows)
        log_line(MAIN_LOG, f"selected best rows for n={n}")
        write_csv(all_rows)
        write_structural(all_rows)

    report = build_report(all_rows, results_by_n)
    REPORT_PATH.write_text(report, encoding="utf-8")
    log_line(MAIN_LOG, f"wrote report to {REPORT_PATH}")


if __name__ == "__main__":
    main()
