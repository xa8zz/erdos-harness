---
id: R169-prime-band-tensorization-gap
type: research
date: 2026-07-15
intent: >
  Attempt, in a single dedicated round orthogonal to the prior upper-bound
  exploration, either a Prolonger strategy forcing L(n) >= c*n for some
  fixed c>0 against every Shortener strategy, or a genuinely global
  (non-chronological) proof that L(n)=o(n), for the divisibility antichain
  game on {2,...,n}.
predecessors: []
prompt: erdos-872/prompts/researcher-R169-lower-bound-disproof.md
action:
  kind: standalone
claim: >
  No unconditional proof or disproof is obtained: no Prolonger strategy is
  shown to force L(n) >= c*n against every Shortener strategy, and no
  complete global proof of L(n)=o(n) is produced. Five results are
  established along a largest-prime-factor decomposition of the board.
  (1) Private-chain lemma: if N_j single-root gadgets are swept by
  Shortener, each Prolonger reply advancing at most one gadget and each
  advanced gadget producing at most one child, then N_{j+1} <= (N_j+1)/2,
  so sum_j N_j <= 2N_0 + O(depth); hence entering an n/H-fortress with
  N_0=n/H private chains of length H yields only O(n/H) resolutions, not
  Theta(n) — a linear lower bound requires a supercritical root process,
  not private chains behind a fortress. (2) Tagged-cone protection lemma:
  for C_d={dx: 1<=x<=n/d}, if y|x, dx is legal, and the intended move dy
  is illegal, every selected move a comparable to dy responsible for that
  illegality satisfies d|a; hence a Shortener strategy lifted from a
  quotient board by multiplying moves by d cannot be spoiled by an
  untagged selected move, robustly against arbitrary play order. (3)
  Clean prime-fibre lemma: for distinct primes q,q'>sqrt(n), no member of
  F_q={qm: 1<=m<=n/q} divides a member of F_{q'}; the board above sqrt(n)
  decomposes into genuinely independent quotient games of aggregate mass
  (log 2+o(1))n. (4) Buchstab-band local deficit: for bands
  I_j=(n^{1/(j+1)}, n^{1/j}], reciprocal mass beta_j(n)=log((j+1)/j)+o(1)
  (Mertens) while any integer <=n has at most j prime factors (with
  multiplicity) exceeding n^{1/(j+1)}; the product j*beta_j(n) =
  j*log(1+1/j)+o(1) = 1-1/(2j)+O(j^{-2}) is strictly less than 1 for every
  j, and prod_{j=1}^J [j*log(1+1/j)] =~ J^{-1/2}, a genuine local deficit
  if it could be turned into a trajectory potential. (5) The missing
  tagged-tensorization statement, stated exactly: assign each live target
  to its largest-prime tag p in I_j and run quotient Shortener strategies
  in the tagged cones; if one global Prolonger move is inherited by k<=j
  tagged games simultaneously, its total effect on the sum of the
  remaining tagged game values must cost at most k ordinary quotient
  moves (charge additively, no double-counting, no uncharged residual in
  the other k-1 games). This is not established: a move a=p_1...p_k*b,
  divided by each p_i into k quotient positions with independently
  inherited histories, can have combined game value exceeding the sum of
  empty-board quotient values, so naive summation either double-counts
  the move or leaves its effect on k-1 tags unaccounted for. (6) Fixed
  finite gadgets (divisor cubes over a fixed prime set with pairwise
  P-coprime cores) cannot give a linear lower bound: privacy against a
  single external rough divisor attacking many cubes forces pairwise
  coprime cores, and a pairwise-coprime subset of [1,N] has size
  O(pi(N)+sqrt(N))=o(N), reproducing only the known n/log n-type
  population. (7) Whether the missing tagged-tensorization statement is a
  new target independent of the upper-bound chronological obstruction, or
  reduces to it, is not resolved: the prime-band mechanism is explicitly
  a recursive largest-prime factorization, not a dyadic-shell
  service-root capacity inequality, and is presented as materially
  different in formulation from the stalled per-shell chronological
  route; but the underlying failure — one actual move participating in
  several tagged processes at once, defeating independent per-process
  potentials — is noted as related to the direct-ancestor packet
  inheritance issue on the upper-bound side, with no proof or reduction
  connecting the two given. It should be tracked as a separate,
  only conjecturally-related target.
implications:
  - Rules out an entire construction family for the lower-bound side: private
    chains, growing-cap-fortress amplification, and fixed-rank finite gadgets
    (divisor cubes, common-core fans) all provably fail to reach linear
    density, regardless of tuning.
  - Introduces a second candidate global framework for the upper-bound side
    (largest-prime-band recursive factorization with strict per-band deficit
    j*log(1+1/j)<1) that is structurally distinct from the dyadic-shell
    service-root capacity inequality known to be circular with the goal.
  - Localizes the remaining upper-bound gap under this new framework to one
    precise missing statement — additive charging of moves inherited by
    multiple tagged quotient games — giving a concrete, checkable target for
    a future dispatch.
  - As of this attempt, no construction defeats the j*log(1+1/j) deficit, so
    there is still no evidence for a positive-density Prolonger strategy
    beyond the existing c_k*n*(loglog n)^{k-1}/log n family.
confidence_at_time: medium
strategy_dependence: independent
---

## Verdict

I do **not** have a valid unconditional proof or disproof. In particular, I did not find a Prolonger strategy that survives arbitrary Shortener replies with positive linear density, nor a complete global Shortener strategy proving \(L(n)=o(n)\).

I did find a global decomposition that looks materially different from the stalled dyadic-shell capacity framework. It gives:

1. a rigorous explanation of why all “private-chain” or fixed-gadget amplifications of an \(n/H\) fortress fail;
2. a robust quotient-simulation lemma that completely neutralizes external blockers carrying the wrong multiplicative tag;
3. a potentially useful near-critical decomposition by **largest-prime bands**, with a genuine strict loss
   \[
   j\sum_{n^{1/(j+1)}<p\le n^{1/j}}\frac1p
   =1-\frac1{2j}+O(j^{-2})<1;
   \]
4. an exact identification of the remaining obstruction: one actual move participates simultaneously in several tagged quotient games. I could not justify the tensorization needed to multiply the strict losses.

So the requested resolution remains incomplete. The details below record the strongest part of the attempt and the precise point at which it fails.

---

# 1. Why an \(n/H\)-fortress cannot be amplified by private chains

A natural lower-bound idea is to enter a growing-cap fortress with \(N\asymp n/H\) active roots and attach a chain of length \(H\) to each root. One might hope to obtain \(N H\asymp n\) moves by forcing Shortener through one refinement layer after another.

The following elementary game lemma shows why that cannot work unless Prolonger has genuinely multi-root packets.

### Private-chain lemma

Suppose at some stage there are \(N_j\) active gadgets. Each gadget has one currently legal root. Assume:

- if Shortener selects the root, that gadget terminates;
- a Prolonger reply can advance at most one currently active gadget;
- an advanced gadget produces at most one active child in the next generation.

If Shortener sweeps the active roots, then
\[
N_{j+1}\le \frac{N_j+1}{2}.
\]

### Proof

During the sweep, let \(S_j\) roots be selected by Shortener and \(B_j\) roots be advance-killed by Prolonger. Every active root is resolved in exactly one of these two ways, so
\[
N_j=S_j+B_j.
\]

Except possibly for Prolonger’s move immediately preceding the sweep, every advance-kill must be made by a reply following one of the \(S_j\) Shortener selections. Since one reply advances at most one root,
\[
B_j\le S_j+1.
\]
Therefore
\[
B_j\le\frac{N_j+1}{2}.
\]
Only advance-killed roots have children, giving the claim. ∎

Consequently,
\[
\sum_{j\ge0}N_j\le 2N_0+O(\text{depth}).
\]
Thus \(N_0=n/H\) private chains, even chains of length \(H\), yield only \(O(n/H)\) relevant resolutions, not \(\Theta(n)\).

This isolates what a successful linear lower bound must do. It needs a **supercritical root process**: either one reply must advance several active roots, or one blocked root must release several genuinely independent children, and this reproduction must persist after accounting for one-step-ahead preparation. In particular, a linear lower bound cannot be obtained merely by placing long private chains behind a growing-cap fortress.

That is consistent with the four-layer packet picture in the prompt: the multi-root packet is not a technical nuisance but the only possible amplification mechanism.

---

# 2. A robust tagged-cone lemma

The main global observation I found is that multiplicative tags eliminate one orientation of the external-blocker problem exactly.

For \(d\ge1\), call
\[
\mathcal C_d=\{dx:1\le x\le n/d\}
\]
the \(d\)-tagged cone.

### Tagged-cone protection lemma

Suppose \(y\mid x\), and \(dx\) is currently legal. If the intended move \(dy\) is illegal, then every selected move responsible for this illegality in the harmful orientation is itself divisible by \(d\).

More precisely, if a selected \(a\) is comparable with \(dy\), then:

- if \(a\mid dy\), one also has \(a\mid dx\), contradicting the legality of \(dx\);
- hence, whenever \(dx\) survives, the only possible obstruction is
  \[
  dy\mid a,
  \]
  and therefore \(d\mid a\).

### Proof

The first implication is immediate from \(a\mid dy\mid dx\). Thus a selected divisor of the intended move would already have killed the target. The only remaining comparability orientation is \(dy\mid a\), which forces \(d\mid a\). ∎

This has a useful interpretation.

> A Shortener strategy lifted from a quotient board by multiplying every intended move by \(d\) cannot be spoiled by a selected move lacking the tag \(d\), unless that selected move has already killed the intended target.

All harmful blockers therefore occur inside the tagged cone and map, after division by \(d\), to honest quotient-game moves.

This is an actual robustness statement, unlike a static cone decomposition: it survives arbitrary external play and arbitrary chronology.

---

# 3. Clean prime fibres above \(\sqrt n\)

For a prime \(q>\sqrt n\), define
\[
F_q=\{qm:1\le m\le n/q\}.
\]

Distinct such fibres have no divisibility relations between them.

### Lemma

If \(q,q'>\sqrt n\) are distinct primes, no member of \(F_q\) divides a member of \(F_{q'}\).

