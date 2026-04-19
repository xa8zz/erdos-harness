# R35 follow-up — lower-defect star-breaker probe in the one-cylinder arithmetic toy

## Status

This does **not** close the missing dynamic amortization. It is a focused probe of
the simplest arithmetic model that still contains the key phenomenon:

- a scored top-facet star,
- residual same-rank targets that would be fully closed in the plain top-facet
  model,
- and **lower-defect certificates** that remain legal because the scored witness
  replaces the missing prime.

The outcome is encouraging but not decisive:

> In this one-cylinder toy, max-degree `sigma` immediately prefers singleton or
> very low-defect certificates, and the useful closed residual family stays tiny
> on the tested grid.

So the abstract `H^{(h)}` star-forest pathology does **not** survive unchanged
once the lower-defect divisibility structure is restored, even in the most
star-shaped arithmetic cylinder.

## 1. The toy model

Fix `h >= 3` and a set `Y` of size `M`, together with a center symbol `0`.

- **Scorable star targets**:
  \[
  \mathcal F_\star = \{\{0\}\cup D : D \in \tbinom{Y}{h-1}\}.
  \]
- **Residual targets**:
  \[
  \mathcal R = \tbinom{Y}{h}.
  \]
- **Certificates**: all nonempty proper subsets of members of
  `\mathcal F_\star \cup \mathcal R`.

Interpretation in the actual divisibility model:

- `0` is the center prime `r`,
- `Y` is the short prime block,
- scored targets are `b r A_D`,
- residual targets are `b A_S`,
- and a certificate is any proper divisor pattern supported on the same small
  prime configuration.

This is exactly the minimal arithmetic toy where the R32 simplex-star closure
exists statically, but certificates containing the missing prime still remain
available after the witness `r`-star is scored.

## 2. What was simulated

I ran a greedy Prolonger against the repo's natural max-degree Shortener rule in
this toy:

- Prolonger may score only star targets `\{0\}\cup D`.
- After each score, Shortener claims a legal certificate of maximum current live
  target degree, with tie-breaks favoring smaller certificates, then
  lexicographically.
- The diagnostic is the current number of **useful closed residuals**:
  residual `h`-sets still unhit by Shortener, all of whose proper certificates
  have already been captured either by scored star targets or by Shortener.

This is the exact analogue of the quantity that would explode in the plain
top-facet star cascade.

## 3. Small-grid results

For a greedy closure-seeking Prolonger:

| `h` | `M` | Pro rounds | max useful residuals after `sigma` |
|---|---:|---:|---:|
| 3 | 5 | 4 | 1 |
| 3 | 6 | 3 | 1 |
| 3 | 7 | 5 | 2 |
| 3 | 8 | 7 | 2 |
| 4 | 6 | 4 | 0 |
| 4 | 7 | 6 | 1 |
| 4 | 8 | 9 | 0 |
| 5 | 7 | 4 | 0 |
| 5 | 8 | 8 | 0 |

The first several `sigma` moves were overwhelmingly **lower-defect**:

| `h,M` | first `sigma` certificate sizes |
|---|---|
| `(3,7)` | `[1, 1, 1, 2, 2]` |
| `(4,7)` | `[1, 2, 2, 2, 2]` |
| `(4,8)` | `[1, 1, 2, 2, 3]` |
| `(5,8)` | `[1, 2, 2, 3, 3]` |

So in this toy, the online max-degree rule does **not** behave like the pure
top-facet game. It immediately uses singleton/pair/triple certificates to break
the star.

## 4. Why this matters

The abstract star-forest countermodel from the R35 audit showed:

- top-facet max-degree alone is insufficient in the abstract `H^{(h)}` model;
- the missing escape, if it exists, must come from lower-defect certificates.

This one-cylinder toy is the cleanest place where such a lower-defect escape
could appear. It does appear there numerically.

In particular, the dangerous static closure
\[
\mathcal R = \tbinom{Y}{h}
\]
under the scored star
\[
\mathcal F_\star = \{\{0\}\cup D : D \in \tbinom{Y}{h-1}\}
\]
does **not** seem dynamically reachable under max-degree play at anything like
the abstract star-forest rate.

## 5. What this does NOT prove

This toy is still far short of the real theorem.

It does **not** prove the required online inequality
\[
\Delta_{\mathrm{useful}}(t)
\ll
\frac{L}{h} d_t(x_t) + \Delta_{\mathrm{high}}(t).
\]

Specifically, the toy omits:

- multi-cell product stars;
- the central weighted mass `\mu`, not just cardinality;
- large-prime fibre averaging;
- and exact minimax Prolonger play (the current run used greedy closure-seeking
  Prolonger, not exact optimal play).

So the correct conclusion is only:

> lower-defect certificates genuinely matter in the arithmetic model, and the
> simplest star-cylinder does not exhibit the abstract max-degree failure.

## 6. Best current interpretation

The dynamic gap remains open, but the evidence is now split in a useful way:

- **Against closure:** the abstract star-forest still blocks any proof that uses
  only top-facet max-degree.
- **For closure:** once the arithmetic lower-defect structure is restored, even
  the cleanest simplex-star cylinder no longer behaves like the abstract
  counterexample.

That is consistent with Pro A's formulation:

> the real missing theorem is a quantitative lower-defect star-breaker, not a
> top-facet theorem.

So the honest refined state is:

\[
\boxed{
\text{Static R35 dyadic-window estimate: plausible / likely correct.}
}
\]
\[
\boxed{
\text{Dynamic online amortization: still open, but the arithmetic toy model is
evidence for a genuine lower-defect rescue.}
}
\]
