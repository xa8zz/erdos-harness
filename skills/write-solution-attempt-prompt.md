---
name: write-solution-attempt-prompt
description: Compose a fresh-thread researcher prompt that asks the primary model (GPT Pro / DeepThink / Gemini / Codex) for a full unconditional proof or disproof of a problem in this harness — not partial progress. Use when the user says "write me a solution-attempt prompt", "give me a zoom-out prompt for Pro", "draft a fresh prompt with everything we know", "compose a Pro dispatch from current state", "build me the prompt to send to Pro for problem N", or any variant asking for a self-contained brief that hands the full math state to a fresh thread.
---

# Write solution-attempt prompt

## When to use

The user wants a prompt that hands a fresh primary-researcher thread the complete current math state of a problem and asks for a full solution — proof or disproof, no partial progress. This is the harness's default researcher dispatch shape from this point forward. Replaces the older "let's nibble at the gap" follow-up cadence: every dispatch attempts a full solution; the model decides the strategy.

## Purpose

Produce a self-contained brief that:

1. Sets a strict no-internet, novel-creative-proof framing at the top.
2. States the problem in neutral mathematical language.
3. Lists the known proven progress (private + public, no attribution) with the proof method per item.
4. Lists what has been tried and shown to fail, with the specific arithmetic/combinatorial failure mechanism per item.
5. Closes with the "REMEMBER ... non-trivial, creative and novel elements" line.

No suggestion section, no anchor on a target answer, no curator guesses, no session jargon. The model picks the route.

## Instructions

1. **Identify the problem folder.** If unclear, ask. Each problem lives in a top-level directory (e.g. `erdos-872/`, `erdos-500/`) recognized by `current_state.md`.

2. **Recompile the state view first** — never compose from session memory:

   ```bash
   scripts/compile_rounds.py --root <problem>/ --out <problem>/state_compiled.md
   ```

   Then read `<problem>/state_compiled.md` end-to-end. It is the source of truth.

3. **Pick the topic descriptor** for the header. The header reads `... a "<TOPIC>" math problem ...`. Match the topic to the actual problem area: "primitive sets and divisibility games", "additive combinatorics", "graph saturation game", "polynomial recurrences", etc. Don't blindly copy the old "number theory and primitive sets" string unless it actually fits.

4. **Compose using `templates/solution-attempt.md`** as the structural skeleton.

5. **Problem section.** State the math precisely and minimally. No source, no website, no person, no "famous open problem", no "Erdős asked", no status. Just the question.

6. **Known progress section.** Walk the compiled state's Established block. For each entry that materially constrains a solution attempt, write one line: the result, then a method-sketch of how it was proved (which lemma, which identity, which inequality, which numerical certificate). The method sketch is what lets the model rebuild the result inside its own attempt instead of treating it as a black box.

   - Fold private rounds and public literature into one pool. No attribution, no "we", no "the forum showed".
   - Skip Established entries that are purely meta (e.g. "no theorem; model believes X"), purely strategic ("packing lemma is the priority"), or purely about audit findings on prior rounds. Keep only items that constrain or feed a solution attempt.
   - Include lower bounds, upper bounds, structural reductions, exact extremal counts, formal-verification anchors. Skip "this audit said the proof was sound" — the proof is what matters, not the audit.

7. **What does not work section.** Walk the Ruled Out block (and any Refuted-by chains in state_compiled.md). For each, name the approach AND the mechanism — the specific primes, shield set, constants, counterexample, or no-go theorem. Vague "doesn't work" entries are useless; the mechanism is the whole point. Group near-duplicates; if three rounds refuted the same approach for the same reason, write one line.

   - Include cross-family attractor traps documented in the state view.
   - Include known proof-class barriers (Sherali–Adams gap, q-shadow dichotomy, polynomial shield-weight barrier, separator-only closure limitation, etc.) — these tell the model not to spend cycles inside that class.

8. **Closing line, exactly:**

   ```
   REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.
   ```

