# Codex Task: Integrate Pro's Section 7 repairs + resolve remaining audit items

Pro returned with rigorous constructions for the four mathematical gaps in
`sections/07-main-upper-bound.tex` identified by the Section 7 audit
(see `AUDIT_SECTION_7_FINDINGS.md`). Pro's response is saved verbatim at
`erdos-872/paper/SECTION_7_REPAIR_PRO_RETURN.md`. Your task is to integrate
Pro's repairs into Section 7 at theorem-proof level, along with four smaller
text-level audit fixes that were deferred pending Pro's reconstruction of the
surrounding machinery.

Working directory: `/Users/omisverycool/erdos-harness`.

## Compile / workflow rules

- Rebuild with `tectonic -X compile main.tex` from `erdos-872/paper/`.
- Each sub-item below gets its own commit. No batching into a single commit.
- No amending, no force-pushing, no `--no-verify`.
- After all commits, push with `git push origin HEAD`.

## Source-of-truth documents

- `erdos-872/paper/SECTION_7_REPAIR_PRO_RETURN.md` — Pro's verbatim repair
  constructions for sub-problems (A), (B), (C), (D). The mathematical content
  to be integrated is in this file.
- `erdos-872/paper/AUDIT_SECTION_7_FINDINGS.md` — the original audit report.
  The remaining audit items (1, 2, 6, 7) were not addressed by Pro's return
  and need text-level fixes in this pass.

## The eight sub-tasks

### Task A — Replace the boundary-reservoir Hall argument with the queued coarse-bin matching (Pro's (A))

The current `Theorem [Prime-rounding bridge]` in
`sections/07-main-upper-bound.tex` cites a Hall-condition argument inside a
short boundary reservoir. That argument is invalid: fixed-interval PNT
estimates do not suffice to verify Hall inequalities on arbitrarily short
suffixes.

Replace it with Pro's queued coarse-bin construction: partition the genuine
block $[A_h, B_h]$ into fixed-multiplicative bins $I_k = [A a^k, A a^{k+1})$,
process prime bins in increasing order, and assign each bin's demand to
primes from the next prime bin. Absorb the flat atom and the first $s = s(a)$
genuine bins via a finite queue that clears after $s$ prime bins using the
inequality $(1-\eta)(a^{s+1}-1) > (1+\eta) \cdot 2 \cdot a^s$ for a
sufficiently large integer $s$ depending on $a > 1$.

Requirements:

- State the new construction at full theorem-proof level. Every claimed
  estimate must be cited from an earlier proposition or proved on the spot.
- Use Pro's notation: $A_h = n^{\alpha_h}$, $B_h = n^{\beta_h}$, $a > 1$
  with $a^2 \le \lambda$, $I_k$ for $b$-bins and $[A a^k, A a^{k+1})$ for
  prime bins, $d_k$ for bin demand counts, $f_h$ for flat atoms, $P_k$ for
  prime counts per bin.
- Prove the exceptional-index reciprocal mass bound
  $\sum_{j \in E} 1/b_j = O_{H,a}(1/\log n)$ explicitly.
