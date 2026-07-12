---
id: R71-edwin-k5-safe-edge-email
type: diagnostic
date: 2026-07-09
intent: >
  Preserve Edwin Rosero's computational audit of the conditional T2 safe-edge
  hypothesis and its questions about selector quantification and residual K5 fibers.
predecessors: [R21-codex-T2-embedding-verification, R22-codex-T2-activation-audit, R57-codex-T2-graph-reachable]
action:
  kind: extends
  target: R57-codex-T2-graph-reachable
claim: >
  The correspondence reports an exhaustive local K5 q-fiber obstruction to
  per-round Q monotonicity, a certified initial-state activation obstruction
  for a concrete arithmetic witness, and no proof that the obstructing fiber
  is reachable under a selector satisfying the restricted T2 hypothesis.
confidence_at_time: medium
strategy_dependence: T2-selector-dependent
---

Dear Buddhdev,

I have been working through your manuscript on Erdős #872 and ran an extensive computational study of the residual slot game and the T2 activation graph. I have a clarification question and what I believe is a candidate piece of the missing K_5-free invariant, with a verified concrete instance. I would value your read on the details below.

Short version
=============

Two computational results, both manuscript-faithful:

1. Local K_5 obstruction (rank-3 residual game). I synthesized exhaustive finite safety-game strategies for the unit-weight residual slot game and verified that on an isolated K_5 unit q-fiber (five vertices, all ten edges live, all Φ = 1, S = 0), no per-round Q-monotone Maker strategy exists. Shortener can force a state with three live Φ = 8 edges, after which every Maker move admits a worst-case full-round Q-delta of -8. Line-by-line verification against your Appendix A.1 rules is at docs/v4_k5_walkthrough.md ([https://github.com/walkthroughwonder/erdos-872/blob/main/docs/v4_k5_walkthrough.md](https://github.com/walkthroughwonder/erdos-872/blob/main/docs/v4_k5_walkthrough.md)). The reproducer is at src/v4_k5_bad_path.py ([https://github.com/walkthroughwonder/erdos-872/blob/main/src/v4_k5_bad_path.py](https://github.com/walkthroughwonder/erdos-872/blob/main/src/v4_k5_bad_path.py)). For comparison, the same synthesizer passes exhaustively on the K_4 q-fiber over {13, 17, 19, 23} from your Proposition A.2.

2. Initial-state K_5 activation exclusion. Using your Proposition A.6 activation potential, I verified that the ten K_5 pair activations (101, 103, 107, 109, 113) are all unsafe as a first activation move in the full activation graph at a concrete instance (n = 10^20, δ = 1/8, Y = 316, 64 small primes, 2016 pair edges). The structural reason is that the small-prime vertex 3 carries a star of token weight far larger than the gain from claiming any near-100 pair. Shortener's modeled vertex-3 deletion certifies a worst-case loss of at least 4.37 × 10^16 against a Maker gain of at most 1.22 × 10^16, giving a certified margin of at least 3.15 × 10^16 for the least-bad pair (101, 103). Loss-to-gain ratios for all ten K_5 first moves range between 3.57 and 3.87. Details at docs/k5_safe_edge_certification.md ([https://github.com/walkthroughwonder/erdos-872/blob/main/docs/k5_safe_edge_certification.md](https://github.com/walkthroughwonder/erdos-872/blob/main/docs/k5_safe_edge_certification.md)).

The arithmetic incidence is intact (q = 4806305873305829 lies in B_{a,c} for all ten K_5 pairs), so the obstruction is genuinely about the activation graph's star structure at small primes, not about token availability.

The question
============

The initial-state result strongly suggests but does not prove that the T2 activation strategy structurally avoids isolated K_5 unit q-fibers in residual states. The missing extension is to activation paths that first secure pairs incident to small primes such as 3, 5, 7 (neutralizing their stars by capturing the vertices) before attempting the K_5 pairs.

I did implement a bounded certified multi-step Maker-only search using the same Rosser-Schoenfeld one-sided bounds. At the initial state, (3, 5) is the only pair edge whose safety I could certify against every modeled Breaker reply, with a certified margin of 3.73 × 10^15 (worst reply: deletion of vertex 7). After (3, 5), no second move certifies safe under the same conservative bounds, and the best-first search exhausts after two expansions. This is not a proof that no multi-step counterexample exists (the certification is deliberately conservative, so many indeterminate moves may be genuinely safe), but it does show that the most natural neutralization attempt (start with a small-prime pair) does not obviously extend, and it suggests the vertex-star obstruction may persist beyond the initial state. Details at docs/multi_step_activation_findings.md ([https://github.com/walkthroughwonder/erdos-872/blob/main/docs/multi_step_activation_findings.md](https://github.com/walkthroughwonder/erdos-872/blob/main/docs/multi_step_activation_findings.md)).

I would like to know:

1. Is there an intended K_5-free (or bounded-rank, bounded-degree, or sparsity) invariant for residual q-fibers generated by your T2 activation strategy, in the sense of Definition 4.5? If yes, the vertex-3-star-deletion mechanism in my checker may be exactly the right structural witness; please confirm or correct.

2. Definition 4.5's reachability is restricted to "states actually generated by the activation and residual strategies." Proposition A.6 says Prolonger chooses "a safe edge supplied by that hypothesis," which leaves the selector existential. Is the intended reading a canonical selector, a selector chosen to make Proposition A.9 work, every selector that always chooses a safe edge, or every legal play consistent with the divisibility game? Your Proposition A.2 already flags the legal-play vs. specific-strategy distinction for the K_4 case.

3. If there is no such invariant intended and Definition 4.5 admits K_5 q-fibers under some readings, then my rank-3 result (item 1 above) is a gap in Appendix A.3 for the residual game. Is there a global inter-fiber compensation in your A.9 argument I am missing?

What I am confident about
=========================

- The K_5 local rank-3 obstruction is exhaustive (a finite safety-game synthesizer ran to completion, not a sampled bound).
- The initial-state activation exclusion uses one-sided certifying bounds (Maker gain upper-bounded by Rosser-Schoenfeld, Breaker loss lower-bounded), so it does not depend on exact large-interval prime counting.
- I verified the algebra on a reduced exact-count instance (n = 10^8, Y = 31, K_5-like primes {13, 17, 19, 23, 29}), which shows the same first-move failure pattern.

What I am not confident about
=============================

- The multi-step search I ran is certified but bounded and conservative. It does not prove structural exclusion, only that the natural greedy neutralization does not certify beyond one step under Rosser-Schoenfeld bounds.
- The activation potential normalization I used (Proposition A.6's Q_t = S_t + Σ_e φ_t(e) with φ ∈ {w/8, w/4, w/2, w}) might differ from your intended convention if I misread the bookkeeping. Corrections welcome.

Where this now lives publicly
=============================

Two updates since my earlier messages:

- A Lean 4 statement file for problem #872 was merged into google-deepmind/formal-conjectures ([https://github.com/google-deepmind/formal-conjectures](https://github.com/google-deepmind/formal-conjectures)) as PR #4226 ([https://github.com/google-deepmind/formal-conjectures/pull/4226](https://github.com/google-deepmind/formal-conjectures/pull/4226)) on 2026-07-02. See FormalConjectures/ErdosProblems/872.lean ([https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/ErdosProblems/872.lean](https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/ErdosProblems/872.lean)). It contains only public, established statements. Your conditional variant is not in it, since your manuscript is not public and the citation could not be evaluated by the maintainers.
- A summary of the computational findings above was posted to the [erdosproblems.com](http://erdosproblems.com/) forum thread for #872 ([https://www.erdosproblems.com/forum/thread/872](https://www.erdosproblems.com/forum/thread/872)) on 2026-07-08. The post explicitly notes that the conditional c_δ · n · (log log n)² / log n bound was not stated formally because the manuscript is not public.

If at some point you would like your conditional variant stated formally, adding it as a follow-up PR would be trivial on my end, either once you confirm you want that or once the manuscript becomes public. No pressure either way; I simply wanted you to know the option is open and that the attribution question is entirely in your hands.

Repository
==========

Everything is at [https://github.com/walkthroughwonder/erdos-872](https://github.com/walkthroughwonder/erdos-872) (MIT, public). Key documents:

- docs/v4_findings.md ([https://github.com/walkthroughwonder/erdos-872/blob/main/docs/v4_findings.md](https://github.com/walkthroughwonder/erdos-872/blob/main/docs/v4_findings.md)): full v4 result, including a v3 retraction I posted earlier.
- docs/buddhdev_setup_audit.md ([https://github.com/walkthroughwonder/erdos-872/blob/main/docs/buddhdev_setup_audit.md](https://github.com/walkthroughwonder/erdos-872/blob/main/docs/buddhdev_setup_audit.md)): my reading of A.1, A.3, A.9, Definition 4.5; corrections welcome.
- docs/v4_k5_walkthrough.md ([https://github.com/walkthroughwonder/erdos-872/blob/main/docs/v4_k5_walkthrough.md](https://github.com/walkthroughwonder/erdos-872/blob/main/docs/v4_k5_walkthrough.md)): line-by-line residual K_5 forced-loss verification.
- docs/t2_reachability_proof.md ([https://github.com/walkthroughwonder/erdos-872/blob/main/docs/t2_reachability_proof.md](https://github.com/walkthroughwonder/erdos-872/blob/main/docs/t2_reachability_proof.md)): the conditional incidence lemma (arithmetic witness).
- docs/k5_safe_edge_certification.md ([https://github.com/walkthroughwonder/erdos-872/blob/main/docs/k5_safe_edge_certification.md](https://github.com/walkthroughwonder/erdos-872/blob/main/docs/k5_safe_edge_certification.md)): initial-state K_5 unsafety, full activation graph.
- docs/k5_activation_exclusion_argument.md ([https://github.com/walkthroughwonder/erdos-872/blob/main/docs/k5_activation_exclusion_argument.md](https://github.com/walkthroughwonder/erdos-872/blob/main/docs/k5_activation_exclusion_argument.md)): the structural exclusion at the initial state.
- docs/multi_step_activation_findings.md ([https://github.com/walkthroughwonder/erdos-872/blob/main/docs/multi_step_activation_findings.md](https://github.com/walkthroughwonder/erdos-872/blob/main/docs/multi_step_activation_findings.md)): the bounded multi-step Maker-only certified safety search (NEG within budget, new).

I used AI assistance (Anthropic Claude and OpenAI GPT) for code generation and strategy synthesis, with manual verification against your manuscript.

Thanks for your time. Even a one-line pointer to the intended invariant or selector would be very helpful, and I would be happy to extend the multi-step activation checker in any direction you suggest.

Best,
Edwin Rosero (Ero23)
