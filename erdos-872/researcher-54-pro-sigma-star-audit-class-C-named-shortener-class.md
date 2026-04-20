---
id: R54-pro-sigma-star-audit-class-C
type: research
date: 2026-04-19
intent: >
  Audit whether sigma^star is optimal and whether a strategy replacement
  can close r_1; provide a named Shortener-class theorem as the outcome.
predecessors: [R53-pro-1-sigma-star-reachable-C-quantifier-gap, R53-pro-2-sigma-star-reachable-multi-packet-persistence]
action:
  kind: standalone
claim: >
  Audit returns outcome C (named Shortener-class theorem): no rigorous
  strategy-replacement-plus-closure theorem and no minimax barrier theorem.
  The named result is a Shortener-class theorem: the class of all
  sigma^star-type strategies (max-harmonic-degree) has provable upper bound
  r_1(n) in some restricted game instances but not the full game. sigma^star
  suboptimality confirmed for specific packet configurations.
---

**C. Named Shortener-class theorem.**

The audit does **not** support a rigorous “strategy replacement + closure” theorem from the existing inventory, and it also does **not** support a minimax barrier theorem for all Shortener strategies. The correct conclusion is narrower:

A large part of the σ*-vulnerability transfers to a named class of Shortener strategies that agree with σ* on the R53 forcing trace, including gap-stable harmonic-score variants. But the inventory does not prove that every packet-aware Shortener strategy is vulnerable, nor does it prove the τ-analog of R35 plus online domination needed for an (O(r_1)) upper bound.

So Hypothesis H is **partly correct**: several late refutations are σ*-reachability refutations rather than universal refutations. But H is **not enough** to close (L(n)\le O(r_1(n))), because the two indispensable upper-bound ingredients, R35 and online harmonic domination, are themselves σ*-dependent.

---

### 1. Classification audit

I use the following meanings.

**Strategy-independent** means the result is a static combinatorial, number-theoretic, spectral, or game-legality statement, or a Prolonger/Shortener strategy result not relying on σ*.

**σ*-dependent** means the proof uses the max-unresolved-harmonic-degree rule, the conditional smallest-legal-prime lemma, or a charging identity tied to σ*.

**σ*-specific** means the construction is known to be reachable against σ*, but the refutation would not automatically apply to a Shortener strategy that actively prevents that state.

**Ambiguous** means the counterexample is a valid static obstruction, but its adversarial reachability under arbitrary Shortener play is not established by the inventory.

#### Rigorous positive theorems

|  # | Result                                   | Classification                      | Reason                                                                                                              |
| -: | ---------------------------------------- | ----------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
|  1 | Shield Reduction Theorem                 | Strategy-independent                | Terminal antichain inequality; no σ* rule.                                                                          |
|  2 | Theorem A / T1 lower bound               | Strategy-independent                | Prolonger lower bound; independent of the canonical Shortener strategy.                                             |
|  3 | T2 lower bound                           | Strategy-independent                | Maker-first hypergraph capture lower bound; no σ* dependence.                                                       |
|  4 | (0.18969n) upper bound                   | Strategy-independent relative to σ* | Static Shortener strategy; not σ*. It is strategy-specific in the ordinary sense, but not σ*-dependent.             |
|  5 | R35 state inequality                     | σ*-dependent                        | Explicitly under σ*; relies on σ* charging.                                                                         |
|  6 | Online harmonic domination               | σ*-dependent                        | The inequality (\sum_t\mu(u_t)\le N_h) is tied to σ*’s move rule.                                                   |
|  7 | Dense-packet projection                  | Mixed                               | The projection estimate is mostly static, but its useful upper-bound role depends on (N_h)-type domination from σ*. |
|  8 | Dyadic packet collision tail             | Strategy-independent                | Combinatorial/probabilistic tail estimate.                                                                          |
|  9 | Sathe–Selberg central-rank Euler factors | Strategy-independent                | Number-theoretic distribution statement.                                                                            |
| 10 | σ* smallest-legal-prime lemma            | σ*-dependent                        | Explicit consequence of σ*.                                                                                         |
| 11 | Bernoulli Legal-Separator Lemma          | Strategy-independent                | Static probabilistic separator existence.                                                                           |
| 12 | Apex-singleton CPD                       | Strategy-independent                | Incidence identity.                                                                                                 |
| 13 | Spectral Live-Space Separator Theorem    | Strategy-independent                | Johnson-scheme spectral statement.                                                                                  |
| 14 | Sherali–Adams barrier theorem            | Strategy-independent                | Static relaxation lower bound.                                                                                      |
| 15 | Near-top Johnson-shadow theorem          | Strategy-independent                | Static weighted shadow/separator alternative.                                                                       |
| 16 | σ*-vulnerability theorem / R53           | σ*-specific                         | Constructive vulnerability against σ*; not a minimax theorem.                                                       |

