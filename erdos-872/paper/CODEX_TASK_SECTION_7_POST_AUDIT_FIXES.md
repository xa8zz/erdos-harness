# Codex Task: Close the four residual gaps from the Section 7 post-repair audit

The post-repair audit of `sections/07-main-upper-bound.tex` identified four
local remaining gaps, all specified with concrete fix prescriptions by the
auditor. Integrate them one per commit, then run a self-audit against each
of the four gap specifications.

The full audit text, including the auditor's asymptotic calculations, is
reproduced below per gap. Use those calculations verbatim where possible;
do not improvise on the math.

Working directory: `/Users/omisverycool/erdos-harness`.

## Compile / workflow rules

- Rebuild with `tectonic -X compile main.tex` from `erdos-872/paper/`.
- One commit per gap. No batching.
- No amending, no force-pushing, no `--no-verify`.
- After all four commits, push with `git push origin HEAD`.
- Do NOT touch Appendix B's `\Cref{prop:wfour-certification}` — it exists and
  is correctly cited; the auditor flagged it as "not supplied" only because
  the audit dispatch included Section 7 only.

## Gap 1 (HIGH): Add the product-strip lemma and cite it from `\Cref{prop:queued-prime-rounding}`

The queued-prime-rounding proposition cites "the product-strip estimate
proved from `\Cref{lem:cell-reciprocal-mass}` above." That product-strip
estimate is NOT in the text. It is load-bearing: the cutoff-discrepancy
step of the bridge moment comparison depends on it at

\[
  \frac{n}{\lambda^r} < b_I \le n, \qquad b_I := \prod_{j \in I} b_j.
\]

Insert a new Lemma immediately after `\Cref{lem:cell-reciprocal-mass}`,
proving:

> **Lemma (Product-strip reciprocal-mass estimate).** Fix $H \ge 2$, fixed
> real $C > 1$, fixed real $c > 1$, and an integer $r \ge 1$. Then for all
> sufficiently large $n$,
> \[
>   \sum_{\substack{j_1 < \cdots < j_r \\ n/C < b_{j_1} \cdots b_{j_r} \le Cn}}
>   \frac{1}{b_{j_1} \cdots b_{j_r}}
>   = O_{H, C, c, r}\!\left(\frac{1}{\log n}\right).
> \]

Proof skeleton to write out:

- In logarithmic coordinates, the region $\{n/C < x_1 x_2 \cdots x_r \le Cn\}$
  is a strip of width $O_{C,c}(1)$ cell-widths around the hyperplane
  $y_1 + \cdots + y_r = \log n$, where a "cell" is a logarithmic interval
  $[\log Y, \log(cY))$ of length $\log c$.
- There are $O_H(\log n)$ possible cells in each coordinate (corresponding
  to the bins in the interval $(1, n]$).
- Once any $r-1$ cell indices are chosen, the constraint
  $n/C < x_1 \cdots x_r \le Cn$ pins the last cell index to a range of
  $O_{C,c,r}(1)$ possibilities. Hence the number of relevant $r$-cell
  patterns is $O_{H,C,c,r}((\log n)^{r-1})$.
- By `\Cref{lem:cell-reciprocal-mass}`, each cell has reciprocal mass
  $O_{H,c}(1/\log n)$, so each $r$-cell product pattern has reciprocal
  mass $O_{H,c,r}((\log n)^{-r})$.
- Product: $O_{H,C,c,r}((\log n)^{r-1}) \cdot O_{H,c,r}((\log n)^{-r}) =
  O_{H,C,c,r}(1/\log n)$.

Then replace the citation "By the product-strip estimate proved from
`\Cref{lem:cell-reciprocal-mass}`" in the queued-prime-rounding proof with
a direct reference to the new lemma.

Commit message: `Paper: prove the product-strip reciprocal-mass estimate inline (Section 7)`.

## Gap 2 (HIGH): Promote the queue-clearing argument to a full Hall-suffix verification

The current queue-clearing step proves only the cumulative inequality

\[
  f_h + \sum_{k=0}^{s-1} d_k \le \sum_{\ell=0}^{s} P_\ell.
\]

That bounds total supply by total demand but does not verify the release
constraints of the matching. Genuine demand from bin $I_k$ must use a prime
bin with index $\ge k+1$ (because primes in bin $k$ may be smaller than some
$b_j \in I_k$).

Replace with a full Hall-suffix verification. For every $1 \le t \le s$,

\[
  \sum_{\ell = t}^{s} P_\ell \ge \sum_{k = t-1}^{s-1} d_k,
\]

and for $t = 0$,

\[
  \sum_{\ell = 0}^{s} P_\ell \ge f_h + \sum_{k = 0}^{s-1} d_k.
\]

Proof to write out, using the auditor's asymptotics verbatim:

\[
  \sum_{\ell = t}^{s} P_\ell
  \sim \frac{A(a^{s+1} - a^t)}{\log A}
  = \frac{aA(a^s - a^{t-1})}{\log A}, \qquad t \ge 1,
\]

while

\[
  \sum_{k = t-1}^{s-1} d_k
  \lesssim \frac{A(a^s - a^{t-1})}{2 \log A}.
\]

The ratio of supply to demand is therefore $\ge 2a - O(\eta)$ on every
suffix with $t \ge 1$. Since $a > 1$, any sufficiently small $\eta > 0$
gives strict inequality $\sum P_\ell \ge (1 + \varepsilon) \sum d_k$ for
some $\varepsilon > 0$, uniformly in $t \ge 1$.

