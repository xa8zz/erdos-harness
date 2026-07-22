#!/usr/bin/env python3
"""Line D: continuum band-race allocation game on the rough (smallest-prime-first) tree.

Measure-dynamics model of the antichain game battle:
  - Frontier nodes (d, r): d = product of increasing prime chain (scale u = log d),
    r = roughness bound (scale v = log r); node owns {d*m : m <= n/d, P^-(m) >= r}.
  - S move: cash one frontier node -> kills its cone mass (variant A: owned subtree
    mass only [P-favoring]; variant B: owned + all frontier multiples' mass, modeled
    as owned * overlap_factor [S-favoring]).
  - P move: burn a bundle of frontier nodes with total scale <= (1 - pad); each burned
    node fragments into children (d*q, q) for primes q in [r, n/d].
  - Dust: node with n/d < r owns only {d} itself: 1 element, needs 1 move to clear
    (mop-up); dust elements killed if their cone is cashed above them (variant B).
  - Every move (cash, push, mop-up) adds +1 to L. Value c = L/n.

Cohorts: (u_bin, v_bin) -> [count, mass] aggregated; counts/masses are floats
(normalized mass: total board mass = 1; counts in units of actual node counts / n...
counts kept as absolute floats via exp; use log-safe arithmetic where needed).

Policies (v1):
  - S: greedy per-move kill: cash cohort with max per-node mass.
  - P: bang-per-buck: push cohort maximizing (per-node mass) / (scale) [mass saved per
    bandwidth], restricted to nodes P "wants" to save (per-node mass above dust value).
Best-response refinements come later; this v1 maps the landscape.

Time: strict alternation => in any window both sides spend equal moves. Event-driven
cohort processing: at each round compute both sides' current priority cohorts and
process until an exhaustion event. Move ledger tracked in units of n (normalized).
"""
import math
from collections import defaultdict

EGAMMA = math.exp(-0.5772156649015329)

def buchstab_omega(t):
    """Buchstab omega(t): density factor for rough numbers. Piecewise approx."""
    if t < 1:
        return 0.0
    if t <= 2:
        return 1.0 / t
    if t <= 3:
        return (1.0 + math.log(t - 1.0)) / t
    return EGAMMA  # converges fast; fine beyond 3

def rough_density(logM, logr):
    """(1/M) * #{m <= M : P^-(m) >= r}, log scale inputs. Includes m=1 handled by caller."""
    if logr <= math.log(2.0):
        return 1.0
    if logM < logr:
        return 0.0  # no rough m in (1, M]
    t = logM / logr
    return buchstab_omega(t) * (1.0 / logr) * t / (logM / logr) if False else buchstab_omega(t) / logr * (logM/logM)  # placeholder guard

def rough_density_clean(logM, logr):
    """Phi(M, r)/M ~ omega(logM/logr)/logr for logM >= logr; else 0 (only m=1)."""
    if logr <= math.log(2.0):
        return 1.0
    if logM < logr:
        return 0.0
    t = logM / logr
    return buchstab_omega(t) / logr

