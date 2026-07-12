---
id: R142-finite-shell-clearing
type: research
date: 2026-07-12
intent: >
  Independent full-solution attempt at the divisibility-game dichotomy
  L(n) = o(n) vs L(n) = Omega(n) on {2..n}, given the full compiled
  record including the first-failure localization and the four-property
  disproof checklist.
predecessors: []
action:
  kind: standalone
claim: >
  No unconditional proof or disproof follows from the record. NEW
  weaker sufficient family — finite-shell clearing FSC(J, eta): after
  the trapping prelude, process the top J dyadic shells in order,
  playing while |Q_j| > eta |S_j| a legal lower element maximizing
  deletions from Q_j (every turn counted, no guards or optional
  epochs); FSC(J, eta) asserts the J phases finish in o(n) Shortener
  turns against every Prolonger strategy. PROPOSITION (elementary
  counting proof): if FSC(J, eta) holds for every FIXED J and eta > 0
  then L(n) = o(n) — after the phases, |A| = o(n) so the minimal layer
  is o(n) by static completion, processed-shell nonminimal mass is at
  most eta sum |S_j| <= eta n, and everything below shell J is at most
  n/2^J in TOTAL SIZE; choosing J large and eta small per epsilon
  gives limsup L(n)/n <= epsilon for every epsilon. The key feature:
  deep shells are controlled by size, not by clearing, so NO
  growing-depth or coupled-modulus estimate is needed — the family is
  strictly weaker-looking than online-area and aggregate-excess
  statements, trajectory-restricted, policy-specific, and immune to
  terminal/activation collapses by construction. Where it gets stuck:
  proving FSC for a single fixed (J, eta) still requires bounding the
  per-shell greedy phase length, which meets the same direct-ancestor
  regeneration obstruction within one shell; the record neither proves
  nor refutes any FSC(J, eta). Disproof of a SINGLE fixed pair
  (J, eta) would close this route.
implications:
  - New canonical weakest-known sufficient target: one fixed shell,
    one fixed density, greedy policy, o(n) turns. Simpler than
    (AE-dagger) — no tickets, budgets, or halving; candidates for both
    targeted proof attempts and small-board empirics.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R142-solution-attempt-full-compilation.md
---

# Verdict

\[
\boxed{\text{I do not have a valid unconditional proof or disproof of }L(n)=o(n).}
\]

After treating every listed result as an axiom and auditing the remaining routes, a complete resolution would still require a genuinely new chronology-sensitive theorem. The supplied record itself leaves aggregate-excess halving, the cumulative minimal-layer problem, and direct-ancestor lifetime control unresolved; on the lower side, every established construction remains compatible with \(o(n)\). 

Presenting either conclusion as proved would therefore conceal an unproved step. What can be given rigorously is a sharper, nonvacuous reduction that seems weaker than the existing online-area statement and pinpoints where the obstruction first appears.

## 1. Why the existing upper-bound ingredients do not close the problem

Let

\[
\mu_n(\alpha)=
 \max\left\{
 \frac{|\mathcal M(P)|}{n}:
 P\text{ primitive},\ |P|\le \alpha n
 \right\}.
\]

The static-completion theorem says that

\[
\alpha_n\longrightarrow 0
\quad\Longrightarrow\quad
\mu_n(\alpha_n)\longrightarrow 0.
\]

The maximal-cone lemma says that, when the current legal set has linear size, some minimal legal move deletes on the order of \(1/\mu_n(\alpha)\) nonminimal legal integers at a position of size \(\alpha n\).

That is not enough. A modulus such as

\[
\mu(\alpha)=\frac1{\log(1/\alpha)}
\]

still tends to zero, but the amount directly cleared in the first \(\alpha n\) turns can be only on the scale

\[
n\int_0^\alpha \log(1/s)\,ds
  =n\bigl(\alpha\log(1/\alpha)+\alpha\bigr)
  =o(n)
\]

