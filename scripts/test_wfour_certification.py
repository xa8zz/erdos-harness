#!/usr/bin/env python3
from __future__ import annotations

import math
import sys
import unittest
from decimal import Decimal
from pathlib import Path

import numpy as np

sys.path.insert(0, str(Path(__file__).resolve().parent))
import wfour_certification as w4


class WFourCertificationTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.default_certificate = w4.compute_certificate()

    def test_determinism_small_parameters(self) -> None:
        first = w4.compute_certificate(n=2048, tail_h=32768, dps=60)
        second = w4.compute_certificate(n=2048, tail_h=32768, dps=60)
        self.assertEqual(first.intervals, second.intervals)
        self.assertEqual(first.w4_half, second.w4_half)

    def test_precision_monotonicity_small_parameters(self) -> None:
        coarse = w4.compute_certificate(n=4096, tail_h=65536, dps=40)
        fine = w4.compute_certificate(n=4096, tail_h=65536, dps=80)
        for r in range(1, w4.MAX_R + 1):
            self.assertGreaterEqual(
                coarse.intervals[r].width,
                fine.intervals[r].width,
                f"J_{r} dps=40 should be at least as wide as dps=80",
            )

    def test_default_intervals_are_inside_paper_intervals(self) -> None:
        for r in range(1, w4.MAX_R + 1):
            self.assertTrue(
                w4.interval_inside(
                    self.default_certificate.intervals[r], w4.PAPER_INTERVALS[r]
                ),
                f"J_{r} should fit inside the displayed paper interval",
            )

    def test_default_margin(self) -> None:
        margin = w4.TARGET - self.default_certificate.w4_half.upper
        self.assertGreater(margin, Decimal("0"))
        self.assertGreaterEqual(margin, w4.MIN_MARGIN)

    def test_fft_error_bound_covers_small_direct_convolution(self) -> None:
        left = np.array([0.0, 0.11, 0.23, 0.05, 0.007], dtype=np.float64)
        right = np.array([0.0, 0.31, 0.02, 0.19], dtype=np.float64)
        approx, error_l1 = w4.fft_convolve_nonnegative(left, right)

        direct = np.zeros(len(left) + len(right) - 1, dtype=np.float64)
        for i, a in enumerate(left):
            for j, b in enumerate(right):
                direct[i + j] += a * b

        diff_l1 = math.fsum(abs(float(a - b)) for a, b in zip(approx, direct))
        self.assertLessEqual(diff_l1, error_l1)


if __name__ == "__main__":
    unittest.main()
