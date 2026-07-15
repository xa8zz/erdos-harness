---
id: R164-sc-star-ambient-laundering
type: research
date: 2026-07-15
intent: >
  Determine whether the repaired shadow-closed capacity inequality (SC*),
  normalized by the ambient scale n*Lambda_n with cutoff Z_n <= n/4, is a
  genuine independent cross-scale, cross-reply correlation statement, or
  whether it collapses to a restatement of second-shell no-linear-tail
  clearing.
predecessors: [R163-sc-oversized-y-vacuity]
prompt: erdos-872/prompts/researcher-R164-sc-star-repaired.md
action:
  kind: extends
  target: R163-sc-oversized-y-vacuity
claim: >
  (SC*) as quantified (fix alpha; then C_alpha and a deterministic
  Z_n -> infinity with Z_n <= n/4; then quantify over all realized
  trajectories; then one uniform remainder over n*Lambda_n) suffers a
  twenty-sixth quantifier-level collapse, ambient-denominator laundering
  (equivalently: sublinear-cohort absorption). Mechanism: for any
  0 < alpha < 1/4 and any G contained in [alpha*n, n/4] with |G| = M,
  uniform Turan-Kubilius plus Cauchy-Schwarz gives the subset upper bound
  sum_{g in G} omega_Z(g) <= M*Lambda_Z + O_alpha(M) + O_alpha(sqrt(M*n*Lambda_Z))
  (Lemma 1). Consequently, if the macroscopic service-root cohort size
  M_alpha(I) is uniformly o(n) over realized intervals I, then dividing by
  n*Lambda_n forces the entire small-prime preparation demand into the
  permitted o(n*Lambda_n) remainder, so (SC*)(alpha) holds with C_alpha = 0
  for every admissible deterministic Z_n, without invoking the degree
  ledger, first blockers, release times, coatom preparation, downward-shadow
  closure, reply-packet lcms, primitiveness of replies, or the four-layer
  causal chronology (Proposition 2). Conversely, a subset lower bound
  (Lemma 3) shows that for G contained in [alpha*n, n/4] with |G| >= delta*n,
  uniformly over deterministic Z_n -> infinity with Z_n <= n/4,
  sum_{g in G} omega_{Z_n}(g) >= (delta/2 - o(1))*n*Lambda_n; after removing
  o(n) initially-minimal roots and one release prime per remaining root this
  sharpens to a bound of (delta/3 - o(1))*n*Lambda_n on the realized demand
  S_{alpha,Z_n}(I), so on any positive-density macroscopic cohort no fixed
  C_alpha and no deterministic Z_n can keep the uniform remainder from
  n*Lambda_n bounded away from zero; every positive-density cohort
  automatically violates (SC*) for every admissible cutoff and every fixed
  C_alpha (Section 4). Combining both directions gives the exact
  characterization (Theorem 4): for each fixed 0 < alpha < 1/4,
  (SC*)(alpha) holds if and only if sup_I M_alpha(I)/n -> 0, where the
  intervals and supremum use activation data and tie-break frozen in
  advance. Since the accepted fresh-root theorem converts a linear
  second-shell tail of size T >= c*n into at least (c/2)*n - o(n) distinct
  service roots in [(c/2)*n, n/4], and second-shell clearing conversely
  gives a uniform o(n) bound on total active turns hence on every
  M_alpha(I), Theorem 4 yields the full equivalence: (SC*)(alpha) for every
  fixed alpha > 0 holds if and only if there is no admissible linear
  capped second-shell tail, if and only if FSC(2, eta) holds in its
  repaired, uniformly activated form (Section 6). The exact logical upshot
  is that (SC*), under the ambient n*Lambda_n normalization and the stated
  quantifier order, is NOT an independent cross-scale, cross-reply
  correlation theorem; its bare truth value is exactly the truth value of
  repaired second-shell clearing, so the intermediate-target strategy of
  proving (SC*) as a standalone stepping stone toward a nonadditive
  shadow-capacity mechanism is circular as literally stated. The proposed
  repair replaces the ambient denominator with a relative remainder scaled
  by the realized ledger E(I)*Lambda_n plus a frozen baseline budget
  B_{alpha,n} = Z_n^2*a_n + mu_n(alpha)*pi(Z_n) + 1 (with mu_n(alpha) the
  sup over entry positions of initially-available roots in
  [alpha*n, n/4], required to satisfy mu_n(alpha)*pi(Z_n) = o(n*Lambda_n)):
  sup_I [(S_{alpha,Z_n}(I) - C_alpha*E(I) - K_alpha*B_{alpha,n})_+] /
  [(E(I)+1)*Lambda_n + B_{alpha,n}] -> 0, denoted (SC^rel). Second-shell
  clearing alone (M_alpha = o(n)) no longer suffices to prove (SC^rel):
  Lemma 1 only gives S_{alpha,Z_n} = o(n*Lambda_n), not the required
  o(E(I)*Lambda_n) — a cohort of M = o(n) typical integers with E asymp M
  has demand of full order E*Lambda_Z, invisible after division by
  n*Lambda_Z but not after division by E*Lambda_Z — so the relative
  formulation still requires the originally promised chronological
  cross-reply correlation theorem. The ambient-denominator collapse is
  shown to persist verbatim at every fixed shell depth (uniform over the
  source of shadow blockers, since the Turan-Kubilius argument never
  examines them), but this does not constitute a depth-J packet-capacity
  proof: a relative statement at shell j requires source-shell labels on
  each shadow blocker, a frozen baseline budget including all
  previously-processed shells, constants C_{alpha,j} or C_{alpha,J}, and a
  remainder normalized by that shell's own realized E_j*Lambda_n — none of
  which the argument supplies.
