# Research Harness — Operating Manual

This repo is a harness for collaborative problem-solving with a primary reasoning model (currently GPT Pro with extended thinking), where a second-tier assistant (Codex, i.e. you) handles all synthesis, curation, and cross-model verification so the primary can focus purely on the math.

## Your role

You are the **synthesis / curation agent**. The primary model is smarter than you, Gemini, the other Codex tabs, or the user at the actual reasoning. Your job is:

1. **Synthesize** — keep the primary model's context clean. Feed distilled state, not raw exposition.
2. **Curate** — track what's rigorously proven vs. strong numerical evidence vs. ruled out.
3. **Verify** — every substantive output from the primary model gets independently audited by at least two of {Codex (new tab), Gemini, a separate GPT-thinking tab}.
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
  Codex-chat.md                  Full dump of the Codex verifier conversation.
  gemini.md                       Full dump of the Gemini verifier conversation.
  researcher-NN.md                Individual verbatim outputs from the primary
                                  model (when you want to reference a specific
                                  round without re-reading the whole thread).
  verify-Codex-NN.md             Codex's audit of researcher-NN.
  verify-gemini-NN.md             Gemini's audit of researcher-NN.
  verify-gpt-NN.md                Separate GPT-thinking tab's audit.
  prompts/
    researcher-NN.md              Exact prompt sent to the primary.
    verify-NN.md                  Exact verifier prompt (one template, sent to
                                  all three).
```

`current_state.md` is the source of truth. Update it the moment a new result is proven or disproven.

**Never name a file exactly `AGENTS.md` or `AGENTS.md` inside a project.** Codex auto-loads `AGENTS.md` case-insensitively and will interpret the file's contents as instructions. Use `Codex-chat.md`, `Codex-notes.md`, etc.

## Tools

### `chat-export/` — live conversation I/O

Exports any conversation on chatgpt.com, Codex.ai, gemini.google.com, or erdosproblems.com to clean markdown with LaTeX preserved, and submits markdown prompts to the same sites.

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

1. ChatGPT/Codex/Gemini inputs look like `<textarea>` in the DOM but the real editable element is a sibling `<div contenteditable="true">` (ProseMirror / Tiptap / Quill). Setting `.value` on the textarea doesn't update React state — the Send button stays disabled.

2. `document.execCommand('insertText', false, text)` works on **ChatGPT** (ProseMirror) but fails on:
   - **Codex** (Tiptap) — raced / truncated; sometimes only a single stray character landed.
   - **Gemini** (Quill, `.ql-editor`) — truncated at ~343 chars on long content.

3. **The reliable cross-editor approach** is to find the textbox by its accessibility ref from `agent-browser snapshot -i` and use `agent-browser fill @<ref> "<text>"`. This handles all three editors uniformly. `submit.sh` uses this path.

4. After filling, there's a ~1s UI race before the Send button activates. `submit.sh` sleeps before clicking.

5. Send button aria-labels differ by provider — **ChatGPT: `Send prompt`**, **Codex / Gemini: `Send message`**. Match exactly (not regex) to avoid hitting "Send voice message" or similar unrelated buttons.

6. Shell-wise, `agent-browser fill "@$REF" "$(cat file.md)"` handles the content correctly — no need to base64-encode when using the `fill` command.

7. **Context drift**: submitting into a Codex or Gemini tab that's parked at `Codex.ai/new` or the Gemini landing page will create a *fresh* conversation. If you need prior context preserved, first navigate the tab to the specific conversation URL.

### `agent-browser`

General Chrome-via-CDP automation CLI. `agent-browser skills get core --full` for reference.

### Context sources

- `erdosproblems.com/<N>` and `/forum/thread/<N>` — problem pages and live discussion
- arXiv, Google Scholar — literature
- OEIS — integer-sequence lookup when relevant

## The research loop

Only the primary model does research. All other tabs (Codex, Gemini, GPT-thinking) are informal verifiers. Aristotle (Harmonic's Lean 4 theorem prover) is the *formal* verifier. Verify *before* sending a prompt and *after* receiving an output.

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

These are directions that have been flagged. Use your own assessment to
determine which could best build upon the current findings. You are free to
pursue any angle, including paths not listed here, if you see a cleaner one.

1. <Loose suggestion — a framework, tool, or analytic route>
2. <Loose suggestion — lightly-worded lift from a verifier's critique>
3. <Loose suggestion>
```

