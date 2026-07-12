---
id: R108-post-audit-honest-bracket
type: research
date: 2026-07-12
intent: >
  Full solution attempt from the audit-confirmed state (one-sweep
  containment, prime-product guard, root-indexed blocker, terminal-
  witness exclusion): prove or disprove L(n) = o(n) for the divisibility
  antichain game on {2..n}.
predecessors: []
action:
  kind: standalone
claim: >
  No unconditional proof or disproof; every prospective closure requires
  a chronology-sensitive statement not among the accepted facts. The
  strongest justified conclusion remains the bracket
  c_delta n(loglog n)^2/log n <= L(n) <= (0.1897123371+o(1))n. A valid
  sublinear proof must establish a chronology-stable online inequality
  (ordered-shadow or ancestor-harvest class) under an executable
  Shortener policy; a valid disproof must give epsilon > 0 and a
  Prolonger strategy achieving epsilon*n against EVERY Shortener
  strategy on an infinite n-sequence — a growing-cap fortress, a long
  history against one named policy, or a static linear reservoir does
  not meet that quantifier. The dichotomy is concentrated in the
  direct-ancestor / ordered-shadow chronology problem.
implications:
  - Third independent free-roam concurrence (with the zoom-out rounds)
    that the residual gap is exactly the chronology problem; no new
    routes surfaced.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R108-solution-attempt-post-audit.md
---

# Verdict

I do **not** obtain a valid unconditional proof or disproof of

\[
L(n)=o(n).
\]

After treating every listed theorem and counterexample as a hard constraint, every prospective closure still requires a new chronology-sensitive statement that is not among the accepted facts. Conversely, the available lower-bound mechanisms do not give the policy-independent positive-density strategy needed to refute sublinearity. I will not disguise either missing statement as a proved lemma.

Thus the strongest unconditional conclusion justified by the supplied material remains

\[
\boxed{
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)\le
\bigl(0.1897123371+o(1)\bigr)n
\qquad(0<\delta<1/4).
}
\]

Both \(L(n)=o(n)\) and \(\limsup L(n)/n>0\) remain compatible with these bounds. The full theorem stack and the ruled-out mechanisms are those in the uploaded problem statement. 

What follows is the precise point at which an unconditional argument stops.

---

## 1. The strongest valid upper-bound reduction

Fix \(H=H(n)\to\infty\). Shortener first performs the accepted peel, making every legal integer exceed \(n/H\), in at most \(n/H=o(n)\) Shortener moves.

Let \(D_0\) be the resulting legal lower set and let

\[
M_0=\min_{\mid}D_0
\]

be its divisibility-minimal layer. During the first sweep, Shortener orders \(M_0\) and plays the first member still legal. Let \(K_0\subseteq M_0\) be the roots advance-killed by a proper-multiple move before Shortener selects them.

Define

\[
\operatorname{Sh}^{-}(K_0)
=
\bigcup_{m\in K_0}
\left\{
2m,3m,\ldots,
\left\lfloor\frac{n}{2m}\right\rfloor m
\right\}.
\]

The accepted one-sweep containment gives

\[
\boxed{
\sum_{j<J}|M_j|
\le |M_0|+\bigl|\operatorname{Sh}^{-}(K_0)\bigr|,
\qquad
J=\lceil\log_2H\rceil .
}
\tag{1}
\]

Here is the short reason the containment is exact. Every later legal minimum \(x\) lies above some \(m\in M_0\). Had \(m\) been selected exactly, every multiple of \(m\), including \(x\), would remain illegal forever. Hence \(m\) must have been advance-killed upward, so \(m\in K_0\), and \(x\) is a proper multiple of \(m\).

The static-completion theorem yields

\[
|M_0|=o(n),
\]

uniformly over the post-peel histories. Therefore (1) reduces the whole growing-depth problem to

\[
\boxed{
\bigl|\operatorname{Sh}^{-}(K_0)\bigr|=o(n)
}
\tag{OS}
\]

