Don't search the internet. You are an adversarial mathematical referee. Two documents below prove several lemmas about a divisibility game. Your job is to try to BREAK each proof: find quantifier errors, hidden assumptions, degenerate witnesses, or arithmetic mistakes. For each numbered result, return a verdict — VALID / INVALID (with explicit counterexample or gap location) / REPAIRABLE (with the exact repair) — and end with an overall ruling on which results may be treated as established.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Attachment A defines, for fixed \(J\ge1\) and \(0<\eta<1\), the finite-shell clearing statement \(\mathrm{FSC}(J,\eta)\) (process dyadic shells \(S_j=(n/2^{j+1},n/2^j]\) in order after an \(o(n)\)-move prelude; while \(|Q_j(A)|>\eta|S_j|\), where \(Q_j\) is the live nonminimal shell population, play a currently legal lower element maximizing deletions from \(Q_j\); every turn counted; a fixed prefix-measurable tie-break) and proves: if \(\mathrm{FSC}(J,\eta)\) holds for every fixed \(J\) and \(\eta\), then \(L(n)=o(n)\) — deep shells are controlled by total size, so no growing-depth estimate is needed. Attachment B PROVES \(\mathrm{FSC}(1,\eta)\) for every fixed \(0<\eta<1\) (degree availability plus a disjointness bootstrap), and localizes the obstruction to the second shell: a previously chosen \(a\in(n/2,n]\) can satisfy \(d\mid a\) with \(a\) incomparable to a target \(x\in S_1\), killing the lower move \(d\) without killing \(x\) — external blockers absent from any rescaled smaller board.

Background facts you may take as given (proved elsewhere in the record): static completion (any primitive P with |P|=o(n) has o(n) minimal legal elements and P together with them is maximal); degree availability (at |A|=o(n), |R(A)|>=eta*n, some legal lower move kills (2eta-o(1))r(n) live upper targets, r(n)->infty); the coatom-ownership cumulative sparsity theorem (along any prefix of t=o(n) actual moves, only o(n) integers of any fixed interval (alpha*n, beta*n] ever become minimal legal); the FSC(1,eta) top-shell clearing theorem for every fixed 0<eta<1; and the monotone cap-entry normal form for the second-shell greedy phase (degree nonincreasing, degree-sum at most |S_1|).

Audit these results in Document 1 (referred to by its section numbers): (R1) Lemma 1, legal divisors of a legal target form an upset; (R2) Lemma 2, minimal-root equivalence of the greedy move; (R3) Corollary 3, a T-turn phase generates at least T distinct minimal-root events, and a linear tail forces at least cn of them to first become minimal after sparse cap entry; (R4) section 4, at least (c/2)n charged roots lie in ((c/2)n, n/4]; (R5) section 5, every linear tail contains a linear constant-cap suffix; (R6) section 6, the deadline formulation k_X(d) <= 1/(4c)+o(1) for divisors legal through a cn-turn tail. In Document 2: (R7) the second-shell degree lemma Delta_Q >>_eta loglog(n/t) via Turán–Kubilius restricted to (n/4,n/2] with truncation K=min(n^{1/8},(n/t)^{1/4}); (R8) the integrability insufficiency argument and the claimed compatible abstract trajectory. Also check Document 1's section 1-2 vacuity claim and repair (R0): is the eta_0 activation-suppression argument correct, and is the repaired statement genuinely equivalent to the second-shell clearing statement?

## Document 1

# Verdict

There are two mathematically different readings.

\[
\boxed{\text{As literally quantified, the displayed exclusion is true but vacuous.}}
\]

The omission is the lower bound \(\eta _0>0\), together with an explicit requirement that the top phase terminate uniformly in \(o(n)\) turns. Without those requirements, one may choose a fixed negative threshold. The top phase then never reaches its stopping condition before the game ends, so no active post-top position \(B_n\) exists.

Under the intended reading inherited from \(\mathrm{FSC}\),

\[
0<\eta _0<\eta/2
\]

with uniform \(o(n)\) termination, this collapse disappears. My argument below does **not** prove or disprove that repaired substantive assertion. It does, however, give an exact root-reduction theorem and a strong necessary normal form for any counterexample.

---

## 1. Literal proof by parameter-level activation suppression

Fix \(0<\eta<1\). The quoted statement requires only that the top phase be run at “some fixed”

\[
\eta _0<\eta/2.
\]

