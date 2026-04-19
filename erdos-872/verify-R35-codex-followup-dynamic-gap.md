# Codex follow-up on the R35 dynamic gap

## Outcome

The R35 closure candidate still does **not** prove
\[
L(n) \ll \frac{n}{\log\log\log n}.
\]

What survives is the **static state estimate**:
\[
\mu(\operatorname{Cl}_h)
\ll
\frac{h}{\log h}\,B_h^{\mathrm{stolen}}
\;+\;
\frac{N_h}{\log h},
\]
provided `B_h^{stolen}` is interpreted correctly. The remaining gap is still the
online amortization of the useful stolen-boundary term.

## 1. Correct normalization of `B_h^{stolen}`

There are three nearby quantities that were conflated in the closure note:

1. **Scored target mass**
   \[
   M_h^{\mathrm{score}} := \sum_{U \in F_{\mathrm{useful}}} w(U).
   \]

2. **Stolen-top-facet witness mass**
   \[
   B_{h,\mathrm{top}}^{\mathrm{stolen}}
   := \sum_{T \in \mathcal T_{\mathrm{useful}}} w(U(T)),
   \]
   where each useful stolen top facet `T` is assigned one scored witness `U(T)`.

3. **Boundary mass of scored targets**
   \[
   B_{h,\partial}^{\mathrm{stolen}}
   := \sum_{U \in F_{\mathrm{useful}}} h\,w(U).
   \]

The thick-case charging argument proves
\[
\mu(\operatorname{Cl}_h^{\mathrm{thick}})
\ll
L \cdot B_{h,\mathrm{top}}^{\mathrm{stolen}}.
\]
Since a scored target `U` can witness at most its `h` top facets,
\[
B_{h,\mathrm{top}}^{\mathrm{stolen}}
\le
B_{h,\partial}^{\mathrm{stolen}}
=
h\,M_h^{\mathrm{score}}.
\]

So the R35 argument only yields
\[
\mu(\operatorname{Cl}_h^{\mathrm{thick}})
\ll
L \cdot B_{h,\mathrm{top}}^{\mathrm{stolen}}
\ll
Lh \cdot M_h^{\mathrm{score}}.
\]

Any translation to a rank-`h` bound must therefore control either:

- `B_{h,top}^{stolen}` directly at scale `N_h / h`, or
- `M_h^{score}` at the stronger scale `N_h / h^2`.

This is exactly where the hidden online factor lives.

## 2. What Pro A's online domination does and does not give

Pro A proved only a **degree-weighted** domination:
\[
\sum_t
\sum_{\substack{u \subsetneq S_t\\|S_t\setminus u|=k}}
d_t'(u)
\le
\binom{h}{k} N_h.
\]

This does **not** imply a cardinality bound on useful stolen top facets.
To deduce
\[
B_{h,\mathrm{top}}^{\mathrm{stolen}} \ll \frac{N_h}{h}
\]
one still needs an anti-concentration statement of the form:

> useful stolen witnesses carry average live degree `>> h`, or
> low-degree top-facet witnesses force high-degree lower-defect exposure that
> `sigma` claims before the same local window can be reused many times.

That is the unresolved "lower-defect star-breaker."

## 3. Structural issue in the locality claim

The closure note informally treated a stolen top facet `bA_{S \setminus {p}}`
as if it were always stolen by a scored move of the form
\[
bA_{S \setminus \{p\}} q
\]
with `q` prime and `q/p in (1/2,2)`.

This is false in the full divisibility game as stated. A top facet can be stolen
by an incomparable upper-half move that is **not** a prime replacement.

Concrete example:

- `n = 600`
- target `t = 330 = 11 * 2 * 3 * 5`
- top facet `66`
- upper-half move `u = 396 = 11 * 2 * 3 * 6`

Then `66 | 396`, both `330` and `396` lie in `(300, 600]`, and `330,396` are
incomparable. But `396 / 66 = 6`, not a prime. So the factor-2 window heuristic
is a **state-local compatibility observation**, not yet a theorem that every
useful witness is parametrized by one prime replacement.

This does not kill the static estimate by itself, but it means the arithmetic
locality statement must be formulated more carefully.

## 4. Small-`h` proxy experiment

Using the complete top-facet model in `phase4/transversal_small_h.py`, I tested
`sigma` against an adversarial Prolonger policy that chooses each scored edge to
maximize the number of unavailable top facets still lying in the unhit shadow
after `sigma`'s immediate reply.

This is **not** the divisibility model, so it is evidence only. But it directly
tests the shape of the desired online normalization.

Representative results:

- `h = 4, N = 10`: `N_h / h = 52.5`, while the maximum top-layer
  `unavailable_in_shadow` reached `92`.
- `h = 4, N = 11`: `N_h / h = 82.5`, while the maximum top-layer
  `unavailable_in_shadow` reached `128`.
- `h = 5, N = 10`: `N_h / h = 50.4`, while the maximum top-layer
  `unavailable_in_shadow` reached `166`.

So even in the repo's own small-`h` proxy, `sigma` does **not** by itself keep
captured top-shadow cardinality at the `N_h / h` scale. This is consistent with
Pro A's star-forest critique: top-facet max-degree control alone is too weak.

## 5. Revised claim

The honest R35 status is:

\[
\boxed{
\begin{aligned}
&\text{Static dyadic-window state estimate: plausible / likely correct.}\\
&\text{Dynamic useful-boundary amortization: still open.}\\
&\text{Therefore } L(n)=o(n) \text{ remains conditional on the missing online bound.}
\end{aligned}
}
\]

The remaining theorem is not a bookkeeping nuisance. It is the load-bearing
online statement.
