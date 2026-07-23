#!/usr/bin/env python3
"""Line D v3: price-profile differential game (overlap-free by construction).

State: cells (ip, iv) over price pi = log(cheapest live weapon) and band v =
log(direction's fresh-prime scale at last reprice). Each cell: [count N, mass M]
of live weapons (count) and their assigned live mass (cheapest-cover assignment).

Dynamics (price-ordered frontier, both sides greedy, alternation = equal budgets):
  - Active cell = cell with max per-weapon mass (S's best per-move capture).
  - If P contests (per-weapon mass worth denying): weapons resolve S:P at ratio
    pi : Lambda  (S cashes 1/move, P burns Lambda/pi per move).
    S-share of weapons cashed (mass killed); P-share burned (mass repriced upward
    via the Buchstab child-split kernel into (pi + t, t) cells, t >= v).
  - Else S sweeps alone (all mass killed, 1 weapon/move).
  - Move ledger: S-moves = weapons cashed; P-moves = weapons_burned * pi/Lambda.
    Alternation enforced ex post: total = 2 * max(S_moves, P_moves) + mop.
  - Terminal: when best per-weapon mass <= dust (1 element), remaining mass mops
    at 1 move/element.

Output: c = L/n vs Lambda. The asymptotic question: c(Lambda) -> 0 or c* > 0.
"""
import math, sys
from collections import defaultdict

EG = 0.5615948103

def omega_buch(t):
    if t < 1: return 0.0
    if t <= 2: return 1.0/t
    if t <= 3: return (1.0+math.log(t-1.0))/t
    return EG

def rough_dens(logM, v):
    """density of v-rough integers in [1, e^logM]  (v = log of rough bound)."""
    if v <= math.log(2): return 1.0
    if logM <= 0: return 0.0
    if logM < v: return 0.0
    return omega_buch(logM/v)/v

class Race:
    def __init__(self, LAM, B=None):
        self.L = LAM
        self.B = B or max(48, int(3*LAM))
        self.du = LAM/self.B
        # cells[(ip,iv)] = [N_weapons, M_mass]; normalized: board mass 1, counts /n
        # counts stored as absolute (units of weapons), mass normalized to 1.
        self.n = math.exp(LAM)
        self.cells = defaultdict(lambda: [0.0, 0.0])
        self.S_moves = 0.0; self.P_moves = 0.0; self.killed = 0.0
        self._seed()

    def idx(self, x): return min(self.B-1, max(0, int(x/self.du)))

    def _seed(self):
        """initial profile: every x assigned to its smallest prime p: cell
        (pi=log p, v=log p); count = #primes in bin; mass = (1/p)*rough split."""
        tot = 0.0
        for i in range(self.B):
            v = (i+0.5)*self.du
            if v > self.L: break
            cnt = math.exp(v)/v*self.du          # primes in bin
            logM = self.L - v
            dens = rough_dens(logM, v)           # quotient must be v-rough (P^->=p)
            m_per = math.exp(-v)*(dens if logM >= v else 0.0) + 1.0/self.n
            k = (i, i)
            self.cells[k][0] += cnt
            self.cells[k][1] += cnt*m_per
            tot += cnt*m_per
        for k in self.cells: self.cells[k][1] /= tot

    def reprice(self, key, wcount, mass):
        """burned weapons at cell (pi,v): their mass reprices: for weapon w with
        rough bound v, next cover = w*q, q fresh prime scale t in [v, L-pi]:
        child cell (pi+t, t). Kernel: mass share ~ (1/t)*rough_dens residual;
        weapon count: each burned weapon spawns children counts e^t/t dt (capped
        by mass: thin children merge into dust naturally)."""
        ip, iv = key
        pi = (ip+0.5)*self.du; v = (iv+0.5)*self.du
        lo, hi = v, self.L - pi
        if hi <= lo or mass <= 0:
            # nowhere to reprice: mass becomes dust-grade (price ~ Lambda)
            self.cells[(self.B-1, iv)][0] += mass*self.n  # each element its own weapon
            self.cells[(self.B-1, iv)][1] += mass
            return
        nb = max(3, int((hi-lo)/self.du)); dt = (hi-lo)/nb
        ws = []
        for j in range(nb):
            t = lo + (j+0.5)*dt
            # mass share: element w*m, m v-rough with smallest prime at scale t:
            # density ~ (e^{-t}/t)*rough_dens(remaining, t)-flavored; use kernel
            # weight (dt/t)*rough_dens(L-pi-t, t) (log-uniform prime layer x rough tail)
            w = (dt/t)*max(rough_dens(self.L-pi-t, t), 1e-12/self.L)
            ws.append((t, w))
        tw = sum(w for _, w in ws)
        if tw <= 0:
            self.cells[(self.B-1, iv)][0] += mass*self.n
            self.cells[(self.B-1, iv)][1] += mass
            return
        for t, w in ws:
            share = w/tw
            m_child = mass*share
            # child weapon count: pieces at scale pi+t: per-mass count ~ 1/(cone size)
            cone = math.exp(-(pi+t))*max(rough_dens(self.L-pi-t, t), 1e-300) + 1.0/self.n
            cnt = m_child/cone
            k2 = (max(self.idx(pi+t), ip+1), self.idx(t))   # strictly upward in price
            self.cells[k2][0] += cnt
            self.cells[k2][1] += m_child

    def run(self, p_engages=True):
        """Ascending price sweep: reprice only moves mass upward, so one pass over
        price bins resolves the whole cascade. Within a bin: contested cells split
        S:P = pi:Lambda; dust-grade cells (per-weapon mass ~ 1 element) mop later."""
        n_inv = 1.0/self.n
        for ip in range(self.B):
            pi = (ip+0.5)*self.du
            keys = [k for k in list(self.cells.keys()) if k[0] == ip]
            for k in keys:
                c, m = self.cells.pop(k)
                if c <= 0 or m <= 0: continue
                pm = m/c
                if pm <= 1.5*n_inv:
                    # dust-grade: park for mop-up (put back, sweep collects at end)
                    self.cells[k] = [c, m]
                    continue
                if p_engages and pi < self.L - self.du:
                    sshare = pi/(pi + self.L)
                    cash_w = c*sshare
                    burn_w = c - cash_w
                    self.S_moves += cash_w*n_inv
                    self.P_moves += burn_w*(pi/self.L)*n_inv
                    self.killed += m*sshare
                    self.reprice(k, burn_w, m*(1-sshare))
                else:
                    self.S_moves += c*n_inv
                    self.killed += m
        rem = sum(m for _, m in self.cells.values())
        mop = rem
        total = 2*max(self.S_moves, self.P_moves) + mop
        return total, self.killed, rem, self.S_moves, self.P_moves

if __name__ == "__main__":
    engage = len(sys.argv) < 2 or sys.argv[1] != "noP"
    print(f"{'LAM':>5} {'c=L/n':>8} {'killed':>8} {'rem':>8} {'S_mv':>8} {'P_mv':>8}")
    for LAM in (4.06, 6, 9, 12, 16, 21, 27, 35, 46, 60, 80, 105, 140, 190, 250):
        r = Race(LAM)
        tot, kl, rem, sm, pm = r.run(p_engages=engage)
        print(f"{LAM:5.0f} {tot:8.4f} {kl:8.4f} {rem:8.4f} {sm:8.4f} {pm:8.4f}")
