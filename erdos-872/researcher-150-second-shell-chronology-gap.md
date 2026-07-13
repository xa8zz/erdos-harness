---
id: R150-second-shell-chronology-gap
type: research
date: 2026-07-12
intent: >
  Determine whether the game length L(n) of the divisibility-antichain game
  on {2,...,n} (Prolonger maximizing, Shortener minimizing, alternating
  legal moves until the position is maximal) satisfies L(n)=o(n), given a
  full compilation of established sublinear-regime facts, ruled-out
  mechanisms, and open shell-local statements.
predecessors: []
prompt: erdos-872/prompts/researcher-R150-solution-attempt-full-compilation.md
action:
  kind: standalone
claim: >
  No unconditional proof or disproof of L(n)=o(n) is obtained. The
  static-completion route to an upper bound is invalid: it requires the
  completion modulus mu_n(alpha) = max{|M(P)|/n : P primitive, |P|<=alpha n}
  to satisfy mu_n(alpha)=o(alpha) as alpha to 0, but the interval-blocker
  construction gives mu_n(alpha) asymp 1/log(1/alpha), which also defeats
  the capped-tail variant (needing H*mu_n(C/H)->0). A new second-shell
  lemma is proved: for a primitive position A with |A|=t=o(n) and any legal
  Q subset (n/4,n/2] with |Q|>=eta n, some legal d<=n/4 divides at least
  c_eta * log log(n/t) members of Q, i.e. Delta_Q(A) >>_eta log log(n/t);
  the proof restricts a Turan-Kubilius second-moment estimate for the
  count omega_K of prime factors <= K to the fixed interval (n/4,n/2], with
  K = min(n^{1/8}, (n/t)^{1/4}), bounding illegal-coatom incidences by
  4K^2 t = o(n). This lemma is nonetheless insufficient to force
  L(n)=o(n): the accumulated degree integral_0^eps log log(1/s) ds -> 0 as
  eps -> 0, so guaranteed deletion area through any linear-but-vanishing
  prefix eps*n is itself o(n); and at cap-entry time t asymp n/H the lemma
  gives only Delta_Q(A) >> log log H = o(H), compatible with the
  capped-tail condition Delta_Q(A) <= H. An abstract (not game-realized)
  trajectory with Delta_t asymp log log(n/t), |M_t| asymp n/log log(n/t),
  |Q_t| asymp n for all t=o(n) is exhibited as numerically compatible with
  every accepted sparse-prefix estimate. The missing ingredient is
  identified as a chronology-sensitive theorem, of the strength of the
  unproved trajectory-restricted aggregate-excess halving assertion or an
  equivalent nonintegrable-progress statement, that must exclude on the
  realized second-shell trajectory the persistence of a capped tail
  (Delta_Q(A) <~ H, |Q(A)| >= c n) beyond entry time t asymp n/H.
implications:
  - The static-completion / minimal-cone greedy route to an upper bound is
    closed for both its plain and capped-tail forms, since both require a
    modulus bound (mu_n(alpha)=o(alpha), or H*mu_n(C/H)->0) refuted by the
    same interval-blocker construction.
  - The new log log(n/t) second-shell degree lemma strengthens the prior
    r(n)-scale degree-availability fact to an explicit chronology-sensitive
    rate, but its time-integrated contribution vanishes on any eps*n-prefix,
    so it cannot by itself close the second-shell capped-tail exclusion.
  - Confirms that resolving L(n)=o(n) requires the aggregate-excess halving
    statement (or an equivalent nonintegrable chronology theorem), not
    further accumulation of sparse-prefix degree estimates.
  - The lower-bound machinery (fortress entry giving only n^{1-o(1)};
    rank-k fan hierarchy with doubly-exponentially-decaying constants
    c_k=2^{-k-2^{k-1}+1}) also fails to disprove L(n)=o(n), and no supplied
    result is a Prolonger strategy surviving every legal Shortener policy.
confidence_at_time: medium
strategy_dependence: independent
---

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