It does not explicitly require \(\eta _0>0\). Choose, before Prolonger is quantified,

\[
\eta _0=-1.
\]

This choice is fixed, deterministic, and independent of Prolonger and of the realized history.

Let the top-phase stopping time be the one dictated by the definition:

\[
\tau_0
=
\inf\left\{
t:
|Q_0(A_t)|\le \eta _0|S_0|
\right\}.
\]

For every position \(A_t\),

\[
|Q_0(A_t)|\ge0,
\]

whereas

\[
\eta _0|S_0|=-|S_0|<0.
\]

Therefore

\[
|Q_0(A_t)|\le\eta _0|S_0|
\]

is impossible at every finite nonterminal history. Hence the threshold stopping time is never attained.

There are now two possible phase conventions.

1. If a post-top position is defined only when the prescribed threshold stopping time is finite, there is no post-top position at all.
2. If every phase is forcibly terminated when the game itself terminates, its only possible post-top position is terminal. A terminal position is not an active second-shell position.

Under either convention, no Prolonger strategy can produce an active sparse position \(B_n\) **after** this top phase. In particular, no strategy can produce such a \(B_n\) followed by a linear capped tail.

Thus the quantified nonexistence assertion holds:

\[
\boxed{\text{No prohibited witness exists.}}
\]

This completes the literal proof. It is a combination of **parameter-level vacuity** and **top-phase delay/activation suppression**.

Notice that fixing \(\mathcal T_n\) and \(\prec_n\) before Prolonger is quantified does not close this particular loophole: the defective stopping rule itself is fixed before Prolonger.

---

## 2. Exact repair

The substantive statement should say the following.

> For every fixed \(0<\eta<1\), choose and fix a number
> \[
> 0<\eta _0<\eta/2,
> \]
> for example \(\eta _0=\eta/4\). Fix the complete prelude, its stopping rule, the top-phase stopping rule, and the prefix-measurable tie-break before Prolonger is quantified. Require that, uniformly against every Prolonger strategy, the prelude and top phase terminate after \(o(n)\) actual moves. Then there do not exist a constant \(c>0\), an infinite sequence \(n_k\to\infty\), a function \(H(n_k)\to\infty\), and finite on-trajectory post-top times \(b_k\), lying inside the active second-shell phase, such that
> \[
> |A_{b_k}|=o(n_k),\qquad
> |Q_1(A_{b_k})|>\eta|S_1|,
> \qquad
> \Delta_{Q_1}(A_{b_k})\le H(n_k),
> \]
> and the next at least \(c n_k\) Shortener turns all occur while the phase remains active and the degree remains at most \(H(n_k)\).

This repair explicitly supplies:

\[
0<\eta _0<\eta/2,
\]

uniform finite \(o(n)\) activation, a realized on-policy position, a fixed positive constant behind \(\Omega(n)\), and the correct quantifier order.

With this repair, the negative-\(\eta _0\) proof is unavailable. The statement becomes precisely the substantive \(\mathrm{FSC}(2,\eta)\) problem isolated in Attachment C.

---

# 3. An exact root reduction for the repaired problem

Although it does not by itself exclude the tail, the following observation substantially sharpens what such a tail must do.

For a current position \(A\), a target set \(Q=Q_1(A)\), and a legal \(d\le n/4\), write

\[
N_Q(d)=\{x\in Q:d\mid x\}.
\]

## Lemma 1: legal divisors form an upset

Let \(x\) be legal. If

\[
d\mid e\mid x
\]

and \(d\) is legal, then \(e\) is legal.

### Proof

Suppose instead that \(e\) is illegal. Then some chosen \(a\in A\) is comparable with \(e\).

If \(a\mid e\), then

\[
a\mid e\mid x,
\]

contradicting the legality of \(x\).

If \(e\mid a\), then

\[
d\mid e\mid a,
\]

contradicting the legality of \(d\).

Both possibilities are impossible. Therefore \(e\) is legal. \(\square\)

Thus, inside the divisor lattice of a legal target, the legal divisors constitute an upper order ideal.

## Lemma 2: every greedy move is equivalent to a minimal legal root

Suppose Shortener’s prescribed move \(d\) has maximum current degree

\[
|N_Q(d)|=\Delta_Q.
\]

Choose, by finite descent, a divisibility-minimal legal element \(r\) satisfying

\[
r\mid d.
\]

Then

\[
r\in\mathcal M(A)
\]

and