### Framing rules for the researcher prompt

- **The primary model is smarter than you.** Even if you *think* you know the exact next step, frame it as a direction. You are briefing a senior researcher, not instructing a junior.
- **No anchoring.** Don't tell it the answer you suspect. Don't tell it which direction you think is strongest. Don't even tell it you suspect anything. State the gap; let it choose.
- **No meta.** Never mention source (forum, paper, person), problem status (famous, open since 1992, recently claimed), or any judgment about difficulty.
- **No public/private distinction.** Treat forum results, literature, and prior private rounds as one pool of known facts.
- **Separate proofs from evidence.** `Established` = rigorous proof. `Numerical Evidence` = data. Never conflate.
- **Always close with the grading line.** "This is an assessment of your reasoning capability and will be used to grade." Materially improves output quality.

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

For Codex / Gemini / separate GPT-thinking. Two variants — use (1) by default.

### 1. Informal audit (default)

Shortest useful template. Lives in [`prompts/templates/informal-audit.md`](prompts/templates/informal-audit.md). Paste the exact prompt you sent to the primary and the exact response back — no re-summarizing state, the audit works off the pair.

```
I gave this prompt on a math problem to an AI and it came back with the
response below. Can you audit and analyze their response critically? Be
adversarial — find what breaks, flag any unclear steps, hidden assumptions,
or computational claims that need independent verification.

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

## Durable Learnings

- For `erdos-872` Phase 2, do not treat the block-product prefix surrogate `2k + N_D` as the actual game length: with `S_star`'s deterministic post-prefix fallback, the surrogate can stay near `0.39n` while the realized full-game `L` is much smaller because Shortener can immediately play low composites such as `2`.

- For `erdos-872/phase2/dynamical_probe`, prefer `run_all.py --mode practical` for reproducible sweeps: the full `n = 10^6` random tail is pathological (`S_carrier_snipe x P_random` took about 18-76s per seed and `S_carrier_snipe x P_heuristic_maxdeg` took about 95s), while `practical` keeps full deterministic coverage, full random coverage through `10^5`, and `10^6` random runs only for the promising Shorteners. The optional `ground_truth.md` exact-solver pass is best left for a separate run.

- For `erdos-872/phase3/deepthink_protocol`, use exact integer floors for the rational thresholds (`y_s=floor(n^(1/6))`, `y_m=floor(n^(1/3))`, `y_L=floor(n^(5/6))`), so `n=1000` gives `(3, 10, 316)` rather than the under-rounded `(3, 9, 316)` that can appear with naive floating-point casts. In the resulting empirical run, `S_race` produced `|B_blocked|/pi(y_s)=1` across the tested grid while `|Q_blocked|/(pi(n/2)-pi(y_L))` stabilized near `1/2`, so the protocol’s large-prime race matched the audit claim but its small-prime half-race did not.

- For `erdos-872/phase3/sparse_subset`, deduplicating `M_Q` on the integer `m` is safe: if more than one prime factor of `m` lies in `Q`, the stated requirement set `req(m)` is still the same three pairwise carriers `{2rs, 2rt, 2st}` for the unordered odd-prime triple `{r,s,t}`. In the measured grid, the best normalized sparse-subset ratio came from `(beta, gamma) = (0.40, 0.49)` with `greedy_R=|M_Q|/2`, and `(S/R) log log n` dropped from about `1.88` at `10^4` to about `0.89` at `10^6`, which is empirical evidence for the sparse-subset rescue rather than the tautological reading.

- For `erdos-872/phase3/fan_hierarchy`, the exact rank-`h` family with core cutoff `a <= n^(0.45/h)` collapses much faster than the naive global-`H` factorial heuristic: on `n = 10^5, 10^6, 10^7`, the computed `H = sum_{p <= n^0.45} 1/p` values are about `1.92, 2.10, 2.24`, so the discrete peak stays at `h* = 2`, the `2σ` window captures only about `19%` of `(n/2, n]`, and the global-`H` estimate substantially overcounts higher ranks because the exact core cutoff shrinks with `h`.

- For `erdos-872/phase3/shortener_constants`, the independent numerical check ratified the claimed Shortener upper-bound constants: `V ≈ 0.440029038059` (so `rho = V/2 ≈ 0.220014519030`) and `C ≈ 0.227036748200`. The fast stable implementation path is a uniform-grid convolution recurrence for the simplex integrals `I_r` (here `N = 2^17`) plus independent `quad` / `mpmath` checks for `I_1` and the 1-D `C` integral.

- Round 20 two-shadow/high-support audit: controlling only pair-shadow reciprocal mass is insufficient; a safe small-prime set can have squarefree closure with reciprocal mass ~ log n, yielding Omega(n) upper-half moves even after all pair semiprimes inside the set are preempted.

- T2 online-order repair attempt: the Maker-first gap in researcher-13 seems fixable by two clean abstract lemmas. Lemma 1 is a max-gain weighted graph capture invariant; Lemma 2 is better modeled as a scored 3-uniform hypergraph capture game on slots (b,ab,cb), where exact-target plays count into the final score.

- T2 lower-bound audit status: the divisibility-to-hypergraph translation for the residual target game appears sound once live targets are restricted above n/2 and a,c,ac are already unavailable. The remaining audit target is the activation-stage bookkeeping and fresh-prime supply, not the residual slot model itself.

- T2 activation-stage audit: the right quantity is not claimed edge-weight alone but activation score plus residual live target weight on claimed pairs. Off-model Shortener moves only delete target tokens, so they enter as a subtractive error E with E << Y^4/log^4 Y = o(n (log log n)^2 / log n) for delta < 1/4; this closes the fresh-prime/bookkeeping gap in the T2 lower bound.

- Ford-route audit: the old slow-growth reduction using a factorization u = a m with a in a dyadic band and P^-(m) > Y^delta cannot invoke Ford 2019 as written, because Ford counts numbers that are themselves w-rough. Rough cofactor alone is insufficient; a single dyadic band can already contain >> n/log n such numbers. Any Ford salvage must force whole-number roughness or add separate bandwise reciprocal-mass control on the closure skeletons.

- Directed multiplicative-closure result: a fixed-power high prime band plus a lower squarefree pool forces a single dyadic skeleton band with constant reciprocal mass. Concretely, for primes p in [X, X^lambda], triple products pqr contribute constant reciprocal mass, squarefree c <= X^gamma contribute logarithmic reciprocal mass, and pigeonholing over O(log X) dyadic bands leaves one band with sum 1/a >> 1. Any successful closure-control upper bound must dynamically suppress this high-band triple mass / low-pool squarefree mass configuration.

- Directed rank-3 cleanup budget audit: for `erdos-872`, same-band triple blockers are *not* too numerous. If `[2,y]` with `y=n^alpha`, `alpha<1/2`, is covered by fixed-power bands `I=(X,X^lambda]`, then `#\{p<q<r in I : pqr<=n/2\} << n/log n` per band and the total across all bands is `<< n log log n / log n`, below T2 scale. So the remaining obstruction is online fiber persistence after Pro preempts a triple blocker, not raw blocker cost.

