# Lean verification plan — L(n) = o(n) manuscript (R176 → R177)

Date: 2026-07-23. Spec sources: the repaired manuscript (R177, superseding the
R176 original) and the referee report `fable/audit-R176-referee-raw.md`. The
axiom statements in §1 below are **drafts** — once R177's "axiom-ready"
appendix lands, reconcile against it; on any mismatch the R177 appendix wins
and this file gets a dated correction note (do not silently edit the drafts).

Executor: Codex (workspace + compile loop) or Aristotle; either way the
deliverable is a `lake build`-green Lean 4 project under `erdos-872/lean/`
plus a `verify-lean-R177.md` round doc quoting `#print axioms` verbatim.

---

## 0. Tiers — what "Lean-verified" means here

- **Tier 0 — statement skeleton (~1–2 h).** Every definition and every
  lemma/theorem *statement* type-checks; all proofs `sorry`. Already valuable:
  the extensive-form game definition and the inf/sup quantifier structure get
  machine-parsed, which is exactly where the referee found defects 1–3.
- **Tier 1 — game half proven, analytic half axiomatized (days of agent
  iteration, not hours).** Zero `sorry`; `#print axioms erdos872.main` shows
  exactly the declared axioms of §1 (plus Lean's classical axioms). **This is
  the recommended hard gate before any public claim.**
- **Tier 2 — discharge the axioms modulo mathlib classics.** Mertens- and
  Chebyshev-level facts are in mathlib; the Selberg sieve has formal precedent
  (Mellendijk). Strongly preferred, run async; do not block publication
  sequencing on it.
- **Tier 3 — fully axiom-free.** Gold standard; do not gate on it.

## 1. Axiom boundary (three analytic inputs — drafts)

> **Reconciliation note (2026-07-23):** the R177 appendix ("Appendix:
> analytic inputs in axiom-ready form", researcher-R177-repaired-manuscript.md)
> has landed and **supersedes the drafts below** per the rule above. Deltas
> from the drafts: A1 requires `X ≥ 2` (not 1) and names the constant
> `C_rough`; A2 takes real `K > 2` (not `K ≥ 2`) and names `C_dense(K)`;
> A3 requires `A ≥ 2`, places `1 ∈ E_N` explicitly (the `a_K(1)` edge), names
> `C_exc`, and is stated in the ε–N₀ form. Transcribe axioms from the R177
> appendix, not from the drafts.

Everything else in the manuscript is finite combinatorics / game induction /
elementary limits and gets **proven**, not assumed.

**A1 (Lemma 2.1, sieve bound).** There is an absolute constant `C` such that
for all real `X ≥ 1` and `z ≥ 2`:
`#{m : ℕ | 1 ≤ m ∧ m ≤ X ∧ ∀ p, p.Prime → p ∣ m → (z : ℝ) < p} ≤ C * X / Real.log z + 1`.
(The `+ 1` covers `z > X`, where only `m = 1` survives.)

**A2 (Lemma 2.2, K-dense density).** Definition: for `K ≥ 2`, `a : ℕ` is
`KDense K` iff, enumerating its prime factors with multiplicity in increasing
order `p₁ ≤ … ≤ p_r` with partial products `a₀ = 1, a_i = p₁⋯p_i`, we have
`p_{i+1} ≤ K * a_i` for all `i < r`. Constants: `c₀ := 1 / Real.log 2`,
`κ := c₀ * Real.log c₀ − c₀ + 1` (prove `κ > 0.086` numerically via mathlib's
log-2 bounds — cheap). Statement: for every `K ≥ 2` there is `C_K` with
`#{a ≤ X : KDense K a} ≤ C_K * X / (Real.log X) ^ κ` for all `X ≥ 3`.

**A3 (Lemma 2.3, exceptional density).** With `a_K, t_K` defined
*computably* in Lean (greedy block; see §3) and, for parameters
`δ ∈ (0,1)`, `A : ℕ, A ≥ 1`, `K ≥ 2`, `γ ∈ (0,1)`:
`E N := {x ≤ N : x ≤ δ*N ∨ a_K x ≤ A ∨ (a_K x : ℝ) > N^γ}`,
there is an absolute `C` such that for every `ε > 0`, eventually in `N`:
`|E N| ≤ (δ + C * (1 + Real.log A) / Real.log K + ε) * N`.

*Boundary choice:* A3 is derivable from A1 + A2 by partial summation
(manuscript §2 does exactly this). Axiomatizing only A1 + A2 and proving 2.3
is the better boundary if the partial-summation bookkeeping is tolerable;
implementer's choice — declare which was taken in the report.

## 2. What gets proven (the game half — no analytic content)

In manuscript order: robust-game definition + value function well-defined
(termination measure, §3 below); `V_b(N) ≤ N`; monotonicity `V_b ≤ V_{b+1}`;
`L(n) ≤ V_1(n)` (first opening move kills `1`; positions then coincide);
`a_K/t_K` identities (`x = a_K x * t_K x`, `P⁻(t_K x) > K * a_K x` by
construction); self-roughness of useful tags (`P⁻(t) > (K*δ) * N/t`, needs
`K*δ > 1`); Lemma 3.1 (two self-rough tags with lcm ≤ N are nested); root
existence by finite descent; cone disjointness, mutual incomparability, and
covering of non-exceptional vertices; projection (3.12)–(3.14) (external
selection acts on a cone as the principal quotient upset `{m : q ∣ m}`,
`q = r/(r,t)`; global upsets project to local upsets); **local-trace lemma**
(each activated cone's induced history is a legal robust game with at most
`max{b+1, 2} = b+1` opening selections, `b ≥ 1` — the repaired §4.3; the
referee's two-case count is the spec); sweep-strategy totality (root sweep /
local response / local-pass advance / **exceptional fallback**); drafting
pairing (4.1) with injectivity (`W_A ≤ W_C + (b+1)·ν_max`); the three-class
selection partition (exhaustive, disjoint); weight bounds
(`#roots ≤ N/A`, `ν_max ≤ N^γ/δ`, `W_A ≤ ½(N + N/A + (b+1)N^γ/δ)`); master
inequality (4.7); the recursion `c_b ≤ ½·c_{b+1}` under
`δ = A⁻², K = ⌈e^{A³}⌉, A → ∞`; `c_b ≤ 1`; finite iteration
`c_1 ≤ 2^{−r}` for every `r`; hence `c_1 = 0` and `L(n)/n → 0`.

## 3. Encoding design decisions

- **Position:** `structure Pos` with `N : ℕ`, `live : Finset ℕ`,
  `phase : Phase` where
  `Phase := opening (budget : ℕ) | toMove (who : Player)`.
  Downset-ness of the initial `live` is a hypothesis carried by lemmas, not a
  subtype field.
- **Erasure actor folded into the maximizing coalition:** one step =
  *(coalition picks an erasable set, then the scheduled actor acts)*. The
  coalition erases before Prolonger actions **and before Shortener actions**
  (the local simulation needs both). Since we *define* `V_b` in Lean this
  way, no informal equivalence argument is needed; the referee's
  "union of erasures" note justifies one erasure per step.
- **Erasable set:** `U ⊆ live` with `U = V ∩ live` for `V` an upset of the
  original downset `D`. This matches what projections produce. **Pin the
  definition against R177 §1; if R177 is ambiguous here, that is a manuscript
  bug — report it, do not improvise semantics.**
- **Moves:** opening: Prolonger selects (budget−1) or ends opening (→ S to
  move). Post-opening P: select or pass (→ S). S: must select a legal live
  vertex if one exists; else game over. Game over exactly when no legal live
  vertex remains. A selection of `x` removes all of `live` comparable to `x`
  (including `x`); erasures only remove availability, never undo selections.
- **Score = number of selections by BOTH players** (game length), not P's
  count.
- **Termination measure** (for well-founded recursion of the value):
  `μ(pos) = 2*|live| + budget + turnbit` with `turnbit = 1` iff P is to move.
  P-select / S-select: `|live|` drops ≥ 1 → μ drops. P-pass: turnbit 1→0.
  End-opening: budget drops. Erasures happen inside the same step as the
  action, so a null-erasure step still decreases μ via the action. ✓
- **Value, not strategies:** define `v : Pos → ℕ` by backward induction
  (max over coalition options at P/E nodes, min over selections at S nodes).
  This *is* `inf_{σS} sup_{σP,σE}` for a finite perfect-information game —
  never define it sup-then-inf. All §4 "strategy" arguments compile to:
  bound `v` by structural induction, choosing the sweep branch inside the
  `min`. No strategy type needed anywhere.
- **Limits:** prefer elementary `∀ ε > 0, ∃ N₀, …` forms over `Filter.limsup`
  where possible; `c_b` via `limsup` of `fun N => V_b N / N` only where the
  recursion forces it.
- **No mathlib game theory** (`SetTheory.Game` is the wrong object). Finset,
  Nat.factorization, Real only.

## 4. Milestones and acceptance

- **M0** scaffold: `lake new`, mathlib pin, CI-able build. (hours)
- **M1** game definition, μ-termination, value function, `V_b ≤ N`,
  `V_b ≤ V_{b+1}`. — end of Tier-0 content; commit the all-`sorry` skeleton
  as its own artifact before proving anything.
- **M2** original game `L`, and `L(n) ≤ V_1(n)`.
- **M3** arithmetic layer: computable `a_K/t_K` + identities, `KDense`,
  Lemma 3.1, tags/roots/cones, disjointness + covering.
- **M4** projection + **local-trace lemma** — hardest single piece; the
  referee's two-case argument is the spec. Budget the most iteration here.
- **M5** sweep induction: (4.1), class partition, weight bounds, (4.7).
- **M6** recursion + limits → `theorem main : Tendsto (fun n => (L n : ℝ)/n) atTop (𝓝 0)`
  (equivalently ∀ ε > 0 eventually `L n < ε*n`).
- **M7** (Tier 2) discharge A1 (adapt formal Selberg sieve), A2 (Rankin
  moment argument — elementary and very formalizable), A3 (partial summation
  from A1+A2).

Acceptance per milestone: `lake build` green. Final acceptance:
`#print axioms erdos872.main` lists exactly the §1 axioms (or fewer). Honest
effort: Tier 0 in 1–2 h; M1–M6 is realistically **days** of Codex/Aristotle
iteration — M4/M5 dominate. Do not promise 1–2 h for Tier 1.

## 5. Pitfall checklist (each item is a referee finding or a known trap)

1. Quantifier order: value = backward induction = `inf_{σS} sup_{σP,σE}`.
2. Erasures: availability only; never undo selections or revive vertices;
   erasable = upset-of-D intersected with live (pin to R177 §1).
3. Local opening bound is `max{b+1, 2} = b+1` and **requires `b ≥ 1`** —
   state the lemma with that hypothesis (the recursion only uses `b ≥ 1`).
4. S's strategy total: the exceptional-fallback branch (select any legal
   vertex outside all root cones) must appear in the induction, its
   selections charged to `|E_N|`.
5. `A ∈ ℕ` (needed for `q_t = ⌊ν_t⌋ ≥ A`); `γ ∈ (0,1)` fixed throughout;
   deterministic tie-break in the root order (e.g. smallest `t` first among
   equal `ν`).
6. Downsets contain 1; in `L(n) ≤ V_1(n)` the first opening move kills 1.
7. Passes: P-pass forces an S-selection or the game is over; P cannot stall.
8. Score counts both players' selections.
9. Any manuscript sentence that cannot be stated as written = manuscript bug:
   **report, never improvise semantics.** Surfacing these is Tier 0's job.
10. (V177 audit) Shortener's four response rules are "first rule that
    supplies a move" — encode the precedence explicitly; the literal
    "Otherwise" chain under-specifies the case where Prolonger's selection
    just terminated an active cone's local game.
11. (V177 audit) In the local-trace construction, insert local Prolonger
    passes only AFTER Shortener's first local selection; before it, the
    opening-end declaration already schedules Shortener, and an inserted
    pass there would not be a legal robust-game event.

## 6. Reporting

Round doc `verify-lean-R177.md` (or `verify-aristotle-R177.md`): toolchain +
mathlib pin, milestone reached, `#print axioms` output verbatim, list of any
manuscript bugs surfaced (each becomes its own round doc if substantive).
Commit the Lean project per milestone, named files only.