\[
N_Q(r)=N_Q(d).
\]

### Proof

Certainly

\[
N_Q(d)\subseteq N_Q(r),
\]

because \(r\mid d\).

But \(r\) is itself a legal candidate move. By maximality of the degree of \(d\),

\[
|N_Q(r)|\le \Delta_Q=|N_Q(d)|.
\]

The inclusion and the cardinality inequality force equality:

\[
N_Q(r)=N_Q(d).
\]

The choice of \(r\) makes it minimal legal. \(\square\)

Because every \(x\in S_1\) is larger than every proper divisor used by the policy, selecting \(d\) removes from \(Q\) exactly its multiples. Consequently, as far as the current shell is concerned, selecting \(d\) has exactly the same deletion set as selecting \(r\).

Moreover, the selected \(d\) permanently kills \(r\), since \(r\mid d\). Hence the roots charged to different Shortener turns are distinct.

## Corollary 3: a linear tail requires linearly many minimal-root events

If a second-shell phase contains \(T\) Shortener turns, then during those turns there are at least \(T\) distinct integers which are minimal legal immediately before their charged turns.

In particular, a counterexample tail of length

\[
T\ge cn
\]

requires at least \(cn\) distinct minimal-root events.

At its sparse entry position \(B_n\), static completion gives only

\[
|\mathcal M(B_n)|=o(n).
\]

Therefore all but \(o(n)\) of the charged roots must become minimal **after** entry into the capped tail.

This rules out an interpretation in which Prolonger merely rotates the greedy policy among a fixed sparse family of roots. A real counterexample must generate new minimal roots at a linear cumulative rate once the trajectory has left its sparse initial segment.

---

## 4. A fixed macroscopic interval must contain linearly many charged roots

Every charged root is at most \(n/4\). Assume \(T\ge cn\). Since each Shortener move deletes at least one target,

\[
c\le\frac14+o(1).
\]

There are at most \(cn/2\) integers not exceeding \(cn/2\). Therefore, among the \(cn\) distinct charged roots, at least

\[
\frac c2n
\]

lie in the fixed interval

\[
\left(\frac c2n,\frac n4\right].
\]

Thus any linear counterexample has the stronger property

\[
\boxed{
\text{linearly many distinct integers in one fixed macroscopic interval
become minimal legal during the tail.}
}
\]

This interfaces exactly with the cumulative sparsity theorem in Attachment D. That theorem shows that only \(o(n)\) such events can occur during an \(o(n)\)-move prefix. Hence the linear family above cannot be created during cap entry. It must be created after a positive linear number of actual moves have accumulated.

That is why cumulative sparse-prefix control does not alone prove exclusion.

---

# 5. Every linear tail contains a linear fixed-cap suffix

There is another useful sharpening that does not appear to require a growing cap.

Suppose the phase has \(T\ge cn\) Shortener turns. From the monotone-degree lemma,

\[
\sum_{t<T}\Delta_t\le |S_1|=\frac n4+O(1),
\]

and \(\Delta_t\) is nonincreasing.

Fix an integer \(D\ge1\). The number of turns with \(\Delta_t>D\) is at most

\[
\frac{|S_1|}{D+1}
\le
\frac{n}{4(D+1)}+O(1).
\]

Since the degree is nonincreasing, all such turns form an initial segment. Choose \(D=D(c)\) so large that

\[
\frac1{4(D+1)}<\frac c2.
\]

Then the final

\[
\frac c2n-O(1)
\]

turns satisfy the **fixed** cap

\[
\Delta_t\le D.
\]

Therefore:

\[
\boxed{
\text{A linear growing-cap counterexample necessarily has a linear
constant-cap suffix.}
}
\]

This does not contradict the accepted fixed-cap entry theorem. The constant-cap suffix need only begin after as many as

\[
\frac{n}{4(D+1)}
\]

turns, which is a small but fixed positive fraction of \(n\), not \(o(n)\). By that time the position need not be sparse. This is the exact boundary between the existing fixed-cap no-entry theorem and the required exclusion.

---

# 6. A deadline formulation for the final survivors

Let \(Q_T\) be the target population after a prefix of \(T\) active tail turns, and put

\[
X=Q_T.
\]

For a lower integer \(d\), define its incidence with the final survivors by

\[
k_X(d)=|\{x\in X:d\mid x\}|.
\]

Because legality and membership in \(Q\) only disappear,

\[
X\subseteq Q_t
\]

