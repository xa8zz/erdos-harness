import math
import sys
import unittest
from pathlib import Path


THIS_DIR = Path(__file__).resolve().parent
if str(THIS_DIR) not in sys.path:
    sys.path.insert(0, str(THIS_DIR))

from shortener_piecewise_bonferroni4 import (
    BONFERRONI4_THRESHOLD,
    TARGET_HALF_THRESHOLD,
    compute_j1_series,
    compute_j_values,
)


class ShortenerPiecewiseBonferroni4Tests(unittest.TestCase):
    def test_j1_matches_series_to_three_decimals(self) -> None:
        coarse = compute_j_values(1 << 13)
        self.assertAlmostEqual(coarse[1], compute_j1_series(), places=3)

    def test_fine_grid_is_stable(self) -> None:
        medium = compute_j_values(1 << 16)
        fine = compute_j_values(1 << 17)
        for r in range(1, 5):
            self.assertLessEqual(abs(fine[r] - medium[r]), 5e-5)

    def test_bonferroni4_beats_point_19(self) -> None:
        fine = compute_j_values(1 << 17)
        w4 = 1.0 - fine[1] + fine[2] - fine[3] + fine[4]
        self.assertLess(w4, BONFERRONI4_THRESHOLD)
        self.assertLess(w4 / 2.0, TARGET_HALF_THRESHOLD)


if __name__ == "__main__":
    unittest.main()
