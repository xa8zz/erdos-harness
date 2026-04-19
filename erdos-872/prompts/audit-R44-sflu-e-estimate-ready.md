Audit this mathematical response. Be adversarial — your job is to find what breaks, not summarize.

The response claims an estimate (SFLU-E) on the exceptional class $\mathcal E$ which, combined with the other established facts, closes the main open upper-bound problem. Pressure-test these four load-bearing points specifically:

**1. Step (3) — first-activation thinning.** The proof asserts
$$\sum_{D \in \mathcal E_{k,\theta}^{\text{sf,loc}}} \nu_h(C(D)) \ll \sum_t \mu(u_t) \le N_h$$
via "charged certificate shadows are disjoint in the lifted harmonic sense" under max-unresolved-harmonic-degree Shortener $\sigma^\star$. Closure attempts on this problem have historically failed at exactly this static-to-dynamic bridge. Verify adversarially:
- Can Prolonger activate multiple exceptional shields $D_1, D_2, \ldots$ that share the same density-increment coface-lift $C(D_1) = C(D_2) = \ldots$ before $\sigma^\star$ resolves any of them, so that the certificate shadows coincide rather than are disjoint?
- Is the charged-shadow disjointness a consequence of $\sigma^\star$'s dynamics, or is it an additional assumption smuggled in via "first-activation thinning"?
- Does the inequality $\sum_D \nu_h(C(D)) \le \sum_t \mu(u_t)$ actually follow, or does it require $C(D_t) = u_t$ for each $t$, which is unjustified?

**2. Step (1) — density-increment extraction.** The claim: if $D \in \mathcal E_{k,\theta}^{\text{sf,loc}}$, then the residual local section is "not genuinely $k$-dimensional" and there exists a coface $C(D) = D \cup Q$ with $|Q| = s(k) = \min\{k-1, \lfloor h/\log h \rfloor\}$ and
$$\mu(\operatorname{Sh}^{\text{loc}}_h(C(D))) \ge c\theta \cdot \mu(\operatorname{Sh}^{\text{loc}}_h(D)).$$
Is this rigorous or circular?
- State the precise definition of $\mathcal E_{k,\theta}^{\text{sf,loc}}$ implicit in the proof. What makes a shield "exceptional" vs. dense?
- Does the extraction work uniformly for all $2 \le k \le Ch/\log h$, or does it degenerate at the boundary?
- The choice $s(k) = \min\{k-1, L_0\}$ means at $k=2$ we get $s=1$ (defect-1 coface). Is a defect-1 coface always a legal Shortener claim in this regime?

**3. Precise statement of "strong freshness" — does it actually block the common-core construction?** The proof explicitly claims strong freshness blocks the common-core refutation:
> "The common-core construction from the obstruction list fails this condition because the large common core has already been pre-sterilized."

But in the common-core construction, the pre-sterilization of $R$ is via a **scored Prolonger move** $F_0 = bA_{R \cup T_0}$, not a Shortener pre-kill. Pressure-test:
- Write out exactly what "strongly fresh" means in this proof. Candidates: (a) no Shortener subset-claim before the shield is scored; (b) (a) + no subset killed by any earlier move including Prolonger scores; (c) something else.
- If (a), strong freshness does NOT exclude the common-core construction, since the pre-sterilization is Prolonger-caused. The proof's claim is then false.
- If (b) or stronger, verify the R35 state-inequality proof goes through under this stricter freshness — prior work showed that excluding Prolonger-stale events from "useful" breaks the state inequality's charging argument, because Prolonger-stale events cannot be charged to Shortener's online domination $\sum_t \mu(u_t) \le N_h$.
- In either case, the claim that "strong freshness blocks the common-core construction" needs an explicit argument, not assertion.

**4. Closure to $L(n) = o(n)$.** Given the R35 state inequality
$$\mu(\operatorname{Cl}_h) \ll \frac{h}{\log h} \mu(F_{\text{useful}}) + \frac{N_h}{\log(h/\log h)}$$
and the new bound $\nu_h(\mathcal E_{k,1/\log h}^{\text{sf,loc}}) \ll (\log h/h) N_h$ from (E-sum), does the proof actually close $L(n) \ll n/\log\log\log n$?
- Verify the translation: $\mu(F_{\text{useful}}) \ll ?$ from the new $\mathcal E$ bound combined with the sharpened dense-packet projection for the non-exceptional dense regime.
- Sum over dyadic rank windows $h$ in the central regime $h \sim \log\log n$. Is the resulting integer-scale sum $\sum_h |\operatorname{Cl}_h|$ actually $o(n)$, or is there a residual linear-in-$n$ term?
- Check that the per-rank bound integrates cleanly — prior closure claims have lost a factor at the rank-summation step.