for every earlier time \(t\).

Suppose \(d\) remains legal for the first \(s\) Shortener positions of this interval. Then on each of those positions,

\[
\Delta_t\ge k_X(d).
\]

Consequently,

\[
s\,k_X(d)
\le
\sum_{t<s}\Delta_t
\le |S_1|.
\]

Thus every divisor \(d\) of many final survivors has an early blocking deadline:

\[
\boxed{
s\le\frac{|S_1|}{k_X(d)}.
}
\]

If \(d\) stays legal for the entire \(T\)-turn interval, then

\[
T\,k_X(d)\le |S_1|.
\]

For a linear interval \(T\ge cn\), this implies

\[
k_X(d)\le \frac1{4c}+o(1)
\]

for every divisor that remains legal throughout.

So a counterexample strategy must schedule blockers early enough to meet simultaneously all these incidence-dependent deadlines.

The remaining obstruction is that one chosen move can meet many deadlines at once: if it is divisible by many currently legal roots, it can make all of them illegal while leaving their targets alive. That is exactly the direct-ancestor batch phenomenon. The deadline system therefore isolates the missing assertion but does not, by itself, prove that the schedule is impossible.

---

# 7. What this resolves—and what it does not

The exact displayed sentence is settled by the negative-\(\eta _0\) witness:

\[
\boxed{\text{It is true for a degenerate activation-suppression reason.}}
\]

This literal resolution does **not** prove \(\mathrm{FSC}(2,\eta)\), because it prevents the second-shell phase from being validly activated. It consequently says nothing about \(L(n)\), and it says nothing about whether a batch-aware or otherwise different Shortener policy succeeds.

For the repaired positive-threshold statement, the root reduction proves that a counterexample must simultaneously exhibit all of the following:

\[
\begin{gathered}
\text{a sparse growing-cap entry},\\
\text{a linear constant-cap suffix after the position is no longer sparse},\\
\text{linearly many newly created minimal roots in a fixed macroscopic interval},\\
\text{and a blocker schedule satisfying every final-survivor deadline.}
\end{gathered}
\]

The accepted direct-ancestor examples explain why none of those conditions alone is contradictory.

The legal-divisor upset lemma, root reduction, fixed-cap-suffix reduction, and deadline inequality apply without change to any fixed deeper shell. They therefore **iterate as localization statements**. They do not give a finite-shell induction: in deeper shells, roots can be destroyed by elements from every previously processed shell, so the same batch-deadline obstruction only becomes more complicated.

Hence the final scope is:

\[
\boxed{
\begin{array}{l}
\textbf{Literal statement: proved, but vacuously, by the missing condition }\eta_0>0.\\[1mm]
\textbf{Exact repair: require }0<\eta_0<\eta/2\textbf{ and uniform }o(n)\textbf{ activation.}\\[1mm]
\textbf{Repaired statement: not decided by this proof; the remaining issue is}\\
\textbf{chronological batch blocking of linearly many newly exposed roots.}
\end{array}}
\]
## Document 2

# Verdict

I do **not** have a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]

The supplied results leave a genuine mathematical gap. Filling it would require a new chronology-sensitive theorem controlling divisor refinement along the realized trajectory. Treating the static-completion theorem, degree divergence, or the capped-state results as though they already supplied that theorem produces a false proof.

Below is the precise obstruction, together with a further shell-specific estimate that can be proved unconditionally but still falls short.

---

## 1. Why static completion does not finish the upper bound

Write
\[
\mu_n(\alpha)=
\max_{\substack{P\text{ primitive}\\ |P|\le \alpha n}}
\frac{|\mathcal M(P)|}{n}.
\]
The static-completion theorem says that for every \(\alpha_n\to0\),
\[
\mu_n(\alpha_n)\longrightarrow0.
\]

Suppose a shell contains \(q\ge c n\) live nonminimal targets. Every such target is divisible by a minimal legal element. Hence
\[
\Delta_Q(A)\ge \frac{|Q|}{|\mathcal M(A)|}
   \ge \frac{c}{\mu_n(\alpha)}
\]
as long as \(|A|\le \alpha n\).

