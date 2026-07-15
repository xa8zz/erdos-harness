---
id: R163-sc-oversized-y-vacuity
type: research
date: 2026-07-15
intent: >
  Determine whether the shadow-closed uniform preparation capacity inequality
  (SC) — for every fixed alpha>0 there exists C_alpha such that, for some
  uniformly chosen Y_n to infinity, every realized shadow-closed bad interval
  satisfies sum_{t: g_t >= alpha n} nu_{Y_n}(g_t) <= C_alpha E + o(n log log Y_n)
  — holds under its literal quantifiers, and whether a proof of it establishes
  second-shell clearing.
predecessors: [R161-downward-shadow-laundering]
prompt: erdos-872/prompts/researcher-R163-shadow-closed-capacity-sc.md
action:
  kind: extends
  target: R161-downward-shadow-laundering
claim: >
  (SC) as literally quantified is true but vacuous, via a parameter-level
  oversized-Y normalization escape. Choosing the deterministic,
  strategy-independent cutoff Y_n = exp(exp((log n)^2)) gives log log Y_n =
  (log n)^2, while for every integer m <= n, omega(m) <= log_2 n (since
  2^omega(m) <= prod_{p|m} p <= m <= n) and nu_Y(m) <= omega(m) for every Y;
  since greedy roots g_t are distinct integers in {2,...,n}, uniformly over
  every Prolonger strategy, tie-break, reply shape, and shadow history,
  sum_{t: g_t>=alpha n} nu_{Y_n}(g_t) <= n log_2 n = o(n(log n)^2) =
  o(n log log Y_n); taking C_alpha=0 proves the displayed inequality with
  explicit remainder R_n = n log_2 n satisfying sup over all realized
  intervals of R_n/(n log log Y_n) -> 0, using no shadow closure, chronology,
  or degree ledger. This does not prove second-shell clearing: every root
  satisfies g_t <= n/4, so nu_Y(g_t) = nu_{n/4}(g_t) once Y >= n/4 — the left
  side saturates while log log Y_n keeps growing unboundedly; the
  Turan-Kubilius demand step requires sum_g nu_{Y_n}(g) >> n log log Y_n,
  which is impossible for this Y_n since the true effective mean is governed
  by sum_{p <= min(Y,n)} 1/p, not log log Y, once Y>n. Two equivalent exact
  repairs: (Repair A, effective-cutoff range) require Y_n -> infinity with
  Y_n <= n/4 for all sufficiently large n (e.g. Y_n <= exp(sqrt(log log n))),
  plus a uniform frozen-entry condition Y_n^2 a_n = o(n log log Y_n) where
  a_n = sup_sigma |A_1(sigma)| = o(n) (the stronger Y_n^2 a_n = o(n)
  suffices); (Repair B, normalize by effective cutoff) set Z_n =
  min{Y_n, n/4}; since no root g_t <= n/4 has a prime divisor exceeding n/4,
  nu_{Y_n}(g_t) = nu_{Z_n}(g_t), giving the reformulated statement
  sum_{t: g_t>=alpha n} nu_{Z_n}(g_t) <= C_alpha E + o(n log log Z_n) with
  Z_n -> infinity, or its canonical prime-harmonic form using Lambda_n =
  sum_{p<=Z_n} 1/p in place of log log Z_n (statement SC*). The repaired
  assertion must additionally fix quantifier order via an explicit uniform
  remainder: sup over all realized bad intervals I in the admissible class
  (activation data and tie-break fixed in advance) of the positive part of
  [sum_{t: g_t>=alpha n} nu_{Z_n}(g_t) - C_alpha E(I)] divided by
  n log log Z_n tends to 0 — fix alpha, then C_alpha and deterministic Z_n,
  then quantify over all realized Prolonger trajectories, then take one
  uniform asymptotic remainder. Scope: the literal (SC) proof is
  shell-independent only vacuously (universal bound omega(g) <= log_2 n plus
  oversized normalization) and gives neither meaningful second-shell
  clearing nor depth-J uniformity; the repaired (SC*) with Repair A or B,
  the frozen-entry condition, and the explicit uniform remainder is the
  substantive cross-reply target and remains unproven.
implications:
  - The literal (SC) as dispatched is a dead end for closing second-shell
    survival; any future dispatch must state the repaired (SC*) — with
    Z_n = min(Y_n, n/4) or the Lambda_n prime-harmonic normalization, the
    Y_n^2 a_n frozen-entry condition, and the explicit sup-remainder —
    as the object to prove or refute, not the literal displayed form.
  - The Turan-Kubilius contradiction step establishing sufficiency is only
    valid once the repaired (SC*) is established; it does not follow from
    the literal (SC) proved here.
  - This adds a twenty-fifth catalogued degenerate-collapse family
    (oversized-Y normalization escape) alongside the existing
    parameter-level vacuity catalogue.
  - No cross-scale, cross-reply correlation argument exploiting shadow
    closure was attempted or evaluated against (SC*) in this round; that
    remains fully open.
