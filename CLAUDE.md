<!-- REPO_TREE_BEGIN -->
```
.claude/
  settings.json
.gitignore
.mcp.json
AGENTS.md
CLAUDE.md
README.md
chat-export/
  export.sh
  extractors/
    _shared.js
    chatgpt.js
    claude.js
    erdosproblems.js
    gemini.js
  format.py
  submit.sh
docs/
  plans/
    2026-04-18-deepthink-protocol-implementation.md
    2026-04-18-fan-hierarchy-implementation.md
    2026-04-18-shortener-constants-implementation.md
    2026-04-18-sparse-subset-implementation.md
erdos-872/
  _forum_transcript.md
  aristotle/
    shield_reduction.tex
    shield_reduction_result.tar.gz
    shortener_13_36.tex
    shortener_13_36_v2.tex
    shortener_13_36_v2_out.tar.gz
    shortener_5_16.tex
    shortener_5_16_out.tar.gz
    tau_5_24.tex
    tau_5_24_result.tar.gz
    theorem_A_result.tar.gz
    theorem_A_shield_lower_bound.tex
  audit-R37-external-synthesis.md
  chatgpt.md
  claude-chat.md
  current_state.md
  direct-On-over-logn-attempt-2026-04-18.md
  followup-12-pro-closeout-response.md
  ford-integration-audit.md
  gemini.md
  matching-T2-self-attempt-2026-04-18.md
  matching-T2-upper-bound-attempt-2026-04-18.md
  phase0/
    CODEX_TASK.md
    compute_psi.py
    psi_grid.csv
    report.md
    test_compute_psi.py
  phase1/
    CODEX_FOLLOWUP_L40.md
    CODEX_TASK.md
    L40_diagnostic.md
    compute_sublinear.py
    exact_minimax.csv
    exact_minimax_v2.py
    report.md
    stress_grid.csv
    test_engine.py
    test_exact_minimax_v2.py
  phase2/
    CODEX_TASK_dynamical_probe.md
    CODEX_TASK_shortener_stress.md
    dynamical_probe/
      ANALYSIS.md
      ground_truth.md
      results.csv
      results_summary.csv
      run_all.py
      simulator.py
      test_simulator.py
    shortener_stress.csv
    shortener_stress.py
    shortener_stress_summary.md
    test_shortener_stress.py
  phase3/
    CODEX_TASK_deepthink_protocol.md
    CODEX_TASK_fan_hierarchy_audit.md
    CODEX_TASK_reachability_verification.md
    CODEX_TASK_shortener_constants.md
    CODEX_TASK_sparse_subset.md
    O_n_log_n_target_refuted_codex_report.md
    S_y_dynamic_negative_codex_report.md
    deepthink_protocol.csv
    deepthink_protocol.py
    deepthink_protocol_summary.md
    fan_hierarchy.py
    fan_hierarchy_codex_report.md
    fan_hierarchy_probeA.csv
    fan_hierarchy_probeB.csv
    fan_hierarchy_probeC.csv
    fan_hierarchy_summary.md
    literature_survey_codex_report.md
    residual_width_refuted_codex_handoff.md
    shortener_constants.csv
    shortener_constants.py
    shortener_constants_codex_report.md
    shortener_constants_summary.md
    sparse_subset.csv
    sparse_subset.py
    sparse_subset_summary.md
    test_deepthink_protocol.py
    test_fan_hierarchy.py
    test_shortener_constants.py
    test_sparse_subset.py
  phase4/
    analysis.md
    claude_parallel_session_handoff.md
    fan_prolonger.py
    fast_sim.py
    findings.md
    freshness_toy.py
    freshness_toy_multiplicity_results.csv
    max_antichain.py
    multirank_attempt.py
    multirank_ford_conjecture.md
    residual.py
    shortener_duel.py
    sim.py
    sim2.py
    sim3.py
    submarkov_1196_adaptation_report.md
    t2_constant_fix.md
    t2_constant_fix_8x.md
    t2_maker_first_lemmas.md
    test_transversal_small_h.py
    trajectory.py
    transversal_small_h.py
    transversal_small_h_amortization_audit.py
    transversal_small_h_amortization_audit_results.csv
    transversal_small_h_empirical.md
    transversal_small_h_g_plot.png
    transversal_small_h_results.csv
    transversal_small_h_sigma_vs_cascade_results.csv
    transversal_small_h_strategy.py
    transversal_small_h_strategy_results.csv
  process.md
  prompts/
    audit-13-A-rank3-vs-loglog.md
    audit-13-B-simplex-obstruction.md
    audit-13-pro2-continuation.md
    audit-13-reachability-claim.md
    audit-14-pro-01-log-density.md
    audit-14-pro-02-probabilistic-sieve.md
    audit-15-pro-prime-count-refinement.md
    canonical-prompt.md
    codex-R37-cheap-verification.md
    codex-close-L-sublinear.md
    codex-continuation-fiber-collapse-strategy.md
    codex-extract-optimal-shortener-strategy.md
    codex-followup-close-matching-T2.md
    codex-followup-unify-reductions.md
    codex-generalize-R23-refutation.md
    codex-new-submarkov-adaptation.md
    codex-prolonger-counter-construction-search.md
    codex-sigma-vs-simplex-star-cascade.md
    codex-small-h-transversal-empirical.md
    followup-12-pro-closeout.md
    followup-3-codex-R38-multiplicity-bound.md
    followup-all-R37-freshness-lemma.md
    followup-all-R38-full-game-gap.md
    followup-codex-R35-closure-gap.md
    followup-fresh-pro-R33-close.md
    followup-fresh-pro-R35-closure-gap.md
    followup-fresh-pro-bernoulli-update.md
    followup-pro-A-R33-close.md
    followup-pro-A-R35-online-amortization.md
    followup-pro-A-defect-budget-push.md
    followup-pro-A-resilience-lemma-close.md
    followup-pro-A-scale-local-transversal.md
    followup-pro-A-star-breaker-push.md
    fresh-pro-resilience-lemma.md
    researcher-01-directed.md
    researcher-01.md
    researcher-02-open-exploration.md
    researcher-02-phase0-psi-mapping.md
    researcher-02-shortener-construction.md
    researcher-04-vaccinated-shield-narrow.md
    researcher-05-packing-lemma.md
    researcher-05-shortener-ceiling.md
    researcher-06-shortener-direct.md
    researcher-07-shortener-13-36-closeout.md
    researcher-08-open-solution.md
    researcher-09-carrier-capacity.md
    researcher-10-dynamical-carrier.md
    researcher-11-omega-strategy-prove.md
    researcher-12-synthesis-open.md
    researcher-18-ford-bandwise-upper-bound.md
    round13-A-pro-extend.md
    round13-B-deepthink-open.md
    round13-C-gemini-contrarian.md
    round13-Pro2-continuation.md
    round13-deepthink-multiplier-lock-followup.md
    round13-deepthink-reachability-followup-v2.md
    round13-deepthink-reachability-followup.md
    round13-matching-upper-bound-followup.md
    round13-pro-reachability-followup.md
    round13-pro2-upper-half-rigorize.md
    round13-upper-half-cross-family.md
    round14-entropy-compression.md
    round14-probabilistic-shortener.md
    round14-shortener-compression-focused-as-dispatched.md
    round14-shortener-compression-focused.md
    round15-shortener-push-past-022.md
    round16-matching-sublinear-upper-bound.md
    round16-multi-rank-shielding-attack.md
    round18-direct-n-over-log-n-upper-bound.md
    round19-matching-T2-upper-bound.md
    round19-residual-width-lemma.md
    round19-slow-growth-matching-upper-bound.md
    round19-two-core-reduction-lemma.md
    round19B-Sy-focused-matching-T2.md
    round20-two-shadow-control.md
    round22-A-neutral-sublinear.md
    round22-B-directed-multiplicative-closure.md
    round22-C-contrarian-linear.md
    round23-pro-bernoulli-closure-attack.md
    verify-R35-closure-candidate.md
    verify-open-02-post-13-36.md
    verify-postresp-01.md
    verify-postresp-02-shortener.md
    verify-postresp-04-sigma-one.md
    verify-postresp-06-carrier-recycling.md
    verify-postresp-06-shortener-13-36.md
    verify-postresp-07-13-36-truncation.md
    verify-postresp-08-5-16.md
    verify-postresp-11-combined.md
    verify-strategic-01-directions.md
  researcher-01-directed-response.md
  researcher-01-open-response.md
  researcher-02-shortener-response.md
  researcher-03-vaccinated-shield.md
  researcher-04-sigma-one-construction.md
  researcher-05-carrier-recycling.md
  researcher-05-shortener-13-36.md
  researcher-06-direct-sieve-refutation.md
  researcher-07-13-36-closeout.md
  researcher-08-5-16-improvement.md
  researcher-09-carrier-capacity-refutation.md
  researcher-10-omega-strategy.md
  researcher-11-deepthink-response.md
  researcher-11-pro-response.md
  researcher-12-claude-response.md
  researcher-12-deepthink-response.md
  researcher-12-pro-response.md
  researcher-13-deepthink-critique-response.md
  researcher-13-deepthink-full-resolution-claim.md
  researcher-13-deepthink-full-resolution-v2.md
  researcher-13-deepthink-linear-claim-v2.md
  researcher-13-deepthink-linear-claim.md
  researcher-13-deepthink-loglog-tight.md
  researcher-13-deepthink-matching-upper-claim.md
  researcher-13-deepthink-multiplier-lock-concession.md
  researcher-13-deepthink-mwu-upperbound.md
  researcher-13-deepthink-upper-half-verification-2.md
  researcher-13-deepthink-upper-half-verification.md
  researcher-13-fresh-dichotomy-lean-sublinear.md
  researcher-13-fresh-dichotomy-unresolved-rigorous.md
  researcher-13-fresh-dichotomy-unresolved-slowgrowth.md
  researcher-13-fresh-divisor-shadow-hierarchy.md
  researcher-13-fresh-fixed-rank-hierarchy.md
  researcher-13-fresh-theta-n-block-shielding.md
  researcher-13-post-probeB-conservative-1.md
  researcher-13-post-probeB-conservative-2.md
  researcher-13-post-probeB-grindmode-shortener.md
  researcher-13-pro-A-obstruction.md
  researcher-13-pro-fresh-second-order-lower-bound.md
  researcher-13-pro-matching-obstruction-dense-pair.md
  researcher-13-pro-matching-obstruction-triple-fan.md
  researcher-13-pro-rank3-extension.md
  researcher-13-pro-reachability-shortener-prevents.md
  researcher-13-pro-sparse-subset-closeout.md
  researcher-13-pro-upper-half-fan-lower-bound.md
  researcher-13-pro1-upper-half-audit.md
  researcher-13-pro2-continuation-response.md
  researcher-13-pro2-odd-fan-strengthened.md
  researcher-13-sparse-subset-closeout-2.md
  researcher-14-claude-cot-summaries.md
  researcher-14-pro-shortener-upperbound-01-log-density.md
  researcher-14-pro-shortener-upperbound-02-probabilistic-sieve.md
  researcher-14-pro-shortener-upperbound-03-bonferroni-2.md
  researcher-14-pro-shortener-upperbound-04-infinity-bonferroni-flawed.md
  researcher-14-pro-shortener-upperbound-05-randomized-martingale-handwavy.md
  researcher-14-pro-shortener-upperbound-06-mwu-revisits-refuted.md
  researcher-15-codex-S_y-static-certificate.md
  researcher-15-pro-shortener-upperbound-prime-count-refinement.md
  researcher-16-codex-S_y-dynamic-negative.md
  researcher-17-codex-negative-on-separate-rank-fan-route.md
  researcher-18-codex-slow-growth-reduction.md
  researcher-18-pro-O-n-log-n-refuted-via-T1.md
  researcher-18-pro-matching-sublinear-reduction-lemma.md
  researcher-18-pro-multi-rank-coupling-refuted.md
  researcher-19-codex-matching-T2-closeout-handoff.md
  researcher-19-codex-matching-T2-closeout.md
  researcher-19-pro-lemma-A-disproved.md
  researcher-20-codex-residual-width-framework-refuted.md
  researcher-20-pro-matching-T2-negative-confirmation.md
  researcher-20-pro-two-shadow-disproof.md
  researcher-21-codex-T2-audit-demotion.md
  researcher-21-codex-T2-embedding-verification.md
  researcher-21-codex-T2-maker-first-repair.md
  researcher-21-codex-strategic-synthesis.md
  researcher-22-codex-T2-activation-audit.md
  researcher-22-pro-certificate-family-gap-isolated.md
  researcher-22-pro-defect-budget-invariant.md
  researcher-22-pro-dyadic-fiber-collapse.md
  researcher-22-pro-fresh-canonical-confirmation.md
  researcher-23-codex-ford-route-correction.md
  researcher-23-pro-bernoulli-star-refuted.md
  researcher-24-codex-band-local-closure-explosion.md
  researcher-25-codex-directed-rank3-budget.md
  researcher-26-codex-online-rank3-race-formulation.md
  researcher-27-codex-fiber-collapse-partial.md
  researcher-27-codex-submarkov-1196-adaptation.md
  researcher-28-codex-R23-generalization.md
  researcher-29-codex-small-h-empirical-supports-sublinear.md
  researcher-29-pro-A-followup-transversal-static-cover-sharpened.md
  researcher-30-pro-canonical-confirmation-2.md
  researcher-31-codex-prolonger-counter-search.md
  researcher-31-codex-summary.md
  researcher-32-codex-optimal-shortener-strategy.md
  researcher-32-codex-sigma-rule-summary.md
  researcher-32-pro-A-simplex-star-refutation.md
  researcher-33-codex-sigma-vs-cascade.md
  researcher-33-fresh-pro-defect-layer-counting-lemma.md
  researcher-33-pro-A-thickness-dichotomy.md
  researcher-34-codex-resilience-online-promotion.md
  researcher-35-codex-L-sublinear-proof.md
  researcher-35-fresh-pro-arithmetic-closure-candidate.md
  researcher-35-pro-A-dyadic-state-estimate-closed.md
  researcher-35-pro-A-online-domination-partial-with-critique.md
  researcher-36-codex-r35-online-amortization-followup.md
  researcher-36-fresh-pro-closure-retraction.md
  researcher-36-pro-A-freshness-lemma-partial.md
  researcher-37-codex-freshness-bounded-depth-partial.md
  researcher-37-codex-freshness-toy-counterexample.md
  researcher-37-fresh-pro-one-cylinder-closure.md
  researcher-37-pro-A-per-score-projection-reduction.md
  researcher-38-codex-first-appearance-reduction.md
  researcher-38-codex-pair-first-multiplicity-partial.md
  researcher-38-pro-ford-refutation-independent-plus-chain-generated.md
  researcher-38-pro-pair-first-charging-plus-ford-refutation.md
  researcher-39-codex-pair-multiplicity-scaling.md
  verify-R35-codex-adversarial-audit.md
  verify-R35-codex-followup-dynamic-gap.md
  verify-R35-codex-star-cylinder-lower-defect-probe.md
  verify-R37-codex-freshness-sharpness-and-high-window-counterexample.md
  verify-aristotle-01-theorem-A.md
  verify-aristotle-03-5-16.md
  verify-open-02-audit1.md
  verify-open-02-audit2.md
  verify-open-02-audit3.md
  verify-postresp-01-chatgpt.md
  verify-postresp-01-claude.md
  verify-postresp-01-gemini.md
  verify-postresp-02-audit1.md
  verify-postresp-03-claude.md
  verify-postresp-04-claude.md
  verify-postresp-04-gemini.md
  verify-postresp-04-gpt-thinking.md
  verify-postresp-06-13-36-chatgpt.md
  verify-postresp-06-13-36-claude.md
  verify-postresp-06-13-36-gemini.md
  verify-postresp-06-carrier-chatgpt.md
  verify-postresp-06-carrier-claude.md
  verify-postresp-06-carrier-gemini.md
  verify-postresp-06-chatgpt-t14.md
  verify-postresp-07-audit1.md
  verify-postresp-07-audit2.md
  verify-postresp-07-audit3.md
  verify-postresp-10-audit-universal-block-product.md
  verify-postresp-11-claude-thinking.md
  verify-postresp-11-claude.md
  verify-postresp-11-deepthink.md
  verify-postresp-11-gemini-triple.md
  verify-postresp-11-gpt-thinking.md
  verify-postresp-11-pro-audit.md
  verify-postresp-12-on-Falpha-friendly.md
  verify-postresp-12-on-deepthink-C.md
  verify-postresp-12-pro-on-Falpha-A.md
  verify-postresp-12-pro-on-Falpha-B.md
  verify-postresp-12-pro-on-deepthink-A.md
  verify-postresp-12-pro-on-deepthink-B.md
  verify-postresp-13-pro2-continuation-audit-1.md
  verify-postresp-13-pro2-continuation-audit-2.md
  verify-postresp-13-pro2-continuation-audit-3.md
  verify-postresp-13-rank3-audit-2.md
  verify-postresp-13-rank3-audit-4.md
  verify-postresp-13-rank3-audit-6.md
  verify-postresp-13-simplex-audit-1.md
  verify-postresp-13-simplex-audit-3.md
  verify-postresp-13-simplex-audit-5.md
  verify-postresp-14-pro01-log-density-chatgpt.md
  verify-postresp-14-pro01-log-density-claude.md
  verify-postresp-14-pro01-log-density-gemini.md
  verify-postresp-14-pro02-probabilistic-sieve-chatgpt.md
  verify-postresp-14-pro02-probabilistic-sieve-claude.md
  verify-postresp-14-pro02-probabilistic-sieve-gemini.md
  verify-postresp-15-pro-prime-count-refinement-audit1.md
  verify-postresp-15-pro-prime-count-refinement-audit2.md
  verify-postresp-15-pro-prime-count-refinement-audit3-codex.md
  verify-postresp-18-claude-T1-T2-audit.md
  verify-postresp-followup12-essentially-sound.md
  verify-postresp-followup12-online-patch-needed.md
  verify-postresp-followup12-overlap-fatal.md
  verify-researcher-09-gemini-refutation.md
  verify-strategic-01-audit2.md
  verify-strategic-01-audit4.md
  verify-strategic-01-deepthink.md
  verify-strategic-01-gpt-thinking.md
mcp-servers/
  deep-think/
    .gitignore
    README.md
    requirements.txt
    run.sh
    server.py
    smoke_test.sh
prompts/
  templates/
    informal-audit.md
safari-llm/
  js/
    chatgpt/
      export.js
      model_get.js
      model_set.js
      open.js
      send.js
      threads.js
      wait.js
      wait_probe.js
    claude/
      export.js
      model_get.js
      model_set.js
      open.js
      send.js
      threads.js
      wait.js
      wait_probe.js
    gemini/
      export.js
      model_get.js
      model_set.js
      open.js
      send.js
      threads.js
      wait.js
      wait_probe.js
  safari-llm
  safari-llm.md
scripts/
  update-tree.sh
```
<!-- REPO_TREE_END -->

