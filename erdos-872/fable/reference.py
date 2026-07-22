#!/usr/bin/env python3
"""Ground-truth reference for the antichain game. Deliberately naive:
plain memoized minimax, no alpha-beta, no shortcuts. Values 2..n, bit i <-> i+2.
Prolonger (turn 0) maximizes total moves; Shortener (turn 1) minimizes."""
import sys
from functools import lru_cache

def solve(n):
    sz = n - 1
    conf = []
    for i in range(sz):
        v = i + 2
        m = 1 << i
        for j in range(sz):
            w = j + 2
            if i != j and (v % w == 0 or w % v == 0):
                m |= 1 << j
        conf.append(m)

    sys.setrecursionlimit(100000)

    @lru_cache(maxsize=None)
    def val(live, turn):
        if live == 0:
            return 0
        best = None
        m = live
        while m:
            i = (m & -m).bit_length() - 1
            m &= m - 1
            v = 1 + val(live & ~conf[i], 1 - turn)
            if best is None or (turn == 0 and v > best) or (turn == 1 and v < best):
                best = v
        return best

    full = (1 << sz) - 1
    return val(full, 0)

if __name__ == "__main__":
    lo, hi = int(sys.argv[1]), int(sys.argv[2])
    for n in range(lo, hi + 1):
        print(n, solve(n), flush=True)
