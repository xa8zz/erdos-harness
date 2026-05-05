This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

## Task

Below is a complete proof-chain section from a mathematics paper in
preparation. This is the second-pass version: a prior adversarial audit
identified multiple gaps, and the section was rewritten to close them. Your
job is to audit the rewritten version at referee standard for a specialist
number theory or extremal combinatorics journal.

Adversarial stance: assume nothing from the rewrite is correct just because
it was written to close a known gap. Previous rewrites in this project have
introduced new subtle issues while attempting to fix old ones.

## Specific checks to run

The rewrite introduced six load-bearing new or corrected constructions.
Evaluate each at publishable rigor, and flag any step that a careful
referee would reject.

**1. Queued coarse-bin matching in the prime-rounding bridge.** The
construction partitions each genuine envelope block into multiplicative
bins $I_k = [A a^k, A a^{k+1})$, introduces a finite queue length $s = s(a)$
chosen so that $(1 - \eta)(a^{s+1} - 1) > (1 + \eta) \cdot 2 \cdot a^s$ for
some fixed $\eta > 0$, and processes prime bins in increasing order.
Verify:

   (a) The flat atom $f_h$ really does have cardinality at most
       $(1 + o_H(1)) A_h / ((h+1) \log A_h)$ as claimed, rather than, say,
       $A_h / (h \log A_h)$.
   (b) The fixed-ratio PNT estimate for $P_k$ is applied only on bins of
       fixed multiplicative ratio, not on shrinking bins near a boundary.
   (c) The queue-clearing condition $(1-\eta)(a^{s+1}-1) > (1+\eta) \cdot 2 \cdot a^s$
       is actually what the assignment needs, i.e., that with this
       inequality, after processing $s+1$ prime bins, the cumulative prime
       supply exceeds the cumulative demand including the flat atom and the
       first $s$ genuine $b$-bins.
   (d) For nonexceptional indices, the bound $p_j \le a^2 b_j$ is stated
       and proved, not just assumed.
   (e) Assignments from different genuine blocks $h$ and $h-1$ do not
       overlap, which requires $a^2 B_h < A_{h-1}$ for large $n$. This
       uses $\alpha_{h-1} - \beta_h = 2 \tau_H$; check that $\tau_H > 0$
       is large enough at fixed $H$ to absorb $\log a^2 / \log n$.
   (f) The exceptional-index reciprocal mass is $O_{H,a}(1/\log n)$, which
       should follow from counting $O_{H,a}(1)$ exceptional bins each of
       reciprocal mass $O_H(1/\log n)$, plus the top flat block
       contribution $K/n = O(1/\log n)$.

**2. Cell-count bound for shrinking boundary strips.** The construction
partitions the positive scale into logarithmic cells $[Y, cY)$ and proves
each has reciprocal mass $O_{H,c}(1/\log n)$. Verify:

   (a) The bound is proved for genuine-block cells, flat-atom-adjacent
       cells, AND the top flat block. Flat-atom-adjacent cells contain both
       the flat atom and nearby genuine-block elements; the combined
       reciprocal mass must be $O_H(1/\log n)$, not the flat-atom mass
       alone.
   (b) The product-strip bound for the $r$-fold product region
       $n/C < x_1 \cdots x_r \le Cn$ uses a correct cell-counting:
       $O_{H,C,c,r}((\log n)^{r-1})$ relevant cell patterns, each with
       reciprocal mass $O_{H,c,r}(1/(\log n)^r)$, giving $O_{H,C,c,r}(1/\log n)
       = o_H(1)$ total.
   (c) No residual appeal to weak convergence is left in the section.

**3. Diagonalization with full parameter control.** The construction picks
$H_m \to \infty$, then $\lambda_m \downarrow 1$ and $a_m$ with $a_m^2 \le
\lambda_m$, then defines $N_m$ recursively to enforce several side
conditions simultaneously. Verify:

   (a) Every side condition used in the rest of the section is actually in
       the list of things $N_m$ is chosen to enforce. In particular:
       local density error $\xi_{H_m}(n) \le 1/m$; envelope moment
       $|T_r^{(b^{(H_m)})}(n) - J_r^{(H_m)}| \le 1/(4m)$; bridge moment
       $|T_r^{(p^{(H_m)})}(n) - T_r^{(b^{(H_m)})}(n)| \le 1/(2m)$; smallest
       genuine scale $n^{\alpha_{H_m - 1}} \ge m$; fixed-ratio PNT
       estimates at $(H_m, a_m, \lambda_m)$ within tolerance $1/m$; the
       cell-count bound from sub-claim 2 within tolerance $1/m$; the
       exceptional-mass bound from sub-claim 1(f) within tolerance $1/m$.
   (b) The triangle-inequality telescope
       $|T_r^{(b^{(n)})}(n) - J_r| \le |T_r^{(b^{(H_m)})}(n) - J_r^{(H_m)}| +
       |J_r^{(H_m)} - J_r|$ is stated and used correctly; likewise for the
       prime sequence $p^{(n)}$.
   (c) The claim $T_r^{(b^{(n)})}(n) = J_r + o(1)$ follows from the
       telescope plus the choice of $N_m$, without any extra assumption.
   (d) $H(n) \to \infty$ is actually a consequence of the $H_m \to \infty$
       and $N_m$ increasing construction.

