---
id: R125-growing-depth-modulus-obstruction
type: research
date: 2026-07-12
intent: >
  Independent full-solution attempt at the divisibility-game dichotomy
  L(n) = o(n) vs L(n) = Omega(n) on {2..n}, given the complete
  established/ruled-out record through the formulation-collapse
  catalogue.
predecessors: []
action:
  kind: standalone
claim: >
  No unconditional proof or disproof follows from the accepted record.
  New content: (1) the growing-depth obstruction made exact — a
  static-completion modulus mu_n(alpha) ~ alpha^a (any fixed 0<a<1) is
  fully compatible with the qualitative theorem, and under the sweep
  recurrence s_{j+1} <= s_j + 2 mu_n(s_j) the iterates from s_0 ~ 1/H
  behave as s_j ~ H^{-a^j}; at depth j = C loglog H one has a^j log H =
  (log H)^{1+C log a}, and for any prescribed C a small enough a makes
  the exponent negative, so s_j -> 1 and the cumulative-layer mass need
  not be o(n) — choosing H slowly cannot repair the coupled moduli;
  the missing statement (CL) is sup over legal replies of
  sum_{j<C loglog H}|M_j| = o(n) for some actual policy and some
  H -> infinity. (2) Exhaustive minimax of the isolated rank-r
  Boolean-cube saturation game for r = 1..6 gives values 1,2,2,4,4,8 —
  far below Sperner width, suggesting isolated cubes are much cheaper
  for the minimizing player than their width; but local game value is
  not hereditary under external deletions (removing a strategically
  important low element can increase the induced-poset value), so the
  computation does not globalize past the direct-ancestor channel.
  (3) The lower route stops at |Q|/H with H = exp(sqrt(loglog n)) as an
  explicit witness that n^{1-o(1)} continuation value is compatible
  with o(n); a disproof needs the full quantifier form: exists eps > 0
  such that for every Shortener strategy some Prolonger strategy forces
  eps n moves.
implications:
  - Any bounded-depth-compression dispatch must produce a uniform
    iterated completion modulus, not iterate the qualitative theorem;
    the alpha^a family is the concrete admissible enemy.
  - The rank-1..6 cube minimax values 1,2,2,4,4,8 are a new sandbox
    fact worth independent recomputation before any load-bearing use.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R125-solution-attempt.md
---

# Verdict

I do **not** obtain a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]

The supplied results isolate the problem very sharply, but they still leave a genuine growing-depth/chronological assertion unproved. In particular, neither the static-completion theorem nor the new deep-layer theorem closes that assertion by a diagonal choice of \(H\). I treat all facts and counterexamples in the uploaded record as stipulated. 

The best unconditional conclusion remains
\[
c_\delta\,\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le
(0.1897123371+o(1))n.
\]

What follows is the precise obstruction to the most plausible apparent proof.

---

## 1. Why the deep-layer theorem still does not finish the upper bound

For a primitive position \(P\), write \(\mathcal M(P)\) for its minimal legal elements, and introduce the worst-case static-completion modulus
\[
\mu_n(\alpha)
:=
\frac1n
\max\left\{
|\mathcal M(P)|:
P\subseteq\{2,\ldots,n\}\text{ primitive},\ |P|\le \alpha n
\right\}.
\]

The accepted static-completion theorem is equivalent to the qualitative assertion

\[
\alpha_n\longrightarrow0
\quad\Longrightarrow\quad
\mu_n(\alpha_n)\longrightarrow0.
\tag{1}
\]

Now fix a peel parameter \(H\to\infty\). After the \(n/H\)-move peel, let \(A_0\) be the resulting position. Ignoring harmless factors of two from alternation,
\[
\frac{|A_0|}{n}=O\!\left(\frac1H\right).
\]

Let \(M_j=\mathcal M(A_j)\) be the minimal legal layer at the beginning of sweep \(j\). During the sweep of \(M_j\), Shortener uses at most \(|M_j|\) turns, and Prolonger has at most the same number of replies. Hence, if
\[
s_j:=\frac{|A_j|}{n},
\]
then uniformly over all replies,
\[
\frac{|M_j|}{n}\le \mu_n(s_j),
\qquad
s_{j+1}\le s_j+2\mu_n(s_j)+o(1).
\tag{2}
\]

