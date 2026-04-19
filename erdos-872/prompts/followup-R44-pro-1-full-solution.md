Excellent — the lifted harmonic measure plus strong-freshness plus local-usefulness is exactly the right framework. Please formalize this into a complete rigorous proof and extend to a self-contained full upper-bound theorem for $L(n)$.

Specifically:

**1. Formalize the estimate.** State (SFLU-E) and its proof with full rigor:
- Write out the precise definitions of "strongly fresh," "locally useful," and $\mathcal E_{k,\theta}^{\text{sf,loc}}$. In particular, state whether strong freshness excludes Prolonger-scored pre-kills (this is the load-bearing hypothesis distinguishing your setup from the weak-freshness common-core counterexample).
- Tighten each step: the density-increment extraction (1), the lifted-measure comparison (2), and the first-activation thinning (3). For (3) especially, give the exact dynamic argument that charged certificate shadows are disjoint in the lifted harmonic sense — why can Prolonger not activate multiple exceptional shields sharing the same coface-lift before $\sigma^\star$ resolves any of them?

**2. Assemble the per-rank upper bound.** Combine (SFLU-E) with the R35 state inequality
$$\mu(\operatorname{Cl}_h) \ll \frac{h}{\log h} \mu(F_{\text{useful}}) + \frac{N_h}{\log(h/\log h)}$$
and the sharpened dense-packet projection at $\theta \asymp 1/\log h$. Derive the per-rank closed-family mass bound $\mu(\operatorname{Cl}_h) \ll ?$ fully explicitly.

**3. Integer-scale summation.** Sum over dyadic rank windows in the central regime $h \sim \log\log n$ to get an explicit upper bound $L(n) \ll n \cdot g(n)$. Write $g(n)$ exactly. Confirm whether this is $n/\log\log\log n$, or tighter, or something weaker.

**4. State the theorem.** Write out the final result with all hypotheses and the exact rate. Confirm whether it resolves $L(n) = o(n)$ and, if so, give the sharp rate together with what the matching lower bound is and whether the asymptotic order is now determined.

If any step still has a genuine gap after you formalize, state the gap cleanly with its specific failure mechanism rather than patching around it — a precise concession is more useful than a plausible-looking patched argument with the same structural weakness that (SFLU-E) was meant to close.