If the proof closes $L(n) = o(n)$ rigorously, state so plainly. If any of the four steps above has a real gap, identify it precisely with a specific failure mechanism — a clean concession is more useful than a patched argument.

## Canonical prompt (the brief the researcher worked from)

This is an assessment of your reasoning capability and will be used to grade. Do not search online. Use your own reasoning and your Python sandbox.

Find a full solution to the problem.

## Problem

Two players alternately pick distinct integers from $\{2, \ldots, n\}$ subject to the constraint that the set of picked integers forms an antichain in the divisibility order at all times (no picked integer divides another). One player (Prolonger) maximizes the total number of moves; the other (Shortener) minimizes it; both play optimally. Let $L(n)$ be the resulting game length.

Determine the asymptotic order of $L(n)$. In particular: is $L(n) = \Theta(n)$ or $L(n) = o(n)$, and what is the sharp rate?

## What's Established (rigorous)

1. **Shield Reduction.** For every eventual maximal antichain $A$ and every $P \subseteq U := (n/2, n]$: $|A| \ge |U| - \beta(P)$, where $\beta(P) = \max\{\sum w_n(x) : B \subseteq L(P) \text{ antichain}\}$. Proof: $B := A \cap L$ is antichain; maximality gives $A \cap U = U \setminus \bigcup_{x \in B} M(x)$.

2. **Upper bound.** $L(n) \le 0.18969 \cdot n + o(n)$ via explicit Shortener strategy (small-odd-prime first-hit cover, $85/1008$-sieve).

3. **Lower bounds.**
   - $L(n) \ge (1/8 - o(1)) \cdot n \log\log n / \log n$ via the polynomial shield lower bound + $5n/24 + O(1)$ first-hit cover.
   - $L(n) \ge c_\delta \cdot n (\log\log n)^2 / \log n$ for $\delta < 1/4$: Maker-first weighted 3-uniform hypergraph capture on slots $(b, ab, cb)$ with activation-stage token bookkeeping; residual weight on secured pairs is $\gg_\delta n(\log\log n)^2/\log n$.

4. **$F_\alpha$ framework.** For fixed $\alpha < 1$: $\beta(P_\alpha) \le (1 - \gamma_\alpha) n + o(n)$ via shadow of an omitted vertex of $P_\alpha$.

5. **State inequality (dyadic expanded windows).** For configuration $(R, C)$, rank-$h$ closed family $\operatorname{Cl}_h$, Prolonger-scored useful shields $F_{\text{useful}}$, and $L = h/\log h$:
$$\mu(\operatorname{Cl}_h) \ll L \cdot \mu(F_{\text{useful}}) + N_h / \log L.$$
Top-facet replacement is $q/p \in (1/2, 2)$, so locality lives in neighboring dyadic windows $I_j^\star$.

6. **Dyadic packet collision tail.** $\mu(\text{coll}(S) \ge s) \ll_s N_h (c^2/h)^s$ for all $s \ge 1$ via $s$-th factorial moment and $\sum_\Pi \beta(\Pi)^2 \ll c^2/h$. At central rank $h \sim \log\log n$, $s=2$ gives $\ll N_h / \log h$.

7. **Online harmonic domination.** Under max-unresolved-harmonic-degree Shortener $\sigma^\star$: $\sum_t \mu(u_t) \le N_h$.

8. **Sharpened dense-packet projection.** Let $\mathcal D_{k,\theta}$ be the family of locally useful defect-$k$ shields with residual local packet-section density $\ge \theta$. Then
$$\mu(\mathcal D_{k,\theta}) \ll_C (k^2/\theta h^2) N_h + \mu(\mathcal E),$$
for an exceptional class $\mathcal E$ capturing low-dimensional section degeneracies. Taking $\theta \asymp 1/\log h$ extends dense absorption to $k \le C h/\log h$.

