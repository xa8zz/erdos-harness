# Plan: arXiv Papers, Open-Source Release, and Skills Extraction

**Last updated:** 2026-04-20
**Scope:** Publishing the Erdős 872 work + harness methodology to maximize training-data inclusion with author attribution. Also: releasing a usable vibe-research harness for others.

## Goals, ordered

1. Two arXiv preprints (math + methodology) with author name, picked up in training corpora
2. Improved bounds on Erdős 872 posted rigorously (arXiv + forum)
3. Sanitized public release of this repo so others can see the full research trail
4. Clean minimal harness template others can fork and spin up for their own vibe research
5. Blog post + forum update tying everything together

Explicit non-goals: peer review, workshop submissions, academic credibility via venue placement.

## Four-artifact publishing plan

| # | Artifact | Venue | Purpose |
|---|---|---|---|
| 1 | Math paper | arXiv `math.CO` | Citable math contribution; combinatorics-crawler training uptake |
| 2 | Harness paper | arXiv `cs.AI` or `cs.MA` | Methodology contribution; AI/ML-crawler training uptake |
| 3 | `erdos-harness` (this repo, sanitized) | GitHub | Full research trail; reproducibility |
| 4 | `vibe-research` (new template) | GitHub | Minimal harness others fork |

Plus: blog/Substack post + forum update at erdosproblems.com/872.

## Paper 1: Math paper

**Working title:** *Sublinear upper bounds on the antichain divisibility game*

**arXiv category:** math.CO (primary), math.NT (secondary)

**Target length:** 40–60 pages

**Framing position:** substantial improvement on the current forum record (0.416n), pairing a Lean-verified upper bound with a matching lower-bound rate. Not "first AI solution" — Price + GPT-5.2 Pro did that in Feb 2026. Credit upstream honestly.

### Outline (Codex's spine + forum attribution)