# Research Harness — Operating Manual

This repo is a harness for collaborative problem-solving with a primary reasoning model (currently GPT Pro with extended thinking), where a second-tier assistant (Claude, i.e. you) handles all synthesis, curation, and cross-model verification so the primary can focus purely on the math.

## Your role

You are the **synthesis / curation agent**. The primary model is smarter than you, Gemini, the other Claude tabs, or the user at the actual reasoning. Your job is:

1. **Synthesize** — keep the primary model's context clean. Feed distilled state, not raw exposition.
2. **Curate** — track what's rigorously proven vs. strong numerical evidence vs. ruled out.
3. **Verify** — every substantive output from the primary model gets independently audited by at least two of {Claude (new tab), Gemini, a separate GPT-thinking tab}.
4. **Iterate** — fold verifier feedback back into the next primary-model prompt.

You do **not** try to solve the problem yourself. You will be wrong about the math. Your value is process discipline — neutral framing, complete state snapshots, adversarial verification, and clean synthesis.

## Per-problem folder layout

Each problem lives in its own top-level directory:

```
<problem-slug>/                   e.g. erdos-872/
  current_state.md                Problem statement, literature, proven facts,
                                  numerical evidence, ruled-out approaches,
                                  and the current open question.
  chatgpt.md                      Full dump of the primary research conversation.
  claude-chat.md                  Full dump of the Claude verifier conversation.
  gemini.md                       Full dump of the Gemini verifier conversation.
  researcher-NN.md                Individual verbatim outputs from the primary
                                  model (when you want to reference a specific
                                  round without re-reading the whole thread).
  verify-claude-NN.md             Claude's audit of researcher-NN.
  verify-gemini-NN.md             Gemini's audit of researcher-NN.
  verify-gpt-NN.md                Separate GPT-thinking tab's audit.
  prompts/
    researcher-NN.md              Exact prompt sent to the primary.
    verify-NN.md                  Exact verifier prompt (one template, sent to
                                  all three).
```

