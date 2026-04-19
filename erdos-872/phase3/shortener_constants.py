from __future__ import annotations

import csv
import math
import time
from functools import lru_cache
from pathlib import Path
from typing import Any

import mpmath
import numpy as np
from scipy.integrate import quad


ROOT = Path("/Users/omisverycool/erdos-harness/erdos-872/phase3")
CSV_PATH = ROOT / "shortener_constants.csv"
SUMMARY_PATH = ROOT / "shortener_constants_summary.md"
LOG_PATH = ROOT / "logs" / "shortener_constants.log"

EPSABS = 1e-14
EPSREL = 1e-12
SERIES_STOP_TOL = 1e-13
MAX_SERIES_R = 32
MP_DPS = 50
GRID_N = 1 << 17

CLAIMED_I_VALUES = {
    0: 1.0,
    1: math.log(2.0),
    2: 0.1472206769,
    3: 0.0148863467,
    4: 0.00087448,
}
CLAIMED_V = 0.44003
CLAIMED_RHO = CLAIMED_V / 2.0
CLAIMED_C = 0.2270367481996479
CLAIMED_C_INTEGRAL = 4.0 * CLAIMED_C - 2.0 * (1.0 - math.log(2.0))


def log_line(message: str) -> None:
    LOG_PATH.parent.mkdir(parents=True, exist_ok=True)
    stamp = time.strftime("%Y-%m-%d %H:%M:%S")
    with LOG_PATH.open("a", encoding="utf-8") as handle:
        handle.write(f"[{stamp}] {message}\n")


def agreement_decimals(actual: float, claimed: float, max_decimals: int = 15) -> int:
    for decimals in range(max_decimals, -1, -1):
        if abs(actual - claimed) < 0.5 * 10 ** (-decimals):
            return decimals
    return 0


_GRID_X = np.linspace(0.0, 1.0, GRID_N + 1, dtype=np.float64)
_GRID_H = 1.0 / GRID_N
_GRID_F = 1.0 / (1.0 + _GRID_X)
_CONV_LEN = 1
while _CONV_LEN < 2 * (GRID_N + 1):
    _CONV_LEN <<= 1
_GRID_F_FFT = np.fft.rfft(_GRID_F, n=_CONV_LEN)
_GRID_G_VALUES: list[np.ndarray] = [np.ones(GRID_N + 1, dtype=np.float64), np.log1p(_GRID_X)]
_GRID_I_VALUES: dict[int, float] = {0: 1.0, 1: math.log(2.0)}


def _advance_grid_recursion(target_r: int) -> None:
    while len(_GRID_G_VALUES) <= target_r:
        r = len(_GRID_G_VALUES)
        prev = _GRID_G_VALUES[r - 1]
        conv = np.fft.irfft(np.fft.rfft(prev, n=_CONV_LEN) * _GRID_F_FFT, n=_CONV_LEN)[: GRID_N + 1]
        curr = _GRID_H * (conv - 0.5 * prev * _GRID_F[0] - 0.5 * prev[0] * _GRID_F)
        curr[0] = 0.0
        _GRID_G_VALUES.append(curr)
        _GRID_I_VALUES[r] = float(curr[-1] / math.factorial(r))


@lru_cache(maxsize=None)
def compute_i_r(r: int) -> float:
    if r < 0:
        raise ValueError("r must be nonnegative")
    if r in _GRID_I_VALUES:
        return _GRID_I_VALUES[r]
    _advance_grid_recursion(r)
    value = _GRID_I_VALUES[r]
    if value <= 0.0:
        raise AssertionError(f"I_{r} must be positive, got {value}")
    return value


def compute_i1_quad() -> dict[str, float]:
    numeric, error = quad(
        lambda u: 1.0 / (1.0 + u),
        0.0,
        1.0,
        epsabs=EPSABS,
        epsrel=EPSREL,
        limit=200,
    )
    return {
        "analytic": math.log(2.0),
        "numeric": numeric,
        "error_estimate": error,
    }


