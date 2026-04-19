# Claude audit of T1/T2 rank-h fan proofs — no bugs, T2 constant ~1/4096 (empirical dominates by 1000x)

Audit of T1 and T2 rank-$h$ fan proofs, looking for the uniformity/constant gap:

T1 (rank-2 fan): $L \ge (1/8) n \log\log n/\log n$
Proof structure:

Phase 1 (activation): Prolonger plays smallest-first greedy. Shortener "kills" at most half the $a$'s. By smallest-first interlacing, $\sum_{\mathcal{A}0} 1/a \ge (1/2)\sum\mathcal{A} 1/a$.
Phase 1 edges: $E^* = \sum_{\mathcal{A}_0} |J_a \cap \mathbb{P}| \ge (1/4)n\log\log n/\log n$.
Phase 1 damage: Shortener's right-prime kills cost $O(|\mathcal{A}|^2) = o(n/\log n)$.
Phase 2 (max-degree capture): lemma gives $C + X \ge E_0/2$.
Combined: $L \ge E_0/2 \ge (1/8)n\log\log n/\log n$.
Audit: proof is tight. Phase-1 uses $(1/2)$ twice (activation pairing + edge density), Phase-2 uses $(1/2)$ once. Product $1/8$. Constant is uniform. No gap I can find.

T2 (rank-3 fan): $L \ge c_\delta \cdot n(\log\log n)^2/\log n$
Proof structure (sketched in canonical prompt but not fully expanded):

Lemma 1 (weighted pair-graph capture): Prolonger captures $\ge 1/8$ of edge weight via potential $\phi(e) \in {1/8, 1/4, 1/2, 1}$.
Lemma 2 (two-layer fiber capture): After pair-endpoints captured, each $b$-fiber has $\ge 1/8$ survival. Product: $1/64$.
Raw count: $(n/(4\log n)) \cdot \delta^2 (\log\log n)^2$ from $\sum_{a<c} 1/(ac) \approx (1/2)(\delta\log\log n)^2$.
Combined: $c_\delta = \delta^2/256$ or similar. Very small.
Audit finding: the constant $c_\delta$ is tiny ($\approx \delta^2/256$, so $\approx 1/4096$ at $\delta = 1/4$). At $n = 10^7$:

L
≥
1
4096
⋅
n
(
log
⁡
log
⁡
n
)
2
log
⁡
n
=
10
7
⋅
7.73
4096
⋅
16.12
≈
1170.
L≥ 
4096
1

 ⋅ 
logn
n(loglogn) 
2
 

 = 
4096⋅16.12
10 
7
 ⋅7.73

 ≈1170.

Empirical $L = 10^6$ — nearly 1000x larger. T2 is a VERY loose lower bound at practical $n$.

This explains why my empirical data doesn't exhibit the $(\log\log n)^2$ factor: empirical Prolongers exceed T2's construction by three orders of magnitude, so the $(\log\log n)^2$ structural factor is swamped by a much larger constant that dominates at practical $n$.

Revised read
T1 and T2 are probably correct. Both proofs look clean. T2's constant is tiny (1/4000ish), which is why the $(\log\log n)^2$ factor isn't visible empirically — empirical $L$ is ~1000× bigger for other reasons.
My "T2 has a bug" hypothesis was wrong. T2 just has a small constant. It doesn't predict the $(\log\log n)^2$ growth will be numerically detectable at $n \le 10^{10}$ or so.
The empirical $L \sim 1.6 n/\log n$ reflects the ACTUAL game value, which is driven by a mechanism much stronger than T2's fan construction. The ACTUAL rate could be:
$\Theta(n/\log n)$ with constant 1.5-1.7 (true rate stays at $n/\log n$ plus tiny $(\log\log n)^2$ corrections from T2 that never dominate).
$\Theta(n/\log n)$ with slow upward corrections from some structural mechanism not yet identified.
$\Theta(n(\log\log n)^C/\log n)$ for $C \ge 2$ (T2's bound eventually becomes visible at astronomical $n$).
The empirical data makes one strong claim: $L$ at practical $n$ is roughly $1.6n/\log n$, at least 3 orders of magnitude above T2's best fan-construction lower bound. Neither lower bound nor upper bound matches this at current $n$.
What this means for Pro dispatch
The sharp open question isn't "prove T2 wrong" (it's likely right) but: why is the empirical $L \sim 1.6n/\log n$ so much larger than T2's fan construction?

Answer candidates:

T2's $1/4096$ constant is loose and a better Prolonger construction achieves a much larger constant.
There's a non-fan mechanism driving the empirical value.
Concrete dispatch: "Improve T2's constant. The bound $L \ge (1/4096) n(\log\log n)^2/\log n$ is 1000× below empirical values. Either tighten the two-lemma constants, or find a Prolonger beyond the $acb$ fan construction that achieves $L \ge c n/\log n$ directly with $c \ge 1$."

This is what I can confidently report. T1/T2 audit finds no bugs; the gap is in the constant, not the form.
