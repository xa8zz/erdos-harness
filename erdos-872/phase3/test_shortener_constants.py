import math
import sys
import unittest
from pathlib import Path


THIS_DIR = Path(__file__).resolve().parent
if str(THIS_DIR) not in sys.path:
    sys.path.insert(0, str(THIS_DIR))

from shortener_constants import CLAIMED_C, compute_c_constant, compute_i_r, compute_v_series


class ShortenerConstantsTests(unittest.TestCase):
    def test_i1_matches_log2_to_10_decimals(self) -> None:
        self.assertAlmostEqual(compute_i_r(1), math.log(2.0), places=10)

    def test_alternating_sum_tail_bound_is_valid(self) -> None:
        coarse = compute_v_series(stop_tol=1e-8)
        fine = compute_v_series(stop_tol=1e-12)
        self.assertLessEqual(abs(coarse["v_value"] - fine["v_value"]), coarse["next_term_bound"] * 1.01)

    def test_c_matches_claim_to_8_decimals(self) -> None:
        self.assertAlmostEqual(compute_c_constant()["C"], CLAIMED_C, places=8)


if __name__ == "__main__":
    unittest.main()
