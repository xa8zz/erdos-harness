#!/usr/bin/env python3
"""Compute the Appendix B W_4 interval certificate from first principles.

The certificate is based on the grid construction in Appendix B.  We partition
``(0, 1]`` into ``N`` cells and compute each cell mass

    m_i = integral_{(i-1)/N}^{i/N} rho(u) du,
    rho(u) = 1 / ((floor(1/u) + 1) u),

with outward-rounded ``mpmath.iv`` interval arithmetic.  Instead of subtracting
two antiderivative values on every cell, we split each grid cell at the exact
breakpoints ``1/h`` and integrate ``rho(u) = 1 / ((h+1)u)`` on each piece.  This
keeps the tail uncertainty in the first cell, where it belongs, and avoids a
large artificial cancellation width in J_1.

The r-fold convolution is accelerated by FFT polynomial multiplication.  The
inputs are nonnegative interval endpoints.  For each FFT convolution of arrays
``a`` and ``b`` of transform length ``L``, the full L1 round-off error is
bounded by

    256 * eps * (ceil(log2(L)) + 1)^2 * ||a||_1 * ||b||_1.

This is intentionally conservative for double-precision Cooley--Tukey FFTs:
it dominates the standard gamma_k model for the forward FFTs, pointwise
multiplication, inverse FFT, and the final real projection.  We propagate that
L1 error through later convolutions; any partial coefficient sum is then
enclosed by subtracting/adding the accumulated L1 error.  The unit tests include
a small direct-convolution check that the implemented bound encloses exact
small cases.  No unbounded FFT error is used in the final intervals.
"""

from __future__ import annotations

import argparse
import json
import math
import time
from dataclasses import dataclass
from decimal import Decimal, getcontext
from typing import Iterable

import mpmath as mp
import numpy as np


DEFAULT_N = 100_000
DEFAULT_TAIL_H = 1_000_000
DEFAULT_DPS = 80
MAX_R = 4
TARGET = Decimal("0.19")
MIN_MARGIN = Decimal("0.000287")
FFT_ERROR_SAFETY = 256


@dataclass(frozen=True)
class DecimalInterval:
    lower: Decimal
    upper: Decimal

    @property
    def width(self) -> Decimal:
        return self.upper - self.lower

    def as_pair(self) -> tuple[str, str]:
        return (format_decimal(self.lower), format_decimal(self.upper))


@dataclass(frozen=True)
class Certificate:
    intervals: dict[int, DecimalInterval]
    w4_half: DecimalInterval
    elapsed_seconds: float
    n: int
    tail_h: int
    dps: int
    fft_error_l1: dict[int, float]


PAPER_INTERVALS: dict[int, DecimalInterval] = {
    1: DecimalInterval(Decimal("0.7885305658"), Decimal("0.7885305661")),
    2: DecimalInterval(Decimal("0.18681848"), Decimal("0.18682451")),
    3: DecimalInterval(Decimal("0.02009209"), Decimal("0.02009370")),
    4: DecimalInterval(Decimal("0.00122263"), Decimal("0.00122282")),
}


def format_decimal(value: Decimal) -> str:
    """Format a Decimal without scientific notation noise."""
    return format(value, "f")


def decimal_from_float(value: float) -> Decimal:
    """Convert a finite float to its exact Decimal value."""
    return Decimal.from_float(float(value))


def outward_float_lower(value: mp.mpf) -> float:
    return math.nextafter(float(value), -math.inf)


def outward_float_upper(value: mp.mpf) -> float:
    return math.nextafter(float(value), math.inf)


def rational_less(a_num: int, a_den: int, b_num: int, b_den: int) -> bool:
    return a_num * b_den < b_num * a_den


def max_rational(
    a_num: int, a_den: int, b_num: int, b_den: int
) -> tuple[int, int]:
    if rational_less(a_num, a_den, b_num, b_den):
        return b_num, b_den
    return a_num, a_den


def min_rational(
    a_num: int, a_den: int, b_num: int, b_den: int
) -> tuple[int, int]:
    if rational_less(a_num, a_den, b_num, b_den):
        return a_num, a_den
    return b_num, b_den


def iv_rational(num: int, den: int) -> mp.iv.mpf:
    return mp.iv.mpf([num, num]) / den


def compute_first_cell_mass(n: int, tail_h: int) -> mp.iv.mpf:
    """Compute integral over (0, 1/N], i.e. the h >= N tail."""
    if tail_h < n:
        raise ValueError("tail_h must be at least n")

    tail_lower = mp.mpf(1) / (tail_h + 2)
    tail_upper = mp.mpf(1) / (tail_h + 1)
    total = mp.iv.mpf([tail_lower, tail_upper])

    for h in range(tail_h, n - 1, -1):
        hh = mp.iv.mpf([h, h])
        total += mp.iv.log((hh + 1) / hh) / (hh + 1)

    return total


