Your claimed closure of $L(n) = o(n)$ via the weighted counting lemma + thickness dichotomy has been adversarially audited by two independent sources, both identifying the same specific gap.

## The gap

The static state inequality you proved —
$$\mu(\operatorname{Cl}_h(R, C)) \ll \frac{h}{\log h} \cdot (\text{scored mass}) + \frac{N_h}{\log h}$$
— appears correct. This is a genuine new result. Thick-case fractional charging, thin-case exponential tilting, dyadic window locality all look sound.

The break is in your translation "translate to the integer game: $L(n) \ll n \cdot g(h)/h$" with $g(h) = h/\log h$.

Two independent audits argue this translation implicitly requires a CARDINALITY bound on useful scored/stolen boundary mass:
$$|F_{\text{useful}}| \ll N_h/h \text{ under } \sigma.$$

Pro A, on a parallel continuation attempt, proved a WEIGHTED online domination lemma for $\sigma$ — $\sum_t d_t'(u_t) \le N_h$ at defect-1 — but this is degree-weighted, NOT cardinality. Codex, in a separate adversarial audit, independently confirmed the gap: your static estimate is self-referential as a game-length bound without the online amortization.

Pro A's sharpening of what's needed: "low-degree top-facet shielding forces high-degree lower-defect exposure, and $\sigma$ claims it before Prolonger can accumulate $\omega(N_h/h)$ useful shields."

Pro A also exhibited an abstract star-forest counterexample in $H^{(h)}$ showing max-degree $\sigma$ ALONE cannot prove the amortization: $r$ disjoint stars with degree-$d$ centers and private leaves force Prolonger $\Omega(rd)$ scores despite static center cover $r$. The arithmetic divisibility model may escape this via lower-defect non-private certificates, but that needs quantitative proof.

## Ask

Either (a) close the cardinality bound explicitly, or (b) acknowledge the gap and refine the claim to "static estimate established, $L(n) = o(n)$ conditional on the missing online amortization."

Specific attacks for (a):

1. **Mass-weighted translation**. Does your $L(n) \ll n \cdot g(h)/h$ actually work purely via mass control, not cardinality? If so, identify the specific mechanism by which mass-weighted analysis handles Prolonger's cumulative scored mass without needing a cardinality bound. This would rescue the closure.

2. **Degree amplification on useful certs**. Prove that useful stolen certificates have average live degree $\gg h$ under $\sigma$. Combined with Pro A's weighted bound $\sum d_t'(u_t) \le N_h$, this gives cardinality $\ll N_h/h$ directly.

3. **Lower-defect star-breaker**. Prove Pro A's specific form: whenever Prolonger creates many low-degree top-facet shields, some lower-defect certificate has degree large enough that $\sigma$ deletes comparable mass first. The arithmetic divisibility structure (lower divisors $A_D, bA_D$ are NOT private in the star-forest sense) should help.

4. **Direct game-theoretic amortization on the dyadic windows**. Track Prolonger's cumulative useful scored mass round-by-round, using the dyadic-window locality you introduced. The locality bounds per-round drift.

If you cannot close the gap, acknowledge it precisely. Your static estimate is still a substantive advance — it's genuinely the first rigorous cell-local entropy bound — and should be written up as an intermediate result, not a closure.

## What would definitively settle this

Pick any one of:

- A rigorous proof that your mass-weighted argument doesn't need cardinality (resolves the ambiguity in your favor).
- A proof of $|F_{\text{useful}}| \ll N_h/h$ under $\sigma$ (closes the real gap).
- A refined claim with the gap explicit (honest partial result).
- A counterexample showing the closure fails (matching T2 UB falls).

Verification artifacts: `verify-R35-codex-adversarial-audit.md` (Codex's independent audit), `researcher-35-pro-A-online-domination-partial-with-critique.md` (Pro A's parallel critique), `current_state.md` (updated state).