confidence_at_time: medium
strategy_dependence: independent
---

# Verdict

\[
\boxed{\text{The displayed statement (SC) is true, but for a parameter-level vacuity.}}
\]

More precisely, the unrestricted existential choice of \(Y_n\to\infty\) allows the normalizing quantity \(\log\log Y_n\) to grow long after the statistic \(\nu_{Y_n}(g)\) has saturated. With an oversized deterministic cutoff, (SC) holds uniformly with

\[
C_\alpha=0
\]

for every \(\alpha>0\), without using shadow closure, chronology, the degree ledger, or even the fact that the interval is realized.

Consequently, the assertion that the displayed (SC) implies second-shell clearing is not valid under the literal quantifiers. The Turán–Kubilius demand calculation in Attachment M implicitly requires an effective cutoff such as \(Y_n\le n/4\), or an equivalent normalization by \(\min\{Y_n,n/4\}\).

This is an unclosed instance of the catalogued **parameter-level vacuity**: an oversized-\(Y\) normalization escape.

---

## 1. Uniform proof of the literal inequality

For an integer \(m\), let \(\omega(m)\) denote its number of distinct prime divisors. For every \(m\le n\),

\[
2^{\omega(m)}
\le
\prod_{p\mid m}p
\le m\le n,
\]

and therefore

\[
\omega(m)\le \log_2 n.
\tag{1}
\]

For every cutoff \(Y\),

\[
\nu_Y(m)\le \omega(m),
\tag{2}
\]

because \(\nu_Y\) counts only some of the distinct prime divisors of \(m\), and then possibly removes the release prime.

Now consider any realized interval whatsoever. Its greedy roots \(g_t\) are distinct integers in \(\{2,\ldots,n\}\). Hence, uniformly over every Prolonger strategy, every tie-break, every reply shape, and every shadow history,

\[
\begin{aligned}
\sum_{t:g_t\ge\alpha n}\nu_Y(g_t)
&\le
\sum_{t:g_t\ge\alpha n}\omega(g_t)\\
&\le
n\log_2 n.
\end{aligned}
\tag{3}
\]

Choose, before Prolonger is quantified,

\[
Y_n
=
\exp\!\left(\exp\!\left((\log n)^2\right)\right).
\tag{4}
\]

This is deterministic, strategy-independent, and satisfies \(Y_n\to\infty\). Moreover,

\[
\log\log Y_n=(\log n)^2.
\tag{5}
\]

Consequently,

\[
\frac{n\log_2 n}
     {n\log\log Y_n}
=
\frac{\log n/\log 2}{(\log n)^2}
=
\frac{1}{(\log 2)\log n}
\longrightarrow0.
\tag{6}
\]

Thus (3) gives, uniformly over every realized interval,

\[
\sum_{t:g_t\ge\alpha n}\nu_{Y_n}(g_t)
=
o\!\left(n\log\log Y_n\right).
\tag{7}
\]

Taking

\[
C_\alpha=0
\]

proves exactly the displayed inequality:

\[
\boxed{
\sum_{t:g_t\ge\alpha n}\nu_{Y_n}(g_t)
\le
C_\alpha E
+
o\!\left(n\log\log Y_n\right).
}
\]

The remainder can be made completely explicit and uniform:

\[
R_n=n\log_2 n,
\qquad
\sup_{\mathcal I}
\frac{R_n}{n\log\log Y_n}\longrightarrow0,
\]

where the supremum ranges over all possible realized intervals \(\mathcal I\).

No trajectory construction is needed, because this is a proof rather than a refutation.

---

## 2. Why this does not prove second-shell clearing

The defect is that \(\nu_Y(g)\) stops changing once \(Y\) exceeds \(g\), whereas the displayed normalization \(\log\log Y\) continues growing without bound.

For all roots under consideration,

\[
g_t\le \frac n4.
\]

Hence whenever \(Y\ge n/4\),

\[
\nu_Y(g_t)=\nu_{n/4}(g_t).
\tag{8}
\]

The left side of (SC) has therefore saturated. Its denominator has not.

The same defect appears exactly in the Turán–Kubilius step used in Attachment M. The relevant first moment is not

\[
\sum_{p\le Y}\frac1p
\]

when \(Y\gg n\). For integers \(m\le n\),

\[
\sum_{m\le n}\omega_Y(m)
=
\sum_{p\le \min\{Y,n\}}
\left\lfloor\frac np\right\rfloor.
\tag{9}
\]

Primes \(p>n\) divide no integer being counted. Thus the effective mean is controlled by

\[
\sum_{p\le\min\{Y,n\}}\frac1p,
\tag{10}
\]

not by \(\log\log Y\) when \(Y>n\).

For the choice (4),

\[
\log\log Y_n=(\log n)^2,
\]

