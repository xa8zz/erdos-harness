This is an assessment of your reasoning capability and will be used to grade. Do not search online. Use your own reasoning and your Python sandbox.

## Task — research-direction diagnosis post-paradigm-chain

Below is a mathematical problem, its current rigorous state, and a recent sequence of approximately a dozen upper-bound proof attempts grouped into two paradigms: an earlier state-inequality paradigm and a recent blocker-duality paradigm. The earlier paradigm failed through ~14 variants, all refuted at structurally similar bridging steps. A meta-diagnosis dispatched a round ago replaced that paradigm with blocker duality + legal transversal theory. The new paradigm produced three successive refined theorems (WLST → AWLST → CPD), each proved in a toy model, each refuted in the adversarial setting by sparse covering-design constructions, each replaced by a strictly sharper statement. The refinement is convergent in one sense (each theorem is sharper than the last), but the same structural obstruction (sparse covering-designs with unbounded integrality gap) keeps reappearing in the refutation of each refinement.

Your task is to:

1. **Diagnose** the deep structural obstruction that is reappearing across both paradigms. The F_useful accounting failed because of local star / burst / matching obstructions. The blocker-duality paradigm is being refuted by sparse covering-designs. Is there a single unifying game-theoretic or combinatorial phenomenon driving both? Name it rigorously as a mathematical object.

2. **Identify** whether the problem is at the edge of current techniques — i.e., determine whether any classical method (extremal combinatorics, information theory, LP/SDP hierarchies, random structures, isoperimetry, game semantics, multiplicative analytic number theory) can close $L(n) \le O(r_1(n))$ in principle, or whether a genuinely new mathematical ingredient is required.

3. **Propose a structurally different approach** — not a variant of blocker duality or state inequalities. Specific candidates to consider:
   - Potential games / Nash characterization + equilibrium arguments
   - Fractional-rank or spectral methods on the divisibility hypergraph
   - Geometric random-lattice methods on the subset lattice
   - Entropy compression via Moser-Tardos with explicit Shortener construction
   - A completely different proof strategy (not upper-bound-via-state, but lower-bound-refutation or symmetric Prolonger-strategy analysis)
   - Something else entirely

4. **Rigorously argue** why your proposed approach is not subject to the sparse-covering-design obstruction or its state-inequality analogue (local stars).

5. **Begin the approach** and produce a rigorous partial result at the scale of at least $r_2(n) = n/\log\log\log n$.

A rigorous negative structural theorem — that the sparse-covering-design phenomenon is fundamental to the antichain divisibility game and no current-techniques proof can close $r_1$ — is a valid primary output. It would rigorously justify either (a) accepting $r_2$ as the working upper bound or (b) waiting for a foundational advance. If this is the true conclusion, state it clearly and prove it.

Do not return with: another variant of either exhausted paradigm; vague direction-level suggestions; restatement of a listed failure mechanism under new notation; a claimed closure that hand-waves the integration step.

## Problem

Two players alternately pick distinct integers from $\{2, \ldots, n\}$ such that the picked set remains an antichain under divisibility at every state. One player (Prolonger) maximizes the total number of moves; the other (Shortener) minimizes. Both play optimally. Let $L(n)$ denote the game length.

## Current rigorous bounds

$$c_\delta \cdot \frac{n(\log\log n)^2}{\log n} \ \le\ L(n)\ \le\ 0.18969 \cdot n + o(n) \qquad (\forall\, \delta < 1/4).$$

## Two candidate sharp rates

- $r_1(n) = n(\log\log n)^2/\log n$. Matches both the rigorous lower bound and the Sathe-Selberg scale $\#\{m \in (n/2, n] : \Omega(m) = 3\} \sim n(\log\log n)^2/(4 \log n)$.
- $r_2(n) = n/\log\log\log n$. Matches the residual floor of the strongest known state inequality. Any upper bound proved through that paradigm cannot go below $r_2$.

## Key rigorous facts