### Proof

Suppose
\[
qm\mid q'm'.
\]
Since \(q\ne q'\), primality gives \(q\mid m'\). But
\[
m'\le n/q'<\sqrt n<q,
\]
which is impossible. The reverse direction is identical. ∎

Together with the tagged-cone lemma, this means that the portion of the board containing a prime factor greater than \(\sqrt n\) really is a collection of clean quotient games. Shortener can use a “follow the last tag” policy: after a Prolonger move in \(F_q\), answer using a quotient strategy in the \(q\)-fibre. A move in another fibre cannot harm this simulation.

At the level of board sizes,
\[
\sum_{\sqrt n<q\le n}\frac{n}{q}
=(\log 2+o(1))n.
\]
The constant \(\log 2<1\) is suggestive: the first largest-prime layer has a genuine subcritical mass.

The difficulty begins immediately below \(\sqrt n\). If
\[
n^{1/3}<q\le\sqrt n,
\]
a selected move may contain two such large primes. It can therefore act as a harmful tagged blocker in two quotient fibres simultaneously. At deeper levels, one move belongs to more fibres.

That leads to the prime-band calculation below.

---

# 4. Buchstab bands and a strict local deficit

Partition the primes into bands
\[
I_j=\left(n^{1/(j+1)},\,n^{1/j}\right],\qquad j\ge1.
\]

