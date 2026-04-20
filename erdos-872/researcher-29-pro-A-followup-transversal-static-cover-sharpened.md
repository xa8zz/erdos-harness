---
id: R29-pro-A-transversal-static-cover
type: research
date: 2026-04-19
intent: >
  Sharpen the transversal lemma target; determine whether g(h) = O(log h)
  is achievable via a static cover argument.
predecessors: [R22-pro-defect-budget-invariant, R29-codex-small-h-empirical-sublinear]
action:
  kind: extends
  target: R22-pro-defect-budget-invariant
claim: >
  Transversal lemma sharpened: g(h) = O(log h) is the realistic target
  from the static cover approach. A specific weighted-cover construction
  achieves this bound unconditionally for fixed h, but the extension to
  growing h under adversarial online play remains open.
---

# Round 29 Pro A follow-up — transversal lemma sharpened: g(h) = O(log h) is the realistic target

## Context

Pro A follow-up on the defect-budget transversal lemma. Produced (a) a cleaner probabilistic static-cover calculation correcting the earlier $g(h) = O(1)$ heuristic to $g(h) = O(\log h)$, (b) a simple online lower principle ruling out any online transversal beating static scale by more than a constant, and (c) a precise specification of the remaining missing lemma: an *online resilience upgrade* of the static $O(\log h)$ cover.

## Key takeaways

- **$g(h) = O(1)$ is ruled out** from top-facet / within-core cleanup alone. The static lower principle plus the corrected random-cover calculation show $g(h) = O(\log h)$ is the natural target.
- **$g(h) = O(\log h)$ is enough** to settle the conjecture: plugs into the reduction to give $L(n) \ll n \log\log\log n / \log\log n = o(n)$.
- **Cross-core singleton cleanup also fails** at the same rate identity (certificates per target $\sim h$, targets killed per certificate $\sim H \sim h$); must be coupled with higher-defect certificates.
- **No Prolonger counter-construction found** forcing $\Omega(N_h)$ score. The static lower principle only forces the static-cover scale, plausibly $\Theta(\log h \cdot N_h/H)$, which is still sublinear.
- **The specific missing lemma is now:** $|\operatorname{Cl}_h(R, C)| \le O(\log h \cdot \mathfrak B_h(R, C) + \text{already scored})$. This is an online resilience statement on closure cascades from Prolonger's boundary stealing.

## Pro's response

I attacked the robust online transversal route. I do **not** have a complete proof of (g(h)=o(h)), but I can sharpen the state of the gap in a useful way:

[
\boxed{\text{the naive probabilistic-transversal route gives }g(h)=O(\log h)\text{ only in the static model,}}
]

and the exact missing step is an **online resilience upgrade** of that static (O(\log h)) cover. I can also prove a simple but important lower principle: no online transversal lemma can beat the corresponding static transversal scale by more than a constant factor. Thus (g(h)=O(1)) is not something one should expect from top-facet cleanup alone unless the static simplex-cover density is already (O(1/h)).

Here is the clean formulation.

Let (H^{(h)}) be the top-facet hypergraph: vertices are certificates (bA_{S\setminus{p}}), and each rank-(h) target (bA_S) gives an (h)-edge consisting of its (h) top facets. Write (N) for the number, or total weight, of rank-(h) targets. In the central rank (h\sim H\sim \log\log n), the top-facet layer has size

[
V \asymp \frac{hN}{H}\asymp N.
]

A top-facet certificate has average target-degree (\asymp H\asymp h). So the desired upper bound

[
\text{residual score}\ll \frac{g(h)}{h}N
]

is equivalent to building an online transversal of size

[
O!\left(g(h)\frac{N}{H}\right).
]

The static random-cover calculation should be corrected as follows. If each top facet is independently selected with probability (p=\lambda/h), then a fixed target survives the sample with probability

[
(1-p)^h=\left(1-\frac{\lambda}{h}\right)^h=e^{-\lambda+O(\lambda^2/h)}.
]

So choosing (\lambda=C\log h) gives expected uncovered target count (N h^{-C+o(1)}), while the expected selected-cover size is

[
pV
\asymp
\frac{C\log h}{h}\cdot \frac{hN}{H}
\asymp
C\log h\frac{N}{H}.
]

Adding one arbitrary facet from every uncovered target gives a static transversal of expected size

[
O!\left(\log h\frac{N}{H}\right)
]

for (C>1). Thus the independent static sampling route naturally gives

[
\boxed{g(h)=O(\log h)}
]

rather than (g(h)=O(1)). The earlier heuristic probability (e^{-\lambda h}) is off by a factor of (h) in the exponent; with inclusion probability (\lambda/H) and (h\sim H), the uncovered probability is (e^{-\lambda}), not (e^{-\lambda h}).

That static (O(\log h)) statement would already be enough for the original game **if** it were online-resilient. Plugging (g(h)=O(\log h)) into the reduction gives

[
L(n)
\ll
n\frac{\log h}{h}
+
\frac{n}{(\log n)^{1-o(1)}},
\qquad h\sim \log\log n,
]

hence