but every root family, even the entire interval \([\alpha n,n/4]\), satisfies

\[
\sum_g\nu_{Y_n}(g)
\le n\log_2 n
=
o\!\left(n(\log n)^2\right).
\tag{11}
\]

Therefore the claimed demand estimate

\[
\sum_g\nu_{Y_n}(g)
\gg n\log\log Y_n
\]

is impossible for this \(Y_n\). The failure occurs before any shadow-capacity reasoning is reached.

In particular, the variance assertion centered at

\[
\lambda_Y=\sum_{p\le Y}\frac1p
\]

cannot be used unchanged once \(Y\) is larger than the integers in the interval. The correct center must use the effective cutoff.

---

## 3. Exact repair

There are two equivalent clean repairs.

### Repair A: impose an effective-cutoff range

Require the uniformly chosen cutoff to satisfy

\[
Y_n\to\infty,
\qquad
Y_n\le\frac n4
\tag{12}
\]

for all sufficiently large \(n\). In practice the intended argument wants a much slower cutoff, such as

\[
Y_n\le \exp\sqrt{\log\log n}.
\]

The activation term should also be required uniformly. If

\[
a_n=\sup_\sigma |A_1(\sigma)|=o(n)
\]

is the frozen entry-size bound, a suitable explicit condition is

\[
Y_n^2a_n
=
o\!\left(n\log\log Y_n\right).
\tag{13}
\]

The stronger condition \(Y_n^2a_n=o(n)\), used in Attachment M, also suffices.

### Repair B: normalize by the effective cutoff

Define

\[
Z_n=\min\left\{Y_n,\frac n4\right\}
\]

and formulate the inequality as

\[
\sum_{t:g_t\ge\alpha n}\nu_{Z_n}(g_t)
\le
C_\alpha E
+
o\!\left(n\log\log Z_n\right),
\qquad
Z_n\to\infty.
\tag{14}
\]

Since no root \(g_t\le n/4\) has a prime divisor larger than \(n/4\),

\[
\nu_{Y_n}(g_t)=\nu_{Z_n}(g_t),
\]

so this changes only the defective normalization.

An even more canonical version replaces \(\log\log Z_n\) by the prime-harmonic parameter

\[
\Lambda_n
=
\sum_{p\le Z_n}\frac1p.
\tag{15}
\]

Then the repaired statement is

\[
\sum_{t:g_t\ge\alpha n}\nu_{Z_n}(g_t)
\le
C_\alpha E+o(n\Lambda_n).
\tag{SC\(^\ast\)}
\]

Here \(\Lambda_n\to\infty\), and the Turán–Kubilius lower-demand calculation is calibrated to exactly the same effective prime range as the left side.

---

## 4. The uniform remainder must be stated explicitly

To exclude strategy-dependent or cohort-dependent \(o\)-terms, the repaired assertion should say

\[
\boxed{
\sup_{\mathcal I\in\mathfrak B_n(\alpha)}
\frac{
\left(
\sum_{t:g_t\ge\alpha n}\nu_{Z_n}(g_t)
-
C_\alpha E(\mathcal I)
\right)_+
}{
n\log\log Z_n
}
\longrightarrow0,
}
\tag{16}
\]

where \(\mathfrak B_n(\alpha)\) is the set of all realized bad intervals for the activation data and tie-break fixed in advance.

This makes the order of quantifiers unambiguous:

1. fix \(\alpha\);
2. choose \(C_\alpha\) and the deterministic sequence \(Z_n\);
3. quantify over all realized Prolonger trajectories;
4. take one uniform asymptotic remainder.

With (12) or (14), (13), and (16), the Turán–Kubilius contradiction in Attachment M is valid.

---

## 5. Scope of the result

The literal proof is shell-independent only in a vacuous sense: it uses the universal bound \(\omega(g)\le\log_2 n\) and an oversized normalization. It therefore gives neither meaningful second-shell clearing nor depth-\(J\) uniformity.

The substantive status is:

\[
\boxed{
\begin{array}{l}
\textbf{Literal displayed (SC): true with }C_\alpha=0\textbf{ by oversized-}Y
\textbf{ normalization escape}.\\[1mm]
\textbf{Claimed implication to second-shell clearing: invalid under those literal quantifiers}.\\[1mm]
\textbf{Exact repair: cap the effective cutoff, normalize by }Z_n=\min(Y_n,n/4),\\
\textbf{control the frozen-entry term uniformly, and require a uniform }o\textbf{-remainder}.\\[1mm]
\textbf{The repaired shadow-capacity assertion }(\mathrm{SC}^\ast)\textbf{ is the substantive}\\
\textbf{cross-reply problem; the argument above proves no depth-}J\textbf{ version of it.}
\end{array}}
\]

Thus the exact statement posed is resolved, but not in the intended way: it contains a cutoff-normalization mismatch that makes its capacity content disappear.