For every **fixed** \(J\), (1) and (2) do imply
\[
\sum_{j<J}|M_j|=o(n).
\tag{3}
\]
This follows by induction: \(s_0=o(1)\), and whenever \(s_j=o(1)\), (1) gives \(\mu_n(s_j)=o(1)\).

The deep-layer theorem says that layers beyond
\[
J_H=C\log\log H
\]
have total size \(o(n)\). Thus an apparent proof would combine (3) with \(J=J_H\).

That step is invalid, because \(J_H\to\infty\).

### The exact modulus obstruction

The qualitative assertion (1) permits, for example, a modulus behaving like
\[
\mu_n(\alpha)\asymp \alpha^a
\tag{4}
\]
for any fixed \(0<a<1\). This is completely consistent with
\(\mu_n(\alpha_n)\to0\) whenever \(\alpha_n\to0\).

If the recurrence (2) behaves at this permitted scale, then while \(s_j\) is small,
\[
s_{j+1}\asymp s_j^a.
\]
Starting from \(s_0\asymp H^{-1}\), iteration gives, schematically,
\[
s_j\asymp H^{-a^j}.
\tag{5}
\]

At depth \(j=C\log\log H\),
\[
a^j
=
\exp\!\bigl(C\log\log H\cdot\log a\bigr)
=
(\log H)^{C\log a}.
\]
Consequently
\[
a^j\log H
=
(\log H)^{\,1+C\log a}.
\tag{6}
\]

For any prescribed constant \(C\), one may choose \(a>0\) small enough that
\[
1+C\log a<0.
\]
Then the expression in (6) tends to zero, and the right side of (5) need not tend to zero at all:
\[
H^{-a^j}
=
\exp(-a^j\log H)
\longrightarrow 1.
\]

This is not a construction of actual bad game positions. It proves something narrower but decisive: the qualitative fixed-prefix theorem does **not** imply growing-depth uniformity through \(C\log\log H\) layers. Choosing \(H\) “sufficiently slowly” does not solve the coupled problem, because:

- making \(H\) larger makes the initial position \(A_0\) smaller;
- but it simultaneously increases the number \(C\log\log H\) of layers that must be controlled;
- the unknown completion modulus can deteriorate under iteration faster than this tradeoff permits.

Thus the missing assertion remains

\[
\boxed{
\sup_{\text{legal Prolonger replies}}
\sum_{j<C\log\log H}
|M_j|
=o(n)
}
\tag{CL}
\]

for some actual Shortener policy and some \(H(n)\to\infty\).

The static-completion and deep-layer theorems do not by themselves prove \((\mathrm{CL})\).

---

## 2. Why the one-sweep results do not supply \((\mathrm{CL})\)

The one-sweep containment theorem shows that later minima lie in the lower shadow of the first advance-killed roots. That is an exact and useful localization.

But both increasingly strong possible consequences have been ruled out:

1. The raw shadow can be linear against every ordering of the first layer.
2. Even a linear part of that shadow can remain legal through the first sweep.

The surviving-shadow construction still does not give a lower bound, because its quotient cones expose only \(o(n)\) next-layer minima. Thus it demonstrates that “the killing carriers destroy their own shadow” is insufficient, but it does not show that the surviving reservoir unfolds into linearly many actual moves over subsequent layers.

Conversely, the fact that the next layer is \(o(n)\) in that construction does not prove the upper bound: \(C\log\log H\) successive \(o(n)\) layers can still have linear total mass without a uniform modulus, exactly as (2)–(6) illustrate.

So the unresolved issue is genuinely cumulative, not first-sweep-local.

---

## 3. Why the chronological batch machinery also stops short

The alternative upper-bound route is the shell statement
\[
|Q_X(\mathrm{end})|
\le
\frac12 |Q_X(\mathrm{start})|
+\frac{X}{h^2}.
\tag{OA}
\]

Its implication \( (\mathrm{OA})\Rightarrow L(n)=o(n)\) is accepted. The residual-lift channel, trace normal form, prime-product guarding, atomic ledger, and frozen repair results close several substantial pieces.

The remaining failure is the direct-ancestor channel:

- an earlier move can make a future local carrier illegal;
- treating that carrier as if it had been played removes more local faces than the actual blocker removes;
- later refinements can reveal descendants inheriting the old blocker;
- instantaneous Sperner bounds therefore do not furnish lifetime capacities.

A policy-independent baseline theorem is false because of off-path capped fortresses. Restricting the theorem to states reached by the policy removes that counterexample, but then the required capped-state contraction is precisely the missing trajectory-specific part of \((\mathrm{OA})\).

Thus this route currently reduces the problem to a uniform chronological first-exit or direct-ancestor estimate; it does not prove one.

### A local computation does not remove this obstruction

I also exhaustively solved the isolated Boolean-cube game for ranks \(1\) through \(6\). The minimax values are
\[
1,\ 2,\ 2,\ 4,\ 4,\ 8.
\]
This suggests that an isolated cube may admit a much smaller Shortener value than its Sperner width.

Even a proof of the apparent formula would not immediately globalize. An external multiple can preempt a recommended cube move while leaving many of its supersets legal. Local game value is not hereditary under such deletions: deleting a strategically important low element can increase the saturation-game value of the remaining induced poset. Controlling precisely those external preemptions is again the direct-ancestor problem.

---

## 4. Why the available lower-bound mechanisms do not disprove \(o(n)\)

The strongest fortress statement at a growing cap \(H(n)\to\infty\) gives a continuation lower bound of the scale
\[
\frac{|Q|}{H}.
\]
For a linear reservoir this is
\[
\frac{n}{H}=n^{1-o(1)}
\]
when \(H=n^{o(1)}\), but it may still be \(o(n)\). For example,
\[
H=\exp(\sqrt{\log\log n})
\]
gives \(n/H=n^{1-o(1)}\) while
\[
\frac{n/H}{n}=\frac1H\longrightarrow0.
\]

To obtain a disproof, Prolonger would need one of the following:

\[
H=O(1)
\quad\text{with a linear robust reservoir},
\]
or an amplification theorem converting \(n/H(n)\) moves into \(\varepsilon n\) moves.

The stipulated fixed-cap entry theorem rules out the first reservoir mechanism against an appropriate Shortener policy. No valid amplification theorem is supplied.

Likewise:

- the raw-shadow counterexample handles every ordering of one particular minimal layer, not every Shortener strategy;
- the surviving-shadow theorem preserves a linear legal set for one sweep but does not force a linear sequence of later minima;
- examples defeating literal maximum-degree or minimal-layer policies do not establish a lower bound against optimal Shortener play;
- off-policy fortress states cannot refute a trajectory-restricted Shortener theorem.

Hence there is no established \(\Omega(n)\) Prolonger strategy.

---

## 5. The exact unresolved alternatives

A proof of \(L(n)=o(n)\) would follow from either of these genuinely new results:

\[
\boxed{
\text{Growing-depth control }(\mathrm{CL})
}
\]

for the first \(C\log\log H\) induced minimal layers, or

\[
\boxed{
\text{trajectory-restricted shell contraction }(\mathrm{OA})
}
\]

including the direct-ancestor/capped-reservoir branch.

A disproof would require

\[
\boxed{
\exists\varepsilon>0\ 
\forall\text{ Shortener strategies}\ 
\exists\text{ a Prolonger strategy forcing at least }\varepsilon n
\text{ moves}.
}
\]

None of the stipulated constructions has this quantifier strength.

---

# Conclusion

The proposed statement has not been proved or disproved by the supplied machinery, and I did not find a new argument that closes its remaining chronological or growing-depth gap. In particular, the tempting deduction

\[
\text{“each fixed layer is }o(n)\text{”}
+
\text{“only }O(\log\log H)\text{ layers matter”}
\Longrightarrow
o(n)
\]

is invalid without a uniform iterated completion modulus.

Therefore the honest verdict is

\[
\boxed{
c_\delta\,\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le(0.1897123371+o(1))n,
\qquad
L(n)=o(n)\ \text{remains unresolved under the stated facts}.
}
\]

Any purported unconditional resolution at this point must insert a new theorem precisely at \((\mathrm{CL})\), at the trajectory-specific direct-ancestor branch of \((\mathrm{OA})\), or on the arbitrary-policy Prolonger side.