# Codex Paper-Polish Task Batch

Local Codex task covering five independent pre-arXiv polish items. Each is
self-contained; work through them in order. Compile after each task, commit
each task separately with a focused message, and audit honestly at the end.

Working directory: `/Users/omisverycool/erdos-harness`.

## Compile / workflow rules

- Use `tectonic -X compile main.tex` from `erdos-872/paper/` to rebuild.
- After each task, the paper must still compile cleanly with no undefined
  references and no new error-class warnings.
- Commit each task with `git add <files>` + `git commit -m "..."` scoped to
  the task. Do NOT batch all tasks into a single commit.
- After all five commits, push with `git push origin HEAD`.
- Do NOT use `git commit --amend`, `git push --force`, or any destructive git
  command. No `--no-verify`.
- For the final audit, read each task's deliverable once more and report
  honestly whether you closed it or only partially closed it.

## Task 1 (HIGH): Prove the prime-count-per-range lemma inline

The file `erdos-872/paper/sections/07-main-upper-bound.tex` around line 94
currently says:

> ... so the local prime-count-per-range lemma applies with the constant
> packet ratio $1/(h+1)$. It yields
> \[ S(X) \ge \frac{\pi(X)-\pi(Y)}{h+1}-O_H(1). \]

That lemma is cited but never stated or proved in the paper. This is the
load-bearing adversarial-count step that converts "Shortener's current window
is $u \in (1/(h+1),1/h]$" into "Shortener actually plays roughly
$1/(h+1)$-fraction of the primes in that window."

Your task:

1. State the "local prime-count-per-range lemma" as a numbered Lemma in
   Section 7, before Proposition "Local density away from breakpoints" uses
   it. The lemma should be a precise combinatorial statement about the
   smallest-legal-odd-prime Shortener strategy in the regime
   $u \in (1/(h+1),1/h]$.

2. Prove the lemma inline at the same theorem-proof-level rigor as
   `\Cref{prop:local-density}` and `\Cref{prop:envelope-inversion}` elsewhere
   in the same file. Use the arithmetic facts about the strategy: Shortener
   plays in increasing order of size; each prime $p$ Shortener plays kills
   its multiples in the upper half; in the regime $u \in (1/(h+1),1/h]$,
   $p^h \le n < p^{h+1}$, so the natural packet ratio is $1/(h+1)$.

3. Replace the "applies with the constant packet ratio $1/(h+1)$" citation
   in the proof of `\Cref{prop:local-density}` with an explicit reference to
   the newly added Lemma: `\Cref{lem:prime-count-per-range}` or similar.

4. If you find the lemma as stated is subtly wrong (possible), state
   precisely what it should say instead, and repair the downstream uses.
   Prefer a correct weaker statement to a glossed proof.

Commit message: `Paper: prove prime-count-per-range lemma inline (Section 7)`.

## Task 2 (MEDIUM): Integrate the safe-edge refutation from the residual hypergraph K4 fiber

A recent Pro dispatch refuted the safe-edge hypothesis (as stated in
`\Cref{prop:t2-finite-capture}` in `appendix-A-deferred-proofs.tex`) via an
arithmetic construction on residual hypergraph $G(n,\delta)$. The abstract
counterexample in `\Cref{prop:t2-max-gain-counterexample}` showed max-gain
domination fails in general rank-3 games; this new refutation shows it fails
even inside the specific arithmetic games.

**Verbatim Pro construction to integrate.** Embed the following as a new
numbered Proposition in Appendix A, placed immediately after the existing
`prop:t2-max-gain-counterexample` (abstract counterexample) and before
`prop:t2-finite-capture` (the conditional-finite-capture proposition):

Choose the four fixed small primes $13, 17, 19, 23$. Their pairwise products
are
\[
  13\cdot17=221,\quad 13\cdot19=247,\quad 13\cdot23=299,\quad
  17\cdot19=323,\quad 17\cdot23=391,\quad 19\cdot23=437.
\]
All six products lie between $221$ and $437$, and $2\cdot 221=442>437$. For
sufficiently large $n$, since $23\le n^\delta=Y$ (because $\delta\in(0,1/4)$
and $n$ is large), all four primes lie in $\mathcal P_Y$. By the prime number
theorem, the interval $(n/442,\ n/437]$ contains a prime $q$ for all
sufficiently large $n$. Also $q>Y$ for large $n$, since $\delta<1/4$.

For every pair $a<c$ among $\{13,17,19,23\}$, we have
$q>n/442\ge n/(2ac)$ because $ac\ge 221$, and $q\le n/437\le n/(ac)$ because
$ac\le 437$. Hence $q\in B_{a,c}$ for all six pairs, and the six edges
$e_{a,c}=\{q,aq,cq\}$ all occur in $G(n,\delta)$. They form a $K_4$-fibre
over the common slot $q$.

Now reach a state in which only these six edges are live and no vertex in
them has yet been captured. This is reachable: while any other edge is live,
Maker uses the alternate-scoring move to score that exact target without
adding slot vertices to $C$. Since any edge outside this six-edge family has
at least one slot outside $U:=\{q,13q,17q,19q,23q\}$, Breaker deletes such an
outside slot. This never harms the six desired edges. Repeating finitely many
times leaves exactly the six $K_4$-fibre edges live, with $C=\emptyset$.

From that state, play the following two legal rounds:

