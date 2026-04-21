# Codex Task 6: Integrate the unconditional `(1/8)` lower bound

Follow-up task to queue after the five tasks in `CODEX_POLISH_TASKS.md`
complete. This task alone is large enough to warrant one focused commit.

A recent dispatch verified that the two-phase fan-capture Prolonger strategy
gives the unconditional lower bound
\[
  L(n) \ge \left(\tfrac{1}{8} - o(1)\right)\tfrac{n\log\log n}{\log n}
\]
for all sufficiently large $n$. The verification identified one precise
correction in the proof wording. Your job is to write the theorem and its
proof into the paper at publication quality, and update the surrounding
front-matter so the new result is a headline theorem alongside the main
upper bound.

Working directory: `/Users/omisverycool/erdos-harness`.

## Compile / workflow rules

- Rebuild with `tectonic -X compile main.tex` from `erdos-872/paper/`.
- Confirm zero undefined references after each sub-step.
- One commit for the whole task. No amending, no force-push.

## Files to edit

1. **`erdos-872/paper/sections/04-lower-bounds.tex`** — add the new theorem,
   the max-degree capture lemma it uses, and the full proof at
   theorem-proof-level rigor. Place it as a new section after Theorem A's
   polynomial-shield obstruction and before the conditional T2 roadmap,
   reading naturally as "having established the shield-prefix obstruction,
   we now give a direct unconditional game-length lower bound via a
   different mechanism."

2. **`erdos-872/paper/sections/01-introduction.tex`** — expand the headline
   theorem list from five to six items. Insert the new theorem as
   headline #2, immediately after the main upper bound and before the
   polynomial-shield obstruction theorem. Use a new label such as
   `\thm:intro-lower-bound`. Add a short one-paragraph prose description
   of the strategy (fan graph + max-degree capture) matching the depth of
   the description currently attached to the main upper bound.

3. **`erdos-872/paper/main.tex`** — the abstract. Currently the abstract
   mentions only the polynomial shield-weight lower bound and the
   conditional T2. Revise it to state the unconditional
   `L(n) >= (1/8 - o(1)) n log log n / log n` bound as a co-headline
   alongside the 0.19n upper bound.

4. **`erdos-872/paper/sections/09-conclusion.tex`** — the "what is proved"
   sentence at the top should list the new unconditional lower bound
   alongside the 0.19n upper bound, bracketing the gap between them as the
   main remaining open question.

## Source material — Pro's verified proof (verbatim)

Use this as the source of truth for the mathematical content. Expand the
prose and notation to match the paper's style; do not copy verbatim.

> Verdict: yes, the $1/8$ lower bound can be made rigorous with this
> two-phase strategy, but not quite with the wording as written. The
> max-degree capture lemma is sound. The main correction is that $A_0$ must
> include all small primes made illegal by a proper multiple during
> Phase 1, including proper-multiple kills made by Shortener, not only
> primes activated by Prolonger.
>
> If $A_0$ is interpreted narrowly as "only Prolonger activations," the
> proof is false: after Prolonger activates $3$, Shortener could legally
> play $5\cdot 7$, making both $5$ and $7$ non-live without playing either
> singleton and without Prolonger activating them. But under the correct
> definition, $5, 7 \in A_0$, and this actually helps the fan construction.
>
> Define instead
> \[
>   A_0 := \{ a \in \mathcal A : \text{during Phase 1, } a \text{ is made
>   illegal by a chosen proper multiple}\},
> \]
> and
> \[
>   D := \{ a \in \mathcal A : \text{Shortener chooses the singleton } a
>   \text{ during Phase 1} \}.
> \]
> Then $\mathcal A = A_0 \sqcup D$. Prolonger never plays small singletons,
> and a prime singleton can become illegal only by being chosen itself or by
> having a proper multiple chosen.
>
> The harmonic charging argument then works. Let $P \subseteq A_0$ be the
> primes activated by Prolonger. Pair each singleton kill $a' \in D$ with
> the immediately preceding Prolonger activation $a \in P$. Since Prolonger
> always activates the smallest live prime, $a \le a'$. The pairs are
> distinct, so
> \[
>   \sum_{a' \in D} \tfrac{1}{a'} \le \sum_{a \in P} \tfrac{1}{a}
>   \le \sum_{a \in A_0} \tfrac{1}{a}.
> \]
> Because $\mathcal A = A_0 \sqcup D$,
> \[
>   \sum_{a \in A_0} \tfrac{1}{a} \ge \tfrac{1}{2}
>   \sum_{a \in \mathcal A} \tfrac{1}{a}
>   = \left(\tfrac{1}{2} - o(1)\right)\log\log n.
> \]
>
> The fan edge count also survives this correction. If $a \in A_0$ was
> killed by a composite Shortener move such as $aq$, that does not usually
> destroy the targets $ab$, because $ab$ has only the proper divisors $a$
> and $b$, and $ab > n/2$ has no proper multiple in $\{2, \dots, n\}$. A
> Phase-1 move can destroy a raw fan edge $(a, b)$ only by playing $b$
> itself, which deletes a right-star, or by playing the target $ab$ itself,
> which deletes one edge. Playing the left singleton $a$ cannot occur for
> $a \in A_0$.
>
> Thus the raw count is still
> \[
>   E^\star \ge \left(\tfrac{1}{2} - o(1)\right)\tfrac{n}{\log n}
>   \sum_{a \in A_0} \tfrac{1}{a}
>   \ge \left(\tfrac{1}{4} - o(1)\right)\tfrac{n \log\log n}{\log n}.
> \]
>
> The Phase-1 damage estimate is valid: $|\mathcal A| = O_\delta(n^\delta /
> \log n)$, so right-prime deletions cost at most
> $O_\delta(|\mathcal A|^2) = O_\delta(n^{2\delta}/\log^2 n) = o(n/\log n)$,
> and individual target deletions cost only $O_\delta(|\mathcal A|) =
> o(n/\log n)$. Since $\delta < 1/2$, this is negligible compared with
> $n \log\log n / \log n$.
>
> One small turn-order detail: if Phase 1 ends immediately after a
> Prolonger move, Shortener may get one move before the first Phase-2
> Prolonger move. Its possible fan damage is at most $O(|\mathcal A|)$, so
> it is also negligible; equivalently, include that intervening Shortener
> move in the Phase-1 damage accounting.
>
> The max-degree capture lemma is correct. If Maker captures degree $d_i$
> in round $i$, then after Maker's move every remaining right degree is at
> most $d_i$. So if Breaker deletes a right vertex in that round, it
> deletes at most $d_i$ edges. Summing over rounds gives $D \le C$. Since
> every edge is eventually captured, right-deleted, or individually
> deleted, $|E| = C + D + X \le 2C + X \le 2(C + X)$, hence
> $C + X \ge |E|/2$.
>
> Finally, the conversion back to game length is sound, with one wording
> tweak: a captured edge forces one eventual game move, not necessarily a
> future Prolonger move. Once a right vertex $b$ has been captured by
> playing some $a_0 b$, the singleton $b$ is illegal; and for every
> captured edge $(a, b)$, the left singleton $a$ is already illegal from
> Phase 1. The target $ab$ has no proper multiple in $\{2, \dots, n\}$, and
> its only relevant proper divisors are $a$ and $b$. Therefore $ab$
> remains legal until $ab$ itself is chosen. Terminal maximality forces it
> to be chosen eventually. Distinct fan targets are all $> n/2$, so they
> are mutually incomparable.
>
> Therefore
> \[
>   L(n) \ge C + X \ge \tfrac{|E_0|}{2}
>   \ge \left(\tfrac{1}{8} - o(1)\right)\tfrac{n \log\log n}{\log n}.
> \]