def compute_v_series(stop_tol: float = SERIES_STOP_TOL, max_r: int = MAX_SERIES_R) -> dict[str, Any]:
    if stop_tol <= 0.0:
        raise ValueError("stop_tol must be positive")

    terms: list[float] = []
    partial_sums: list[float] = []
    signed_terms: list[float] = []

    for r in range(max_r + 1):
        term = compute_i_r(r)
        signed = term if r % 2 == 0 else -term
        terms.append(term)
        signed_terms.append(signed)
        partial_sums.append(math.fsum(signed_terms))
        if r >= 1 and term < stop_tol:
            next_term = compute_i_r(r + 1)
            return {
                "terms": terms,
                "partial_sums": partial_sums,
                "stop_r": r,
                "next_term_bound": next_term,
                "v_value": partial_sums[-1],
            }
    raise RuntimeError(f"series did not reach stop_tol={stop_tol} by r={max_r}")


def compute_c_constant() -> dict[str, float]:
    integral_value, quad_error = quad(
        lambda u: math.log(2.0 - u) / (1.0 + u),
        0.0,
        1.0,
        epsabs=EPSABS,
        epsrel=EPSREL,
        limit=200,
    )
    c_value = 0.5 * (1.0 - math.log(2.0) + 0.5 * integral_value)

    mpmath.mp.dps = MP_DPS
    mpmath_integral = mpmath.quad(
        lambda u: mpmath.log(2 - u) / (1 + u),
        [0, 1],
    )
    mpmath_c = 0.5 * (1 - mpmath.log(2) + 0.5 * mpmath_integral)
    return {
        "integral": integral_value,
        "quad_error_estimate": quad_error,
        "C": c_value,
        "mpmath_integral": float(mpmath_integral),
        "mpmath_C": float(mpmath_c),
    }


def build_rows() -> tuple[list[dict[str, Any]], dict[str, Any]]:
    i1_check = compute_i1_quad()
    series = compute_v_series()
    c_info = compute_c_constant()

    terms = series["terms"]
    for index, term in enumerate(terms):
        if term <= 0.0:
            raise AssertionError(f"I_{index} must be positive, got {term}")
    for index in range(2, len(terms)):
        if not terms[index] < terms[index - 1]:
            raise AssertionError(f"I_r must decrease from r=2 onward: I_{index}={terms[index]} >= I_{index-1}={terms[index-1]}")

    v_value = series["v_value"]
    rho_value = v_value / 2.0
    if not (0.0 < v_value < 1.0):
        raise AssertionError(f"V must lie in (0,1), got {v_value}")
    if not (0.0 < c_info["C"] < 0.5):
        raise AssertionError(f"C must lie in (0,1/2), got {c_info['C']}")

    rows: list[dict[str, Any]] = []
    for r, claimed in CLAIMED_I_VALUES.items():
        value = compute_i_r(r)
        rows.append(
            {
                "quantity": f"I_{r}",
                "codex_value": f"{value:.15f}",
                "claimed_value": f"{claimed:.15f}",
                "agreement_decimals": agreement_decimals(value, claimed),
            }
        )
    rows.extend(
        [
            {
                "quantity": "V",
                "codex_value": f"{v_value:.15f}",
                "claimed_value": f"{CLAIMED_V:.15f}",
                "agreement_decimals": agreement_decimals(v_value, CLAIMED_V),
            },
            {
                "quantity": "rho=V/2",
                "codex_value": f"{rho_value:.15f}",
                "claimed_value": f"{CLAIMED_RHO:.15f}",
                "agreement_decimals": agreement_decimals(rho_value, CLAIMED_RHO),
            },
            {
                "quantity": "integral_C",
                "codex_value": f"{c_info['integral']:.15f}",
                "claimed_value": f"{CLAIMED_C_INTEGRAL:.15f}",
                "agreement_decimals": agreement_decimals(c_info["integral"], CLAIMED_C_INTEGRAL),
            },
            {
                "quantity": "C",
                "codex_value": f"{c_info['C']:.15f}",
                "claimed_value": f"{CLAIMED_C:.15f}",
                "agreement_decimals": agreement_decimals(c_info["C"], CLAIMED_C),
            },
        ]
    )
    details = {
        "i1_check": i1_check,
        "series": series,
        "c_info": c_info,
        "v_value": v_value,
        "rho_value": rho_value,
    }
    return rows, details


def write_csv(rows: list[dict[str, Any]]) -> None:
    CSV_PATH.parent.mkdir(parents=True, exist_ok=True)
    with CSV_PATH.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=["quantity", "codex_value", "claimed_value", "agreement_decimals"])
        writer.writeheader()
        for row in rows:
            writer.writerow(row)