class Model:
    def __init__(self, LAM, nbins=None, pad=0.05, variant="A", verbose=False):
        self.L = LAM                      # log n
        self.pad = pad                    # bandwidth reserve for the pad prime
        self.variant = variant
        self.verbose = verbose
        self.B = nbins or max(40, int(LAM * 2))   # scale bins over (0, LAM]
        self.du = LAM / self.B
        # cohorts[(iu, iv)] = [count, mass]  (count = number of frontier nodes,
        # mass = total owned live mass, normalized so board mass = 1)
        self.cohorts = defaultdict(lambda: [0.0, 0.0])
        self.moves = 0.0                  # normalized by n
        self.killed = 0.0
        self.dust_mass = 0.0              # mass parked as singletons (1 el each)
        self.overlap = 1.0 if variant == "A" else 1.35
        # ^ variant B: cashing d also wipes frontier multiples; crude constant factor
        #   (calibrate later); variant A: owned only.
        self._init_frontier()

    def ubin(self, u):  return min(self.B - 1, max(0, int(u / self.du)))

    def _init_frontier(self):
        """Initial frontier: after P's free primorial phase, every prime is a
        potential S weapon. Start from scratch: frontier = all primes q (nodes (q,q)),
        owning {q*m : P^-(m) >= q} — the full board partition by smallest prime."""
        LAM, du = self.L, self.du
        for i in range(self.B):
            u = (i + 0.5) * du            # prime scale log q
            if u > LAM:
                break
            cnt = math.exp(u) / u * du * math.exp(0)   # ~ integral of e^t/t dt over bin
            cnt = math.exp(u) / u * du
            logM = LAM - u
            dens = rough_density_clean(logM, u)
            mass_per = math.exp(-u) * dens             # (n/q)/n * density
            selfmass = math.exp(-LAM)                  # the element q itself
            m = cnt * (mass_per + selfmass)
            if logM < u:                               # quotient too small: singleton
                self.cohorts[(i, i)][0] += cnt
                self.cohorts[(i, i)][1] += cnt * math.exp(-LAM)
            else:
                self.cohorts[(i, i)][0] += cnt
                self.cohorts[(i, i)][1] += cnt * (mass_per + selfmass)
        tot = sum(m for _, m in self.cohorts.values())
        # normalize masses to total 1 (board = mass 1)
        for k in self.cohorts:
            self.cohorts[k][1] /= tot
        self.norm = tot

    # ---- helpers -----------------------------------------------------------
    def per_node_mass(self, key):
        c, m = self.cohorts[key]
        return m / c if c > 0 else 0.0

    def is_dust(self, key):
        iu, iv = key
        u = (iu + 0.5) * self.du; v = (iv + 0.5) * self.du
        return (self.L - u) < v            # quotient smaller than roughness bound

    def children_of(self, key, count, mass):
        """Fragment `count` nodes of cohort key; distribute owned mass to children.
        Node (u, v): children (u + t, t) for prime scales t in [v, LAM - u]."""
        iu, iv = key
        u = (iu + 0.5) * self.du; v = (iv + 0.5) * self.du
        logM = self.L - u
        if logM < v:
            return  # dust: no children (shouldn't be pushed)
        # each parent's owned set {d*m : P^-(m) >= r} partitions by smallest prime
        # q of m into (d*q, q) sub-nodes + the element d itself (which the burn kills
        # as collateral of the burn move? no: burning d = playing x = d*stuff kills d
        # the element). Element-d mass -> killed (tiny, exp(-LAM) each).
        # Child at prime scale t: per-parent count e^t/t dt... but capped: child count
        # can't exceed parent's quotient size. Distribute parent mass proportional to
        # child owned masses: child (u+t, t) owned per-node mass ~ e^{-(u+t)} * dens.
        tlo, thi = v, logM
        nb = max(4, int((thi - tlo) / self.du))
        dt = (thi - tlo) / nb
        weights = []
        for j in range(nb):
            t = tlo + (j + 0.5) * dt
            ccount = math.exp(t) / t * dt                       # children per parent
            logMc = self.L - (u + t)
            if logMc < t:   # child is dust (singleton d*q)
                cmass_per = math.exp(-self.L) * self.norm ** 0  # normalized below
                cmass_per = math.exp(-self.L)
            else:
                cmass_per = math.exp(-(u + t)) * rough_density_clean(logMc, t)
            weights.append((t, ccount, cmass_per))
        wtot = sum(cc * cm for _, cc, cm in weights)
        if wtot <= 0:
            self.dust_mass += mass; return
        for t, cc, cm in weights:
            share = (cc * cm) / wtot
            k2 = (self.ubin(u + t), self.ubin(t))
            self.cohorts[k2][0] += count * cc
            self.cohorts[k2][1] += mass * share

    # ---- policy: choose targets ---------------------------------------------
    def s_target(self):
        best, bkey = -1.0, None
        for k, (c, m) in self.cohorts.items():
            if c <= 0 or m <= 0: continue
            pm = m / c
            if pm > best:
                best, bkey = pm, k
        return bkey, best

    def p_target(self):
        """P pushes the cohort with max (per-node mass)/(scale) among non-dust
        cohorts that S might cash soon (per-node mass above current dust value)."""
        best, bkey = -1.0, None
        for k, (c, m) in self.cohorts.items():
            if c <= 0 or m <= 0: continue
            if self.is_dust(k): continue
            u = (k[0] + 0.5) * self.du
            score = (m / c) / max(u / self.L, 1e-9)
            if score > best:
                best, bkey = score, k
        return bkey, best

    # ---- main loop -----------------------------------------------------------
    def run(self, max_rounds=200000):
        n_inv = math.exp(-self.L)   # 1/n : mass of one element; 1 move = n_inv "move mass"
        rounds = 0
        while rounds < max_rounds:
            rounds += 1
            skey, s_pm = self.s_target()
            pkey, _ = self.p_target()
            if skey is None:
                break
            # If S's best per-move kill is <= 1 element, battle is over: mop-up.
            if s_pm <= 1.5 * n_inv:
                break
            sc, sm = self.cohorts[skey]
            if pkey is None or pkey == skey:
                # contested or nothing to push: S drains it, P (if same) races.
                if pkey == skey:
                    u = (skey[0] + 0.5) * self.du
                    bw = max(1.0, (1.0 - self.pad) * self.L / u / self.L * self.L)  # nodes/move
                    bw = max(1.0, (1.0 - self.pad) / (u / self.L))
                    # in T moves each: S removes T nodes, P removes T*bw nodes
                    T = sc / (1.0 + bw)
                    self.moves += 2 * T * n_inv
                    kill = T * (sm / sc) * self.overlap
                    self.killed += min(kill, sm)
                    self.children_of(skey, T * bw, sm * (T * bw / sc))
                    self.cohorts[skey] = [0.0, 0.0]
                else:
                    self.moves += sc * n_inv * 2   # S cashes all; P wastes/mops dust
                    self.killed += min(sm * self.overlap, sm)
                    self.cohorts[skey] = [0.0, 0.0]
                continue
            pc, pm_ = self.cohorts[pkey]
            up = (pkey[0] + 0.5) * self.du
            bw = max(1.0, (1.0 - self.pad) / (up / self.L))   # nodes per P move
            # race until one cohort exhausts
            T_s = sc                    # moves for S to finish skey
            T_p = pc / bw               # moves for P to finish pkey
            T = min(T_s, T_p)
            self.moves += 2 * T * n_inv
            kfrac = T / sc
            kill = sm * kfrac * self.overlap
            self.killed += min(kill, sm * kfrac)
            self.cohorts[skey][0] -= T
            self.cohorts[skey][1] -= sm * kfrac
            pushed = min(T * bw, pc)
            pfrac = pushed / pc
            self.children_of(pkey, pushed, pm_ * pfrac)
            self.cohorts[pkey][0] -= pushed
            self.cohorts[pkey][1] -= pm_ * pfrac
        # mop-up: all remaining mass is dust-grade: 1 move per element...
        rem_mass = sum(m for _, m in self.cohorts.values()) + self.dust_mass
        # remaining elements each need 1 move (played) OR got killed by variant-B
        # overlap earlier; treat rem elements as moves 1:1:
        self.moves += rem_mass          # mass fraction == element fraction * ...
        # (each element has mass 1/n; rem_mass = (#elements)/n => moves += rem)
        return self.moves, self.killed, rem_mass

if __name__ == "__main__":
    import sys
    for LAM in (12, 18, 25, 35, 50, 70, 100, 140):
        for variant in ("A", "B"):
            m = Model(LAM, variant=variant)
            moves, killed, rem = m.run()
            print(f"LAM={LAM:4d} var={variant}  c=L/n~{moves:.4f}  killed={killed:.4f} rem={rem:.4f}")
