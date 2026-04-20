My diagnosis is that the exhausted paradigm is not failing because the chosen constants, windows, or definitions of “fresh/useful” are slightly wrong. It is failing because it tries to price a **global blocker geometry** by a **local first-hit mass**. That is the wrong unit of accounting.

The recurring obstruction is this:

[
\text{one Prolonger move can make many future shields simultaneously stale/active/first-hit,}
]

while the available Shortener budget

[
\sum_t \mu(u_t)\le N_h
]

only pays for mass actually removed by Shortener’s legal claims. The old framework counts the wrong side of the incidence relation. It counts many individual shield events, but the game itself only cares whether there is a legal divisor/composite that kills their common fiber. Local stars, packet traps, burst-stars, matching-stars, and cross-activator composites are all manifestations of the same high-codegree phenomenon.

So my answer is:

**The R35-style state-inequality-plus-(F_{\text{useful}})-dynamic paradigm is blocked from reaching (r_1). But state inequalities as such are not doomed. The replaceable component is the scalar local “useful shield” score, together with the (\sigma^\star)-centric dynamic budget. The missing ingredient is a global legal-transversal theorem for blocker hypergraphs.**

I will make that precise, then give a different approach and a rigorous partial result.

---

## 1. Negative diagnosis of the exhausted paradigm

Let me isolate the formal obstruction.

A proof in the exhausted class has the schematic form

[
\mu(\operatorname{Cl}*h)
\le f(h),\mu(F*{\text{useful}})+R_h,
]

with

[
f(h)\asymp \frac{h}{\log h},
]

and then tries to show dynamically that

[
\mu(F_{\text{useful}})
]

is small under (\sigma^\star), normally by charging it to the online harmonic removal budget

[
\sum_t \mu(u_t)\le N_h.
]

The problem is that this budget is a **one-dimensional removal budget**, whereas the obstruction is a **high-codegree incidence explosion**. In a burst-star or packet-star, a single Prolonger activator can make (T) shields relevant at once. The local proof tries to charge (T) objects. The game, however, only supplied one Prolonger move and perhaps one later Shortener move.

This gives the following structural theorem for the current proof class.

**Structural obstruction theorem.**
Consider any upper-bound proof whose rank-(h) step has the form

[
\mu(\operatorname{Cl}_h)
\le f(h)X_h+R_h,
\qquad f(h)=O(h/\log h),
]

where (X_h) is a nonnegative local first-hit / useful-shield score whose dynamic estimate is obtained from the (\sigma^\star) online harmonic domination

[
\sum_t \mu(u_t)\le N_h.
]

Then such a proof cannot produce an upper bound (o(r_2(n))), hence cannot reach (r_1(n)).

The proof is essentially forced by the two alternatives already visible in the failed attempts.

First, if (X_h) is narrow enough to satisfy a dynamic bound under (\sigma^\star), then there are packet-trap or stale-core states with

[
X_h=0
]

or negligible, but with

[
\mu(\operatorname{Cl}_h)\gtrsim \frac{N_h}{\log h}.
]

Thus the residual must satisfy

[
R_h\gtrsim \frac{N_h}{\log h}.
]

Summing this over central ranks (h\sim \log\log n) gives precisely the residual floor

[
\sum_h R_h\cdot(\text{rank density})
\gtrsim
\frac{n}{\log\log\log n}
= r_2(n)
]

up to constants. This is not a lower bound for the game; it is a lower bound for this proof architecture.

Second, if one enlarges (X_h) to see those stale-core or packet-trap configurations, then the star mechanisms force

[
X_h \ge (\log h) \cdot B_h
]

or worse, where (B_h) is the largest quantity that can be controlled by the online harmonic budget. That is exactly what the local-star, matching-star, burst-star, dense-packet, and cross-activator examples demonstrate: the local useful score becomes larger than the removable mass by a factor diverging with (h), or even exponentially in the packet examples.

