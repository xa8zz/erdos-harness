---
id: R111-rough-core-decomposition-negative
type: research
date: 2026-07-12
intent: >
  Full solution attempt with both promoted refutations (fixed-cap
  fortress entry impossible at cap o(r(n)); first-sweep ordered-shadow
  false) in the dossier: prove or disprove L(n) = o(n).
predecessors: []
action:
  kind: standalone
claim: >
  No unconditional proof or disproof. A rough-core decomposition lemma
  (post-peel decomposition by the H-rough part isolating future
  comparability) is valid but insufficient: component values can still
  sum linearly, and coupled peel depth invalidates a slowly growing
  sweep diagonalization. A natural weighted-shadow proof fails at the
  same point as prior attempts. Small-board minimax simulation and
  local game values on multiplier posets (run during the attempt)
  matched the analytical picture without revealing a new route. Every
  route that could be made rigorous stops at the same
  chronology-sensitive separator.
implications:
  - Fourth independent free-roam concurrence on the separator; the
    rough-core decomposition and multiplier-poset local values are
    reusable framing for the compression question.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R111-solution-attempt-post-promotions.md
---

# Verdict

\[
\boxed{\text{I do not have a valid unconditional proof or disproof of }L(n)=o(n).}
\]

After treating every result in the prompt as established and trying to close both directions, the supplied framework still leaves a genuine chronology-sensitive gap. Claiming either conclusion would require inserting a new assertion that is not proved by the listed facts and is not a formal consequence of them. 

What can be done rigorously is to sharpen the location of that gap.

## 1. A post-peel decomposition that is valid but insufficient

Here is one additional structural lemma.

### Rough-core decomposition lemma

Suppose \(A\) is a position at which every legal integer is greater than \(n/H\). For an integer \(x\), define its \(H\)-rough part by

\[
\rho_H(x):=\prod_{p>H}p^{v_p(x)}.
\]

Then any two comparable legal integers have the same \(H\)-rough part. Consequently the remainder of the game decomposes into fixed comparability components

\[
\mathcal C_r
 =
 \{x\in\mathcal L(A):\rho_H(x)=r\}.
\]