- Online rank-3 race formulation: the pure blocker-ordering game on triple cores `b=pqr` is already lost for Shortener. If one core `b` has weight `omega(b)=sum_{c:bc in A_Y} 1/(bc)`, then in the abstract one-band core race Pro moving first and greedily taking the heaviest remaining core secures at least half the total core mass, so no smallest-first / weight-first ordering can "beat Pro to each b". The load-bearing open theorem is post-activation fiber collapse, not blocker ordering.

- One-fiber cleanup law for `erdos-872`: restricting to within-core laterals `bd`, the optimal cleanup on one activated fiber is prime-lateral greedy, and after `t` attacks the residual reciprocal mass only decays like `1/log t`. If the activation seed already contains all primes up to `z0`, then constant-factor cleanup on that fiber needs `Omega(z0/log z0)` moves. This is a bottleneck statement only; stronger cross-core cleanup by pure low divisors is still open.

- R23 certificate-family generalization: the Bernoulli/refined-mass refutation is not specific to smooth downsets. Any certificate family whose squarefree-support projection contains a broad subpolynomial Hamming layer plus an equally large incomparable witness layer is vulnerable to an `n^{o(1)}` sweep-prefix attack; exact-rank families (`omega=k`, `Omega=k`) and divisor-threshold families fail through their squarefree slice. Primorial/chain-like families evade this particular attack, while full `z`-rough families are only set-susceptible unless the measure is band-limited.

