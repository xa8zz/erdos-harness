# Task: retroactive front-matter backfill for Erdős 872 round docs

## Context

The repo at `/Users/omisverycool/erdos-harness/` has accumulated ~280 research-round artifacts under `erdos-872/` over a 56-round AI-assisted research program. A new immutable round-doc schema was recently introduced (commit `a018596`). Existing files have no YAML front-matter, so `scripts/compile_rounds.py` currently sees zero rounds. Your task is to add front-matter to each existing round doc so the compiled state view matches the actual program state.

**This is a careful, slow task, not a batch script.** Go file by file. Do not try to automate with a heuristic; read each file's opening section to derive the correct front-matter.

## Required reading before starting

Read these in order:

1. [`docs/round-doc-schema.md`](../../docs/round-doc-schema.md) — the full schema spec, what each field means, compile rules.
2. [`prompts/templates/round-doc.md`](../../prompts/templates/round-doc.md) — the blank template with commented optional fields.
3. [`skills/add-round-doc.md`](../../skills/add-round-doc.md) — workflow guide (note: its transcript-extraction step does **not** apply here since the content already exists).
4. [`scripts/compile_rounds.py`](../../scripts/compile_rounds.py) — skim to understand what the compile script expects.

After reading, re-read the schema once more. The critical invariant: **front-matter is immutable and contains no `status` field**. Status is derived from the `action` graph.

## Scope

**In scope:** files matching `erdos-872/*.md` at the top level — the primary round artifacts. Examples: `researcher-13-pro-sparse-subset-closeout.md`, `verify-postresp-11-claude.md`, `followup-12-pro-closeout-response.md`, `researcher-56-pro-tau-sf-refuted-*.md`.

**Out of scope (do NOT add front-matter):**

- `current_state.md` — meta state doc (will be replaced by `compile_rounds.py` output eventually)
- `process.md`, `_forum_transcript.md` — meta docs
- `chatgpt.md`, `claude-chat.md`, `gemini.md` — conversation exports, not round artifacts
- `ford-integration-audit.md`, `audit-R37-external-synthesis.md` — free-form analysis notes; skip unless content clearly matches a round
- Anything under `erdos-872/prompts/` — these are dispatch prompts, not rounds (they get referenced via the `prompt` field of rounds, not front-matter themselves)
- Anything under `erdos-872/aristotle/` — Lean formalization artifacts, different category
- `erdos-872/phase0/`, `phase1/`, `phase2/`, `phase3/`, `phase4/` — empirical probe reports; skip for now, can do later if useful
- `erdos-872/paper_strengthening_plan.md`, `worker_*.md`, `*_note.md`, `round15_upper_bound_status.md` — recent paper-prep artifacts from a parallel session, not rounds
- `matching-T2-*-attempt-*.md`, `direct-On-over-logn-attempt-*.md` — human self-attempt scratch files; skip

If you're not sure whether a file is a round, skip it and move on. Safer to miss a few than to incorrectly classify.

## Field derivation rules (by filename pattern)

### `id`

Derive from the filename: `R<NN>-<slug>`, where `<NN>` is zero-padded two digits and `<slug>` is kebab-case.

Examples:

- `researcher-13-pro-sparse-subset-closeout.md` → `id: R13-pro-sparse-subset-closeout`
- `verify-postresp-11-claude.md` → `id: R11-verify-postresp-claude`
- `verify-aristotle-01-theorem-A.md` → `id: R01-aristotle-theorem-A`
- `researcher-56-pro-tau-sf-refuted-upper-half-dyadic-shielding.md` → `id: R56-pro-tau-sf-refuted`

Keep ids short. If a filename has a long descriptive tail, truncate the slug to the meaningful part (~4–5 tokens max).

**Preserve sibling discriminators** (`pro-1`, `pro-2`, `pro-3`, `pro-4`) when multiple files answer the same prompt. Example: `researcher-44-pro-2-closure-via-defect-2.md` → `R44-pro-2-closure-defect-2`, not `R44-closure-defect-2` (which would collide with `researcher-44-pro-3-closure-via-defect-2.md`). Similarly for `deepthink-1` / `deepthink-2`, `fresh-1` / `fresh-2`, etc.