whenever \(\alpha=o(1)\). The interval-blocker construction shows that a modulus of essentially this slow size really does occur for off-policy sparse positions. Thus static completion cannot be iterated without using reachability information.

The peel-plus-continuation argument has the same rate defect. After peeling through \(n/H\), suppose \(C\) is a maximal completion. The continuation lemma gives

\[
\text{remaining moves}\le (2H+1)|C|.
\]

Static completion gives only \(|C|=o(n)\), whereas one needs

\[
|C|=o(n/H).
\]

For example,

\[
|C|=\frac{n}{\log H}
\]

is \(o(n)\) for every \(H\to\infty\), but

\[
\frac{H|C|}{n}=\frac{H}{\log H}\longrightarrow\infty.
\]

Choosing \(H\) “sufficiently slowly” does not repair that mismatch.

Finally, first-failure localization only proves that a failed aggregate-halving interval occurs during an \(o(n)\)-move prefix. It does not bound the amount of surviving excess attributable to moves made before the interval or to a single interval move after future refinements. Once ownership is required to be fresh, interval-local, immutable and causal, the proposed ledger statement becomes precisely aggregate-excess halving itself. So localization is useful, but it is not the missing contraction theorem.

## 2. A weaker finite-shell statement that would suffice

For \(j\ge0\), put

\[
S_j=\left(\frac{n}{2^{j+1}},\frac{n}{2^j}\right]
\]

and, for a position \(A\), define

\[
Q_j(A)
 =
S_j\cap
\bigl(\mathcal L(A)\setminus\mathcal M(A)\bigr).
\]

Thus \(Q_j(A)\) consists of the live, nonminimal elements of the \(j\)-th dyadic shell.

Fix constants \(J\ge1\) and \(\eta>0\). Consider the following completely prescribed policy after the accepted trapping prelude:

1. Process \(S_0,S_1,\ldots,S_{J-1}\) in that order.
2. While
   \[
   |Q_j(A)|>\eta |S_j|,
   \]
   Shortener plays a currently legal lower element maximizing the number of members of \(Q_j(A)\) that it deletes.
3. Every Shortener turn is counted. There are no uncharged guards, optional epochs or post-hoc activations.

Call the following assertion \(\mathrm{FSC}(J,\eta)\):

> Against every Prolonger strategy, the prescribed \(J\) shell phases finish in \(o(n)\) Shortener turns.

This statement is trajectory-restricted and policy-specific. It cannot be satisfied by merely naming a terminal position or suppressing activation.

### Proposition

If \(\mathrm{FSC}(J,\eta)\) holds for every fixed \(J\) and every fixed \(\eta>0\), then

\[
L(n)=o(n).
\]

### Proof

Let \(A\) be the position after the trapping prelude and all \(J\) shell phases. The number of actual moves used so far is \(o(n)\), since Prolonger has at most one reply to each Shortener move. Therefore

\[
|A|=o(n).
\]

By static completion,

\[
|\mathcal M(A)|=o(n).
\]

At the end of the prescribed phases,

\[
|Q_j(A)|\le \eta |S_j|
\qquad (0\le j<J).
\]

Hence the nonminimal legal elements in the processed shells number at most

\[
\sum_{j=0}^{J-1}|Q_j(A)|
 \le
\eta\sum_{j=0}^{J-1}|S_j|
 <\eta n.
\]

Every legal element below those shells lies in

\[
[2,n/2^J],
\]

which contains at most \(n/2^J\) integers. Consequently,

\[
\begin{aligned}
|\mathcal L(A)|
&=
|\mathcal M(A)|
+
|\mathcal L(A)\setminus\mathcal M(A)|\\
&\le
o(n)+\eta n+\frac{n}{2^J}.
\end{aligned}
\]

Legal sets are monotone decreasing: after \(A\), every further move consumes one currently legal integer and no illegal integer can become legal. Thus every continuation, regardless of either player’s later strategy, has length at most \(|\mathcal L(A)|\). Including the \(o(n)\)-move prelude and shell processing,

