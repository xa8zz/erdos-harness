#!/usr/bin/env python3
"""Machine verification of R172/R173 audit claims 2 and 4.

Claim 2 (static thin fortress): V = {j*m : j in 1..5, m odd in (n/6, n/4], jm <= n},
A = (n/2, n] \\ V.  Check (a) A antichain, (b) A-V incomparability, (c) full cover
of [2,n] \\ (A u V) by A, (d) max V-internal degree <= 4, (e) linear sizes.

Claim 4 (prime-frontier race): S plays smallest live prime; P plays batch products
(smallest live primes, product <= n^0.9, padded by a prime into (n/2, n]).
Measure q_j growth, sum 1/q_j, and |union of multiples of played primes| / n
against the predicted cap 1 - 1/e ~ 0.632.
"""
import sys
from math import log

# ---------------- Claim 2: fortress checker ----------------

def check_fortress(n):
    lo, hi = n // 6, n // 4          # m odd with n/6 < m <= n/4
    V = set()
    bottom = []                       # V elements <= n/2 (only these can divide into (n/2,n])
    for m in range(lo + 1, hi + 1):
        if m % 2 == 0:
            continue
        for j in range(1, 6):
            v = j * m
            if v <= n:
                V.add(v)
    A = set(x for x in range(n // 2 + 1, n + 1)) - V

    # (a) antichain: a1 | a2 with a1 != a2 forces a2 >= 2*a1 > n. Structural; assert bounds.
    assert all(x > n // 2 for x in A)

    # (b) no element of A comparable to any element of V.
    # Proper divisors of v <= n are <= n/2 < min(A); only multiples matter.
    bad_b = []
    for v in V:
        if v <= n // 2:
            k = n // 2 // v + 1
            while k * v <= n:
                if k * v in A:
                    bad_b.append((v, k * v))
                k += 1

    # (c) every x in [2,n] outside A u V has a multiple in A.
    # (a | x impossible for x <= n/2 since a > n/2.)
    uncovered = []
    for x in range(2, n // 2 + 1):
        if x in V:
            continue
        ok = False
        k = n // 2 // x + 1
        while k * x <= n:
            if k * x not in V:      # multiple in (n/2,n] not in V  => in A
                ok = True
                break
            k += 1
        if not ok:
            uncovered.append(x)

    # (d) V-internal degree <= 4.
    maxdeg, argmax = 0, None
    for v in V:
        deg = 0
        # multiples of v inside V
        k = 2
        while k * v <= n:
            if k * v in V:
                deg += 1
            k += 1
        # divisors of v inside V
        d = 1
        while d * d <= v:
            if v % d == 0:
                if d != v and d in V:
                    deg += 1
                q = v // d
                if q != v and q != d and q in V:
                    deg += 1
            d += 1
        if deg > maxdeg:
            maxdeg, argmax = deg, v

    return dict(n=n, V=len(V), A=len(A), Vfrac=len(V)/n, Afrac=len(A)/n,
                bad_b=bad_b[:5], n_bad_b=len(bad_b),
                uncovered=uncovered[:10], n_uncovered=len(uncovered),
                maxdeg=maxdeg, argmax=argmax)


# ---------------- Claim 4: race simulator ----------------

def sieve(n):
    is_p = bytearray([1]) * (n + 1)
    is_p[0:2] = b"\x00\x00"
    for i in range(2, int(n ** 0.5) + 1):
        if is_p[i]:
            is_p[i * i:: i] = bytearray(len(range(i * i, n + 1, i)))
    return is_p


def race(n, eps=0.1, verbose=True):
    is_p = sieve(n)
    primes = [i for i in range(2, n + 1) if is_p[i]]
    dead = bytearray(n + 1)          # dead[p]=1: p played or divides a played product
    covered = bytearray(n + 1)       # union of multiples of S-played primes
    qs = []
    s_sum = 0.0
    cap = n ** (1 - eps)             # core product cap
    lo_idx = 0                       # frontier into primes for "smallest live"

    def smallest_live(from_idx):
        i = from_idx
        while i < len(primes) and dead[primes[i]]:
            i += 1
        return i

    import bisect
    moves = 0
    p_burn_count = 0
    p_pass_count = 0
    max_front_burned = 0
    front_log = []
    while True:
        # --- P batch move, 2-adic padding: core = greedy smallest live primes
        # with prod <= n/2; play x = prod * 2^a in (n/2, n]. Legal because a
        # burned-but-unplayed prime (2, after move one) remains a valid factor
        # of new moves: x is live iff no S-PLAYED prime divides it.
        i0 = smallest_live(lo_idx)
        front = primes[i0] if i0 < len(primes) else n
        core, prod = [], 1
        j = i0
        while j < len(primes) and prod * primes[j] <= n // 2:
            p = primes[j]
            if not dead[p]:
                core.append(p); prod *= p
            j += 1
        if core:
            # x = prod * 2^a with a = floor(log2(n/prod)) >= 1  -> x in (n/2, n]
            for p in core:
                dead[p] = 1
            dead[2] = 1
            p_burn_count += len(core)
            max_front_burned = max(max_front_burned, core[-1])
        else:
            p_pass_count += 1  # every prime > n/2: unburnable reserve; P is done

        # --- S move: smallest live prime ---
        lo_idx = smallest_live(lo_idx)
        if lo_idx >= len(primes):
            break
        q = primes[lo_idx]
        qs.append(q)
        s_sum += 1.0 / q
        dead[q] = 1
        covered[q::q] = b"\x01" * len(range(q, n + 1, q))
        moves += 1
        if moves % 64 == 0:
            front_log.append((moves, q))
        if moves > len(primes):
            break

    cov = sum(covered[2:]) / (n - 1)
    if verbose:
        n_reserve = sum(1 for q in qs if q > n // 2)
        stolen = [q for q in qs if q <= n // 2]
        s_stolen = sum(1.0 / q for q in stolen)
        print(f"n={n}: S made {len(qs)} prime moves "
              f"({len(stolen)} stolen <= n/2, {n_reserve} reserve > n/2)")
        print(f"  P burned {p_burn_count} primes (deepest {max_front_burned}, n/2={n//2}); "
              f"sum 1/q stolen = {s_stolen:.4f} (predict ln2={0.6931:.4f}), total = {s_sum:.4f}")
        if front_log:
            samp = [front_log[i] for i in
                    sorted(set([0, len(front_log)//4, len(front_log)//2,
                                3*len(front_log)//4, len(front_log)-1]))]
            print(f"  front trajectory (S-move #, q): {samp}")
        print(f"  q_1..q_5 = {qs[:5]},  q_last = {qs[-1] if qs else None}")
        # growth check: q_j vs j*log n
        L = log(n)
        for frac in (0.1, 0.25, 0.5, 0.75, 1.0):
            j = max(1, int(len(qs) * frac) - 1)
            print(f"  j={j+1}: q_j={qs[j]}, q_j/(j*log n)={qs[j]/((j+1)*L):.3f}")
        print(f"  union coverage = {cov:.4f}  (claim cap: 1 - 1/e = {1 - 2.718281828**-1:.4f})")
    return s_sum, cov, qs


if __name__ == "__main__":
    print("=== Claim 2: fortress checks ===")
    for n in (1000, 10000, 100000):
        r = check_fortress(n)
        status = "PASS" if (r["n_bad_b"] == 0 and r["n_uncovered"] == 0 and r["maxdeg"] <= 4) else "FAIL"
        print(f"n={r['n']}: |V|={r['V']} ({r['Vfrac']:.3f}n) |A|={r['A']} ({r['Afrac']:.3f}n) "
              f"maxVdeg={r['maxdeg']} (at {r['argmax']}) badB={r['n_bad_b']} uncovered={r['n_uncovered']} -> {status}")
        if r["n_bad_b"]:
            print("   A-V comparabilities:", r["bad_b"])
        if r["n_uncovered"]:
            print("   uncovered:", r["uncovered"])
    print()
    print("=== Claim 4: race simulation ===")
    for n in (10**5, 10**6):
        race(n)