**4. Interval-arithmetic certification of $\Wfour / 2 < 0.19$.** The
construction uses $N = 10^5$ cells on $(0, 1]$, the exact antiderivative
formula for $\rho$, tail truncation at $H^\star = 10^6$ with tail bound
$\sum_{\ell > H^\star} \log(1 + 1/\ell)/(\ell+1) \le 1/(H^\star + 1)$, and
interval convolution. Verify:

   (a) The antiderivative formula $F(x) = T_{h+1} + \log((h+1)x)/(h+1)$ on
       $(1/(h+1), 1/h]$ is correct. Check by computing $F(1/h) - F(1/(h+1))
       = \log(h/(h+1))/(h+1) + \log((h+1)/(h+1))/(h+1) - \log(h/h)/h - \ldots$
       derivation.
   (b) The tail bound $1/(H^\star + 1)$ for $\sum_{\ell > H^\star}
       \log(1 + 1/\ell)/(\ell+1)$ uses the correct inequalities: the lower
       bound is $1/(\ell+1)^2$ and upper bound is $1/(\ell(\ell+1)) =
       1/\ell - 1/(\ell+1)$, telescoping to $1/(H^\star + 1)$.
   (c) The interval convolution $c_s^{(r)}$ bounds $J_r$ correctly: lower
       bound is $\sum_{s \le N} c_s^{(r)} / r!$ (cells wholly inside the
       simplex), upper bound is $\sum_{s \le N + r} c_s^{(r)} / r!$ (cells
       whose lower endpoints can meet the simplex). Check the off-by-one
       in the upper bound.
   (d) The certified intervals for $J_1, J_2, J_3, J_4$ lead to the stated
       upper bound $\Wfour / 2 \le 0.1897123371$ by taking lower bounds of
       $J_1, J_3$ and upper bounds of $J_2, J_4$.
   (e) The interval-arithmetic machinery controls directed rounding for
       logarithms and divisions inside the convolution.

**5. Bonferroni error-term correction.** The rewrite replaces the incorrect
error term $O(M_r)$ with $O(D_r)$, where $D_r := \#\{j_1 < \cdots < j_r :
p_{j_1} \cdots p_{j_r} \le n\}$. Verify:

   (a) The floor-error per intersection is $O(1)$, so the total error from
       Bonferroni inclusion-exclusion is $O(D_1 + D_2 + D_3 + D_4)$, not
       $O(M_2 + M_3 + M_4)$.
   (b) $D_r \le \#\{$squarefree integers $m \le n$ with exactly $r$ prime
       factors$\}$, which is $O_r(n (\log\log n)^{r-1} / \log n)$ by
       Landau's theorem.
   (c) No residual $M_r$ definition or reference is left in the section.

**6. Monotonicity of the odd-sieve count.** The rewrite adds a short lemma
or in-proof argument that $N(q_1, \ldots, q_K) \le N(p_1, \ldots, p_K)$
when $q_j \le p_j$ for all $j$ and both are increasing sequences of odd
primes. Verify:

   (a) The descending replacement argument is stated correctly: replacing
       $q_k$ by $p_k$ in the current sorted set only increases the count of
       odd survivors.
   (b) The "sorted structure is preserved" claim is nontrivial and proved
       rather than asserted.

**7. Prefix existence.** The rewrite adds a lemma or paragraph showing
that Shortener can make all $K = \lfloor (1 - \varepsilon) n / (2 \log n)
\rfloor$ odd-prime moves without the game ending. Verify:

   (a) The argument counts prior moves correctly: before Shortener's
       $j$-th odd-prime move, at most $2j - 1$ prior moves have occurred.
   (b) Each prior move kills at most one odd prime in the target range.
   (c) The target range has sufficiently many odd primes: $\pi(n) -
       \pi(\sqrt{n}) \sim n/\log n > 2K$ for large $n$, with $K \sim
       (1 - \varepsilon) n / (2 \log n)$.

**8. Conditional local-density equality.** The proof of the local-density
proposition now states explicitly that the stopping-time equality $S(X)
= S_K(X)$ is conditional on prefix-existence. Verify the wording is
correct and the dependency on the prefix-existence lemma is made
explicit.

## General anti-patterns to also check for

Independently of the specific checks above, run the general referee passes
from the prior audit:

- `o(1)` and $O(1)$ claims with hidden uniformity assumptions.
- Lemma citations where the lemma isn't stated or proved in the section.
- Quantifier orderings (for every $\eps > 0$ there exists vs. uniformly
  in $\eps$).
- Limit orderings (let $n \to \infty$ then $H \to \infty$ vs. a diagonal).
- "Analogously" / "similarly" hiding structurally different cases.
- Error-term aggregation where the error is bounded pointwise but not
  summed.

## Verdict format

If the proof chain now holds up at referee standard, say so plainly.

If any step does not, name the step (theorem number, proposition number,
lemma number, or a quoted opening phrase) and describe the gap precisely.
Prefer clean concessions of specific gaps to vague concerns. Distinguish
between (i) fatal gaps that break the main theorem, (ii) repairable
gaps where you can suggest the specific fix, (iii) wording issues that
don't affect the argument but would confuse a referee.

Do not rubber-stamp. The previous audit of this section was generally
correct in identifying real gaps; if this version has introduced new
subtle issues during the repair, that is exactly what we want to know.

## Content to audit

[PASTE THE FULL CURRENT CONTENT OF
`erdos-872/paper/sections/07-main-upper-bound.tex` HERE AFTER CODEX'S
EIGHT REPAIR COMMITS HAVE LANDED.
DO NOT PASTE THE PRE-REPAIR VERSION — THAT WOULD AUDIT AN OLDER ARTIFACT
AND WASTE PRO'S CYCLES ON GAPS THAT ARE ALREADY KNOWN.]
