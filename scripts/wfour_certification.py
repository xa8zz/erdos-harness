#!/usr/bin/env python3
"""Reproduce the Appendix B W4 interval-certificate transcript.

The expensive outward-rounded convolution run is recorded in Appendix B as four
certified intervals for J_1, ..., J_4.  This script checks that transcript and
recomputes the sign-sensitive final inequality

    W4 / 2 = (1 - J_1 + J_2 - J_3 + J_4) / 2 < 0.19

using mpmath interval arithmetic from decimal string endpoints.  Keeping the
endpoints as strings is intentional: it lets mpmath construct outward intervals
around the decimal values rather than first rounding through binary floats.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass

import mpmath as mp


@dataclass(frozen=True)
class IntervalText:
    lower: str
    upper: str

    def as_iv(self) -> mp.iv.mpf:
        return mp.iv.mpf([self.lower, self.upper])


CERTIFIED_J = {
    1: IntervalText("0.7885305658", "0.7885305661"),
    2: IntervalText("0.18681848", "0.18682451"),
    3: IntervalText("0.02009209", "0.02009370"),
    4: IntervalText("0.00122263", "0.00122282"),
}

DISPLAYED_W4_HALF_UPPER = "0.1897123371"
TARGET = "0.19"


def compute_w4_half() -> mp.iv.mpf:
    j1 = CERTIFIED_J[1].as_iv()
    j2 = CERTIFIED_J[2].as_iv()
    j3 = CERTIFIED_J[3].as_iv()
    j4 = CERTIFIED_J[4].as_iv()
    return (1 - j1 + j2 - j3 + j4) / 2


def interval_upper(x: mp.iv.mpf) -> mp.iv.mpf:
    return x.b


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--dps",
        type=int,
        default=80,
        help="decimal precision for mpmath interval arithmetic",
    )
    args = parser.parse_args()
    mp.iv.dps = args.dps

    w4_half = compute_w4_half()
    upper = interval_upper(w4_half)
    target = mp.mpf(TARGET)

    print("Certified J intervals:")
    for r, interval in CERTIFIED_J.items():
        print(f"  J_{r} in [{interval.lower}, {interval.upper}]")
    print(f"W4/2 interval: {w4_half}")
    print(f"Displayed upper endpoint: {DISPLAYED_W4_HALF_UPPER}")

    if not upper < target:
        raise SystemExit("certificate does not prove W4/2 < 0.19")

    print("OK: certified transcript proves W4/2 < 0.19.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
