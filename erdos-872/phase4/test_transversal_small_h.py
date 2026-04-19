import math
import unittest

from transversal_small_h import (
    ExactTopFacetSolver,
    StaticCoverSolver,
    TopFacetHypergraph,
    brute_force_game_value,
    simulate_game,
    solve_against_fixed_prolonger,
)
from transversal_small_h_strategy import (
    audit_shortener_policy_against_exact,
    audit_shortener_policy_on_principal_variations,
    make_prolonger_simplex_star_cascade,
    make_shortener_sigma,
)


class TopFacetHypergraphTests(unittest.TestCase):
    def test_hypergraph_counts_for_n5_h3(self) -> None:
        hypergraph = TopFacetHypergraph(5, 3)
        self.assertEqual(hypergraph.vertex_count, math.comb(5, 2))
        self.assertEqual(hypergraph.edge_count, math.comb(5, 3))
        self.assertTrue(all(degree == 3 for degree in hypergraph.vertex_degrees))

    def test_exact_solver_matches_bruteforce_for_n4_h3(self) -> None:
        expected = brute_force_game_value(4, 3)
        solver = ExactTopFacetSolver(4, 3)
        self.assertEqual(solver.solve()["T_star"], expected["T_star"])

    def test_static_cover_matches_triangle_turan_formula(self) -> None:
        solver = StaticCoverSolver(6, 3)
        expected = math.comb(6, 2) - (6 * 6 // 4)
        self.assertEqual(solver.solve(), expected)

    def test_sigma_matches_all_exact_principal_variations(self) -> None:
        sigma = make_shortener_sigma()
        audit = audit_shortener_policy_on_principal_variations(
            sigma,
            cases=((4, 3), (5, 3), (6, 3), (5, 4), (6, 4), (6, 5)),
        )
        self.assertTrue(all(item["mismatch_count"] == 0 for item in audit), msg=audit)

    def test_sigma_has_high_exact_state_agreement(self) -> None:
        sigma = make_shortener_sigma()
        audit = audit_shortener_policy_against_exact(
            sigma,
            cases=((4, 3), (5, 3), (6, 3), (5, 4), (6, 4), (6, 5)),
        )
        total_states = sum(item["total_states"] for item in audit)
        mismatches = sum(item["mismatch_count"] for item in audit)
        self.assertLess(mismatches / total_states, 0.05, msg=audit)

    def test_sigma_matches_principal_variation_first_reply(self) -> None:
        sigma = make_shortener_sigma()
        solver = ExactTopFacetSolver(6, 4)
        result = solver.solve()
        first_edge = result["principal_variation"][0][1]

        hypergraph = solver.hypergraph
        edge_index = hypergraph.edges.index(first_edge)
        state = hypergraph.state_view(0, hypergraph.edge_vertex_masks[edge_index], True)

        chosen = hypergraph.vertex_label(sigma(state, None))
        self.assertEqual(chosen, result["principal_variation"][1][1])

    def test_simplex_star_cascade_prioritizes_pivot_star_edges(self) -> None:
        hypergraph = TopFacetHypergraph(5, 3)
        cascade = make_prolonger_simplex_star_cascade(pivot=0)

        first_state = hypergraph.state_view(0, 0, False)
        first_edge = hypergraph.edge_label(cascade(first_state, None))
        self.assertEqual(first_edge, (0, 1, 2))

        first_edge_index = hypergraph.edges.index(first_edge)
        second_state = hypergraph.state_view(0, hypergraph.edge_vertex_masks[first_edge_index], False)
        second_edge = hypergraph.edge_label(cascade(second_state, None))
        self.assertEqual(second_edge, (0, 1, 3))

    def test_sigma_matches_exact_best_response_against_small_simplex_star(self) -> None:
        sigma = make_shortener_sigma()
        cascade = make_prolonger_simplex_star_cascade(pivot=0)

        optimal = solve_against_fixed_prolonger(4, 3, cascade)
        greedy = simulate_game(4, 3, sigma, cascade, seed=0)

        self.assertEqual(optimal["T_best"], 1)
        self.assertEqual(optimal["principal_variation"][0], ("P", (0, 1, 2)))
        self.assertEqual(greedy["T"], optimal["T_best"])


if __name__ == "__main__":
    unittest.main()
