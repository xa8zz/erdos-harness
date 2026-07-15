---
id: R158-fsc-dyadic-vs-cj-bifurcation
type: research
date: 2026-07-14
intent: >
  Determine whether a closing claim that "fixed-depth clearing holds for
  every fixed J" resolves the divisibility-antichain-game bound L(n)=o(n),
  given that the phrase "fixed-depth clearing" is used for two structurally
  different clearing statements elsewhere in the same record.
predecessors: []
action:
  kind: standalone
claim: >
  In the primitive-set divisibility game on {2,...,n} (Prolonger maximizes
  moves, Shortener minimizes, L(n) the optimal-play length), the statement
  "fixed-depth clearing holds for every fixed J but provably does not
  diagonalize to growing depth g(n) (profile with |C_j|=floor(n/g) for all
  j<g: every fixed prefix o(n), total (1-o(1))n)" bifurcates into two
  readings. (A) Dyadic-shell reading: FSC(J,eta) holds for every fixed
  J,eta, where FSC(J,eta) asserts that, after an o(n)-move prelude,
  Shortener can process dyadic shells S_j=(n/2^{j+1},n/2^j] for j<J in
  order (playing legal lower moves to drive each shell's live nonminimal
  population Q_j below eta|S_j|) in o(n) total turns against every
  Prolonger strategy. Under (A) a complete proof of L(n)=o(n) exists: fix
  epsilon>0, choose fixed J,eta with 2^{-J}<epsilon/4 and eta<epsilon/4;
  run the J shell phases; the resulting legal set decomposes into the
  minimal legal set (o(n), by static completion), the union of shell
  excesses (at most eta*n), and the unprocessed tail below shell J (at
  most n/2^J+O(1)); legality monotonicity bounds every continuation by
  this total, giving L(n) <= (eta+2^{-J})n+o(n) < epsilon*n for large n.
  Reading (A) is itself unproven for J>=2: only the J=1 case (top-shell
  clearing) has a completed proof, and FSC(2,eta) is an open statement,
  equivalent to an unresolved second-shell capped-tail exclusion claim, so
  (A) is at least as strong as this open equivalence and is not
  established. (B) Refinement-layer reading, consistent with the quoted
  parenthetical's notation |C_j|: the claim is instead that
  sum_{j<J}|C_j|=o(n) for every fixed J, where C_j indexes minimal-legal
  divisor-refinement layers (unrelated to dyadic magnitude); this is
  compatible with sum_{j<g(n)}|C_j|=(1-o(1))n and hence does not bound
  game length, because the refinement-layer tail below any fixed J need
  not have bounded total size the way the dyadic tail n/2^J does. Under
  reading (B), which the surrounding S_j/Q_j-vs-C_j notation indicates is
  the intended one, neither L(n)=o(n) nor its negation is established; the
  open gap is a trajectory-restricted chronological claim that within any
  o(n)-move prefix a fixed positive fraction of active mass is directly
  deleted, exactly played, or irreversibly transferred to the minimal
  legal set, and no fixed-cap lower-bound construction forces a matching
  Omega(n) bound either.
implications:
  - Future prompts must disambiguate "fixed-depth clearing holds for every
    fixed J" by naming the two families distinctly (dyadic shells S_j/Q_j
    under FSC(J,eta) versus minimal-legal refinement layers C_j), since
    identical phrasing currently carries opposite implications for whether
    L(n)=o(n) follows.
  - Any "holds for every fixed J" statement must be cross-checked against
    growing-depth/deep-layer results already on record before being treated
    as resolving sublinearity, since a per-fixed-J bound is consistent with
    either a magnitude-bounded tail (dyadic) or an unbounded diagonalized
    tail (refinement layers).
  - Reading (A), if established, would subsume the presently open
    FSC(2,eta) equivalence (second-shell capped-tail exclusion) as a
    special case; proving (A) for J=2 alone would resolve that open
    equivalence.
  - The genuinely open gap after disambiguation is unchanged from what is
    already on record (the chronological direct-ancestor / capped-tail
    exclusion statement); this round narrows nothing mathematically, it
    only identifies which reading of one bullet does and does not bear on
    it.
confidence_at_time: low
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R158-solution-attempt-full-compilation.md
---

# Verdict

There is a **terminological bifurcation** in the supplied facts.

- If the final assertion that “fixed-depth clearing holds for every fixed \(J\)” means the dyadic-shell statement \(\mathrm{FSC}(J,\eta)\), then the problem is already solved and
  \[
  \boxed{L(n)=o(n)}.
  \]
  A complete proof is given below.
