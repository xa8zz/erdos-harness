---
id: R44-verify-pro-1-sflu-e-audit
type: verification
date: 2026-04-19
intent: >
  Audit the SFLU-E (Strongly Fresh, Locally Useful - Estimate) claim —
  nu_h(E_{k,theta}^{sf,loc}) bounded via lifted harmonic measure and
  first-activation thinning — to determine whether it closes L(n) = o(n).
predecessors: [R44-pro-1-followup-sflu-e]
action:
  kind: refutes
  target: R44-pro-1-followup-sflu-e
claim: >
  The SFLU-E proof does not rigorously close L(n) = o(n). Step (3)
  first-activation thinning is not a consequence of sigma-star but an extra
  disjointness assumption; Step (1) density-increment extraction is
  underdefined and possibly circular; "strong freshness" is used in mutually
  incompatible ways; and the final closure loses exactly the factor needed
  to reach n / log log log n.
failure_mechanism: >
  The static-to-dynamic bridge fails. The lifted-measure bound
  nu_h(D) <= theta^{-1} (k/h)^s nu_h(C(D)) is stated for one shield, but the
  proof silently upgrades to a family sum by asserting
  sum_D nu_h(C(D)) <= sum_t mu(u_t) <= N_h. The sigma-star online domination
  only gives sum_t mu_t(u_t) <= N_h (dynamic unresolved mass), not a bound
  on the static sum of certificate shadows. Multiple shields D_1, D_2, ...
  can share the same extracted coface C(D_1) = C(D_2) = C before sigma-star
  resolves C; marking shadows "stale for accounting" does not make them
  disappear from the actual game. Inserting even the advertised exceptional
  bound (log h / h) N_h into the R35 state inequality
  mu(Cl_h) << L mu(F_useful) + N_h / log L with L = h / log h gives a full
  rank-scale term L (log h / h) N_h = N_h, not the needed N_h / log h, so
  rank-summation loss is not eliminated and the displayed bounds leave a
  linear-scale residue at central rank h ~ log log n.
implications:
  - Any salvaged SFLU-E needs an explicit dynamic no-recycling / injective charging lemma for certificate shadows.
  - "Strong freshness" must be pinned down to a single definition consistent across (a) blocking common-core, (b) using R35 state inequality, (c) charging to sigma-star, (d) getting disjoint shadows.
  - Defect-one coface C(D) needs a certificate-legality lemma — static rank is not dynamic Shortener-legality.
confidence_at_time: high
---

**Verdict:** the claimed proof does **not** rigorously close (L(n)=o(n)). The fatal break is Step (3): the “first-activation thinning” is not a consequence of (\sigma^\star); it is an extra disjointness assumption. Step (1) is also underdefined enough to be circular, the “strong freshness” notion is used inconsistently, and the final (R35) closure loses exactly the factor one would need to get (n/\log\log\log n).

The cleanest failure mechanism is this:

[
\nu_h(D)\lesssim \theta^{-1}\Big(\frac{k}{h}\Big)^s \nu_h(C(D))
]

may be true **for one shield** if the density-increment coface exists. But the proof then silently upgrades this to a **family bound** by asserting

[
\sum_D \nu_h(C(D))\le \sum_t \mu(u_t)\le N_h.
]

That upgrade is not justified. Multiple different (D)’s can have the same certificate coface (C(D)), or heavily overlapping certificate shadows, before Shortener has played that coface. Marking the certificate shadow “stale for accounting” after its first appearance does not make later shield shadows disappear from the actual game.

---

### 1. Step (3): first-activation thinning is the main gap

The established online domination statement is dynamic:

[
\sum_t \mu_t(u_t)\le N_h,
]

where (\mu_t(u_t)) is the unresolved harmonic shadow killed by the Shortener move (u_t) at time (t). It does **not** automatically bound a static sum of certificate shadows

[
\sum_D \nu_h(C(D)).
]

To get the displayed inequality, the proof would need something like the following lemma:

For every charged exceptional activation (D_t), there is a portion (X_t\subseteq \operatorname{Sh}^{\mathrm{loc}}_h(C(D_t))) such that

[
\nu_h(D_t)
\lesssim
\theta^{-1}\Big(\frac{k}{h}\Big)^{s(k)}\mu(X_t),
]

the sets (X_t) are disjoint, and each (X_t) is contained in the newly killed shadow of the actual Shortener move (u_t).

No such lemma is proved. The response only asserts it.

In particular, yes: Prolonger can, under the stated proof, activate several exceptional shields

[
D_1,D_2,\ldots
]

with the same extracted coface

[
C(D_1)=C(D_2)=\cdots=C
]

before (\sigma^\star) resolves (C), unless “strong freshness” is redefined to forbid this by fiat. The certificate shadows then coincide. They are not disjoint in any game-theoretic sense.

The max-unresolved-harmonic-degree rule does not fix this. At most, if (C(D_t)) is a legal unresolved candidate at time (t), then