under some executable ordering policy for \(M_0\), against every legal Prolonger response.

This is a genuine advance over separately controlling \(\log H\) layers: all later regeneration is compressed into one chronological object. But it is still not a proof of \((OS)\).

---

## 2. Why \(|M_0|=o(n)\) does not control its shadow

The elementary weighted estimate is

\[
\bigl|\operatorname{Sh}^{-}(K_0)\bigr|
\le
\sum_{m\in K_0}
\left(
\left\lfloor\frac{n}{2m}\right\rfloor-1
\right)
<
\frac H2|K_0|.
\tag{2}
\]

Since the static theorem gives only \(|K_0|\le |M_0|=o(n)\), the right side of (2) need not be \(o(n)\).

This is not merely an issue of writing \(H\) “slowly.” For example, the abstract behavior

\[
|M_0|\asymp \frac{n}{\log H}
\]

is fully consistent with \(|M_0|=o(n)\) for every \(H\to\infty\), while

\[
H|M_0|/n\asymp \frac{H}{\log H}\longrightarrow\infty.
\]

There are also perfectly legitimate antichains of \(o(n)\) roots with linear **weighted** multiple mass. For instance, the interval

\[
M=\left(\frac nH,\frac{2n}{H}\right]
\]

is an antichain because the ratio of two distinct members is strictly below \(2\), while

\[
\sum_{m\in M}
\left\lfloor\frac{n}{2m}\right\rfloor
=
\Theta(n).
\]

This does not by itself construct a reachable counterexample to \((OS)\), because union overlap and online order matter. It does prove that no argument using only \(|M_0|=o(n)\) and individual shadow sizes can close the problem.

---

## 3. The exact nonuniformity in the peel-plus-completion route

Let

\[
\mu_n(\alpha)=
\sup\left\{
\frac{|\mathcal M(P)|}{n}:
P\text{ primitive},\ |P|\le\alpha n
\right\}.
\]

The static-completion theorem says that for every sequence \(\alpha_n\to0\),

\[
\mu_n(\alpha_n)\longrightarrow0.
\tag{3}
\]

After the \(n/H\)-move peel, this gives a maximal completion \(C\) satisfying

\[
\frac{|C|}{n}
\le
\mu_n\!\left(O\!\left(\frac1H\right)\right)
=o(1).
\]

But the continuation lemma yields

\[
\frac{\text{remaining moves}}n
\le
(2H+1)\frac{|C|}{n}.
\tag{4}
\]

To derive \(o(n)\), one would need

\[
H\,\mu_n\!\left(O\!\left(\frac1H\right)\right)\longrightarrow0,
\tag{5}
\]

which is strictly stronger than (3). The model modulus

\[
\mu_n(1/H)=\frac1{\log H}
\]

satisfies (3) but violates (5).

So the following often-proposed inference is invalid:

\[
\text{completion has size }o(n)
\quad+\quad
H\to\infty\text{ slowly}
\quad\Longrightarrow\quad
H|C|=o(n).
\]

No diagonal choice of \(H\) follows from the qualitative theorem.

---

## 4. Why fixed-depth iteration also does not close

For every fixed \(j\), repeated use of static completion shows that the first \(j\) minimal sweeps cost \(o(n)\). But the required number of sweeps is

\[
J=\lceil\log_2H\rceil\to\infty.
\]

A modulus consistent with the static theorem can evolve schematically as

\[
x_{j+1}=\sqrt{x_j},
\qquad x_0=\frac1H.
\]

Then

\[
x_j=H^{-1/2^j}.
\]

Already at \(j\asymp\log_2\log H\), this is bounded away from zero, long before the \(\log_2H\) sweeps needed to exhaust all lower layers. Thus

\[
\text{every fixed number of sweeps costs }o(n)
\]

does not imply

\[
\text{a growing number of sweeps costs }o(n).
\]

The one-sweep containment removes this particular iteration problem, but replaces it by \((OS)\).

---

