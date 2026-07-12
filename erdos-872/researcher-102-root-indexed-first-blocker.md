---
id: R102-root-indexed-first-blocker
type: research
date: 2026-07-12
intent: >
  Full solution attempt from the complete current state: prove or disprove
  L(n) = o(n) unconditionally for the divisibility antichain game on {2..n}.
predecessors: []
action:
  kind: standalone
claim: >
  Chronology-safe machinery replacing the refuted move-indexed witness
  constructions. First-upward-blocker lemma: during a phase in which
  Shortener plays only members of the fixed minimal layer C = M(A), any
  x legal at phase end and any root c in C dividing x has a canonical
  Prolonger move a_c (the first move making c illegal) with c | a_c
  properly and a_c incomparable to x; root capacity per Prolonger move
  is at most tau(a), and at most H when all legal integers exceed n/H —
  genuinely lifetime bounds (each root charged at its irreversible first
  death). Iterating: a root born at layer depth j has j distinct paid
  chronological ancestors (one Prolonger blocker per earlier phase), and
  the depth-sensitive descendant bound sum_{j>i} |C_j| <= (H/2^i)^2 p_i
  holds, where p_i is the number of Prolonger moves in phase i. This is
  too weak for o(n) in early phases (the (H/2^i)^2 factor); neither a
  proof nor a disproof of L(n) = o(n) results.
implications:
  - The invalid move-indexed first-witness idea has a valid root-indexed
    replacement with per-move capacity tau(a) or H; usable as an
    established tool.
  - The remaining gap is unchanged (early-phase descendant capacity),
    consistent with the ordered-shadow reduction.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R102-solution-attempt-post-r100.md
---

# Verdict

I do **not** find a valid unconditional proof or disproof of

\[
L(n)=o(n).
\]

Taking every theorem and counterexample in the supplied statement as established, the argument still stops at a genuine chronology-sensitive multiplicity problem. I can strengthen the layer-peeling reduction by a new, fully chronological first-blocker lemma, but that lemma still permits quadratic—and, under iteration, higher-order—regeneration. Consequently, asserting \(L(n)=o(n)\) would require an additional online compression theorem not among the accepted facts; asserting \(L(n)\not=o(n)\) would require an arbitrary-reply fixed-cap entry theorem or an equivalent amplification. 

Here is the complete argument and the exact first step that remains unproved.

## 1. A chronology-safe lemma for one minimal-root sweep

Let \(A\) be a position, let \(\mathcal L(A)\) be its legal set, and put

\[
C=\mathcal M(A),
\]

the minimal elements of \(\mathcal L(A)\) under divisibility.

Consider the following phase. On each of her turns, Shortener plays any still-legal member of the fixed set \(C\). The phase ends when no element of \(C\) remains legal. Let \(A^{+}\) be the resulting position, and let \(P\) be the set of Prolonger moves made during the phase.

### Lemma 1: first upward blocker

Suppose \(x\in\mathcal L(A^{+})\). For every \(c\in C\) satisfying \(c\mid x\), there is a Prolonger move \(a_c\in P\) such that

\[
c\mid a_c,\qquad c<a_c,
\qquad a_c\nmid x,\qquad x\nmid a_c.
\tag{1}
\]

Moreover, \(a_c\) may be chosen canonically as the first move that made \(c\) illegal.

#### Proof

Since \(c\) is no longer legal at the end of the phase, some first subsequently played integer \(a_c\) is comparable with \(c\).

Shortener cannot have played \(c\), because \(c\mid x\) and then \(x\) would be illegal. She also cannot have played another member of \(C\) comparable with \(c\), because \(C\) is an antichain. Hence \(a_c\) is a Prolonger move.

Suppose \(a_c\mid c\). Legality is monotone, so \(a_c\), being legal when played, was legal at the beginning of the phase. But \(c\) was minimal among the legal elements. Thus \(a_c=c\), again contradicting the survival of \(x\).

Therefore \(c\mid a_c\), properly. Finally, \(a_c\) and \(x\) must be incomparable, since both remain members of the common primitive set together with the still-legal \(x\). This proves (1). ∎

This avoids the invalid “first witness indexed only by the move” construction. The indexing object is the root \(c\), and its first blocker is an irreversible actual-state event.

### Corollary 2: genuine root capacity

