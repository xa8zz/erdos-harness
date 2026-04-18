# Strategic Audit #4 — unattributed

**Source:** Audit returned without model attribution. Style suggests Claude-thinking or similar (longer reasoning, precise distinctions between "what obstructions bound" vs "what L(n) does," specific literature callout with confidence levels).
**Prompt sent:** `prompts/verify-strategic-01-directions.md`.
**Extracted:** 2026-04-18.
**Verdict:** "Drift" confirmed *with productive reframe*: the recurring log(1/α) across three proofs is the framework correctly computing its own ceiling, not a series of failures. Same top pick as GPT-thinking (packing lemma) but specifically anchored to Ford 2008. Adds the single most underweighted angle: **explicit realization of the log(1/α) ceiling as a Shortener strategy**.

---

**On Q1 — your own assessment.**

Mostly yes, with one reframe. You've been working in obstruction-space; the obstructions are pointing at sublinear, which means they're not wasted, but the program has extended the framework past the point of diminishing returns. The meaningful signal is this: *the same log(1/α) constant has now appeared in Theorem A, survived vaccination via the fixed-prefix sharpening, and survived Round 5's σ→1 construction via the cost-shift audit*. Three independent formulations returning the same number is not a series of framework failures — it's the framework correctly computing its own ceiling. The shield approach has a genuine log(1/α)-type limit, and the empirical ψ_n(α) convergence confirms it from the other side.

Where I'll push back harder than you did: the real misallocation isn't that you proved Theorem A and the Vaccinated variant — those are real contributions that redirect future effort. The misallocation is the Round 5 + sharper-invariants effort, which was an attempt to escape a ceiling that three earlier proofs had already characterized. By the time σ̃ and H_D were formalized as "the conjecture in coordinates-the-audit-likes," you were recomputing a known obstruction in a new basis.

Note, though, a constraint on the reframe: the obstructions bound *what shield-style arguments can prove*, not L(n) itself. "Shield-only can't prove linearity" is not the same as "L(n) is sublinear." The shield obstructions point toward sublinearity only in combination with the Phase 1 stress-tests and the offline ψ_n(α) data. Don't overload the obstructions with a claim they don't make on their own.

**On Q2 — ranking the listed open directions by bound-producing potential.**

1. **Packing lemma.** The only listed direction whose success would produce a new bound on L(n) (specifically, the upper bound O(n/log n) matching the lower). Everything else on your list is meta-structure or verification.
2. **Primorial-anchor recursion.** The PV data (6 = p_2#, 30 = p_3#, rotating structure through n≈48) is a strong empirical pattern the program has observed but not formalized. If optimal play decomposes recursively through primorial scales, there's a self-similarity that could close the constant — or show it doesn't converge.
3. **Harmonic-weighted Prolonger at n ∈ [10⁵, 10⁷].** Verification rather than progress. Worth the compute, but don't budget it as a bound path.
4. **Round 5 repair.** The audit was correct on the substantive point — it's cost-shifting, not cost-reduction. Repairing the ρ schedule doesn't change the aggregate obstruction budget. Very low priority.
5. **Sharper invariants (σ̃, H_D).** Further obstruction-space, now in the fifth iteration. Do not pursue. Declare the ceiling understood and move on.

**On Q3 — missing angles.**

A few that I don't see reflected in your list and that I'd take seriously:

*Amortized / potential-function argument for O(n/log n).* Assign φ(A) so that Shortener reduces φ by at least 1 per move and Prolonger increases it by at most log n per move; total game length ≤ n · log n / (net per-move rate). The natural candidate is a Mertens-adjusted weight over still-legal moves. I'd bet the packing lemma is a potential argument wearing different clothes, and writing both out may reveal the same proof.

*Ford's anatomy-of-integers machinery.* Ford's 2008 *Annals* paper on "integers with a divisor in a given interval" is the correct sieve-theoretic technology for the question "given a set P of upper-half integers, how constrained is its prime-divisor structure?" — which is exactly the packing lemma's question. Dickman–de Bruijn and Buchstab are one-parameter specializations of this framework, and you've said the program consulted those "once but not deeply." Ford's theorem itself is the right level of generality. This is the single biggest literature gap in the program as you've described it.

*Lichtman's proof of the Erdős primitive set conjecture.* Lichtman (around 2022–2023, I'm not certain of the exact year — worth a targeted search) proved ∑_{a∈A} 1/(a log a) ≤ ∑_p 1/(p log p) for primitive A. The weight 1/(a log a) is precisely the Mertens-adjusted primitive-set weight that the harmonic Prolonger is implicitly optimizing. The proof technique (local-to-global sieve on primitive sets) is a direct specialization target — and a reason to expect the harmonic Prolonger is close to an optimal Prolonger up to constants.

