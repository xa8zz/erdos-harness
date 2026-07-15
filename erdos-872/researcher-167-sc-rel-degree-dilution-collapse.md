---
id: R167-sc-rel-degree-dilution-collapse
type: research
date: 2026-07-15
intent: >
  Determine whether the relative shadow-closed capacity inequality (SC^rel),
  normalized by (E(I)+1)Lambda_n + B_{alpha,n} rather than by the ambient
  n*Lambda_n scale, is a non-circular residue of the capacity program for a
  fixed second-shell greedy clearing policy, or whether it hides another
  degenerate collapse equivalent to second-shell clearing itself.
predecessors: [R164-sc-star-ambient-laundering]
action:
  kind: extends
  target: R164-sc-star-ambient-laundering
claim: >
  For a divisibility antichain game on {2,...,n} played under a fixed
  minimal-maximum-degree second-shell clearing policy (fixed activation data,
  fixed prefix-measurable tie-break), let I range over realized active
  intervals with realized degree ledger E(I); for alpha in (0,1/4) let
  M_alpha(I) count turns with service root g_t >= alpha*n, and
  Theta_{alpha,n} = sup_I M_alpha(I)/n. For a deterministic cutoff Z_n -> infinity,
  Z_n <= n/4, Lambda_n = sum_{p<=Z_n} 1/p, and frozen-baseline budget
  B_{alpha,n} depending on entry size a_n=o(n) and initial-root count
  mu_n(alpha), (SC^rel)(alpha) asserts existence of constants C_alpha, K_alpha
  and an admissible Z_n (satisfying B_{alpha,n}=o(n*Lambda_n)) such that the
  small-prime demand S_{alpha,Z_n}(I) of service roots, after subtracting
  C_alpha*E(I) + K_alpha*B_{alpha,n}, is o((E(I)+1)*Lambda_n + B_{alpha,n})
  uniformly over I. This is refuted as a non-circular residue by a new
  collapse, slow-cutoff degree-dilution laundering: on sublinear-ledger
  intervals the sparse second-shell maximum-degree modulus
  H_eta(n,u) = inf{max_d deg_Q(d): |A|<=u, |Q_1(A)|>eta|S_1|} diverges for
  u=o(n) (rate >>_eta loglog min{n^{1/8}, (n/(u+1))^{1/4}}), forcing
  M_alpha(I) <= E(I)/h_n for a modulus h_n -> infinity; a deterministic
  diagonal construction then chooses Z_n so slowly that pi(Z_n) = o(h_n*Lambda_n),
  so the crude bound S_{alpha,Z_n}(I) <= M_alpha(I)*pi(Z_n) alone proves
  (SC^rel) with no appeal to chronology, shadow closure, packet lcms, or
  first-death ledgers; on non-sublinear-ledger intervals the same
  Turan-Kubilius + Cauchy-Schwarz absorption used for the ambient-normalized
  inequality applies. The exact cohort-collapse theorem: under the necessary
  admissibility condition B_{alpha,n}=o(n*Lambda_n), (SC^rel)(alpha) holds
  (with C_alpha=K_alpha=0 sufficing) if and only if Theta_{alpha,n} -> 0 --
  proved via a small-ledger case (E(I) <= epsilon_n*n, sparse-degree modulus
  argument) and a large-ledger case (E(I) > epsilon_n*n, Turan-Kubilius +
  Cauchy-Schwarz), with the converse showing a positive-density cohort
  (Theta_{alpha,n} >= delta > 0 along a subsequence) forces, for every
  admissible Z_n and every fixed finite C_alpha, K_alpha, a demand
  S_{alpha,Z_n}(I) of order n*Lambda_n while C_alpha*E(I) + K_alpha*B_{alpha,n}
  = o(n*Lambda_n), so the ratio stays bounded away from 0. Consequently
  (SC^rel)(alpha) for every fixed alpha is equivalent to the repaired
  no-linear-active-tail second-shell statement and hence to repaired
  FSC(2,eta): the relative formulation is exactly as circular as the ambient
  one, refuting the claim that it is a non-circular residue. The only
  proposed route to independent content is a further-repaired inequality
  that replaces the existential admissible-cutoff quantifier with a universal
  one (quantifying over every admissible cutoff sequence, or externally
  prescribing the cutoff rather than choosing it after the realized-trajectory
  class is fixed); this repaired form is not shown to follow automatically
  from sublinear cohort size, but its requiring the chronological
  cross-reply/shadow-closure machinery is proposed, not proven. Neither
  (SC^rel) nor its proposed repair, even if fully established, would by
  itself yield L(n)=o(n): both control only the fixed policy's second shell,
  leaving deeper shells (J>=3) and alternate Shortener policies open.
