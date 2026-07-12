---
id: R126-completion-modulus-sufficient-condition
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
  No unconditional proof or disproof follows from the accepted record,
  but a NEW clean sufficient condition is proved: define the uniform
  completion modulus mu_n(alpha) = sup{|M(A)|/n : A primitive,
  |A| <= alpha n} over minimal legal sets M(A). PROPOSITION (complete
  proof given): if some alpha_n -> 0 satisfies mu_n(3 alpha_n) =
  o(alpha_n), then L(n) = o(n) — Shortener plays the maximal-cone
  greedy policy (choose the minimal legal element whose live upper cone
  is largest) for alpha_n n turns; the global minimal-cone lemma
  (every legal x is a MULTIPLE of some minimal legal m, so cones cover
  the legal set) gives per-round contraction Q_{t+1} <= Q_t(1 - 1/(mu
  n)), hence Q_T <= n exp(-alpha_n/(2 mu)) = o(n), and monotonicity of
  legality bounds every continuation by Q_T. The qualitative
  static-completion theorem does NOT imply the hypothesis: mu_n(alpha)
  ~ sqrt(alpha) is compatible with it yet gives alpha/mu -> 0, and the
  greedy strategy makes no multiplicative progress before leaving the
  known range. Additional obstruction: an admissible recurrence
  alpha_{j+1} ~ 1/log(1/alpha_j) reaches constant size after log* H
  iterations — far inside the C loglog H shallow prefix the deep-layer
  theorem leaves open — so fixed-depth induction cannot be
  diagonalized. The peel-route composition needs |C| = o(n/H), while
  static completion gives only o(n); |C| ~ n/log H witnesses
  non-composability for every H -> infinity.
implications:
  - The entire upper route now reduces to one static extremal question
    about primitive sets: does mu_n(3 alpha_n) = o(alpha_n) hold for
    some alpha_n -> 0? A positive answer resolves the game problem via
    the proposition; a negative answer (mu_n(alpha) = Omega(alpha))
    kills every purely static route and forces chronology-sensitive
    methods.
  - The proposition is promotion-grade and load-bearing; audit before
    building on it.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R126-solution-attempt.md
---

# Verdict

Taking every listed theorem, reduction, and counterexample as established, I do **not** obtain a valid unconditional proof or disproof of

\[
L(n)=o(n).
\]

The supplied results leave a genuine quantitative and chronological gap. They rule out the currently apparent ways of filling it, but they do not determine the truth value of the original statement. Presenting either conclusion as proved would require inserting an additional assertion not justified by the record. 

The cleanest way to see the precise gap is to extract the strongest consequence of the static-completion theorem.

## 1. The global minimal-cone lemma

Let \(\mathcal L(A)\) be the set of all integers currently legal at a position \(A\), not merely the upper-half set, and let

\[
M(A)=\mathcal M(A)
\]

be its divisibility-minimal elements. For \(m\in M(A)\), define its live upper cone

\[
C_A(m)=\{x\in\mathcal L(A):m\mid x\}.
\]

Because \(A\cup M(A)\) is maximal, every \(x\in\mathcal L(A)\) is comparable with some \(m\in M(A)\). Moreover, \(x\) cannot properly divide \(m\), since that would make \(x\) a proper legal divisor of the minimal legal element \(m\). Hence \(m\mid x\). Therefore

\[
\mathcal L(A)=\bigcup_{m\in M(A)}C_A(m).
\]

Consequently,

\[
\max_{m\in M(A)}|C_A(m)|
\ge
\frac{|\mathcal L(A)|}{|M(A)|}.
\tag{1}
\]

Thus whenever \(|A|=o(n)\) and \(|\mathcal L(A)|\ge\eta n\), the static-completion theorem implies that some legal move destroys \(\omega(1)\) currently legal integers.

This is the strongest direct global-degree conclusion available from static completion. It is still insufficient.

## 2. The exact quantitative strengthening that would prove \(L(n)=o(n)\)

Define the uniform completion modulus

\[
\mu_n(\alpha)
=
\sup\left\{
\frac{|M(A)|}{n}:
A\text{ is a legal position and }|A|\le \alpha n
\right\}.
\tag{2}
\]

The given static-completion theorem says precisely that, for every sequence \(\alpha_n\to0\),

\[
\mu_n(\alpha_n)\longrightarrow0.
\tag{3}
\]

Here is a genuinely sufficient strengthening.

### Proposition

If there is a sequence \(\alpha_n\to0\) such that

\[
\mu_n(3\alpha_n)=o(\alpha_n),
\tag{4}
\]

then \(L(n)=o(n)\).

### Proof

For her first

\[
T=\lfloor\alpha_n n\rfloor
\]

turns, unless the game has already ended, Shortener chooses a minimal legal element \(m\) whose cone \(C_A(m)\) has maximum size.

Before Shortener’s \(T\)-th turn, fewer than \(2T+1\le3\alpha_n n\) total moves have occurred. Put

\[
\mu=\mu_n(3\alpha_n).
\]

If \(Q_t=|\mathcal L(A_t)|\), then (1) gives a legal Shortener move destroying at least

\[
\frac{Q_t}{\mu n}
\]

