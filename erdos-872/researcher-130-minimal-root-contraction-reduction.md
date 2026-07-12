---
id: R130-minimal-root-contraction-reduction
type: research
date: 2026-07-12
intent: >
  Independent full-solution attempt at the divisibility-game dichotomy
  L(n) = o(n) vs L(n) = Omega(n) on {2..n}, given the complete record
  including the fifteen-family formulation-collapse catalogue, the
  per-shell serial-ticket dichotomy, and the aggregate-excess halving
  target.
predecessors: []
action:
  kind: standalone
claim: >
  No unconditional proof or disproof follows from the accepted record.
  New reduction: a global minimal-root contraction lemma — with
  Q(A) = L(A) \ M(A) the nonminimal legal set and Gamma_A(m) the
  number of nonminimal legals divisible by the minimal legal root m,
  every position satisfies max_m Gamma_A(m) >= |Q(A)|/|M(A)| (descend
  each nonminimal legal to a minimal legal divisor; cones cover Q).
  The upper route therefore needs only a reciprocal-area estimate
  (accumulated sum of |Q|/|M| along the realized trajectory is
  Omega(n) within o(n) turns), but that is exactly a
  chronology-sensitive statement the record does not furnish. A
  correct upper resolution must prove an actual-time contraction of
  aggregate-excess or shellwise online-area type with mandatory
  service and no post-hoc activation; a correct disproof must produce
  an arbitrary-policy positive-density move bank and cannot rely on
  linear raw shadow, linear legal descendant sets, or growing-cap
  fortresses (which give only n/H).
implications:
  - Concurrence on the chronological separator from the minimal-root
    angle; the contraction lemma is a cleaner state-level form of the
    maximal-cone inequality restricted to nonminimal targets.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R130-solution-attempt.md
---

## Verdict

After working through the remaining upper- and lower-bound routes, I do **not** obtain a valid unconditional proof or disproof of

\[
L(n)=o(n).
\]

The supplied theorem stack leaves a genuine chronology-sensitive gap. In particular, it proves that an online-area or aggregate-excess contraction would settle the upper bound, while growing-cap fortresses yield only \(n/H(n)\) moves and fixed-cap robust entry is impossible. Neither the required contraction nor an arbitrary-policy positive-density cascade is among the established facts. 

There is, however, a useful unconditional reduction that makes the obstruction especially transparent.

---

## 1. A global minimal-root contraction lemma

For a position \(A\), let

\[
\mathcal L(A)=\{x\in\{2,\ldots,n\}:x\text{ is legal relative to }A\},
\]

let

\[
M(A)=\mathcal M(A)
\]

be its minimal elements under divisibility, and put

\[
Q(A)=\mathcal L(A)\setminus M(A).
\]

For \(m\in M(A)\), define its global nonminimal degree by

\[
\Gamma_A(m)
=
\#\{x\in Q(A):m\mid x\}.
\]

### Lemma

At every position,

\[
\max_{m\in M(A)}\Gamma_A(m)
\ge
\frac{|Q(A)|}{|M(A)|}.
\tag{1}
\]

### Proof

For every \(x\in Q(A)\), descend through legal proper divisors until reaching a minimal legal divisor \(\rho(x)\in M(A)\). Since \(x\) is nonminimal,

\[
\rho(x)\mid x,\qquad \rho(x)<x.
\]

The fibres of \(\rho\) partition \(Q(A)\), and each fibre over \(m\) has size at most \(\Gamma_A(m)\). Therefore

\[
|Q(A)|
=
\sum_{m\in M(A)}|\rho^{-1}(m)|
\le
|M(A)|\max_{m\in M(A)}\Gamma_A(m).
\]

This proves (1). ∎

Now consider the legal Shortener policy that, on every turn, chooses a minimal legal element of maximum \(\Gamma_A\). Write \(A_t\) for the position immediately before Shortener’s \(t\)-th move and set

\[
m_t=|M(A_t)|,\qquad q_t=|Q(A_t)|.
\]

Playing the selected root kills at least \(q_t/m_t\) members of \(Q(A_t)\). Prolonger’s following move cannot create any new legal integer; it can only delete legal integers or turn nonminimal ones into minimal ones. Consequently,

\[
q_{t+1}
\le
q_t\left(1-\frac1{m_t}\right),
\tag{2}
\]

and hence

\[
q_T
\le
q_0
\exp\left(-\sum_{t<T}\frac1{m_t}\right).
\tag{3}
\]

Thus we get the following exact conditional criterion.

### Corollary

If this policy admits some \(T=T(n)=o(n)\) such that

\[
\sum_{t<T}\frac1{m_t}\longrightarrow\infty,
\tag{4}
\]

then \(L(n)=o(n)\).

Indeed, (3) gives \(q_T=o(n)\). Since \(|A_T|\le 2T+1=o(n)\), static completion gives \(m_T=o(n)\). Therefore the entire legal set at time \(T\) has size

\[
|\mathcal L(A_T)|=m_T+q_T=o(n),
\]

so every continuation has \(o(n)\) further moves.

This reduces the problem, for a completely specified legal policy, to proving the reciprocal-area divergence (4).

---

## 2. Why static completion and degree divergence do not prove (4)