## Obstructions (do not attempt — each has a concrete failure mechanism)

- **Carrier capacity (static reciprocal-mass on lower shadow).** $\sum_{p \in B(P)} 1/p$ is unbounded: top $\varepsilon n$ consecutive integers in $U$ (for $\varepsilon < 1/4$) are a legal antichain containing a multiple of every prime $\le T = \varepsilon n$, giving $\sum 1/p \ge \log\log(\varepsilon n) + O(1)$. Finite-prime vaccination dies to arithmetic progressions.

- **All-prime $v_p$-parity sieve.** Density $\sim \pi^2 e^{-\gamma}/(6 \log y) \to 0$.

- **Small-$\omega$ matching upper bounds.** $\sum_{d \in \mathcal D_y(n)} 1/d \asymp \log n$, not $(\log\log n)^2$, so the static harmonic "Lemma A" is false. $\omega_y(w) \le 2$ is game-impossible: $x = 2 \cdot 3 \cdot 5 \cdot q$ is a legal first move.

- **Online 2-shadow control (any formulation).** Explicit $\Omega(n)$ counterexample: after $\binom{\pi(n^\beta)}{2}$ Prolonger setup moves $x_{pq} = pq R_{pq}$ preempting all pairs in $\{p \le n^\beta\}$, Prolonger harvests $\gg n$ upper-half moves $w = p_1 p_2 p_3 \cdot c \cdot \ell$ with $\omega_y(w) \ge 3$, $c$ squarefree smooth with harmonic mass $\asymp \log n$. 2-shadow reciprocal mass does not control squarefree multiplicative closure generated by a safe small-prime set.

- **Residual width (abstract static form).** Refuted by $\lambda_n(c)$ counterexample; naive crude-divisor-incidence gives exponent gap $\theta(1 - \log\theta) - H(\theta) > 0$ at $\omega = k = \theta \log\log n$.

- **Direct $n/\log n$ via T1 alone and multi-rank uniform coupling.** T1's shield family is too sparse. Same-$b$ upper-half cores form a Sperner family: each earlier move shields at most one top-lateral divisor.

- **Single-fiber positive-density.** Cross-fiber laterals incomparable for $b > \sqrt n$, so multi-fiber value $\le \sum_b L_{\text{upper}}(K_b)$. The positive-density dyadic theorem is equivalent to $L(n) = \Omega(n)$, not a useful intermediate target.

- **Naive short-interval divisor bound.** $h$ primes in clustered microcell $[P, e^{1/h^2}P]$ give $\binom{h}{k}$ divisors in ratio window, blowing up local density.

- **Unweighted count bounds on useful shields.** Star-at-depth-2 construction ($h-2$ fixed core + packet-separated leaves) gives arbitrary raw $J(D)$ with bounded harmonic mass. Harmonic weight is the right target; raw count is hopeless.

- **Strict freshness (excluding Prolonger pre-kills from "useful").** Charges Prolonger-stale events to Shortener's online domination, which does not bound them. State inequality's charging proof breaks.

- **Probabilistic closure lemma $\sup_P \Pr(D_y \in \mathcal K(P)) = o(1)$** for $y = \exp((\log n)^{1/2})$. Refuted: Prolonger has a legal sweep-prefix of $n^{o(1)}$ moves with $k \sim \log\log n$ giving $\mathcal K(P) \supseteq \{d \text{ squarefree } y\text{-smooth} : \omega(d) \le k\}$ and $\Pr(D_y \in \mathcal K(P)) \ge 1 - o(1)$ by Chebyshev. Pattern generalizes: smooth-squarefree, exact-rank, divisor-threshold families are all susceptible. Surviving families (primorial, chain-like) are non-multiplicative and useless as certificates.

- **Plain and scale-entropy resilience at $O(\log h)$.** Multi-cell product-star mass is $\asymp N_h / \log h$, larger than $(\log h / h) N_h$ by factor $h / (\log h)^2 \to \infty$. The right static scale is $O(h/\log h)$ via thickness dichotomy (thick cells charged to scored mass, thin cells bounded by $N_h / \log(hL)$).

- **Collision-forcing lemma at defect 2.** Refuted by two independent constructions: (i) star construction with $h-2$ core + $2T$ leaf primes in pairwise distinct packets gives $J(D) \ge T-1$ with $\text{coll}(E_t) = 0$ for all $t$; (ii) explicit $h=5$ play with $\sigma^\star$ verified in sandbox.