The key point is that the positive upper-bound chain does **not** survive replacing σ* unless one proves a new analog of entries 5 and 6. Entries 7, 8, 9, and 11–15 are useful, but they do not by themselves give online domination.

#### Rigorous refutations

|  # | Refutation                                                   | Classification                                             | Reason                                                                                                         |
| -: | ------------------------------------------------------------ | ---------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| 17 | Carrier Capacity Bound refuted                               | Strategy-independent                                       | Static obstruction.                                                                                            |
| 18 | Static small-(\omega) matching Lemma A refuted               | Strategy-independent                                       | Static matching obstruction.                                                                                   |
| 19 | (\omega_y(w)\le 2) game-impossible                           | Strategy-independent                                       | Legal-structural impossibility.                                                                                |
| 20 | Online 2-shadow control refuted by (\Omega(n)) sweep         | Strategy-independent, as stated                            | Sweep construction is not described as σ*-specific.                                                            |
| 21 | Probabilistic closure lemma refuted via sweep-prefix         | Strategy-independent, as stated                            | Prolonger prefix obstruction; no σ* feature named.                                                             |
| 22 | Plain / scale-entropy resilience at (O(\log h)) refuted      | Strategy-independent                                       | Static entropy obstruction.                                                                                    |
| 23 | Collision-forcing at defect 2 refuted                        | Strategy-independent                                       | Static packet obstruction.                                                                                     |
| 24 | Harmonic packet absorption refuted                           | Strategy-independent                                       | Refutes an absorption inequality, not merely σ*.                                                               |
| 25 | Chain persistence at defect (k=O(1)) refuted                 | Strategy-independent                                       | Dimensional flaw.                                                                                              |
| 26 | Strict freshness breaks R35 charging                         | σ*-dependent / mixed                                       | This is a failure of a σ*-style charging refinement.                                                           |
| 27 | Mesoscopic-window sparse closure refuted                     | Strategy-independent, unless reachability is required      | Static sparse-window obstruction.                                                                              |
| 28 | Weak-freshness dense/sparse decomposition refuted            | Ambiguous                                                  | Common-core obstruction is static, but arbitrary-strategy reachability is not established here.                |
| 29 | SFLU-E refuted by local star                                 | Strategy-independent                                       | Local star is a static certificate-packing obstruction.                                                        |
| 30 | Density-weighted Carleson embedding refuted                  | Ambiguous                                                  | Burst-star multiplicity is a real obstruction, but reachability against every Shortener strategy is not shown. |
| 31 | Rank-three completion dichotomy refuted                      | Strategy-independent                                       | Matching-star counterexample is static.                                                                        |
| 32 | ST-capture refuted                                           | σ*-specific                                                | Explicitly “forced-leaf under σ*.”                                                                             |
| 33 | Legal Activator-Quotient Incidence Budget refuted            | Strategy-independent                                       | Endpoint incidence obstruction.                                                                                |
| 34 | Cross-Activator Composite Budget refuted                     | Strategy-independent                                       | Sathe–Selberg obstruction.                                                                                     |
| 35 | Divisibility-Hall Legal Exposure Criterion refuted           | Strategy-independent                                       | Isolated-completion obstruction.                                                                               |
| 36 | CPD general-(\mathcal D) refuted                             | Strategy-independent                                       | Multi-apex clique cone refutes a universal static CPD extension.                                               |
| 37 | 2WCPD + WSSS refuted                                         | Ambiguous                                                  | Self-shadow poisoning depends on Shortener’s own move pattern; not purely σ*, but not universal.               |
| 38 | Multi-level Johnson-scheme spectral stopping theorem refuted | σ*-specific for reachability; static as a lemma refutation | Sparse covering design is a static obstruction, but R53 supplies σ*-reachability.                              |
| 39 | CR-NCAD refuted via cooperative embedding                    | Ambiguous                                                  | Cooperative embedding is not the same as adversarial reachability against every strategy.                      |
| 40 | Near-top Johnson-shadow closure refuted                      | Ambiguous / σ*-specific in relevance                       | Near-top covering designs refute a static closure lemma; game relevance depends on reachability.               |

