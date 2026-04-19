import math
import unittest

from freshness_toy import OneCylinderToy, greedy_useful_residual_sequence
from transversal_small_h import (
    ExactTopFacetSolver,
    StaticCoverSolver,
    TopFacetHypergraph,
    brute_force_game_value,
    compute_state_shadow_stats,
    measure_shadow_profile,
    simulate_game,
    solve_against_fixed_prolonger,
)
from transversal_small_h_strategy import (
    audit_shortener_policy_against_exact,
    audit_shortener_policy_on_principal_variations,
    make_prolonger_shadow_pressure,
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

    def test_shadow_pressure_prolonger_targets_post_reply_shadow(self) -> None:
        sigma = make_shortener_sigma()
        shadow_pressure = make_prolonger_shadow_pressure(sigma)
        hypergraph = TopFacetHypergraph(6, 4)

        first_state = hypergraph.state_view(0, 0, False)
        first_edge = hypergraph.edge_label(shadow_pressure(first_state, None))
        self.assertEqual(first_edge, (0, 1, 2, 3))

        first_edge_index = hypergraph.edges.index(first_edge)
        captured_mask = hypergraph.edge_vertex_masks[first_edge_index]
        reply_state = hypergraph.state_view(0, captured_mask, True)
        reply_vertex = sigma(reply_state, None)
        claimed_mask = 1 << reply_vertex

        second_state = hypergraph.state_view(claimed_mask, captured_mask, False)
        second_edge = hypergraph.edge_label(shadow_pressure(second_state, None))
        self.assertEqual(second_edge, (1, 2, 4, 5))

    def test_measure_shadow_profile_tracks_useful_top_facets(self) -> None:
        sigma = make_shortener_sigma()
        shadow_pressure = make_prolonger_shadow_pressure(sigma)
        profile = measure_shadow_profile(4, 3, sigma, shadow_pressure)

        self.assertEqual(profile["T"], 1)
        self.assertEqual(profile["max_useful_top_facets"], 5)
        self.assertEqual(profile["max_useful_top_facets_turn"], 3)
        self.assertEqual(profile["max_closed_edges"], 2)
        self.assertEqual(profile["max_normalized_captured_boundary"], 3.0)

    def test_shadow_stats_track_closed_and_live_layers(self) -> None:
        hypergraph = TopFacetHypergraph(4, 3)
        captured_mask = (
            (1 << hypergraph.vertex_index[(0, 1)])
            | (1 << hypergraph.vertex_index[(0, 2)])
            | (1 << hypergraph.vertex_index[(1, 2)])
        )
        claimed_mask = 1 << hypergraph.vertex_index[(0, 3)]

        stats = compute_state_shadow_stats(hypergraph, claimed_mask, captured_mask)
        layers = {layer.defect: layer for layer in stats.layers}

        self.assertEqual(stats.unhit_edges, 2)
        self.assertEqual(stats.live_edges, 1)
        self.assertEqual(stats.closed_edges, 1)

        top = layers[1]
        self.assertEqual(top.shadow_total, 5)
        self.assertEqual(top.unavailable_total, 4)
        self.assertEqual(top.claimed_total, 1)
        self.assertEqual(top.captured_total, 3)
        self.assertEqual(top.unavailable_in_shadow, 3)
        self.assertEqual(top.claimed_in_shadow, 0)
        self.assertEqual(top.captured_in_shadow, 3)
        self.assertEqual(top.available_in_shadow, 2)
        self.assertEqual(top.unavailable_outside_shadow, 1)
        self.assertEqual(top.claimed_outside_shadow, 1)
        self.assertEqual(top.captured_outside_shadow, 0)

        codim_two = layers[2]
        self.assertEqual(codim_two.shadow_total, 4)
        self.assertEqual(codim_two.unavailable_total, 4)
        self.assertEqual(codim_two.claimed_total, 2)
        self.assertEqual(codim_two.captured_total, 3)
        self.assertEqual(codim_two.unavailable_in_shadow, 4)
        self.assertEqual(codim_two.claimed_in_shadow, 2)
        self.assertEqual(codim_two.captured_in_shadow, 3)
        self.assertEqual(codim_two.available_in_shadow, 0)
        self.assertEqual(codim_two.unavailable_outside_shadow, 0)
        self.assertEqual(codim_two.claimed_outside_shadow, 0)
        self.assertEqual(codim_two.captured_outside_shadow, 0)


class FreshnessToyTests(unittest.TestCase):
    def test_h3_m7_greedy_sequence_has_useful_residuals_without_fresh_witness(self) -> None:
        toy, sequence, states = greedy_useful_residual_sequence(3, 7)

        self.assertEqual(
            sequence,
            [
                (0, 1, 2),
                (0, 1, 4),
                (0, 2, 4),
                (0, 1, 7),
                (0, 4, 7),
            ],
        )
        final_state = states[-1]
        self.assertEqual(final_state.claims, ((3,), (5,), (6,), (2, 7)))
        self.assertEqual(toy.useful_residual_targets(final_state), ((1, 2, 4), (1, 4, 7)))

        for shield in toy.useful_shields(final_state):
            self.assertEqual(toy.fresh_witnesses(shield, final_state, minimum_degree=3), ())

        first_useful_state = states[3]
        self.assertEqual(toy.useful_residual_targets(first_useful_state), ((1, 2, 4),))
        for shield in toy.useful_shields(first_useful_state):
            self.assertEqual(toy.fresh_witnesses(shield, first_useful_state, minimum_degree=3), ())

    def test_h4_m8_greedy_sequence_has_useful_residual_without_fresh_witness(self) -> None:
        toy, sequence, states = greedy_useful_residual_sequence(4, 8)

        self.assertEqual(
            sequence,
            [
                (0, 1, 2, 3),
                (0, 1, 2, 5),
                (0, 1, 2, 7),
                (0, 1, 3, 5),
                (0, 2, 3, 5),
            ],
        )
        final_state = states[-1]
        self.assertEqual(final_state.claims, ((4,), (6,), (8,), (3, 7), (5, 7)))
        self.assertEqual(toy.useful_residual_targets(final_state), ((1, 2, 3, 5),))

        for shield in toy.useful_shields(final_state):
            self.assertEqual(toy.fresh_witnesses(shield, final_state, minimum_degree=4), ())

    def test_play_round_rejects_star_containing_claimed_certificate(self) -> None:
        toy = OneCylinderToy(3, 7)
        state = toy.play_round(toy.initial_state(), (0, 1, 2))
        self.assertEqual(state.claims, ((3,),))
        with self.assertRaises(ValueError):
            toy.play_round(state, (0, 1, 3))


if __name__ == "__main__":
    unittest.main()