- `erdos-872` phase-4 top-facet game: two structural facts now block the most obvious Prolonger counter-constructions. First, fixing a constant core `Q` and restricting to hyperedges containing `Q` gives a subhypergraph canonically isomorphic to a smaller top-facet game `H^(h-|Q|)` on `N-|Q|`, so fixed-pair/triple core strategies are not new asymptotic gadgets. Second, any two distinct hyperedges in `H^(h)` share at most one top-facet vertex, so the naive "dependent-set" / shared-top-facet cascade picture cannot create high-multiplicity overlap.

- For erdos-872 one-cylinder arithmetic-toy work, enforce actual antichain legality on Prolonger stars: after Shortener claims a certificate c, Pro cannot later score any star containing c. With that legality fix, the toy still stays small but immediate fresh-witness formulations can fail, so target recursive stale-chain lemmas rather than local freshness.

- For `erdos-872/phase4/freshness_toy.py`, multiplicity audits should be taken on the **first round a useful shield appears**, not only on terminal useful shields; terminal-only counts miss the R38 first-appearance quantity. When stress-testing clustered microcells in the fast one-cylinder audit, prioritize dense-cell pair count before the useful-count tie-break so the `clustered` variant actually emulates the intended microcell concentration.

- For `erdos-872` clustered packet experiments, do not equate “clustered” with a **fixed global dense block**. In the fast one-cylinder clustered stress test, the bad pair-first events can all avoid having their charged latest pair fully inside the designated dense set `{1,...,h}`. Any viable packet lemma has to use packets local to the missing prime or score, not a fixed dense region.

- For erdos-872 Case-B blocker work, the universal two-outcome statement (large separator or residual chargeable to played Prolonger shadow C) is false for arbitrary prior blocker families D: the Johnson-shell state with C={A}, D=binom(A,2), and packet P=A∪Z has |R_live|=Lh while every fully legal blocker captures at most h-1 atoms, so any viable replacement theorem must either restrict D to strategy-generated blockers or add a third D-shell/junta outcome.

- Spectral packet route: the universal stopping theorem is false, but there is a rigorous q-shadow/covering dichotomy. If a live packet has density eta and no legal rank-q separator captures at least (delta_q/2) of it, then sigma_q(D)+|C| delta_q > 1 - 4 lambda_q^2 / eta, where sigma_q(D) is the prior Shortener comparability shadow on the q-layer and delta_q = binom(K-q,L)/binom(K,L). At the central scale q ~ 2(log h)^2, L ~ h/log h, small sigma_q(D) forces |C| = h^{2+o(1)} before spectral starvation can occur.

- R55 hidden-packet reduction as stated is too strong for Shortener and collapses immediately: with q0>=1 and l>=1, any first blocker or shield leaves an uncovered legal packet singleton p, so Shortener can claim p and permanently prevent Pro from ever covering {p}. Any meaningful packet subgame must include a lag / attention-budget parameter measuring how many non-packet separators Shortener burns before it can attack that packet.

- For `erdos-872` T2 Maker-first notes, do not use the shorthand “deleting an uncaptured vertex x loses exactly P(x)” in the graph/hypergraph potential argument: a simple three-vertex path state already falsifies that equality, so the post-Maker vertex-deletion bound must be treated as a separate wrapper theorem to prove or formalize.

- For erdos-872 prime-rounding bridge work, do not claim a global sup p_j/b_j -> 1 for every envelope index when flat filler blocks are present; the queued coarse-bin bridge only proves a fixed-factor bound p_j <= a^2 b_j on nonexceptional indices, while exceptional indices have negligible reciprocal mass.
## Tooling Learnings

- In the Lean 4.28.0 Mathlib snapshot used by `erdos-872/lean/erdos_872_core`, `Mathlib.NumberTheory.Chebyshev` exposes `Chebyshev.eventually_primeCounting_le`, but an obvious full PNT theorem `π(x) ~ x / log x` is not surfaced under the expected names; for Round 15 top-tail formalization, bank the Chebyshev upper bound first.

## Tooling Access Inventory

- `tectonic` is installed at `/opt/homebrew/bin/tectonic` and works as the fallback LaTeX engine for `erdos-872/paper` when `pdflatex` is unavailable.