[
\mu_t(C(D_t))\le \mu_t(u_t),
]

because (\sigma^\star) picks a maximum-degree legal move. But that is only a comparison of **dynamic unresolved mass** at that time. It does not imply

[
\nu_h(C(D_t))\le \mu_t(u_t),
]

because (\nu_h(C(D_t))) is the full static lifted shadow, including portions possibly already stale. It also does not permit charging several certificates at the same time to one (u_t), nor repeatedly charging the same static (C)-shadow across different times.

So the inequality

[
\sum_{D\in\mathcal E_{k,\theta}^{\mathrm{sf,loc}}}\nu_h(C(D))
\ll
\sum_t \mu(u_t)
]

does not follow from (\sigma^\star). It would follow only under an additional disjointness/injective-charging lemma, or in the much stronger special case where the actual Shortener move satisfies

[
u_t=C(D_t)
]

for each charged activation and the charged shadow is exactly newly killed. The proof gives neither.

The phrase “first-activation thinning” is therefore doing real mathematical work. It is not a harmless bookkeeping choice. If the thinning deletes later (D)’s whose certificate shadow was already charged, then it no longer bounds the original exceptional family. Later (D)’s may have large shield shadows outside the already charged certificate shadow.

That is the static-to-dynamic bridge failure.

---

### 2. Step (1): density-increment extraction is underdefined and possibly circular

The proof never gives a precise definition of

[
\mathcal E_{k,\theta}^{\mathrm{sf,loc}}.
]

The implicit definition seems to be:

[
\mathcal E_{k,\theta}^{\mathrm{sf,loc}}
=======================================

{\text{locally useful, strongly fresh, defect-}k\text{ shields whose residual section is dense but low-dimensional}}.
]

But “low-dimensional” is not a mathematical condition unless it is quantified.

The claimed extraction is:

[
D\in\mathcal E_{k,\theta}^{\mathrm{sf,loc}}
\implies
\exists C(D)=D\cup Q,\quad |Q|=s(k),
]

such that

[
\mu(\operatorname{Sh}^{\mathrm{loc}}_h(C(D)))
\ge
c\theta,
\mu(\operatorname{Sh}^{\mathrm{loc}}_h(D)).
\tag{1}
]

This is a very strong fiber-concentration statement. It is not implied merely by saying that the residual section is “not genuinely (k)-dimensional.” A low-dimensional or degenerate section can be spread across many low-dimensional fibers with no single (s(k))-coface carrying (c\theta) of the mass.

So there are only two possibilities.

If (\mathcal E) is **defined** to consist of shields for which such a coface (C(D)) exists, then Step (1) is tautological and the real burden moves to proving that the exceptional class from the dense-packet projection is contained in this newly defined class. That containment is not proved.

If (\mathcal E) is the exceptional class already appearing in the sharpened dense-packet projection, then the proof needs a genuine density-increment lemma showing that every such exceptional shield has a fresh local coface satisfying (1). That lemma is absent.

There is also a boundary issue. For

[
k\approx C h/\log h,
\qquad
s(k)=L_0=\lfloor h/\log h\rfloor,
]

the extraction asks for (L_0) fresh local coordinates with a large conditional shadow. A product-like dense section of density (\theta\sim 1/\log h) would typically have all (L_0)-fibers exponentially small. To force a (c\theta)-large fiber, one needs a quantified entropy/thickness dichotomy, not the phrase “low-dimensional.”

At (k=2), the choice (s(k)=1) leaves a defect-one coface. The response says this is “a legal lower shield,” but that is not automatic. Defect-one is a static rank condition; Shortener-legality is a dynamic game condition. A defect-one coface can be illegal if it divides a previous Prolonger move or is otherwise already sterilized. Thus the proof needs a **fresh certificate extraction** lemma: not merely a coface (C(D)), but a coface that is legal and has essentially full unresolved shadow at the activation time.

That is not established.

---

### 3. “Strong freshness” is used in mutually incompatible ways

The response says strong freshness blocks the common-core construction because “the large common core has already been pre-sterilized.”

But in the listed common-core obstruction, the pre-sterilization of (R) is caused by a **Prolonger scored move**

[
F_0=bA_{R\cup T_0},
]

not by a Shortener pre-kill.

So the proof depends critically on what “strongly fresh” means.

If strong freshness means:

[
\text{no prior Shortener subset-claim kills the shield,}
]

then the common-core construction is not excluded. The proof’s claim is false, because the obstruction is Prolonger-stale, not Shortener-stale.

If strong freshness means:

[
\text{no relevant subset has been killed or sterilized by any earlier move, including Prolonger scores,}
]

then the common-core construction may be excluded, but the established (R35) state inequality cannot simply be reused. The obstruction list already flags this exact failure: excluding Prolonger-stale events from “useful” breaks the state-inequality charging, because Prolonger-stale events cannot be charged to Shortener’s online domination

