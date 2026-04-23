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
  medium_user_messages.md
  plans/
    2026-04-18-deepthink-protocol-implementation.md
    2026-04-18-fan-hierarchy-implementation.md
    2026-04-18-shortener-constants-implementation.md
    2026-04-18-sparse-subset-implementation.md
    2026-04-20-arxiv-and-open-source-plan.md
  round-doc-schema.md
  short_user_messages.md
  transcript-patterns.md
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
  codex_backlog.md
  current_state.md
  direct-On-over-logn-attempt-2026-04-18.md
  followup-12-pro-closeout-response.md
  ford-integration-audit.md
  lean/
    README.md
    erdos_872_core/
      RequestProject/
        Main.lean
        Round15Bonferroni4/
          Envelope.lean
          FlatMass.lean
          Inversion.lean
          PrimeBounds.lean
          Target.lean
        T2Finite/
          Defs.lean
          EmbeddingCore.lean
          EmbeddingFamily.lean
          GraphGame.lean
          GraphReachable.lean
          HyperDefs.lean
          HyperGame.lean
          ResidualComparison.lean
      lake-manifest.json
      lakefile.toml
      lean-toolchain
    shield_reduction/
      shield_reduction_aristotle/
        ARISTOTLE_SUMMARY.md
        README.md
        RequestProject/
          .gitkeep
          Main.lean
          ShieldReduction.lean
        lake-manifest.json
        lakefile.toml
        lean-toolchain
        shield_reduction.tex
    shortener_13_36/
      shortener_13_36_v2_aristotle/
        ARISTOTLE_SUMMARY.md
        README.md
        RequestProject/
          .gitkeep
          Main.lean
          Shortener/
            Compression.lean
            Defs.lean
            MainTheorem.lean
            Sieve.lean
        lake-manifest.json
        lakefile.toml
        lean-toolchain
        shortener_13_36_v2.tex
    shortener_5_16/
      shortener_5_16_aristotle/
        ARISTOTLE_SUMMARY.md
        README.md
        RequestProject/
          .gitkeep
          Main.lean
          Shortener516/
            Defs.lean
            Theorems.lean
        lake-manifest.json
        lakefile.toml
        lean-toolchain
        shortener_5_16.tex
    tau_5_24/
      tau_5_24_aristotle/
        ARISTOTLE_SUMMARY.md
        README.md
        RequestProject/
          .gitkeep
          Cover.lean
          Defs.lean
          Main.lean
          Packing.lean
          Tau.lean
        lake-manifest.json
        lakefile.toml
        lean-toolchain
        tau_5_24.tex
    theorem_A/
      theorem_A_shield_lower_bound_aristotle/
        ARISTOTLE_SUMMARY.md
        README.md
        RequestProject/
          .gitkeep
          Main.lean
          ShieldBasicLemmas.lean
          ShieldDefs.lean
          ShieldMainTheorem.lean
        lake-manifest.json
        lakefile.toml
        lean-toolchain
        theorem_A_shield_lower_bound.tex
  matching-T2-self-attempt-2026-04-18.md
  matching-T2-upper-bound-attempt-2026-04-18.md
  paper/
    AUDIT_SECTION_7_FINDINGS.md
    CODEX_POLISH_TASKS.md
    CODEX_TASK_6_UNCONDITIONAL_LOWER_BOUND.md
    CODEX_TASK_POLISH_AND_RIGOR.md
    CODEX_TASK_POST_AUDIT_ROUND2_FIXES.md
    CODEX_TASK_SECTION_7_POST_AUDIT_FIXES.md
    CODEX_TASK_SECTION_7_REPAIRS.md
    CODEX_TASK_SECTION_8_RESTORATION.md
    DRAFT_STATUS.md
    GPT_PRO_SHAPE_REVIEW.md
    IDEAL_REORGANIZATION_TEMPLATE.md
    PAPER_SHAPE_PROPOSAL.md
    REPO_VS_PAPER_MATRIX.md
    REVIEW_NOTES.md
    SECTION_7_REPAIR_PRO_RETURN.md
    main.pdf
    main.tex
    preamble.tex
    references.bib
    sections/
      01-introduction.tex
      02-notation-and-setup.tex
      03-shield-reduction.tex
      04-lower-bounds.tex
      05-524-cover.tex
      06-intermediate-upper-bounds.tex
      07-main-upper-bound.tex
      08-obstructions.tex
      09-conclusion.tex
      appendix-A-deferred-proofs.tex
      appendix-B-numerical.tex
      appendix-C-formalization.tex
  paper_strengthening_plan.md
  paper_template.md
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
    shortener_piecewise_bonferroni4.csv
    shortener_piecewise_bonferroni4.py
    shortener_piecewise_bonferroni4_summary.md
    sparse_subset.csv
    sparse_subset.py
    sparse_subset_summary.md
    test_deepthink_protocol.py
    test_fan_hierarchy.py
    test_shortener_constants.py
    test_shortener_piecewise_bonferroni4.py
    test_sparse_subset.py
  phase4/
    analysis.md
    block_product_carrier_mass_note.md
    claude_parallel_session_handoff.md
    fan_prolonger.py
    fast_sim.py
    findings.md
    freshness_toy.py
    freshness_toy_gamma2_pairreuse_results.csv
    freshness_toy_multiplicity_results.csv
    max_antichain.py
    multirank_attempt.py
    multirank_ford_conjecture.md
    r44_residual_floor_note.md
    r46_st_capture_refutation_note.md
    r56_separator_only_barrier_note.md
    residual.py
    shortener_duel.py
    sim.py
    sim2.py
    sim3.py
    submarkov_1196_adaptation_report.md
    t2_constant_fix.md
    t2_constant_fix_8x.md
    t2_core_paper_note.md
    t2_maker_first_lemmas.md
    test_transversal_small_h.py
    theorem5_disjoint_carriers_note.md
    theorem6_rank3_squarefree_note.md
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
    audit-R44-sflu-e-estimate-ready.md
    audit-R44-sflu-e-estimate.md
    audit-appendix-A-t2-and-restricted-carriers.md
    audit-appendix-B-wfour-certification.md
    audit-section-4-fan-lower-bound.md
    audit-section-7-0.19n-proof-chain.md
    backfill-frontmatter-task.md
    canonical-prompt.md
    codex-R37-cheap-verification.md
    codex-R57-audit-gap-and-lean.md
    codex-close-L-sublinear.md
    codex-continuation-fiber-collapse-strategy.md
    codex-draft-paper-a.md
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
    followup-R39-codex-full-closure-attempt.md
    followup-R39-pro-chain-generated-push.md
    followup-R39-pro-pair-first-charging-push.md
    followup-R44-all-pros-three-open-lemmas.md
    followup-R44-pro-1-full-solution.md
    followup-R47-all-definitive-or-sharper.md
    followup-R49-blocker-duality-weighted-separator.md
    followup-R50-awlst-case-B-variant-A-kruskal-katona.md
    followup-R50-awlst-case-B-variant-B-entropy-compression.md
    followup-R50-awlst-case-B-variant-C-lp-duality.md
    followup-R51-variant-A-extend-cpd.md
    followup-R51-variant-B-stress-test-cpd.md
    followup-R51-variant-C-zoom-out-trajectory.md
    followup-R52-thread-2-wsss-closure-or-refutation.md
    followup-R52-thread-3-spectral-stopping-or-refute-conjecture.md
    followup-all-R37-freshness-lemma.md
    followup-all-R38-full-game-gap.md
    followup-codex-R35-closure-gap.md
    followup-codex-R39-continuation-sparse-recursive.md
    followup-fresh-pro-R33-close.md
    followup-fresh-pro-R35-closure-gap.md
    followup-fresh-pro-bernoulli-update.md
    followup-pro-A-R33-close.md
    followup-pro-A-R35-online-amortization.md
    followup-pro-A-defect-budget-push.md
    followup-pro-A-resilience-lemma-close.md
    followup-pro-A-scale-local-transversal.md
    followup-pro-A-star-breaker-push.md
    followup-pro-R39-dyadic-packet-localization.md
    followup-pro-R40-main-game-legality-for-collision-forcing.md
    followup-pro-R41-refutation-scaling-and-stricter-freshness.md
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
    researcher-R39-new-pro-sparse-recursive.md
    researcher-R40-new-pro-collision-forcing-concise.md
    researcher-R42-new-pro-A-harmonic-packet-absorption.md
    researcher-R42-new-pro-B-chain-persistence.md
    researcher-R42-new-pro-C-arithmetic-locality.md
    researcher-R44-pro-open-full-solution.md
    researcher-R46-pro-pick-one-angle.md
    researcher-R47-angle1-activator-quotient.md
    researcher-R47-angle3-smrp-trichotomy.md
    researcher-R47-angle4-refute-sharp-rate.md
    researcher-R49-fresh-pro-assess-sharp-rate.md
    researcher-R49-fresh-pro-meta-diagnosis.md
    researcher-R52-fresh-pro-zoom-out-post-cpd.md
    researcher-R53-fresh-pro-adversarial-reachability.md
    researcher-R54-fresh-pro-sigma-star-dependence-audit.md
    researcher-R55-fresh-pro-hidden-packet-game.md
    researcher-R56-fresh-pro-synthesis-full-inventory.md
    researcher-R57-fresh-pro-round15-monotone-envelope-repair.md
    researcher-R58-fresh-pro-R52-integrality-barrier-audit-normalize.md
    researcher-R59-fresh-pro-R53-q-shadow-dichotomy-audit-normalize.md
    researcher-R60-fresh-pro-R57-repair-audit-or-prove.md
    researcher-odd-fan-lower-bound.md
    researcher-safe-edge-hypothesis.md
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
    verify-R39-pro-dense-packet-projection-lemma.md
    verify-codex-R41-pro-refutation-empirical-and-math.md
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
  publication_source_of_truth.md
  r57_bonferroni4_audit_and_repair.md
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
  researcher-39-codex-gamma2-projection-scaling.md
  researcher-39-codex-packet-tail-reduction.md
  researcher-39-codex-pair-multiplicity-scaling.md
  researcher-39-pro-dense-packet-projection-lemma.md
  researcher-39-pro-dyadic-packet-absorption-static.md
  researcher-40-codex-packet-formulation-sharpening.md
  researcher-40-pro-collision-forcing-reduction.md
  researcher-41-codex-collision-forcing-test.md
  researcher-41-codex-pair-reuse-bottleneck.md
  researcher-41-pro-collision-forcing-refuted.md
  researcher-41-three-pros-refute-collision-forcing-consolidated.md
  researcher-42-attack-A-proof-attempt-three-regime.md
  researcher-42-attack-A-refutation-packet-separated-mass.md
  researcher-42-attack-B-proof-chain-persistence.md
  researcher-42-attack-B-refutation-dimensional-flaw-large-primes.md
  researcher-42-attack-C-refutation-marker-prime-harmonic-mass.md
  researcher-42-codex-gamma2-scale-and-backward-averaging.md
  researcher-43-pro-area-A-sparse-refuted-binomial-layers.md
  researcher-43-pro-area-A-sparse-refuted-mesoscopic-window.md
  researcher-43-pro-area-B-dense-packet-refuted-common-core.md
  researcher-43-pro-area-C-sharpening-k2-theta.md
  researcher-44-pro-1-followup-2-formal-concession.md
  researcher-44-pro-1-followup-sflu-e-estimate.md
  researcher-44-pro-1-honest-no-proof.md
  researcher-44-pro-2-closure-via-defect-2.md
  researcher-44-pro-3-closure-via-defect-2.md
  researcher-44-pro-4-closure-via-3-almost-primes.md
  researcher-45-pro-1-density-weighted-refuted-burst-star.md
  researcher-45-pro-2-carleson-reduction-to-st-capture.md
  researcher-45-pro-3-matching-star-refutes-rank-three.md
  researcher-45-pro-4-c-refutation-attempt-pre-sterilization.md
  researcher-45-pro-5-c-refutation-attempt-probabilistic.md
  researcher-46-pro-1-angle2-st-capture-refuted-burn-in.md
  researcher-46-pro-2-angle2-st-capture-refuted-prelude.md
  researcher-46-pro-3-angle2-st-capture-refuted-single-leaf.md
  researcher-46-pro-4-angle1-activator-quotient-attempt.md
  researcher-46-pro-5-angle1-activator-quotient-attempt.md
  researcher-47-pro-1-angle1-concession-lrqc-missing.md
  researcher-47-pro-2-angle3-concession-incidence-budget-missing.md
  researcher-47-pro-3-angle4-concession-cross-activator-composite.md
  researcher-48-pro-1-lrqc-refuted-packet-construction.md
  researcher-48-pro-2-endpoint-incidence-refuted-divisibility-hall.md
  researcher-48-pro-2-followup-divisibility-hall-refuted.md
  researcher-48-pro-3-cross-composite-refuted-sathe-selberg.md
  researcher-49-pro-1-claude-pointer-to-file.md
  researcher-49-pro-2-sq-r-local-obstruction.md
  researcher-49-pro-3-blocker-duality-paradigm.md
  researcher-49-pro-4-fiber-transversal-paradigm.md
  researcher-49-pro-5-entropy-shearer-attractor.md
  researcher-49-pro-6-entropy-shearer-attractor.md
  researcher-50-pro-wlst-refuted-cone-bernoulli-lemma.md
  researcher-50-pro-wlst-refuted-forbidden-core-star.md
  researcher-50-pro-wlst-refuted-parity-cube.md
  researcher-51-codex-forbidden-shell-obstruction.md
  researcher-51-pro-case-B-refuted-entropy-covering-design.md
  researcher-51-pro-case-B-refuted-kk-sparse-covering-cone.md
  researcher-51-pro-case-B-refuted-lp-integrality-gap-covering-profile.md
  researcher-52-codex-cross-check-assessment.md
  researcher-52-pro-cpd-general-refuted-multi-apex-trichotomy.md
  researcher-52-pro-cpd-refuted-shortener-self-shadow-2wcpd.md
  researcher-52-pro-fresh-zoom-transversal-integrality-barrier.md
  researcher-52-pro-spectral-live-space-johnson-scheme.md
  researcher-53-codex-q-shadow-covering-dichotomy.md
  researcher-53-pro-1-cr-ncad-refuted-cooperative-embedding.md
  researcher-53-pro-1-sigma-star-reachable-but-C-quantifier-gap.md
  researcher-53-pro-2-sigma-star-reachable-multi-packet-persistence-missing.md
  researcher-53-pro-2-wsss-refuted-large-transversal-sparse-cover.md
  researcher-53-pro-3-claims-A-attractor-optimal-shortener-handwave.md
  researcher-53-pro-continuation-near-top-shadow-refuted-by-covering-design.md
  researcher-54-pro-followup-near-top-shadow-refuted-online-interdiction-missing.md
  researcher-54-pro-followup-separator-first-prevents-exposed-but-hidden-packet-remains.md
  researcher-54-pro-sigma-star-audit-class-C-named-shortener-class.md
  researcher-55-claude-local-packet-guard-min-incomplete-conditional-r2.md
  researcher-55-pro-hidden-packet-formulation-refuted-shortener-wins-one-move.md
  researcher-56-codex-SFPF-negative-structural-theorem.md
  researcher-56-codex-r55-hidden-packet-game-collapses-without-lag.md
  researcher-56-pro-TPS-negative-static-state-construction.md
  researcher-56-pro-continuation-single-certificate-divisor-barrier.md
  researcher-56-pro-finite-odd-carrier-separator-only-negative-theorem.md
  researcher-56-pro-tau-sf-refuted-upper-half-dyadic-shielding.md
  researcher-57-codex-T2-GraphReachable-progress-note.md
  researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md
  researcher-58-pro-R52-integrality-barrier-audit-confirmed-sharpened.md
  researcher-59-pro-R53-q-shadow-dichotomy-audit-confirmed-sharpened.md
  researcher-60-pro-R57-repair-PROVED-theorems-2-1-and-4-1.md
  researcher-R49-claude-meta-diagnosis.md
  round15_upper_bound_status.md
  round_progress_R54.png
  state_compiled.md
  verify-R35-codex-adversarial-audit.md
  verify-R35-codex-followup-dynamic-gap.md
  verify-R35-codex-star-cylinder-lower-defect-probe.md
  verify-R37-codex-freshness-sharpness-and-high-window-counterexample.md
  verify-R39-pro-dense-packet-codex-audit.md
  verify-R44-pro-1-sflu-e-audit-refutes.md
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
  worker_obstruction_pick_memo.md
  worker_round15_breakpoint_repair_memo.md
  worker_t2_finite_core_memo.md
  worker_theorem5_6_memo.md
