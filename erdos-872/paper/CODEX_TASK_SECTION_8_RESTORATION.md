# Codex Task B: Section 8 Barrier Restoration from Repo Sources

Pro's round-3 rigor audit found all three barrier theorems in Section 8 under-
specified or imprecise as integrated into the paper:

- `prop:sa-barrier` (R1k): the Sherali-Adams claim is not proved in the
  paper. The proof does not define lifted variables or verify SA
  constraints; it only gives an informal conditioning heuristic.
- `prop:q-shadow-dichotomy` (R1l): the first inequality is misidentified.
  `σ_q(D)` is defined as the fraction of h-sets covered, not the fraction
  of forbidden q-sets. The repair requires LYM / normalized matching on
  the Boolean lattice.
- `prop:separator-only` (R1m): terms such as "covers the corresponding
  support $T$" and "positive residual packet" are not quantified. The
  claim is informal; needs precise definition or demotion.

**These are not math errors in the underlying results.** All three are
compressions from repo-source audits that ARE rigorous. The fix is to
re-expand Section 8 using the repo sources as ground truth.

Working directory: `/Users/omisverycool/erdos-harness`.

## Source-of-truth documents

- `erdos-872/researcher-58-pro-R52-integrality-barrier-audit-confirmed-sharpened.md`
  (953 lines) — full rigorous SA construction with lifted box constraints,
  product Bernoulli pseudo-solution, exhaustive small-N verification.
- `erdos-872/researcher-59-pro-R53-q-shadow-dichotomy-audit-confirmed-sharpened.md`
  — confirmed fixed-q argument with sharpened formulation and required
  normalization; contains the paper-facing theorem with the LYM-consistent
  first inequality.
- `erdos-872/researcher-56-pro-finite-odd-carrier-separator-only-negative-theorem.md`
  (637 lines) — precisely characterized proof class, carrier family,
  packet structure, covering relation; rigorous negative theorem.

## Compile / workflow rules

- Rebuild with `tectonic -X compile main.tex` from `erdos-872/paper/`.
- One commit per sub-item (3 commits total).
- No amend, no force-push, no `--no-verify`.
- Push after all commits with `git push origin HEAD`.

## Task B1 — Restore Sherali-Adams barrier (R1k) from R58

The R58 audit gives the rigorous SA proof the paper is missing. Read
through the R58 source and integrate the following into Section 8's
SA-barrier subsection:

1. **Theorem statement.** Use R58's sharpened form: for every $0 <
   \alpha < 1$ (relaxed from $0 < \alpha < 1/2$), there exists a family
   $\mathcal C \subseteq \binom{P}{\ell}$ with the stated cover/covering
   properties and integer transversal $> \alpha N$.

2. **Random construction.** R58's random construction for $\mathcal C$
   is correct as cited in the paper. Keep it. Update the hypothesis
   range.

3. **Sherali-Adams proof.** Replace the paper's informal "conditioning
   heuristic" with R58's rigorous SA proof at lines 650-847. Key
   elements:

   - Define the lifted LP variables explicitly (one variable per
     $(C, I, J)$ triple with $|I \cup J| \le r$).
   - Define the product Bernoulli pseudo-solution at level-$r$: each
     variable $y_{(C, I, J)}$ is set to $p^{|I|}(1-p)^{|J|}$ with
     $p = 1/(\ell - r)$.
   - Verify the lifted box constraints $0 \le y_{(C, I, J)} \le 1$ (R58
     at line 682).
   - Verify the level-$r$ Sherali-Adams constraints: for every set
     cover constraint and every lifting subset $(I, J)$ with $|I \cup J|
     \le r$, the lifted inequality has nonnegative expectation under
     the pseudo-solution.
   - Compute the lifted objective value and show it is $\le N/(\ell -
     r)$.

4. **Exhaustive small-N check (optional but reproducible).** R58
   includes an exhaustive check for $N \le 7$ verifying the SA
   pseudo-solution is feasible across all $(C, I, J, \ell, r)$
   configurations using exact rational arithmetic. Reference this check
   in the paper appendix or as an artifact-repository script at
   `scripts/sa_barrier_verification.py` (create the script if it does
   not exist).

5. **Conclusion sentence.** R58's closing interpretation: "no argument
   whose entire certificate is bounded by the above level-$r$ SA
   relaxation can certify a transversal lower bound exceeding
   $N/(\ell - r)$ on these instances, even though the true integral
   optimum is $> \alpha N$." Integrate this as the barrier theorem's
   conclusion.

Target length: the SA-barrier subsection should approximately double from
its current compressed form. Aim for ~80-120 lines in the paper body
after expansion, with the proof detailed enough that a referee can
verify without consulting R58.

Commit message: `Paper: restore rigorous Sherali-Adams barrier proof from R58 audit`.

## Task B2 — Repair q-shadow dichotomy (R1l) using R59