implications:
  - Attacking the ambient-normalized (SC*) as an independent stepping-stone
    lemma is circular; any future dispatch must target either the relative
    form (SC^rel), normalized by E(I)*Lambda_n plus the frozen baseline
    budget B_{alpha,n}, or the second-shell no-linear-tail statement
    directly.
  - Any correlation-theorem attempt must produce a bound at the
    E(I)*Lambda_n scale, not the n*Lambda_n scale, since sublinear service
    cohorts satisfy the weaker o(n*Lambda_n) bound automatically via
    Turan-Kubilius regardless of chronology.
  - A genuine depth-J extension of (SC^rel) needs per-shell source labeling
    of shadow blockers, a cumulative frozen baseline over all
    previously-processed shells, and shell-indexed constants C_{alpha,j};
    none of this exists yet even though the ambient collapse itself is
    depth-uniform.
  - This is catalogued as the twenty-sixth degenerate-collapse family
    (ambient-denominator laundering / sublinear-cohort absorption) and must
    be checked against any future repaired intermediate statement.
confidence_at_time: medium
strategy_dependence: independent
---

# Verdict

\[
\boxed{\text{\((\mathrm{SC}^\ast)\) has another quantifier-level collapse.}}
\]

It is not an independent shadow-capacity theorem. With the stated ambient normalization \(n\Lambda_n\) and quantification only over realized trajectories, it is equivalent to the absence of a positive-density family of macroscopic service roots. By the accepted fresh-root theorem, that is equivalent to the repaired second-shell no-linear-tail assertion.

The new collapse is:

\[
\boxed{\textbf{ambient-denominator laundering}}
\]

or, more descriptively,

\[
\boxed{\textbf{sublinear-cohort absorption}.}
\]

If the macroscopic service-root cohort has size \(o(n)\), then its entire small-prime preparation demand is automatically \(o(n\Lambda_n)\), by Turán–Kubilius and Cauchy–Schwarz. No chronology, shadow closure, reply packet, degree ledger, or four-layer causal argument is needed.

Conversely, any positive-density macroscopic service-root cohort automatically violates \((\mathrm{SC}^\ast)\), for every admissible deterministic cutoff and every fixed \(C_\alpha\).

Thus, under the accepted second-shell machinery,

\[
\boxed{
\bigl[(\mathrm{SC}^\ast)(\alpha)\text{ for every }\alpha>0\bigr]
\iff
\text{no admissible linear second-shell tail}.
}
\tag{A}
\]

Consequently, the bare truth value of \((\mathrm{SC}^\ast)\) is exactly the truth value of the repaired second-shell clearing statement. The formulation does not isolate the promised cross-reply correlation theorem.

I prove this equivalence below and give a relative normalization that repairs the collapse.

---

# 1. Notation

Fix the activation data and the prefix-measurable tie-break. For a realized interval \(I\), put