def write_summary(rows: list[dict[str, Any]], details: dict[str, Any]) -> None:
    row_map = {row["quantity"]: row for row in rows}
    v_agreement = int(row_map["V"]["agreement_decimals"])
    c_agreement = int(row_map["C"]["agreement_decimals"])
    term_ok = min(int(row_map[f"I_{r}"]["agreement_decimals"]) for r in (0, 1, 2, 3, 4))
    verdict = (
        "Both constants ratified"
        if v_agreement >= 4 and c_agreement >= 4 and term_ok >= 6
        else "Discrepancy found"
    )

    table_lines = [
        "| Quantity | Codex value | Claimed value | Agreement |",
        "|---|---:|---:|---:|",
        f"| $I_0$ | {row_map['I_0']['codex_value']} | {row_map['I_0']['claimed_value']} | {row_map['I_0']['agreement_decimals']} |",
        f"| $I_1$ | {row_map['I_1']['codex_value']} | {row_map['I_1']['claimed_value']} | {row_map['I_1']['agreement_decimals']} |",
        f"| $I_2$ | {row_map['I_2']['codex_value']} | {row_map['I_2']['claimed_value']} | {row_map['I_2']['agreement_decimals']} |",
        f"| $I_3$ | {row_map['I_3']['codex_value']} | {row_map['I_3']['claimed_value']} | {row_map['I_3']['agreement_decimals']} |",
        f"| $I_4$ | {row_map['I_4']['codex_value']} | {row_map['I_4']['claimed_value']} | {row_map['I_4']['agreement_decimals']} |",
        f"| $\\mathcal{{V}}$ | {row_map['V']['codex_value']} | {row_map['V']['claimed_value']} | {row_map['V']['agreement_decimals']} |",
        f"| $\\rho = \\mathcal{{V}}/2$ | {row_map['rho=V/2']['codex_value']} | {row_map['rho=V/2']['claimed_value']} | {row_map['rho=V/2']['agreement_decimals']} |",
        f"| $\\int_0^1 \\frac{{\\log(2-u)}}{{1+u}}\\,du$ | {row_map['integral_C']['codex_value']} | {row_map['integral_C']['claimed_value']} | {row_map['integral_C']['agreement_decimals']} |",
        f"| $C$ | {row_map['C']['codex_value']} | {row_map['C']['claimed_value']} | {row_map['C']['agreement_decimals']} |",
    ]

    content = "\n".join(
        [
            "# Shortener Constants Numerical Verification",
            "",
            f"Verdict: **{verdict}**.",
            "",
            f"`V = {details['v_value']:.12f}` and `C = {details['c_info']['C']:.12f}`.",
            "",
            "The `I_1` check matches both the analytic `log 2` value and an independent `quad` evaluation, "
            f"with numerical `I_1 = {details['i1_check']['numeric']:.15f}` and analytic `log 2 = {details['i1_check']['analytic']:.15f}`.",
            "",
            "The alternating series was truncated only after the first omitted-term bound dropped below `1e-13`; "
            f"the returned partial sum stops at `r = {details['series']['stop_r']}` with next-term bound "
            f"`{details['series']['next_term_bound']:.3e}`.",
            "",
            "The `C` integral was evaluated with both `scipy.integrate.quad` and `mpmath.quad`; "
            f"their difference on `C` is `{abs(details['c_info']['C'] - details['c_info']['mpmath_C']):.3e}`.",
            "",
            *table_lines,
            "",
        ]
    )
    SUMMARY_PATH.write_text(content, encoding="utf-8")


def main() -> None:
    start = time.perf_counter()
    rows, details = build_rows()
    write_csv(rows)
    write_summary(rows, details)
    elapsed = time.perf_counter() - start

    log_line(f"I1 analytic={details['i1_check']['analytic']:.15f} quad={details['i1_check']['numeric']:.15f}")
    for r, term in enumerate(details["series"]["terms"]):
        log_line(f"I_{r}={term:.15f}")
    log_line(
        f"V={details['v_value']:.15f} rho={details['rho_value']:.15f} "
        f"stop_r={details['series']['stop_r']} next_term_bound={details['series']['next_term_bound']:.3e}"
    )
    log_line(
        f"integral_C={details['c_info']['integral']:.15f} "
        f"mpmath_integral={details['c_info']['mpmath_integral']:.15f}"
    )
    log_line(
        f"C={details['c_info']['C']:.15f} mpmath_C={details['c_info']['mpmath_C']:.15f} elapsed={elapsed:.2f}s"
    )


if __name__ == "__main__":
    main()