- The parenthetical notation \(|C_j|=\lfloor n/g\rfloor\), however, indicates that “fixed-depth clearing” refers instead to the first finitely many **refinement/minimal-root layers** \(C_j\), not to the dyadic shells \(S_j\). Under that intended reading, it does **not** supply \(\mathrm{FSC}(2,\eta)\), and the remaining facts do not prove either \(L(n)=o(n)\) or \(L(n)\not=o(n)\).

So the quantifier observation I flagged earlier is decisive only under the first reading.

## 1. Complete proof under the literal dyadic-shell reading

Assume that for every fixed integer \(J\ge1\) and every fixed \(0<\eta<1\), the statement \(\mathrm{FSC}(J,\eta)\) holds uniformly against Prolonger.

We prove \(L(n)=o(n)\).

Fix \(\varepsilon>0\). Choose fixed parameters \(J\) and \(\eta\) such that

\[
2^{-J}<\frac{\varepsilon}{4},
\qquad
0<\eta<\frac{\varepsilon}{4}.
\]

Shortener performs the accepted trapping prelude and then carries out the \(J\) shell phases supplied by \(\mathrm{FSC}(J,\eta)\). Let \(A\) be the position when these phases have finished.

By hypothesis, the number of Shortener turns used by the prelude and the shell phases is \(o(n)\), uniformly over Prolonger. Since there is at most one Prolonger turn between consecutive Shortener turns,

\[
|A|=o(n).
\]

For \(0\le j<J\), termination of the \(j\)-th phase gives

\[
|Q_j(A)|\le \eta |S_j|.
\]

Every currently legal integer belongs to precisely one of the following three sets:

1. the minimal legal set \(\mathcal M(A)\);
2. a nonminimal legal element in one of \(S_0,\ldots,S_{J-1}\);
3. an integer in the unprocessed lower tail \([2,n/2^J]\).

Consequently,

\[
|\mathcal L(A)|
\le
|\mathcal M(A)|
+\sum_{j=0}^{J-1}|Q_j(A)|
+\left|\left[2,\frac{n}{2^J}\right]\right|.
\]

Because \(|A|=o(n)\), static completion gives

\[
|\mathcal M(A)|=o(n).
\]

Moreover,

\[
\sum_{j=0}^{J-1}|Q_j(A)|
\le
\eta\sum_{j=0}^{J-1}|S_j|
\le \eta n,
\]

and

\[
\left|\left[2,\frac{n}{2^J}\right]\right|
\le \frac{n}{2^J}+O(1).
\]

Therefore

\[
|\mathcal L(A)|
\le
\left(\eta+2^{-J}\right)n+o(n)
<
\frac{\varepsilon}{2}n+o(n).
\]

Legality is monotone: adding more chosen integers can only make previously legal integers illegal. Hence every move after \(A\) must use a distinct member of the legal set \(\mathcal L(A)\) existing at \(A\). Thus every continuation from \(A\), under arbitrary play by either player, has length at most

\[
|\mathcal L(A)|.
\]

Including the \(o(n)\)-move prefix,

\[
L(n)
\le
o(n)+|\mathcal L(A)|
\le
\left(\eta+2^{-J}\right)n+o(n).
\]

For all sufficiently large \(n\), this is less than \(\varepsilon n\). Since \(\varepsilon>0\) was arbitrary,

\[
\boxed{L(n)=o(n)}.
\]

### Why no growing-depth diagonalization is needed here

The quantifiers are

\[
\forall\varepsilon>0\quad
\exists\,J,\eta\text{ fixed}\quad
\forall n\text{ sufficiently large}.
\]

Once \(J\) is fixed, the entire unprocessed dyadic tail has cardinality at most \(n/2^J\). One chooses \(J\) large **after** choosing \(\varepsilon\), but \(J\) never has to grow with \(n\).

Thus a profile with many refinement layers,

\[
|C_j|\asymp\frac{n}{g(n)}
\qquad (j<g(n)),
\]

does not obstruct this proof: the lower dyadic tail is controlled by its geometric size, not by summing all refinement layers.

## 2. Why this is not a proof under the \(C_j\)-layer reading

The surrounding notation strongly indicates that the final “fixed-depth” assertion concerns refinement layers \(C_j\). The shell statements consistently use \(S_j\) and \(Q_j\), whereas the proposed obstruction explicitly uses \(C_j\).

For refinement layers, knowing that

\[
\sum_{j<J}|C_j|=o(n)
\]

for every fixed \(J\) does not bound the total contribution of all relevant layers. The profile

\[
|C_j|=\left\lfloor\frac{n}{g(n)}\right\rfloor,
\qquad 0\le j<g(n),
\]

has

\[
\sum_{j<J}|C_j|
\le \frac{Jn}{g(n)}=o(n)
\]

for every fixed \(J\), while

\[
\sum_{j<g(n)}|C_j|=(1-o(1))n.
\]

The deep-layer theorem reduces the problem to the first