implications:
  - Both the ambient-normalized (SC*) and the relative-normalized (SC^rel)
    capacity-inequality formulations are now proven circular equivalents of
    second-shell clearing; the capacity-inequality program has not yet
    produced an independent lemma at either normalization scale.
  - The catalogued degenerate-collapse families should be extended with
    slow-cutoff degree-dilution laundering (existential-cutoff diagonalization
    against a diverging sparse-degree modulus) as a mechanism distinct from
    oversized-cutoff laundering.
  - Any future non-circular capacity claim must quantify universally over
    admissible cutoff sequences (or externally prescribe the cutoff) rather
    than existentially, or abandon the capacity-inequality frame for a direct
    chronological cross-reply/downward-shadow argument at E-scale.
  - Even a fully proven capacity inequality at this second-shell scale would
    not by itself establish L(n)=o(n); it remains conditional on finite-shell
    clearing at every fixed depth J.
confidence_at_time: medium
strategy_dependence: second-shell-greedy-policy-specific
prompt: erdos-872/prompts/researcher-R167-sc-rel-e-scale.md
---

# Verdict

\[
\boxed{\text{\((\mathrm{SC}^{\mathrm{rel}})\) is not the claimed non-circular residue.}}
\]

There is another quantifier-level collapse:

\[
\boxed{\textbf{slow-cutoff degree-dilution laundering}.}
\]

The existential cutoff \(Z_n\to\infty\) may be chosen so slowly that, on every interval whose realized deletion ledger is sublinear, the divergent sparse-position greedy degree makes the number of service roots negligible compared with \(E(I)\). The crude bound

\[
S_{\alpha,Z}(I)\le M_\alpha(I)\pi(Z)
\]

then proves the relative inequality without using preparation chronology, shadow closure, packet lcms, or first-death ledgers.

For intervals whose ledger is not sublinear, the denominator is again effectively ambient, and the Turán–Kubilius subset estimate absorbs every \(o(n)\) macroscopic cohort.

The exact result is the following cohort characterization.

---

## The relative cohort-collapse theorem

Fix \(\alpha\in(0,1/4)\), the active threshold, the uniformly sparse activation data, and the prefix-measurable tie-break. Let

\[
M_\alpha(I)
=
\#\{t:g_t\ge \alpha n\}
\]

for a realized active interval \(I\), and put

\[
\Theta_{\alpha,n}
=
\sup_I\frac{M_\alpha(I)}n.
\]

Interpret “admissible cutoff” in the only nonvacuous way compatible with the claimed second-shell consequence:

\[
Z_n\to\infty,\qquad Z_n\le \frac n4,\qquad
B_{\alpha,n}=o(n\Lambda_n),
\tag{A}
\]

where

\[
\Lambda_n=\sum_{p\le Z_n}\frac1p,
\qquad
B_{\alpha,n}
=
Z_n^2a_n+\mu_n(\alpha)\pi(Z_n)+1.
\]

Then

\[
\boxed{
(\mathrm{SC}^{\mathrm{rel}})(\alpha)
\iff
\Theta_{\alpha,n}\longrightarrow0.
}
\tag{1}
\]

Moreover, the implication from right to left holds with

\[
C_\alpha=K_\alpha=0.
\]

Thus even the \(CE+KB\) terms are unnecessary for the collapse.

This is the same cohort characterization proved for the ambiently normalized \((\mathrm{SC}^{\ast})\). The relative denominator does not eliminate circularity because the existential cutoff supplies a second escape.

---

# 1. Elementary ledger facts

Let \(T=T(I)\) be the number of Shortener turns in \(I\). Since every active target is nonminimal, some currently legal lower element has positive degree. Therefore

\[
\Delta_t\ge1
\]

on every active turn. Consequently,

