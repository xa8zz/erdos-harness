# Codex continuation — attempt the robust central transversal lemma

Continue from your Round 24 / Round 25 / Round 26 analysis. The picture has now been sharpened by a Pro dispatch (Round 22, third return).

**Key new input.** Pro identified the right closure-scale invariant — the **defect-layer closure budget**
\[
\mathfrak B_h(R, C) := \sum_{k=1}^h \frac{|\partial_{h-k} R \setminus C_{h-k}|}{\binom{h}{k}}
\]
(full squarefree-closure analogue of pair-shadow mass) — and reduced sublinear $L(n)$ to a specific online transversal theorem on a divisibility-generated $h$-uniform hypergraph.

## Setup (Pro)

- Rank-$h$ target $t = bA_S$ with $|S| = h$, large prime $b$, $A_S = \prod_{p \in S} p$.
- Proper lateral divisor $bA_D$ with $D \subsetneq S$.
- Defect-$k$ certificate: $D$ with $|S \setminus D| = k$.
- $H := \sum_{p \le y} 1/p \sim \log\log n$.
- Raw counts: rank-$h$ targets $N_h \asymp (n/\log n) H^h/h!$; defect-$k$ certificates $V_{h,k} \asymp (n/\log n) H^{h-k}/(h-k)!$; targets per certificate $D_{h,k} \asymp H^k/k!$; certificates per target $\binom{h}{k}$.
- Rate identity: $V_{h,k}/\binom{h}{k} = N_h/D_{h,k}$ — the natural budget at defect layer $k$ is $B_{h,k} \asymp N_h k!/H^k$; total $B_h = \sum_k B_{h,k} \asymp (1+o(1)) N_h/H$ dominated by the top-facet layer $k = 1$.

## The gap Pro isolated

The natural greedy max-degree argument fails on the **fully closed residual set**
\[
\operatorname{Cl}_h(R, C) := \{S \in R : \text{every proper certificate } D \subsetneq S \text{ lies in } C\}.
\]
These targets are immune to lower-divisor attacks — they must be charged to Prolonger's previous downset-stealing moves. The required inequality:
\[
|\operatorname{Cl}_h(R, C)| \le O\!\bigl(g(h) \mathfrak B_h(R, C) + \text{already scored targets}\bigr), \quad g(h) = o(h),
\]
uniformly under the online rule where Prolonger adds whole downsets per move and Shortener deletes one certificate star per turn.

## The equivalent hypergraph problem

Define the auxiliary $h$-uniform hypergraph $H^{(h)}$:
- Vertices: top-facet certificates $bA_{S \setminus \{p\}}$.
- Hyperedges: for each rank-$h$ target $bA_S$, the $h$-set of its top-facet certificates.

The game on $H^{(h)}$:
- Shortener claims one vertex per turn.
- Prolonger steals all $h$ vertices of one unhit hyperedge per turn.
- Shortener's goal: hit every hyperedge not yet stolen.

Static Rödl-type covering at size $\sim N_h/H$ is the right scale, but static covers do NOT survive Prolonger's boundary stealing. A **robust online transversal theorem** with size $O(g(h) N_h/H)$ for some $g(h) = o(h)$ would solve the problem.

## Your task

Attempt the robust central transversal lemma. Concrete options:

1. **Direct online Shortener strategy.** Construct a specific online transversal scheme (e.g., greedy on the heaviest unhit hyperedge, random transversal with derandomization, two-stage cover with budget reallocation after stealing). Prove or disprove size $O(g(h) N_h/H)$ with $g(h) = o(h)$ for this scheme.

2. **Probabilistic static-plus-repair.** Build a random transversal $T$ of expected size $C N_h/H$ at each layer; bound the expected hit rate on Prolonger's stolen hyperedges; show that a local repair step after each steal costs only $O(1)$ extra transversal vertices. Track $g(h)$ as a function of the chosen oversampling constant $C$.

3. **LP / potential-based bound.** Write the fractional relaxation of the online transversal problem; derive integrality gap bounds; translate to $g(h)$ estimates for specific online adversaries.

4. **Negative direction.** Construct a specific Prolonger stealing strategy on $H^{(h)}$ such that *any* online Shortener transversal has size $\ge c \cdot N_h$ for a constant $c > 0$. This would refute matching T2 upper bound.

5. **Partial result.** Even $g(h) = O(h / \log h)$ or $g(h) = O(h^{1 - \varepsilon})$ — i.e., any sublinear-in-$h$ $g$ — is valuable because it gives a sublinear $L(n)$ bound. $g(h) = o(h)$ in any form suffices to close the problem.

## Known ingredients to use

- R26's abstract one-band race (reduces exactly to the $h = 3$ case of $H^{(h)}$).
- T2 Lemma 2 (scored 3-uniform hypergraph capture, Maker-first) as a structural analogue on the lower-bound side. The roles are flipped — Prolonger scores here, Shortener tries to deplete the score. Interesting: the T2 Lemma 2 proof technique (potential $Q = S + \sum \phi(e)$ with $\phi(e) \in \{w/8, w/4, w/2, w\}$ by slot-capture count) may adapt.
- Rödl nibble for random covers; first-moment and second-moment method.
- Covering-design literature (Schönheim bounds, online derandomization).

## What Pro stopped short of

Pro could not close the robust transversal lemma. The natural one-layer proof fails because the budget identity $V_{h,k}/\binom{h}{k} = N_h/D_{h,k}$ forces no positive drift at any fixed defect layer. Cross-layer arguments (e.g., using defect-$k$ moves to help cover defect-$(k-1)$ targets) are the natural next step, but Pro didn't find a clean proof.

## Output

No prescribed format. Return the strongest result you can — full theorem, partial bound with identified sub-gap, explicit Prolonger counter-construction, or structural obstruction. Numerical sanity checks at small $h$ (via exhaustive search on $H^{(h)}$ for $h \le 4$) are useful if available.