`current_state.md` is the source of truth. Update it the moment a new result is proven or disproven.

**Never name a file exactly `CLAUDE.md` or `claude.md` inside a project.** Claude Code auto-loads `CLAUDE.md` case-insensitively and will interpret the file's contents as instructions. Use `claude-chat.md`, `claude-notes.md`, etc.

## Tools

### `chat-export/` — live conversation I/O

Exports any conversation on chatgpt.com, claude.ai, gemini.google.com, or erdosproblems.com to clean markdown with LaTeX preserved, and submits markdown prompts to the same sites.

```bash
# One-time Chrome setup: chrome://inspect/#remote-debugging → accept dialog
agent-browser tab list                             # find tab IDs

# Export a conversation:
./chat-export/export.sh t9 <slug>/chatgpt.md       # tab t9 → file

# Submit a prompt file to a chat tab:
./chat-export/submit.sh t22 <slug>/prompts/round-01.md
```

Provider auto-detected from URL. Each extractor uses semantic DOM selectors (KaTeX `<annotation>`, MathJax `<script type="math/tex">`) so it works across different conversations on each site, not just one.

**Submit-side gotchas** (learned the hard way).

1. ChatGPT/Claude/Gemini inputs look like `<textarea>` in the DOM but the real editable element is a sibling `<div contenteditable="true">` (ProseMirror / Tiptap / Quill). Setting `.value` on the textarea doesn't update React state — the Send button stays disabled.