\[
L(n)
\le
\left(\eta+2^{-J}\right)n+o(n).
\]

Given \(\varepsilon>0\), choose fixed \(\eta<\varepsilon/3\) and fixed \(J\) with \(2^{-J}<\varepsilon/3\). Then

\[
\limsup_{n\to\infty}\frac{L(n)}n
\le \frac{2\varepsilon}{3}.
\]

Since \(\varepsilon\) is arbitrary,

\[
L(n)=o(n).
\qquad\square
\]

## 3. Where this reduction gets stuck

The accepted fixed-density clearing result handles \(J=1\), the original upper half \(S_0=(n/2,n]\).

The first genuinely new case is \(J=2\), namely the shell

\[
S_1=(n/4,n/2].
\]

It is tempting to replace \(n\) by \(n/2\) and invoke upper-half degree availability again. That rescaling is invalid. Moves already selected in \((n/2,n]\) do not belong to the smaller board \(\{2,\ldots,n/2\}\), yet they can make many divisors \(d\le n/4\) illegal:

\[
d\mid a,\qquad a\in(n/2,n],
\]

while leaving many \(x\in(n/4,n/2]\) incomparable with \(a\), and hence still legal. Thus the scaled position has external blockers that are invisible to the smaller-board theorem.

The face-carrier and primorial-batching examples show that this is not a bookkeeping nuisance. A sparse family of upper carriers can simultaneously:

\[
|Q_1(A)|\asymp n,
\qquad
|A|=o(n),
\qquad
\Delta_{Q_1}(A)\ \text{small},
\]

without killing the shell targets themselves. Endpoint inequalities, static covers and individual-move capacities therefore cannot prove \(\mathrm{FSC}(2,\eta)\).

To establish even this second-shell statement, one must show that such external blocking cannot persist **along the prescribed clearing trajectory** without one of the following occurring:

\[
\text{large accumulated direct deletion},
\quad
\text{many helpful Prolonger moves},
\quad\text{or}\quad
\text{transfer of targets into }\mathcal M(A).
\]

That is exactly the chronology-sensitive content still missing from online area and aggregate-excess halving. First-failure localization usefully says the bad interval may be assumed sparse, but the direct-ancestor/refinement phenomenon prevents converting sparsity into a bounded interval-local charge.

## 4. Why the current lower-bound machinery does not disprove the statement

A growing-cap fortress gives only

\[
L(n)\ge \frac{cn}{H(n)}.
\]

For every \(H(n)\to\infty\),

\[
\frac{n}{H(n)}=o(n),
\]

so even \(n^{1-o(1)}\) is compatible with the conjectured conclusion. A linear lower bound would need a bounded cap, an amplification that converts \(n/H\) into \(cn\), or a different non-reservoir mechanism.

But bounded-cap positive-density entry is ruled out against the fixed-density clearing policy. Meanwhile the rank-\(k\) fan hierarchy gives

\[
L(n)\ge
c_k\frac{n(\log\log n)^{k-1}}{\log n},
\qquad
c_k=2^{-k-2^{k-1}+1},
\]

and the doubly exponential decay of \(c_k\) prevents taking \(k=k(n)\to\infty\) to obtain a linear bound. Thus no supplied lower strategy reaches \(\Omega(n)\).

# Conclusion

The mathematically defensible conclusion is

\[
\boxed{
\begin{array}{c}
\text{Neither }L(n)=o(n)\text{ nor its negation is proved by the supplied record.}\\[1mm]
\text{The weakest clean additional target identified here is fixed-depth}\\
\text{trajectory-restricted clearing of finitely many top dyadic shells.}\\[1mm]
\text{Even the second shell still requires new chronological control.}
\end{array}}
\]

A claimed unconditional resolution at this point would necessarily be using, without proof, either a trajectory-restricted shell-clearing theorem or an interval-local direct-ancestor bound strong enough to imply aggregate contraction.