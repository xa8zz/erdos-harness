#!/usr/bin/env python3
"""Test the sqrt-log law: alternating prime race coverage (F24/F25).

Model: P and S walk the odd primes ascending, alternating (P first).
P "defuses" his primes (S can never fire them); S "fires" hers: firing p
kills every surviving top-half multiple of p. Stop when primes exceed n/2
(interior exhausted). Survivors = top-half z all of whose prime factors
(counted from the interior-relevant set) were P-defused — plus top-half
primes (born free).

Predicts survivors ~ c * n / (log n)^{1/2} if the alternation-share
heuristic is right (coverage shortfall prod over P-half of (1-1/p)).

Variants:
  share d: P takes every k-th prime with density d (e.g. 1/2, 2/3) to test
           survivor-exponent = d dependence.
"""
import sys
from math import log

def run(n, pshare_num=1, pshare_den=2, skip2=True):
    # sieve smallest prime factor
    spf = list(range(n + 1))
    for i in range(2, int(n**0.5) + 1):
        if spf[i] == i:
            for j in range(i*i, n + 1, i):
                if spf[j] == j: spf[j] = i
    primes = [p for p in range(3 if skip2 else 2, n // 2 + 1) if spf[p] == p]
    # P claims indices where (i * pshare_num) % pshare_den < pshare_num  (density share)
    P_set = set()
    S_list = []
    acc = 0
    for i, p in enumerate(primes):
        acc += pshare_num
        if acc >= pshare_den:
            acc -= pshare_den
            P_set.add(p)
        else:
            S_list.append(p)
    # survivors: top-half z with all prime factors <= n/2 in P_set
    # (2 is handled: if skip2, S effectively fires 2 first — count odd only)
    half = n // 2
    surv = 0
    surv_primes = 0
    for z in range(half + 1, n + 1):
        x = z; ok = True; isprime = (spf[z] == z)
        if isprime:
            surv_primes += 1; continue
        while x > 1:
            p = spf[x]
            if skip2 and p == 2: ok = False; break
            if p <= half and p not in P_set: ok = False; break
            # prime factors > half can't be fired (not interior) — free
            while x % p == 0: x //= p
        if ok: surv += 1
    return surv, surv_primes

if __name__ == "__main__":
    ns = [10**4, 3*10**4, 10**5, 3*10**5, 10**6, 3*10**6, 10**7]
    if len(sys.argv) > 1: ns = [int(x) for x in sys.argv[1].split(",")]
    num, den = (int(sys.argv[2]), int(sys.argv[3])) if len(sys.argv) > 3 else (1, 2)
    d = num / den
    print(f"P share d={d:.3f}; predict survivors ~ c*n/(log n)^d")
    for n in ns:
        surv, sp = run(n, num, den)
        ln = log(n)
        print(f"n={n:>9} comp-surv={surv:>8} (+{sp} primes)  "
              f"surv/(n/ln^{d:.2f})={surv/(n/ln**d):.4f}  "
              f"surv/(n/ln)={surv/(n/ln):.4f}  surv/n={surv/n:.5f}", flush=True)