Two elementary facts interact almost perfectly.

First, by Mertens’ estimate,
\[
\beta_j(n):=\sum_{p\in I_j}\frac1p
=\log\frac{j+1}{j}+o(1).
\]

Second, an integer \(a\le n\) has at most \(j\) prime factors, counted with multiplicity, exceeding \(n^{1/(j+1)}\). Indeed, \(j+1\) such factors would have product greater than \(n\).

Thus a single selected move can carry at most \(j\) tags from \(I_j\). The naive “packet multiplicity times quotient mass” is therefore
\[
j\beta_j(n)
=j\log\left(1+\frac1j\right)+o(1)
=1-\frac1{2j}+O(j^{-2})+o(1).
\]

The important point is that it is **strictly less than one**.

Moreover,
\[
\prod_{j=1}^{J}
j\log\left(1+\frac1j\right)
\asymp J^{-1/2}.
\]
So if tagged quotient games genuinely tensorized over successive largest-prime bands, their accumulated packet loss would tend to zero. The residual set after \(J\) bands consists of \(n^{1/(J+1)}\)-smooth integers, whose density is governed by a Dickman-type tail and tends rapidly to zero as \(J\to\infty\).

This suggests the following global mechanism:

> Each time play descends through another largest-prime band, the available quotient mass is multiplied by \(\beta_j\), while a single adversarial move can be inherited by at most \(j\) tagged processes. The product is \(1-\Theta(1/j)\), so repeated descent should dissipate a linear population.

This is not a dyadic-shell service-root capacity inequality. It is a recursive factorization by largest prime, and its strict loss comes from the exact competition between:

- the reciprocal mass of a prime band; and
- the maximum number of tags from that band that one integer can carry.

---

# 5. The missing tensorization statement

Unfortunately, the preceding calculation does not by itself prove an upper bound.

A statement strong enough to finish would look roughly as follows.

### Desired tagged tensorization

For each band \(I_j\), assign every live target to its largest-prime tag \(p\in I_j\). Run quotient Shortener strategies in the tagged cones. If one global Prolonger move is inherited by \(k\le j\) tagged games, its total effect on the sum of the remaining tagged game values should cost at most \(k\) ordinary quotient moves. Then the entire \(I_j\)-population should contract by at most
\[
\left(j\beta_j+o(1)\right)
\]
times the preceding-scale value.

Iterating would give
\[
\text{remaining density after \(J\) bands}
\;\lesssim\;
J^{-1/2}+ \rho(J+1)+o(1),
\]
and hence \(L(n)=o(n)\).

The obstruction is that the natural local game value does **not** tensorize this way.

A move
\[
a=p_1p_2\cdots p_k b
\]
can simultaneously be a harmful multiple-blocker in the \(p_i\)-tagged simulations. Dividing by \(p_i\) produces \(k\) different quotient positions. These are not independent copies:

- the same actual move has been cloned into several games;
- the quotient games may already contain different inherited histories;
- game value from an inherited position can exceed game value from the empty quotient board, just as a leaf chosen in a star can destroy the central short completion;
- responding in one tagged game need not settle the obligations created in the other \(k-1\).

The numerical inequality \(j\beta_j<1\) therefore measures a promising deficit, but I do not have a legitimate potential whose change realizes that deficit. Simply summing local game values double-counts inherited moves; assigning each move to only one tag leaves its harmful effects in the other tags unaccounted for.

This is the exact failure point of the global argument.

It is related to direct-ancestor packet inheritance, but it is not phrased as a service-root capacity inequality. A proof of the tagged tensorization would be a genuinely global solution; a construction saturating it through arbitrarily many bands would be a plausible route to a linear Prolonger strategy.

---

# 6. Why fixed finite gadgets do not give a linear lower bound

I also tried to obtain a linear lower bound by replicating a fixed divisor-cube gadget.

Fix small primes \(\ell_1,\dots,\ell_r\), put
\[
P=\prod_{i=1}^r\ell_i,
\]
and consider cubes
\[
\mathcal Q_c=\left\{
c\prod_{i\in S}\ell_i:S\subseteq[r]
\right\}
\]
for \(P\)-coprime cores \(c\) in a short interval below \(n/P\).

Within one cube, Prolonger has substantial finite-game freedom. Also, if two cores \(c,c'\) are \(P\)-coprime and \(c\mid c'\) is impossible, then divisibility between their cube vertices is highly restricted: from
\[
c\prod_{i\in S}\ell_i
\mid
c'\prod_{i\in T}\ell_i
\]
and \((c,P)=1\), one obtains \(c\mid c'\).

The fatal issue is an external divisor of the cores. A rough prime \(q\nmid P\) can divide many cores and lets one Shortener move attack many cubes simultaneously. To make the gadgets genuinely private, their cores need essentially disjoint rough supports. In particular, the cleanest version requires pairwise coprime cores.

But a pairwise-coprime subset of \([1,N]\) has size only \(O(\pi(N)+\sqrt N)=o(N)\): each composite member consumes a distinct prime at most \(\sqrt N\), while the remaining members are primes. Hence private fixed-rank gadgets supply at most the familiar \(n/\log n\)-type population, not a positive-density population.

Recursing on the rough cores reproduces the known fan hierarchy. Reaching linear density would require a growing number of levels while avoiding its multiplier collapse—again a global packet process rather than independent gadgets.

---

# 7. Consequences for a possible linear Prolonger strategy

The preceding arguments impose a fairly rigid shape on any successful disproof.

A positive-density Prolonger strategy cannot be based on:

- a fixed-cap or growing-cap reservoir followed by private chains;
- linearly many disjoint finite gadgets;
- a fixed common-core fan;
- independently maintained quotient fibres;
- postponed refinement with only one child per blocked root.

It must instead maintain a supercritical, chronologically prepared packet process through an unbounded sequence of prime-factor scales. In the prime-band language, it would have to do essentially all of the following:

1. Saturate close to the maximal \(j\)-tag inheritance at band \(I_j\).
2. Avoid the apparent deficit
   \[
   j\log(1+1/j)=1-\Theta(1/j).
   \]
3. Reuse each actual reply across several tagged quotient histories without making the corresponding target comparable to that reply.
4. Prepare the lower-band blockers before their service roots become exposed.
5. Do this for enough bands that the residual smooth population would otherwise have density \(o(1)\).
6. Remain robust against Shortener following the active tag rather than using a fixed maximum-degree or minimal-root policy.

That is considerably stronger than entering a capped fortress or sustaining a single second-shell packet tail. It also explains why the known fixed-rank fan constructions do not approach linearity: their packet mechanism does not tensor efficiently through the entire largest-prime factorization.

---

# 8. Bottom line

The attempt did not produce the requested unconditional resolution.

The strongest new candidate mechanism is the largest-prime-band decomposition. Its key exact relation is
\[
\boxed{
\left(\text{maximum number of inherited \(I_j\)-tags per move}\right)
\left(\text{reciprocal mass of \(I_j\)}\right)
=
j\log\left(1+\frac1j\right)
=
1-\frac1{2j}+O(j^{-2}).
}
\]

If one can turn that strict deficit into a trajectory potential—without cloning one actual move into several independently charged quotient games—then its product over the prime bands tends to zero and gives a genuinely global proof of \(L(n)=o(n)\).

Conversely, a linear Prolonger construction would have to exhibit an on-trajectory method that defeats precisely this deficit by coherently coupling the tagged quotient games. I did not find such a coupling; the private-chain lemma shows that merely pipelining one continuation per root cannot do it.