## Publication-quality requirements

- **Full theorem statement** with explicit quantifiers, stated for every
  fixed $\delta \in (0, 1/2)$, valid for all sufficiently large $n$.
- **State the max-degree capture lemma as its own numbered Lemma** (use a
  label like `\lem:max-degree-capture`). The lemma is a standalone
  Maker-Breaker result on bipartite graphs and should be provable without
  reference to the game. Include its proof in full.
- **Proof of the main theorem** should follow the four-part structure:
  (1) setup (fan graph definitions, $\mathcal A$, $J_a$), (2) Phase 1
  analysis with the corrected $A_0$ definition and the harmonic charging
  argument, (3) fan edge count and Phase-1 damage accounting, (4) Phase 2
  application of the capture lemma and conversion to game length.
- **Use the paper's existing macros**: `\L`, `\U`, `\PP`, etc.
- **No harness vocabulary** anywhere. No "round numbers", no
  "audit-confirmed", no researcher-NN references.
- **Reference the new theorem from the intro, abstract, and conclusion**
  using `\Cref`.

## Abstract revision

The current abstract mentions only a "polynomial lower bound for the
weighted shield functional" on the lower-bound side. Revise to include both
the unconditional game-length lower bound and the shield obstruction, e.g.
(adapt style to match):

> We prove
> \[
>   \left(\tfrac{1}{8} - o(1)\right)\tfrac{n \log\log n}{\log n}
>   \le L(n) \le
>   \left(\tfrac{\Wfour}{2} + o(1)\right) n
>   = (0.1897112 + o(1)) n < 0.19 n,
> \]
> where the lower bound follows from a two-phase Prolonger strategy and a
> bipartite max-degree capture lemma, and the upper bound from ... [rest
> unchanged]

## Conclusion revision

The top sentence of `09-conclusion.tex` currently reads "We have proved
[display with the conditional T2 bounds]". Revise to begin with the two
unconditional bounds:
\[
  \left(\tfrac{1}{8} - o(1)\right)\tfrac{n\log\log n}{\log n}
  \le L(n) \le
  \left(\tfrac{\Wfour}{2} + o(1)\right) n,
\]
then the conditional T2 note, then the standing open question about the
sharp order of growth.

## Commit

After recompile succeeds with zero undefined references and no new error-
class warnings, commit with message:

```
Paper: add unconditional L(n) >= (1/8 - o(1)) n log log n / log n lower bound

Adds the two-phase fan-capture Prolonger strategy as a main-text theorem in
Section 4, with the max-degree bipartite capture lemma stated and proved
inline. Updates introduction (headline #2), abstract, and conclusion to
treat the unconditional lower and upper bounds symmetrically. The harmonic
charging argument uses the corrected A_0 definition covering all small
primes killed during Phase 1 by a chosen proper multiple, not only primes
activated by Prolonger.
```

Then push.

## Honest audit

After the commit, reply with a short note covering:

1. Whether the theorem proof in Section 4 is fully written at theorem-proof
   level or has any glossed step.
2. Whether the max-degree capture lemma's proof is complete, including the
   case where Breaker chooses "do nothing" or an alternating sequence of
   the three Breaker options.
3. Any wording you had to add that goes beyond Pro's verification (e.g.,
   precise quantifier structure of the Phase-1 damage estimate, handling
   of the $\log(n/a)$ vs. $\log n$ replacement).
4. Whether you updated all four files (Section 4, Section 1 intro,
   `main.tex` abstract, Section 9 conclusion) or only some.

Report in under 200 words.