### `type`

- `researcher-*` → usually `research`; but if the response is itself a refutation of a prior round, `refutation`
- `verify-*` → `verification`
- `followup-*` → `research` (usually a continuation dispatch)
- `audit-*` when in filename → `verification`
- `synthesis`, `diagnostic` — rare; use when the content clearly synthesizes multiple rounds or diagnoses a failure

When in doubt, open the file and read the opening section — the content tells you the type.

### `date`

Use `git log --diff-filter=A --follow --format=%as -- <file> | tail -1` to get the file's creation date in ISO format. If git log can't find it (rare), use the filesystem mtime (`stat -f '%Sm' -t '%Y-%m-%d' <file>`).

### `intent`

1–2 sentences from the opening section of the file. Strip all session jargon — no "Round N", "Pro", "our program", etc. Rewrite as self-contained: "Test whether X achieves Y" or "Verify the claim that Z holds."

### `predecessors`

List prior round ids this round builds on. Usually derivable from:

- Explicit mentions in the opening section ("continuing R35", "refuting R52's...")
- The filename (e.g., `followup-R47-angle1-activator-quotient.md` builds on `R47-pro-1-angle1-concession`)
- Cross-references in the body

Empty list `[]` is fine if the round is standalone.

### `action`

Read the opening / conclusion to determine the relationship:

- **`standalone`** — new investigation, doesn't directly refute or extend a named prior round
- **`refutes`** — directly shows a prior round's claim is wrong (set `action.target`)
- **`supersedes`** — replaces a prior round's claim with a better version (set `action.target`)
- **`extends`** — adds to a prior round's claim (set `action.target`)
- **`confirms`** — independent verification of a prior round's claim (set `action.target`)
- **`orthogonal`** — explores a different angle entirely

Most rounds are `standalone` or `extends`. Be conservative — only mark `refutes` if the file's own content states it refutes a prior result.

### `claim`

The specific mathematical assertion the round makes. Lift from the opening summary or main theorem statement. Strip session jargon. Keep it to 1–3 sentences.

### `failure_mechanism` (required when `type: refutation`)

The specific arithmetic/combinatorial feature that killed the target's claim. Include specific primes, shield sets, lemmas, constants — whatever the body actually identifies. If the body is vague, note `failure_mechanism: <vague-per-source>` and flag it in your report.

### `prompt` (optional)

Look for a corresponding file under `erdos-872/prompts/`. Matching heuristics:

- `researcher-NN-xxx-yyy.md` → check `prompts/researcher-NN.md`, `prompts/researcher-NN-xxx.md`
- `followup-NN-xxx.md` → check `prompts/followup-NN-xxx.md`, `prompts/followup-NN.md`
- `verify-NN-xxx.md` / `verify-postresp-NN-xxx.md` → usually uses the global `prompts/templates/informal-audit.md`; you can omit `prompt` or set it to the template path
- Round-named prompts: `researcher-RNN-xxx.md` → check `prompts/researcher-RNN-xxx.md`

If you find a match, set `prompt: erdos-872/prompts/<match>.md`. Otherwise omit the field.

### `siblings` (optional)

For parallel dispatches to the same prompt (e.g., `researcher-44-pro-1-*`, `researcher-44-pro-2-*`, `researcher-44-pro-3-*`, `researcher-44-pro-4-*` all answering the same prompt), set `siblings: [R44-pro-1-<slug>, R44-pro-3-<slug>, R44-pro-4-<slug>]` on each (i.e., all other sibling ids, excluding self). These are **not** predecessors.

### `failure_mechanism`

**Required whenever `action.kind ∈ {refutes, supersedes}`**, regardless of `type`. A `type: verification` doc whose `action.refutes` a target needs `failure_mechanism` just as much as a `type: refutation` doc does.

### `verifiers_at_time`, `confidence_at_time`, `strategy_dependence`

Only set when the file itself surfaces this information. Otherwise omit. These are optional for a reason — backfill shouldn't invent data that isn't there.

## Workflow

