---
id: R21-codex-T2-audit-demotion
type: diagnostic
date: 2026-04-19
intent: >
  Re-audit T2 (Omega(n(log log n)^2/log n) lower bound); determine whether
  the existing writeup is rigorous or only plausible.
predecessors: []
action:
  kind: standalone
claim: >
  T2 demoted from rigorous to plausible. The current writeup has an
  order-sensitivity flaw: Maker-Breaker lemmas implicitly assume Maker
  (Prolonger) moves after Breaker, but the actual game has Maker moving
  first. Exact standalone lemma needed to restore T2.
---

# Round 21 Codex — T2 audit: demoted from rigorous to plausible

## Context

User dispatched Codex to re-audit T2 (the $\Omega(n(\log\log n)^2/\log n)$ lower bound story). Codex reports that T2 is not obviously false, but the current repo writeup does not rigorously prove it. The key flaw is order-sensitivity: the Maker-Breaker lemmas in the Round 13 second-order lower bound proof implicitly treat Maker (Prolonger) as moving AFTER Breaker (Shortener), when in the actual alternating game Maker moves first. Codex is now working on writing the exact standalone lemma statement needed to restore T2 to rigorous status.

## Codex's audit

I did. My current read is:

**T2 is not obviously false, but the repo does not currently prove it rigorously.** I would downgrade it from "rigorous" to "plausible pending a standalone Maker-Breaker lemma."

**Main findings**

1. The raw counting layer looks fine. The target family size
\[
|\mathcal T|\gg_\delta \frac{n(\log\log n)^2}{\log n}
\]
in [researcher-13-pro-fresh-second-order-lower-bound.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-13-pro-fresh-second-order-lower-bound.md:52)–[73] looks standard, and the activation-supply estimate in [117]–[137] also looks believable.

2. The real gap is the same in both game-theoretic lemmas: the proof argues as if Prolonger can choose a response *after seeing* Shortener's deletion in that round.
In [researcher-13-pro-fresh-second-order-lower-bound.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-13-pro-fresh-second-order-lower-bound.md:105)–[107], Lemma 1 says:
"if Breaker deletes … Maker can capture … thus the potential never decreases."
But Maker moves first in the actual alternating game. Unlike the T1 max-degree lemma, there is no order-sensitive monotonicity argument here.

3. The same issue appears again in Lemma 2. In [researcher-13-pro-fresh-second-order-lower-bound.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-13-pro-fresh-second-order-lower-bound.md:158)–[164], the writeup again uses "If Shortener deletes … Prolonger can capture … therefore the potential never decreases." That is a heuristic unless converted into a Maker-first statement.

**Why this matters**

T1 survives this audit. Its capture phase in [researcher-13-pro2-odd-fan-strengthened.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-13-pro2-odd-fan-strengthened.md:255) has the right online structure: Maker takes a max-degree right vertex first, then Breaker's right-vertex deletion is bounded by that already-chosen degree.

T2 does not yet have that kind of order-aware lemma written down. The later "constant fix" notes also don't close it; they explicitly admit the subgame/induction step is not fully proved in [phase4/t2_constant_fix.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_constant_fix.md:90)–[96] and [phase4/t2_constant_fix_8x.md](/Users/omisverycool/erdos-harness/erdos-872/phase4/t2_constant_fix_8x.md:16).

**Bottom line**

I do not currently see a counterexample to the T2 theorem itself. But I also do not think the present repo writeup proves it. The right status is:

- T1: rigorous.
- T2: plausible, but still pending a real online Maker-first proof of the weighted pair-capture lemma and the two-layer fiber lemma.

If you want, I can next write the exact standalone lemma statement that would upgrade T2 back to "proved," so we can test just that core game instead of the whole number-theoretic wrapper.
