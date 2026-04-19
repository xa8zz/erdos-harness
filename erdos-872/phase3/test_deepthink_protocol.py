import math
import sys
import unittest
from pathlib import Path


THIS_DIR = Path(__file__).resolve().parent
if str(THIS_DIR) not in sys.path:
    sys.path.insert(0, str(THIS_DIR))

from deepthink_protocol import DeepThinkContext, DeepThinkGame, play_match


class DeepThinkProtocolTests(unittest.TestCase):
    def test_thresholds_and_phase1_block_build_at_n1000(self) -> None:
        ctx = DeepThinkContext(1000)
        self.assertEqual(ctx.y_s, 3)
        self.assertEqual(ctx.y_m, 10)
        self.assertEqual(ctx.y_L, 316)
        self.assertEqual(ctx.small_primes, (2, 3))
        self.assertEqual(ctx.padding_primes, (5, 7))

        game = DeepThinkGame(ctx, "S_race")
        block, attached = game.phase1_candidate(2)
        self.assertEqual(block, 10)
        self.assertEqual(attached, (5,))

        game.play_move(block, role="prolonger")
        block2, attached2 = game.phase1_candidate(3)
        self.assertEqual(block2, 21)
        self.assertEqual(attached2, (7,))

    def test_phase3_semiprime_becomes_illegal_after_shortener_preempts_q(self) -> None:
        ctx = DeepThinkContext(1000)
        game = DeepThinkGame(ctx, "S_race")
        self.assertEqual(game.phase3_candidate(2, 317), 634)
        game.play_move(317, role="shortener")
        self.assertFalse(game.verify_move_is_legal(634))

    def test_play_match_reaches_verified_antichain_and_maximal_state(self) -> None:
        result, game = play_match(DeepThinkContext(1000), "S_smallest_legal", return_game=True)
        self.assertGreater(result["L"], 0)
        self.assertAlmostEqual(
            result["L_log_n_over_n"],
            result["L"] * math.log(1000) / 1000.0,
            places=12,
        )
        game.assert_replay_consistent()
        self.assertEqual(game.legal_count, 0)


if __name__ == "__main__":
    unittest.main()
