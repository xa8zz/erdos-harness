import math
import sys
import unittest
from pathlib import Path

THIS_DIR = Path(__file__).resolve().parent
if str(THIS_DIR) not in sys.path:
    sys.path.insert(0, str(THIS_DIR))

from simulator import ProbeContext, ProbeGame, play_match


class DynamicalProbeTests(unittest.TestCase):
    def test_legality_updates_after_play(self) -> None:
        game = ProbeGame(ProbeContext(24), "S_slp_odd", "P_interval_top", seed=0)

        removed = game.play_move(12, role="prolonger")

        self.assertIn(12, removed)
        self.assertFalse(game.is_legal(2))
        self.assertFalse(game.is_legal(3))
        self.assertFalse(game.is_legal(4))
        self.assertFalse(game.is_legal(6))
        self.assertFalse(game.is_legal(12))
        self.assertFalse(game.is_legal(24))
        self.assertTrue(game.is_legal(5))

    def test_interval_top_opens_in_upper_half(self) -> None:
        game = ProbeGame(ProbeContext(20), "S_slp_odd", "P_interval_top", seed=0)
        self.assertEqual(game.choose_move("prolonger"), 11)

    def test_block_product_uses_small_prime_block_on_fresh_board(self) -> None:
        game = ProbeGame(ProbeContext(1000), "S_slp_odd", "P_block_product", seed=0)
        block, product = game.current_prime_block()
        self.assertEqual(block, (2, 3, 5, 7))
        self.assertEqual(product, 210)
        self.assertEqual(game.choose_move("prolonger"), 210)

    def test_pair_response_uses_fresh_prime(self) -> None:
        game = ProbeGame(ProbeContext(1000), "S_pair_response", "P_block_product", seed=0)
        game.play_move(210, role="prolonger")
        self.assertEqual(game.choose_move("shortener"), 11)

    def test_measurements_track_prolonger_prime_support(self) -> None:
        game = ProbeGame(ProbeContext(30), "S_slp_odd", "P_interval_top", seed=0)
        game.play_move(14, role="prolonger")
        game.play_move(11, role="shortener")
        game.play_move(15, role="prolonger")

        measurements = game.measurements()
        self.assertEqual(measurements["P_size"], 2)
        self.assertEqual(measurements["num_primes_in_B"], 4)
        self.assertEqual(measurements["max_p_in_B"], 7)
        self.assertAlmostEqual(
            measurements["sum_inv_p"],
            (1 / 2) + (1 / 3) + (1 / 5) + (1 / 7),
            places=12,
        )
        self.assertEqual(measurements["sum_omega"], 4)

    def test_play_match_returns_ratio_fields(self) -> None:
        result = play_match(ProbeContext(100), "S_slp_odd", "P_interval_top", seed=0)
        self.assertGreater(result["L"], 0)
        self.assertAlmostEqual(result["abs_L_over_n"], result["L"] / 100.0, places=12)
        self.assertAlmostEqual(
            result["L_times_logn_over_n"],
            result["L"] * math.log(100) / 100.0,
            places=12,
        )


if __name__ == "__main__":
    unittest.main()