9. **Pre-flight fact check (mandatory, no exceptions).** Before saving the prompt, audit every load-bearing fact against a primary source. Pro will fixate on any defect and stop engaging with the rest of the brief. Observed failure modes from prior dispatches:

   - Loose paraphrase of a Lean theorem that drops or inverts a hypothesis (e.g. shield-reduction stated as `|A| >= |(n/2, n]| - beta_n(P)` without the Prolonger-move-count condition; refuted at n = 10 with A = {2,3,5,7}, P = {7}).
   - Compressed prose that asserts a false-as-written claim where the underlying proof uses a more careful statement (e.g. "odd-part injection of antichains into antichains of odd integers"; refuted by {12, 30}).
   - Stale numerical values copied from an earlier round / forum post without recomputation (e.g. f(11) = 5 carried from Bloom's 15 Oct 2025 post; sandbox minimax gives f(11) = 6).

   For each numbered fact in the Known progress and What does not work sections, do the following before the prompt ships:

   1. Identify the primary source. Acceptable: a Lean theorem statement (e.g. `erdos-872/aristotle/...`), the verbatim claim/proof body of a saved round doc with confirmed provenance, a sandbox-computed value, a classical theorem cited by name with the standard hypothesis quantifiers preserved.
   2. Pull up the primary source and verify hypotheses, conclusion, and quantifier direction match the prose summary. Direction errors (containment reversed, lower-vs-upper bound flipped, "for some" vs "for all", "every" vs "there exists") are the most common defect — check each explicitly.
   3. For Lean-verified theorems, transcribe the theorem statement with hypotheses, or a faithful symbolic restatement that preserves all preconditions. Do not paraphrase. Loose paraphrase is exactly what gets caught and derails the dispatch.
   4. For exact-value tables (small-n minimax, computed constants, numerical bands), recompute in sandbox or check against a saved round-doc value with confirmed provenance. Do not trust a value that was copied from a prior prompt — defects propagate across prompts undetected until a careful Pro audit.
   5. If a fact cannot be verified inside the dispatch budget, EITHER drop it from the prompt entirely OR include it with an explicit "stated heuristically; not yet verified" marker so Pro doesn't fixate as if it were ground truth. Marked-heuristic facts are fine; silently-loose facts are catastrophic.
   6. Prefer a short prompt where every fact is verified over a long prompt where one fact will derail the dispatch. A 30-line prompt that survives audit beats a 100-line prompt that gets stopped at line 12.

   This step is non-negotiable. If the user is in a hurry, say so and trim — do not skip the audit.

10. **Save the prompt** alongside the response it will produce, per the prompt-saving protocol (CLAUDE.md):

   ```
   <problem>/prompts/researcher-R<NN>-<slug>.md
   ```

   `NN` = next round number. Slug is short and descriptive of the dispatch focus, e.g. `solution-attempt-fresh-state`, `solution-attempt-after-bloom-potential`. Plain markdown body, no YAML front-matter on the prompt file.

11. **Output to user**: the rendered prompt, ready to paste into the target tab. After the user dispatches, save the response via `add-round-doc` with the `prompt:` field in the round doc front-matter pointing to the saved prompt file.

## Strict-rule discipline

- **No session jargon.** "Round N", "Pro #2", "our program", "prior round", "we proved", "audit #N", "Phase X", "Codex", "Claude", "Gemini", "Aristotle", "harness", "the forum" — none of these. Fresh threads have zero context; references like these read as dangling pointers, and the model spends cycles inferring them instead of doing math.
- **No frontier framing.** No "this is a decades-old open problem", "research frontier", "no one has solved this", "this problem has resisted...". Empirically observed: such framing collapses serious 40–60 minute reasoning into 10–25 minute hedged summaries. State the math neutrally.
- **No attribution.** Don't name people, papers, forums, models, or the harness. Folded into "Known progress" without source labels.
- **No Potential Directions / Suggestions section.** The skill explicitly forbids this slot. If a direction is worth flagging, it belongs in Ruled Out (if attempted) or in Known progress (if proven), not as a curator hint.
- **No anchoring.** Don't tell the model what answer you suspect or what method you think is strongest. State the gap. The model picks.
- **Method sketches over result names.** "Shield Reduction (Lean-verified)" is useless; "Shield Reduction: |A| ≥ |U| − β(P), proved by setting B = A ∩ L, observing B is antichain, and union-bounding A ∩ U" is what the model can actually use.
- **Failure mechanisms over outcomes.** "X didn't work" is useless; "X fails because the top εn integers form a legal antichain hitting every prime ≤ εn, giving Σ 1/p ≥ log log εn" is what saves the model from rediscovering the dead end.
- **Length minimalism on commentary, maximum density on facts.** No padding, no synthesis-guesses, no curator narrative. But never compress arithmetic detail in failure mechanisms — that's the load-bearing content.

## Gotchas

- **One false fact derails the whole dispatch.** Pro will fixate on the first defect they catch and stop engaging with the rest of the brief. Three observed instances in the erdos-872 program: (1) the false "odd-part injection of antichains into antichains of odd integers" line — refuted by {12, 30}, caught at R65; (2) the small-n table value f(11) = 5 carried from a forum post — sandbox minimax gives f(11) = 6, caught at R66; (3) the shield-reduction identity stated as `|A| >= |(n/2, n]| - beta_n(P)` without the Prolonger-move-count condition — refuted at n = 10 with A = {2,3,5,7}, P = {7}, caught at R68. In each case, Pro reported the defect and refused to continue. The underlying primary sources (Lean proofs, recurrence values, formal theorems) were correct; only the prose summaries in the prompt were wrong. **The pre-flight fact-check (instruction step 9) is the only thing that catches these. Do not skip it.**
- **A short verified prompt beats a long loose one.** If the audit budget is tight, drop facts rather than ship them unverified. Pro can do more with 30 lines of correct math than with 100 lines containing one trap.
- **Recompile-first is non-negotiable.** A prompt composed from session memory or a stale `state_compiled.md` re-anchors the model on out-of-date facts and burns the dispatch. If `state_compiled.md` is more than one round behind, regenerate before composing.
- **Topic-string sanity check.** The header's `<TOPIC>` is a single short descriptor that gives the model a frame, not a copy of the full problem statement. Adjust per problem; don't reuse "number theory and primitive sets" for a graph-saturation problem.
- **The model decides the route.** From this point forward, dispatches are full-solution attempts, not incremental pushes. The Open Question / next-step section that older prompts had is omitted by design — including it would re-anchor the model on a partial framing.
- **Failure mechanisms cite specifics.** Specific primes, shield sets, constants, counterexample tuples are the difference between a useful Ruled Out entry and a dead one. Pull them straight from the compiled state's Refuted-by lines.
- **Never offer hypothetical grants with ambiguous quantifiers.** A dispatch that says "X (granted at any parameter if you need it)" invites the model to resolve the LITERAL universal statement — observed 2026-07-12: "entry granted at any H(n)->infinity" was diagonalized into a conditional fixed-cap theorem whose hypothesis the program had never proven. If a conditional grant is intended, state its exact quantifier ("IF entry were proven for some single H(n)->infinity, then...") or omit the grant entirely.
- **Save the prompt at compose-time**, before dispatching. If verifier pre-send audits change the prompt, save the post-audit version. The committed prompt is what was actually sent.

## Output format

A markdown prompt body, with no YAML front-matter, ready to paste. Save to `<problem>/prompts/researcher-R<NN>-<slug>.md` and show the user the path plus the full text.

## See also

- `templates/solution-attempt.md` — the structural skeleton.
- `docs/writing-prompts.md` — universal prompting rules (still authoritative on framing and section discipline).
- `skills/add-round-doc` — for saving the response with `prompt:` front-matter pointing back to the saved prompt.
- `skills/commit-round` — per-round commit discipline.

**Terminal-delay degeneracy check (added 2026-07-12).** Any targeted statement whose activation time, stopping times, or ledger contents are chosen by the strategy being quantified over collapses via a terminal-delay witness: the player delays activation until the terminal position, where the quantified condition holds vacuously (observed three times in one night: a post-peel completion statement, its cost-only repair, and the ancestor-harvest inequality — the last two collapse to exact equivalence with the full problem). Before dispatching a targeted statement, check: are all activation times, frozen sets, and weights prescribed IN ADVANCE of the play they constrain, with reinitialization forbidden? If not, either fix the formulation or add the standing caution clause ("if this statement admits a degenerate witness or collapses to the full problem, proving THAT is a valuable resolution") — the clause has repeatedly converted formulation defects into useful rounds.