\[
G_\alpha(I)
=
\{g_t:g_t\ge \alpha n\},
\qquad
M_\alpha(I)=|G_\alpha(I)|,
\]

and

\[
S_{\alpha,Z}(I)
=
\sum_{g_t\in G_\alpha(I)}\nu_Z(g_t).
\]

The roots \(g_t\) are distinct.

For released roots,

\[
\nu_Z(g)
=
\#\{p\le Z:p\mid g,\ p\ne q(g)\},
\]

where \(q(g)\) is the release prime. For an initially minimal root, it is enough to use the universal inequality

\[
\nu_Z(g)\le \omega_Z(g),
\]

where

\[
\omega_Z(m)=\#\{p\le Z:p\mid m\}.
\]

Let

\[
\Lambda_Z=\sum_{p\le Z}\frac1p.
\]

We always have \(\Lambda_Z\to\infty\) when \(Z\to\infty\).

---

# 2. A uniform Turán–Kubilius upper bound for arbitrary cohorts

The same Turán–Kubilius estimate used for the lower-demand argument also gives an upper bound for every subset of a fixed macroscopic interval.

## Lemma 1: subset upper bound

Fix \(0<\alpha<1/4\). Uniformly for \(2\le Z\le n/4\) and every set of distinct integers

\[
G\subseteq[\alpha n,n/4],
\]

of size \(M\),

\[
\boxed{
\sum_{g\in G}\omega_Z(g)
\le
M\Lambda_Z
+
O_\alpha(M)
+
O_\alpha\!\left(\sqrt{Mn\Lambda_Z}\right).
}
\tag{1}
\]

### Proof

On the fixed macroscopic interval \([\alpha n,n/4]\), Turán–Kubilius gives

\[
\sum_{\alpha n\le m\le n/4}
\left(\omega_Z(m)-\Lambda_Z\right)^2
=
O_\alpha(n\Lambda_Z).
\tag{2}
\]

A harmless \(O_\alpha(1)\) change in the center can be absorbed into the \(O_\alpha(M)\) term.

By Cauchy–Schwarz,

\[
\begin{aligned}
\sum_{g\in G}\omega_Z(g)
&=
M\Lambda_Z+
\sum_{g\in G}\bigl(\omega_Z(g)-\Lambda_Z\bigr)\\
&\le
M\Lambda_Z
+
\sqrt{M}
\left(
\sum_{\alpha n\le m\le n/4}
(\omega_Z(m)-\Lambda_Z)^2
\right)^{1/2}
+
O_\alpha(M),
\end{aligned}
\]

which is (1). ∎

Since \(\nu_Z(g)\le\omega_Z(g)\), the same upper bound holds for \(S_{\alpha,Z}\).

---

# 3. Every sublinear service cohort is absorbed by the global remainder

Suppose

\[
\theta_n(\alpha)
=
\sup_I\frac{M_\alpha(I)}n
\longrightarrow0,
\tag{3}
\]

where the supremum is over all realized intervals in the fixed admissible class.

Applying Lemma 1 with \(M=M_\alpha(I)\) gives

\[
S_{\alpha,Z_n}(I)
\le
M_\alpha(I)\Lambda_n
+
O_\alpha(M_\alpha(I))
+
O_\alpha\!\left(\sqrt{M_\alpha(I)n\Lambda_n}\right).
\]

After division by \(n\Lambda_n\),

\[
\frac{S_{\alpha,Z_n}(I)}{n\Lambda_n}
\le
\frac{M_\alpha(I)}n
+
O_\alpha\!\left(\frac{M_\alpha(I)}{n\Lambda_n}\right)
+
O_\alpha\!\left(
\sqrt{\frac{M_\alpha(I)}{n\Lambda_n}}
\right).
\]

Taking the supremum over \(I\),

\[
\boxed{
\sup_I
\frac{S_{\alpha,Z_n}(I)}{n\Lambda_n}
\le
\theta_n(\alpha)
+
O_\alpha\!\left(\frac{\theta_n(\alpha)}{\Lambda_n}\right)
+
O_\alpha\!\left(
\sqrt{\frac{\theta_n(\alpha)}{\Lambda_n}}
\right)
=o(1).
}
\tag{4}
\]

Therefore:

## Proposition 2

If the number of macroscopic service roots is uniformly \(o(n)\), then \((\mathrm{SC}^\ast)(\alpha)\) holds with

\[
\boxed{C_\alpha=0}
\]

for every admissible deterministic \(Z_n\to\infty\).

No use has been made of:

- the degree ledger;
- first blockers;
- release times;
- coatom preparation;
- downward-shadow closure;
- reply packet lcms;
- primitiveness of the replies;
- the four-layer causal chronology.

The whole demand is placed in the permitted \(o(n\Lambda_n)\) remainder.

This is ambient-denominator laundering.

---

# 4. A positive-density cohort always violates \((\mathrm{SC}^\ast)\)

The converse is equally automatic.

## Lemma 3: subset lower bound

Fix \(\delta>0\). Suppose

\[
G\subseteq[\alpha n,n/4],
\qquad
|G|\ge\delta n.
\]

Then, uniformly for every deterministic \(Z_n\to\infty\) with \(Z_n\le n/4\),

\[
\boxed{
\sum_{g\in G}\omega_{Z_n}(g)
\ge
\left(\frac{\delta}{2}-o(1)\right)n\Lambda_n.
}
\tag{5}
\]

### Proof

From (2), Chebyshev gives

\[
\#\left\{
m\in[\alpha n,n/4]:
\omega_{Z_n}(m)<\frac12\Lambda_n
\right\}
=
O_\alpha\!\left(\frac n{\Lambda_n}\right)
=
o(n).
\]

Thus all but \(o(n)\) members of \(G\) have at least \(\Lambda_n/2\) small prime divisors. ∎

At a sparse entry position, only \(o(n)\) of the service roots can be initially minimal. Remove them. Every remaining root has a release prime, and excluding that one prime loses at most one unit per root. Hence

\[
\begin{aligned}
S_{\alpha,Z_n}(I)
&\ge
\sum_{g\in G}\omega_{Z_n}(g)-|G|-o(n)\pi(Z_n)\\
&\ge
\left(\frac{\delta}{3}-o(1)\right)n\Lambda_n,
\end{aligned}
\tag{6}
\]

where the last form is also precisely the accepted demand estimate from Attachment M. The initially minimal contribution can alternatively be removed before applying the lower bound; only \(o(n)\) roots are lost.

Since

\[
E(I)\le \frac n4,
\]

for every fixed \(C_\alpha\),

\[
\frac{C_\alpha E(I)}{n\Lambda_n}
\le
\frac{C_\alpha}{4\Lambda_n}
=o(1).
\]

Consequently,

\[
\boxed{
\frac{
\bigl(
S_{\alpha,Z_n}(I)-C_\alpha E(I)
\bigr)_+
}{
n\Lambda_n
}
\ge
\frac{\delta}{3}-o(1).
}
\tag{7}
\]

Therefore no deterministic admissible choice of \(Z_n\) and no finite \(C_\alpha\) can make the uniform remainder tend to zero.

---

# 5. Exact characterization of \((\mathrm{SC}^\ast)(\alpha)\)

Combining (4) and (7) gives the exact statement.

## Theorem 4: cohort equivalence

For each fixed \(0<\alpha<1/4\),

\[
\boxed{
(\mathrm{SC}^\ast)(\alpha)
\iff
\sup_I
\frac{M_\alpha(I)}n
\longrightarrow0.
}
\tag{8}
\]

Here the intervals and the supremum use the activation data and tie-break frozen in advance.

### Proof

The implication from right to left is Proposition 2.

If the right side fails, there are \(\delta>0\), a subsequence \(n_k\), and realized intervals \(I_k\) such that

\[
M_\alpha(I_k)\ge\delta n_k.
\]

Equation (7) contradicts \((\mathrm{SC}^\ast)(\alpha)\) for every proposed \(C_\alpha,Z_n\). ∎

This is stronger than the already stated implication from \((\mathrm{SC}^\ast)\) to clearing: it identifies exactly what the inequality says.

---

# 6. Equivalence with the repaired second-shell no-tail statement

The accepted fresh-root theorem says that a \(T\ge cn\) tail produces, for

\[
\alpha=\frac c2,
\]

at least

\[
\frac c2n-o(n)
\]

distinct service roots in

