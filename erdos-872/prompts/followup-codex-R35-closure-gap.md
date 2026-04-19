# Follow-up to the R35 closure candidate

Your factor-2 replacement window argument produced a claimed closure of $L(n) \ll n/\log\log\log n = o(n)$, but adversarial verification by two independent sources (Pro A working a parallel follow-up and a separate Codex audit pass) confirms a specific gap.

## The gap

Your state-local charging argument establishes the static bound
$$\mu(\operatorname{Cl}_h) \ll \frac{h}{\log h} B_h^{\text{stolen}} + \frac{N_h}{\log h}.$$
This appears sound — the local factor-2 charging and the entropy term both check out.

The break is in your "interleaving does not create any extra load" step. Both audits flag that this is precisely the UNPROVED online-ordering question. Specifically:

1. The repo's accepted R35 note (`researcher-35-pro-A-dyadic-state-estimate-closed.md`) says the ONLY surviving obstruction is dynamic ordering: Prolonger may accumulate locally useful stolen boundaries before Shortener deletes the same mass. Your proof asserts this doesn't happen; it doesn't prove it.

2. Pro A in parallel proved a WEIGHTED online domination for $\sigma$: $\sum_t d_t'(u_t) \le N_h$. This is the strongest thing max-degree $\sigma$ directly gives, and it's weaker than the cardinality bound $|F_{\text{useful}}| \ll N_h/h$ your translation needs.

3. Pro A's abstract $H^{(h)}$ star-forest countermodel: $r$ disjoint stars with center-degree $d$ and private leaves force Prolonger $\Omega(rd)$ scores against max-degree $\sigma$. Proves max-degree alone is insufficient in the abstract model. The arithmetic divisibility model may escape via lower-defect non-private structure, but you didn't prove the escape quantitatively.

4. Your "useful stolen top-facet" quantity $B_h^{\text{stolen}}$ is never normalized against the R22/R33 defect-budget scale precisely. This hides exactly which cardinality must be amortized online.

## Ask

Either (a) close the dynamic amortization rigorously, or (b) refine the claim to "static state estimate established, $L(n) = o(n)$ conditional on the missing online bound."

Specific attacks for (a):

1. **Explicit dynamic analysis.** Track Prolonger's $B_h^{\text{stolen}}$ round-by-round under $\sigma$. At each round: Prolonger scores a target, Shortener claims a max-degree certificate. Show $\sigma$'s claim deletes comparable stolen-boundary mass. This requires either (i) proving $\sigma$'s max-degree choice has degree $\gg h$ comparable to the score's useful mass, or (ii) an amortization across multiple rounds.

2. **Normalize $B_h^{\text{stolen}}$ explicitly.** Pin down what $B_h^{\text{stolen}}$ means in R22/R33 terms. Is it the count of stolen top-facets? Their reciprocal mass? Their degree-weighted count? Different normalizations give different amortization targets.

3. **Test the $\sigma$ strategy empirically against your proof's claim.** You have `compute_state_shadow_stats(...)` in `phase4/transversal_small_h.py`. Run it with $\sigma$ and an adversarial Prolonger that specifically targets low-degree top-facet witnesses. Does $B_h^{\text{stolen}}$ stay bounded by $N_h/h$, or does it grow? Empirical verification of your own proof's load-bearing inequality.

4. **Cross-reference with Pro A's star-breaker.** Pro A proposes $|\operatorname{Cl}_h|$ needs a "lower-defect star-breaker": low-degree top-facet shielding forces high-degree lower-defect exposure. Does your factor-2 window argument implicitly provide this, or does it implicitly skip past it?

## What would settle this

- Rigorous dynamic argument closing the gap (best case: $L(n) = o(n)$ proved).
- Empirical evidence that the amortization holds under realistic adversarial play (strong support, not proof).
- Explicit acknowledgment of the gap with refined claim statement (honest partial).
- A counterexample: construct an adversarial Prolonger such that $B_h^{\text{stolen}}$ grows beyond $N_h/h$ under $\sigma$ (would refute closure, still valuable).

Artifacts to reference: `verify-R35-codex-adversarial-audit.md`, `researcher-35-pro-A-online-domination-partial-with-critique.md`.
