import unittest

from exact_minimax_v2 import ExactSolverV2, brute_force_minimax


class ExactMinimaxV2Tests(unittest.TestCase):
    def test_matches_bruteforce_through_twelve(self) -> None:
        for n in range(2, 13):
            brute = brute_force_minimax(n)
            solver = ExactSolverV2(n)
            result = solver.solve()
            self.assertEqual(result["L_n"], brute["L_n"], msg=f"n={n}")

    def test_even_boundary_puts_n_over_2_in_lower_only(self) -> None:
        solver = ExactSolverV2(40)
        self.assertIn(20, solver.lower_values)
        self.assertNotIn(20, solver.upper_values)
        self.assertIn(21, solver.upper_values)

    def test_returns_principal_variation(self) -> None:
        solver = ExactSolverV2(12)
        result = solver.solve()
        self.assertTrue(result["principal_variation"])
        self.assertEqual(result["principal_variation"][0], result["first_move"])


if __name__ == "__main__":
    unittest.main()
