import math
import sys
import unittest
from pathlib import Path


THIS_DIR = Path(__file__).resolve().parent
if str(THIS_DIR) not in sys.path:
    sys.path.insert(0, str(THIS_DIR))

from sparse_subset import SparseSubsetContext, SparseSubsetInstance, is_isolated, verify_antichain


def brute_force_mq(n: int, q_values: tuple[int, ...], odd_primes: tuple[int, ...]) -> dict[int, tuple[int, ...]]:
    out: dict[int, tuple[int, ...]] = {}
    for q in q_values:
        for index, a in enumerate(odd_primes):
            if a == q:
                continue
            for b in odd_primes[index + 1 :]:
                if b == q:
                    continue
                m = q * a * b
                if m <= n // 3 or m > n:
                    continue
                factors = tuple(sorted((q, a, b)))
                req = tuple(sorted((2 * factors[0] * factors[1], 2 * factors[0] * factors[2], 2 * factors[1] * factors[2])))
                prior = out.get(m)
                if prior is None:
                    out[m] = req
                else:
                    assert prior == req
    return out


class SparseSubsetTests(unittest.TestCase):
    def test_mq_enumeration_matches_independent_bruteforce_on_small_instance(self) -> None:
        context = SparseSubsetContext(1000)
        instance = SparseSubsetInstance(context, 0.35, 0.45)
        expected = brute_force_mq(1000, instance.Q, context.odd_primes)
        self.assertEqual(instance.m_requirements, expected)

    def test_mq_deduplicates_multiple_q_representations_by_integer(self) -> None:
        context = SparseSubsetContext(1_000_000)
        instance = SparseSubsetInstance(context, 0.35, 0.45)
        m = 23 * 127 * 131
        self.assertIn(m, instance.m_requirements)
        self.assertEqual(
            instance.m_requirements[m],
            tuple(sorted((2 * 23 * 127, 2 * 23 * 131, 2 * 127 * 131))),
        )
        q_reps = [q for q in instance.Q if m % q == 0]
        self.assertGreaterEqual(len(q_reps), 2)

    def test_isolation_requires_all_three_carriers(self) -> None:
        req = (6026, 5842, 33274)
        self.assertFalse(is_isolated(req, {6026, 5842}))
        self.assertTrue(is_isolated(req, set(req)))

    def test_verify_antichain_on_constructed_carrier_sets(self) -> None:
        context = SparseSubsetContext(10_000)
        instance = SparseSubsetInstance(context, 0.35, 0.45)
        explicit = instance.build_explicit_subset()
        self.assertTrue(verify_antichain(explicit, context.n))
        self.assertFalse(verify_antichain({30, 60}, 100))


if __name__ == "__main__":
    unittest.main()
