# Codex Task: Close all repair items from round 2 of Pro audits

Three Pro audits returned in parallel. No fatal gaps; twelve repairable items
across Appendix A, Appendix B, and Section 7. Integrate each as its own
commit.

Working directory: `/Users/omisverycool/erdos-harness`.

## Compile / workflow rules

- Rebuild with `tectonic -X compile main.tex` from `erdos-872/paper/`.
- One commit per fix. Do not batch.
- No amend, no force-push, no `--no-verify`.
- Push after all commits with `git push origin HEAD`.

---

## Appendix A fixes (`sections/appendix-A-deferred-proofs.tex`)

### Fix A1 — Clarify the K_4 refutation uses an unscored edge-deletion Breaker reply

The K_4 fiber refutation of the general safe-edge hypothesis ends with
Breaker deleting the last live edge by an unscored deletion (adding it to
$D_E$), which changes $Q$ by $-8$. The later `prop:t2-finite-capture`
proposition handles a scored-edge Breaker reply, under which the same move
would change $Q$ by $8 w(e) - 2^{|e \cap C|} w(e) = 8 - 8 = 0$, not $-8$.

Add a sentence at the end of the K_4 refutation proof clarifying: "Note
that Breaker's final reply here is an unscored edge deletion (adding
$e_{17,23}$ to $D_E$), not a scored-edge play; under the scored-edge rule,
the same move would change $Q$ by $0$, not $-8$. The refutation shows that
the general safe-edge hypothesis fails even when Breaker has access to the
unscored-edge-deletion move, which is the regime relevant to the rank-$3$
residual hypergraph game."

Commit message: `Paper: clarify K_4 safe-edge refutation uses unscored edge deletion`.

### Fix A2 — Give the finite-capture proposition a unified list of legal Breaker replies

The current `prop:t2-finite-capture` statement mixes "delete one unclaimed
live edge," "post-Maker vertex-deletion bound," and "score one live edge"
across the graph and scored-hypergraph variants. Rewrite the legal-reply
list as a unified enumerated block:

"In each full Maker-Breaker round, Breaker may play any one of:

(i) a vertex deletion: add an uncaptured vertex $v \in V \setminus C$ to
$D_V$;

(ii) an unscored edge deletion: add one currently live edge $e$ to $D_E$
(available in both the graph and the scored-hypergraph variants);

(iii) a scored-edge reply: add one currently live edge $e$ to $K$ and
increment $S$ by $w(e)$ (available only in the scored-hypergraph variant).

The safe-edge hypothesis asserts that at every reachable pre-Maker state
with at least one live positive-weight edge, Maker has a legal move $f$
such that every legal Breaker reply from (i)-(iii) applicable to the
current variant leaves $Q$ at least as large as before Maker's move."

Keep the subsequent proof structure; only the legal-reply enumeration
changes.

Commit message: `Paper: unify legal Breaker-reply list in finite-capture proposition`.

### Fix A3 (SUBSTANTIVE) — Strengthen the residual divisibility embedding hypothesis to secured-pair origin

Pro found that the current `prop:t2-residual-embedding` hypothesis
"$\mathcal T_*$ is any subfamily such that $a, c, ac$ are already
unavailable for each $t = acb \in \mathcal T_*$" is too weak: item 4
("every live hyperedge corresponds to a legal actual move") does not
follow. If $a$ or $c$ itself was previously played, then $a \mid t$ or
$c \mid t$, so $t$ is not legal even though its slot hyperedge $\{b, ab,
cb\}$ is live.

The embedding is only used downstream for residual targets over secured
pairs, where the unavailability of $a, c, ac$ comes specifically from
Prolonger's earlier securing target $t_0 = a c b_0$ over the pair $(a,c)$.
Under that specific origin, $a, c, ac$ are unavailable because each
divides $t_0$, and no other earlier move is comparable with residual
$acb \in \mathcal T_*$ (since all residual targets lie in $(n/2, n]$ and
are pairwise incomparable, and $t_0$ differs from every other target).

Strengthen the proposition's hypothesis to:

"Let $\mathcal T_*$ be a subfamily of targets $t = acb \in \mathcal T$
such that for each $t = acb \in \mathcal T_*$ there exists a securing
target $t_0(a,c) = a c b_0 \in \mathcal T$ with $b_0 \ne b$ that has
already been played, making $a$, $c$, and $ac$ unavailable as move
options; and no other earlier move is comparable with any $t \in
\mathcal T_*$."

Then update item 4's proof to cite this stronger hypothesis: the only
earlier moves comparable with $t$ are those that divide or are divided
by $t$, and both the securing target $t_0$ (a distinct target $>n/2$,
hence incomparable) and the slot moves $\{b, ab, cb\}$ (excluded by the
live-hyperedge assumption) are the only candidates; by hypothesis, no
other earlier move is comparable.