[
\sum_t \mu(u_t)\le N_h.
]

The proof needs a new state inequality under this stricter freshness notion. It does not provide one.

A third possible meaning is certificate-freshness:

[
C(D)\text{ is a legal unresolved Shortener candidate at the activation time.}
]

That might be enough for a one-step max-degree comparison

[
\mu_t(C(D))\le \mu_t(u_t),
]

but it still does not imply charged-shadow disjointness, and it does not necessarily block the common-core construction unless the extracted (C(D)) is forced to lie inside the Prolonger-sterilized core.

So the proof uses “strong freshness” to mean different things in different places:

[
\begin{array}{c|c}
\text{Needed use} & \text{Required meaning} \
\hline
\text{Block common-core} & \text{exclude Prolonger-stale shields} \
\text{Use existing }R35\text{ state inequality} & \text{do not exclude Prolonger-stale events without new charging} \
\text{Charge to }\sigma^\star & \text{certificate coface is legal and dynamically unresolved} \
\text{Get disjoint shadows} & \text{much stronger first-activation/injective charging lemma}
\end{array}
]

No single stated definition supports all four uses.

---

### 4. The final closure does not follow from the displayed bounds

The claimed exceptional estimate is

[
\nu_h(\mathcal E_{k,1/\log h}^{\mathrm{sf,loc}})
\ll
\log h
\left(\frac{Ck}{h}\right)^{s(k)}
N_h.
]

The arithmetic of the exceptional sum is not the main issue. Using the exact exponential factor, the (k=2) term dominates and gives

[
\sum_{k\le C h/\log h}
\nu_h(\mathcal E_{k,1/\log h}^{\mathrm{sf,loc}})
\ll
\frac{\log h}{h}N_h.
]

But inserting a bound of this scale into the (R35) state inequality does not close.

Recall

[
\mu(\operatorname{Cl}*h)
\ll
L,\mu(F*{\mathrm{useful}})
+
\frac{N_h}{\log L},
\qquad
L=\frac{h}{\log h}.
]

To get the advertised rank-level scale

[
\mu(\operatorname{Cl}_h)
\ll
\frac{N_h}{\log L}
\sim
\frac{N_h}{\log h},
]

one would need

[
\mu(F_{\mathrm{useful}})
\ll
\frac{N_h}{L\log L}
\sim
\frac{N_h}{h}.
]

But the new exceptional estimate is only

[
\frac{\log h}{h}N_h
===================

\frac{N_h}{L}.
]

Multiplying by (L=h/\log h) gives

[
L\cdot \frac{\log h}{h}N_h
==========================

N_h.
]

That is a full rank-scale term, not an (N_h/\log h) term. Thus the (k=2) exceptional residue is not harmless under the displayed (R35) inequality. Calling it “rank-two scale” does not remove the (L)-multiplication in the state inequality.

Even granting the new exceptional estimate, the proof still has not shown

[
\mu(F_{\mathrm{useful}})
\ll
\frac{N_h}{h}
]

or even

[
\mu(F_{\mathrm{useful}})
=o!\left(\frac{N_h}{L}\right).
]

The non-exceptional dense term also does not automatically translate. The projection estimate gives per (k)

[
\nu_h(\mathcal D_{k,\theta}^{\mathrm{sf,loc}})
\ll
\frac{k^2}{\theta h^2}N_h
+
\text{exceptional}.
]

At (\theta=1/\log h), the first term is

[
\frac{k^2\log h}{h^2}N_h.
]

Naively summing this over

[
2\le k\le C h/\log h
]

gives

[
\frac{\log h}{h^2}N_h
\sum_{k\le C h/\log h} k^2
\asymp
\frac{h}{(\log h)^2}N_h,
]

which is far too large. Perhaps the earlier dense-packet absorption machinery avoids such a naive sum, but that translation is not written here. The response never derives the needed bound on (\mu(F_{\mathrm{useful}})).

Finally, at central rank

[
h\sim \log\log n,
\qquad
\log L\sim \log h\sim \log\log\log n,
]

a per-rank estimate of the form

[
\mu(\operatorname{Cl}_h)\ll \frac{N_h}{\log h}
]

would plausibly sum to

[
O!\left(\frac{n}{\log\log\log n}\right).
]

But the displayed argument leaves a possible

[
\mu(\operatorname{Cl}_h)\ll N_h
]

term from (L\cdot\mu(F_{\mathrm{useful}})). Summing (\sum_h N_h) over the central rank windows is a linear-scale contribution, not (o(n)). So the rank-summation loss has not been eliminated.

---

The proof therefore fails at a real load-bearing point, not a cosmetic one. The normalization by lifted harmonic measure may be the right kind of normalization, but the argument still lacks the dynamic no-recycling lemma needed to pass from individual density-increment certificates to a global online bound. As written, “first-activation thinning” smuggles in exactly the charged-shadow disjointness that must be proved.
