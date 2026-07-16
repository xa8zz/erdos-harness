---
id: R170-tagged-tensorization-refuted
type: refutation
date: 2026-07-16
intent: >
  Test whether the strict per-band deficit j·log(1+1/j)<1 from the largest-prime-band
  recursive factorization can be promoted from a static projection-multiplicity bound
  into a multiplicative trajectory potential — i.e. whether "tagged tensorization"
  (charging a k-tag-inherited Prolonger move to at most k independent per-quotient
  service obligations, additively) holds, which would give an unconditional o(n) upper
  bound on the antichain-game length with explicit rate ≍ (loglog n)^{-1/2}.
predecessors: [R169-prime-band-tensorization-gap]
action:
  kind: refutes
  target: R169-prime-band-tensorization-gap
claim: >
  Tagged tensorization is FALSE on the strategic reading required to multiply the strict
  band deficits. The factor j correctly bounds the projection-multiplicity of a single
  Prolonger move (the Prolonger side is fine); the failure is on the Shortener side —
  the responder's minimization does NOT tensorize. For a single k-tag Prolonger move,
  min over one compatible GLOBAL reply s of Σ_p F_p(s/p) can exceed Σ_p min over
  independent LOCAL replies z_p of F_p(z_p) by an amount tending to infinity. Hence the
  quantity j·log(1+1/j)<1 is a static projection-multiplicity deficit, not by itself a
  trajectory potential, and the band product ∏_{j≤J} j·log(1+1/j) ≍ J^{-1/2} does not
  yield an o(n) rate. On the weaker reading (charge to k merely records the k projections
  a/p_i) tagged tensorization is tautologically true but has zero game-theoretic
  consequence. This refutes the named statement in R169's Attachment Q; it does NOT
  decide L(n)=o(n) either way.
failure_mechanism: >
  Non-tensorization of the Shortener/responder minimum under a shared-reply compatibility
  constraint. A single two-tag I_2 Prolonger move can force all its per-prime quotient
  service roots to be blocked by ONE global compatible reply while every independent
  per-quotient local minimum stays small; the sub-additivity gap
  min_s Σ_p F_p(s/p) − Σ_p min_{z_p} F_p(z_p) is unbounded for such a move, so the
  additive "≤ k obligations" charging that tagged tensorization requires fails. The
  strict deficit is real per-move-projection but cannot be chained multiplicatively across
  bands. Any o(n) proof would need a genuinely non-tensor, asynchronous
  reply-compatibility potential; the ordinary tagged quotient values a/p_i cannot supply it.
implications:
  - >
    The prime-band recursive-factorization route (R169) does NOT close on its own: the
    strict per-band deficit is necessary numerology but not a sufficient potential. The
    named bridge target is dead in its additive/tensor form.
  - >
    A surviving o(n) route from the prime-band frame must construct an asynchronous
    cross-band compatibility potential that tracks the cumulative weighted reply-compatibility
    defect globally — strictly harder than any single-move or single-band bound.
  - >
    Confirms the general pattern (four prior rounds) that per-object/local deficits in
    this problem do not aggregate into game-length bounds without a chronology-respecting
    global argument — the same static-vs-dynamic conflation flagged for capacity variants.
confidence_at_time: medium
strategy_dependence: strategy-dependent
prompt: erdos-872/prompts/researcher-R170-tagged-tensorization.md
---

# Verdict

**Tagged tensorization is false on the strategic reading required to multiply the strict band deficits.** On the weaker reading where “charge to \(k\) quotient moves” merely means recording the \(k\) projections \(a/p_i\), it is tautologically true but has no game-theoretic consequence.

The failure is not principally on the Prolonger side. The factor \(j\) correctly bounds the number of projections of one Prolonger move. The failure is that **Shortener’s minimization does not tensorize**:

\[
\min_{\text{one compatible global reply }s}
   \sum_{p}F_p(s/p)
\quad\text{can be much larger than}\quad
\sum_p\min_{\text{independent local reply }z_p}F_p(z_p).
\]

The gap can tend to infinity for a single two-tag move. Thus the strict quantity

\[
j\log\!\left(1+\frac1j\right)<1
\]

is a static projection-multiplicity deficit, not by itself a trajectory potential. This refutes the named statement in Attachment Q, but it does **not** decide \(L(n)=o(n)\). 

---

## 1. The first incompatibility: disjoint fibres versus blocker closure

Let

\[
Q_p(n)=\{x\le n/p:P^+(x)\le p\},
\]

so that \(px\) has largest-prime tag \(p\). These are the genuine quotient boards associated with the disjoint largest-prime assignment.

