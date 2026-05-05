# Codex Task: Ship-Blocker Cleanup from Two Pro Reviews

Two full-paper Pro audits (rigor + presentation) found no fatal math but
flagged a bundle of definition-consistency and citation-anchor issues that
should be resolved before arXiv submission. None of these require new
mathematics — the rigorous versions already exist in the paper or in repo
research files. This task is integration and wording work.

Working directory: `/Users/omisverycool/erdos-harness`.
Paper directory:   `erdos-872/paper/`.

## Compile / workflow rules

- Rebuild with `tectonic -X compile main.tex` from `erdos-872/paper/` after
  each commit. Zero undefined references, zero missing citations.
- Three commits, one per sub-item group (A, B, C). No amend, no force-push,
  no `--no-verify`.
- Push after all commits with `git push origin HEAD`.

---

## Group A — Definition consistency fixes

Commit message: `Paper: align L_n and T2 quantifier conventions across intro/body/appendix`.

### A1: Intro `L_n(P)` definition mismatch

Pro review #2 finding:

The introduction's weighted shield setup (currently in
`sections/01-introduction.tex` around the `\beta_n(P)` definition) writes

```
L_n(P) := {x ≤ n/2 : x ∤ u for every u ∈ P}
```

but `sections/02-notation-and-setup.tex` defines

```
L_n(P) := {x ∈ L_n : x ∤ u for every u ∈ P}
```

where `L_n := {m ∈ Z : 2 ≤ m ≤ ⌊n/2⌋}`. The intro version, literally read,
includes `x = 1` and real / nonpositive `x`, which changes the formal meaning
of `β_n(P)`.

**Fix:** In the intro, write the definition to match the body — either as
`{x ∈ L_n : ...}` (after first introducing `L_n`), or explicitly as
`{x ∈ Z : 2 ≤ x ≤ ⌊n/2⌋, x ∤ u for every u ∈ P}`. Also fix the
`τ(n)` definition immediately below, which uses `L_n` before it is defined
in the intro.

**Suggested inline fix:** Define `L_n := {2, 3, ..., ⌊n/2⌋}` and
`\U_n := {m : n/2 < m ≤ n}` together in the paragraph preceding the
weighted shield definitions, then use `L_n` uniformly from that point on.
The body's `Section 2` remains as-is (it repeats the definitions formally,
which is fine).

### A2: T2 quantifier convention

Pro review #2 finding:

The `T2` theorem's quantifier story differs across three locations:

- **Intro** (`sections/01-introduction.tex`): "absolute `c > 0`" version.
- **Body** (`sections/04-lower-bounds.tex`, `thm:t2`): "for every fixed
  `0 < δ < 1/4`, there exists `c_δ > 0`".
- **Appendix** (`sections/appendix-A-deferred-proofs.tex`, end of
  `prop:t2-final`): "choosing `δ = 1/8` gives an absolute constant `c > 0`
  and proves `thm:t2`".

These are compatible but not aligned. The canonical convention in the
research record is the per-`δ` version — see
`erdos-872/researcher-13-pro2-odd-fan-strengthened.md:37–47`, which states
it for every fixed `δ ∈ (0, 1/2)`.

**Fix:**

1. Body theorem `thm:t2` stays as the per-`δ` statement: "For every fixed
   `0 < δ < 1/4` there exists `c_δ > 0` such that `L(n) ≥ c_δ · n (log log
   n)^2 / log n`, conditional on the restricted safe-edge hypothesis."
   (The `(log log n)^2` scale is correct here — this is T2, not the
   unconditional fan-capture theorem.)

2. Intro paragraph: change the wording to state the δ=1/8 corollary
   explicitly: "Choosing `δ = 1/8` in `\Cref{thm:t2}` gives an absolute
   constant `c > 0` such that `L(n) ≥ c · n (log log n)^2 / log n`,
   conditional on the restricted safe-edge hypothesis (`\Cref{def:safe-edge}`)."

3. End of `prop:t2-final` proof: change the closing sentence from "choosing
   `δ = 1/8` gives an absolute constant `c > 0` and proves `\Cref{thm:t2}`"
   to "this proves the per-`δ` statement `\Cref{thm:t2}`; the intro's
   absolute-`c` corollary follows by specializing `δ = 1/8`."

### A3: Appendix A definition ordering

Pro review #2 finding:

`sections/appendix-A-deferred-proofs.tex` uses `Q`, `G(n, δ)`, and the phrase
"alternate-scoring move" before defining them. The rigorous definitions all
exist in the appendix itself (lines ~99–200) but appear after first use —
for example, `prop:t2-safe-edge-refutation` uses `G(n, δ)` and
"alternate-scoring move", but both are only defined inside
`prop:t2-finite-capture` which comes later.

**Fix:** Introduce a short self-contained definitions subsection at the top
of Appendix A's T2 block (before `def:safe-edge`), containing:

1. Definition of the scored rank-three slot hypergraph `G(n, δ)` with
   edges `e_{a,c,b} := {b, ab, cb}` and the allowed game rules
   (Maker/Breaker, scored-edge reply, alternate-scoring move).

2. Definition of the potential
   `Q := 8 S + Σ_{e live} 2^{|e ∩ C|} w(e)`.

3. Definition of the "alternate-scoring move": Maker scores a target
   without adding slot vertices to `C`.