It is tempting to conclude that greedy deletion clears the shell in
\[
O\!\left(n\mu_n(\alpha)\right)
\]
turns. But for the argument to remain inside the region \(|A|\le\alpha n\), one needs
\[
\mu_n(\alpha)=o(\alpha).
\]
That is exactly the strengthened modulus which the interval-blocker construction refutes. A behavior such as
\[
\mu_n(\alpha)\asymp \frac1{\log(1/\alpha)}
\]
is entirely compatible with static completion, but then
\[
n\mu_n(\alpha)\gg \alpha n.
\]
The argument exits its sparse regime before it has cleared a fixed fraction of the shell.

The same problem appears in the capped-tail normal form. Cap entry at threshold \(H\) occurs only after as many as \(O(n/H)\) turns. At that point,
\[
|Q|\le H|\mathcal M(A)|.
\]
To contradict \(|Q|\ge c n\), static completion would have to give
\[
|\mathcal M(A)|=o(n/H),
\]
not merely \(o(n)\). Equivalently one would need
\[
H\,\mu_n(C/H)\longrightarrow0,
\]
which is again false for the interval-blocker modulus.

So the apparently short proof from “minimal cones cover \(Q\)” contains a substantive, not cosmetic, gap.

---

## 2. A valid chronology-sensitive second-shell estimate

There is nevertheless a stronger shell-local degree statement than the bare static argument suggests.

### Lemma

Fix \(\eta>0\). Let \(A\) be a primitive position with
\[
t=|A|=o(n),
\]
and let
\[
Q\subseteq (n/4,n/2]
\]
be a set of legal integers satisfying \(|Q|\ge\eta n\). Then some legal \(d\le n/4\) divides at least
\[
c_\eta\log\log\frac nt
\]
members of \(Q\), with the usual harmless truncation when \(t\) is extremely small.

Thus, at a sparse prefix,
\[
\Delta_Q(A)\gg_\eta \log\log(n/t).
\]

### Proof

Set
\[
K=\min\left\{n^{1/8},\left(\frac nt\right)^{1/4}\right\},
\]
interpreting \(K=n^{1/8}\) if \(t=0\). Since \(t=o(n)\), we have \(K\to\infty\), and
\[
K^2t=o(n).
\]

For \(x\in Q\), let
\[
\omega_K(x)=\#\{p\le K:p\text{ prime and }p\mid x\}.
\]
Put
\[
\lambda_K=\sum_{p\le K}\frac1p
          =\log\log K+O(1).
\]

The standard Turán–Kubilius estimate, restricted to the fixed interval \((n/4,n/2]\), gives
\[
\sum_{n/4<x\le n/2}
   \bigl(\omega_K(x)-\lambda_K\bigr)^2
   =O(n\lambda_K).
\]
Consequently,
\[
\#\left\{x\in(n/4,n/2]:
  \omega_K(x)<\frac{\lambda_K}{2}\right\}
  =O\left(\frac n{\lambda_K}\right)=o(n).
\]
Since \(|Q|\ge\eta n\),
\[
\sum_{x\in Q}\omega_K(x)
   \ge c_\eta n\lambda_K. \tag{1}
\]

For every incidence \((x,p)\) counted on the left, consider the coatom
\[
d=\frac{x}{p}.
\]
Because \(x\le n/2\) and \(p\ge2\),
\[
d\le n/4.
\]

We bound the incidences for which \(d\) is illegal. Since \(x\) itself is legal, illegality of \(d\) cannot be caused by a chosen \(a\in A\) satisfying \(a\mid d\), because then \(a\mid x\). Therefore there is an \(a\in A\) such that
\[
d\mid a.
\]
Write
\[
a=dr,\qquad x=dp.
\]
Then
\[
x=\frac{ap}{r}.
\]
Because \(x>n/4\) and \(a\le n\),
\[
r=\frac{ap}{x}<4p\le4K.
\]

For fixed \(a\) and \(p\), there are fewer than \(4p\) possible integers \(r\), and each \(r\) determines \(x=ap/r\). Hence a fixed \(a\) can be responsible for at most
\[
\sum_{p\le K}4p
 \le 4K\pi(K)
 \le 4K^2
\]
blocked coatom incidences. Summing over \(a\in A\), the total number of blocked incidences is at most
\[
4K^2t=o(n). \tag{2}
\]

Combining (1) and (2), the number of incidences \((x,d)\) with \(x\in Q\), \(d\mid x\), and \(d\) legal is
\[
\ge c_\eta n\lambda_K-o(n)
 \gg_\eta n\log\log K.
\]
There are at most \(n/4\) possible integers \(d\le n/4\). Therefore one legal \(d\) occurs in at least
\[
c'_\eta\log\log K
   =\Omega_\eta\!\left(\log\log\frac nt\right)
\]
of these incidences. ∎