Suppose

\[
a=p_1p_2\cdots p_kb,\qquad
p_1<p_2<\cdots<p_k,
\]

where the \(p_i\) are distinct band primes and \(P^+(b)\le p_1\). For every \(i<k\),

\[
P^+\!\left(\frac a{p_i}\right)\ge p_k>p_i,
\]

and consequently

\[
\frac a{p_i}\notin Q_{p_i}(n).
\]

Thus, in a genuine largest-prime partition, only the projection belonging to the largest tag is necessarily an internal quotient move. The other \(k-1\) projections are external blockers.

This gives an unavoidable dichotomy.

* If the local game for tag \(p\) is restricted to \(Q_p(n)\), then the assertion that \(a\) gives \(k\) ordinary quotient moves is literally false.
* If the local game is enlarged to the full cone
  \[
  \widehat Q_p(n)=[1,\lfloor n/p\rfloor],
  \]
  then blocker closure is restored, but the quotient games overlap and their Shortener replies are not independent.

The second branch is the strategically meaningful proposed repair. It is also false, as shown next.

---

# 2. A two-tag compatibility-gap theorem

The counterexample already occurs in the third prime band

\[
I_3=(n^{1/4},n^{1/3}].
\]

It is fixed in advance, begins from the common empty baseline, and works against every first Shortener reply.

## Theorem

For arbitrarily large \(n\), there exist distinct primes \(p<q\in I_3\), a first Prolonger move \(a\) having exactly the two \(I_3\)-tags \(p,q\), and four predetermined largest-prime-tagged packets, each of size

\[
M\asymp \frac{n^{3/10}}{\log n},
\]

with the following properties.

1. In the \(p\)-quotient and \(q\)-quotient separately, after receiving the projection of \(a\), Shortener has an immediate legal reply that deletes one entire still-unexposed packet.
2. Those two optimal quotient replies cannot be realized by one global legal move.
3. After every global Shortener reply to \(a\), Prolonger has a legal second move after which at least
   \[
   3M-O(1)
   \]
   tagged targets are protected in the sense that every future legal move is comparable with at most one of them.
4. Independent ordinary quotient continuations would leave only
   \[
   2M+O(1)
   \]
   such targets.

Hence the compatibility defect is at least \(M-O(1)\to\infty\).

---

## 3. Construction

Put

\[
P=n^{3/10},\qquad S=n^{2/5}.
\]

Fix a sufficiently small constant \(\delta>0\). For large \(n\), choose distinct primes

\[
p<q,\qquad p,q\in[(1-\delta)P,P].
\]

Since

\[
n^{1/4}\ll P\ll n^{1/3},
\]

both primes lie in \(I_3\).

Choose pairwise coprime \(p\)-smooth integers

\[
H\asymp \delta S,\qquad
C\asymp \delta S,\qquad
D\asymp \delta S.
\]

For example, take suitable powers of \(2,3,5\), respectively. More explicitly, one can arrange

\[
\delta S\le H<2\delta S,\qquad
\delta S\le C<3\delta S,\qquad
\delta S\le D<5\delta S.
\]

Choose four pairwise disjoint sets of primes

\[
R_{p,1},R_{p,2},R_{q,1},R_{q,2}
   \subseteq[\delta P,2\delta P],
\]

each of cardinality

\[
M=\Theta(P/\log P),
\]

and choose two further distinct primes \(u_p,u_q\) in the same interval. All these primes are smaller than \(p\).

Define the first Prolonger move and the two possible second moves by

\[
a=pqH,
\qquad
b_p=pCu_p,
\qquad
b_q=qDu_q.
\]

Define four target packets:

\[
\mathcal P_{p,1}=\{pHr:r\in R_{p,1}\},
\qquad
\mathcal P_{p,2}=\{pCr:r\in R_{p,2}\},
\]

\[
\mathcal P_{q,1}=\{qHr:r\in R_{q,1}\},
\qquad
\mathcal P_{q,2}=\{qDr:r\in R_{q,2}\}.
\]

Every member of \(\mathcal P_{p,1}\cup\mathcal P_{p,2}\) has largest prime \(p\), and every member of the other two packets has largest prime \(q\).

All the displayed numbers lie below \(n\). Indeed,

\[
pqH\ll P^2S=n,
\]

and similarly

\[
pCu_p,\ qDu_q,\ pHr,\ pCr,\ qHr,\ qDr
   \ll P^2S=n.
\]

Choosing \(\delta\) sufficiently small supplies the required constant slack.

---