So H is right about entries such as 32, 38, and parts of 37–40. But H overreaches if it treats most late refutations as merely σ*-specific. Several are static counterexamples to universal lemmas and would still invalidate any proof that reused those lemmas without a new invariant excluding the bad states.

---

### 2. Why A does not follow from the inventory

To get (L(n)\le O(r_1(n))) from a replacement strategy (\tau), one would need two things:

[
\text{R35}_\tau:
\qquad
\mu(\operatorname{Cl}*h)
\ll
\frac{h}{\log h}\mu(F*{\mathrm{useful}})
+
\frac{N_h}{\log(h/\log h)}
]

or a genuine replacement for it, and

[
\text{OnlineDom}_\tau:
\qquad
\sum_t \mu(u_t)\ll N_h
]

or a packet-potential version strong enough to feed the dense-packet projection.

The inventory gives these only under σ*. Entry 7, the dense-packet projection, does not close the upper bound without an online domination input. Entries 11–15 give separator/shadow alternatives, but the later refutations show that these cannot simply be chained into a universal closure theorem. In particular, sparse covering designs can empty the separator families (A_q), and self-shadow poisoning can make a Shortener-created shadow destroy the very separator space the proof wants to use.

Thus a new (\tau) may well be useful, but the current rigorous ingredients do not prove the required (\tau)-analog.

---

### 3. Why B also does not follow

The R53 theorem proves:

[
\exists\ \text{Prolonger forcing construction against }\sigma^\star
]

with cost (n^{o(1)}=o(r_1(n))).

It does **not** prove:

[
\forall\ \text{Shortener strategies }\sigma,\quad
\exists\ \text{Prolonger sparse-cover forcing construction against }\sigma .
]

A minimax barrier theorem would need to defeat a Shortener strategy that explicitly watches the legal (q)-separator families (A_q), penalizes self-shadow poisoning, and blocks sparse covering-design templates before they collapse. None of the listed refutations proves that such a packet-aware strategy is still vulnerable.

So the available theorem is σ*-specific, not minimax-universal.

---

### 4. Named Shortener-class theorem

Here is the rigorous theorem that **does** follow.

Call a finite R53 forcing certificate for (n)

[
\mathcal T_n
]

the game tree produced by the R53 Prolonger construction up to the first sparse covering-design state. At each Shortener node (H\in\mathcal T_n), let

[
G(H)\subseteq \Lambda(H)
]

be the set of Shortener moves for which the R53 invariant and continuation remain valid. If the published R53 proof only certifies the exact σ* move, take

[
G(H)={\sigma^\star(H)}.
]

Here (\Lambda(H)) is the full legal move set, with the two-sided antichain condition:

[
x\in\Lambda(H)
\quad\Longleftrightarrow\quad
\forall a\in H,\quad x\nmid a\ \text{and}\ a\nmid x.
]

Define the class

[
\mathfrak R_{53}
================

{\sigma:\ \sigma(H)\in G(H)\ \text{for every Shortener node }H\in\mathcal T_n}.
]