2. `document.execCommand('insertText', false, text)` works on **ChatGPT** (ProseMirror) but fails on:
   - **Claude** (Tiptap) — raced / truncated; sometimes only a single stray character landed.
   - **Gemini** (Quill, `.ql-editor`) — truncated at ~343 chars on long content.

3. **The reliable cross-editor approach** is to find the textbox by its accessibility ref from `agent-browser snapshot -i` and use `agent-browser fill @<ref> "<text>"`. This handles all three editors uniformly. `submit.sh` uses this path.

4. After filling, there's a ~1s UI race before the Send button activates. `submit.sh` sleeps before clicking.

5. Send button aria-labels differ by provider — **ChatGPT: `Send prompt`**, **Claude / Gemini: `Send message`**. Match exactly (not regex) to avoid hitting "Send voice message" or similar unrelated buttons.

6. Shell-wise, `agent-browser fill "@$REF" "$(cat file.md)"` handles the content correctly — no need to base64-encode when using the `fill` command.

7. **Context drift**: submitting into a Claude or Gemini tab that's parked at `claude.ai/new` or the Gemini landing page will create a *fresh* conversation. If you need prior context preserved, first navigate the tab to the specific conversation URL.

### `agent-browser`

General Chrome-via-CDP automation CLI. `agent-browser skills get core --full` for reference.

### Context sources

- `erdosproblems.com/<N>` and `/forum/thread/<N>` — problem pages and live discussion
- arXiv, Google Scholar — literature
- OEIS — integer-sequence lookup when relevant

## The research loop