\[
M_\alpha(I)\le T(I)\le E(I).
\tag{2}
\]

The greedy deletion sets

\[
D_t=N_{Q_t}(g_t)
\]

are pairwise disjoint subsets of the second shell. Hence

\[
E(I)=\sum_t\Delta_t
\le |S_1|
=\frac n4+O(1).
\tag{3}
\]

Because all turns are counted from the common frozen baseline, before any turn of \(I\) the selected set has size at most

\[
a_n+2T(I)+O(1)
\le a_n+2E(I)+O(1).
\tag{4}
\]

The common-baseline hypothesis is load-bearing here. An uncharged suffix would invalidate (4).

---

# 2. The sparse second-shell degree modulus

Use the established sparse second-shell degree lemma together with deletion-set root equality.

For \(u=o(n)\), define

\[
H_\eta(n,u)
=
\inf
\left\{
\max_{d\text{ legal}}\deg_Q(d):
|A|\le u,\ |Q_1(A)|>\eta|S_1|
\right\}.
\]

The accepted degree lemma gives, for example,

\[
H_\eta(n,u)
\gg_\eta
\log\log
\left(
\min\left\{
n^{1/8},
\left(\frac n{u+1}\right)^{1/4}
\right\}
\right),
\tag{5}
\]

and therefore

\[
u=o(n)
\quad\Longrightarrow\quad
H_\eta(n,u)\longrightarrow\infty.
\tag{6}
\]

The maximizing legal element supplied by the degree lemma need not itself be divisibility-minimal. But its divisibility-minimal legal divisor has the same deletion set on the current second-shell target set. Hence the prescribed minimal-maximum-degree policy has

\[
\Delta_t\ge H_\eta(n,u)
\tag{7}
\]

whenever the current selected set has size at most \(u\).

No substitution of roots as game moves is being made here; deletion-set root equality is used only to compare current \(Q\)-degrees, exactly within its verified scope.

---

# 3. Uniform arithmetic estimates

For a set of distinct integers

\[
G\subseteq[\alpha n,n/4],
\qquad |G|=M,
\]

the supplied Turán–Kubilius estimate and Cauchy–Schwarz give, uniformly for \(2\le Z\le n/4\),

\[
\sum_{g\in G}\omega_Z(g)
\le
M\Lambda_Z
+
O_\alpha(M)
+
O_\alpha\!\left(\sqrt{Mn\Lambda_Z}\right).
\tag{8}
\]

Since the service statistic excludes at most one release prime,

\[
S_{\alpha,Z}(I)
\le
\sum_{g\in G_\alpha(I)}\omega_Z(g).
\tag{9}
\]

The corresponding lower estimate is also uniform: for every fixed \(\delta>0\), if

\[
|G|\ge\delta n,
\]

then

\[
\#\left\{
g\in G:\omega_Z(g)<\frac12\Lambda_Z
\right\}
=
O_\alpha\left(\frac n{\Lambda_Z}\right)
=o(n).
\tag{10}
\]

Thus a positive-density cohort has total small-prime demand of order \(n\Lambda_Z\), even after deleting one release prime per noninitial root.

---

# 4. The slow-cutoff diagonal lemma

The following elementary diagonalization is the new collapse.

## Lemma

Suppose

\[
h_n\longrightarrow\infty,\qquad
\frac{a_n}{n}\longrightarrow0,\qquad
\frac{\mu_n(\alpha)}n\longrightarrow0.
\]

Then there exists a deterministic sequence \(Z_n\to\infty\), \(Z_n\le n/4\), such that

\[
\frac{\pi(Z_n)}{h_n\Lambda_n}\longrightarrow0,
\tag{11}
\]

and simultaneously

\[
\frac{Z_n^2a_n}{n\Lambda_n}\longrightarrow0,
\qquad
\frac{\mu_n(\alpha)\pi(Z_n)}{n\Lambda_n}\longrightarrow0.
\tag{12}
\]

### Proof

For a fixed integer \(k\ge2\), all three quantities

\[
\frac{\pi(k)}{\Lambda_k},
\qquad
\frac{k^2}{\Lambda_k},
\qquad
\frac{\pi(k)}{\Lambda_k}
\]

are constants.

Choose increasing integers \(N_k\) so that for all \(n\ge N_k\),

