---
id: R103-postpeel-statement-equivalence
type: research
date: 2026-07-12
intent: >
  Prove or refute the targeted upper-route statement (S): some
  H(n) -> infinity and Shortener strategy force, within O(n/H) moves, a
  position where all legal integers exceed n/H admitting a maximal
  completion C with |C| = o(n/H).
predecessors: [R100-continuation-lemma-gap-confirmation]
action:
  kind: extends
  target: R100-continuation-lemma-gap-confirmation
claim: >
  (S) is EQUIVALENT to L(n) = o(n), not merely sufficient. Forward: the
  continuation lemma gives L(n) <= Kn/H + (2H+1)|C| = o(n). Converse:
  if L(n) = o(n), set H(n) = n/(L(n)+1) -> infinity, play an optimal
  Shortener strategy to a TERMINAL position A; then |A| < n/H, the
  legality clause holds vacuously (no legal integers remain), and
  C = empty set works with |C| = 0. So a proof of (S) is a full proof
  of the sublinear side, and a disproof of (S) is a positive-density
  lower bound along a subsequence — (S) carries no independent content
  as an intermediate target because the terminal position is a
  degenerate witness. The static-completion route to (S) still fails
  (needs H*mu_n(O(1/H)) -> 0, unavailable from mu_n(alpha_n) -> 0
  alone), and pointwise degree divergence still fails (modulus
  mu(alpha) ~ sqrt(alpha) gives normalized progress 2*sqrt(alpha) -> 0).
implications:
  - Targeted upper-route statements must exclude the degenerate
    terminal witness to be strictly weaker than the full problem — e.g.
    prescribe H in advance of play, forbid terminal A, or require the
    peel to stop at a prescribed move budget with C nonempty control.
  - Curation lesson recorded in the harness: an intermediate statement
    quantified over strategy-dependent H can silently collapse to the
    full problem via the terminal position.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R103-postpeel-completion-size.md
---

## Verdict

The supplied material does **not** justify a proof or a disproof of (S). The decisive reason is stronger than the one stated in the prompt:

\[
\boxed{\text{(S) holds if and only if }L(n)=o(n).}
\]

Thus (S) is not merely a sufficient intermediate statement or a particular “peeling route.” It is an exact reformulation of the original sublinearity question, because the position \(A\) in (S) is allowed to be terminal. The definitions of (S), \(L(n)\), and the continuation lemma are those in the uploaded problem. 

Here is the complete equivalence proof.

---

## Theorem

Under the natural uniform interpretation of the asymptotic notation in (S),

\[
\text{(S)}\quad\Longleftrightarrow\quad L(n)=o(n).
\]

### Proof that (S) implies \(L(n)=o(n)\)

Assume (S). Then there are:

- a function \(H(n)\to\infty\);
- a constant \(K\);
- a Shortener strategy;
- and a function \(\varepsilon(n)\to0\);

such that against every Prolonger strategy, play reaches a position \(A\) after at most

\[
K\frac{n}{H}
\]

moves, every legal integer at \(A\) exceeds \(n/H\), and there is a legal set \(C\) satisfying

\[
A\cup C\text{ is maximal primitive},
\qquad
|C|\le \varepsilon(n)\frac{n}{H}.
\]

The uniform \(\varepsilon(n)\) formulation is equivalent to the ordinary meaning of the assertion “against every Prolonger strategy, \(|C|=o(n/H)\).” Indeed, if uniformity failed, for infinitely many \(n\) one could choose a worst offending Prolonger strategy, producing a sequence against which the little-\(o\) assertion failed.

By the given continuation lemma, from \(A\) every continuation has at most

\[
(2H+1)|C|
\]

additional moves. Hence Shortener can guarantee total length at most

\[
K\frac{n}{H}+(2H+1)|C|.
\]

Using the bound on \(C\),

\[
\begin{aligned}
L(n)
&\le K\frac{n}{H}
 +(2H+1)\varepsilon(n)\frac{n}{H} \\
&=n\left(
\frac K H+
\left(2+\frac1H\right)\varepsilon(n)
\right).
\end{aligned}
\]

Both terms in parentheses tend to zero. Therefore

\[
L(n)=o(n).
\]

This is the implication already noted in the prompt.

---

### Proof that \(L(n)=o(n)\) implies (S)

Now assume

\[
L(n)=o(n).
\]

Because this is a finite perfect-information game, for each \(n\) there is a Shortener strategy \(\sigma_n\) whose worst-case terminal length is at most \(L(n)\).

Define, for example,

\[
H(n)=\frac{n}{L(n)+1}.
\]

Since \(L(n)=o(n)\),

\[
H(n)\longrightarrow\infty.
\]

Use \(\sigma_n\) and let \(A\) be the **terminal position** reached against the given Prolonger strategy. Then

\[
|A|\le L(n)<L(n)+1=\frac{n}{H(n)}.
\]