The static theorem says only

\[
m_t=o(n)
\]

uniformly while \(t=o(n)\). It gives no modulus relating \(m_t\) to \(t\). That omission is decisive.

Consider the continuous numerical profile

\[
m(t)=\sqrt{nt},
\qquad
q(t)=n\exp\left(-2\sqrt{\frac tn}\right).
\tag{5}
\]

It satisfies the exact differential analogue of (2):

\[
-\frac{dq}{dt}
=
\frac{q(t)}{m(t)}.
\tag{6}
\]

For every \(t=o(n)\),

\[
m(t)=o(n),
\qquad
q(t)=(1-o(1))n.
\]

Moreover, even at the linear time \(t=n/16\),

\[
q(t)=e^{-1/2}n.
\]

Equivalently, at the sublinear horizon \(T=n/h\),

\[
\int_1^T\frac{dt}{m(t)}
=
(2+o(1))\sqrt{\frac{T}{n}}
=
\frac{2+o(1)}{\sqrt h}
\longrightarrow0.
\tag{7}
\]

This is not a construction inside the divisibility game. It is a rigorous counterexample to the proposed inference

\[
m_t=o(n)\text{ at sublinear times}
\quad\Longrightarrow\quad
\sum_{t<T}\frac1{m_t}\to\infty
\text{ for some }T=o(n).
\]

Thus the global root lemma strengthens the pointwise degree statement, but it still encounters exactly the modulus obstruction recorded in the problem.

---

## 3. The deep-layer theorem does not repair the modulus

Let

\[
J=\left\lfloor C\log\log H\right\rfloor.
\]

The following numerical layer profile demonstrates the gap:

\[
|M_j|=\frac{n}{2J}\qquad(0\le j<J),
\qquad
|M_j|=0\qquad(j\ge J).
\tag{8}
\]

For every fixed \(j\),

\[
|M_j|=o(n)
\]

and the cumulative position before that fixed layer also has size \(o(n)\). All layers beyond depth \(C\log\log H\) contribute zero. Nevertheless,

\[
\sum_{j<J}|M_j|=\frac n2.
\tag{9}
\]

Again, (8) is not asserted to be a realizable divisibility history. It proves that the two statements

\[
\text{every fixed layer is }o(n)
\]

and

\[
\text{the deep tail is }o(n)
\]

do not logically imply that the growing initial block of layers has total \(o(n)\). One needs a uniform chronological constraint linking the different layers. The root-indexed first-blocker estimate is such a constraint, but its factor

\[
\left(\frac{H}{2^i}\right)^2
\]

is too large precisely in the first few generations.

---

## 4. Why the lower-bound facts also stop short of a disproof

Suppose Prolonger reaches a stable capped reservoir with

\[
|Q|\ge c n,\qquad \Delta_Q\le H(n).
\]

The absorbing-fortress estimate supplies only

\[
\operatorname{value}\ge \frac{|Q|}{H(n)}
\ge
\frac{c n}{H(n)}.
\tag{10}
\]

When \(H(n)\to\infty\), this is still \(o(n)\). It may be extremely close to linear, but it does not provide a fixed positive proportion of \(n\).

There are only two evident ways to upgrade (10):

1. Reach a reservoir with \(H=O(1)\). This is ruled out by the accepted fixed-cap entry theorem, and even cap \(o(r(n))\) cannot be robustly entered.

2. Amplify a growing-cap reservoir through \(H\) essentially disjoint extraction stages. No such amplification theorem is supplied. Shared low-lcm witnesses and direct-ancestor moves are exactly what prevent the necessary disjoint charging: one later move may simultaneously affect many nominally separate batches.

Moreover, an obtainable off-policy fortress is not enough. A linear lower bound must survive **every** Shortener strategy, including batch guards and fixed-density clearing sweeps.

Hence the existing lower-bound machinery proves at most a near-linear quantity \(n/H(n)\), not \(\Omega(n)\).

---

## 5. Exact remaining alternatives

A correct upper proof must establish some chronology-stable contraction on the **actual trajectory**, for example the aggregate assertion

\[
R(t)=M
\quad\Longrightarrow\quad
R\!\left(t+
O\!\left(\frac{M\log h}{h}+\log n\right)\right)
\le \frac M2,
\]

with mandatory service while \(R>0\), actual-time accounting, and no post-hoc activation. This is the role of \((\mathrm{AE}^{\dagger})\) or the shellwise online-area statement.

A correct disproof must instead produce, against arbitrary Shortener play, an actual chronology with a positive-density bank of moves. It cannot rely merely on:

\[
\text{linear raw shadow},
\qquad
\text{linear legal descendant set},
\qquad\text{or}\qquad
\text{a growing-cap fortress}.
\]

It must repeatedly turn sparse minimal covers into new covers without incurring the private-coordinate or primorial density loss.

Therefore the mathematically justified conclusion is

\[
\boxed{\text{the supplied results do not yet prove or disprove }L(n)=o(n).}
\]

The minimal-root contraction lemma above gives a clean additional reduction, but its required reciprocal-area estimate is exactly a chronology-sensitive statement not furnished by the current facts. Appending “QED” in either direction would require assuming the missing upper contraction or the missing arbitrary-policy lower cascade.