For $t = 0$, the slack is the same after absorbing the flat atom $f_h$ into
the prime-bin-$0$ supply; the current cumulative inequality becomes exactly
the Hall condition at $t = 0$.

Include a remark that, by Hall's theorem on bipartite matchings with
release constraints (or a direct greedy argument using the oldest
unassigned demand), the suffix inequalities imply the existence of the
desired assignment.

Commit message: `Paper: add Hall-suffix verification to the queue-clearing matching (Section 7)`.

## Gap 3 (LOW): State the "1 is not a legal move" convention in the prefix-existence lemma

The current `\Cref{lem:prefix-existence}` argues that each prior move
$x \le n$ kills at most one odd prime $p > \sqrt{n}$. This is false if
$x = 1$, since $1 \mid p$ for every prime $p$. The paper clearly treats
the game as played on $\{2, 3, \ldots, n\}$ throughout, so $1$ is not a
legal move by convention, but the prefix-existence lemma should say so
explicitly.

Either:

(a) Add a short sentence at the start of the lemma's proof, e.g. "Since
the board is $\{2, 3, \ldots, n\}$, no move equals $1$, and every prior
move $x \ge 2$ ..." — or

(b) Cite the notation section (`\Cref{sec:notation}`) where the game
board is defined.

Either is acceptable; (a) is preferable because it makes the lemma
self-contained.

Commit message: `Paper: make "1 is not a legal move" convention explicit in prefix-existence lemma`.

## Gap 4 (LOW-MEDIUM): Enumerate every validity threshold in the diagonalization proposition

The current `\Cref{prop:prime-bridge-diagonalization}` chooses $N_m$
recursively to make "all estimates used above" hold with stated
tolerances. The auditor wants this list made explicit.

Rewrite the list of side conditions on $N_m$ as an explicit enumerated
sub-list, including at least all of:

1. Prefix-existence holds up to index $K$ (from `\Cref{lem:prefix-existence}`).
2. Local-density error $\xi_{H_m}(n) \le 1/m$ (from `\Cref{prop:local-density}`).
3. Envelope moment error $|T_r^{(b^{(H_m)})}(n) - J_r^{(H_m)}| \le 1/(4m)$
   for $1 \le r \le 4$ (from `\Cref{prop:envelope-inversion}`).
4. Bridge moment error $|T_r^{(p^{(H_m)})}(n) - T_r^{(b^{(H_m)})}(n)|
   \le 1/(2m)$ for $1 \le r \le 4$ (from `\Cref{prop:queued-prime-rounding}`).
5. Cell-reciprocal-mass bound from `\Cref{lem:cell-reciprocal-mass}` with
   uniform constant within $1/m$.
6. Product-strip reciprocal-mass bound from the new lemma of Gap 1 with
   uniform constant within $1/m$.
7. Queue-clearing Hall inequalities from Gap 2 hold with the $\eta_m$
   chosen for $\lambda_m$ and $a_m$.
8. Exceptional-index reciprocal mass bound $\sum_{j \in E} 1/b_j \le
   C/\log n$ for the constant $C$ absorbed into the $o_H(1)$ of the
   bridge comparison.
9. Fixed-ratio PNT estimates in the queue construction within tolerance
   $1/m$.
10. Smallest genuine scale $n^{\alpha_{H_m - 1}} = n^{1/H_m + \tau_{H_m}}
    \ge m$.

The proposition body should read something like "Choose $N_m$ recursively
increasing so that for all $n \ge N_m$, conditions (1)-(10) above hold."
This absorbs the auditor's concern about the dependency chain being
implicit.

Commit message: `Paper: enumerate all N_m validity thresholds in diagonalization proposition`.

## Final self-audit

After the four commits land and the paper recompiles cleanly, write a
short self-audit report (under 250 words) reviewing each of the four
fixes against the original auditor's specifications:

1. **Gap 1 (product-strip lemma).** Did you insert the lemma and prove
   it via the logarithmic-cell cell-count argument? Does the bridge
   proposition now reference the new lemma instead of the missing
   citation? Did you correctly handle flat atoms and the top atom inside
   the proof of the new lemma (the cell-reciprocal-mass lemma already
   covers them, but the product-strip proof should still acknowledge
   this)?

2. **Gap 2 (Hall-suffix).** Did you replace the cumulative inequality
   with the full $t$-indexed suffix family? Did you verify the asymptotic
   slack is $\ge 2a - O(\eta) > 1$ uniformly in $t$, using Pro's exact
   formulas? Did you mention Hall's theorem or give a greedy-invariant
   argument for why suffix Hall implies matching existence?

3. **Gap 3 (convention about 1).** Did you state the convention inline,
   and is the prefix-existence proof now self-contained without needing
   the reader to consult the game-setup section?

4. **Gap 4 (threshold list).** Did you list every side condition the
   diagonalization depends on, including conditions (1)-(10) above or
   their equivalents? Is it clear that "all estimates used above" is no
   longer invoked as a black box?

If any fix is only partial, flag it precisely. Do not paper over.

Also flag any NEW issues you noticed while writing — e.g., a dependency
that is not yet proved, a notation clash, or a step where the fix
introduced an inconsistency with earlier text. A short list is more
useful than a clean bill of health if the bill is earned by glossing.