\[
\frac{\pi(k)}{h_n\Lambda_k}\le\frac1k,
\]

\[
\frac{k^2a_n}{n\Lambda_k}\le\frac1k,
\]

\[
\frac{\mu_n(\alpha)\pi(k)}{n\Lambda_k}\le\frac1k,
\]

and \(n\ge4k\). Define

\[
Z_n=k
\qquad
(N_k\le n<N_{k+1}).
\]

Then \(Z_n\to\infty\), \(Z_n\le n/4\), and all three displayed ratios tend to zero. ∎

The cutoff is deterministic and is fixed before any individual Prolonger strategy is selected. Nevertheless, it is allowed to depend on deterministic worst-case trajectory parameters such as \(h_n\) and \(\Theta_{\alpha,n}\). The quantifier “there exists a deterministic \(Z_n\)” permits exactly this diagonalization.

---

# 5. A uniformly sublinear cohort implies \((\mathrm{SC}^{\mathrm{rel}})\)

Assume

\[
\Theta_{\alpha,n}\longrightarrow0.
\tag{13}
\]

Set

\[
\delta_n
=
\Theta_{\alpha,n}
+
\frac{a_n}{n}
+
\frac1{\log(n+2)}
\]

and choose

\[
\varepsilon_n=\delta_n^{1/4}.
\tag{14}
\]

Then

\[
\varepsilon_n\to0,
\qquad
\frac{a_n}{n}=o(\varepsilon_n),
\tag{15}
\]

and

\[
\frac{\Theta_{\alpha,n}}{\varepsilon_n}\to0,
\qquad
\frac{\sqrt{\Theta_{\alpha,n}}}{\varepsilon_n}\to0.
\tag{16}
\]

Define the sparse-position degree modulus

\[
h_n
=
H_\eta\bigl(
n,\,
a_n+2\varepsilon_nn+O(1)
\bigr).
\tag{17}
\]

By (6),

\[
h_n\to\infty.
\tag{18}
\]

Choose \(Z_n\) by the diagonal lemma. We prove the relative inequality by splitting according to the realized ledger size.

---

## Case 1: \(E(I)\le\varepsilon_n n\)

By (4), every position in the interval has selected-set size at most

\[
a_n+2\varepsilon_n n+O(1)=o(n).
\]

Therefore every greedy turn has

\[
\Delta_t\ge h_n.
\]

Hence

\[
E(I)=\sum_{t=1}^{T}\Delta_t
\ge h_nT,
\]

so

\[
M_\alpha(I)\le T\le\frac{E(I)}{h_n}.
\tag{19}
\]

The completely crude prime-count bound now suffices:

\[
S_{\alpha,Z_n}(I)
\le
M_\alpha(I)\pi(Z_n)
\le
\frac{E(I)\pi(Z_n)}{h_n}.
\tag{20}
\]

Consequently,

\[
\frac{S_{\alpha,Z_n}(I)}
{(E(I)+1)\Lambda_n+B_{\alpha,n}}
\le
\frac{\pi(Z_n)}{h_n\Lambda_n}
=o(1).
\tag{21}
\]

This holds even if every service root is as small-prime-rich as arithmetically possible. No preparation or packet estimate has been used.

---

## Case 2: \(E(I)>\varepsilon_n n\)

Here the relative denominator is already a positive \(\varepsilon_n\)-fraction of the ambient denominator.

Using (8), with

\[
M=M_\alpha(I)\le \Theta_{\alpha,n}n,
\]

gives

\[
S_{\alpha,Z_n}(I)
\le
M\Lambda_n
+
O_\alpha(M)
+
O_\alpha\!\left(\sqrt{Mn\Lambda_n}\right).
\]

Since \(E(I)>\varepsilon_n n\),

\[
\begin{aligned}
\frac{S_{\alpha,Z_n}(I)}
{(E(I)+1)\Lambda_n+B_{\alpha,n}}
&\le
\frac{\Theta_{\alpha,n}}{\varepsilon_n}
+
O_\alpha\left(
\frac{\Theta_{\alpha,n}}
{\varepsilon_n\Lambda_n}
\right)\\
&\quad+
O_\alpha\left(
\frac{\sqrt{\Theta_{\alpha,n}}}
{\varepsilon_n\sqrt{\Lambda_n}}
\right).
\end{aligned}
\tag{22}
\]

