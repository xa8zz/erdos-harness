---
id: V177-fable-diff-audit
type: verification
date: 2026-07-23
intent: >
  Line-by-line diff-audit of the repaired manuscript against the referee's
  five mandatory fixes and against the superseded original, checking fix
  fidelity and the absence of any change to a constant, bound, or inequality.
predecessors: [R177-repaired-manuscript, V176-referee-audit]
action:
  kind: confirms
  target: R177-repaired-manuscript
claim: >
  The repaired manuscript implements all five referee-mandated fixes
  faithfully (extensive-form game with inf-sup strategy quantifiers and full
  erasure protocol; the corrected two-case local opening count
  max{b+1,2}=b+1 for b>=1 with the projected local-trace construction; the
  exceptional-vertex fallback with a totality justification; all parameter
  and protocol declarations), and no constant, exponent, bound shape, or
  inequality anywhere differs from the original: Lemmas 2.1-2.3 (including
  kappa = c0 log c0 - c0 + 1, c0 = 1/log 2), (2.3), (3.1)-(3.12), Lemma 3.1,
  (4.1)-(4.7) including the halving weight bound (N + N/A + (b+1)N^gamma/
  delta)/2, (5.1)-(5.2) with delta = A^-2, K = ceil(e^{A^3}), and the finite
  iteration to c_1 = 0 are all display-identical up to formatting.
verifiers_at_time:
  - [fable-R177-linewise-diff-audit, agrees]
confidence_at_time: high
strategy_dependence: independent
---

# Diff-audit of the repaired manuscript (V177)

Scope: the full repaired manuscript body (researcher-R177-repaired-manuscript.md,
1221 lines) read end to end, checked against (a) the referee's mandatory-fix
list and per-item required repairs (fable/audit-R176-referee-raw.md), and
(b) the superseded original (fable/R176-response-raw.md) for drift in any
constant, bound, or inequality.

## Fix fidelity

1. **Fix 1 (formal game + quantifiers) — §1, PASS.** The protocol enumerates
   every bullet of the referee's required repair: opening of at most b
   consecutive Prolonger selections with an explicit end declaration; erasure
   opportunity before every scheduled action, erasing the live part of an
   adaptively chosen divisibility-upset U of D; post-opening Prolonger
   select-or-pass; Shortener must-select; termination exactly when no live
   legal vertex remains; erasures never undo selections, blocking, or deaths;
   union normalization of consecutive erasures; finiteness of the game tree.
   The value is defined v_b(D) = inf over Shortener strategies of sup over
   (Prolonger, erasure) strategy pairs, with the backward-induction
   equivalence stated — the exact quantifier order the referee mandated, and
   the one the local-strategy argument requires.
2. **Fix 2 (erasure protocol) — §1 items 3 and 5, PASS.** Timing (before
   every scheduled action), adaptivity, availability-only semantics.
3. **Fix 3 (§4.3 count) — PASS.** The false one-move sentence is replaced by
   the referee's two-case count (k <= b opening selections plus at most one
   pre-response selection; or activation plus one return = 2), concluding
   max{b+1,2} = b+1 under the standing hypothesis b >= 1. The five-step
   projected local trace and the simultaneous-implementability paragraph
   match the referee's own valid reconstruction, with one improvement
   (projected erasures carried forward across ignored turn pairs).
4. **Fix 4 (strategy totality) — §4 response rule + §4.4, PASS.** The
   exceptional fallback is present with a justification that the three rules
   cover every nonterminal position (unprocessed cone with a live vertex has
   a live root by §4.1; active cone with a live vertex has a nonterminal
   local game; cleared cones are dead). Fallback selections are charged to
   |E_N| via (3.7); the three move classes are argued exhaustive and
   disjoint with the referee's no-double-counting caveat included.
5. **Fix 5 (declarations) — PASS.** A in N with A >= 2, used exactly where
   q_t = floor(nu_t) >= A needs integrality (3.8); gamma in (0,1) fixed in
   §2.3 and held fixed through both limit passages in §5; deterministic
   tie-breaking declared with the note that only weak weight inequalities
   are used; treatment of 1 and of the empty downset; Shortener no-pass;
   opening-end declaration; termination and no-stalling-by-passing.