*Maker–Breaker pairing, outside the shield framework.* You flagged this in your question and you're right to. Beck-style pairing strategies for Shortener (pair each Prolonger move with a designated Shortener response that kills it) bypass β(P) entirely. The relevant technical question: does the bipartite divisibility graph between upper and lower halves admit a matching-like structure that Shortener can exploit? The Hefetz–Krivelevich–Stojaković–Szabó book (*Positional Games*, 2014) is the right handbook.

*LP / fractional-relaxation upper bound.* The offline ψ_n(α) maps you've computed are already one-sided LP values. The corresponding zero-sum LP (Prolonger picks a distribution over antichains, Shortener picks a distribution over kills) has a value, and that value upper-bounds L(n)/n. I don't see this computed anywhere in your summary.

*Direct inversion of obstructions into Shortener strategies.* Every shield-style lower bound hits a log(1/α) ceiling. Empirically ψ_n(α) → (1/2)log(1/α). These are dual facts — the obstruction is telling you that some Shortener strategy realizes the ceiling. Constructing such a strategy explicitly would be a new upper bound, probably beating 0.416n materially. Your program has proved the ceiling exists from the lower side three times. It has not tried to realize it from the upper side once.

Angles I'd *not* pursue: the container method (wrong combinatorial shape — antichains don't form hypergraph-independent sets cleanly enough), probabilistic random primitive subsets (the game is adversarial, randomization won't be tight), and general combinatorial game theory on posets (mostly Nim-value / Sprague–Grundy flavor, doesn't address L(n) asymptotics).

**On Q4 — literature pointers.**

Direct hits (high confidence):
- Ford, "The distribution of integers with a divisor in a given interval" (*Annals*, 2008). This is the specialized sieve technology the packing lemma wants.
- Erdős–Sárközy–Szemerédi on primitive sets (1960s). Classical background; the extremal density results are directly relevant.
- Hefetz–Krivelevich–Stojaković–Szabó, *Positional Games* (Oberwolfach Seminars, 2014). The Maker–Breaker handbook.

Probable hits (flagging lower confidence):
- Lichtman's proof of the Erdős primitive set conjecture (≈2022–2023). Search "Lichtman primitive set Erdős proof" to verify publication details — my memory of the exact year is imprecise.
- Lichtman–Pomerance follow-ups on primitive-set analytic structure.
- Pollack and Pomerance on the anatomy of multiplication tables / Erdős multiplication table problem — related combinatorial flavor, might not specialize.
- Saturation-game graph literature (Faudree et al., Patkós, Kinnersley) for the poset analogue.

I'm not asserting all of these will specialize cleanly. Ford 2008 and Lichtman are the two I'd check first and expect real payoff from.

**On Q5 — top pick.**

**Packing lemma, reframed as a Ford-type divisor-interval result.**

Reasoning: it's the unique listed direction whose success produces a new bound on L(n) (the conjecturally sharp upper bound O(n/log n)), the existing machinery has already identified it as the needed step, and the sieve-theoretic framework that's designed to answer it (Ford 2008) has not been deeply used by the program. The expected payoff is: either the lemma is provable via anatomy-of-integers machinery and you close the gap, or it turns out to fail quantitatively and the hypothesis L(n) = Θ(n/log n) is in question — in which case you've learned something major either way.

If I had a second pick: *realize the log(1/α) ceiling as an explicit Shortener strategy.* The empirical ψ_n convergence is telling you a Shortener strategy exists that achieves it. Constructing it gives a new upper bound and likely settles the question jointly with the packing lemma. This is the most underweighted direction in your current program.

If I had a third pick, distantly: formalize the primorial-anchor recursion as a framework, not to prove a bound but to generate the right conjecture about the leading constant.

**One process note.** You've now run three iterations of the shield framework and each has returned the same log(1/α) ceiling through a different lens. Treat that as a solved subproblem and stop extending the framework. The next round of primary research should be building *downstream* of "L(n) = Θ(n/log n), coefficient related to the e^{-1} barrier" rather than trying to break it. A lot of the Round 5 + sharper-invariants work reads as an attempt to falsify a fact the earlier obstruction theorems already established.