For a fixed Prolonger move \(a\),

\[
\#\{c\in C:a_c=a\}\le \tau(a).
\tag{2}
\]

If every legal integer at the beginning of the phase exceeds \(n/H\), then the stronger bound

\[
\#\{c\in C:a_c=a\}\le H
\tag{3}
\]

holds.

Indeed, every such \(c\) is a divisor of \(a\). Under the additional hypothesis, \(c>n/H\), so the quotient \(a/c\) is an integer smaller than \(H\).

Unlike the refuted lifetime Sperner estimate, (2)–(3) are genuinely chronological: each root is charged at its actual first death, and a move made in one phase cannot later be the first blocker of a newly legal root.

## 2. The strengthened layer-peeling estimate

Perform the accepted initial peel: Shortener plays legal integers at most \(n/H\) until none remain. This takes at most \(n/H\) Shortener moves. Let \(A_0\) be the resulting position.

Starting from \(A_0\), perform successive fixed-root phases. Write

\[
C_j=\mathcal M(A_j),
\]

and let \(A_{j+1}\) be the position after Shortener has attempted all members of \(C_j\).

As in the accepted layer argument, every \(x\in\mathcal L(A_j)\) satisfies

\[
x>2^j\frac nH.
\tag{4}
\]

Hence there are fewer than

\[
K=\lceil\log_2H\rceil
\]

nonempty phases.

There is a useful strengthening of the usual chain argument.

### Lemma 3: chronological ancestral chain

If \(x\in C_j\), then for every \(i<j\) there is an element \(c_i\in C_i\) and a Prolonger move \(a_i\) made during phase \(i\) such that

\[
c_i\mid x,\qquad c_i\mid a_i,\qquad a_i\parallel x.
\tag{5}
\]

The moves \(a_0,\ldots,a_{j-1}\) are distinct.

#### Proof

Since \(x\) is legal at the start of phase \(i\), it has a minimal legal divisor \(c_i\in C_i\). Because \(x\) remains legal through phase \(i\), Shortener cannot play \(c_i\). Lemma 1 therefore supplies \(a_i\). Moves belonging to distinct phases are distinct. ∎

Thus a root born at depth \(j\) really has \(j\) paid chronological ancestors. This is stronger than merely saying that it has a divisibility chain.

We can also obtain a quantitative descendant capacity.

Let \(p_i\) be the number of Prolonger moves during phase \(i\), and put

\[
q_i=\frac{H}{2^i}.
\]

### Proposition 4: depth-sensitive descendant bound

For every \(i<K\),

\[
\sum_{j>i}|C_j|
   \le q_i^2\,p_i
   =
   \left(\frac{H}{2^i}\right)^2p_i.
\tag{6}
\]

#### Proof

Take a future root \(x\in C_j\), \(j>i\). Choose its phase-\(i\) ancestor \(c_i\) and blocker \(a_i\) from Lemma 3.

By (4),

\[
c_i>2^i\frac nH=\frac n{q_i}.
\]

For a fixed blocker \(a_i\le n\), there are at most \(q_i\) possible divisors \(c_i>n/q_i\), since each corresponds to a quotient \(a_i/c_i<q_i\).

For each fixed \(c_i>n/q_i\), there are at most \(q_i\) multiples \(x\le n\). Consequently a single phase-\(i\) Prolonger move can be the chosen ancestral blocker for at most \(q_i^2\) future roots. Summing over the \(p_i\) opposing moves proves (6). ∎

This is a bona fide historical no-repetition estimate. It survives adaptive play, does not confuse instantaneous and lifetime incidence, and treats actual integer roots rather than latent move indices.

## 3. Why even this does not prove \(o(n)\)

Unfortunately, (6) is far too weak in the early phases. When \(i\ll\log_2H\), the factor

\[
q_i^2=\frac{H^2}{4^i}
\]

is enormous.

To see the precise numerical obstruction, put \(K=\lfloor\log_2H\rfloor\) and consider the abstract profile

\[
|C_i|=\frac nK
\quad\text{for }0\le i\le K/3,
\qquad
|C_i|=0
\quad\text{afterward},
\tag{7}
\]

with \(p_i\asymp |C_i|\). Every individual layer in (7) is \(o(n)\), but

\[
\sum_i|C_i|\asymp n.
\]

