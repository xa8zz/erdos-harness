import math
import random
import unittest

from transversal_small_h import (
    ExactTopFacetSolver,
    StaticCoverSolver,
    TopFacetHypergraph,
    build_policy_registry,
    brute_force_game_value,
    prolonger_fixed_pair_core,
    prolonger_max_captured_overlap,
    run_grid,
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

    def test_fixed_pair_core_opens_on_edge_containing_pair(self) -> None:
        hypergraph = TopFacetHypergraph(6, 4)
        state = hypergraph.state_view(0, 0, False)
        edge_index = prolonger_fixed_pair_core(state, random.Random(0))
        self.assertTrue({0, 1}.issubset(hypergraph.edge_label(edge_index)))

    def test_max_captured_overlap_prefers_overlap_one_after_first_capture(self) -> None:
        hypergraph = TopFacetHypergraph(6, 4)
        first_edge = hypergraph.edges.index((0, 1, 2, 3))
        captured_mask = hypergraph.edge_vertex_masks[first_edge]
        state = hypergraph.state_view(0, captured_mask, False)
        edge_index = prolonger_max_captured_overlap(state, random.Random(0))
        overlap = (
            hypergraph.edge_vertex_masks[edge_index] & captured_mask
        ).bit_count()
        self.assertEqual(overlap, 1)

    def test_policy_registry_includes_counter_search_strategies(self) -> None:
        registry = build_policy_registry()
        self.assertIn("fixed_pair_core", registry.prolonger)
        self.assertIn("max_captured_overlap", registry.prolonger)
        self.assertIn("weighted_overlap_random", registry.prolonger)

    def test_run_grid_accepts_custom_instances_and_registry(self) -> None:
        rows = run_grid(
            exact_limits={3: 4},
            static_cover_exact_limits={3: 4},
            heuristic_trials=1,
            instances=[(4, 3)],
            registry=build_policy_registry(),
        )
        self.assertEqual(len(rows), 1)
        row = rows[0]
        self.assertEqual((row["N"], row["h"]), (4, 3))
        self.assertIn("max_degree__fixed_pair_core__mean", row)
        self.assertIn("random_high_degree__weighted_overlap_random__min", row)


if __name__ == "__main__":
    unittest.main()