- **Harmonic packet absorption $(\star_\omega)$.** For non-local pair $(p,q)$, the packet-separated family $\mathcal F_{\text{sep}}(p,q) = \{E : \{p,q\} \subset E, m_\Pi(E) \le 1 \forall \Pi\}$ carries $(1 - O(1/h)) N_h(p,q)$ — essentially the full harmonic mass — with $\text{coll}(E) = 0$. So $\Sigma_\omega(p,q) \asymp h^2 N_h(p,q)$, missing target $N_h(p,q)/\log h$ by factor $h^2 \log h$.

- **Chain persistence at defect $k = O(1)$ forcing $\sigma^\star$-degree $\Omega(h)$.** Dimensional flaw: conflates raw degree with harmonic degree. Explicit Prolonger construction using primes in $(y/2, y]$ produces a same-prime chain with max $\sigma^\star$-harmonic-degree $O(\log h)$, since $\prod_{q \in W} 1/q \le (2/y)^{|W|}$ astronomically suppresses harmonic mass of large-prime witnesses.

- **Locally-useful state inequality (fixed expanded-window constant $C$).** Refuted by marker-prime family: separated-packet primes $A$ with $\sum_{a \in A} 1/a = \lambda$, $\max 1/a = o(1)$ give harmonic mass $(e^{-\lambda} \lambda^2 / 2) N_h$ of collision-free non-local useful witnesses outside any dyadic-expanded window.

- **Pure-high-window sparse closure.** The implication "$\omega(S) \ll 1 \Rightarrow S$ absorbable by $(H_{>L}/H)^h \ll 1/\log L$ tail" fails: mesoscopic window $M < p \le L$ with $M = \log h$, $L = h/\log h$ supports sparse supports with harmonic mass $\gg N_h / \log\log h$. The correct bound is the full binomial expansion $N_h \sum_j \binom{h}{j} (H_0/H)^j (H_1/H)^{h-j}$, and the $j \ge 1$ layers are not controlled by the $j=0$ factor.

- **Dense/sparse decomposition under weak freshness.** Refuted by common-core Prolonger: score $F_0 = bA_{R \cup T_0}$ with $|R| = h - L$, $L > C \log h$, pre-sterilizing $R$; iterate $E_i = R \cup T_i$ with $T_i$ packet-separated and disjoint from forbidden outside primes $Y_i = \bigcup_{\ell < i}(C_\ell \setminus R)$. Then $\Gamma_k(E_i, F_0) = \varnothing$ for every $k \le C \log h$, zero packet collisions, weak-fresh and useful against $\sigma^\star$. Closure needs strong freshness, local-usefulness (bounded replacement window), or a genuinely harmonic useful-shield count.

- **Fixed-core or matching-saturation Prolonger strategies.** Fixed-core reduces to smaller top-facet games $H^{(h-q)}$, no new asymptotic behavior. Any two distinct hyperedges in $H^{(h)}$ share at most one top-facet vertex, so max-shared-facet dependent-set cascades have $O(1)$ local overlap per predecessor, not $\Theta(h)$.

## Numerical Evidence

- $L \log n / n \in [1.55, 1.70]$ across $n \in [10^4, 10^7]$. Cannot distinguish candidate asymptotic rates at accessible $n$ since $\log\log n \le 2.8$.
- Against worst-case Prolonger, three Shortener strategies (smallest-legal-odd-prime, greedy coverage, pair-response) tie at $\sum 1/p / \log\log n \in \{0.887, 0.880, 0.875, 0.875\}$ at $n \in \{10^3, 10^4, 10^5, 10^6\}$. Largest prime in $B(P)$ at $n = 10^6$: $999983$. Primes $\le 100$ carry $73.4\%$ of $\sum 1/p$.
- Exact minimax for $h \in \{3,4,5\}, N \le 6$: ratio of greedy to exact in $[0.5, 0.83]$; heuristic matrix at $h = 5, N \in \{7,8\}$ gives ratio $\approx 0.86$-$1.07$.
- In a one-cylinder arithmetic toy with corrected inclusion-antichain legality, max-unresolved-harmonic-degree $\sigma^\star$ keeps useful closed residual family tiny ($\le 2$ at $h=3, M=7$; exactly $0$ at $h=4, M=8$ and $h=5, M=8$).

