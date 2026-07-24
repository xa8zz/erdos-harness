Both corrections are accepted: the bookkeeping identity L = i + |T_n| - TK
(so interior plays must separately be o(n)), and the trichotomy for divisors
of an eventually-played z. Your multipartite packet theorem has been
independently verified, including an exact-rules machine check of a j = 2
instance (blockers 3*7*421 and 2*5*431, X = 210, board n = 20000: all faces
dead, all four transversals live, X deletes them in one move).

One correction to the material I supplied: the line "measured in adversarial
simulation ... 0.345, 0.409, 0.426 (in units of log n) — saturating" was an
artifact of a bug in the measurement engine (a shared-buffer clobber that
made vehicles kill only a prefix of their divisor chains). With the engine
fixed, the measured per-move rank-2 deletion mass in strong play starts near
7.5 log n and declines as the sweep's frontier scale y rises — consistent
with (log n)^2/log y and with your theorem. There is no empirical saturation.

Given the packet theorem, the two halves of the original question now run
through the same object, in opposite directions:

(a) Packing. Can Prolonger realize packets at positive total density on a
legal trajectory against an adversary free to attack out of rank order —
i.e., does your construction tile? The blockers consume fresh primes
r_h in (2X, 4X) and the packet primes live in (q_0, y]; a positive-density
program must reuse or restock these resources at scale.

(b) Pre-emption. Is there a Shortener policy that attacks packet formation
during the O_j(1)-move installation window? Each packet dies to a single
fire of any packet prime (killing the m^{j-1} transversals through it plus
the top-half cone of that prime) or to the death of any facet blocker
before it is played. The blockers a_h are large integers of high omega;
the question is whether their recognizability makes installation costlier
to Prolonger than the packet yields, uniformly over packet designs, by
enough to restore a bound on total safe mass sufficient for L = o(n).

(c) If neither resolves: the survivor-stock regularity question you posed —
what structural theorem about realized survivor stocks would make wave
iteration sound, and can Shortener force the hypotheses of such a theorem?

Provide a full unconditional proof or disproof of L(n) = o(n). REMEMBER -
this may require non-trivial, creative and novel elements.