# 4. Quotient geometry: two independent stars in each tag

The \(p\)-quotient ceiling is

\[
Y_p=\frac np\asymp n^{7/10},
\]

and similarly \(Y_q\asymp n^{7/10}\).

Inside the \(p\)-quotient are two stars:

\[
H\mid qH,\quad H\mid Hr\quad(r\in R_{p,1}),
\]

and

\[
C\mid Cu_p,\quad C\mid Cr\quad(r\in R_{p,2}).
\]

Likewise, in the \(q\)-quotient the two centers are \(H,D\).

These stars cannot be blocked simultaneously by one quotient multiple, because

\[
HC\asymp n^{4/5}>Y_p\asymp n^{7/10},
\]

and

\[
HD\asymp n^{4/5}>Y_q.
\]

Since \(H,C,D\) are pairwise coprime, there is also no nontrivial common divisor of the two centers.

Within one packet, for distinct leaf multipliers \(r,r'\),

\[
Hrr'\asymp n,
\]

while the quotient ceiling is only \(n^{7/10}\). Hence no quotient number is a common multiple of two distinct leaves. Every common divisor of two leaves divides the relevant center.

Thus each local quotient contains exactly the delayed-reply structure of two independent stars:

* one Prolonger blocker can expose one packet;
* an immediate Shortener reply can select the other center and erase the other packet;
* two Prolonger blockers before that reply expose both packets.

The ordinary alternating packet value is therefore \(M+O(1)\), whereas allowing one missed Shortener turn raises it to \(2M+O(1)\).

---

# 5. The first multi-tag move

Prolonger begins with

\[
a=pqH.
\]

It is a multiple of both roots \(pH\) and \(qH\). Hence it kills both roots.

It does not kill their leaves. For example,

\[
\frac{a}{pH}=q,
\qquad
\frac{pHr}{pH}=r,
\]

and \(q,r\) are distinct primes. Thus \(a\) and \(pHr\) are incomparable. The same holds in the \(q\)-packet.

Consequently, \(a\) simultaneously exposes the two first packets

\[
\mathcal P_{p,1},\qquad \mathcal P_{q,1}.
\]

In quotient language, its projections are

\[
\frac ap=qH,\qquad
\frac aq=pH.
\]

Notice the closure issue explicitly: since \(q>p\),

\[
qH\notin Q_p(n),
\]

although it is an ordinary move in the enlarged ambient \(p\)-cone.

---

# 6. The two independent quotient replies cannot be fused

In the \(p\)-quotient, after the move \(qH\), Shortener can play \(C\). Its global lift is

\[
pC.
\]

This deletes the whole packet \(\mathcal P_{p,2}\) and makes \(b_p=pCu_p\) illegal.

In the \(q\)-quotient, the corresponding optimal response is \(D\), lifted globally to

\[
qD.
\]

This deletes \(\mathcal P_{q,2}\) and makes \(b_q\) illegal.

These two replies cannot be realized by one global move. Indeed,

\[
\gcd(pC,qD)=1,
\]

while

\[
\operatorname{lcm}(pC,qD)=pqCD>n
\]

for large \(n\), since it has scale

\[
P^2S^2=n^{7/5}.
\]

More generally, no legal global move can delete both second packets: a common divisor of two leaves, one from each packet, would divide \(\gcd(pC,qD)=1\), while a common multiple exceeds \(n\).

Thus the independent local minima \(C\) and \(D\) form an incompatible tuple.

---

# 7. Prolonger’s second move works against every reply

Let \(s\) be an arbitrary legal Shortener reply to \(a\).

The candidate blockers \(b_p,b_q\) satisfy

\[
\gcd(b_p,b_q)=1
\]

and

\[
\operatorname{lcm}(b_p,b_q)=b_pb_q>n.
\]

They are also incomparable with one another. Therefore no number \(s\in[2,n]\) can be comparable with both \(b_p\) and \(b_q\). Indeed, the four possible orientation patterns give:

* \(s\mid b_p\) and \(s\mid b_q\): then \(s\mid1\), impossible;
* \(b_p\mid s\) and \(b_q\mid s\): then \(\operatorname{lcm}(b_p,b_q)\mid s>n\);
* one divisibility in each direction: then \(b_p\mid b_q\) or \(b_q\mid b_p\), impossible.

Since both blockers were legal after \(a\), at least one remains legal after \(s\). Prolonger chooses such a blocker; suppose it is \(b_p\).

Then \(b_p\) kills the root \(pC\) while preserving every target \(pCr\), because

\[
\frac{b_p}{pC}=u_p,
\qquad
\frac{pCr}{pC}=r,
\]

with \(u_p\ne r\).

---

# 8. Counting the unavoidable residual

After \(a\), the first two packets have \(2M\) leaves. A legal Shortener move can affect at most one of them.

To see this, take two first-packet leaves \(x,y\). Any common divisor of \(x,y\) divides \(a\), and is therefore illegal after \(a\). Their least common multiple exceeds \(n\). Mixed divisibility orientations would imply \(x\mid y\) or \(y\mid x\), which does not occur.

Hence at least \(2M-1\) first-packet leaves survive \(s\).

For the chosen second packet \(\mathcal P_{p,2}\), the legality of \(b_p\) implies that \(s\) cannot be a common divisor of two packet leaves: every such common divisor divides \(pC\), and hence divides \(b_p\). A common multiple of two leaves again exceeds \(n\). Therefore \(s\) affects at most one leaf of the chosen second packet. The move \(b_p\) itself preserves every leaf.

Thus, after the sequence

\[
a,\ s,\ b_p,
\]

there remain at least

\[
(2M-1)+(M-1)=3M-2
\]

protected leaves.

Any two surviving leaves have the following property:

* every common divisor greater than \(1\) divides either \(a\) or \(b_p\), hence is illegal;
* their least common multiple exceeds \(n\).

Therefore every future legal move is comparable with at most one surviving leaf. At least

\[
3M-2
\]

additional actual moves are required before all of them cease to be legal.

This holds against every choice of \(s\).

---

# 9. The precise tensorization failure

Consider the state immediately after \(a\).

In the two quotient games separately, the independent optimal Shortener continuations are:

\[
qH\ \longrightarrow\ C
\]

in the \(p\)-quotient, and

\[
pH\ \longrightarrow\ D
\]

in the \(q\)-quotient.

These continuations leave only the two already exposed first packets, for a total of

\[
2M+O(1)
\]

protected targets.

But the actual global continuation has only one Shortener move. Prolonger then exposes one of the second packets, producing

\[
3M-O(1)
\]

protected targets.

Equivalently, if \(F_p(z)\) and \(F_q(z)\) denote the packet residuals after the respective local Shortener replies, then

\[
\min_{z_p}F_p(z_p)+\min_{z_q}F_q(z_q)
   =2M+O(1),
\]

whereas compatibility of the replies forces

\[
\min_{\substack{s\text{ one}\\\text{global reply}}}
\max_{\substack{b_p\text{ or }b_q\\\text{legal next}}}
F_{p,q}(s,b)
   \ge 3M-O(1).
\]

Hence

\[
\boxed{
\min_s\sum_{t\in\{p,q\}}F_t(s)
-
\sum_{t\in\{p,q\}}\min_{s_t}F_t(s_t)
\ge M-O(1).
}
\]

Since

\[
M\asymp \frac{n^{3/10}}{\log n}\to\infty,
\]

the compatibility gap is not a bounded bookkeeping error.

This is the exact invalid interchange:

\[
\boxed{
\min_{\text{compatible reply}}\sum
\;\not=\;
\sum\min_{\text{independent reply}}.
}
\]

---

# 10. Turn-language interpretation

After the single move \(a\), both the \(p\)-game and the \(q\)-game are locally at a Shortener-to-move node.

An ordinary quotient simulation would now give each game a Shortener reply. Globally, however, only one Shortener move occurs. In the construction, one move cannot realize both relevant replies.

Consequently at least one local game remains at a Shortener-to-move node when Prolonger moves again. The next blocker is therefore an out-of-turn Prolonger move in that local game.

There are only three possible treatments:

1. **Ignore the second Prolonger move in that quotient.**  
   Then its entire \(M\)-packet is uncharged.

2. **Insert a fictitious local Shortener reply before it.**  
   That reply would have selected the second center and destroyed the packet, so the fictitious local state is not the realized global state.

3. **Allow Prolonger to move twice before the local Shortener replies.**  
   Then the local object is a biased or asynchronous quotient game, not an ordinary quotient game.

For the two-star packet,

\[
V_{\mathrm{ordinary}}=M+O(1),
\qquad
V_{\mathrm{one\ missed\ reply}}=2M+O(1).
\]

Thus replacing ordinary values by uniformly pass-robust values can cost a factor arbitrarily close to \(2\).

---

# 11. Why the strict band deficit cannot absorb this

For \(j=3\),

\[
3\log\frac43=0.863046\ldots<1.
\]

The compatibility construction has a packet amplification ratio

\[
\frac{3M}{2M}\longrightarrow\frac32.
\]

A crude multiplicative repair would therefore produce

\[
\frac32\cdot3\log\frac43
   =1.29457\ldots>1.
\]

So the strict band loss has nowhere near enough slack to pay uniformly for asynchronous reply incompatibility.

More generally, the arithmetic threshold behind the construction is instructive. For tags \(p,q\asymp P\), a root that can be blocked by the shared move \(pqH\) can have size

\[
H\asymp \frac n{P^2}.
\]

A second individually blockable root can have the same size. They are non-batchable in the \(p\)-quotient precisely when

\[
H^2>\frac np,
\]

or equivalently

\[
\frac{n}{P^3}>1.
\]

Thus this delayed-reply phenomenon becomes available exactly once

\[
P<n^{1/3},
\]

that is, beginning in \(I_3\). This explains why the clean behaviour above \(\sqrt n\) cannot simply be iterated through the lower bands.

The same construction works in every fixed band \(I_j\), \(j\ge3\), by choosing

\[
\frac1{j+1}<\alpha<\min\!\left(\frac1j,\frac13\right),
\qquad
p,q\asymp n^\alpha,
\qquad
H,C,D\asymp n^{1-2\alpha}.
\]

---

# 12. The exact repair that remains meaningful

A repaired statement cannot be a sum of ordinary quotient values. It must retain the compatibility relation among local replies.

For a set \(K\) of outstanding tag obligations, let \(F_p(s)\) denote the continuation cost in tag \(p\) when the actual global Shortener move is \(s\). The missing term is the **reply-compatibility defect**

\[
\operatorname{Gap}_A(K)
=
\min_{s\text{ globally legal}}
   \sum_{p\in K}F_p(s)
-
\sum_{p\in K}
   \min_{z_p\text{ locally legal}}F_p(z_p).
\]

Tagged tensorization asserts, in effect, that this gap is zero or harmless. The construction proves

\[
\operatorname{Gap}_A(\{p,q\})
   \ge M-O(1).
\]

Therefore a viable potential must be genuinely joint. It must track at least:

* which tagged games are awaiting a Shortener reply;
* which subsets of those obligations can be served by one globally legal move;
* the packet value hidden behind each unserved obligation;
* how later global moves may enter an already-unserved quotient history.

A one-step approximation would be a weighted reply-cover functional

\[
\Gamma_A(K)
=
\min_{s\text{ legal}}
\sum_{p\in K\setminus C_A(s)}w_p,
\]

where \(C_A(s)\) is the set of obligations genuinely served by \(s\). But chronology requires a recursive version of this functional, because Prolonger can act on an uncovered obligation before it is eventually served.

This is not tensorization. It is a game on the compatibility hypergraph of the tagged cones.

---

# 13. Relation to direct-ancestor packet inheritance

The counterexample is the prime-band form of direct-ancestor inheritance:

\[
a=pqH
\]

is simultaneously a direct ancestor of the two roots \(pH,qH\), and it leaves both sibling packets alive. Before both quotient replies can occur, the move

\[
b_p=pCu_p
\quad\text{or}\quad
b_q=qDu_q
\]

is inserted as a new direct ancestor in an unserved cone.

Each frozen quotient position is easy: play the other center. What fails is the simultaneous chronological realization of those frozen repairs. One ancestor creates several reply obligations, but only one compatible global reply is available before the next ancestor arrives.

That is precisely why an additive local-value ledger cannot be Lipschitz under multi-tag edge insertion.

---

# Overall ruling

The largest-prime-band identity

\[
j\sum_{p\in I_j}\frac1p
=
j\log\!\left(1+\frac1j\right)+o(1)<1
\]

remains correct and potentially useful. But it controls only the number of Prolonger projections. It does not control the compatibility gap among the corresponding Shortener replies.

Therefore:

\[
\boxed{\text{The tagged-tensorization statement is false.}}
\]

On genuine disjoint largest-prime fibres it is not even closed under inherited blockers. On ambient blocker-closed cones, the sum of ordinary quotient values incorrectly replaces one compatible global minimization by independent local minimizations. The resulting defect can be \(n^{3/10}/\log n\) from a single two-tag episode.

Consequently the product

\[
\prod_{j\le J}j\log(1+1/j)\asymp J^{-1/2}
\]

does not yield an \(o(n)\) rate without an additional global theorem controlling the cumulative weighted reply-compatibility defect. Such a theorem would necessarily use a genuinely non-tensor, asynchronous compatibility potential; the ordinary tagged quotient values cannot supply it.