**Phase 0 — Pre-indexing (~15 min, do before any writes).** Dump every in-scope file's path → id mapping to a temporary reference. This prevents forward-reference errors when setting `predecessors` / `action.target` / `siblings`.

```bash
ls erdos-872/*.md | python3 -c "
import sys, re
for line in sys.stdin:
    path = line.strip()
    name = path.rsplit('/', 1)[-1].removesuffix('.md')
    # Skip out-of-scope meta files:
    skip_names = {'current_state', 'process', '_forum_transcript', 'chatgpt',
                  'claude-chat', 'gemini', 'ford-integration-audit',
                  'audit-R37-external-synthesis', 'paper_strengthening_plan',
                  'round15_upper_bound_status'}
    if name in skip_names:
        continue
    if name.startswith(('worker_', 'matching-T2-', 'direct-On-over-logn-attempt')):
        continue
    m = re.match(r'(?:researcher|verify|followup|verify-postresp|verify-aristotle|audit)-(\d+)-(.*)', name)
    if m:
        nn = int(m.group(1))
        slug = m.group(2)
        print(f'{path}\t{name}\tR{nn:02d}-{slug}')
" > /tmp/round-id-index.tsv
wc -l /tmp/round-id-index.tsv
```

Review the mapping. Flag ambiguities before writing anything. Save this file; reference it while backfilling.

**Phase 1 — Calibration (first 5 files).** Pick 5 files across the program (one from R1–R10, one from R20–R30, one from R40–R50, one verification, one followup). Add front-matter to each. Run `scripts/compile_rounds.py --root erdos-872/ --out -` to see how they render. Verify the output looks right. Commit this batch.

**Phase 2 — Systematic backfill, batches grouped by round number.** Batch all files belonging to the same round together (e.g., R13 has ~20 files — `researcher-13-*`, `verify-postresp-13-*`, `round13-*`). Processing them together lets you reuse the `intent` and `prompt` fields across siblings and resolve `siblings` references correctly. Target ~10–15 files per commit.

After each batch:

1. Run the compile script, check output for anomalies (especially the "Pending-target refutations" bucket).
2. `git add` the modified files by name (never `git add -A`).
3. Commit with message `Backfill front-matter: round R<NN>` or `rounds R<start>–R<end>` for multi-round batches.

**Do not:**

- Try to do it all in one pass.
- Use `git add -A` — this repo has untracked parallel-session work you mustn't touch.
- Invent fields (verifiers, confidence) not visible in the source file.
- Touch anything under `phase0–4/`, `aristotle/`, `prompts/`, or the out-of-scope meta docs.
- Edit `current_state.md` — the compile script output replaces it eventually.

**Do:**

- Skip files you can't confidently classify — report them at the end.
- Verify the compile script output after each batch.
- Log ambiguous decisions in a `backfill-notes.md` file as you go.

## Reporting

When finished (or at a stopping point), produce a summary at `erdos-872/backfill-frontmatter-report.md` containing:

- Files processed / files skipped / files flagged as ambiguous
- Any `action` relationships you inferred that are low-confidence (in case they need review)
- The final compile output at `erdos-872/state_compiled.md`
- Any schema gaps you hit (fields that would have helped but weren't in the schema)

## Working directory and environment

Work from `/Users/omisverycool/erdos-harness/`. The repo is on branch `main`. You can run:

- `git log --oneline -5` to see recent commits
- `ls erdos-872/*.md | head -20` to orient
- `wc -l erdos-872/*.md | sort -n | head -20` to find the smallest files (useful for calibration)

One more Claude session is working in this repo on paper drafting — do not touch their files (`erdos-872/worker_*.md`, `erdos-872/paper_strengthening_plan.md`, `erdos-872/phase4/*_note.md`, `erdos-872/round15_upper_bound_status.md`, `erdos-872/aristotle/t2_finite_core/`, `erdos-872/phase3/shortener_piecewise_bonferroni4*`). If you're unsure whether a file is theirs, check `git log --oneline -5 <file>` — if the commits are recent and unfamiliar, leave it.

Begin with Phase 1 calibration. Report back after the first 5 files so progress can be reviewed before the systematic pass.