\[
C\log\log H(n)
\]

layers, but that number still tends to infinity. The fixed-\(J\) statement supplies no uniform estimate at that policy-dependent growing depth. This is different from dyadic shells, where everything below the first \(J\) shells has total size \(O(n/2^J)\).

Therefore the \(C_j\)-layer assertion cannot be substituted into the proof in Section 1.

## 3. The exact point at which the intended argument still stops

Suppose, toward proving \(\mathrm{FSC}(2,\eta)\), that its capped-tail exclusion fails. The accepted normal form produces a sparse active position \(B\), a linear second-shell population, and a tail of \(T\ge cn\) active turns. The accepted structural results then give:

\[
\Delta_t\ \text{nonincreasing},
\qquad
\sum_{t<T}\Delta_t\le |S_1|,
\]

a fixed-cap suffix of linear length, a linear family of eventual persistent roots, and the causal deadline

\[
k_X(d)>\frac{E}{s}
\quad\Longrightarrow\quad
d\mid p_j
\text{ for some causal Prolonger reply }p_j\text{ with }j<s.
\]

None of the supplied estimates contradicts this.

### The degree estimate is integrable

Along a sparse prefix of \(t\) moves, the established degree theorem gives only

\[
\Delta_t\gg_\eta \log\log\frac nt.
\]

For a prefix of \(\varepsilon n\) moves, the guaranteed total deletion is at the scale

\[
\sum_{t\le\varepsilon n}\log\log\frac nt
=
n\int_0^\varepsilon
\log\log\frac1s\,ds+o(n).
\]

But

\[
\int_0^\varepsilon\log\log\frac1s\,ds\longrightarrow0
\qquad(\varepsilon\downarrow0).
\]

So this estimate permits only \(o(n)\) guaranteed progress during every \(o(n)\)-move prefix. It cannot eliminate a positive-density reservoir.

### Static completion has the wrong rate

At cap \(H\), the persistent-root argument forces only approximately

\[
|\mathcal M(B)|\gtrsim \frac nH.
\]

Static completion says merely

\[
|\mathcal M(B)|=o(n).
\]

These are compatible for every \(H\to\infty\). The interval-blocker construction shows why the desired strengthening is unavailable: at position density about \(1/H\), one can have a minimal-set density of order \(1/\log H\), which is much larger than \(1/H\).

### Cumulative sparse-prefix control stops before the dangerous refinement

Only \(o(n)\) roots in a fixed interval can become minimal during an \(o(n)\)-move prefix. A proposed linear tail can respect this by postponing most of its final refinement until after the chosen set has already reached positive density. The supplied static construction satisfying all prefix deadlines and postponing final minimality confirms that this postponement is arithmetically consistent.

### One causal reply can batch many obligations

The unresolved step would have to say that one Prolonger reply cannot causally discharge too many survivor obligations. But the direct-ancestor examples show that a single reply may be divisible by many currently legal roots and may release substantial target mass. The atomic ledger controls the opposite orientation \(\kappa(F)\mid c\); it does not bound this direct-ancestor channel.

Thus the upper proof still requires a new chronological statement of essentially the form

\[
\text{within }o(n)\text{ moves, a fixed positive fraction of the active mass}
\]

is directly deleted, played, or irreversibly transferred to the minimal bank. That is precisely the missing aggregate-excess-halving or second-shell capped-tail exclusion theorem, rather than a consequence of the listed static estimates.

## 4. Why the listed lower machinery also does not disprove \(o(n)\)

The absorbing-fortress mechanism at cap \(H(n)\to\infty\) guarantees only

\[
\Omega\!\left(\frac n{H(n)}\right)=o(n)
\]

moves. A linear lower bound would require a fixed cap, but fixed-cap robust entry is one of the established impossibility results.

Likewise, the rank-\(k\) fan hierarchy gives

\[
L(n)\ge
c_k\frac{n(\log\log n)^{k-1}}{\log n},
\qquad
c_k=2^{-k-2^{k-1}+1},
\]

and the doubly exponential decay of \(c_k\) prevents taking \(k=k(n)\to\infty\) to obtain positive density. Finally, a trajectory defeating the particular greedy policy would not suffice: a lower bound for \(L(n)\) must survive every Shortener strategy.

## Final ruling

\[
\boxed{
\begin{array}{ll}
\textbf{Literal FSC reading:}
&
L(n)=o(n),\text{ by the complete fixed-}J\text{ proof above}.\\[2mm]
\textbf{Intended }C_j\textbf{-layer reading:}
&
\text{neither }L(n)=o(n)\text{ nor its negation follows.}
\end{array}}
\]

Under the intended reading signaled by the notation \(C_j\), presenting an unconditional resolution would require asserting exactly the missing chronological direct-ancestor bound without proving it.