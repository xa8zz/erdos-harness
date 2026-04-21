# Paper Shape Proposal

Curator proposal for the public-facing shape. Complements:
- [IDEAL_REORGANIZATION_TEMPLATE.md](IDEAL_REORGANIZATION_TEMPLATE.md) — general template.
- [REPO_VS_PAPER_MATRIX.md](REPO_VS_PAPER_MATRIX.md) — status table per result.

This doc is the concrete spec for "what the paper should look like." It picks a
single shape and assigns each piece of the current draft a destination.

## Governing principle

The paper is a **single self-contained document**. A mathematician who opens the
PDF without ever touching the repo should be able to read what is proved, what
is conditional, and what is formally verified, purely from the pages. The repo
is cited only as an **artifact repository** for reproducibility and formal-
verification support — never as the place where a missing proof lives.

## Final structure — nine sections, three appendices

1. **Introduction**
2. **Notation and setup** (absorbs current Appendix C glossary)
3. **Shield Reduction**
4. **Lower Bounds** (Theorem A, T2; T1 only if repaired)
5. **Exact `5/24` Cover Theorem**
6. **Intermediate Upper Bounds** (`13/36`, `5/16`)
7. **Main Upper Bound Below `0.19n`** (centerpiece)
8. **Obstructions to Further Improvement** (the surviving barriers, tight)
9. **Conclusion**

Appendices:

- **A. Full Technical Proofs** (T2 activation + bookkeeping; restricted
  carrier classes; any deferred Section 7 details; any repaired T1
  construction)
- **B. Numerical Verification** (W_4/2 computation, convergence tables)
- **C. Formal Verification Artifact Map** (exact GitHub paths, Lean files,
  scripts, per-theorem formalization status)

No Section 10 "Formal Verification" as a standalone body section. No
"Structural Negatives" as a main section. No "Restricted Carrier Classes" as a
main section. These dilute the spine.

## Main results — list of five for the introduction

In the order they appear in the intro:

1. **Main upper bound.** `\L(n) ≤ (W_4/2 + o(1))n < 0.19n` (Section 7).
2. **Main lower bound.** `\L(n) ≥ (1/8 - o(1)) n (\log\log n)^2 / \log n` (T2,
   Section 4).
3. **Shield Reduction + Theorem A.** The structural framework + the
   β(P) lower bound for short shield prefixes (Section 3, Section 4).
4. **Exact 5/24 cover.** `\tau(n) = (5/24)n + O(1)` (Section 5).
5. **Intermediate upper bounds.** `\L(n) ≤ (13/36 + o(1))n` and
   `\L(n) ≤ (5/16 + o(1))n` (Section 6).

Five theorems. Clean. No entries for "proof-class barriers" or "restricted
carrier classes" in the headline list — those are real content but not the
paper's novelty spine.

## Per-section mapping from current draft

| Current draft | Destination | Action |
|---|---|---|
| 01 Introduction | §1 Introduction | Rewrite. Lead with 5-theorem list; one paragraph on architecture; single paragraph on formal-verification scope (not a section of its own). |
| 02 Shield Reduction | §3 | Keep. Already theorem-proof style. |
| 03 Lower Bounds | §4 | Rewrite. T2 as theorem with main-text roadmap + Appendix A for full activation-stage wrapper. T1 kept only if the calibrated shield construction can be inlined — otherwise remove from theorem list and replace with a remark noting Theorem A's obstruction role. |
| 04 Exact 5/24 | §5 | Keep. Tighten to fully self-contained. |
| 05 Intermediate upper bounds | §6 | Keep. Modest expansion on 13/36 and 5/16 to full theorem-proof style. |
| 06 Main upper bound | §7 | Centerpiece. Write at theorem-proof level: local density → envelope/inversion → Bonferroni comparison → prime-rounding bridge → main theorem. Each as a numbered theorem with inline proof. Appendix A absorbs any tail-of-proof bookkeeping. |
| 07 Restricted carrier classes | **Appendix A** | Demote to propositions. Include full proofs, including the legality/range handling that the reviewer flagged. |
| 08 Proof-class barriers | §8 (compressed) | Keep only R52 (Sherali-Adams), R53 (q-shadow dichotomy), R56 (separator-only). Cut R44/R46 or fold as one-sentence remarks elsewhere. Total budget for §8: ~3 pages. |
| 09 Structural negatives | Absorbed / cut | Best one or two become remarks inside §4 or §7. Rest cut. |
| 10 Formal verification | One paragraph in §1 + **Appendix C** | No body section. Intro mentions Lean artifact coverage honestly. Appendix C carries the per-theorem table and exact artifact paths. |
| 11 Conclusion | §9 | Tighten to half a page. What is proved; what is open; the current obstruction picture. |
| App A Formalization | **Appendix C** | Merge into artifact map. |
| App B Numerical | **Appendix B** | Keep. |
| App C Glossary | **§2 Notation and setup** | Promote into a body section. |

## Required preconditions for this shape

The shape above is only ship-able if the following are true in the repo. Each
is a yes/no question — the answers determine scope:

1. **Local density law** (`S_K(n^u) ≥ (1-o(1)) n^u / ((h+1) u \log n)`, uniform
   on compact intervals) — rigorously proved, not just sketched. *Current draft
   now carries a proposition-level proof in §7; needs independent audit.*
2. **Envelope / inversion construction** — rigorously proved. *Current draft
   now carries it at proposition level; needs audit.*
3. **Bonferroni-4 prime-sequence comparison (R60 Thm 2.1)** — rigorously
   proved. *Pro audit-confirmed; likely banked.*
4. **Prime-rounding bridge (R60 Thm 4.1)** — rigorously proved. *Pro
   audit-confirmed; likely banked.*
5. **T2 activation wrapper** — writeable at appendix length in finite time.
   *Repo has the pieces across several memos; needs assembly.*
6. **T1 calibrated shield construction** — *unknown whether this exists as a
   complete proof anywhere. The one open verdict.* If no → T1 demoted.
7. **Restricted-class legality handling** (phase-2 repair move, range
   constraints) — writeable. *Needs careful casework; appendix-length.*

## Open decisions before Codex executes the rewrite

1. **Is T1 repairable from existing repo material?** Resolved by a targeted
   repo scan. If yes → keep in Section 4; if no → demote with one-sentence
   remark and drop from theorem list.
2. **Is the local density law proved to the same standard as Shield Reduction?**
   Resolved by audit of §7's current proposition (Pro sandbox check + fresh
   informal verifier pass).
3. **Ship Version A (conditional 0.19n) or Version B-lite (full 0.19n)?**
   Determined by the answer to 2. If 2 is yes → Version B-lite. If 2 is no →
   Version A with 0.19n stated as "assuming the local density hypothesis."

## GitHub / Lean citation policy

Single bibliography entry for the public artifact repository. In the body:

- **Acceptable.** "A Lean formalization of Theorem 3.1 is available in the
  public artifact repository [Artifact]; see Appendix C."
- **Acceptable.** "Numerical evaluation of `W_4` is reproducible from the
  scripts in [Artifact]; see Appendix B."
- **Not acceptable in body.** Any mention of "R57," "R60," "current-state
  note," "the repo note," "audit-verified," "Aristotle," round numbers,
  researcher-NN files, or worktree paths. All such references move to
  Appendix C or are cut entirely.

Exact file paths live only in Appendix C's artifact table.

## Next concrete step

1. Run the targeted repo scan answering the T1 and local-density questions.
2. Pick Version A or Version B-lite based on the scan.
3. Codex executes the rewrite to the shape above.