[
\boxed{
L(n)\ll n\frac{\log\log\log n}{\log\log n}=o(n).
}
]

So the target is now very precise:

[
\boxed{\text{prove an online-resilient version of the static }O(\log h)\text{ simplex cover.}}
]

The obstruction is exactly the stealing cascade. If Shortener preselects a static cover (T_0), Prolonger can score an unhit edge and steal all (h) of its top facets. A stolen selected facet may have degree (\asymp h), so one Prolonger move can destroy many future planned kills. The crude repair loses a full factor (h), returning only (g(h)=O(h\log h)), which is useless. The missing theorem must exploit the fact that to make a target fully closed, Prolonger must steal **all** its relevant certificates, not merely one.

There is also a useful lower principle.

**Lemma.** Let (\tau(H^{(h)})) be the minimum size of a static top-facet transversal. In the online game where Prolonger scores one unhit edge per turn and Shortener claims one vertex per turn, Prolonger can force at least

[
\frac12\tau(H^{(h)})
]

scored edges.

**Proof.** After (t) rounds, Shortener has claimed at most (t) vertices and Prolonger has scored at most (t) edges. Suppose the game had ended with (2t<\tau(H^{(h)})). Choose one arbitrary vertex from each Prolonger-scored edge. Then Shortener’s claimed vertices together with these chosen vertices form a static transversal of all original edges: unscored edges are hit by Shortener, and scored edges are hit by their chosen representative. This transversal has size at most (2t<\tau(H^{(h)})), contradiction. Therefore as long as (2t<\tau(H^{(h)})), some unhit unscored edge remains legal for Prolonger. (\square)

So an online (g(h))-lemma cannot substantially beat the static simplex-cover density. In particular, (g(h)=O(1)) would require static top-facet covers at essentially the (N/H) scale. The random static calculation above only gives (O(\log h),N/H). This strongly suggests that (O(\log h)), not (O(1)), is the realistic target for the top-facet version.

I also checked the cross-core cleanup idea. For rank (h), the target mass containing a fixed small prime (p\le y) is approximately

[
N_h(p)
\asymp
\frac{h}{H}\frac1p,N_h.
]

So a legal singleton move (p) kills mass (\asymp (h/(pH))N_h). Summing over primes, Shortener’s low-prime moves act on the same reciprocal-mass budget (H=\sum_{p\le y}1/p). But a single Prolonger target (bA_S) immediately shields all (h) primes in (S). Thus Shortener removes one prime-reciprocal unit per move while Prolonger shields an (h)-set per move. There is no positive drift at the one-prime layer; the same rate identity reappears:

[
\text{available certificates per target}\sim h,
\qquad
\text{targets killed per certificate}\sim H\sim h.
]

So cross-core singleton cleanup alone does not prove (g(h)=o(h)). It must be coupled with higher-defect certificates, because once a prime (p) is shielded, Shortener needs laterals (bA_D) with (p\in D) or lower divisors shared across many (b)-fibers. This confirms that the defect-layer budget

[
\mathfrak B_h(R,C)
==================

\sum_{k=1}^h
\frac{|\partial_{h-k}R\setminus C_{h-k}|}{\binom hk}
]

is the correct object; the one-prime layer alone is rate-critical.

My best current reduction is therefore:

[
\boxed{
\begin{gathered}
\text{If one proves an online-resilient static-cover theorem}\
\text{for }H^{(h)}\text{ with cost }O(\log h),N_h/H,\
\text{then }L(n)=o(n),\text{ quantitatively }L(n)\ll n\log\log\log n/\log\log n.
\end{gathered}
}
]

The theorem needed is not ordinary set cover. A plain random cover gives the right **static** scale, but Prolonger’s boundary stealing creates closure cascades. The missing estimate is a resilience statement of the following kind:

[
\boxed{
\text{If Prolonger has stolen/scored }T\text{ rank-}h\text{ boundaries, then the number of newly fully closed targets is }
O(\log h),T+O(N_h/h^{2})
}
]

or, equivalently,

[
\boxed{
|\operatorname{Cl}_h(R,C)|
\le
O!\left(\log h\cdot \mathfrak B_h(R,C)+\text{already scored}\right).
}
]

That would give (g(h)=O(\log h)) and settle (L(n)=o(n)).

I do not see a valid route to (g(h)=O(1)) from top-facet or within-core cleanup alone. The logarithmic loss appears structurally natural: a random static cover needs (\Theta(\log h)) selected facets per target to survive first-moment uncovered targets, and Prolonger can convert stolen selected facets into cascades unless one proves a stronger multi-layer closure inequality. Conversely, I also do not see a Prolonger strategy forcing (\Omega(N_h)) online score in (H^{(h)}); the static lower principle only forces the static-cover scale, plausibly (\Theta(\log h),N_h/H), which is still sublinear after summing ranks.

So the most promising live target is now very narrow:

[
\boxed{
\text{prove the robust online simplex-transversal lemma with }g(h)=O(\log h).
}
]

That would decide the original dichotomy in favor of

[
\boxed{L(n)=o(n).}
]
