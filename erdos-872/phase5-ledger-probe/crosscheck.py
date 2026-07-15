"""Cross-check the incremental Game bookkeeping against brute-force recomputation
at every ply, for small n, across many random seeds. This validates:
  - legal_pdc[y] == count of legal proper divisors of y (brute force)
  - nonmin_S1_pop == count of S1 members that are legal & nonminimal
  - degree[e] == count of legal&nonminimal S1 targets divisible by e (for legal e<=q)
  - small_div_count[p] == count of legal divisors <=q of p (for legal p)
  - legal_S1_count == count of legal S1 members
  - antichain maintained throughout
"""
import numpy as np
import random
from sim import Game, sieve_spf, divisors_trial

def brute_check(g, n, q, h):
    status = g.status
    legal = (status[2:n+1] == 0)
    # legal_pdc brute
    # legal_pdc is only guaranteed accurate (kept live-updated) while y itself is
    # still legal; once y is chosen/blocked we stop maintaining it (frozen), by design.
    for y in range(2, n+1):
        if status[y] == 0:
            cnt = 0
            for d in range(2, y):
                if y % d == 0 and status[d] == 0:
                    cnt += 1
            assert g.legal_pdc[y] == cnt, f"legal_pdc mismatch at y={y}: got {g.legal_pdc[y]} want {cnt}"
    # nonmin S1 pop brute + degree brute (only for legal e)
    pop = 0
    deg_brute = {}
    for y in range(q+1, h+1):
        if status[y] == 0 and g.legal_pdc[y] > 0:
            pop += 1
    assert g.nonmin_S1_pop == pop, f"nonmin_S1_pop mismatch: got {g.nonmin_S1_pop} want {pop}"

    legal_S1 = sum(1 for y in range(q+1, h+1) if status[y] == 0)
    assert g.legal_S1_count == legal_S1, f"legal_S1_count mismatch: got {g.legal_S1_count} want {legal_S1}"

    for e in range(2, q+1):
        if status[e] == 0:
            cnt = 0
            for y in range(q+1, h+1):
                if y % e == 0 and status[y] == 0 and g.legal_pdc[y] > 0:
                    cnt += 1
            assert g.degree[e] == cnt, f"degree mismatch at e={e}: got {g.degree[e]} want {cnt}"

    for p in range(2, n+1):
        if status[p] == 0:
            cnt = 0
            for d in range(2, min(p, q)+1):
                if p % d == 0 and status[d] == 0:
                    cnt += 1
            assert g.small_div_count[p] == cnt, f"small_div_count mismatch at p={p}: got {g.small_div_count[p]} want {cnt}"

def run_with_checks(n, policy, seed):
    g = Game(n, seed)
    spf = sieve_spf(n)
    g.spf = spf
    q, h = g.q, g.h
    status = g.status
    turn = 0
    ply = 0
    while g.legal_pool:
        pop = g.nonmin_S1_pop
        active = (g.S1_size > 0) and (pop > 0.25 * g.S1_size)
        g._active_flag_this_move = active
        if turn == 0:
            mv = g.prolonger_move(policy)
        else:
            mv, _ = g.shortener_move()
        if mv is None:
            break
        g.play_move(mv)
        ply += 1
        brute_check(g, n, q, h)
        turn ^= 1
    ok, viol = g.verify_antichain()
    assert ok, viol
    assert not g.legal_pool
    assert np.all(g.status[2:n+1] != 0)
    print(f"n={n} policy={policy} seed={seed}: OK, {ply} plies, all brute checks passed")

if __name__ == "__main__":
    for n in (30, 47, 60, 80):
        for policy in ("random", "greedy_block", "shell_defender"):
            for seed in (1, 2, 3):
                run_with_checks(n, policy, seed)
    print("ALL CROSSCHECKS PASSED")