def compute_cell_masses(n: int, tail_h: int, dps: int) -> tuple[np.ndarray, np.ndarray]:
    """Return outward float lower/upper arrays for the N cell masses."""
    mp.iv.dps = dps
    lower = np.empty(n, dtype=np.float64)
    upper = np.empty(n, dtype=np.float64)

    first = compute_first_cell_mass(n, tail_h)
    lower[0] = outward_float_lower(first.a)
    upper[0] = outward_float_upper(first.b)

    for i in range(2, n + 1):
        cell_left_num = i - 1
        cell_right_num = i
        h_min = max(1, n // i)
        h_max = n // (i - 1)
        mass = mp.iv.mpf([0, 0])

        for h in range(h_min, h_max + 1):
            left_num, left_den = max_rational(cell_left_num, n, 1, h + 1)
            right_num, right_den = min_rational(cell_right_num, n, 1, h)
            if not rational_less(left_num, left_den, right_num, right_den):
                continue

            left = iv_rational(left_num, left_den)
            right = iv_rational(right_num, right_den)
            hp1 = mp.iv.mpf([h + 1, h + 1])
            mass += mp.iv.log(right / left) / hp1

        lower[i - 1] = max(0.0, outward_float_lower(mass.a))
        upper[i - 1] = outward_float_upper(mass.b)

    return lower, upper


def next_power_of_two(value: int) -> int:
    return 1 << (value - 1).bit_length()


def fft_roundoff_l1_bound(length: int, l1_left: float, l1_right: float) -> float:
    log_len = math.ceil(math.log2(length)) + 1
    return (
        FFT_ERROR_SAFETY
        * np.finfo(np.float64).eps
        * log_len
        * log_len
        * l1_left
        * l1_right
    )


def fft_convolve_nonnegative(
    left: np.ndarray, right: np.ndarray
) -> tuple[np.ndarray, float]:
    """Convolve nonnegative arrays and return a full L1 FFT error enclosure."""
    out_len = len(left) + len(right) - 1
    fft_len = next_power_of_two(out_len)
    left_l1 = math.fsum(float(x) for x in left)
    right_l1 = math.fsum(float(x) for x in right)

    left_hat = np.fft.rfft(left, fft_len)
    right_hat = np.fft.rfft(right, fft_len)
    conv = np.fft.irfft(left_hat * right_hat, fft_len)[:out_len]
    conv = np.maximum(conv, 0.0)
    error_l1 = fft_roundoff_l1_bound(fft_len, left_l1, right_l1)
    return conv, error_l1


def convolution_certificates(
    lower_masses: np.ndarray, upper_masses: np.ndarray
) -> tuple[dict[int, DecimalInterval], dict[int, float]]:
    n = len(lower_masses)
    lower_base = np.concatenate(([0.0], lower_masses))
    upper_base = np.concatenate(([0.0], upper_masses))

    lower_poly = lower_base
    upper_poly = upper_base
    lower_error_l1 = 0.0
    upper_error_l1 = 0.0
    intervals: dict[int, DecimalInterval] = {}
    errors: dict[int, float] = {1: 0.0}
    factorials = {1: 1, 2: 2, 3: 6, 4: 24}
    base_upper_l1 = math.fsum(float(x) for x in upper_base)

    for r in range(1, MAX_R + 1):
        if r > 1:
            lower_poly, new_lower_error = fft_convolve_nonnegative(
                lower_poly, lower_base
            )
            upper_poly, new_upper_error = fft_convolve_nonnegative(
                upper_poly, upper_base
            )

            lower_error_l1 = lower_error_l1 * base_upper_l1 + new_lower_error
            upper_error_l1 = upper_error_l1 * base_upper_l1 + new_upper_error
            errors[r] = max(lower_error_l1, upper_error_l1)

        lower_sum = math.fsum(float(x) for x in lower_poly[: n + 1])
        upper_sum = math.fsum(float(x) for x in upper_poly[: n + r + 1])
        factor = factorials[r]

        lower_endpoint = decimal_from_float(lower_sum / factor) - decimal_from_float(
            lower_error_l1 / factor
        )
        upper_endpoint = decimal_from_float(upper_sum / factor) + decimal_from_float(
            upper_error_l1 / factor
        )
        intervals[r] = DecimalInterval(lower_endpoint, upper_endpoint)

    return intervals, errors


def compute_w4_half(intervals: dict[int, DecimalInterval]) -> DecimalInterval:
    lower = (
        Decimal(1)
        - intervals[1].upper
        + intervals[2].lower
        - intervals[3].upper
        + intervals[4].lower
    ) / Decimal(2)
    upper = (
        Decimal(1)
        - intervals[1].lower
        + intervals[2].upper
        - intervals[3].lower
        + intervals[4].upper
    ) / Decimal(2)
    return DecimalInterval(lower, upper)


def compute_certificate(
    n: int = DEFAULT_N,
    tail_h: int = DEFAULT_TAIL_H,
    dps: int = DEFAULT_DPS,
) -> Certificate:
    start = time.perf_counter()
    masses_lower, masses_upper = compute_cell_masses(n=n, tail_h=tail_h, dps=dps)
    intervals, errors = convolution_certificates(masses_lower, masses_upper)
    w4_half = compute_w4_half(intervals)
    return Certificate(
        intervals=intervals,
        w4_half=w4_half,
        elapsed_seconds=time.perf_counter() - start,
        n=n,
        tail_h=tail_h,
        dps=dps,
        fft_error_l1=errors,
    )


def interval_inside(inner: DecimalInterval, outer: DecimalInterval) -> bool:
    return outer.lower <= inner.lower and inner.upper <= outer.upper


def validate_against_paper(intervals: dict[int, DecimalInterval]) -> None:
    failures = []
    for r, computed in intervals.items():
        displayed = PAPER_INTERVALS[r]
        if not interval_inside(computed, displayed):
            failures.append(
                f"J_{r} computed [{computed.lower}, {computed.upper}] "
                f"is not inside displayed [{displayed.lower}, {displayed.upper}]"
            )

    if failures:
        raise SystemExit("\n".join(failures))


def print_intervals(certificate: Certificate) -> None:
    print(
        f"Computed W_4 certificate with N={certificate.n}, "
        f"H*={certificate.tail_h}, dps={certificate.dps}"
    )
    for r in range(1, MAX_R + 1):
        interval = certificate.intervals[r]
        displayed = PAPER_INTERVALS[r]
        print(
            f"  J_{r} in [{format_decimal(interval.lower)}, "
            f"{format_decimal(interval.upper)}]"
        )
        print(
            f"       paper [{format_decimal(displayed.lower)}, "
            f"{format_decimal(displayed.upper)}], "
            f"width={format_decimal(interval.width)}"
        )
    print(
        f"  W_4/2 in [{format_decimal(certificate.w4_half.lower)}, "
        f"{format_decimal(certificate.w4_half.upper)}]"
    )
    print(f"  margin to 0.19: {format_decimal(TARGET - certificate.w4_half.upper)}")
    print(f"  elapsed seconds: {certificate.elapsed_seconds:.3f}")


def certificate_as_json(certificate: Certificate) -> str:
    payload = {
        "n": certificate.n,
        "tail_h": certificate.tail_h,
        "dps": certificate.dps,
        "elapsed_seconds": certificate.elapsed_seconds,
        "intervals": {
            str(r): certificate.intervals[r].as_pair() for r in range(1, MAX_R + 1)
        },
        "w4_half": certificate.w4_half.as_pair(),
        "fft_error_l1": certificate.fft_error_l1,
    }
    return json.dumps(payload, indent=2, sort_keys=True)


def parse_args(argv: Iterable[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--n", type=int, default=DEFAULT_N, help="grid size N")
    parser.add_argument(
        "--tail-h",
        type=int,
        default=DEFAULT_TAIL_H,
        help="last h included before applying the analytic tail enclosure",
    )
    parser.add_argument(
        "--dps",
        type=int,
        default=DEFAULT_DPS,
        help="decimal precision for mpmath interval arithmetic",
    )
    parser.add_argument(
        "--json",
        action="store_true",
        help="print machine-readable JSON instead of the text report",
    )
    parser.add_argument(
        "--skip-paper-check",
        action="store_true",
        help="compute intervals without requiring containment in the paper bounds",
    )
    return parser.parse_args(argv)


def main(argv: Iterable[str] | None = None) -> int:
    getcontext().prec = 80
    args = parse_args(argv)
    certificate = compute_certificate(n=args.n, tail_h=args.tail_h, dps=args.dps)

    if args.json:
        print(certificate_as_json(certificate))
    else:
        print_intervals(certificate)

    if certificate.w4_half.upper >= TARGET:
        raise SystemExit("certificate does not prove W_4/2 < 0.19")
    if TARGET - certificate.w4_half.upper < MIN_MARGIN:
        raise SystemExit("certificate margin is below 2.87e-4")
    if not args.skip_paper_check:
        validate_against_paper(certificate.intervals)

    if not args.json:
        print("OK: computed intervals match paper within declared widths.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
