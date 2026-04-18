import unittest

from shortener_stress import StressContext, StressGame, exact_l40_value


class ShortenerStressTests(unittest.TestCase):
    def test_exact_l40_sanity_matches_phase1_solver(self) -> None:
        self.assertEqual(exact_l40_value(), 16)

    def test_initial_strategy_choices_on_small_board(self) -> None:
        game = StressGame(StressContext(20), seed=0)

        self.assertEqual(game.choose_move("shortener", "S_star"), 3)
        self.assertEqual(game.choose_move("shortener", "S_harm"), 6)
        self.assertEqual(game.choose_move("shortener", "S_topdown"), 7)

        self.assertEqual(game.choose_move("prolonger", "P_harm"), 6)
        self.assertIn(game.choose_move("prolonger", "P_random"), range(2, 21))

    def test_block_product_and_carrier_snipe_on_fresh_board(self) -> None:
        game = StressGame(StressContext(1000), seed=0)

        block, product = game.current_odd_prime_block()
        self.assertEqual(block, (3, 5, 7))
        self.assertEqual(product, 105)
        self.assertEqual(game.choose_move("prolonger", "P_block_product"), 105)
        self.assertEqual(game.choose_move("shortener", "S_carrier_snipe"), 7)

    def test_adaptive_prime_falls_back_when_last_move_kills_its_prime_divisors(self) -> None:
        game = StressGame(StressContext(1000), seed=0)
        game.play(105, role="prolonger")
        self.assertEqual(game.last_prolonger_move, 105)
        self.assertEqual(game.choose_move("shortener", "S_adaptive_prime"), 11)

    def test_antistar_uses_exact_small_board_search(self) -> None:
        game = StressGame(StressContext(30), seed=0)
        exhaustive_move = game.best_antistar_move_exhaustive()
        self.assertEqual(game.choose_move("prolonger", "P_antiStar"), exhaustive_move)


if __name__ == "__main__":
    unittest.main()