For \(i\le K/3\),

\[
q_i^2
 \ge
 \left(\frac{H}{H^{1/3}}\right)^2
 =H^{4/3},
\]

so the right-hand side of (6) is much larger than \(n\). Thus all inequalities (6) are compatible with the linear total mass in (7).

This does not construct such a legal game history. It proves something more limited but decisive for the attempted argument: even the strengthened chronological root-capacity theorem does not imply the required growing-depth uniformity.

The reason is target reuse. A root–blocker incidence can support many later targets. The accepted diagonal-semiprime mechanism is the cleanest instance:

\[
a_i=p_iq_i
\]

for \(1\le i\le t\) can generate the \(t(t-1)\) cross-products

\[
p_iq_j,\qquad i\ne j.
\]

Each cross-product has two completely legitimate chronological witnesses, \(a_i\) and \(a_j\), yet only \(t\) actual moves support \(t(t-1)\) new minimal objects. Requiring two, or any fixed number, of distinct witnesses per target therefore does not give a linear charge to the move bank.

At higher depth the same phenomenon becomes the refinement forest: old incidences are reused by many descendants. The supplied \(n=4000\), \(c=30\) history shows concretely that an instantaneous Sperner cap does not become a lifetime cap. The first-blocker lemma repairs the indexing error for roots, but it does not prevent the descendants of different blocked roots from recombining.

The missing estimate would have to be target-sensitive. Schematically, one needs a theorem of the form

\[
\left|
 \bigcup_{(a,c)}
 \{x:c\mid x,\;a\parallel x,\text{ and }(a,c)
   \text{ is a chronological ancestral certificate of }x\}
\right|
=o(n)
\tag{8}
\]

whenever the actual move count and accumulated maximum-degree area are \(o(n)\).

Neither (2), (3), nor (6) gives (8). The all-orders witness inequality also does not give it: common low-lcm traces permit one family of earlier moves to certify many targets simultaneously. Raw tuple counting merely counts the same exhausted structure many times, while frozen repairs can suffer a large jump when one later low-product edge joins many old witness systems.

That is exactly the missing Lipschitz property described in the problem statement.

## 4. Why the lower-bound side also remains incomplete

The absorbing-fortress theorem at cap \(H\) gives

\[
\text{remaining value}\ge |E(A)|+\frac{|Q(A)|}{H}.
\]

For a linear reservoir and \(H(n)\to\infty\), this is only

\[
\frac{\Theta(n)}{H(n)}=o(n).
\]

Even \(H=(\log n)^{o(1)}\) gives \(n^{1-o(1)}\), which is compatible with \(o(n)\).

To obtain a disproof of \(L(n)=o(n)\), one would need at least one of:

\[
H=O(1)
\]

in an arbitrary-reply entry theorem, or an amplification that repeatedly lowers the cap while retaining a linear reservoir. Fresh-batch persistence does not provide that amplification, because it protects a batch only after activation; future batches remain exposed to permanent advance blockers. Nor do histories defeating maximum-degree Shortener suffice, because Shortener may use the batch-blocking policy that specifically destroys those histories.

Thus the current lower-bound machinery also stops before a positive-density conclusion.

## 5. Exact status of the proposed statement

The rigorously justified bounds remain

\[
c_\delta\,
  \frac{n(\log\log n)^2}{\log n}
\le L(n)
\le
\bigl(0.1897123371+o(1)\bigr)n.
\]

The following implications are sound:

\[
\text{(OA)}\quad\Longrightarrow\quad L(n)=o(n),
\]

and

\[
\text{arbitrary-reply fixed-cap fortress entry}
\quad\Longrightarrow\quad
L(n)\ge c n
\]

for some \(c>0\).

But neither antecedent has been established. The first genuinely unclosed upper-bound step is the passage from chronological root certificates such as (5)–(6) to a bound on the number of distinct descendant targets. The first genuinely unclosed lower-bound step is robust entry at fixed cap, or a valid growing-cap-to-fixed-cap amplification.

Therefore the honest conclusion is

\[
\boxed{\text{The supplied results do not yield a valid proof or disproof of }L(n)=o(n).}
\]

The one-phase first-blocker normalization above is valid and removes one possible ambiguity, but the quadratic-regeneration example shows exactly why it is not the missing theorem.