So the paradigm is trapped between two bad regimes:

[
\begin{array}{c|c}
\text{narrow }F_{\text{useful}} & R_h\gtrsim N_h/\log h, \text{ giving } r_2 [2mm]
\text{broad }F_{\text{useful}} & \mu(F_{\text{useful}})\text{ cannot be dynamically bounded}
\end{array}
]

This is why the failures are correlated. They are not different near-misses; they are different witnesses to the same mismatch of accounting units.

The state inequality itself is not the ultimate villain. The bad component is the attempt to compress the state into a scalar mass of locally witnessed useful shields. A successful upper bound below (r_2) would need a state inequality whose residual is not (N_h/\log h), and whose state-dependent term is not a local first-hit score.

---

## 2. What should replace it: legal transversals, not useful shields

The natural replacement is to model the game locally as a **blocker-hypergraph transversal problem**.

At central rank, ignore prime powers for the moment and represent an integer by its set of prime factors. A rank-(h) object is an (h)-subset of some prime packet (P). The packet obstructions all have the same shape:

[
|P|=K=h+L,
\qquad
L\asymp \frac{h}{\log h}.
]

A Prolonger move inside the packet is an (h)-set

[
B_i\subset P.
]

A Shortener quotient (Q\subset P) is illegal because of this Prolonger move exactly when

[
Q\subseteq B_i.
]

Equivalently, if

[
C_i:=P\setminus B_i,
\qquad |C_i|=L,
]

then (Q) avoids being made illegal by (B_i) exactly when

[
Q\cap C_i\neq \varnothing.
]

Thus a legal composite quotient is a **hitting set** for the complements (C_i).

This is the missing object. The old proofs ask:

[
\text{How many useful shields were first-hit?}
]

The game-theoretic question should be:

[
\text{Is there a legal quotient }Q\text{ hitting all Prolonger blockers and contained in many remaining facets?}
]

That is a different mathematical problem. It belongs to hypergraph transversal theory, weighted set cover, entropy, and probabilistic method—not to local first-hit charging.

The corresponding Shortener strategy is not (\sigma^\star). It is a **fiber-transversal strategy**:

[
\sigma_{\mathrm{tr}}:
\quad
\text{choose a legal composite } d=\prod_{p\in Q}p
\text{ maximizing the surviving rank mass of its upper fiber.}
]

In packet language, choose (Q) maximizing

[
\mu{A\in\mathcal A_h(S): Q\subseteq A},
]

subject to (Q) being legal in the current game state.

This strategy deliberately chooses legal composites of individually illegal primes. The (91=7\cdot 13) phenomenon is not an annoyance here; it is the prototype.

If (7) is illegal because it divides one Prolonger move and (13) is illegal because it divides another, then ({7,13}) may still be a legal transversal. The endpoint-incidence proof sees zero support at (7) and (13). The transversal proof sees the edge ({7,13}), and claims (91).

That is the explicit decision point where the new method changes the outcome.

---

## 3. The new state inequality one should try to prove

The replacement for R35 should look locally like this.

For a packet (P) with (K=h+L), let (\mathcal A\subseteq \binom{P}{h}) be the surviving rank-(h) packet family. Let (B_1,\dots,B_s) be Prolonger blockers in that packet, with complements

[
C_i=P\setminus B_i.
]

Define the legal transversal fiber mass

[
M_P(Q)
:=
\mu{A\in\mathcal A: Q\subseteq A},
]

where (Q) ranges over legal quotients, i.e. transversals of the blocker complements and avoiding prior Shortener divisors.

The desired replacement inequality is not

[
\mu(\operatorname{Cl}*h)
\le \frac{h}{\log h}\mu(F*{\text{useful}})
+\frac{N_h}{\log h}.
]

It should be something of the following form:

[
\mu(\mathcal A)
\le
(s+2)^C
\max_{Q\text{ legal}} M_P(Q)

* \operatorname{Err}_{\le 3}(P,S).
  ]