- Maker captures $e_{13,17}=\{q,13q,17q\}$, so $q,13q,17q\in C$. Breaker
  deletes the live edge $e_{13,19}$.
- Maker captures $e_{19,23}=\{q,19q,23q\}$, so
  $q,13q,17q,19q,23q\in C$. Breaker deletes the live edge $e_{13,23}$.

At the next pre-Maker state, the only remaining live edges from this fibre
are $e_{17,19}=\{q,17q,19q\}$ and $e_{17,23}=\{q,17q,23q\}$. Both have all
three vertices in $C$, so $\Phi(e)=2^3\cdot 1=8$ for each. There are no
other live edges by construction.

Maker has only two possible live edges to play. If Maker plays $e_{17,19}$
(ordinary capture or alternate-scoring), the change in $Q$ is
$+8\cdot 1-8=0$, because $S$ increases by $1$, the edge of potential $8$ is
removed, and no new vertex is added to $C$. The remaining live edge
$e_{17,23}$ still contributes $8$. Breaker then deletes $e_{17,23}$ by
adding it to $D_E$, decreasing $Q$ by $8$. Thus $Q_{\text{after}}
=Q_{\text{before}}-8$. The same argument holds if Maker instead plays
$e_{17,23}$.

So at this reachable pre-Maker state, every legal Maker move admits a legal
Breaker reply that strictly decreases $Q$. Hence the safe-edge hypothesis
fails.

After embedding the proposition, **update the safe-edge hypothesis wording**
in `\Cref{prop:t2-finite-capture}` to make the conditional nature sharper:

- Currently the proposition starts "Assume the following safe-edge
  hypothesis..." as if the hypothesis is naturally plausible.
- Change it to something like: "The general safe-edge hypothesis stated
  below is provably false even for $G(n,\delta)$; see
  \Cref{prop:t2-safe-edge-refutation}. The proposition below assumes the
  hypothesis only for states actually reachable under the specific
  Prolonger strategy of Proposition A.4 below; this restricted hypothesis
  is open."

- Update the downstream proof and Proposition `prop:t2-final` to reference
  the restricted hypothesis rather than the general one. In the paper's
  introduction (Section 1), the paragraph describing conditional T2 should
  be revised to note that the hypothesis in its general form is now refuted
  and the conditional result depends on a narrower open hypothesis.

- Update `erdos-872/paper/sections/09-conclusion.tex` open-problems paragraph
  to mention the narrowed open question: "whether the safe-edge property
  holds for states reached under the Prolonger activation strategy" rather
  than "whether the safe-edge hypothesis holds."

Commit message: `Paper: integrate K_4 fibre refutation of safe-edge hypothesis
and narrow conditional T2 framing`.

## Task 3 (LOW): Fix overfull hbox in Section 5

`erdos-872/paper/sections/05-524-cover.tex` around line 63 produces an
overfull hbox of about 41.6pt. Identify the cause (likely a long equation,
`\texttt{}` span, or unbreakable horizontal content) and fix without changing
the mathematical content. Options: add `\allowbreak` / `\break`, split the
line, move a long expression to a display equation, or use `\sloppy`
locally. Recompile and confirm the overfull warning is gone.

Commit message: `Paper: fix overfull hbox in Section 5 (cosmetic)`.

## Task 4 (LOW): Er92c citation verification note

`erdos-872/paper/references.bib` has an `Er92c` entry with a candidate
citation (Hardy-Ramanujan Journal, vol. 15, 1992). You do NOT have web
access, so cannot verify this against MathSciNet or publisher records. Your
task is only: add a `% TODO:` comment line immediately above the entry
flagging that the citation is a best-effort guess and needs independent
external verification before arXiv upload. Do not change the entry itself.

Commit message: `Paper: flag Er92c citation as needing external verification`.

## Task 5 (LOW): [URL] placeholder visibility

In `erdos-872/paper/main.tex`, the AI Declaration section ends with

> A description of the harness and workflow is available at~\texttt{[URL]}.

This is a visible placeholder. Ensure the `\texttt{[URL]}` renders obviously
as a placeholder in the PDF (it does, so probably no change needed). If you
find the placeholder is easy to miss visually, switch to a bright-color TODO
note so it cannot accidentally ship. Do NOT invent a URL.

Commit message: `Paper: make [URL] placeholder impossible to miss`
(only if you change the rendering; otherwise skip this task and note "no
change needed" in the final audit).

## Final audit and push

After all tasks, run one last `tectonic -X compile main.tex` from
`erdos-872/paper/`. Confirm:

- Zero undefined references.
- Zero missing citations (warnings about the unverified `Er92c` entry are
  expected if tectonic surfaces them; bibtex should still run clean).
- No new error-class warnings introduced by your edits.
- All five tasks committed separately on the current branch.

Then `git push origin HEAD`.

**Final honest audit report.** After pushing, write a short report on this
chat reply covering:

1. Which tasks closed fully.
2. Any task where you deviated from the stated plan (e.g., Task 1 if the
   prime-count-per-range lemma required a weaker statement than the paper
   currently uses; Task 2 if the narrowed hypothesis wording diverged from
   the spec above).
3. Any NEW gaps you noticed while working that were not in this task list.
4. The single highest-priority follow-up item you would recommend for the
   next round, if any.

Report format: 200 words or less, plain markdown. If you glossed any proof
step, name it explicitly rather than papering over.