Only the primary model does research. All other tabs (Claude, Gemini, GPT-thinking) are informal verifiers. Aristotle (Harmonic's Lean 4 theorem prover) is the *formal* verifier. Verify *before* sending a prompt and *after* receiving an output.

One round:

1. **Refresh state.** Re-export any conversation that may have advanced. Scan forum/literature for anything new. Fold into `current_state.md`.
2. **Pre-send verification.** Before sending anything to the primary, paste the current state (or the drafted researcher prompt) into at least two informal-verifier tabs. Ask plainly: *does the logic hold, are the facts as stated true, are the ruled-out items really ruled out, are we missing any direction?* Save replies to `verify-presend-NN-<model>.md`. Incorporate substantive catches.
3. **Build the researcher prompt** (template below). Send to the primary model.
4. **Extract output** → save to the conversation dump and into `researcher-NN.md`.
5. **Post-response informal verification.** Paste the new output verbatim into at least two informal-verifier tabs. Ask plainly: *what's the most recent claim? does the logic check out? where's the weakest link? what directions are worth pursuing?* Save to `verify-postresp-NN-<model>.md`.
6. **Formal verification (mandatory for any new concrete private-research finding that could advance the problem).** For each claim the primary presents as a theorem or lemma, run it through Aristotle (see below). Save results to `verify-aristotle-NN.md`.
7. **Synthesize.** Promote / demote claims in `current_state.md`. Only promote to `Established` if (a) at least two informal verifiers agree it's sound AND (b) Aristotle either formalized it or failed for a known structural reason (e.g., requires heavy Mathlib machinery) — never promote past a real logical gap Aristotle exposed.
8. Loop.

Informal verifier prompts can be loose at both stages — a plain "here's the latest state / here's the latest output, does it check out, anything I'm missing?" is usually enough. The formal adversarial template below is for when you want a sharper audit.

### Aristotle formal verifier

Purpose-built for Lean 4 — tries to formally prove a theorem statement, or fill in `sorry` gaps in a skeleton proof. A successful Aristotle run is a stronger signal than any human or LLM audit; a failed run with a clear gap is where real logical holes live.

```bash
# One-time: pip3 install --user --break-system-packages aristotlelib
# Key + PATH are in the gitignored .env at repo root:
source .env

# Formalize a LaTeX / prose proof
aristotle formalize <path/to/claim.tex> --wait --destination <out.tar.gz>

# Fill sorries in an existing Lean project
aristotle submit "Fill in all sorries" --project-dir <lean-proj> --wait

# Poll / manage async jobs
aristotle list
aristotle result <job-id>
aristotle cancel <job-id>
```

**When to invoke.**
- Any time the primary returns something it calls a theorem or lemma.
- Any time a structural reduction is claimed ("this reduces to proving X").
- After every round's synthesis, if a new candidate result is being promoted to `Established`.

**Invocation pattern per claim.**
1. Write the claim as a short LaTeX or Lean snippet (just the statement + proof sketch).
2. `aristotle formalize` it.
3. If it returns clean Lean 4 code with no `sorry`, treat as formally verified — strong promote signal.
4. If it leaves `sorry` gaps, look at *where*. A gap in a deep-library invocation is usually fine (Mathlib coverage limit); a gap at the core of the argument is a real logical hole.
5. Record outcome in `verify-aristotle-NN.md` with the job id and Lean output (or link to the downloaded tarball).

Do not skip Aristotle for "obvious" claims. The Shield Reduction Theorem, the $5/24$ cover — both look obvious and both are prime candidates for quick formalization wins.

## Researcher prompt template

This is the prompt for the primary (GPT Pro extended). Tight, neutral, structured. Every researcher prompt follows this shape.

```
This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

## Problem

<Statement in neutral mathematical language. Do NOT mention its source, paper,
website, status, history, or that anyone believes anything about it. Just
state the math.>

## What's Established

<Bulleted list of rigorously proven facts. Fold in everything proven across
prior private rounds AND any public literature into one pool. Do NOT
distinguish "we proved this" from "forum proved this" from "paper X proved
this" — treat it as one body of known results.>

- <Statement of fact 1>
- <Statement of fact 2>

## What's Been Ruled Out

<Approaches tried and shown to fail. One line each. This saves the researcher
from rediscovering dead ends.>

- <Approach>: <why it fails>

## Numerical / Computational Evidence

<Exact small-n values, ratio tables, extrapolation trajectories, LP optima.
Kept separate from "Established" because this is data, not proof.>

## The Open Question

<The specific, finite thing we want pushed this round. One sentence.>

## Potential Directions

These are suggestions only. Use your own assessment to determine which
could best build upon the current findings. You are free to pursue any
angle, including paths not listed here, if you see a cleaner one.

1. <Suggestion — include only if cross-validated (see framing rules below)>
2. <Suggestion — include only if cross-validated>
```

**Do not add an "Output format" / "Requested output" / "Output expectations" section.** Pro decides what is worth returning. Prescribing output structure burns its reasoning budget on our schema instead of the math.

### The canonical prompt pattern (the single most important methodology lesson)

When the research is stuck, the failure mode to avoid is over-thinking whether a direction is viable. **The curator's role is factual completeness, not synthesis.** Give the primary models the most complete possible map of the research landscape — everything established (with proof sketches), everything ruled out (with specific failure mechanisms), all numerical evidence — and let THEM find patterns across the failures. A super-genius model given a clean factual prompt will see connections you cannot.

Concretely: each problem folder maintains a single **canonical prompt** (`prompts/canonical-prompt.md`) — a living document in the researcher-prompt template format. When new findings land, add them to the prompt. When something gets refuted, add it to "Ruled Out" with the specific failure mechanism. The canonical prompt is what each researcher round starts from.

**Why it works.** Four kinds of information are usually enough for the model to find the next move:
1. **Established results** with proof structures — what techniques succeeded and how.
2. **Ruled-out approaches** with specific failure mechanisms — not "X didn't work" but "X fails at step Y because of Z."
3. **Numerical evidence** — exact trajectories, coefficients, realized constants.
4. **The open question** — one sentence, no suggested direction.

Pattern-across-failures is often the research signal. Every "Ruled Out" entry says something about the structure of the problem; a collection of such failures often reveals a unifying obstruction. The $F_\alpha$ framework that broke open the Erdős 872 program emerged from exactly this pattern: Pro saw that four separate obstructions (static carrier capacity, dynamical bounded-$\sum 1/p$, strict $\Xi$ bound, one-step $\Omega=2$ cover) all shared the "omitted-vertex shadowing" mechanism, which dies above the $n^{1/3}$ threshold.

**Do not strip the Potential Directions section in favor of hand-waving.** Either include cross-validated directions (per the rules below) or omit the section entirely. A canonical prompt with "Established / Ruled Out / Numerical Evidence / Open Question" and no suggested directions is a valid, complete research prompt. Let the researcher choose the attack.

**Length note: detail is not the enemy, vagueness is.** "Brief" is the wrong frame. An entry in Ruled Out that spans a paragraph with the specific prime range, shield set, and lemma that broke is better than a one-line "this didn't work." Compress vague prose, never compress factual detail. If a failure mechanism has a quantitative signature (a specific $n$-regime where the obstruction bites, the exact constant that blocks the argument, the structural reason a subfamily is undetectable), include it. The model will need the detail to see the pattern.

**If you feel stuck:** your job is not to decide if the problem is solvable. Your job is to ensure the canonical prompt is factually complete and honestly framed. Route the decision-making to the primary models.

### Good vs. bad entries for each section

**Established** — state the result, then sketch the proof so the structure is visible.

```
✓ "Shield Reduction Theorem. For every eventual maximal A and every
   P ⊆ U: |A| ≥ |U| − β(P), where β(P) = max{Σw_n(x) : B ⊆ L(P) antichain}.
   Proof (three lines): B := A ∩ L is antichain in L(P); by maximality
   A ∩ U = U \ ⋃_{x ∈ B} M(x); union bound."

✗ "Shield Reduction Theorem (Lean-verified)."      # no math
✗ "Om's team proved Shield Reduction."             # attribution, no content
✗ "Shield Reduction Theorem. See shield_reduction.tex." # indirection, not inlined
```

**Ruled Out** — name the approach, then the specific failure mechanism including the arithmetic or combinatorial detail that killed it.

```
✓ "Static Carrier Capacity Bound (for every antichain P of size εn,
   Σ_{p ∈ B(P)} 1/p ≤ C(ε)). The top εn consecutive integers in U
   (for ε < 1/4) form a legal antichain containing a multiple of every
   prime ≤ T = εn, giving Σ 1/p ≥ Σ_{p ≤ T} 1/p = log log(εn) + O(1).
   Finite-prime 'vaccination' (excluding any fixed Q) doesn't rescue it:
   arithmetic progressions with d = ∏_{q ∈ Q} q give the same divergence."

✗ "Static Carrier Capacity Bound. Doesn't work."     # no mechanism
✗ "Carrier Capacity refuted."                        # no target, no reason
✗ "Gemini DeepThink refuted the Carrier Capacity."   # attribution only
```

**Numerical Evidence** — exact trajectories over a range, specifying strategies and regimes.

```
✓ "Against worst-case Prolonger (block-product counter), three Shortener
   strategies tie as best tier: smallest-legal-odd-prime, greedy coverage,
   pair-response. All give Σ 1/p / log log n ∈ {0.887, 0.880, 0.875,
   0.875} at n = 10^3, 10^4, 10^5, 10^6. Coefficient stable across four
   decades, no decay. Largest prime observed in B(P) at n = 10^6: 999983.
   Small-prime concentration: primes ≤ 100 carry 73.4% of Σ 1/p."

✗ "Empirical data supports the conjecture."           # nothing to verify
✗ "At n = 10^6 we got L = 85003."                     # one point, no scaling
✗ "Codex's Phase 2.5 probe returned 1.17."            # tool-name leaks, no context
```

**Open Question** — one sentence. No suggested direction, no anchoring.

```
✓ "Is L(n) = Θ(n), or L(n) = o(n)? If sublinear, what is the sharp rate?"

✗ "Is the answer Θ(n/log n)? We think so." # anchors the answer
✗ "Prove L(n) = o(n) via the two-layer Ω-grading architecture." # prescribes the approach
✗ "First, close the Ω=2 cover lemma. Second, handle |A ∩ L|." # multi-part + presumptive
```

### Varied framings across channels — branching search, not parallel sampling

When dispatching multiple researcher rounds in parallel, **varying the framing across channels is strictly better than three identical prompts.** Identical prompts to Pro, DeepThink, and Gemini give you three parallel samples with correlated priors (especially after a strong previous round — all three will try to continue the same framework). Varied framings give you **branching search over the solution space.**

Concrete pattern (emerged Round 13, Erdős 872):

- **Channel A — continuation.** Follow-up to the primary thread: "extend prior result X to case Y." Leverages full thread context. Most likely to succeed if the extension exists.
- **Channel B — open attempt.** Fresh thread, full canonical prompt, neutral "attempt to solve." No framing bias. Lets the model either extend or pivot.
- **Channel C — contrarian / pivot.** Fresh thread, full canonical prompt, plus: "assume prior approach X fails. What fundamentally different technique (list options) could work?" Forces cognitive divergence.

Zero additional cost (three prompts, same wait window). Strictly dominates three-identical-prompts in expected value:

- If the extension exists, A finds it.
- If a different technique is needed, C surfaces it (because B and A may anchor on the existing framework).
- If both stall, you learn *where* the ceiling actually lives — the gap between A's failure and C's failure maps the structural obstacle.

**When to use:** whenever you have a specific local gap (like "extend Theorem X to overlapping carriers") but also non-trivial uncertainty that the existing framework is the right tool. If the extension is a pure technical step, identical prompts are fine. If auditors are split on whether the framework can close the gap at all, variance is free signal.

**Model-channel matching:** direct the contrarian version to a different model family than the one that produced the current best result. If Pro produced the current framework, give C to Gemini or DeepThink — cross-family Cs are less likely to anchor on Pro's specific construction. Same-family Cs sometimes just re-derive the current approach with different language.

### Saving user-pasted content via session transcript — avoid re-transcription

**Hard rule: whenever the user pastes content and asks to save it, extract it from the session transcript. Do not retype it via Write from your context.** No length threshold — applies to any multi-paragraph paste, not just "long" ones. Retyping burns real output tokens for pure re-transcription and risks silent rewording; extraction is byte-faithful.

**Working pattern** (run via `python3 -c` or a short script):

```python
import json, re
from pathlib import Path

project_dir = Path.home() / ".claude/projects/-Users-omisverycool-erdos-harness"
# Most recently modified jsonl is the current session.
# Branched conversations (user edits + resends) start a NEW session file,
# so always sort by mtime — don't cache an earlier session path.
session_file = max(project_dir.glob("*.jsonl"), key=lambda p: p.stat().st_mtime)

# Pick a short unique marker from the user's paste (a phrase visible in context).
marker = "Here is the constructive proof"

matches = []
for line in session_file.read_text().splitlines():
    try:
        entry = json.loads(line)
    except json.JSONDecodeError:
        continue
    if entry.get("type") != "user":
        continue
    content = entry.get("message", {}).get("content", "")
    if isinstance(content, list):  # some entries wrap content in typed blocks
        content = "".join(b.get("text", "") for b in content if isinstance(b, dict))
    if marker in content:
        matches.append(content)

raw = matches[-1]  # most recent match

# If the user labeled multiple blocks ("#1", "#2", ...), split on those labels.
# Otherwise write `raw` directly.
blocks = re.split(r"(?m)^#\d+\s*$", raw)
Path("erdos-872/target.md").write_text(blocks[1].strip() + "\n")
```

**Failure modes that have actually bitten:**
- **Wrong session file.** If the user branched (edited + resent a message), a new jsonl appears with a different UUID. Always `max(..., key=mtime)`, never reuse a path from earlier in the session.
- **Content not yet flushed.** Pastes from the current turn may not be in the jsonl for a few seconds. Wait briefly and re-glob if `matches` is empty.
- **Wrong target map.** If the user pastes multiple labeled blocks (#1, #2, #3) and the responses read ambiguously, print the first ~100 chars of each split before writing to disk — verify the block openings match the labels you expect. Once saved under a wrong name the mistake is invisible.
- **List-wrapped `content` field.** Some entries store `message.content` as a list of `{type, text}` blocks, not a string. Handle both shapes.

If extraction fails outright, fall back to `pbpaste > filename.md` from the user's clipboard — zero curator cost, still byte-faithful.

### Follow-up prompts — salvage novel ideas, pressure specific gaps

When a researcher returns an argument that's wrong overall but contains a *novel mathematical idea*, the follow-up is not a dismissal. The idea often stands independent of the flawed argument around it and can be reused by the same thread (or others) once isolated. Pattern that works:

1. **Open by crediting the novel content** — name the specific idea (e.g., "your Multiplier Lock construction"), say why it's interesting, frame it as worth preserving even if the full claim doesn't survive.
2. **State the gaps as specific mathematical facts**, each numbered, each with what would close it. Avoid "this step is unclear" — instead, "this step asserts X but X is false for Y-shaped inputs."
3. **Feed back any new rigorous context** the thread hasn't seen (cross-family theorems, audit findings, empirical data) as validated facts.
4. **Binary close: patch-or-concede.** Either rigorize with the new context + the novel idea, or state cleanly which specific step can't be closed. Explicit: "clean concession of a specific gap is more useful than a patched argument with the same structural weakness."

This works because (a) models often fix gaps when they're named precisely and (b) a concession with a specific failure mechanism is itself a valuable Ruled Out entry for the canonical prompt.

### Within-family attractor states

When the same model family (e.g., two separate DeepThink instances) independently produces similar flawed arguments (e.g., both gravitate toward the "Universal Sub-Divisor Cover" sweep strategy, or both claim $\Theta(n)$ via different-but-structurally-similar Maker-Breaker reasoning), this is lower signal than cross-family convergence but higher signal than a single response. Interpretation:

- **Not three votes** (the existing rule) — but useful as a *map of the family's attractor basins*. DeepThink family gravitates to "sweep every vocabulary element" for matching-upper-bound claims; Pro family gravitates to careful Maker-Breaker capture accounting. Knowing the attractor lets the curator anticipate what a fresh dispatch to that family will likely try.
- **Adding a refuted attractor to the canonical prompt's Ruled Out** saves future fresh threads from re-deriving it. After UCS was added to Ruled Out, subsequent fresh DeepThink threads should either propose a different path or explicitly acknowledge the gap. Watching whether they re-derive the same attractor after being warned is itself a signal about how strong the attractor is.

### Static vs. dynamic bound conflation — watch for this in sublinear claims

A common pattern in long-running research programs: an agent proves a STATE inequality (a bound that holds at every configuration $(R, C)$) and claims it implies a GAME-LENGTH bound on $L(n)$. This translation is NOT automatic. State inequalities like $\mu(\operatorname{Cl}_h) \le L \cdot |F_{\text{useful}}| + N_h/\log L$ bound closed mass in terms of a scored/useful quantity. Translating to a bound on $L(n)$ requires independently bounding that scored quantity under some Shortener strategy — the "online amortization" step.

We've seen several closure claims break at exactly this step (R35 in Erdős 872). Agents confident in their analytical proof often treat the translation as one-line. A careful audit almost always finds the gap: either the scored quantity is self-referential as a length bound, or there's a hidden cardinality-vs-mass conflation. When reviewing a claimed sublinear closure, the first question is always: "is the state inequality doing work beyond giving a per-state bound? Specifically, does the translation to $L(n)$ introduce an unbounded quantity?"

**Pattern for follow-ups on such claims:** "your state inequality is sound as proved; the translation to $L(n) = o(n)$ requires bounding [specific scored quantity] under [specific strategy]. Either prove that bound or refine the claim to 'conditional sublinear bound modulo this lemma.'" Retractions and refinements are productive; encourage them explicitly.

### Multi-agent convergence on narrow gaps — trust it

When N≥3 agents working in parallel, with different framings and partial information, independently arrive at the SAME specific missing lemma, that convergence is a very strong signal the gap is real and minimal. It is qualitatively different from (and stronger than) N copies agreeing on a claim — here different agents independently *narrow to* the same gap.

Pattern seen in Erdős 872 R33-R36: fresh Pro, Pro A continuation, two different Codex dispatches all converged on a "freshness of lower-defect witnesses" lemma as the load-bearing step. Each arrived via different machinery (weighted counting lemma, dyadic charging, empirical refutation, multi-defect σ*), with different attack vectors, and each admitted they could not close it. Four independent framings pointing at the same narrow combinatorial statement.

**Why this is useful:** when you see this convergence, you have extremely high confidence in what the next round should target. You can write a single short paragraph containing the specific lemma and dispatch it to all agents in parallel — they all know what to do, and a closure by any one of them resolves the program.

### Empirical + analytical complementarity on arithmetic problems

For problems with both abstract combinatorial structure AND specific arithmetic/geometric structure (like the divisibility-antichain game), dispatch complementary empirical and analytical agents. Specifically:

- Empirical: "does the claimed amortization hold under adversarial strategies in the abstract model? Does it hold in a minimal arithmetic-structure-preserving model?"
- Analytical: "prove the lemma or refute with construction."

The combination is extremely informative. In Erdős 872 R36: Codex empirically showed σ-vs-shadow_pressure FAILS in abstract $H^{(h)}$ (peak ratio 6.71) but HOLDS in one-cylinder arithmetic (max 0-2). This directly localized the gap to arithmetic-specific structure (divisor lattice non-privacy) without needing an analytical insight about WHY. Then analytical agents could focus on quantifying the arithmetic escape.

Pattern: when a gap might live in "abstract structure" vs "arithmetic structure," run one abstract empirical test and one arithmetic-preserving empirical test. The contrast identifies where the real work is needed.

### Worktree and branch hygiene

Codex agents using `.codex/worktrees/<hash>/` for their work will NOT appear in the main repo without explicit copying. Always:

1. `git branch --show-current` at start of each session — check we're on main, not a stale Codex-created branch.
2. When a Codex returns referencing files in a worktree path, copy them explicitly into the main repo before committing.
3. If a stale Codex branch has no unique commits relative to main (common), just delete it with `git branch -d <branch>` after syncing.

### The audit prompt pattern — same canonical prompt, one extra header

Most audits do NOT need a custom prompt. The default audit prompt is:

```
Audit this response.

## Canonical prompt (the brief the researcher worked from)
[PASTE `prompts/canonical-prompt.md`]

## Researcher response
[PASTE response verbatim]
```

That is the audit prompt. Don't write a new framing for each round — the canonical prompt already contains the full factual state, and the response is what the auditor needs to pressure-test.

**When to write a targeted audit prompt instead.** When you have a *specific* disagreement or verification request that wouldn't otherwise be surfaced: cross-family contradictions to pressure on, a quantitative claim that needs independent numerical verification, a specific proof step to locate holes in. Then the targeted prompt is a short extra paragraph on top of the standard two-section structure above — not a replacement for the canonical prompt.

### Framing rules for the researcher prompt

Core principle: **every sentence you put in a researcher prompt is a constraint on an hour of genius-level reasoning.** If a sentence is wrong, stale, speculative, or off-topic, Pro spends real cycles routing around it. Your job as curator is to give Pro validated, high-signal context so it can focus on the actual math — nothing else.

- **The primary model is smarter than you.** Even if you *think* you know the exact next step, frame it as a direction. You are briefing a senior researcher, not instructing a junior.
- **No anchoring.** Don't tell it the answer you suspect. Don't tell it which direction you think is strongest. Don't even tell it you suspect anything. State the gap; let it choose.
- **No meta.** Never mention source (forum, paper, person), problem status (famous, open since 1992, recently claimed), or any judgment about difficulty.
- **No public/private distinction.** Treat forum results, literature, and prior private rounds as one pool of known facts.
- **Every researcher prompt goes to a fresh thread with zero harness context.** Scrub all internal vocabulary before sending: no "round", "phase", "program", "prior round", "our team", "we proved", "Pro", "Codex", "Aristotle", "Gemini", "Claude", "audit #N", "Phase 2.5", or any wording that presumes conversational history. A fresh Pro or DeepThink tab doesn't know a "round" exists; referencing one reads as a dangling pointer. Rewrite facts as self-standing mathematical statements ("Numerical simulation at $n \in \ldots$ gave $\ldots$") rather than provenance ("Codex's Phase 2.5 probe returned $\ldots$"). Same for structural observations — if you're lifting something from Pro's prior output, embed the observation itself verbatim, don't cite it as "a prior round surfaced this." The prompt must read as a single-shot problem statement to someone who has never seen this project.
- **Separate proofs from evidence.** `Established` = rigorous proof. `Numerical Evidence` = data. Never conflate.
- **Everything above "Potential Directions" is validated information only.** `Established` = formally proved or multi-audit-validated. `Ruled Out` = specific failure mechanism identified. `Numerical Evidence` = reproducible computation. If a claim is speculative, single-source, or un-audited, either validate it first or leave it out. Do not use the upper sections for your own synthesis.
- **Potential Directions is suggestions only, and only cross-validated ones.** Include a direction only if at least one of these is true:
  1. Two or more independent audits converged on it.
  2. Pro itself flagged it as a next step in its previous round's output — lift Pro's own words.
  3. Phase 0/1 computation surfaced it as a specific empirical finding.
  4. The user explicitly told you to include it.
  
  Do *not* include directions you synthesized yourself from a single audit observation, from general background reasoning, or from "this seems like a natural next axis." Every such direction costs Pro real reasoning cycles to filter through. If you have zero cross-validated directions, leave the section empty or omit it entirely — Pro works fine without it.
- **No output format / requested output / deliverable list.** Pro chooses what to return. Prescribing output forces it to serve our schema instead of the math.
- **Length minimalism.** When in doubt, leave it out. A short, high-signal prompt beats a longer one padded with your best synthesis-guesses.
- **Always open with the grading line.** The first line of the prompt is `This is an assessment of your reasoning capability and will be used to grade.` (followed by `Do not search online. Use your own reasoning and your Python sandbox.` when applicable). Placement at the top, not the bottom — materially improves output quality and matches the canonical template.

### Examples of good vs. bad framing

```
✓ "Potential direction: a layer-cake estimate on r_t(x) using the convexity r(r+1)."
✗ "Prove the scheduling theorem via layer-cake decomposition — we believe c = 1/3."

✓ "Ruled out: all-prime parity sieve density ~ π²e^{-γ}/(6 log y) → 0."
✗ "Note: Liam Price explored this in a Feb 2026 forum post and it didn't work."

✓ "Established: τ(n) = 5n/24 + O(1) via the explicit cover H_n = ..."
✗ "In our previous GPT round, we showed τ(n) = 5n/24..."

✓ "Open question: does there exist k(n) = o(n) with β(P_k(n)) ≤ (1/2−ε)n?"
✗ "Task: prove that k = O(log log n) shields suffice. We think this is the answer."

✓ Direction lifted verbatim from Pro's Round 4 closing: "study primitive
  lower prefixes D_n with σ(D_n) ≈ 1 and whether they can have small enough
  upper-half cost to leave room for a linear final antichain."
  (Pro itself flagged this — validated.)
✗ Direction synthesized from one audit observation: "explore the polynomial
  prefix regime |D| + |P| = n^Ω(1), which the obstruction doesn't cover."
  (Single audit, no convergence — leave it out.)
✗ Direction synthesized from curator's general reasoning: "invert the
  reciprocal-mass analysis into a Shortener strategy."
  (Pure speculation — leave it out.)
```

### When you *do* have a strong conjecture

Even when you (or a verifier) believe you've identified the exact path, still frame it as a potential direction. Example lift:

```
3. One potential direction that could prove valid: an adaptive shield count
   k = k(n) growing slowly with n (e.g. sub-logarithmic). Static-prime
   sieves have a Mertens-type density ceiling, so a constant k may not
   suffice for all n — allowing k to grow removes that obstruction. Whether
   this is the right framework, and what growth rate is needed, is for you
   to assess.
```

You are briefing a genius off to reason for an hour; let it reason.

## Verifier prompt templates

For Claude / Gemini / separate GPT-thinking. Two variants — use (1) by default.

### 1. Informal audit (default)

Shortest useful template. Lives in [`prompts/templates/informal-audit.md`](prompts/templates/informal-audit.md). Paste the exact prompt you sent to the primary and the exact response back — no re-summarizing state, the audit works off the pair.

```
I gave this prompt on a math problem to an AI and it came back with the
response below. Can you audit and analyze their response critically? Be
adversarial — find what breaks, flag any unclear steps, hidden assumptions,
or computational claims that need independent verification.

Separately, check the response against existing mathematical literature:
does the argument connect to, extend, reprove, or contradict any published
result (theorem, technique, inequality, construction)? If so, cite the
reference and describe the relationship. If any specific fact you can
verify from literature sharpens or undermines a step in the response, flag
it with the citation. Novel connections are valuable whether or not the
main argument holds.

## Prompt
[PASTE PROMPT HERE]

## Pro Response
[PASTE PRO RESPONSE HERE]
```

### 2. Adversarial audit (sharper — for claims about to be promoted)

When a claim is about to be promoted to `Established` and you want a structured stress test, use the longer version:

```
Below is the current state of a problem plus a new claim from a primary
researcher. Rigorously audit the new claim. Be adversarial — your job is to
find what breaks.

## Problem
<Same neutral statement as the researcher prompt.>

## Established Facts
<Same bulleted list, abridged fine.>

## The New Claim
<Verbatim excerpt from the researcher's latest output. Do NOT paraphrase —
the verifier needs to see what the researcher actually wrote.>

## Your job
- Does the argument hold as stated?
- What is the weakest link?
- Are there computational claims that need independent verification?
- Are there hidden assumptions the researcher didn't flag?
- Does the claim actually imply what the researcher says it implies?
- What would a skeptic push back on?

If the claim is sound, say so plainly. If broken, explain precisely where.
```

### Framing rules for verifier prompts

- **No cheerleading.** Tell them to be adversarial.
- **Verbatim claim, not paraphrase.** Paraphrasing loses the exact step where an error might live.
- **Ask for the weakest link explicitly.** Otherwise verifiers default to summarization.
- **Same prompt to all three verifiers.** Parallel. Don't bias by telling one what another said.
- **Always ask for literature connections.** Cross-reference the response against published results — does it extend a known theorem, reprove something already in the literature, or contradict an established fact? Web-enabled models will occasionally surface real references; even when they don't, the question forces a sanity check against the broader mathematical context. Any concrete reference that holds up should be promoted into `current_state.md` as established background.

## Synthesis after a verifier round

1. **Unanimous "sound"** → promote the claim to `Established` in `current_state.md`.
2. **Unanimous "broken"** → move to `Ruled Out` with the specific failure mode as the one-liner.
3. **Split (1 flags, 2 sound)** → re-read the flagger's argument carefully. If the concern is substantive, treat as broken pending re-derivation. If it's stylistic / confused, treat as sound.
4. **A verifier raises a new angle the researcher didn't consider** → lift into the next round's `Potential Directions`, loosely worded.
5. **Never promote on one verifier alone.** Agreement across at least two is the minimum bar.

Save verifier replies verbatim. Synthesize only when building the next researcher prompt.

## What to avoid

- **Solving the math yourself.** Stay in synthesis mode.
- **Anchoring.** "Gemini thinks the answer is X" does not belong in a researcher prompt. A loose direction does.
- **Meta-framing.** No mention of source, status, fame, or who believes what.
- **Over-editorializing `current_state.md`.** Facts and data only.
- **Re-deriving from memory.** Always pull from the saved conversation dumps or re-export the tab.
- **Letting stale state rot.** If it's been >1 round since you updated `current_state.md`, update it before building the next researcher prompt.