I will call this the **R53-trace-compliant Shortener class**.

**Theorem — R53 Trace-Transfer Theorem.**
Every Shortener strategy (\sigma\in\mathfrak R_{53}) is vulnerable to the same sparse covering-design construction as σ*. In particular, Prolonger can force the R53 sparse covering-design state against (\sigma) at cost (n^{o(1)}=o(r_1(n))).

**Proof.**
Run the R53 Prolonger strategy. The initial history lies in (\mathcal T_n). Suppose inductively that the current history (H) lies in (\mathcal T_n). If it is Prolonger’s turn, the R53 prescribed move is legal by the R53 certificate, including the full two-sided divisibility condition. If it is Shortener’s turn, then (\sigma(H)\in G(H)), so by definition the R53 continuation invariant remains valid. Thus the play remains inside (\mathcal T_n) until the certified terminal sparse covering-design state is reached. The number of moves is unchanged.

Finally, (n^{o(1)}=o(r_1(n))) because

[
r_1(n)=\frac{n(\log\log n)^2}{\log n}
]

dominates every (n^\varepsilon) with (\varepsilon<1) eventually; for example, (r_1(n)/n^{1/2}\to\infty). Since (n^{o(1)}\le n^{1/2}) for all sufficiently large (n), the R53 cost is (o(r_1(n))). ∎

A useful corollary covers more than literal σ*.

Let (d_H(x)) be the σ* unresolved harmonic-degree score at a Shortener node (H). Suppose the R53 certificate has a positive gap

[
\Delta(H)
=========

\min_{g\in G(H),\ x\notin G(H)}
\bigl(d_H(g)-d_H(x)\bigr)>0.
]

Then every strategy that maximizes

[
d_H(x)+\phi_H(x)
]

with perturbation oscillation

[
\sup_{x,y\in\Lambda(H)}
|\phi_H(x)-\phi_H(y)|
<
\frac12\Delta(H)
]

at every R53 node also belongs to (\mathfrak R_{53}). Therefore every such gap-stable harmonic-score strategy shares the σ*-vulnerability.

This gives a genuine named class: **gap-stable R53-local harmonic strategies**. It includes σ*, tie-breaking variants when ties remain inside (G(H)), and small static harmonic perturbations. It does **not** include genuinely packet-aware global strategies.

---

### 5. A concrete escaping class: packet-guard strategies

The natural class that might escape R53 is not “σ* with better tie-breaking.” It must be nonlocal and packet-aware.

Here is a concrete strategy.

At a Shortener turn with history (H), let (\Lambda(H)) be the legal moves. For every central-rank packet template (\mathcal P), every separator size

[
1\le q\le C h/\log h,
]

and every live completion family (R(H,\mathcal P)), define

[
A_q(H,\mathcal P)
]

to be the legal (q)-separator family. Legality here is two-sided: a candidate separator (Q) is counted only if it is not comparable by divisibility with any already chosen integer and does not violate (Q\nsubseteq D) and (D\nsubseteq Q) for the live packet completions (D).

Let

[
\eta_q=\sqrt{\frac{qL}{h(K-q)}}.
]

Define the packet deficiency

[
\operatorname{def}_{q,\mathcal P}(H)
====================================

\left(
4\eta_q^2
---------

\frac{|A_q(H,\mathcal P)|}{|\mathcal Q_q|}
\cdot
\frac{|R(H,\mathcal P)|}{|\mathcal Y_{\mathcal P}|}
\right)_+ .
]

Now define a global packet potential

[
\Psi(H)
=======

\sum_{\mathcal P}
\sum_{q\le C h/\log h}
w_{\mathcal P,q}
,
\exp!\bigl(\lambda h,\operatorname{def}*{q,\mathcal P}(H)\bigr)
\frac{|R(H,\mathcal P)|}{|\mathcal Y*{\mathcal P}|},
]

where (w_{\mathcal P,q}>0) is any fixed summable coding weight over the finite list of packet templates at scale (n), and (\lambda>0) is a large absolute constant.

