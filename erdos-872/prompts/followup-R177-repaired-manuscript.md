Earlier in this conversation you produced a manuscript proving L(n) = o(n) for the divisor-antichain game — the document beginning "# Theorem", with the robust envelope game V_b(N), the a_K/t_K decomposition, self-rough root tags and cones, the root-cone sweep with the drafting inequality, and the density recursion c_b <= (1/2) c_{b+1}.

That manuscript went to an independent referee for a line-by-line adversarial review. Verdict: ACCEPT AFTER MINOR FIXES — no fatal flaw found, and no numerical inequality requires change. The referee's findings and full mandatory-fix list are reproduced verbatim below.

YOUR TASK: produce the complete, final, repaired manuscript.

Requirements:

1. Output the FULL self-contained document — not a diff, not a patch list. A mathematician who has never seen this conversation must be able to read it standalone: state the original game and the theorem, give the formal extensive-form definition of the robust game, all lemmas with complete proofs, the full argument. Keep the existing section and lemma numbering (§1–§6, Lemmas 2.1–2.3, 3.1, inequalities (4.1)–(4.7), §5 recursion) so cross-references remain stable. Plain markdown with LaTeX math; no line numbering.

2. Implement every mandatory fix exactly as specified below. If you believe any referee instruction is mathematically wrong or suboptimal, implement what you believe is correct AND flag the disagreement explicitly in the change log — never deviate silently.

3. No new mathematical claims. No changes to any constant, bound, or inequality beyond what the fixes mandate (the §4.3 count becomes max{b+1, 2} = b+1, using b >= 1). If implementing a fix forces a substantive change anywhere else in the proof, STOP at that point and report the conflict instead of patching silently.

4. End with a CHANGE LOG: one entry per fix — section where implemented, one-line description of the edit.

5. Append "Appendix: analytic inputs in axiom-ready form": restate Lemmas 2.1, 2.2, 2.3 as fully explicit standalone statements — exact hypotheses, exact conclusion, every quantifier written out, every constant named (absolute vs. K-dependent stated), all parameter ranges explicit — suitable for direct transcription into a proof assistant. No prose ellipses.

---

REFEREE FINDINGS AND MANDATORY FIXES (verbatim excerpts follow).

The three defects, in the referee's words:

There are, however, three genuine defects:

1. The robust game is not formally defined because “minimax” and “at any time” do not specify the strategy quantifiers or erasure protocol.
2. A sentence in §4.3 incorrectly counts the number of post-opening Prolonger moves that can precede the first local Shortener response.
3. The stated Shortener strategy is undefined when all root cones are unavailable but legal exceptional vertices remain.

All three are repairable without changing the numerical inequalities. My verdict is therefore **ACCEPT AFTER MINOR FIXES**, subject to the exact repairs listed at the end.

— FIXES 1 AND 2: formal extensive-form definition of the robust game, strategy quantifiers, erasure protocol (referee item (a)) —

The phrase

> “An auxiliary adversary allied with Prolonger may, at any time, erase…”

does not define an extensive-form game. Nor does “the minimax length” specify whether the intended normal-form expression is

[
\inf_{\sigma_S}\sup_{\sigma_P,\sigma_E}\ell
]

or

[
\sup_{\sigma_P,\sigma_E}\inf_{\sigma_S}\ell.
]

The later local-strategy argument requires the former interpretation, or equivalently the backward-induction value of a finite perfect-information game: there must exist one Shortener strategy that works simultaneously against every adaptive Prolonger strategy and every adaptive erasure strategy.

If instead (V_b) were merely a supremum over Prolonger/erasure histories followed by an infimum allowing Shortener to tailor her strategy to that complete history, §4.3 would not follow.

### Required repair

For each fixed downset (D), define a finite extensive-form game in which:

* Prolonger and the erasure actor jointly maximize the number of actual selections.
* Shortener minimizes it.
* The opening consists of at most (b) consecutive legal Prolonger selections; Prolonger explicitly ends the opening phase.
* Before each scheduled player action, the erasure actor may erase any collection of currently unselected live vertices that is an upset in the original (D).
* After the opening, Prolonger may either select or pass.
* Shortener must select whenever a legal vertex remains.
* The game ends exactly when no live legal vertex remains.
* Erasures never revive vertices or undo the blocking effect of an earlier selection.

Multiple erasures between two actual moves can be replaced by their union, which is again an upset. Null erasures can be suppressed. The resulting game tree is finite because every non-pass player action or nontrivial erasure strictly reduces a finite state, and every Prolonger pass is followed either by a Shortener selection or termination.

Then set

[
v_b(D)=\inf_{\sigma_S}\sup_{\sigma_P,\sigma_E}\ell,
\qquad
V_b(N)=\max_{D\subseteq[N]\text{ downset}}v_b(D).
]

Under this formulation, (0\le V_b(N)\le N) is valid.

— FIX 3: the false sentence in §4.3 and the correct count (referee item (b)); the referee's own corrected local-trace construction and global-implementability argument follow, and the repaired §4.3 should match them —

### The false sentence

The manuscript says:

> “After global alternation starts, it can receive at most one further Prolonger selection before Shortener’s first local response.”

This is false for a cone first activated after the opening.

For example, let (b=1), and suppose (C_t) has quotient vertices (2) and (3) still live.

1. Prolonger first enters (C_t) by selecting (2t).
2. Shortener performs a root sweep in another cone.
3. Prolonger returns to the now-active (C_t) and selects (3t).
4. Only now does Shortener make her first selection inside (C_t).

Thus (C_t) received two post-opening Prolonger selections before its first local Shortener response.