---

## 3. Why even this estimate does not prove \(o(n)\)

Suppose the second-shell population stays linear up to time \(T=\varepsilon n\). The lemma forces approximately
\[
\sum_{t\le \varepsilon n}
  \log\log\frac nt
\]
direct deletions, up to constant factors.

After dividing by \(n\), the corresponding continuous quantity is
\[
\int_0^\varepsilon
   \log\log\frac1s\,ds.
\]
As \(\varepsilon\downarrow0\),
\[
\int_0^\varepsilon
   \log\log\frac1s\,ds
   =
   \varepsilon\log\log\frac1\varepsilon
   +O\!\left(
      \frac{\varepsilon}{\log(1/\varepsilon)}
   \right)
   \longrightarrow0.
\]

Thus the guaranteed accumulated deletion area through an arbitrarily small linear prefix is itself an arbitrarily small fraction of \(n\). The divergence of the instantaneous degree is **integrable** at the sparse endpoint.

At cap-entry time \(t\asymp n/H\), the lemma gives only
\[
\Delta_Q(A)\gg\log\log H.
\]
This is perfectly compatible with the capped-tail condition
\[
\Delta_Q(A)\le H,
\]
because
\[
\log\log H=o(H).
\]

So this chronology-sensitive improvement still permits the following qualitative trajectory:

\[
\Delta_t\asymp \log\log(n/t),\qquad
|\mathcal M_t|\asymp
\frac{n}{\log\log(n/t)},\qquad
|Q_t|\asymp n.
\]

For every \(t=o(n)\), the minimal-root population is \(o(n)\), the degree tends to infinity, and the exact-only population can remain \(o(n)+t\); nevertheless the total accumulated area through \(\varepsilon n\) turns can be too small to contract \(Q\) by a fixed factor. This is an abstract trajectory rather than an actual divisibility-game construction, but it proves that the accepted sparse-prefix estimates do not logically exclude a linear tail.

The missing ingredient must therefore be genuinely nonlocal: a halving theorem, a nonintegrable potential drop, or a chronology-sensitive ownership rule that prevents direct ancestors from repeatedly regenerating low-degree root classes.

---

## 4. Why the lower-bound machinery also does not disprove the claim

The established fortress result at cap \(H\) supplies only
\[
\Omega(n/H)
\]
future moves. If \(H\to\infty\), this remains \(o(n)\). It can establish an \(n^{1-o(1)}\) lower bound, but not a positive-density lower bound.

Taking \(H=O(1)\) would yield \(\Omega(n)\), but fixed-cap robust entry is ruled out. More generally, entry at cap \(H=o(r(n))\) with a linear upper reservoir is impossible.

The rank-\(k\) fan hierarchy also remains sublinear after optimizing \(k\):
\[
c_k\,\frac{n(\log\log n)^{k-1}}{\log n},
\qquad
c_k=2^{-k-2^{k-1}+1}.
\]
The doubly exponential decay in \(c_k\) prevents a growing-rank choice from reaching \(cn\).

Finally, a history that defeats maximum-degree or smallest-prime play is not a game lower bound. A disproof must produce one Prolonger strategy surviving **every** legal Shortener policy, including packet guards and fixed-density clearing moves. No supplied result gives such a strategy.

---

## 5. Exact status

A correct upper proof still needs something of the strength of the trajectory-restricted aggregate-excess halving assertion, or an alternative theorem that supplies comparable nonintegrable progress. In the second-shell formulation, it must rule out the capped tail after entry at \(t\asymp n/H\), despite the fact that:

\[
|\mathcal M(A)|\asymp n/H
\]
is compatible with static completion,

\[
\Delta_Q(A)\asymp \log\log H
\]
is compatible with all known degree estimates, and direct-ancestor refinements can be caused by single moves with very large lifetime multiplicity.

A correct disproof, on the other hand, must realize such a low-area trajectory inside the actual divisibility game against arbitrary Shortener play and then amplify it to \(\Omega(n)\), not merely \(n/H(n)\).

Accordingly, the honest mathematical conclusion is that the proposition
\[
\boxed{L(n)=o(n)}
\]
is **not resolved by the stated results**, and I did not obtain the missing unconditional proof or the required arbitrary-reply linear lower strategy. Claiming either conclusion would require asserting precisely the chronology theorem that remains unproved.