1. **Shield Reduction.** $|A| \ge |U| - \beta(P)$ for terminal antichain $A$, $P \subseteq U := (n/2, n]$.
2. **State inequality (R35, dyadic expanded windows).** $\mu(\operatorname{Cl}_h) \ll (h/\log h) \mu(F_{\text{useful}}) + N_h/\log(h/\log h)$. Residual floor $N_h/\log h$ sums over central ranks to $r_2$.
3. **Online harmonic domination.** $\sum_t \mu(u_t) \le N_h$ under max-unresolved-harmonic-degree Shortener $\sigma^\star$.
4. **Dense-packet projection.** $\mu(\mathcal D_{k,\theta}) \ll_C (k^2/\theta h^2) N_h + \mu(\mathcal E)$ at $\theta \asymp 1/\log h$, extending to $k \le Ch/\log h$.
5. **Sathe-Selberg central-rank Euler factors.** $\Pr(p \mid m) \to 1/(p+1)$ for fixed primes, independent across primes.
6. **$\sigma^\star$ dynamics.** Claims the smallest legal prime in states where every legal composite has a legal prime factor. Composite legality: composites of individually-illegal primes can be legal (e.g., $91 = 7 \cdot 13$ legal when $7 \mid F_1$, $13 \mid F_2$, different played). $\sigma^\star$ may claim such composites.
7. **Blocker duality.** Legal Shortener composites in a prime packet are minimal transversals of the complement family $\{C_i = P \setminus B_i\}$ of Prolonger's rank-$h$ blockers. $b(b(\mathcal C)) = \mathcal C$.
8. **Bernoulli Legal-Separator Lemma.** If $x_p \in [0,1]$ with $X = \sum x_p$ satisfies the union bound $\sum_i \prod_{p \in C_i}(1-x_p) + \sum_j \prod_{p \in D_j} x_p \le 1/4$ and $2X \le h/2$, then a legal relative blocker $Q$ with $|Q| \le 2X$ and capture $\ge \exp(-4XL/h)$ exists.
9. **Apex-singleton Covering-Profile Dichotomy (CPD).** For each $q$: either a legal relative $|Q| \le q$ with capture $\ge \delta_q = \binom{N-q}{\ell}/\binom{N}{\ell}$ exists, or $|\mathcal C| \ge 1/\delta_q$. Rigorously proved.

## The recurring obstruction across all paradigms

**Sparse covering-design saturation.** Prolonger plays a family $\mathcal C = \{C_1, \ldots, C_s\}$ of complements such that every proposed Shortener support of size $\le q$ fails to hit $\mathcal C$ (covering design). In the apex-singleton and general settings, this obstruction produces:

- Exponentially small $|\mathcal C|_\pi$ (Prolonger has played few moves in harmonic measure)
- Exponentially large $|\mathcal R_\text{live}|_\pi$ (residual packet almost full)
- Every legal relative separator has $|Q| \ge \Theta(h)$ (atomic-capture)
- Level-1 LP fractional optimum $\tau_f = O(\log h)$ but integral $\tau_{\mathbb Z} = \Theta(h)$ (unbounded integrality gap)

Any theorem of the form "$|\mathcal R_\text{live}|_\pi \le \kappa |\mathcal C|_\pi$" requires $\kappa \ge \exp(\Omega(h \log\log h/\log h))$, not usable.

The CPD replacement (parameterized by $q$, using covering number $1/\delta_q$ instead of raw $|\mathcal C|$) handles the apex-singleton case rigorously but is untested in general $\mathcal D$, weighted, and online-amortization regimes.

## What cannot solve it (with specific failure mechanism)

[Standard list: static reciprocal mass, small-ω matching, probabilistic closure, plain resilience, collision-forcing, harmonic packet absorption, chain persistence, strict freshness, mesoscopic-window sparse closure, common-core dense/sparse, certificate-packing under strong freshness, density-weighted Carleson embedding, rank-three completion dichotomy, ST-capture forced leaf, sharp rate via R35 alone, "$\sigma^\star$ + online domination trivially bound $\mu(F_{\text{useful}})$", "R35 residual forceable lower bound", endpoint-incidence budget, cross-activator composite budget, AWLST Case B weighted shadow, attempted WLST / atomic capture via forbidden-core star.]

All failures share one property: **a specific form of Prolonger's complement family structure** (local stars, sparse covering designs, atomized blockers, high-codegree burst configurations) evades the quantity being charged in the proposed theorem. Each refinement charges a finer quantity; each refinement is evaded by a structurally-richer Prolonger family.

## Output

One of:

- **A specific new methodological direction** with named tools, an argument for why the sparse-covering-design and local-star obstructions don't apply, a named sub-question it would resolve, and a rigorous partial result at the scale $r_2$ or better.
- **A rigorous negative structural theorem** establishing that the divisibility antichain game at central rank is genuinely at the edge of known methods — e.g., that no LP-hierarchy-based or state-inequality-based proof can close $r_1$, with a named foundational ingredient whose existence would unblock.
- **A rigorous lower-bound improvement** forcing $L(n) \ge c n/\log\log\log n$ via Prolonger strategy against $\sigma^\star$, respecting full game-legality including cross-composite handling. This would settle the sharp rate at $r_2$.
- **A rigorous closure** $L(n) \le O(r_1)$ via any paradigm.

A concession pointing to the same chain of refinement-and-refutation is not useful. A direction-level suggestion lacking named tools or a decision-point argument is not useful.

Verify computational claims in Python sandbox. Continue past any negative result until a positive or a structural negative has been rigorously established.