\[
\left[\frac c2n,\frac n4\right].
\]

Thus failure of the repaired second-shell exclusion implies failure of \((\mathrm{SC}^\ast)(c/2)\).

Conversely, second-shell clearing gives a uniform \(o(n)\) bound on the total number of active turns, hence certainly on every \(M_\alpha(I)\). Theorem 4 then gives \((\mathrm{SC}^\ast)(\alpha)\) with \(C_\alpha=0\).

Therefore, under the four accepted equivalence conditions for the repaired second-shell statement,

\[
\boxed{
\begin{aligned}
&(\mathrm{SC}^\ast)(\alpha)
\text{ for every fixed }\alpha>0\\
&\qquad\Longleftrightarrow
\text{no linear capped second-shell tail}\\
&\qquad\Longleftrightarrow
\mathrm{FSC}(2,\eta)
\text{ in its repaired, uniformly activated form}.
\end{aligned}}
\tag{9}
\]

If “bad interval” is interpreted more narrowly as an interval already satisfying \(T\ge cn\) for a fixed \(c\), the collapse is even more direct:

- when no such interval exists, the supremum is eventually over the empty class;
- when such intervals exist, (7) forces failure.

---

# 7. Why this is a genuine additional collapse

The oversized-cutoff escape from Attachment O was caused by a mismatch between the saturated statistic and an unsaturated normalization. That defect has been repaired by \(Z_n\le n/4\) and the prime-harmonic normalization.

The present defect is different.

Even with a perfectly calibrated cutoff,

\[
\boxed{
M_\alpha(I)=o(n)
\quad\Longrightarrow\quad
S_{\alpha,Z_n}(I)=o(n\Lambda_n)
}
\]

for purely arithmetic reasons.

Hence the unspecified global uniform remainder may absorb the entire preparation demand of every sublinear cohort. The capacity assertion becomes true as soon as the desired conclusion is true, without proving any reply-capacity statement.

Equally, every linear cohort defeats the inequality before packet chronology is considered.

Thus the following apparently substantive objects are irrelevant to the truth of the displayed formula:

\[
\sigma<\beta<\gamma<t,
\]

the downward-shadow recursion, direct-ancestor reuse, the degree ledger, and the common reply packet. They matter only to an attempted proof of the equivalent no-tail statement, not to the logical content of \((\mathrm{SC}^\ast)\) itself.

This is the twenty-sixth collapse:

\[
\boxed{\textbf{ambient-denominator laundering}.}
\]

---

# 8. Exact repair: normalize the remainder by the realized ledger scale

To state a genuinely stronger trajectory-capacity theorem, the error cannot be allowed to scale with the ambient \(n\) alone. It must be small relative to the realized ledger scale \(E(I)\Lambda_n\).

There are two unavoidable frozen-baseline contributions.

Let

\[
\mu_n(\alpha)
=
\sup_{\text{entry positions}}
\#\left(
\mathcal M(A_1)\cap[\alpha n,n/4]
\right)
=o(n).
\]

A crude uniform initial-root bound is

\[
\mu_n(\alpha)\pi(Z_n).
\]

The direct pre-entry coatom contribution is

\[
O_\alpha(Z_n^2a_n).
\]

Choose \(Z_n\to\infty\) sufficiently slowly that, in addition to the stated frozen-entry condition,

\[
\mu_n(\alpha)\pi(Z_n)
=
o(n\Lambda_n).
\tag{10}
\]

This is always possible by a deterministic diagonal choice because both \(a_n/n\) and \(\mu_n(\alpha)/n\) tend to zero.

Define the frozen baseline budget

\[
B_{\alpha,n}
=
Z_n^2a_n+\mu_n(\alpha)\pi(Z_n)+1.
\tag{11}
\]

A genuine relative shadow-capacity assertion is:

\[
\boxed{
\sup_I
\frac{
\left(
S_{\alpha,Z_n}(I)
-
C_\alpha E(I)
-
K_\alpha B_{\alpha,n}
\right)_+
}{
(E(I)+1)\Lambda_n+B_{\alpha,n}
}
\longrightarrow0.
}
\tag{\(\mathrm{SC}^{\mathrm{rel}}\)}
\]

Equivalently, there must be a deterministic \(\rho_{\alpha,n}\to0\), chosen before Prolonger, such that every realized interval satisfies