Update the downstream `prop:t2-final` proof to observe that the residual
subfamily generated after activation satisfies this strengthened
hypothesis: each secured pair $(a,c)$ has Prolonger's activation target
$t_0(a,c)$ as the securing move, and no other earlier move is comparable
with residual targets because Shortener's non-off-model moves are exactly
graph vertex/edge deletions that do not produce comparable integers.

Commit message: `Paper: strengthen residual divisibility embedding hypothesis to secured-pair origin`.

### Fix A4 — Clarify that E counts deleted tokens, not off-model moves

In the activation-stage potential proof, current wording may suggest
$E = |$off-model Shortener moves$|$, but Pro notes the correct reading is
$E = |$target tokens deleted by off-model moves$|$. One off-model move
can delete many tokens (a single large prime $b$ kills up to $O(Y^2/\log^2
Y)$ tokens).

Add one sentence at the first occurrence of $E$:

"Here $E$ counts the total number of live target tokens deleted by
off-model Shortener moves during activation, NOT the number of such moves.
A single off-model move can delete multiple tokens; the count $E$ tallies
deletions, not move events."

The deletion-budget proof (prop:t2-deletion-budget) is already correct in
its per-move token bound, so no math change is needed there.

Commit message: `Paper: clarify E counts deleted tokens (not moves) in activation potential`.

### Fix A5 — Align `prop:disjoint-carriers` statement with its actual proof content

Pro notes that the proposition is titled something like "disjoint
small-prime carriers" but the hypothesis in the body is actually "every
composite Prolonger move has all prime factors at most $y = n^\alpha$, and
distinct composite Prolonger moves have pairwise disjoint prime supports."
These are genuinely different hypotheses.

Choose one of two fixes:

(a) **Align the advertised name to the actual statement.** Retitle as
something like "Small-prime composite Prolonger with disjoint supports."
Update the intro's reference to this theorem (and any cross-reference) to
match. The proof as written then stands.

(b) **Rewrite the proposition to the advertised "disjoint-range $ab$"
form.** Significantly more work; only do this if (a) is clearly
unacceptable.

Default: choose (a). The "disjoint supports" result is a valid restricted-
class theorem; the title just needs to match.

Add the missing quantifier clarification Pro flagged: define $B$
operationally **after** the prime phase (as the set of small primes not
resolved by prime play because they appear in observed Prolonger
carriers), not as a clairvoyantly-known set.

Commit message: `Paper: align disjoint-carrier proposition title to its actual statement + clarify B operationally`.

### Fix A6 — Add the missing bridge sentence after the prime phase in the squarefree rank-3 proof

The squarefree rank-3 carrier proof resolves all moves supported on $B$
(the small-prime set after the prime phase), but does not explicitly say
that every prime outside $B$ has already been played or blocked, so no
future legal move can contain such a prime.

Add one sentence just before the final support-casework block:

"After the prime phase, every prime $p \le y$ with $p \notin B$ has
either been played as the singleton $p$ or has had some proper multiple
played; in either case, no future legal Prolonger move can contain $p$
as a factor. Therefore any remaining composite Prolonger move is
supported on $B$."

Commit message: `Paper: add post-prime-phase bridge sentence to squarefree rank-3 proof`.

---

## Appendix B fixes (`sections/appendix-B-numerical.tex`)

### Fix B1 — Correct or clarify the upper-bound convolution cell condition

The exact "meets the simplex" condition is $s \le N + r - 1$ (since cell
lower endpoints are open). The current text uses $s \le N + r$, which is
one shell too loose but still a valid upper enclosure.

Choose one:

(a) **Fix to the exact condition $s \le N + r - 1$.** Recompute
$c_s^{(r)}$ sums accordingly; the certified $J_r$ intervals will shrink
slightly but remain valid. The final $\Wfour / 2 \le 0.1897123371$ bound
stands.

(b) **Keep $s \le N + r$ and explicitly note the one-shell overcount.**
Add a sentence: "Note that $s \le N + r$ is a harmless overcount of one
convolution shell relative to the exact meeting condition
$s \le N + r - 1$; the displayed upper bounds are therefore slightly
looser than sharp but remain rigorous."

Default: choose (a) if the recompute is straightforward; (b) if any risk
of arithmetic drift from recomputing. A referee will prefer (a).

Commit message: `Paper: tighten convolution upper-bound cell condition to s <= N+r-1` (or
`Paper: clarify s <= N+r is a one-shell overcount in W_4 certification`).

### Fix B2 — Specify the directed-rounding implementation reproducibly

Current text states "All logarithms, sums, and differences are evaluated
with outward-rounded interval arithmetic." Pro flagged this as
directionally correct but not reproducible.

Add a new subsection or appendix note specifying the minimal machinery:

- Outward-rounded logarithm: `log_dn(x), log_up(x)` computed using
  IEEE-754 directed rounding modes (or a library with documented
  correctly-rounded log).
- Outward-rounded summation: each partial sum computed with the correct
  direction (round-down for lower, round-up for upper).