- Derive the moment comparison (Pro's equation (7))
  $T_r^{(p)}(n) = T_r^{(b)}(n) + O_{H,r}(\lambda - 1) + o_{H,\lambda}(1)$
  and show that taking $\lambda \downarrow 1$ with the diagonalization from
  Task C recovers the literal bridge conclusion.
- Delete the old Hall-condition paragraph entirely; do not leave it as an
  "alternative approach."
- Update the durable note in `AGENTS.md` (if present) about the
  `sup p_j / b_j \to 1` pitfall; confirm the new queued construction does
  NOT claim a uniform sup, only a fixed-factor $p_j \le a^2 b_j$ on
  nonexceptional indices plus negligible reciprocal mass on exceptional
  indices.

Commit message: `Paper: replace prime-bridge Hall argument with queued coarse-bin matching (Section 7)`.

### Task B — Replace the weak-convergence argument with the cell-count bound (Pro's (B))

The current section uses "empirical measures ... converge weakly to an
absolutely continuous limit" to control the boundary strip. This is false as
stated: atomic empirical measures can concentrate on shrinking sets.

Replace with Pro's cell-count argument: partition into logarithmic cells
$[Y, cY)$, prove each cell has reciprocal mass $O_{H,c}(1/\log n)$, and
conclude that the product boundary strip
$\{n/C < x_1 x_2 \cdots x_r \le Cn\}$ has total reciprocal contribution
$O_{H,C,c,r}(1/\log n) = o_H(1)$.

Requirements:

- State the per-cell reciprocal-mass bound as a numbered Lemma.
- Prove it in the three cases Pro identifies: genuine-block cells,
  flat-atom-adjacent cells, and the top flat block.
- Prove the product-strip bound (Pro's equation (9)) inline in the bridge
  proof.
- Remove the misleading "weak convergence" sentence; do not leave a trace of
  it.

Commit message: `Paper: replace weak-convergence argument with cell-count bound (Section 7)`.

### Task C — Rewrite the diagonalization with full parameter control (Pro's (C))

The current diagonalization sketches $H(n) \to \infty$ but does not enlarge
$N_m$ with all the side conditions required for the other estimates to hold
simultaneously at the chosen parameters.

Replace with Pro's explicit construction: choose $H_m$ increasing so the
excision bound gives $|J_r^{(H_m)} - J_r| \le 1/(4m)$; choose $\lambda_m$ so
the weight-change term from Task A gives $O_{H_m, r}(\lambda_m - 1) \le
1/(4m)$; choose $a_m$ with $a_m^2 \le \lambda_m$; choose $N_m$ recursively
increasing so that for all $n \ge N_m$, each of the following holds:

- $\xi_{H_m}(n) \le 1/m$ (local density error)
- $|T_r^{(b^{(H_m)})}(n) - J_r^{(H_m)}| \le 1/(4m)$ (envelope moment)
- $|T_r^{(p^{(H_m)})}(n) - T_r^{(b^{(H_m)})}(n)| \le 1/(2m)$ (bridge moment)
- $n^{\alpha_{H_m - 1}} \ge m$ (smallest genuine scale tends to infinity)
- All fixed-ratio PNT estimates used in Task A and Task B hold to tolerance
  $1/m$

Define $H(n) := H_m$ for $N_m \le n < N_{m+1}$. Verify the telescope
inequalities Pro provides and conclude $T_r^{(b^{(n)})}(n) = J_r + o(1)$ and
$T_r^{(p^{(n)})}(n) = J_r + o(1)$ for $1 \le r \le 4$.

Requirements:

- Present the construction as a numbered Proposition with proof.
- Make every side condition on $N_m$ explicit.
- The "telescope" inequalities should be displayed as a single proof block.

Commit message: `Paper: rewrite diagonalization with full parameter control (Section 7)`.

### Task D — Add the interval-arithmetic certification of W_4/2 < 0.19 (Pro's (D))

Currently `\Wfour / 2 = 0.1897112` is asserted as a numerical value without a
rigorous upper bound. With the margin $0.19 - 0.1897112 \approx 2.9 \times
10^{-4}$, a publishable paper needs a certified computation.

Integrate Pro's interval-arithmetic construction: take $N = 10^5$ cells on
$(0, 1]$, use the exact antiderivative formula for $\rho$ with the tail
bound $\sum_{\ell > H^\star} \log(1 + 1/\ell)/(\ell+1) \le 1/(H^\star + 1)$
for truncation at $H^\star = 10^6$, compute the interval convolutions
$c_s^{(r)}$, and derive the certified bounds

- $J_1 \in [0.7885305658, 0.7885305661]$
- $J_2 \in [0.18681848, 0.18682451]$
- $J_3 \in [0.02009209, 0.02009370]$
- $J_4 \in [0.00122263, 0.00122282]$

giving $\Wfour / 2 \le 0.1897123371 < 0.19$ with explicit margin
$\eta = 2.87 \times 10^{-4}$.

Requirements:

- Add a new subsection to Section 7 or a new subsection in Appendix B
  (your call; prefer Appendix B since it already hosts numerical
  computations). Title something like "Interval-arithmetic certification of
  $\Wfour / 2 < 0.19$".
- State the certified intervals for $J_1, J_2, J_3, J_4$ as a numbered
  Proposition or Lemma.
- Describe the computation method (cell partition, interval convolution,
  tail truncation bound) in enough detail that the result is reproducible
  from the paper alone.
- Replace the body's bare `\Wfour / 2 = 0.1897112` equation with a
  citation to the new certification lemma, e.g. "Numerical evaluation
  (\Cref{lem:wfour-certification}) gives $\Wfour / 2 \le 0.1897123371 < 0.19$".
- Optionally: produce a small Python script in `scripts/` that replicates
  the certified computation and mention this in the subsection. Not strictly
  required, but makes the numerical certification reproducible.

Commit message: `Paper: add interval-arithmetic certification of W_4/2 < 0.19`.

### Task E — Fix the Bonferroni error-term: M_r -> D_r (audit item 1)

The current `Theorem [Prime-sequence Bonferroni--4 comparison]` in Section 7
writes the error term as $O(M_2 + M_3 + M_4)$ with $M_r$ defined as "the
number of odd integers $\le n$ with at least $r$ distinct prime divisors
from $\{p_j\}$." This is NOT $o(n)$: e.g., for all odd primes, $M_2 \sim n/2$.

Replace with $D_r := \#\{j_1 < \cdots < j_r : p_{j_1} \cdots p_{j_r} \le n\}$.
Each $r$-fold intersection count $\#\{m \le n : m$ odd$, \ p_{j_1} \cdots p_{j_r} \mid m\}$
is $n/(2 p_{j_1} \cdots p_{j_r}) + O(1)$, so the floor-error contribution is
$O(D_1 + D_2 + D_3 + D_4)$. Since $D_r \le \#\{$squarefree with exactly $r$
prime factors$\} = O_r(n (\log\log n)^{r-1}/\log n) = o(n)$, the Bonferroni
comparison closes.

Requirements:

- Update the theorem statement and proof to use $D_r$ throughout.
- Explicitly state and cite the Landau-type bound for squarefree integers
  with exactly $r$ prime factors.
- Remove any $M_r$ definition from the section.

Commit message: `Paper: fix Bonferroni error term M_r -> D_r with squarefree r-fold products`.

### Task F — Prove the monotonicity step for the prime sieve count (audit item 2)

The Bonferroni theorem invokes
"$N(q_1, \ldots, q_K) \le N(p_1, \ldots, p_K)$ because $q_j \le p_j$" as a
one-line assertion. Add a short proof via descending replacement: replacing
$q_k$ with $p_k$ (for $k = K$ down to $1$) only increases the count of odd
survivors, because fewer odd integers are divisible by the larger prime, and
the remaining primes retain their sorted structure.

Requirements:

- Add a short numbered Lemma (one paragraph statement + proof) establishing
  the monotonicity.
- Cite it in the Bonferroni theorem's proof where the inequality is used.

Commit message: `Paper: add monotonicity lemma for odd-sieve count under prime upgrades`.

### Task G — Prove K-prime prefix existence (audit item 6)

Section 7 defines the prefix $q_1 < \cdots < q_K$ of odd primes Shortener
plays, but never proves Shortener can make $K$ legal odd-prime moves without
the game ending first. Add a short argument: before Shortener's $j$-th
odd-prime move, $\le 2j - 1$ prior moves have occurred; each prior move
kills at most one odd prime in $(\sqrt{n}, n/(2ac)]$-style intervals; the
count of odd primes in an appropriate range is $\sim n/(2 \log n) = K$,
comfortably more than the number of prior moves for all $j \le K$. Hence a
legal odd prime always exists for Shortener's first $K$ prime moves, for
$n$ sufficiently large and $\varepsilon \in (0, 1)$.

Requirements:

- Add a numbered Lemma (prefix-existence) early in Section 7, before the
  $q_j$ are first used.
- State the explicit inequality at the level of $\pi(n) - \pi(\sqrt{n})
  \sim n/\log n > 2K$ for large $n$.

Commit message: `Paper: prove K-prime prefix existence for Shortener's strategy`.

### Task H — State the local-density equality conditionally (audit item 7)

In the local-density proposition's proof, the step
"We claim $S(X) = S_K(X)$ ... once $n$ is large enough. Indeed, $u \le 1 - \tau_H$,
so ... $\pi(n^u) = o(K)$" assumes the prime prefix exists for all $K$
steps. Rephrase as "Assuming the prefix exists for all $K$ Shortener
prime moves (\Cref{lem:prefix-existence}), ..." so the local-density equality
is explicitly conditional on the prefix-existence lemma from Task G.

Requirements:

- One-sentence rewrite in the local-density proposition's proof.

Commit message: `Paper: state local-density equality conditionally on prefix existence`.

## Final audit

After all eight commits land and `tectonic -X compile main.tex` succeeds
with zero undefined references and zero missing citations, write a short
audit report (under 300 words) covering:

1. Which tasks closed fully at theorem-proof level and which, if any, you
   had to defer or partially close (e.g., a step you could not write out in
   full without new math input).
2. Any departures from Pro's notation or construction choices, with
   justification.
3. Any new gaps you noticed while writing.
4. Whether the overall Section 7 proof chain now reads as a single coherent
   rigorous argument, or still has stylistic / structural discontinuities.

Push all commits at the end.