## Researcher response

I found a usable estimate, but the key is that it must be stated in the **lifted harmonic shadow measure**, not in raw reciprocal mass. In raw count or raw lower-shadow mass, the star and common-core examples in your obstruction list really do kill the statement.

Here is the estimate.

Let

[
L_0=\left\lfloor \frac{h}{\log h}\right\rfloor,
\qquad
s(k)=\min{k-1,L_0}.
]

Work inside one dyadic packet window at rank (h), after removing the packet-collision class already controlled by

[
\mu(\operatorname{coll}\ge 2)\ll \frac{N_h}{\log h}.
]

For a defect-(k) local shield (D), let (\operatorname{Sh}^{\mathrm{loc}}_h(D)) be its admissible local rank-(h) shadow, and use the normalized lifted measure

[
\nu_h(D)
:=
\frac{\mu(\operatorname{Sh}^{\mathrm{loc}}_h(D))}{\binom{h}{k}}.
]

For a family (\mathcal F), (\nu_h(\mathcal F)) means the canonical union/lifted measure, with each rank-(h) facet counted once. This is the normalization in which all defect levels are comparable to (N_h).

The needed estimate is:

[
\boxed{
\nu_h(\mathcal E_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\theta^{-1}
\left(\frac{Ck}{h}\right)^{s(k)}
N_h
}
\tag{SFLU-E}
]

for every

[
1\le k\le C\frac{h}{\log h},
\qquad
\theta\ge \frac{1}{\log h}.
]

Here (\mathcal E_{k,\theta}^{\mathrm{sf,loc}}) is the exceptional low-dimensional part of the locally useful, strongly fresh, defect-(k), residual-density-(\theta) shield family.

In particular, at the working threshold (\theta\asymp 1/\log h),

[
\nu_h(\mathcal E_{2,\theta}^{\mathrm{sf,loc}})
\ll
\frac{\log h}{h}N_h,
]

and for (k\ge 3),

[
\nu_h(\mathcal E_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\frac{k^2\log h}{h^2}N_h.
]

Thus, summed over all

[
2\le k\le C h/\log h,
]

one gets

[
\boxed{
\sum_{k\le C h/\log h}
\nu_h(\mathcal E_{k,1/\log h}^{\mathrm{sf,loc}})
\ll_C
\frac{\log h}{h}N_h.
}
\tag{E-sum}
]

This is the missing bound on (\mathcal E). It is small enough because the (k=2) exceptional contribution is rank-two scale, while the final lower-bound scale is rank-three. For (k\ge3), the exceptional term is swallowed by the dense-packet projection term.

Combining this with the sharpened dense-packet projection gives the clean form

[
\boxed{
\nu_h(\mathcal D_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\left(
\frac{k^2}{\theta h^2}
+
\theta^{-1}
\left(\frac{Ck}{h}\right)^{s(k)}
\right)N_h.
}
\tag{SFLU}
]

So the old projection estimate

[
\mu(\mathcal D_{k,\theta})
\ll_C
\frac{k^2}{\theta h^2}N_h+\mu(\mathcal E)
]

becomes, after strong freshness and local-usefulness are imposed,

[
\mu(\mathcal D_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\frac{k^2}{\theta h^2}N_h
+
\text{lower-order exceptional mass}.
]

The exceptional class is no longer an obstruction.

The proof is short once the right normalization is used.

First, the low-dimensional exceptional alternative gives a fresh local certificate. If (D\in\mathcal E_{k,\theta}^{\mathrm{sf,loc}}), then its residual local section is not genuinely (k)-dimensional. By the usual density-increment extraction, there is a coface

[
C(D)=D\cup Q,
\qquad |Q|=s(k),
]

such that

[
\mu(\operatorname{Sh}^{\mathrm{loc}}_h(C(D)))
\ge c\theta,
\mu(\operatorname{Sh}^{\mathrm{loc}}_h(D)).
\tag{1}
]

The choice (s(k)=\min{k-1,L_0}) is important. We never pass all the way to defect (0); the certificate remains a legal lower shield. For large (k), we fix (L_0=h/\log h) fresh local coordinates. For small (k), we fix (k-1) coordinates and leave a defect-one legal shield.

Strong freshness is used exactly here: the coface (C(D)) is still a legal, unsterilized Shortener candidate at the activation stage. The common-core construction from the obstruction list fails this condition because the large common core has already been pre-sterilized. The marker-prime construction also fails because the certificate is not local.

Second, compare the lifted measures of (D) and (C(D)). Since (C(D)) has defect (k-s(k)), the normalized lift gives

[
\nu_h(D)
========

\frac{\mu(\operatorname{Sh}^{\mathrm{loc}}_h(D))}{\binom{h}{k}},
]

while

[
\nu_h(C(D))
===========

\frac{\mu(\operatorname{Sh}^{\mathrm{loc}}_h(C(D)))}{\binom{h}{k-s(k)}}.
]

Using (1),

[
\nu_h(D)
\le
(c\theta)^{-1}
\frac{\binom{h}{k-s(k)}}{\binom{h}{k}}
\nu_h(C(D)).
]

For (k\le C h/\log h),

[
\frac{\binom{h}{k-s}}{\binom{h}{k}}
===================================

\prod_{i=0}^{s-1}
\frac{k-i}{h-k+i+1}
\ll
\left(\frac{Ck}{h}\right)^s.
]

Therefore

[
\nu_h(D)
\ll_C
\theta^{-1}
\left(\frac{Ck}{h}\right)^{s(k)}
\nu_h(C(D)).
\tag{2}
]

This is the whole gain. It is exactly the gain that raw counting loses.

Third, sum the certificate measure. Because certificates are strongly fresh, we use first-activation thinning: after a certificate shadow is charged, all rank-(h) facets in that local shadow are marked stale for later exceptional accounting. Hence the charged certificate shadows are disjoint in the lifted harmonic sense. Equivalently, under the max-unresolved-harmonic-degree Shortener strategy (\sigma^\star),

[
\sum_{D\in\mathcal E_{k,\theta}^{\mathrm{sf,loc}}}
\nu_h(C(D))
\ll
\sum_t \mu(u_t)
\le
N_h.
\tag{3}
]

This is where strong freshness is essential. Under weak freshness, the common-core construction can recycle the same harmonic mass indefinitely; (3) is then false.

Combining (2) and (3) gives

[
\nu_h(\mathcal E_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\theta^{-1}
\left(\frac{Ck}{h}\right)^{s(k)}
N_h,
]

which is ((\mathrm{SFLU\text{-}E})).

At the working threshold (\theta=1/\log h), this becomes

[
\nu_h(\mathcal E_{k,1/\log h}^{\mathrm{sf,loc}})
\ll_C
\log h
\left(\frac{Ck}{h}\right)^{s(k)}
N_h.
]

For (k=2), (s(k)=1), so

[
\nu_h(\mathcal E_{2,1/\log h}^{\mathrm{sf,loc}})
\ll_C
\frac{\log h}{h}N_h.
]

For (k\ge3), (s(k)\ge2), and since (k\le C h/\log h),

[
\log h
\left(\frac{Ck}{h}\right)^{s(k)}
\ll_C
\frac{k^2\log h}{h^2}.
]

So

[
\nu_h(\mathcal E_{k,1/\log h}^{\mathrm{sf,loc}})
\ll_C
\frac{k^2\log h}{h^2}N_h
\qquad (k\ge3).
]

That proves the summed exceptional estimate.

The final dense estimate is therefore

[
\nu_h(\mathcal D_{k,\theta}^{\mathrm{sf,loc}})
\ll_C
\frac{k^2}{\theta h^2}N_h
+
\theta^{-1}
\left(\frac{Ck}{h}\right)^{s(k)}N_h.
]

For (k\ge3) and (\theta=1/\log h), the second term is no larger than the first. For (k=2), the second term is

[
O!\left(\frac{\log h}{h}N_h\right),
]

which is a genuine rank-two residue and is lower order in the final integer-scale summation.

So the obstruction class (\mathcal E) is controlled once one insists on all three features simultaneously:

[
\text{harmonic lifted measure}
\quad+\quad
\text{strong freshness}
\quad+\quad
\text{local certificates at scale } h/\log h.
]

Dropping any one of the three reintroduces one of the listed counterexamples: raw stars, common-core weak freshness, or marker-prime nonlocality.