After this definitions subsection, `def:safe-edge` can refer to `Q` directly
("Q at least as large as it was before Maker's move"), and the
counterexamples (`prop:t2-safe-edge-refutation`, `prop:t2-max-gain-counterexample`)
read cleanly.

Do not rewrite the rigorous content — just move the definitions up. The
supplementary research source for this game class is
`erdos-872/researcher-56-pro-finite-odd-carrier-separator-only-negative-theorem.md`
(lines 42–107), which confirms the definitions are already rigorous.

### A4: Duplicate q-shadow labels

Pro review #2 finding:

In `sections/08-obstructions.tex`, both `prop:q-shadow` and
`prop:q-shadow-dichotomy` are attached to the same proposition.

**Fix:** Keep `prop:q-shadow-dichotomy` (more descriptive) and remove
`prop:q-shadow`. Update any `\Cref{prop:q-shadow}` references in the rest
of the paper to `\Cref{prop:q-shadow-dichotomy}`.

---

## Group B — Citation additions for classical analytic number theory

Commit message: `Paper: name classical analytic NT citations at first use`.

Pro review #1 finding:

Several load-bearing classical results are used without explicit theorem
names. Hardy–Wright is cited generically in several places but the
specific theorems should be named.

**Fixes (search and add named-citation remark at first use):**

1. **Prime Number Theorem / uniform PNT.** Used in `thm:theorem-A`,
   `thm:fan-lower-bound`, `prop:local-density`, `prop:t2-initial-mass`.
   At first use (likely `thm:theorem-A`), add a sentence like
   "We use the Prime Number Theorem (Hardy–Wright
   [\cite{HardyWright08}, Theorem 3]) and its uniform form in fixed
   multiplicative intervals `[xY, x]` for `Y` bounded away from 1 and
   ∞." Subsequent uses can be unqualified.

2. **Mertens' theorem for primes.** Used in `thm:theorem-A`,
   `thm:fan-lower-bound`, `prop:t2-initial-mass`. At first use, write
   "by Mertens' theorem (Hardy–Wright [\cite{HardyWright08}, Theorem
   429])". Find the actual Hardy–Wright theorem number if the reference
   has a different edition; otherwise cite the name.

3. **Chebyshev's `θ(x) ∼ x`.** Used in `thm:theorem-A`'s log-budget
   inversion. At first use, write "by Chebyshev's theorem
   `θ(x) ∼ x` (Hardy–Wright [\cite{HardyWright08}, Theorem 7])".

4. **Landau's fixed-r almost-prime count.** Already used in `thm:bonf-comp`
   with a Hardy–Wright citation. Update to name the theorem: "by Landau's
   theorem on the count of `r`-almost-primes (Hardy–Wright
   [\cite{HardyWright08}, Theorem 437])". Verify the theorem number.

If any theorem number cannot be verified against the cited edition, write
the name only (e.g., "by Mertens' theorem") without a theorem number, and
flag the uncertainty in the commit message.

Target length: roughly 4–8 word additions at each first-use site. Do not
bloat the proofs.

---

## Group C — Sherali-Adams bibliographic anchor

Commit message: `Paper: add Sherali-Adams 1990 bibliographic anchor to prop:sa-barrier`.

Pro review #1 finding:

`prop:sa-barrier` in `sections/08-obstructions.tex` uses "level-`r`
Sherali–Adams relaxation" and "lifted LP variables" extensively without
citing the original Sherali–Adams paper.

The repo's R52/R58 research files use the SA hierarchy but do not include a
formal bibliographic citation. The standard original reference is:

> Sherali, H. D., and Adams, W. P. (1990). "A hierarchy of relaxations
> between the continuous and convex hull representations for zero-one
> programming problems." *SIAM Journal on Discrete Mathematics*, 3(3),
> 411–430.

**Fix:**

1. **Add to `references.bib`** a new bibtex entry:

```
@article{SheraliAdams90,
  author  = {Sherali, Hanif D. and Adams, Warren P.},
  title   = {A hierarchy of relaxations between the continuous and convex hull representations for zero-one programming problems},
  journal = {SIAM Journal on Discrete Mathematics},
  volume  = {3},
  number  = {3},
  pages   = {411--430},
  year    = {1990}
}
```

2. **Cite in `prop:sa-barrier`** at the first mention of "Sherali-Adams":
   change the first mention from bare "Sherali-Adams" to "Sherali-Adams
   \cite{SheraliAdams90}". Subsequent mentions can be unqualified.

3. **Verify compile** — the reference should now appear in `main.bbl` and
   the paper should have no missing-citation warnings.

---

## Final self-audit

After three commits, write a short self-audit (under 250 words) covering:

1. For each group A/B/C: which changes were straightforward, which required
   judgment calls on wording, and which you flagged as uncertain.

2. For Group B: which Hardy–Wright theorem numbers you could verify against
   the reference, and which you wrote with name-only. If you added a
   theorem number that is edition-dependent, flag it.

3. For Group A3 (appendix reorder): confirm that no rigorous content was
   altered — only ordering and one or two linking sentences.

4. For Group C: confirm the new `SheraliAdams90` entry compiles cleanly
   and renders as an `amsalpha`-style citation consistent with the other
   entries.

5. Remaining gaps, if any — e.g., if the `τ(n)` definition in the intro
   still reads awkwardly after A1, flag for human review.

Push after all three commits.