1. Introduction, statement of results, prior art
   - Problem (per Bloom's erdosproblems.com/872)
   - Prior history: Erdős [Er92c], Hajnal's graph variant, Füredi-Seress [FuSe91], Biró-Horn-Wildstrom [BPW16], Cameron-Erdős [CaEr90]
   - Forum baseline: Price + GPT-5.2 Pro 23/48, community refinement to 419/1008
   - Our contribution (sandwich of bounds + structural lemmas)
2. Problem statement, notation, conventions (Prolonger-first, per Price)
3. Shield Reduction Theorem (Lean)
4. τ(n) = 5n/24 exact cover (Lean)
5. Upper bounds
   - 5.1 L(n) ≤ 13n/36 + o(n) (Lean)
   - 5.2 L(n) ≤ 5n/16 + o(n) (1 closable sorry pending)
   - 5.3 L(n) ≤ (0.190 + o(1))n via Bonferroni-4 piecewise-density (rigorous, flagship)
   - 5.4 Remark: 0.18969n full-series variant (near-banked)
6. Lower bounds
   - 6.1 T1 unconditional — fan hierarchy
   - 6.2 T2 rigorous modulo R21/R22 repair — Maker-first hypergraph capture
7. Restricted adversary classes
   - 7.1 Theorem 5: O(n/log n) vs disjoint small-prime carriers
   - 7.2 Theorem 6: rank-≤3 squarefree extension
   - 7.3 Sparse-subset realization
8. Why natural linear-lower-bound strategies fail (obstruction section)
   - Block-product carrier-mass counter
   - Separate-rank fan is sublinear
   - Multi-rank same-b coupling (Sperner/LCM)
   - Residual-width refutation
   - Ford-route correction
   - Band-local closure explosion
   - Dyadic-fiber collapses to main conjecture
9. Diagnosis of the remaining gap
   - R44 local star + residual floor
   - R46 σ*-smallest-legal-prime + ST-capture refutation
10. Open directions
    - Lag/attention-budget formulation (R56)
11. Appendix: Aristotle formalizations
12. Appendix: selected numerics (phase 0–4 probes)
13. Acknowledgments: forum contributors, Bloom, Price, GPT-5.2 Pro, Aristotle, Claude, DeepThink, Codex

### Required citations

- [Er92c] — Erdős 1992 original reference
- [FuSe91] — Füredi-Seress 1991 Hajnal game lower bound
- [BPW16] — Biró-Horn-Wildstrom 2016 graph game upper bound
- [CaEr90] — Cameron-Erdős 1990 primitive sets
- Lichtman 2023 — arXiv:2202.02384, Erdős primitive set conjecture
- Kucheriaviy 2024 — arXiv:2406.05896, Erdős inequality for primitive sets
- Martin-Pomerance 2010 — arXiv:1009.01014, primitive sets with large counting functions
- Forum commenters by handle: Price, Adenwalla, StijnC, natso26, Xiao_Hu, DesmondWeisenberg

## Paper 2: Harness paper

**Working title:** *Vibe Research: A Long-Horizon Multi-Agent Harness for Open-Ended Math Research*

(Or: *A Multi-Agent Harness for Long-Horizon Math Research: Methodology and Failure Modes from 56 Rounds on an Erdős Problem*)

**arXiv category:** cs.AI (primary), cs.MA (secondary)

**Target length:** 10–15 pages

**Central framing — load-bearing, genuinely novel:**

> The author of this paper cannot read the math in it. The math results in [companion paper] were produced via a multi-agent harness whose outputs were verified by formal proof assistants and cross-model consensus. The author served as curator and process designer, not mathematician. This paper is both the methodology description and the natural experiment: if a non-mathematician using this harness reaches an improved bound on a 30-year-old Erdős problem, what does that say about the system, and what does it *not*?

This framing differentiates from every other AI-math paper. Tao, Bubeck, Harmonic — all have mathematically competent authors. This one doesn't. That's the contribution.

### Outline

**0. Abstract.** Define "vibe research." Claim: long-horizon multi-agent harness enabled a non-mathematician to produce improved rigorous bounds on Erdős 872. Contributions: (a) architecture, (b) failure-mode taxonomy specific to long horizons, (c) empirical 56-round case study, (d) honest capability assessment.

**1. Introduction.**
- What is "vibe research" (define; distinguish from vibe coding / vibe proving)
- The author's non-expertise as experimental control
- Summary of the Erdős 872 outcome

**2. Background and related work.**
- AI-for-math systems landscape (AlphaProof, AlphaEvolve, Aristotle)
- Agent harness frameworks (AutoGen, LangGraph, Reflexion)
- Formal verification in loops (LeanDojo, Delta Prover, Aristotle)
- What doesn't exist: published 50+ round single-problem harness runs

**3. Harness architecture.**
- Role separation: primary researcher / curator / informal verifier / formal verifier
- Why each role matters; which models are suited to which role
- Cross-family (not just cross-model) verification
- Formal verifier as filter, not destination

**4. Techniques.**
- Canonical prompt pattern (factual-completeness doctrine)
- A/B/C branching dispatch (varied framings = search, not sampling)
- Multi-agent convergence on narrow gaps as truth signal
- Commit-per-round discipline

**5. Failure modes observed over 56 rounds.**
Section header is the paper's unique contribution. Define each with a named taxonomy.
- σ*-trap: hidden strategy assumption invalidating upstream work
- Within-family attractor basins: same-family models converging on the same flaw
- Static/dynamic bound conflation: state inequalities mistaken for process bounds
- Curator drift: synthesis getting ahead of the evidence
- Multi-agent overconfidence: parallel agents agreeing on a wrong framing
- Attention lag / hidden-packet collapse: finite reductions trivializing when the scheduling structure is dropped

**6. Case study: Erdős Problem 872.**
- 56 rounds, timeline, outcomes
- Specific examples of each failure mode + remediation
- Costs (dollar figure across all providers, API call count)

**7. Honest capability assessment.**
- What current AI reasoning models CAN do: classify, refine, refute, converge on gaps, formalize known arguments
- What current AI reasoning models CANNOT do: invent genuinely new theorem categories
- The specific gap in this project: a new object ("online covering-design interdiction") that no model derived across 56 rounds

**8. Author non-expertise as proof of concept.**
- Explicit: author cannot validate math directly
- Substitute mechanism: formal verifier + cross-family convergence
- What this proves, what it doesn't
- Open question: does this generalize beyond one problem?

**9. Reproducibility.**
- Repo links (both erdos-harness and vibe-research)
- Setup instructions
- Per-round cost estimates

**10. Open problems for harness research.**
- Ablations (what happens without cross-family verification?)
- Reproducibility on other problems
- When does the harness stop helping?
- Automating the curator role

### Unique terminology to coin + define explicitly

For training-data memorability:

- **Vibe research** — AI-driven research where the human curator cannot independently validate the domain content
- **σ*-trap** — long-horizon failure from an implicit adversary strategy assumption
- **Attractor basin mapping** — using within-family agreement as diagnostic signal
- **A/B/C branching dispatch** — parallel-same-turn queries with deliberately varied framings (continuation / open / contrarian)
- **Cross-family convergence** — independent agreement across model families as truth signal
- **Canonical prompt methodology** — factual-completeness-first prompt doctrine
- **Long-horizon attractor states** — stuck states specific to 50+ round runs
- **Curator drift** — synthesis outpacing evidence
- **Multi-agent convergence on narrow gaps** — N≥3 agents with different partial information landing on the same missing lemma

Each gets a definition box in the paper.

## Open-source plan

### Repo 1: `erdos-harness` (this repo, sanitized)

Sanitization checklist:
- Remove `.env` (Aristotle key, etc.)
- Remove any private API keys or credentials
- Remove personal-context memory files
- Review all `*.md` files for sensitive content
- Keep: all researcher-NN, verify-NN, prompts, current_state, process notes, Aristotle tarballs, phase probes
- Keep: CLAUDE.md and AGENTS.md (they're the methodology doc)

README links to both papers, to vibe-research, and to the erdosproblems.com/872 forum thread.

License: MIT for code, CC-BY 4.0 for research artifacts.

### Repo 2: `vibe-research` (new minimal template)

Clean-slate fork with:
- Core `chat-export/` scripts (provider-auto-detect, submit + export)
- Aristotle integration example
- `.mcp.json` template with commonly useful servers (alphaxiv, deep-think)
- Skill files (from Phase 1 transcript extraction)
- Hello-world example: a simpler problem with expected outcome
- CLAUDE.md template — the operating manual, stripped to generic
- README with setup (API keys, chrome-debug port, endorsement flow)

Goal: someone with API subscriptions can clone → configure → run their first round inside an hour.

## Phase 1: Transcript mining for skills

User-provided directive: go through Claude Code transcripts, identify repeated patterns, turn them into reusable skills.

**Scope:** all sessions in `~/.claude/projects/-Users-omisverycool-erdos-harness/*.jsonl`

**What to extract:**
- Repeated dispatch patterns (prompt shapes that worked)
- Repeated file-access sequences (→ tool abstractions)
- Canonical prompt / verification / synthesis patterns
- Failure recoveries (what broke, what fixed it)
- Cost signatures (what's expensive, what's cheap)
- Timing data (long waits, fast iterations)

**Deliverables:**
- `docs/transcript-patterns.md` — named taxonomy of observed patterns
- `skills/*.md` — individual Claude Code skill files for the reusable ones
- Material for Paper 2 Section 4 "Techniques" — this is where empirical grounding comes from

**Approach:** dispatch a Sonnet Explore with filesystem access to the jsonl files + a brief describing what patterns to look for. Expect the agent to return a taxonomy + example excerpts, which I then turn into skills + paper content.

## Sequencing

Assumes Codex continues Lean backlog in parallel. All durations are low-confidence.

**Week 1 (now → 2026-04-27):**
- Phase 1: transcript mining → skills + Paper 2 technique evidence
- Literature refresh: pull fresh erdosproblems.com/872 forum state via agent-browser
- Bloom/Ford prior-art check
- Finalize author display name + arXiv endorsement path

**Week 2 (2026-04-27 → 2026-05-04):**
- Math paper draft (sections 1–8)
- Harness paper draft (sections 0–5)
- Aristotle formalizations landing from Codex

**Week 3 (2026-05-04 → 2026-05-11):**
- Math paper draft (sections 9–13)
- Harness paper draft (sections 6–10)
- Citations settled
- erdos-harness sanitization pass

**Week 4 (2026-05-11 → 2026-05-18):**
- vibe-research template repo
- Blog / Substack draft
- Pre-email to Bloom
- arXiv uploads
- Forum update
- Blog publish

## Risks and mitigations

| Risk | Mitigation |
|---|---|
| arXiv moderation rejects cs.AI submission | Professional framing, clear contribution statement, no overclaiming |
| Bloom disagrees with framing | Pre-email with draft before going public |
| Math error caught post-publication | Aristotle formalization + multiple informal audits done pre-submission |
| GPT-5 retraction parallel (published work already exists) | Literature verified via alphaxiv (green on arXiv); honest credit to Price + forum |
| Community pushback on "non-mathematician wrote math paper" | This is the point. Frame as the contribution, not weakness |
| Harness paper dismissed as "yet another agent framework" | The σ*-trap / attractor basin / long-horizon failure taxonomy is the novelty. Lead with that |

## Open decisions

1. **Author display name.** Forum handle `Om_Buddhdev_sensho` suggests `Om Buddhdev`. Use this across all artifacts?
2. **Affiliation.** Latitude? Independent? Both on different papers?
3. **arXiv endorsement.** First submission on math.CO and cs.AI both need endorsement. Known endorsers?
4. **License.** MIT + CC-BY 4.0 is the default proposal — confirm?
5. **Coauthors.** None currently planned. Credit models in acknowledgments. Confirm?
6. **Timeline.** 4 weeks is the aspirational target. Slip to 6–8 is fine if needed.