Every term tends to zero by (16). Therefore

\[
\sup_I
\frac{S_{\alpha,Z_n}(I)}
{(E(I)+1)\Lambda_n+B_{\alpha,n}}
\longrightarrow0.
\tag{23}
\]

In particular, the displayed \((\mathrm{SC}^{\mathrm{rel}})\) holds with

\[
C_\alpha=K_\alpha=0.
\tag{24}
\]

This proves

\[
\Theta_{\alpha,n}\to0
\quad\Longrightarrow\quad
(\mathrm{SC}^{\mathrm{rel}})(\alpha).
\tag{25}
\]

---

# 6. A positive-density cohort violates every nonvacuous \((\mathrm{SC}^{\mathrm{rel}})\)

Suppose the cohort condition fails. Then there are \(\delta>0\), a subsequence \(n_k\), and realized intervals \(I_k\) such that

\[
M_\alpha(I_k)\ge\delta n_k.
\tag{26}
\]

Consider any proposed deterministic cutoff \(Z_n\to\infty\) satisfying (A), and any fixed finite \(C_\alpha,K_\alpha\).

At most \(\mu_n(\alpha)=o(n)\) roots in the cohort were already minimal at the frozen entry position. Remove them.

By (10), all but \(o(n)\) of the remaining roots satisfy

\[
\omega_{Z_n}(g)\ge\frac12\Lambda_n.
\]

Excluding the one release prime loses at most one. Since \(\Lambda_n\to\infty\), for large \(n\) at least \(\delta n/2\) roots each contribute at least \(\Lambda_n/3\). Therefore

\[
S_{\alpha,Z_n}(I_k)
\ge
\left(\frac{\delta}{6}-o(1)\right)n_k\Lambda_{n_k}.
\tag{27}
\]

On the other hand, by (3),

\[
C_\alpha E(I_k)
\le
\left(\frac{C_\alpha}{4}+o(1)\right)n_k
=
o(n_k\Lambda_{n_k}),
\tag{28}
\]

and strong admissibility gives

\[
K_\alpha B_{\alpha,n_k}
=
o(n_k\Lambda_{n_k}).
\tag{29}
\]

Thus the numerator in \((\mathrm{SC}^{\mathrm{rel}})\) is at least

\[
\left(\frac{\delta}{7}-o(1)\right)n_k\Lambda_{n_k}.
\tag{30}
\]

Meanwhile,

\[
(E(I_k)+1)\Lambda_{n_k}+B_{\alpha,n_k}
\le
\left(\frac14+o(1)\right)n_k\Lambda_{n_k}.
\tag{31}
\]

The displayed ratio is therefore bounded below by a fixed positive constant along the subsequence. It cannot tend to zero.

Hence

\[
(\mathrm{SC}^{\mathrm{rel}})(\alpha)
\quad\Longrightarrow\quad
\Theta_{\alpha,n}\to0.
\tag{32}
\]

Combining (25) and (32) proves (1).

---

# 7. What the new collapse is doing

There are two regimes.

When

\[
E(I)\ge\varepsilon_n n,
\]

the allegedly relative denominator is still large enough that an \(o(n)\) cohort is absorbed by the same Turán–Kubilius–Cauchy–Schwarz argument responsible for ambient-denominator laundering.

When

\[
E(I)<\varepsilon_n n,
\]

the entire realized position remains sparse. The active second-shell degree tends to infinity, so

\[
\frac{M_\alpha(I)}{E(I)}\le\frac1{h_n}=o(1).
\]

The existential cutoff is then chosen so slowly that

\[
\frac{\pi(Z_n)}{\Lambda_n}=o(h_n).
\]

Consequently,

\[
S_{\alpha,Z_n}(I)
\le M_\alpha(I)\pi(Z_n)
=o(E(I)\Lambda_n).
\]

The middle range is eliminated by choosing \(\varepsilon_n\) diagonally from the worst-case cohort density.

Thus the formula never reaches the proposed chronological cross-reply problem:

\[
\sigma<\beta<\gamma<t,
\]

downward-shadow closure, direct-ancestor reuse, packet lcms, and first-death correlations play no role in its truth value.

