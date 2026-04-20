---
id: R49-pro-3-blocker-duality-paradigm
type: research
date: 2026-04-19
intent: >
  Provide a paradigm-level diagnosis of why the state-inequality approach
  is exhausted and propose the blocker-duality paradigm as an alternative.
predecessors: [R49-pro-2-sq-r-local-obstruction]
action:
  kind: standalone
claim: >
  Blocker-duality paradigm diagnosis: proofs fail because they measure
  local closure mass against scalar harmonic removal mass, and one legal
  activator creates many locally-chargeable shields per Shortener move.
  The correct dual object is legal Shortener composites as minimal
  transversals of complements of Prolonger's prior moves. Blocker-duality
  reframes the accounting around transversals, not primes.
---

Here is my diagnosis: the exhausted proofs are not failing because the “useful shield” definition has not yet been clever enough. They are failing because they measure the wrong dual object.

The current paradigm charges **local closure mass** to **scalar harmonic removal mass**. Prolonger’s counter-configurations exploit exactly the gap between those two quantities: one legal activator can create many locally chargeable shields, while the Shortener move that should pay for them has only one unit of harmonic budget. The missing operation is not another locality or freshness filter; it is **dualization of legality**. Legal Shortener composites are not generated prime-by-prime. They are minimal transversals of the complements of Prolonger’s previous moves.

That observation changes the problem’s natural language from “which shields are useful?” to “what is the blocker clutter of the current Prolonger history?”

---

**1. Negative structural theorem for the exhausted paradigm**

Let me formalize the obstruction first.

Consider any proof in the following class. For each central rank (h), it proves an inequality of the form

[
\mu(\operatorname{Cl}_h)
\le a_h,\mu(F_h)+R_h,
]

where (F_h) is some class of “useful” shields, (a_h\ge 0), and the dynamic part of the proof supplies a nonnegative upper bound for (\mu(F_h)), usually through (\sigma^\star) and online harmonic domination. Suppose the state inequality retains the R35-type residual

[
R_h \gtrsim \frac{N_h}{\log h}
]

on the central ranks.

Then this proof class cannot certify any bound below

[
\sum_{h\sim \log\log n} \frac{N_h}{\log h}
\asymp \frac{n}{\log\log\log n}.
]

In particular it cannot certify

[
L(n)\ll \frac{n(\log\log n)^2}{\log n}.
]

Indeed,

[
\frac{n/\log\log\log n}
{n(\log\log n)^2/\log n}
========================

\frac{\log n}
{(\log\log n)^2\log\log\log n}
\to \infty.
]

So even the idealized dynamic estimate

[
\mu(F_h)=0
]

would still leave the (r_2(n)=n/\log\log\log n) floor. This proves that replacing (\sigma^\star), strengthening freshness, or changing the definition of (F_{\text{useful}}) cannot reach (r_1) as long as the proof still uses the same residual state inequality.

This is a proof-theoretic obstruction, not a lower bound on (L(n)). It says:

[
\boxed{
\text{The R35 residual is not a game-theoretic force; it is a certificate-theoretic loss.}
}
]

So the blocked component is not primarily (\sigma^\star). The blocked component is the **local-facet state certificate**. A genuinely different state inequality could have a smaller residual, but it cannot be a refinement of the present useful-shield charging argument. It must measure a different object.

---

**2. The object the current paradigm misses: legal blockers**

Work inside a squarefree prime packet. Let (P) be a set of primes, (|P|=K). A top candidate is represented by an (h)-subset

[
S\subseteq P,
]

and a lower divisor by a subset

[
T\subseteq P.
]

Divisibility is simply subset containment: (T\mid S) iff (T\subseteq S).

Suppose Prolonger has previously played top sets

[
S_1,\dots,S_t.
]

Write their complements as

[
C_i=P\setminus S_i.
]

A Shortener move (T) is legal relative to those Prolonger moves exactly when

[
T\nsubseteq S_i
\quad\text{for every }i,
]

equivalently

[
T\cap C_i\ne\varnothing
\quad\text{for every }i.
]

Thus legal Shortener composites are precisely **transversals** of the complement family

[
\mathcal C={C_1,\dots,C_t}.
]

The minimal legal composites are the blocker clutter

[
b(\mathcal C)
=============

\min{T\subseteq P:T\cap C\ne\varnothing
\text{ for all }C\in\mathcal C}.
]

This immediately explains the (91=7\cdot 13) phenomenon. If (7) is illegal because it lies inside one previous Prolonger move, and (13) is illegal because it lies inside another, the pair ({7,13}) can still be legal because it hits both corresponding complements. It is not an anomaly. It is a minimal transversal.

That is the structural mistake in the (\sigma^\star)-centered analysis: it treats legal composites as opaque exceptions, while the natural dual object makes them primary.

---

**3. Exact blocker lemma**

Here is the key finite statement.

Let (\mathcal C\subseteq 2^P) be a clutter, meaning no member contains another. Its blocker is

[
b(\mathcal C)
=============

\min{T:T\cap C\ne\varnothing
\text{ for all }C\in\mathcal C}.
]

Then

[
b(b(\mathcal C))=\mathcal C.
]

