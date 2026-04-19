import math
import sys
import unittest
from fractions import Fraction
from pathlib import Path


THIS_DIR = Path(__file__).resolve().parent
if str(THIS_DIR) not in sys.path:
    sys.path.insert(0, str(THIS_DIR))

from fan_hierarchy import (
    FanContext,
    count_rank_targets_exact,
    enumerate_rank_targets,
    proper_divisor_values,
    rank_delta,
    run_probe_a_match,
)


def brute_force_rank1_values(context: FanContext, delta: Fraction) -> list[int]:
    cutoff = int(context.n ** float(delta))
    while (cutoff + 1) ** delta.denominator <= context.n**delta.numerator:
        cutoff += 1
    while cutoff**delta.denominator > context.n**delta.numerator:
        cutoff -= 1
    cores = [prime for prime in context.odd_primes if prime <= cutoff]
    out: set[int] = set()
    for a in cores:
        lower = context.n / (2 * a)
        upper = context.n / a
        for b in context.odd_primes:
            if b <= lower:
                continue
            if b > upper:
                break
            out.add(a * b)
    return sorted(out)


class FanHierarchyTests(unittest.TestCase):
    def test_rank1_enumeration_matches_independent_bruteforce(self) -> None:
        context = FanContext(10_000)
        delta = rank_delta(1)
        targets = enumerate_rank_targets(context, 1, delta=delta)
        self.assertEqual([target.value for target in targets], brute_force_rank1_values(context, delta))

    def test_rank2_targets_have_expected_prime_factor_and_divisor_counts(self) -> None:
        context = FanContext(10_000)
        targets = enumerate_rank_targets(context, 2)
        self.assertGreater(len(targets), 0)
        for target in targets[:20]:
            self.assertEqual(len(target.factors), 3)
            self.assertEqual(math.prod(target.factors), target.value)
            self.assertEqual(len(proper_divisor_values(target)), 6)

    def test_exact_count_matches_enumeration_on_small_rank2_instance(self) -> None:
        context = FanContext(10_000)
        targets = enumerate_rank_targets(context, 2)
        self.assertEqual(count_rank_targets_exact(context, 2), len(targets))

    def test_probe_a_match_reaches_replay_consistent_terminal_state(self) -> None:
        result, game = run_probe_a_match(10_000, 1, "smallest-legal-prime", return_game=True)
        self.assertGreater(result["L_realized"], 0)
        self.assertGreaterEqual(result["P_targets"], 1)
        game.assert_replay_consistent()
        self.assertEqual(game.legal_count, 0)


if __name__ == "__main__":
    unittest.main()