Moreover, no subsequent legal move in one \(\mathcal C_r\) can make an element of another \(\mathcal C_{r'}\) illegal.

#### Proof

Let \(x,y\) be legal and suppose \(x\mid y\). Because legality is monotone and every legal integer exceeds \(n/H\),

\[
\frac yx < \frac{n}{n/H}=H.
\]

Thus the quotient \(y/x\) has no prime divisor greater than \(H\). Hence

\[
v_p(x)=v_p(y)
\qquad (p>H),
\]

which gives \(\rho_H(x)=\rho_H(y)\).

The condition that every legal integer exceeds \(n/H\) persists for the rest of the game. Therefore the same argument applies at every later position. A move affects another legal integer only through comparability, so it affects only its own rough-core component. ∎

After factoring out \(r\), the component is a residual divisibility poset on \(H\)-smooth multipliers:

\[
\mathcal S_r
 =
 \{s:rs\in\mathcal L(A)\},
\qquad
rs\mid rt\Longleftrightarrow s\mid t.
\]

This decomposition removes cross-component chronology completely.

It does **not**, however, prove a sublinear continuation. The residual \(\mathcal S_r\) need not contain a legal bottom element, and it may have many incomparable minimal elements created by earlier blockers. An opponent can open such a component by preempting its bottom, after which the local game is another divisibility-antichain game on a scale of order \(H\). Summing the local values can still be linear. The private-carrier and quadratic-regeneration examples are concrete manifestations of precisely this phenomenon.

Thus rough-core decomposition converts the global problem into a sum of smaller residual games, but supplies no contraction of their total normalized value. Using an inductive estimate \(L(H)=o(H)\) here would be circular.

## 2. Why a natural weighted-shadow proof still fails

The one-sweep containment theorem gives

\[
\bigcup_{\ell>0}M_\ell
 \subseteq
 \operatorname{Sh}^{-}(K_0),
\]

where \(K_0\) is the set of first-layer roots advance-killed by Prolonger. Since the layers are disjoint,

\[
\sum_{\ell>0}|M_\ell|
 \le
 \left|\operatorname{Sh}^{-}(K_0)\right|.
\tag{1}
\]

A tempting repair is to use a rapidly decreasing weight. Fix \(s>1\) and put

\[
w(x)=\left(\frac nx\right)^s.
\]

For one root \(m>n/H\),

\[
\sum_{\substack{k\ge2\\km\le n/2}} w(km)
 \le
 \left(\frac nm\right)^s\sum_{k\ge2}\frac1{k^s}
 \le
 \bigl(\zeta(s)-1\bigr)H^s.
\]

Since \(w(x)\ge 2^s\) on \(x\le n/2\), this proves

\[
\left|\operatorname{Sh}^{-}(K_0)\right|
 \le C_s H^s |K_0|
 \le C_s H^s |M_0|.
\tag{2}
\]

But static completion yields only

\[
|M_0|=o(n)
\]

when \(H\to\infty\); it does not yield

\[
H^s|M_0|=o(n).
\]

There is no legitimate “take \(H\) sufficiently slowly” diagonalization here. A modulus such as

\[
|M_0|\asymp \frac{n}{\log H}
\]

is compatible with the qualitative static theorem, while

\[
H^s\frac{|M_0|}{n}
 \asymp
 \frac{H^s}{\log H}\longrightarrow\infty.
\]

More fundamentally, any weight that pays for every possible proper multiple of a root near \(n/H\) must pay at least order \(H\), because such a root can have order \(H\) proper multiples on the board. The verified linear raw-shadow construction shows that this is not merely an artifact of the estimate.

So neither inverse-power weights nor any other argument that dominates the entire raw shadow can close the problem.

## 3. The exact missing upper-bound statement

Let the first minimal layer after a peel be \(M_0\), and let \(K_0\) be its advance-killed part. Define the surviving descendant set

\[
\Sigma(K_0)
 =
 \left\{
 x\in\operatorname{Sh}^{-}(K_0):
 \begin{array}{l}
 x\text{ remains legal after the killing carriers,}\\
 \text{and }x\text{ subsequently appears in a minimal layer}
 \end{array}
 \right\}.
\]

The raw ordered-shadow statement

\[
|\operatorname{Sh}^{-}(K_0)|=o(n)
\]

is false. But that counterexample does not establish that \(|\Sigma(K_0)|\) is linear: a killing carrier can simultaneously eliminate large portions of its root’s raw shadow, and later Shortener moves can eliminate further descendants before they become minimal.

A sufficient theorem would be:

> There are \(H(n)\to\infty\) and a specified Shortener sweep policy such that, after the \(n/H\)-peel, against every Prolonger continuation,
> \[
> |\Sigma(K_0)|=o(n).
> \tag{SS}
> \]

Indeed, the one-sweep containment theorem would give

\[
\sum_{\ell<\lceil\log_2H\rceil}|M_\ell|
 \le |M_0|+|\Sigma(K_0)|
 =o(n).
\]

The peel costs \(O(n/H)=o(n)\) moves, the interleaved Prolonger moves are of the same order as the sweep moves, and after the last layer every legal integer is in the upper half. Static completion then finishes the game at \(o(n)\) total cost.

Equivalently, in the shell formulation it would suffice to prove a chronological direct-ancestor estimate of the form

\[
\operatorname{Anc}_X(t)
 \le
 o(X)+C\sum_{i<t}\Delta_i,
\tag{3}
\]

for one completely specified legal Shortener policy and at every relevant stopping time. The residual channel is already controlled by the atomic ledger and first-death accounting. It is the direct-ancestor term in (3) that remains uncontrolled.

None of the accepted facts proves either (SS) or (3):

- The all-orders witness inequality is static and can be saturated by one common low-lcm trace.
- Instantaneous Sperner bounds cannot be promoted to lifetime bounds.
- Frozen coded repairs do not have a bounded chronological increment.
- Root-indexed first blockers give a genuine lifetime estimate, but its factor is too large at the shallow levels where a linear mass can be generated.
- The linear raw-shadow counterexample does not track survival and therefore does not refute (SS).

That is the upper-bound separator.

## 4. Why the stated facts do not disprove \(L(n)=o(n)\)

A disproof requires a constant \(c>0\) and a Prolonger strategy satisfying

\[
L(n)\ge cn
\]

along an infinite sequence—or eventually for all large \(n\)—against **every** Shortener strategy.

The absorbing fortress at a growing cap \(H(n)\) yields only

\[
L(n)\ge \frac{|Q|}{H(n)}
       = n^{1-o(1)},
\]

which is still \(o(n)\) whenever \(H(n)\to\infty\). It therefore does not disprove the statement.

Obtaining a positive density from the fortress mechanism would require one of the following:

\[
H=O(1),
\]

which is excluded by the fixed-cap entry theorem, or a new amplification theorem converting a value \(n/H(n)\) into \(cn\). No such amplification is among the hypotheses.

Likewise, the ordering-robust raw-shadow construction proves only that Prolonger can create linearly many **potential** descendants under the particular sweep framework. It does not prove that a linear number survive as legal moves, and it does not provide a strategy against an arbitrary Shortener policy from the initial position.

Thus it does not supply a disproof either.

## Conclusion

The rigorous conclusion is not a truth-value resolution:

\[
\boxed{
\begin{array}{c}
\text{The supplied theory reduces the upper direction to surviving}\\
\text{direct-ancestor chronology, while all supplied lower mechanisms}\\
\text{stop at }n^{1-o(1)}\text{ rather than a positive linear density.}
\end{array}}
\]

A purported proof of \(L(n)=o(n)\) must establish something equivalent in strength to (SS), (3), or OA under an actual legal Shortener policy. A purported disproof must produce a policy-independent positive-density Prolonger strategy, not merely a growing-cap fortress, a linear raw shadow, or a history defeating one named Shortener policy.

I cannot honestly insert either missing theorem: every route I could make rigorous stops at that same chronology-sensitive separator.