Thus the number of moves made is \(O(n/H)\), in fact less than \(n/H\).

Since \(A\) is terminal,

\[
\mathcal L(A)=\varnothing.
\]

Consequently:

1. Every integer legal at \(A\) exceeds \(n/H\), vacuously.
2. We may take
   \[
   C=\varnothing.
   \]
3. We have \(C\subseteq\mathcal L(A)\).
4. The set \(A\cup C=A\) is maximal primitive.
5. Finally,
   \[
   |C|=0=o(n/H).
   \]

All clauses of (S) hold. This proves the reverse implication and hence the equivalence. ∎

---

## Consequences for the requested proof or disproof

The equivalence changes the interpretation of both outcomes.

A proof of (S) would be a full proof of

\[
L(n)=o(n).
\]

A disproof of (S) would imply

\[
L(n)\ne o(n),
\]

or equivalently

\[
\limsup_{n\to\infty}\frac{L(n)}n>0.
\]

Thus a disproof would yield an \(\varepsilon>0\) and infinitely many \(n\) for which Prolonger can force

\[
L(n)\ge \varepsilon n.
\]

So a disproof would not merely “close this route.” It would establish a linear lower bound along an infinite subsequence and settle the central dichotomy in the opposite direction.

The known lower bound

\[
L(n)\ge
c_\delta\frac{n(\log\log n)^2}{\log n}
\]

has ratio tending to zero, while the known upper bound only gives a positive constant times \(n\). Both are compatible with either truth value of (S).

---

## Why the static-completion argument still does not prove (S)

The most tempting attempted proof is:

1. Peel until every legal integer is above \(m=n/H\), using \(O(m)\) moves.
2. Apply static completion to obtain \(C=o(n)\).
3. Choose \(H\) sufficiently slowly so that \(C=o(m)\).

Step 3 is invalid.

A useful uniform notation is

\[
\mu_n(\alpha)
=
\sup\left\{
\frac{|\mathcal M(P)|}{n}:
P\text{ primitive},\ |P|\le\alpha n
\right\}.
\]

The static completion theorem says that whenever \(\alpha_n\to0\),

\[
\mu_n(\alpha_n)\to0.
\]

For a peel with \(|A|=O(n/H)\), this only gives

\[
|C|\le n\,\mu_n(O(1/H))=o(n).
\]

What (S) requires is

\[
|C|=o(n/H),
\]

namely

\[
H\,\mu_n(O(1/H))\to0.
\]

The first limit does not imply the second. Abstractly, behavior such as

\[
\mu_n(1/H)\asymp \frac1{\log H}
\]

is compatible with \(\mu_n(1/H)\to0\), but gives

\[
H\mu_n(1/H)\asymp\frac{H}{\log H}\to\infty.
\]

Likewise, a modulus resembling \(\mu(\alpha)=\sqrt\alpha\) tends to zero but is much larger than \(\alpha\). This is exactly why taking \(H\) “arbitrarily slowly” is not a valid diagonal argument.

---

## Why pointwise growing degree does not close the equivalence

There is also a clean but insufficient observation behind the degree approach.

At any position \(A\), every legal integer is a multiple of some minimal legal element. Therefore, if \(N(A)=|\mathcal L(A)|\), some \(m\in\mathcal M(A)\) has at least

\[
\frac{N(A)}{|\mathcal M(A)|}
\]

legal multiples. Playing that \(m\) removes at least this many legal integers.

Since static completion gives \(|\mathcal M(A)|=o(n)\) at sublinear positions, this shows that the best available degree tends to infinity whenever \(N(A)\) remains linear.

But pointwise divergence is not enough. If at time \(t=\alpha n\) the worst uniform completion modulus behaves like

\[
|\mathcal M(A)|\approx n\sqrt{\alpha},
\]

then the guaranteed number removed per Shortener turn is only on the order of \(1/\sqrt\alpha\). The total normalized progress by time \(\alpha n\) is comparable to

\[
\int_0^\alpha \frac{ds}{\sqrt{s}}
=2\sqrt{\alpha},
\]

which tends to zero with \(\alpha\). Thus no \(o(n)\)-time clearing follows. A chronology-sensitive estimate, stronger than pointwise degree divergence, is indispensable.

---

## Final conclusion

The exact unconditional mathematical conclusion available here is:

\[
\boxed{\text{(S) is equivalent to }L(n)=o(n).}
\]

Accordingly, none of the accepted facts in the prompt supplies a complete truth-value resolution. A claimed proof of (S) must add a genuinely new chronology-sensitive upper-bound theorem, such as the unresolved shell-area or growing-depth uniformity statement. A claimed disproof must add a Prolonger theorem strong enough to force a positive linear density, not merely a growing-cap \(n/H(n)\) fortress. Presenting either conclusion without such a new theorem would leave precisely the gap identified throughout the problem statement.