Proof. Every (C\in\mathcal C) intersects every transversal (T\in b(\mathcal C)), so (\mathcal C\subseteq b(b(\mathcal C))).

Conversely, suppose (A\subseteq P) contains no member of (\mathcal C). Then for every (C\in\mathcal C), some element of (C) lies outside (A). Hence (P\setminus A) is a transversal of (\mathcal C), and therefore contains some minimal transversal (T\in b(\mathcal C)). This (T) is disjoint from (A). So (A) does not hit every member of (b(\mathcal C)), and therefore (A\notin b(b(\mathcal C))). Thus the minimal sets hitting all blockers are exactly the original clutter members.

Now translate this back to the packet game.

If Prolonger’s previous top complements are (\mathcal C), and Shortener has claimed every minimal legal composite (T\in b(\mathcal C)), then a future top complement (C') is legal only if

[
C'\cap T\ne\varnothing
\quad\text{for every }T\in b(\mathcal C).
]

By blocker duality, every minimal such (C') is one of the already played (C_i). If all (C_i) have the same size, then among same-rank top candidates the only survivors are the already played ones. So, in the batched packet model,

[
\boxed{
\text{claiming the blocker closes the packet with no }N_h/\log h\text{ residual.}
}
]

This is not yet an online proof for the original game, because Shortener cannot claim all blockers at once and must respect previous Shortener moves. But it proves something important: the R35 residual is not forced by packet geometry. It appears because the proof is charging local replacement facets instead of dualizing the legal-move relation.

---

**4. Why this bypasses the listed obstruction patterns**

The state-inequality paradigm sees a burst-star as follows:

[
\text{one Prolonger activator}
\quad\leadsto\quad
M\text{ newly useful shields},
]

and then tries to charge (M) objects to one unit of online Shortener budget. That is exactly where the (\log h), (h/(\log h)^2), or (e^h) losses enter.

The blocker view sees the same event differently. The activator adds one complement (C) to a clutter. The legal Shortener responses are updated by taking minimal transversals of

[
\mathcal C\cup{C}.
]

There is no multiplicity (M) attached to the number of local facets first-hit by the activator. Shared cofaces are quotient out automatically by minimalization.

More explicitly, if (B\in b(\mathcal C)), then after adding a new complement (C), a transversal of the enlarged family is either:

[
B \quad\text{if }B\cap C\ne\varnothing,
]

or

[
B\cup{x},\qquad x\in C,
]

if (B\cap C=\varnothing), followed by inclusion-minimal reduction. Therefore the blocker update is controlled by the complement size (|C|), not by the number of shields made useful by the activator.

That is the explicit decision point where the new method changes the outcome:

[
\boxed{
\text{replace “charge every first-hit facet” by “minimalize the transversal clutter.”}
}
]

The cross-activator composite obstruction also disappears conceptually. In the old proof, ({7}) and ({13}) have zero legal support, so the edge ({7,13}) looks unbudgetable. In the blocker proof, ({7,13}) is exactly the minimal transversal that should be claimed. No endpoint-incidence coefficient is demanded.

---

**5. A concrete partial result: packet separator lemma**

The blocker language also gives a simple rigorous separator result in the packet model.

Let (|P|=K), and let top candidates be (h)-subsets (S\subseteq P). Write

[
s=K-h.
]

So a top move corresponds to an (s)-set complement (C=P\setminus S).

Suppose Prolonger has played (t) top candidates with complements

[
C_1,\dots,C_t\in \binom{P}{s}.
]

Choose one element (x_i\in C_i) for each (i), and let

[
T={x_1,\dots,x_t}.
]

After removing repetitions, (|T|\le t), and (T\cap C_i\ne\varnothing) for every (i). Therefore (T) is a legal Shortener composite relative to those previous top moves. If desired, replace (T) by a minimal subset (T'\subseteq T) that still hits all (C_i); then (T'\in b(\mathcal C)), remains legal, and blocks at least as many future top candidates.

A future top candidate (S=P\setminus C) is blocked by (T) exactly when

[
T\subseteq S,
]

equivalently

[
C\cap T=\varnothing.
]

The number of (s)-set complements disjoint from (T) is

[
\binom{K-|T|}{s}
\ge
\binom{K-t}{s}.
]

Therefore a legal composite of rank at most (t) blocks at least the fraction

[
\frac{\binom{K-t}{s}}{\binom{K}{s}}
]

of the entire packet.

Now take the packet-trap scale

[
K=h+\frac{h}{\log h},
\qquad
s=\frac{h}{\log h}.
]

Then

[
\frac{K}{s}\sim \log h.
]

For

[
t=\left\lfloor \frac Ks\right\rfloor\sim \log h,
]

we have

[
\frac{\binom{K-t}{s}}{\binom{K}{s}}
===================================

\exp(-1+o(1)).
]

Thus, after only (O(\log h)) Prolonger packet activations, there exists a legal composite of rank (O(\log h)) that blocks a positive constant fraction of the packet.

This does not solve the online original game, because earlier Shortener moves and non-packet comparabilities must be folded in. But it is already enough to show that the packet trap is not inherently an (e^h)-loss phenomenon. It becomes one only when the proof insists on paying for local incidences rather than using legal transversals.

---

**6. Proposed new methodological direction**

The approach I would pursue is:

[
\boxed{
\text{weighted online blocker duality + entropy separators.}
}
]

The Shortener strategy should not be (\sigma^\star). It should be a **relative-blocker entropy strategy**.

At a state, form the residual family (\mathcal H_t) of still-playable top fibers, represented by complements (C). Let (\mathcal C_t) be the family of Prolonger complements already played in the relevant packet, and let (\mathcal T_t) be Shortener’s already claimed divisors.

A legal new Shortener divisor should be treated as a relative minimal transversal:

[
T\in b_{\mathcal T_t}(\mathcal C_t),
]

meaning (T) hits every (C\in\mathcal C_t), is not made redundant by an older Shortener claim, and is inclusion-minimal under those constraints.

Then choose (T) to maximize entropy deletion:

[
\Delta_t(T)
===========

\pi_t{C\in\mathcal H_t:C\cap T=\varnothing},
]

where (\pi_t) is a max-entropy or Sathe-Selberg-weighted probability measure on the residual top family.

The target theorem would be a legal separator theorem of the following form.

For central rank (h), outside the genuine low-rank exceptional family responsible for the known rank-3 lower bound, either

[
\mathcal H_t
]

has small entropy/weighted mass already, or there exists a legal relative blocker (T) of controlled rank, say initially

[
|T|=O(\log h)
]

in packet regimes, such that

[
\pi_t(C\cap T=\varnothing)
\ge \eta(h)
]

for an explicit (\eta(h)) strong enough that repeated entropy decrements give total contribution (O(r_1(n))).

The tools I would use are specific:

1. **Blocker duality for clutters** to represent legal composites exactly.

2. **LP duality and online set cover / multiplicative weights** to choose Shortener moves by entropy deletion rather than harmonic degree.

3. **Biased-measure extremal set theory**, especially (p)-biased Erdős–Ko–Rado type theorems, Ahlswede–Khachatrian complete-intersection structure, and junta theorems, to classify the obstruction when no legal blocker deletes significant mass.

4. **Friedgut–Kalai / KKL-style influence methods** to show that if every legal blocker has small deletion, then the residual family is controlled by a small set of prime coordinates; that is exactly the kind of low-dimensional structure a blocker strategy can attack directly.

5. **Sathe-Selberg Euler-factor independence** to transfer the prime-coordinate argument back to central-rank integer weights. The supplied Bernoulli limit (\Pr(p\mid m)\to 1/(p+1)) is precisely the input needed for a biased-product-measure argument.

6. **Freedman or self-normalized martingale concentration** to convert randomized entropy choices into a deterministic Shortener strategy by conditional expectation.

This is structurally different from the exhausted paradigm because the proof would not try to bound

[
\mu(F_{\text{useful}})
]

at all. It would try to prove that every high-entropy residual family admits a legal composite separator, and if it does not, then extremal set theory forces it into a low-dimensional junta whose total number-theoretic mass is already at the (r_1)-scale or below.

---

**7. What this says about (\sigma^\star)**

The max-unresolved-harmonic-degree strategy (\sigma^\star) is optimizing the wrong local functional. It may be locally natural, and it may often pick the same composite an entropy strategy would pick, but it has no reason to preserve the blocker certificate.

The (91=7\cdot 13) example is the diagnostic. A prime-based analysis asks why neither endpoint can pay for the edge. The blocker analysis says the edge is the legal object; the endpoints are irrelevant.

So I would not try to prove (\sigma^\star) optimal. I would replace it with:

[
\text{claim a relative minimal transversal maximizing residual entropy deletion.}
]

This may choose a move of smaller harmonic degree than (\sigma^\star), but with a stronger global invariant.

---

**8. What remains genuinely hard**

The hard theorem is now cleanly identifiable:

[
\boxed{
\text{Weighted legal-separator theorem for divisor clutters.}
}
]

A usable version would say that, under the Sathe-Selberg central-rank measure, any residual family with mass above the (r_1)-scale has a legal relative blocker whose deletion mass is large enough to support an entropy-decrement argument.

If that theorem is true, the (N_h/\log h) residual can be beaten without contradicting any of the listed failures, because those failures exploit multiplicity of local shield incidences, not blocker entropy.

If that theorem is false, its counterexample would be more valuable than another failed shield proof: it would produce a high-mass residual family whose every legal blocker has small deletion. That would be the right candidate for either a stronger lower bound or evidence for an (r_2)-type rate.

---

My bottom-line diagnosis is therefore:

[
\boxed{
\text{The exhausted paradigm is blocked at the state-certificate level, not merely at the dynamic-strategy level.}
}
]

The missing foundational ingredient is an **online weighted blocker-duality theorem** for the divisibility clutter. The first rigorous foothold is the exact blocker reduction above: in the packet quotient, legal composites are precisely minimal transversals, and claiming the blocker closes the packet with no R35 residual. That is the point where a genuinely different proof can avoid the burst-star, packet-trap, and cross-activator obstructions simultaneously.
