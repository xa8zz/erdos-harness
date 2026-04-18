import functools
import math
import unittest

from compute_sublinear import DivisibilityContext, HeuristicGame, exact_minimax


def brute_force_length(n: int) -> int:
    values = tuple(range(2, n + 1))
    full_mask = (1 << len(values)) - 1

    @functools.lru_cache(maxsize=None)
    def solve(legal_mask: int, prolonger_turn: bool) -> int:
        if legal_mask == 0:
            return 0
        legal_values = [values[i] for i in range(len(values)) if legal_mask & (1 << i)]
        outcomes = []
        for move in legal_values:
            next_mask = 0
            for other in legal_values:
                if other == move:
                    continue
                if other % move != 0 and move % other != 0:
                    next_mask |= 1 << (other - 2)
            outcomes.append(1 + solve(next_mask, not prolonger_turn))
        return max(outcomes) if prolonger_turn else min(outcomes)

    return solve(full_mask, True)


class EngineTests(unittest.TestCase):
    def test_legality_updates_after_play(self) -> None:
        ctx = DivisibilityContext(12)
        game = HeuristicGame(ctx, seed=0)

        self.assertTrue(game.is_legal(8))
        game.play(8)

        self.assertFalse(game.is_legal(2))
        self.assertFalse(game.is_legal(4))
        self.assertFalse(game.is_legal(8))
        self.assertTrue(game.is_legal(3))
        self.assertTrue(game.is_legal(12))

    def test_exact_minimax_matches_bruteforce_on_tiny_n(self) -> None:
        for n in range(2, 11):
            result = exact_minimax(n)
            self.assertEqual(result["L_n"], brute_force_length(n), msg=f"n={n}")

    def test_initial_strategy_choices_on_small_board(self) -> None:
        ctx = DivisibilityContext(20)
        game = HeuristicGame(ctx, seed=0)

        self.assertEqual(game.choose_move("shortener", "S_star"), 2)
        self.assertEqual(game.choose_move("shortener", "S_shadow"), 2)
        self.assertEqual(game.choose_move("shortener", "S_primorial"), 2)

        self.assertEqual(game.choose_move("prolonger", "P_pb"), 14)
        self.assertEqual(game.choose_move("prolonger", "P_sh"), 12)
        self.assertEqual(game.choose_move("prolonger", "P_composite"), 12)
        self.assertEqual(game.choose_move("prolonger", "P_primorial_template"), 12)
        self.assertEqual(game.choose_move("prolonger", "P_maker_breaker"), 14)

        self.assertIn(game.choose_move("prolonger", "P_random"), range(11, 21))
        self.assertIn(game.choose_move("prolonger", "P_pivot"), range(11, 21))
        self.assertIn(game.choose_move("prolonger", "P_anti_S_star"), range(11, 21))


if __name__ == "__main__":
    unittest.main()