## Inequality inventory (drift check vs. the original)

Display-by-display comparison found **zero drift**: Lemma 2.1 statement and
Selberg proof (R = X^{1/6}, diagonalization to 1/G, G >> log z_0, error
X^{1/3}(log X)^C with generic absolute C); Lemma 2.2 (a_i <= K^{2^i - 1},
Omega >= loglog X/log 2 - O_K(1), moment bound with h(p^e) = (z-1)z^{e-1},
kappa = c0 log c0 - c0 + 1 > 0 at c0 = 1/log 2); Lemma 2.3 (delta +
C(1+log A)/log K, the three-range proof including the a > sqrt(N/K)
endgame); the jump condition P^-(t) > K a_K(x); self-roughness P^-(t) >
K delta nu_t with H = K delta > 1; Lemma 3.1 and its proof; cone system
(3.6)-(3.11) (sum q_t <= N, |R| <= N/A, sum nu_t <= N + N/A); projection
(3.12) with q = r/(r,t); drafting (4.1) W_A <= W_C + (b+1)nu_max and the
halving (4.2) W_A <= (N + N/A + (b+1)N^gamma/delta)/2; (4.4)-(4.5) via
M_{b+1}(A); master (4.7); (5.1); the parameter path delta = A^-2,
K = ceil(e^{A^3}) with K delta > 1; M_{b+1}(A) -> c_{b+1}; (5.2)
c_b <= c_{b+1}/2; c_b <= 1; the finite-chain iteration c_1 <= 2^{-r} with
r -> infinity taken last; L(n) <= V_1(n) via the first-move-kills-1
alignment. The change log's five entries are accurate; no referee
disagreement is flagged and none was found; §6 is a restatement of the
original's packet-resolution discussion with no new claims.

## Appendix assessment

The axiom-ready appendix is correct and strictly more explicit than the
draft axioms in fable/LEAN-PLAN.md §1; it supersedes them (named constants
C_rough, C_dense(K), C_exc; epsilon-N_0 quantification of the o(N) term;
K > 2 real; A >= 2; the a_K(1) edge handled by placing 1 in E_N). LEAN-PLAN
carries a dated reconciliation note.

## Two formalization nits (non-defects; no effect on any bound)

1. **Response-rule precedence.** The four Shortener rules should be read
   "apply the first rule that supplies a move" — the totality note under the
   fallback already implies this parse, but a literal reading of the
   "Otherwise" chain leaves the case "Prolonger just selected in an active
   cone whose local game thereby ended" to be routed to the sweep branch
   implicitly. Canonical resolution: state rule precedence explicitly.
   Class accounting is unaffected (the cone's selections were already
   counted by its local value; the sweep is class 2).
2. **Local-trace pass insertion before the first local Shortener move.**
   Step 4 of the trace construction inserts a local Prolonger pass before a
   Shortener selection; before Shortener's FIRST local selection this
   inserted pass is not a legal robust-game event (after the opening ends,
   Shortener is scheduled first) and is also unnecessary — the opening-end
   declaration covers that case. Canonical resolution: insert passes only
   after the first local Shortener selection. The referee's own
   reconstruction shares this presentational wrinkle.

Both are exactly the class of item the Lean tier-0 skeleton
(fable/LEAN-PLAN.md) is designed to force precise; they are recorded in its
pitfall checklist.

## Provenance note

The manuscript entered the repository during a curator/Codex commit race:
commit fe4ccf8 (message about LEAN-PLAN) also carried the concurrently
staged manuscript and a state recompile; commit 7f679cb is a one-line
whitespace fix. Content verified against the author's clipboard copy:
byte-equivalent after blank-line normalization plus one trailing UI
artifact line.

## Verdict

**CONFIRM.** The repaired manuscript is a faithful implementation of the
referee's accept-after-minor-fixes program with no mathematical drift. With
this, the manuscript stands as the current best form of the claimed proof of
L(n) = o(n). Remaining gates tracked outside this doc: cross-family blind
referee, Lean tier-0/tier-1 per fable/LEAN-PLAN.md, and the pre-publication
collision harvest.