This does **not** invalidate the bound, because (b\ge1), and therefore

[
2\le b+1.
]

The correct count is:

* If (C_t) received (k) selections during the global opening, then (k\le b), and at most one further local Prolonger selection can occur before the first local response.
* If it received no opening selection and is first activated later, it can receive at most two Prolonger selections before the first local response: the activation move and one return move.

Hence the number of local opening selections is at most

[
\max{b+1,2}=b+1.
]

### Valid local trace construction

Fix an active cone (C_t). Form its projected local history as follows.

* Retain every actual selection made inside (C_t).
* Project external selections and global erasures to the corresponding quotient-upset erasures.
* Ignore a global pair of turns on which neither player selects inside (C_t).
* If Shortener selects inside (C_t) after a global Prolonger move or pass outside (C_t), insert a local Prolonger pass before that Shortener selection.
* Before the first local Shortener selection, regard all projected Prolonger selections as the opening block.

After Shortener’s first local move, every actual Prolonger selection inside an already active cone receives an immediate Shortener response there. Thus no two later local Prolonger selections occur without an intervening local Shortener selection.

The resulting local history is a legal robust game with at most (b+1) opening selections.

### Global implementability

The local optimal strategies can be run simultaneously.

There is never more than one active cone requiring an immediate local response after a global Prolonger selection: it is the cone in which that selection was made. Other local games can simply remain frozen.

When Prolonger acts outside all active cones, Shortener may:

* sweep a root;
* advance one active local game, treating the external move as a local pass; or
* after the strategy is completed as discussed under item (h), select an exceptional outside vertex.

There is therefore no synchronization conflict among the local strategies.

External erasure histories may be correlated across cones, but each local strategy is constructed to handle every adaptive upset-erasure history. Independence of the erasures is unnecessary.

— FIX 4: strategy completeness on exceptional-only positions (referee item (h)) —

The proposed Shortener strategy is not defined on every possible position.

Suppose:

* no live unprocessed root remains;
* every active local cone has no legal prescribed move or there are no active cones;
* at least one legal vertex remains outside all root cones.

The response rule only says that Shortener “continues the active local games.” It does not tell her what to do when no such move exists.

This situation is possible. For example, (D) may consist entirely of exceptional small vertices, so (\mathcal R=\varnothing), while legal vertices remain after the opening move.

### Required repair

Add:

> If no root sweep is available and no active local strategy supplies a legal move, Shortener selects an arbitrary legal vertex outside all root cones.

This repair does not affect the estimate, because every such selected vertex lies in

[
D\setminus\bigcup_{t\in\mathcal R}C_t
\subseteq\mathcal E_N.
]

After this addition, the three classes are exhaustive and disjoint:

1. Every Prolonger selection in a root cone makes that cone active, and all later selections there belong to class 1.
2. A root fired by Shortener belongs to a cone that was not active and can never subsequently become active.
3. Every remaining selection is outside all root cones and hence belongs to class 3.

A vertex may be arithmetically exceptional while lying inside an active cone, but it is still assigned only to class 1. The term (|\mathcal E_N|) is used only for selections outside the union of root cones, so there is no double counting.

With the strategy completed, (4.7) follows.

— FIX 5: explicit declarations (referee item (i)) —

The following should be stated explicitly.

### 1. Erasure protocol

Erasures affect only availability. They do not remove a previous selection from the antichain, undo its deletions or revive vertices.

The timing and information structure must be specified as discussed under item (a).

### 2. End of the opening

Because Prolonger may use “up to” (b) moves, the rules must include an explicit decision by Prolonger to end the opening phase.

### 3. Game termination

The game ends when no live legal vertex remains. Prolonger cannot prevent termination by repeatedly passing: each pass is followed by a Shortener selection unless the game has already ended.

Shortener has no pass option, although the added exceptional fallback makes her strategy total whenever a move exists.

### 4. Downsets and (1)

Every nonempty divisibility downset contains (1). This is intended.

The original game does not contain (1), but in the comparison with (D=[n]), the first opening move (x\ge2) kills (1). Thereafter the positions agree exactly.

The empty downset, if allowed, has value zero and is harmless.

### 5. Tie-breaking

The decreasing-(\nu_t) root order should use an arbitrary fixed deterministic tie-breaking rule. Only the weak inequality between weights is needed.

### 6. Integer (A)

The statement

[
\nu_t>A\implies q_t=\lfloor\nu_t\rfloor\ge A
]

uses that (A) is an integer. Otherwise, for example, (A=2.5) and (\nu_t=2.6) give (q_t=2<A).

Declare (A\in\mathbb N).

### 7. Fixed (\gamma)

Section 5 should state that (\gamma\in(0,1)) is held fixed while (N\to\infty) and (A\to\infty).

### 8. Total Shortener strategy

The exceptional-vertex fallback described under item (h) must be included.

— REFEREE VERDICT AND CONSOLIDATED FIX LIST —

The required fixes are:

1. Give a formal extensive-form definition of the robust game and specify the required
   [
   \inf_{\sigma_S}\sup_{\sigma_P,\sigma_E}
   ]
   strategy quantifiers.
2. State precisely when erasures occur and that they do not undo previous selections.
3. Replace the false sentence in §4.3 by the correct bound
   [
   \max{b+1,2}=b+1.
   ]
4. Add the exceptional-vertex fallback to make Shortener’s strategy defined on every nonterminal position.
5. Declare (A) integral, fix (\gamma\in(0,1)), and specify deterministic tie-breaking and termination.

Once those changes are made, the manuscript gives a coherent unconditional proof of

[
L(n)=o(n).
]