- Outward-rounded subtraction: $F(i/N) - F((i-1)/N)$ computed as
  `round_down(F_dn(i/N) - F_up((i-1)/N))` for lower mass and
  `round_up(F_up(i/N) - F_dn((i-1)/N))` for upper mass.
- Convolution: pairwise product-summation with directed rounding on each
  step; if an FFT is used, the FFT round-off must itself be bounded
  outward.

Alternatively, include a short reproducible Python script at
`scripts/wfour_certification.py` using the `mpmath` library (or
equivalent) with explicit interval arithmetic, and reference it in the
appendix as "Computation script: \texttt{scripts/wfour\_certification.py}."

Default: whichever is cleaner. The pseudocode option is more portable;
the script option is more concrete.

Commit message: `Paper: specify directed-rounding machinery for W_4 interval certification`.

---

## Section 7 fixes (`sections/07-main-upper-bound.tex`)

### Fix S1 — Note the greedy queue assignment preserves increasing prime indices

In `prop:queued-prime-rounding`, the Hall-matching argument says "assign
each prime to the oldest unassigned released demand." Add one sentence
explaining that this greedy rule, together with the increasing enumeration
of prime bins, produces an **increasing** sequence $p_1 < p_2 < \cdots <
p_K$ as required by the bridge theorem.

Suggested wording: "The greedy rule, together with the fact that we
process prime bins in increasing order and assign the smallest available
prime within each bin to the oldest unassigned demand, ensures the
assigned prime sequence $p_1 < p_2 < \cdots < p_K$ is strictly increasing."

Commit message: `Paper: note greedy queue assignment preserves increasing prime sequence`.

### Fix S2 — Specify the cell ratio c in the product-strip application

In the queued-prime-rounding proof, the citation reads "by
`\Cref{lem:product-strip-reciprocal}` with $C = \lambda^r$." The lemma
also has a parameter $c > 1$ for the cell ratio. Specify: "with $C =
\lambda^r$ and $c = a$" (or another fixed choice), since $a$ is already
the fixed multiplicative bin ratio in the surrounding construction.

Commit message: `Paper: specify cell ratio c in product-strip application`.

### Fix S3 — Tighten the diagonalization threshold list

Two items need strengthening:

(a) Current item 8 reads something like "the exceptional-mass bound
$\sum_{j \in E} 1/b_j \le C_m / \log n$." Strengthen to "the
exceptional-mass bound $\sum_{j \in E} 1/b_j \le 1/m$," which is
achievable by enlarging $N_m$ so that $C_m / \log n \le 1/m$ at all
$n \ge N_m$.

(b) Add two more items to the enumeration:

11. Interblock nonoverlap: $a_m^2 B_h < A_{h-1}$ for all blocks
    $h = 2, \ldots, H_m - 1$, and $a_m^2 B_1 < n$.

12. Top-block prime supply: $\pi(2n) - \pi(n) \ge K$ (so the top flat
    block $b_j = n$ has enough primes in $(n, 2n]$ to be assigned).

Commit message: `Paper: tighten diagonalization threshold list (item 8, interblock, top-block)`.

### Fix S4 — Add the harmless O(1) base-count allowance in the Bonferroni display

The total number of odd integers $\le n$ is $n/2 + O(1)$, not exactly
$n/2$. The Bonferroni display should either write $n/2 + O(1)$ or define
$D_0 = 1$ and include it in the error absorption.

Suggested: change the display from

\[
  N(p_1, \ldots, p_K) \le \frac{n}{2} (1 - T_1^{(p)} + T_2^{(p)} - T_3^{(p)} + T_4^{(p)}) + O(D_1 + D_2 + D_3 + D_4)
\]

to

\[
  N(p_1, \ldots, p_K) \le \frac{n}{2} (1 - T_1^{(p)} + T_2^{(p)} - T_3^{(p)} + T_4^{(p)}) + O(1 + D_1 + D_2 + D_3 + D_4),
\]

or equivalently absorb the $O(1)$ into $D_0$ defined as $1$. This has no
effect on the main theorem, since $1 + D_1 + \cdots + D_4 = o(n)$.

Commit message: `Paper: add O(1) base-count allowance in Bonferroni display`.

---

## Final audit

After all twelve commits land and the paper recompiles cleanly, write a
short self-audit (under 300 words) covering:

1. Which fixes closed fully.
2. For Fix A3 (substantive): did the hypothesis strengthening propagate
   correctly to `prop:t2-final`'s proof, i.e., is the residual subfamily
   generated after activation shown to satisfy the new secured-pair-origin
   hypothesis?
3. For Fix A5: which option (a) or (b) did you choose, and why? If (a),
   did you update every downstream reference (intro theorem list,
   conclusion, glossary if any)?
4. For Fix B1: which option (a) or (b) did you choose? If (a), did the
   recomputed $J_r$ intervals still give $\Wfour / 2 < 0.19$?
5. For Fix B2: did you include a reproducible script or pseudocode? Path?
6. Any new gaps you noticed while writing.

Push when done.