The collapse is different from the oversized-cutoff escape:

- oversized-cutoff laundering lets the normalization grow after the statistic has saturated;
- slow-cutoff degree-dilution laundering keeps the statistic at such low resolution that sparse greedy degree overwhelms its maximum possible demand.

---

# 8. Exact consequences for second-shell clearing

Let \(\mathsf{NT}_2\) denote the repaired no-linear-active-tail assertion with the four accepted conditions: uniform activation, aligned thresholds, adversarial tail quantification, and \(0<\eta_0<\eta/2\).

The fresh-root theorem gives:

\[
T(I)\ge cn
\quad\Longrightarrow\quad
M_{c/2}(I)
\ge
\frac c2n-o(n).
\tag{33}
\]

Therefore,

\[
\mathsf{NT}_2
\quad\Longleftrightarrow\quad
\Theta_{\alpha,n}\to0
\text{ for every fixed }\alpha>0.
\tag{34}
\]

Indeed:

- if \(\mathsf{NT}_2\) holds, every active interval has \(T=o(n)\), hence \(M_\alpha\le T=o(n)\);
- if \(\mathsf{NT}_2\) fails with a \(cn\)-turn interval, (33) gives a positive-density cohort at \(\alpha=c/2\).

Using the cohort-collapse theorem,

\[
\boxed{
\begin{aligned}
&(\mathrm{SC}^{\mathrm{rel}})(\alpha)
\text{ for every fixed }\alpha\in(0,1/4)\\
&\qquad\Longleftrightarrow
\mathsf{NT}_2\\
&\qquad\Longleftrightarrow
\mathrm{FSC}(2,\eta)
\text{ in its repaired uniformly activated form}.
\end{aligned}}
\tag{35}
\]

So the asserted one-way separation is false:

\[
\boxed{
\mathrm{FSC}(2,\eta)
\Longrightarrow
(\mathrm{SC}^{\mathrm{rel}})(\alpha)
\text{ for every }\alpha,
}
\tag{36}
\]

and the converse holds after quantifying over every fixed \(\alpha\).

The implication (36) does not use the four-layer capacity mechanism. It uses the slow cutoff constructed above.

---

# 9. What it does and does not imply for \(L(n)\)

Even if \((\mathrm{SC}^{\mathrm{rel}})\) holds for every \(\alpha\), its exact consequence is only the repaired second-shell clearing statement for the specified minimal-maximum-degree policy, activation data, and tie-break.

It does **not** by itself establish

\[
L(n)=o(n).
\]

The accepted finite-shell reduction requires

\[
\mathrm{FSC}(J,\eta)
\]

for every fixed shell depth \(J\) and every fixed \(\eta>0\). Nothing in the relative second-shell formula controls third or deeper shells, where shadow blockers may arrive from multiple previously processed shells.

Likewise, failure of \((\mathrm{SC}^{\mathrm{rel}})\) implies a linear active interval for this exact second-shell policy, but it does not imply

\[
L(n)=\Omega(n).
\]

Optimal Shortener play may use a different, batch-aware policy.

Nor does the game-theoretic statement \(L(n)=o(n)\), by itself, force \((\mathrm{SC}^{\mathrm{rel}})\) for this fixed greedy policy. A different Shortener strategy could be sublinear while the prescribed policy admits a linear interval.

Thus the precise logical picture is

\[
\boxed{
\begin{array}{c}
(\mathrm{SC}^{\mathrm{rel}})\text{ for all }\alpha\\
\Updownarrow\\
\text{repaired second-shell no-tail for the fixed policy}\\
\Updownarrow\\
\mathrm{FSC}(2,\eta)\text{ for that activation scheme},
\end{array}}
\]

but there is no direct equivalence with the full game value.

---

# 10. A further baseline caution

If “admissible” does **not** include

\[
Z_n^2a_n=o(n\Lambda_n),
\tag{37}
\]

then the situation is even worse. The baseline term may satisfy

\[
B_{\alpha,n}\asymp n\Lambda_n
\quad\text{or}\quad
B_{\alpha,n}\gg n\Lambda_n,
\]

and the subtraction \(K_\alpha B_{\alpha,n}\) can absorb the positive-density demand itself. Then even the implication from \((\mathrm{SC}^{\mathrm{rel}})\) to second-shell clearing is invalid.