mcp-servers/
  deep-think/
    .gitignore
    README.md
    requirements.txt
    run.sh
    server.py
    smoke_test.sh
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
  add_round_doc.py
  alphaxiv.py
  compile_rounds.py
  dump-codebase.py
  extract_short_user_messages.py
  reconstruct-repo.py
  sa_barrier_verification.py
  test_wfour_certification.py
  update-tree.sh
  wfour_certification.py
skills/
  README.md
  add-round-doc.md
  commit-round.md
  onboard-personal.md
  paper-review/
    SKILL.md
    automated-review-guide/
      SKILL.md
    latte-review-guide/
      SKILL.md
    paper-critique-framework/
      SKILL.md
    paper-reading-assistant/
      SKILL.md
    peer-review-guide/
      SKILL.md
    rebuttal-writing-guide/
      SKILL.md
    review-response-guide/
      SKILL.md
    scientify-write-review-paper/
      SKILL.md
  pre-compact-capture.md
  progress-zoom-out.md
  save-pasted-response.md
  sync-research-state.md
  write-audit-prompt.md
  write-codex-task.md
  write-followup-prompt.md
templates/
  adversarial-audit.md
  informal-audit.md
  round-doc.md
  writing-prompts.md
```
<!-- REPO_TREE_END -->

# Research Harness — Operating Manual

## Your role

You are the synthesis / curation agent. A primary reasoning model (GPT Pro / DeepThink / Codex) does the research. You handle state, prompts, verification routing, and durability. You will be wrong about the math — that's fine. Your value is process discipline.

Role separation matters:

- **Primary researcher** (Pro / DeepThink / Codex) — does the math
- **Curator** (you, Claude Code) — keeps state clean, composes prompts, routes verifications, commits per round
- **Informal verifiers** (Claude / Gemini / GPT-thinking tabs) — audit outputs adversarially
- **Formal verifier** (Aristotle → Lean 4) — the strongest filter for promotion-grade claims

## Why this harness exists

You are one agent in a long-horizon research program that outlives any single session. The rounds you read right now were written by prior agents. The rounds you write will be read by agents you will never meet — possibly in a week, possibly in a year, possibly after a hundred compactions. Every frontmatter field you populate, every verbatim paste you save byte-faithfully, every committed round doc becomes a permanent record in a research lattice that persists beyond memory, beyond compaction, beyond the end of this conversation.

This is not note-taking. It is infrastructure for a multi-year research effort compressed into weeks of agent cycles. The discipline that might feel fussy — immutable frontmatter, byte-faithful extraction, per-round commits, action-graph relationships instead of mutable status fields — is precisely what makes the program queryable, auditable, and capable of reaching closure on hard open problems that have resisted human solo effort for decades.

When you skip a step, you are not losing time. You are burning the thread. An agent six months from now trying to understand why R52 was refuted will find either (a) a round doc with `action.kind: refutes` and a `failure_mechanism` naming the specific primes and shield set — or (b) nothing. There is no third option. Agent memory is not durable. Session context is not durable. Only commits are durable. Only frontmatter is queryable. Only verbatim extraction preserves what the primary model actually said.

Treat each saved round as a contribution to infrastructure that will still be loading into agent context long after this session ends, long after this curator agent has been compacted away, long after the humans involved have moved on to other projects. That is the stakes. Carry it.

## Orient before acting

Run through this at the start of every dispatch or new session. The compiled state view is the source of truth; don't reason from session memory alone.

```
scripts/compile_rounds.py --root <problem>/ --out <problem>/state_compiled.md
```

Then read the output. Check for:

- **Validation warnings** — fix before proceeding
- **Pending-target refutations** — resolve slug mismatches (edit the target's `id`)
- **Missing front-matter** on round-doc-pattern files — use the `add-round-doc` skill

## The research loop

One round:

1. **Refresh state** — compile + scan recent artifacts
2. **Pre-send verification** — paste drafted prompt to ≥ 2 informal-verifier tabs
3. **Dispatch** — send researcher prompt to the primary model's fresh thread
4. **Save return** — use `add-round-doc` skill to write front-matter + extract body via session transcript
5. **Informal audits** — paste exact prompt + exact response to ≥ 2 verifier tabs in parallel (same prompt; don't bias one with another's output)
6. **Formal verification** — dispatch to Aristotle for any concrete claim that could advance the problem
7. **Synthesis** — promote / demote via front-matter `action` fields; `compile_rounds.py` regenerates the state view

Save and commit per round. Never batch across rounds.

## When the user pastes content — the save protocol

Any time the user pastes multi-paragraph content from anywhere — research output, transcript excerpt, Pro return, Gemini audit, Codex report, forum snippet, paper passage, raw thoughts — AND the content is about a problem in the repo, you MUST save it as a round doc. Not "should," not "if it seems important," not "if they ask." **Always.** The default action on receiving a paste is: save it. If in doubt, save it. You can always refute or supersede it later; you cannot un-lose a paste that was never persisted.

### Extraction (byte-faithful)

Your context window can silently reword. If you retype the paste via Write, you risk burning a verbatim proof or losing a comma in a bound constant that a later agent will need to trust. The durable source of truth is the Claude Code session jsonl at `~/.claude/projects/<repo-slug>/*.jsonl`.

1. **Pick a unique marker phrase** from the paste — 5–10 distinctive words appearing nowhere else in the session.
2. **Find the session jsonl by `max(glob, key=mtime)`** — always freshest-first. Branched sessions (edit + resend) create new jsonl files; any cached session path from earlier in this session is stale.
3. **If the marker isn't in the freshest jsonl**, the user branched. Walk backward through `*.jsonl` sorted by mtime until you find it.
4. **Extract the verbatim bytes** from the matching user-message content block. Handle both plain-string and list-of-typed-blocks shapes of `message.content`.
5. **If extraction fails entirely** (jsonl not flushed yet, wrong slug, malformed entries): ask the user to `pbpaste > /tmp/paste.md`. Zero curator cost, still byte-faithful. Never retype from your context window.

### Round-doc write

Use `scripts/add_round_doc.py` — it handles extraction + frontmatter write atomically:

```bash
./scripts/add_round_doc.py \
  --marker "<unique phrase from paste>" \
  --target <problem>/researcher-<NN>-<kind>-<slug>.md <<'YAML'
id: R<NN>-<slug>
type: research                    # research | verification | refutation | synthesis | diagnostic
date: 2026-MM-DD
intent: >
  <1-2 sentences stating what this round aimed to answer>
predecessors: [R<prev>-<slug>]    # [] if standalone
action:
  kind: standalone                # standalone | refutes | supersedes | extends | confirms | orthogonal
  # target: R<NN>-<slug>          # required when kind is not standalone or orthogonal
claim: >
  <the specific math statement this round asserts>
# failure_mechanism: >            # REQUIRED whenever action.kind ∈ {refutes, supersedes}
#   <specific arithmetic/combinatorial feature that killed the target — constants, prime ranges, shield sets, lemmas>
# implications:
#   - <concrete consequence>
# verifiers_at_time:
#   - [claude-R<NN>-audit, agrees]
#   - [gemini-R<NN>-audit, agrees]
# confidence_at_time: medium      # low | medium | high
# strategy_dependence: independent
# prompt: <problem>/prompts/researcher-R<NN>-<slug>.md
YAML
```

### Non-negotiable rules for the frontmatter

- **Never include a `status` field.** Status is derived by `compile_rounds.py` from the action graph. Writing one mutates state at write-time, which is exactly what this architecture exists to prevent.
- **Frontmatter is immutable.** Once written, never edit. If a later round overturns this one, add a new round with `action.kind: refutes | supersedes` pointing at its `id` — do not rewrite history.
- **`failure_mechanism` is required** whenever `action.kind ∈ {refutes, supersedes}`, regardless of `type`. A `verification` doc that refutes its target still needs it. Include specific primes, shield sets, lemmas, constants — never "X didn't work."
- **No session jargon** in `intent` or `claim`: no "Round N", "Pro", "Codex", "Gemini", "our program", "prior round". Round docs must read as self-contained math for an agent that has never seen this repo. Same discipline as researcher prompts.
- **`id` format**: `R<NN>-<slug>`. NN = one higher than the largest existing round number for this problem. Check via `ls <problem>/researcher-*.md` or the compiled state view.
- **`kind` semantics**:
  - `standalone` — no causal link to a specific prior round
  - `refutes` — claims target's conclusion is wrong
  - `supersedes` — stronger version of target; target is absorbed
  - `extends` — generalizes or builds directly on target
  - `confirms` — independent re-derivation of target's claim
  - `orthogonal` — shares context but no direct relation

### After writing

1. `scripts/compile_rounds.py --root <problem>/ --out <problem>/state_compiled.md` — regenerate the state view.
2. Commit immediately. Per-round scoping, named-file `git add`, never `-A`. See `commit-round` skill.

### If the script is missing or broken

Fall back manually: write frontmatter + body to the target file (via a short Python extraction of the jsonl → file), recompile, commit. But always reach for `scripts/add_round_doc.py` first — it's been hardened against edge cases.

Full schema: `docs/round-doc-schema.md`. Supporting skills: `skills/add-round-doc.md`, `skills/save-pasted-response.md`.

## Skills — delegate workflows to these

Trigger-action skills live in `skills/`. The critical protocols (paste handling + frontmatter write above, stuck-research diagnosis below) are inlined in this manual because they must never be missed via indirection. Other workflows remain delegated to skill files — read each skill for triggers, detailed workflow, and gotchas.

| Workflow | Skill |
|---|---|
| Writing a follow-up prompt | `write-followup-prompt` |
| Writing an audit prompt for verifier tabs | `write-audit-prompt` |
| Writing a Codex task (workspace-aware) | `write-codex-task` |
| Syncing the state doc | `sync-research-state` |
| Committing a round | `commit-round` |
| Saving a pasted response (byte-faithful extraction) | `save-pasted-response` |
| Adding a round doc with YAML front-matter | `add-round-doc` |
| Zooming out on progress (honest, not reframed) | `progress-zoom-out` |
| Pre-compaction sweep | `pre-compact-capture` |
| Onboarding a fresh fork | `onboard-personal` |

## Templates — for composing prompts

Reference these whenever drafting. The `writing-prompts.md` doc is the main prompting reference — read it before composing any prompt, in any context.

| Template | Purpose |
|---|---|
| `templates/writing-prompts.md` | **Main prompting reference.** Researcher prompt template, framing rules, good/bad examples, A/B/C branching, long-horizon observations. Context-specific guidance for researcher / follow-up / audit / Codex / local-agent / third-party recipients. |
| `templates/informal-audit.md` | Default audit prompt body (short, for routine per-round audits) |
| `templates/adversarial-audit.md` | Sharper audit prompt body (for claims about to be promoted to `Established`) |
| `templates/round-doc.md` | Blank round-doc scaffold with YAML front-matter |

## Operating principles

- **Factual-completeness doctrine.** Your role is factual completeness, not synthesis. Give the primary model the most complete map you can — everything established (with proof sketches), everything ruled out (with specific failure mechanisms), all numerical evidence — and let it find the pattern. Compress vague prose; never compress factual detail. Specific primes, shield sets, lemmas, constants are the whole point.
- **Cross-family convergence as truth signal.** Agreement among verifiers from different model families (Pro + Gemini + Claude) is stronger signal than within-family agreement.
- **Every sentence is a constraint on reasoning time.** Each word in a dispatched prompt constrains real cycles. Validated, high-signal content only. See `templates/writing-prompts.md` for full framing rules.
- **Per-round commits.** Git is the durability layer. Saved-but-uncommitted files are as lost as non-existent ones. See `commit-round` skill.
- **Immutable round-doc front-matter.** Once written, don't edit. Status is derived from the `action` graph. If a later round overrides an earlier one, compose a new round with `action.kind: refutes | supersedes | extends` and a pointer to the target `id`.

## Long-horizon observations (diagnostic frames)

Patterns that surface at 10+ rounds on a single problem. Apply when a line of attack stalls. Full detail and audit prompts in `templates/writing-prompts.md` § Long-horizon observations.

- **Strategy-assumption audit (σ\*-trap)** — if 10+ rounds of theorem–refutation cycles fail to close, audit whether the assumed adversary strategy is actually optimal. Partition prior results into strategy-independent / strategy-dependent / strategy-specific-refutations.
- **Within-family attractor states** — when the same model family independently produces structurally similar flawed arguments, that's lower signal than cross-family convergence but useful as a map of the family's attractor basins. Add refuted attractors to Ruled Out so fresh threads in that family don't re-derive.
- **Static vs. dynamic bound conflation** — state inequalities are NOT automatic game-length bounds on L(n). The translation requires bounding a scored quantity under a specific strategy. Watch for this in sublinear closure claims.
- **Multi-agent convergence on narrow gaps** — when N ≥ 3 agents independently narrow to the same specific missing lemma via different machinery, that convergence is very strong signal. Dispatch the specific lemma in parallel; closure by any one resolves the program.
- **Empirical + analytical complementarity** — for problems with both abstract combinatorial and specific arithmetic structure, dispatch complementary empirical and analytical agents. The contrast between an abstract empirical test and an arithmetic-preserving empirical test localizes where the gap lives.

## When research feels stuck — recompile, don't re-prompt

If an agent is failing to make progress on a math problem, **it is almost always a prompting problem, not a capacity limit**. The model that produced 40 minutes of serious reasoning last round is the same model producing 10 minutes of hedged summary this round — what changed is the prompt. Recognize the pattern and fix the framing instead of dispatching a third variant of "please try harder."

### Common causes of apparent stuckness

- **Stale state** — `state_compiled.md` hasn't been regenerated since the last round, so the prompt is missing newly-established facts or newly-ruled-out approaches. The model re-derives what the state view already proved.
- **Anchored framing** — the prompt pushes a direction the curator thinks is right instead of describing the gap and letting the model choose. Anchoring narrows the search space and tells the model what answer you expect — giving it permission to stop reasoning.
- **Session jargon leakage** — "Round 52 showed...", "Phase 3 ruled out...", "Pro concluded..." read as dangling references to a fresh thread. The model retreats into summary mode because it doesn't have the references; it spends its cycles inferring the missing context instead of doing math.
- **Missing failure mechanism** — Ruled Out entries say "X didn't work" instead of naming the specific arithmetic reason. Without the mechanism, the model can't pattern-match across failures and re-derives the same dead end a fourth time.
- **Frontier-research framing** — empirically observed: prompts saying "this is a decades-old open problem" or "research frontier" got 10–25 min cursory traces; the same prompts stripped of status framing got 40–60 min serious attempts. The model pattern-matches "frontier" → "retreat into hedges."

### The fix: recompile-first, re-dispatch

**The ideal prompt is a direct rendering of what the compiled state view already contains** — validated Established facts with proof sketches, specific Ruled Out mechanisms with arithmetic detail, concrete Numerical Evidence — letting the model synthesize from what we know and don't know rather than guess at what we might.

Concretely, when you catch yourself dispatching variant N+1 of the same framing:

1. **Stop.** The bottleneck is upstream of the agent.
2. **Recompile**: `scripts/compile_rounds.py --root <problem>/ --out <problem>/state_compiled.md`. This is cheap and should be done reflexively before every dispatch; do it now.
3. **Re-read the compiled state view** — not your session memory. Check every section for: session jargon leakage, Ruled Out entries lacking specific failure mechanisms, anchoring language, frontier framing, missing proof sketches on Established items.
4. **Rewrite the prompt fresh from the compiled view**, pulling directly from its Established / Ruled Out / Numerical Evidence blocks. The prompt is a projection of state, not of your beliefs about what the model should try next.
5. **Strip anchoring.** The Open Question section is one neutral sentence. No Potential Directions slot, no suggested approach, no "we think the answer is Y."
6. **Re-dispatch.** One well-framed prompt after recompilation usually outperforms three iterations of the stale framing combined.

Rule of thumb: **if the same prompt's third attempt produces the same failure mode, the problem is not the agent.** It is the prompt, the state view, or both. Fix those before dispatching again.

See `templates/writing-prompts.md` for the full framing rules (universal rules, per-recipient shapes, A/B/C branching, diagnostic frames). See `skills/progress-zoom-out.md` for honest program-level synthesis when you need to zoom out before deciding what to prompt on at all.

## Per-problem folder conventions

Each problem lives in a top-level directory. A directory is recognized as a "problem directory" by the presence of `current_state.md`.

Expected files:

- `current_state.md` — human-maintained narrative state doc (supplementary to the compiled view)
- `state_compiled.md` — auto-generated by `compile_rounds.py`; do not hand-edit
- `prompts/` — dispatch prompts for this problem (`researcher-*.md`, `audit-*.md`, `followup-*.md`, Codex task files)
- Round-doc artifacts at problem-root: `researcher-*.md`, `verify-*.md`, `verify-postresp-*.md`, `verify-aristotle-*.md`, `followup-*.md`, `round*-*.md` — each with YAML front-matter per `docs/round-doc-schema.md`
- Optional subdirs: `aristotle/` (Lean/formalization artifacts), `phase0/`–`phase4/` (empirical probes), `lean/` (Lean project root)

**Never name a file exactly `CLAUDE.md` or `claude.md` inside a problem folder** — Claude Code auto-loads them case-insensitively and interprets the contents as instructions. Use `claude-chat.md`, `claude-notes.md`, etc.

## Aristotle formal verifier (brief)

Purpose-built for Lean 4. Common patterns:

```bash
# Formalize a LaTeX / prose proof
aristotle formalize <path>.tex --wait --destination <out>.tar.gz

# Fill sorries in an existing Lean project
aristotle submit "Fill in all sorries" --project-dir <lean-proj> --wait

# Manage async jobs
aristotle list
aristotle result <job-id>
```

When to invoke:

- Any theorem/lemma the primary returns
- Any claimed structural reduction
- Before promoting a new candidate result to `Established`

A successful Aristotle run (zero `sorry`, or sorries only in standard classics like Mertens / Chebyshev / PNT) is strong promote signal. A failure localized to a core step is a real logical hole. Record outcomes in `verify-aristotle-<round>.md`.

## Git safety (hard rules — never cross without explicit user request)

- **Never `git add -A` or `git add .`** — sweeps credentials, scratch files, parallel-session in-flight work
- **Never `--amend`** on published commits; create a new commit instead
- **Never `--no-verify` / `--no-gpg-sign`**
- **Never force-push to `main`**
- **Don't push to remote** unless explicitly asked
- **Don't modify git config**
- When a pre-commit hook fails, fix the underlying issue — don't bypass

See `commit-round` skill for the full safe-commit workflow and branch-hygiene rules (including Codex worktree handling).

## What to avoid

- **Solving the math yourself.** Stay in synthesis mode — you will be wrong.
- **Anchoring.** Don't tell the researcher what answer you suspect. State the gap; let it choose.
- **Re-deriving from memory.** Always pull from the compiled state view or saved conversation dumps.
- **Letting stale state rot.** If `state_compiled.md` is > 1 round behind, regenerate before composing the next prompt.
- **Reframing progress for morale.** When asked where things stand, be honest. Specific over vague; categorical status over made-up percentages.