Here (\operatorname{Err}_{\le 3}) is a genuine low-rank certificate term, not an R35 residual. It should consist of mass already forced into rank (1,2,3) quotient obstructions. That is exactly the scale compatible with

[
r_1(n)\asymp \frac{n(\log\log n)^2}{\log n}.
]

This would replace the artificial residual (N_h/\log h) by a blocker-entropy term depending on how many Prolonger moves have actually been spent sterilizing the packet. If (s) is small, Shortener has a large legal transversal fiber. If (s) is large, Prolonger has already paid many moves.

The needed tools are specific:

* **Hypergraph transversal theory** for the complements (C_i).
* **Lovász–Stein set cover bounds** or (\varepsilon)-net machinery to find small legal transversals.
* **Kruskal–Katona / LYM / shadow inequalities** to convert high-rank packet mass into low-quotient fiber mass.
* **Weighted entropy methods** to handle harmonic rather than uniform packet weights.
* **Sathe–Selberg transference** to pass from the squarefree Boolean packet model back to integers.
* **Online multiplicative weights or Freedman-type martingale concentration** to globalize the packet strategy over many ranks and windows.

This is structurally different from the exhausted paradigm because the charged object is no longer an individual shield. It is an entire fiber killed by one legal composite.

---

## 4. Rigorous partial result: a packet transversal-capture lemma

Here is a clean theorem in the ideal squarefree packet model. It already defeats the packet-star obstruction that breaks the Carleson-style approaches.

Let

[
P
]

be a set of

[
K=h+L
]

prime atoms, with

[
0<L\le h/4.
]

Think of (L=h/\log h). Let

[
B_1,\dots,B_s\in\binom{P}{h}
]

be Prolonger blockers, and put

[
C_i=P\setminus B_i,
\qquad |C_i|=L.
]

A quotient (Q\subseteq P) is not killed by the Prolonger blockers exactly when

[
Q\cap C_i\neq\varnothing
\quad\text{for every }i.
]

So (Q) is a transversal of the complement hypergraph ({C_i}).

**Lemma.**
Assume

[
1\le s\le \exp(cL)
]

for a sufficiently small absolute constant (c>0). Then there exists a transversal (Q\subseteq P) such that

[
|Q|
\le
8,\frac{K}{L}\log(2s),
]

and the fraction of rank-(h) packet facets containing (Q) satisfies

[
\frac{\binom{K-|Q|}{h-|Q|}}{\binom Kh}
\ge
(2s)^{-C}
]

for an absolute constant (C).

In particular, for (L=h/\log h),

[
|Q|=O(\log h\cdot \log(2s)),
]

and claiming the composite corresponding to (Q) removes a polynomial-in-(s) fraction of the whole packet family.

**Proof.**
Choose each element of (P) independently with probability

[
p=\frac{2\log(2s)}{L}.
]

For a fixed blocker complement (C_i),

[
\Pr(Q\cap C_i=\varnothing)
=(1-p)^L
\le e^{-pL}
=(2s)^{-2}.
]

By the union bound,

[
\Pr(Q\text{ misses some }C_i)
\le s(2s)^{-2}
\le \frac14.
]

Also

[
\mathbb E|Q|=pK.
]

By Markov,

[
\Pr(|Q|>4pK)\le \frac14.
]

Therefore with positive probability (Q) hits every (C_i) and has

[
|Q|\le 4pK
==========

8,\frac{K}{L}\log(2s).
]

Now put (q=|Q|). If (s\le \exp(cL)) with (c) small enough, then (q\le h/2). The fraction of (h)-sets containing (Q) is

[
\frac{\binom{K-q}{h-q}}{\binom Kh}
==================================

# \frac{(h)_q}{(K)_q}

\prod_{j=0}^{q-1}
\left(1-\frac{L}{K-j}\right).
]

