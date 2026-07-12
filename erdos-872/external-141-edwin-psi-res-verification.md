---
id: R141-edwin-psi-res-finite-verification
type: verification
date: 2026-07-12
intent: >
  Preserve Edwin Rosero's independent adversarial finite verification of
  the residual-stage potential Psi_res (the manuscript's Prop A.9 repair
  of the safe-edge auxiliary game) in the unconditional rank-three
  lower-bound manuscript.
predecessors: [R71-edwin-k5-safe-edge-email, R75-unconditional-rank-three-paper-integration]
action:
  kind: confirms
  target: R73-unconditional-T2-exact-move-potential
claim: >
  Two independent finite checks of the residual-stage potential pass.
  (1) Direct replay of the original K5-fiber counterexample (the
  K4-fiber-over-q state) with the old unscored edge deletion replaced by
  its closest legal reply (an exact target play): Psi_res is
  nondecreasing at every step (0.75, 3.25, 3.75, 6, 6, 6, 6), terminal
  T_res = 6 against the target bound M/8 = 0.75 — the old obstruction is
  localized exactly to the unscored-deletion rule, as the manuscript
  claims. (2) Adversarial BFS over all reachable Prolonger-turn states
  from small initial q-fibers — single fiber K2..K5 (up to 6834 states),
  P5/C5/S5/S6 (up to 302), K4-e and K5-matching(2) (up to 1715), and
  multi-fiber 2xK3, K3+K4, 2xK4, 3xK3 (up to 130428) — finds
  min over states of [max over Prolonger moves of min over Shortener
  replies of Psi_res'] - Psi_res = 0, i.e. ZERO decreases across roughly
  200000 reachable states, with equality attained exactly at the
  selector's exact-target reply (coefficient-1 removal plus T_res
  increment), confirming the bank is tightly scaled with no slack.
  Scope: residual stage only — the activation-stage potential Psi_act
  (Prop A.6, via the Prop A.3 selector and the Prop A.7 deletion budget)
  and the asymptotic wrapper are NOT checked; the correspondent has a
  Prop A.3 selector encoded and offers to run the A.6 check next, and
  offers a standard-library Python reproducer (psi_res.py,
  psi_res_multifiber.py, replay_k5.py).
implications:
  - First independent external verification of the Psi_res repair; the
    manuscript's residual stage survives the exact attack that killed
    its predecessor.
  - Remaining verification boundary for the public note is Psi_act
    (Prop A.6) plus the asymptotic wrapper; a finite BFS on the Prop A.3
    selector is tractable and offered.
verifiers_at_time:
  - [edwin-finite-bfs, agrees]
confidence_at_time: high
strategy_dependence: independent
---

Just got this email, dunno how relevant it is or if we’re past this or not:

“Hi Om,

Congratulations on the log log n improvement, and thank you for the acknowledgment. I read the revised manuscript (commit 018a346), particularly Appendix A, and then ran an adversarial finite check on the new Psi_res potential (Prop A.9). Writing up what I found in case any of it is useful.

Direct replay of the original K_5 counterexample

I encoded the K_4-fiber-over-q state from Prop A.2 and re-played the exact sequence that broke the old auxiliary Q, substituting for the old unscored edge deletion its closest legal reply in the actual residual game (an exact target play). Psi_res is nondecreasing at every step: 0.75, 3.25, 3.75, 6, 6, 6, 6. Terminal T_res = 6, M/8 = 0.75, so the target bound T_res >= M/8 holds with room. The obstruction is exactly localized to the auxiliary rule permitting unscored deletion, as the manuscript claims.

Adversarial BFS on reachable residual states

Enumerated all reachable Prolonger-turn states from a variety of small initial q-fibers (single-fiber and multi-fiber). At each state, computed

delta = max over Prolonger moves ( min over Shortener replies Psi_res(s') ) − Psi_res(s)

A.9 predicts delta >= 0. Results:

Single fiber:
K_2 through K_5: up to 6834 P-turn states, min delta 0
P_5, C_5, S_5, S_6: up to 302 states, min delta 0
K_4 - e, K_5 - matching(2): up to 1715 states, min delta 0
Multi-fiber:
2x K_3, K_3 + K_4, 2x K_4, 3x K_3: up to 130428 P-turn states, min delta 0

Zero decreases across roughly 200000 reachable states. The min-delta being exactly 0 across the board is expected: A.9's selector reaches equality when Shortener replies with an exact target (coefficient 1 removed + T_res += 1). The bank is scaled tightly, no slack.

Scope

This checks only the residual-stage potential Psi_res on finite instances. It does not verify the activation-stage potential Psi_act (Prop A.6), which relies on the selector from Prop A.3 and the deletion budget from Prop A.7, nor the asymptotic wrapper. Prop A.3's inequality holds by an explicit case analysis in the paper, so a similar finite BFS on Psi_act should be tractable. I have a Prop A.3 selector encoded but did not run it before writing this. Happy to continue with A.6 next if useful.

Reproducer

Three files, Python 3, standard library only:
- psi_res.py, single-fiber BFS
- psi_res_multifiber.py, multi-fiber BFS
- replay_k5.py, direct replay of the original K_5 attack

I can send the folder as a tarball if you want to run it independently. Also glad to fold it into an appendix or a linked note if it is useful for the manuscript's verification-boundary section.

Best,
Edwin”