## 5. Why the shell/batch argument still has an uncovered channel

The canonical cube and atomic-ledger machinery genuinely controls residual lift deaths. At the maximal-divisor scale, one can make the number of residual-face failures per actual move negligible after normalizing by the number of lift tags.

It does **not** control direct ancestors.

There are two orientations:

\[
\kappa(F)\mid c
\]

for an ordinary residual blocker \(c\), and

\[
c\mid a_F
\]

for a direct ancestor that prevents the intended root or carrier from ever becoming active.

The atomic ledger gives a lifetime bound in the first orientation. In the second orientation, one old blocker can be inherited by \(H^{\Omega(1)}\) later descendant faces even when its divisor count is bounded. Therefore a bound such as

\[
\#\{\text{faces lost through }c\}
\le H^{o(1)}\tau(c)
\]

is false in the direct-ancestor channel.

The needed shell-level statement has the form

\[
\boxed{
\operatorname{Anc}_X(t)
\le
\varepsilon(H)X
+
C\sum_{i<t}\Delta_i
+
CHt,
\qquad \varepsilon(H)\to0,
}
\tag{AH}
\]

uniformly at every stopping time before shell halving, under a fully specified legal Shortener policy.

Here \(\operatorname{Anc}_X(t)\) is the residual shell mass whose canonical roots first disappear through direct ancestors. The accepted reductions show that \((AH)\), together with the already-controlled residual channel, would imply the online-area estimate and hence \(L(n)=o(n)\).

But neither maximum current degree nor the atomic ledger proves \((AH)\):

- One carrier can erase many latent roots while killing few or no current shell targets.
- A current target-degree potential therefore measures the wrong event.
- Generic batch repair is unavailable: two legal threats need not possess any common legal comparable move.
- Frozen repair bounds do not have the required Lipschitz property under later chronological insertions.

There is also a separate player-quantifier issue: fresh-batch persistence schedules **Prolonger’s** carrier moves. Those moves cannot be inserted into a Shortener upper-bound policy. Any proof using the theorem to make Shortener clear fresh batches reverses the mover quantifier.

---

## 6. Why the known lower route does not disprove sublinearity

The absorbing-fortress theorem is strong once entry occurs. If a linear reservoir \(Q\) is reached with degree cap \(H\), it gives

\[
V(A)\ge \frac{|Q|}{H}
\]

apart from the exact-only bank.

For \(H=H(n)\to\infty\), this yields only

\[
L(n)\ge \Omega\!\left(\frac n{H(n)}\right)=o(n)
\]

as a ratio statement. Even a bound conventionally written as

\[
L(n)\ge n^{1-o(1)}
\]

does not refute \(L(n)=o(n)\); \(n/\log n\) is itself \(n^{1-o(1)}\).

A disproof therefore needs at least one of the following:

\[
H=O(1)
\]

in a policy-independent robust-entry theorem, or a genuine amplification converting an \(n/H(n)\) tail into \(\varepsilon n\). Neither is supplied.

Likewise, defeating the literal maximum-degree or minimal-legal policy is not enough. A lower bound for the game value must survive **every** Shortener strategy, including batch and cross-shell moves.

---

## 7. Exact status

A valid proof in the sublinear direction must establish a chronology-stable online inequality such as \((OS)\) or \((AH)\) under an executable Shortener policy.

A valid disproof must produce an \(\varepsilon>0\) and a Prolonger strategy such that, against every Shortener strategy,

\[
L(n)\ge \varepsilon n
\]

for infinitely many sufficiently large \(n\). A growing-cap fortress, a long history against one named policy, or a static linear reservoir does not meet that quantifier.

Accordingly, I cannot certify the requested unconditional resolution. The mathematically honest conclusion from the supplied results is

\[
\boxed{
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)\le
\bigl(0.1897123371+o(1)\bigr)n,
}
\]

with the dichotomy \(L(n)=o(n)\) versus positive linear limsup still concentrated in the direct-ancestor/ordered-shadow chronology problem.