Since (q\le h/2) and (K=h+L\le 5h/4), we have (K-j\ge h/2). Using (\log(1-x)\ge -2x) for (x\le 1/2),

[
\log\left(\frac{(h)_q}{(K)*q}\right)
\ge
-2L\sum*{j=0}^{q-1}\frac1{K-j}
\ge
-4Lq/h.
]

Substituting

[
q\le 8(K/L)\log(2s)
]

gives

[
\log\left(\frac{(h)_q}{(K)_q}\right)
\ge
-C\log(2s),
]

and therefore

[
\frac{\binom{K-q}{h-q}}{\binom Kh}
\ge
(2s)^{-C}.
]

That proves the lemma.

This is a small result, but it is exactly aimed at the structural failure.

In the old proof, a packet with

[
K=h+h/\log h
]

contains

[
\binom{K}{h}
============

\exp(o(h))
]

many facets, and local incidence accounting can be off by an exponential factor. The lemma says that after (s) Prolonger blockers, there is still a legal composite quotient of size only

[
O(\log h\log s)
]

whose upper fiber captures a polynomial fraction of the packet. Thus the packet multiplicity is not an unpaid liability; it is a large fiber for Shortener to attack.

This is the key difference.

---

## 5. Why this avoids the listed obstruction patterns

The old obstruction is:

[
\text{many shields} \longrightarrow \text{one activator} \longrightarrow \text{unpayable local charge}.
]

The transversal method reverses the implication:

[
\text{many shields sharing packet structure}
\longrightarrow
\text{large common quotient fiber}
\longrightarrow
\text{one composite Shortener move}.
]

So the same high-codegree structure that destroys (F_{\text{useful}}) becomes the reason a legal composite quotient should exist.

Here is how the specific failures are reinterpreted.

**Local stars and burst-stars.**
A star means many facets share a large common environment. In the packet model, that means the complement blockers (C_i) are small. Small complements have small transversals. A composite transversal kills the whole fiber at once.

**Matching-stars and packet traps.**
The Carleson-style budget tries to pay for (\exp(o(h))) many (h)-subsets individually. The transversal lemma pays only for a hitting set (Q) of size (O(\log h\log s)), then removes all (h)-subsets containing (Q).

**Common-core pre-sterilization.**
Freshness definitions fail because a common core can be sterilized in advance. In the new language, pre-sterilization simply adds blockers (B_i). The response is not to ask whether a shield is fresh; it is to find a quotient (Q) hitting all complements (P\setminus B_i). Staleness is absorbed into the blocker hypergraph.

**Endpoint-incidence failure.**
The edge ({7,13}) having positive mass while (7) and (13) have zero legal support is not a pathology. It says the right object is an edge, not its endpoints. More generally, the right object is a legal quotient hyperedge (Q).

**Cross-activator composite quotients.**
The example where (15=3\cdot 5) has positive limiting degree is precisely a case where Shortener should claim (15), not try to charge its mass to prime endpoints. A fiber-transversal strategy treats this as a large removable fiber.

Thus the method is not a repackaging of (F_{\text{useful}}). It changes the unit of play from “shield event” to “legal quotient fiber.”

---

## 6. What remains genuinely hard

The partial lemma deliberately ignores two complications. These are the real remaining problems.

First, previous Shortener moves impose forbidden down-sets. In subset language, a new quotient (Q) is illegal if it contains a previously claimed Shortener quotient (D). The residual family already avoids (D), but the transversal (Q) produced by the simple random argument might contain (D), in which case it has no useful residual fiber.

So the true lemma needed is a **forbidden-transversal lemma**:

Given Prolonger blockers (B_i) and prior Shortener blockers (D_j), find a set (Q) such that

[
Q\cap(P\setminus B_i)\neq\varnothing
\quad\forall i,
]

but

[
D_j\nsubseteq Q
\quad\forall j,
]