Therefore the exact nonvacuity condition is not merely

\[
\mu_n(\alpha)\pi(Z_n)=o(n\Lambda_n),
\]

but

\[
\boxed{
B_{\alpha,n}
=
Z_n^2a_n+\mu_n(\alpha)\pi(Z_n)+1
=
o(n\Lambda_n).
}
\tag{38}
\]

The diagonal construction in §4 satisfies this stronger condition, so imposing it does not remove the slow-cutoff collapse.

---

# 11. Exact repair

To obtain a genuinely independent cross-scale capacity assertion, the cutoff cannot remain existential.

A clean repair is to let

\[
\mathcal A_\alpha
=
\left\{
(Z_n):
Z_n\to\infty,\ 
Z_n\le n/4,\ 
B_{\alpha,n}(Z_n)=o(n\Lambda_{Z_n})
\right\}
\]

and require

\[
\boxed{
\begin{aligned}
&\exists C_\alpha,K_\alpha<\infty
\quad
\forall (Z_n)\in\mathcal A_\alpha,\\
&\sup_I
\frac{
\left[
S_{\alpha,Z_n}(I)
-
C_\alpha E(I)
-
K_\alpha B_{\alpha,n}(Z_n)
\right]_+
}{
(E(I)+1)\Lambda_{Z_n}
+
B_{\alpha,n}(Z_n)
}
\longrightarrow0.
\end{aligned}}
\tag{\(\mathrm{SC}^{\mathrm{rel,rob}}\)}
\]

Equivalently, one may make \(Z_n\) externally prescribed data of the theorem, rather than allowing the prover to select it existentially after the realized-trajectory class has been defined.

The quantifier change is essential. In the proof above, \(Z_n\) was chosen from the deterministic worst-case cohort density \(\Theta_{\alpha,n}\) and the resulting sparse-degree modulus \(h_n\). A universal or externally prescribed cutoff prevents that diagonal starvation.

This repaired formulation retains:

- the common frozen baseline;
- the initial-root budget;
- the direct pre-entry budget;
- the \(E\Lambda\) normalization;
- the on-trajectory restriction;
- the fixed activation and tie-break;
- the effective cutoff \(Z_n\le n/4\).

But it no longer follows automatically from sublinear cohort size. A proof would then genuinely have to control high-resolution preparation demand through cross-reply chronology and shadow closure.

---

# Final ruling

\[
\boxed{
\begin{array}{l}
\textbf{The assertion that \((\mathrm{SC}^{\mathrm{rel}})\) is a non-circular residue is false.}\\[1mm]
\textbf{Its hidden collapse is slow-cutoff degree-dilution laundering.}\\[1mm]
\textbf{For small ledgers, sparse maximum degree makes }M_\alpha=o(E).\\
\textbf{The existential cutoff can be diagonalized so slowly that}\\
\textbf{\(M_\alpha\pi(Z)=o(E\Lambda_Z)\), even for maximally smooth roots.}\\[1mm]
\textbf{For larger ledgers, Turán–Kubilius again absorbs every \(o(n)\) cohort.}\\[1mm]
\textbf{Consequently, under the necessary condition \(B=o(n\Lambda)\),}\\
\textbf{\((\mathrm{SC}^{\mathrm{rel}})(\alpha)\iff
\sup_I M_\alpha(I)/n\to0\).}\\[1mm]
\textbf{For all \(\alpha\), this is equivalent to the repaired second-shell}\\
\textbf{no-linear-tail statement and hence to repaired \(\mathrm{FSC}(2,\eta)\).}\\[1mm]
\textbf{It gives no deeper-shell theorem and no unconditional conclusion}\\
\textbf{about \(L(n)=o(n)\).}\\[1mm]
\textbf{The exact repair is to remove the existential cutoff escape—}\\
\textbf{prescribe \(Z_n\) externally or quantify uniformly over all}\\
\textbf{strongly admissible cutoff sequences.}
\end{array}}
\]

Thus \((\mathrm{SC}^{\mathrm{rel}})\) does not isolate the missing chronological packet-capacity theorem. Its bare truth value remains exactly the truth value of repaired second-shell clearing; the proposed independence has been refuted.