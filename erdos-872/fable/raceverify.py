#!/usr/bin/env python3
"""Exact model check: survivors vs the literal sieve product, per n and share."""
from math import log
import sys

def spf_sieve(n):
    spf = list(range(n + 1))
    for i in range(2, int(n**0.5) + 1):
        if spf[i] == i:
            for j in range(i*i, n + 1, i):
                if spf[j] == j: spf[j] = i
    return spf

def run(n, num, den, spf):
    primes = [p for p in range(3, n // 2 + 1) if spf[p] == p]
    P_set = set(); acc = 0; prod = 1.0
    for p in primes:
        acc += num
        if acc >= den: acc -= den; P_set.add(p)
        else: prod *= (1.0 - 1.0 / p)          # S-half sieve product
    half = n // 2
    surv = 0
    for z in range(half + 1, n + 1):
        if spf[z] == z: continue
        x = z; ok = True
        while x > 1:
            p = spf[x]
            if p == 2 or (p not in P_set): ok = False; break
            while x % p == 0: x //= p
        if ok: surv += 1
    pred = 0.5 * prod            # odd density * product over fired primes
    return surv, pred

if __name__ == "__main__":
    ns = [int(x) for x in sys.argv[1].split(",")]
    shares = [(1,2),(2,3),(1,3)]
    for n in ns:
        spf = spf_sieve(n)
        out = [f"n={n:>8}"]
        for num, den in shares:
            surv, pred = run(n, num, den, spf)
            out.append(f"d={num}/{den}: meas={surv/n:.5f} pred={pred:.5f} ratio={surv/n/pred:.3f}")
        print("  ".join(out), flush=True)