\[
\boxed{
S_{\alpha,Z_n}(I)
\le
C_\alpha E(I)
+
K_\alpha B_{\alpha,n}
+
\rho_{\alpha,n}(E(I)+1)\Lambda_n.
}
\tag{12}
\]

This version retains all the intended consequences:

- On a linear bad interval,
  \[
  E(I)\le n/4,
  \qquad
  B_{\alpha,n}=o(n\Lambda_n),
  \]
  so the right side of (12) is \(o(n\Lambda_n)\), apart from the \(O(n)\) term \(C_\alpha E\).
- The Turán–Kubilius demand is \(\Omega(n\Lambda_n)\), giving a contradiction.

But second-shell clearing alone no longer proves (12). From \(M_\alpha=o(n)\), Lemma 1 gives only

\[
S_{\alpha,Z_n}=o(n\Lambda_n).
\]

It does not give

\[
S_{\alpha,Z_n}
=
o(E(I)\Lambda_n).
\]

For example, an arithmetic cohort of \(M=o(n)\) typical integers has

\[
\sum_{g\in G}\omega_Z(g)
\sim M\Lambda_Z.
\]

If \(E\asymp M\), its demand is of full order \(E\Lambda_Z\), even though it is invisible after division by \(n\Lambda_Z\). Thus the relative formulation still requires the promised chronological correlation theorem.

It also closes the familiar baseline defects:

- activation and tie-break are fixed before trajectories;
- all turns from the common baseline are counted;
- initially available roots are charged through \(\mu_n\);
- pre-entry direct preparation is charged through \(Z_n^2a_n\);
- no post-hoc suffix or cohort can redefine the denominator;
- \(Z_n\le n/4\) closes the oversized-cutoff escape;
- no threshold \(E\ge b_n\) is imposed, avoiding registration starvation.

---

# 9. Earlier-processed shells and depth \(J\)

The equivalence collapse is uniform over the source of shadow blockers because it never examines those blockers. At every fixed shell depth, the same Turán–Kubilius argument gives:

\[
\text{sublinear macroscopic service cohort}
\Longrightarrow
o(n\Lambda_n)\text{ total demand}.
\]

So the ambient-denominator defect persists verbatim at every fixed depth.

That does **not** provide a depth-\(J\) packet-capacity proof. A relative statement at shell \(j\) must carry:

- the source-shell label of each shadow blocker;
- a frozen baseline budget including all previously processed shells;
- constants \(C_{\alpha,j}\) or \(C_{\alpha,J}\);
- a relative remainder normalized by that shell’s realized \(E_j\Lambda_n\).

Nothing in the argument above bounds reuse by blockers from earlier shells. Therefore:

\[
\boxed{
\text{The logical collapse is depth-uniform, but no substantive
depth-\(J\) capacity estimate has been proved.}
}
\]

---

# Final ruling

\[
\boxed{
\begin{array}{l}
\textbf{\((\mathrm{SC}^\ast)\) is REPAIRABLE as a purported intermediate theorem.}\\[1mm]
\textbf{Its new collapse is ambient-denominator laundering.}\\[1mm]
\textbf{Every uniformly \(o(n)\) macroscopic root cohort automatically has}\\
\textbf{\(o(n\Lambda_n)\) demand by Turán–Kubilius and Cauchy–Schwarz.}\\[1mm]
\textbf{Every positive-density macroscopic cohort automatically violates}\\
\textbf{\((\mathrm{SC}^\ast)\), for every admissible cutoff and every fixed \(C_\alpha\).}\\[1mm]
\textbf{Hence \((\mathrm{SC}^\ast)\), for all \(\alpha\), is equivalent to the repaired}\\
\textbf{second-shell no-linear-tail statement; it is not an independent}\\
\textbf{cross-scale, cross-reply capacity inequality.}\\[1mm]
\textbf{The exact structural repair is a relative remainder on the scale}\\
\textbf{\(E(I)\Lambda_n\), with frozen entry and initial-root budgets separated.}
\end{array}}
\]

Accordingly, the bare proposition has not been independently proved or refuted: its truth value is exactly the truth value of repaired second-shell clearing. What has been refuted is the claim that its exact displayed quantifiers isolate the missing nonadditive shadow-capacity mechanism.