Pro's audit found the first inequality in the current
`prop:q-shadow-dichotomy` is misidentified: $\sigma_q(\mathcal D)$ is the
fraction of $h$-sets covered by $\mathcal D$, not the fraction of
forbidden $q$-sets.

R59 has the correct sharpened formulation. Read R59 and integrate:

1. **Required normalization.** R59 specifies $L \ge 1$ and $1 \le q \le
   h$; include these as explicit hypotheses. The $q = 0$ case is
   degenerate (strict statement false).

2. **Two sharpenings R59 provides:**

   (i) Use the actual live density $r = |R|/|Y|$, not only the
       threshold $\eta$.
   (ii) State the exact covering conclusion before applying the union
        bound.

3. **Repair the first inequality via LYM / normalized matching.** The
   current paper writes "by the union bound $|A|/|X| \ge 1 -
   \sigma_q(\mathcal D) - |\mathcal C|\delta_q$." Pro's diagnosis: this
   mis-identifies $\sigma_q(\mathcal D)$. The correct argument uses the
   LYM (normalized matching) property: the upper $h$-shadow measure of
   a $q$-family is at least its $q$-level measure (equivalently, for
   $\mathcal F \subseteq \binom{P}{q}$, $|\partial_h \mathcal F| /
   \binom{K}{h} \ge |\mathcal F| / \binom{K}{q}$).

   Rewrite the first inequality using LYM to correctly bound $|A|/|X|$
   in terms of $\sigma_q$ and the covered fraction of forbidden $q$-
   sets. Cite the LYM property explicitly (e.g., Bollobás
   *Combinatorics* Theorem 3.4 or Anderson *Combinatorics of Finite
   Sets* §2.2).

4. **Expander-mixing calculation.** Pro's audit confirms the rest of
   the expander-mixing calculation (after the first inequality) is
   fine. Preserve it as-is; just fix the first step.

5. **Central-scale constants.** R59 gives the central-scale asymptotics
   $\delta_q = (e + o(1)) h^{-2}$ and $\lambda_q^2 = (2 + o(1)) \log h
   / h$ at $q \sim 2 (\log h)^2$, $L \sim h/\log h$. Preserve these
   exactly.

Target length: +15-25 lines over the current version (the repair is a
proof-step fix, not a full rewrite).

Commit message: `Paper: repair q-shadow dichotomy first inequality using LYM, from R59 audit`.

## Task B3 — Re-expand separator-only limitation (R1m) from R56

The current `prop:separator-only` uses informal terms: "covers the
corresponding support $T$," "positive residual packet." Pro says the
claim must be precisely quantified or demoted to a remark.

R56 is 637 lines of rigorous negative structural theorem with precisely
characterized proof class. Re-expand Section 8's separator-only
subsection from R56.

Specifically, R56 provides:

1. **Precise definition of the "finite odd-carrier separator-only
   closure" proof class.** State it fully in Section 8 using R56's
   definitions: the carrier family, the packet structure, the covering
   relation $S \subseteq T$, and the allowed moves.

2. **Quantitative negative theorem.** R56 proves the proof class cannot
   prove $O(r_1(n))$ or any $o(n)$ upper bound, with explicit constants
   and a concrete obstruction. Integrate the theorem statement with all
   quantifiers (e.g., for every finite carrier family, for every
   covering closure of a given kind, etc.).

3. **Proof.** R56's proof gives the specific obstructive family of
   terminal antichains showing the class cannot reach the target. Pull
   in the full proof at theorem-proof level, not a sketch.

4. **Scope statement.** R56's final interpretation: the theorem is
   class-level; it does not rule out arbitrary separator-involving
   proofs, only closures of the specific finite-odd-carrier form.
   Preserve this scope clarification.

Target length: approximately triple the current compressed version,
probably 60-100 lines when fully expanded. The compressed one-paragraph
remark is demoted to a full sub-section-length proof.

Commit message: `Paper: re-expand separator-only limitation theorem from R56 rigorous source`.

## Compile verification

After each commit, `tectonic -X compile main.tex` must succeed with zero
undefined references and zero missing citations. Any new labels
introduced in Section 8 (LYM citation, SA constants, separator-only
class definitions) must be consistent.

## Final self-audit

After three commits, write a short self-audit (under 300 words)
covering:

1. For each of B1, B2, B3: which parts of the repo source you pulled
   verbatim, which you condensed, and which you wrote fresh to fit the
   paper's style. Flag any step in the repo source you omitted.

2. Did Section 8's total length grow as expected (roughly double)? If
   dramatically less, you may have compressed again — flag for re-audit.

3. Did any new cross-references into the rest of the paper get
   introduced? (E.g., the LYM citation might need a new bib entry.)

4. For any passage where R58/R59/R56 contains a proof longer than a
   referee would accept, note how you shortened it while preserving
   rigor.

5. Remaining gaps, if any.

Push after the three commits.
