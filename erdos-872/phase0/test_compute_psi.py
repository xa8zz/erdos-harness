import itertools
import unittest

from compute_psi import DivisibilityInstance


def brute_force_beta(n: int, shields: list[int]) -> int:
    lower = [x for x in range(2, n // 2 + 1) if all(u % x != 0 for u in shields)]
    weights = {
        x: n // x - n // (2 * x) - 1
        for x in range(2, n // 2 + 1)
    }
    best = 0
    for r in range(len(lower) + 1):
        for subset in itertools.combinations(lower, r):
            if all(a % b != 0 and b % a != 0 for i, a in enumerate(subset) for b in subset[i + 1 :]):
                best = max(best, sum(weights[x] for x in subset))
    return best


class BetaSolverTests(unittest.TestCase):
    def test_exact_beta_matches_bruteforce_for_small_instances(self) -> None:
        cases = [
            (12, []),
            (12, [8]),
            (14, [9]),
            (16, [10, 12]),
        ]
        for n, shields in cases:
            instance = DivisibilityInstance(n)
            self.assertEqual(instance.beta(shields), brute_force_beta(n, shields))


if __name__ == "__main__":
    unittest.main()