and such that (Q) is contained in large residual packet mass.

This is a concrete, named sub-question. It is not addressed by the current paradigm.

Second, the packet measure is not exactly uniform. Harmonic weights vary across dyadic windows, and the true Sathe–Selberg model has Euler-factor biases. The corresponding weighted theorem should use entropy or weighted (\varepsilon)-net machinery. The target weighted statement is:

[
\mu_P(\mathcal A)
\le
(s+2)^C
\max_{Q\in\mathcal L(S)}
\mu_P(\mathcal A_Q)
+
\operatorname{Err}_{\le 3},
]

where (\mathcal L(S)) is the legal quotient family in the current state.

This is the missing foundational ingredient.

---

## 7. What this says about (\sigma^\star)

I would not regard (\sigma^\star) as the right strategy class for an (r_1)-scale upper bound.

The issue is not merely that (\sigma^\star) sometimes claims composites. The issue is that its definition gives the analyst the wrong certificate. It maximizes unresolved harmonic degree, but the proof needs a certificate saying:

[
\text{this legal quotient is a transversal of all current Prolonger blockers and captures a large fiber.}
]

A better strategy is something like:

[
\sigma_{\mathrm{tr}}(S)
=======================

\arg\max_{Q\text{ legal}}
\sum_{h,P} \lambda_{h,P}
\mu_{h,P}{A:Q\subseteq A},
]

possibly with a penalty depending on (|Q|), for example

[
\exp!\left(c|Q|/\log h\right).
]

A randomized version would sample a packet by mass, sample a small transversal (Q) of the blocker complements, and then use conditional expectation to derandomize. The analysis would use online set cover, entropy, and martingale concentration, not the scalar harmonic domination of (\sigma^\star).

So the likely wrong component is not “state inequalities” in the broad sense. It is the combination

[
\text{R35 local replacement inequality}
+
\text{local useful-shield score}
+
\sigma^\star\text{ harmonic-degree dynamics}.
]

---

## 8. Relation to rank-4 lower bounds

The same diagnosis also explains why pushing the lower bound from rank (3) to rank (4) is nontrivial.

Rank (4) objects have large pair shadows. In the Boolean packet model, for any family

[
\mathcal A\subseteq\binom{P}{h},
]

there is a pair (e\subset P) contained in at least

[
\frac{\binom h2}{\binom K2}|\mathcal A|
]

members of (\mathcal A). When

[
K=h+h/\log h,
]

this ratio is

[
\left(\frac{h}{K}\right)^2
==========================

# \left(1+\frac1{\log h}\right)^{-2}

1-O(1/\log h).
]

So unless Prolonger has already made all high-degree pairs illegal, one legal semiprime claim kills almost the whole packet. A rank-4 lower-bound improvement would therefore need to construct states where the relevant pair shadow is sterilized while all composite-transversal responses are still controlled. That is much stronger than the current rank-3 Maker-first capture.

In other words, the obstruction to a rank-4 lower bound is the same object: legal quotient transversals.

---

## 9. Bottom line

The current paradigm is blocked at (r_2) because it insists on local shield accounting. The residual

[
N_h/\log h
]

is not evidence for a true game length of order (r_2); it is the cost of not having a global legal-transversal inequality.

A genuinely different upper-bound route should replace (F_{\text{useful}}) by a blocker-hypergraph/fiber certificate:

[
\text{Prolonger blockers}
\longrightarrow
\text{small legal composite transversal}
\longrightarrow
\text{large captured packet fiber}.
]

The rigorous packet lemma above shows that, in the clean model, this mechanism kills exactly the dense-packet and star configurations that defeat the old approach. The next decisive mathematical target is the weighted forbidden-transversal theorem with prior Shortener blockers included. If that theorem is true at polynomial-in-(h) loss, then the (N_h/\log h) residual should disappear, and an (r_1)-scale upper bound becomes structurally plausible.