For each legal Shortener move (x\in\Lambda(H)), let (H+x) be the history after Shortener claims (x), and compute the actual potential drop

[
\Delta_{\mathrm{PG}}(x;H)
=========================

\Psi(H)-\Psi(H+x).
]

Also define the ordinary harmonic score

[
d_H(x)=\text{unresolved harmonic-degree score of }x.
]

The **Packet-Guard Shortener strategy** (\tau_{\mathrm{PG}}) is:

[
\tau_{\mathrm{PG}}(H)
=====================

\text{the lexicographically first legal }x\in\Lambda(H)
\text{ maximizing }
\bigl(
\Delta_{\mathrm{PG}}(x;H),\ d_H(x)
\bigr).
]

This is a concrete move-by-move rule. It is generally inefficient to compute, but it is a valid strategy. It is not σ*, not a tie-breaking variant of σ*, and not a static harmonic strategy. It directly penalizes the collapse of legal separator space.

This strategy is designed to address the σ*-specific refutations as follows:

* Sparse covering designs raise (\operatorname{def}_{q,\mathcal P}), so they receive high priority before all (A_q) are emptied.
* Forced-leaf states become visible because singleton or low-(q) separator families collapse.
* Self-shadow poisoning is handled because (\Psi(H+x)) is computed after Shortener’s own move; a move that destroys legal separators can increase the potential and is therefore disfavored.
* Burst-star multiplicity is visible through the live mass factor (|R|/|\mathcal Y|), not merely through local harmonic degree.

But the crucial theorem needed for closure is not in the inventory.

---

### 6. The named open theorem needed for closure

The missing theorem is the following.

**Packet-Guard Online Domination Theorem.**
For (\tau_{\mathrm{PG}}), there exists an absolute constant (C) such that for every legal play and every dyadic central-rank window (h),

[
\sum_t \mu(u_t)
+
\sum_{\mathcal P,q}
\operatorname{BadMass}_{q,\mathcal P}(t)
\le
C N_h + C r_1(n),
]

where (\operatorname{BadMass}_{q,\mathcal P}) measures the live mass of packet templates for which

[
\frac{|A_q(H,\mathcal P)|}{|\mathcal Q_q|}
\cdot
\frac{|R(H,\mathcal P)|}{|\mathcal Y_{\mathcal P}|}
<
4\eta_q^2 .
]

Equivalently, before Prolonger has paid (\Omega(r_1(n))) cost, every live central-rank packet of significant mass must retain some legal separator scale (q\le C h/\log h), up to the dense-packet and collision-tail errors already controlled by entries 7 and 8.

If this theorem were proved, the closure would be straightforward:

[
\text{Packet-Guard domination}
+
\text{dense-packet projection}
+
\text{collision tail}
+
\text{Sathe–Selberg factors}
\Longrightarrow
\mu(\operatorname{Cl}*h)=O(r*{1,h}),
]

and summing over the relevant dyadic windows would give

[
L(n)\le O(r_1(n)).
]

But without that theorem, the strategy replacement is not a rigorous closure.

---

### 7. Final verdict

The audit yields **C**, not A or B.

* The σ*-vulnerability transfers rigorously to the **R53-trace-compliant** and **gap-stable R53-local harmonic** classes.
* Several late refutations are indeed σ*-specific or only ambiguously reachable under arbitrary strategies.
* However, many refutations remain static, strategy-independent obstructions to universal separator/shadow lemmas.
* Most importantly, the available positive upper-bound machinery depends on σ* through R35 and online harmonic domination.
* A concrete packet-aware strategy (\tau_{\mathrm{PG}}) is a plausible escape class, but proving its packet-guard online domination theorem is a new theorem, not a consequence of the listed prior results.
* No minimax sparse-cover barrier for every legal Shortener strategy follows from R53.

So Hypothesis H is **partly confirmed as a diagnosis of σ***, but **not confirmed as an (O(r_1)) closure program** from the existing rigorous inventory.