currently legal integers. Prolonger’s intervening move only decreases the legal set further. Hence, after each complete round,

\[
Q_{t+1}
\le
Q_t\left(1-\frac1{\mu n}\right).
\]

It follows that

\[
Q_T
\le
n\left(1-\frac1{\mu n}\right)^T
\le
n\exp\left(-\frac{T}{\mu n}\right)
\le
n\exp\left(-\frac{\alpha_n}{2\mu}\right).
\]

By (4), \(\alpha_n/\mu\to\infty\), so

\[
Q_T=o(n).
\]

Legality is monotone, and every subsequent move consumes one currently legal integer. Thus every continuation lasts at most \(Q_T=o(n)\) further moves. The first stage used at most \(2T+1=o(n)\) actual moves, proving

\[
L(n)=o(n).
\qquad\square
\]

The missing point is that (3) does **not** imply (4). A modulus such as

\[
\mu_n(\alpha)\asymp\sqrt{\alpha}
\tag{5}
\]

is completely compatible with the statement \(\mu_n(\alpha_n)\to0\) whenever \(\alpha_n\to0\), but then

\[
\frac{\alpha}{\mu_n(\alpha)}
\asymp\sqrt{\alpha}\longrightarrow0.
\]

The greedy strategy makes essentially no multiplicative progress before leaving the range on which the completion estimate is known. This is the rigorous version of the pointwise-degree obstruction in the prompt. Choosing \(\alpha_n\) or \(H(n)\) “more slowly” does not fix it.

## 3. Why peeling and growing-depth completion do not supply (4)

After peeling all legal integers up to \(n/H\), Shortener has used \(O(n/H)\) moves, and every remaining legal integer exceeds \(n/H\). The continuation lemma then bounds the remaining legal set by

\[
|\mathcal L(A)|\le(2H+1)|C|
\tag{6}
\]

for any maximal completion \(C\).

To derive a sublinear continuation from (6), one needs

\[
|C|=o(n/H).
\tag{7}
\]

Static completion supplies only

\[
|C|=o(n).
\tag{8}
\]

There is no valid composition of these two little-\(o\) statements. For example,

\[
|C|\asymp\frac{n}{\log H}
\]

is compatible with \(|C|=o(n)\) for every \(H\to\infty\), but

\[
\frac{H|C|}{n}\asymp\frac{H}{\log H}\longrightarrow\infty.
\]

The minimal-layer formulation has the same defect. For every **fixed** number of sweeps, induction using static completion shows that their total cost is \(o(n)\). But the required number of layers grows with \(H\). An abstract recurrence compatible with static completion can behave like

\[
\alpha_{j+1}\asymp\frac1{\log(1/\alpha_j)}.
\]

Starting from \(\alpha_0=1/H\), this can reach constant size after only about \(\log^\ast H\) iterations, much sooner than the allowed \(C\log\log H\) shallow layers. Thus fixed-depth estimates cannot be diagonalized through the required growing depth without a new quantitative modulus. The quadratic-regeneration examples show that this is not merely a formal concern.

The deep-layer theorem removes all sufficiently deep layers, but it leaves exactly this growing shallow prefix unresolved.

## 4. Why the lower-bound machinery does not disprove sublinearity

The absorbing-fortress theorem gives, for a trapped reservoir \(Q\) with cap \(H\),

\[
\text{remaining value}\ge \frac{|Q|}{H}
\]

up to the exact-only contribution. Even when \(|Q|\ge cn\), a growing cap gives only

\[
\frac{|Q|}{H}\ge\frac{cn}{H}=o(n)
\qquad(H\to\infty).
\tag{9}
\]

This may be \(n^{1-o(1)}\), but it is still compatible with \(o(n)\).

A positive-density lower bound would require either:

\[
H=O(1),
\]

or an amplification that converts \(n/H\) forced moves into \(cn\) forced moves. The supplied fixed-cap entry theorem rules out the first reservoir mechanism against a suitable Shortener strategy. No valid amplification or non-reservoir linear mechanism is provided. The surviving-shadow constructions also stop short of such a lower bound: they preserve linearly many legal descendants through one sweep, but expose only a sublinear next minimal layer, so they do not force linearly many actual moves.

## 5. What remains genuinely missing

For the upper direction, one needs at least one of the following genuinely new ingredients:

\[
\mu_n(3\alpha_n)=o(\alpha_n)
\]

along a Shortener trajectory, an online-area contraction such as (OA), or a chronology-sensitive potential whose increase under a new blocker is uniformly controlled. The frozen repair results do not have that Lipschitz property, and the lifetime-incidence bounds fail through inherited descendants and direct ancestors.

For the lower direction, one needs a forceable \(O(1)\)-cap positive-density structure, an amplification of growing-cap fortresses, or another mechanism forcing \(cn\) actual moves against **every** Shortener policy. None follows from the stated facts.

Therefore the mathematically supportable conclusion is

\[
\boxed{
\text{The supplied record does not presently prove or disprove }L(n)=o(n).
}
\]

This is not a disproof of the conjecture. It is an identification of the exact inference that an unconditional proof would still have to establish; asserting either outcome without that additional step would be unsound.