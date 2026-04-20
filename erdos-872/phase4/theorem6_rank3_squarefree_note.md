# Theorem 6: squarefree rank-`<= 3` small-prime carriers

This note packages Theorem 6 into one paper-grade statement and folds in the audit fixes that matter for publication.

The theorem is important for three reasons.

1. It extends Theorem 5 from disjoint carriers to a genuinely overlapping class.
2. It resolves the concrete `{30,42,70}` obstruction inside the theorem rather than leaving it as a cautionary example.
3. It shows that the first real overlap barrier is **not** at rank `3`; the remaining overlap problem begins at rank `>= 4`, or in the mixed small/large-prime regime.

The audits agreed on the local soundness of the proof. The things that needed cleanup were:

- Phase 2 must say "`p^2` for each `p in B` whose prime has not already been played", not just "for each `p in B`";
- the survivor induction for `|supp(x)| >= 4` needed to be expanded rather than compressed into one line;
- the phase-4 count is `O_alpha(n/log n)` for each fixed `alpha < 1/2`, not uniformly as `alpha -> 1/2`.

This note makes those fixes explicit.

## 1. Setup and statement

Fix
\[
y=n^\alpha,\qquad \frac13<\alpha<\frac12.
\]

Assume every composite Prolonger move is

1. squarefree,
2. supported on primes at most `y`,
3. of rank at most `3` (that is, it uses at most three distinct primes).

Let `A` be the current game position, and let `B` be the set of primes that occur in some composite Prolonger move.

### Theorem 1.1

Under the hypotheses above, Shortener has an online strategy forcing
\[
L(n)=O_\alpha\!\left(\frac{n}{\log n}\right).
\]

## 2. The four-phase priority strategy

Shortener uses the following online priority rule.

### Phase 1 priority: legal primes

Whenever a legal prime exists, Shortener plays a legal prime.

### Phase 2 priority: squares on carrier primes

For each `p in B` such that the prime `p` has not already been played, Shortener earmarks the move
\[
p^2.
\]

Whenever no legal prime exists and some such square is legal and unplayed, Shortener plays one.

Because `p <= y = n^alpha` with `alpha < 1/2`, every such square satisfies
\[
p^2 \le n^{2\alpha}<n.
\]

### Phase 3 priority: squarefree semiprimes on `B`

For each distinct `p,q in B`, Shortener earmarks the squarefree semiprime
\[
pq.
\]

Whenever neither a phase-1 move nor a phase-2 move is available, and some such semiprime is legal and unplayed, Shortener plays one.

### Phase 4 priority: squarefree triples on `B`

For each distinct `p,q,r in B`, Shortener earmarks the squarefree triple
\[
pqr.
\]

Whenever none of the earlier priorities applies and some such triple is legal and unplayed, Shortener plays one.

As in Theorem 5, any earmarked move that becomes illegal before it is reached is simply skipped.

## 3. What survives after phases 1 and 2

The first two priorities reduce the problem to squarefree numbers supported on `B`.

### Lemma 3.1

After phases 1 and 2 have been exhausted, every legal move `x` has all prime divisors in `B`.

### Proof

Suppose `r | x` with `r notin B`.

Since `r` never appears in a composite Prolonger carrier, there are only two possibilities:

1. the prime `r` was legal at some earlier stage, in which case Phase 1 eventually played it;
2. Prolonger himself played the prime `r`.

In either case, a prime comparable with `x` has already been played, so `x` is illegal. Contradiction.

Thus every prime divisor of `x` lies in `B`.

### Lemma 3.2

After phases 1 and 2 have been exhausted, every legal move `x` is squarefree.

### Proof

Suppose `p^2 | x` for some prime `p`.

By Lemma 3.1 we must have `p in B`. If the prime `p` was already played, then `x` is immediately illegal. So assume `p` was not already played as a prime.

Then Phase 2 earmarks the move `p^2`. This move is legal when considered:

1. it is smaller than `n`, since `p <= y < n^{1/2}`;
2. it is incomparable with every composite Prolonger carrier containing `p`, because those carriers are squarefree;
3. it is incomparable with every composite Prolonger carrier not containing `p`, because they share no prime factor with `p^2`;
4. it is incomparable with every earlier square `q^2` for `q != p`.

So Phase 2 either plays `p^2`, or `p^2` has become illegal because some earlier comparable move was already played. In both cases every multiple of `p^2`, and hence `x`, is illegal. Contradiction.

Therefore every legal survivor is squarefree.

### Corollary 3.3

After phases 1 and 2 have been exhausted, every legal move `x` is squarefree and all of its prime divisors lie in `B`.

## 4. Survivor elimination in phases 3 and 4

We now show that no legal move survives the full strategy.

### Proposition 4.1

After phases 1 through 4 have been exhausted, no legal move remains.

### Proof

Assume for contradiction that a legal move `x` remains after the strategy finishes.

By Corollary 3.3, the number `x` is squarefree and all its prime divisors lie in `B`.

We split by `|supp(x)|`.

#### Case 1: `|supp(x)| = 1`

Then `x = p` is a prime in `B`.

By definition of `B`, there exists a composite Prolonger carrier divisible by `p`. So the prime `p` is comparable with that already-played carrier and is not legal. Contradiction.

#### Case 2: `|supp(x)| = 2`

Then `x = pq` is a squarefree semiprime on `B`.

If `pq` was legal when Phase 3 reached it, then Phase 3 played it, so `x` cannot survive.

If `pq` was not legal by the time Phase 3 reached it, then some earlier played move was already comparable with `pq`. Any later multiple of `pq`, including `x = pq` itself, is then illegal. Contradiction.

#### Case 3: `|supp(x)| = 3`

Then `x = pqr` is a squarefree triple on `B`.

If `pqr` was legal when Phase 4 reached it, then Phase 4 played it, so `x` cannot survive.

If `pqr` was not legal by the time Phase 4 reached it, then some earlier played move was already comparable with `pqr`, and hence with `x = pqr`. Contradiction.

#### Case 4: `|supp(x)| >= 4`

Choose three prime factors `p,q,r` of `x`. Then
\[
pqr \mid x.
\]

If `pqr` was legal after Phase 3, then Phase 4 played it, and `x` is illegal because it is divisible by a played move.

So assume `pqr` was **not** legal after Phase 3. Then some earlier move `m` was already comparable with `pqr`.

We now classify `m`.

1. **`m` cannot be a phase-2 square.**
   A square `s^2` is neither divisible by nor divisible into the squarefree triple `pqr`.

2. **If `m` is a phase-1 prime, then `m` is one of `p,q,r`, hence `m | x`.**

3. **If `m` is a phase-3 semiprime, then `m` is one of `pq,pr,qr`, hence `m | x`.**

4. **If `m` is a Prolonger composite carrier, then its support is contained in `{p,q,r}`.**
   Since carriers are squarefree of rank at most `3`, this means `m | pqr`, and therefore `m | x`.

In every possible case, an earlier played move divides `x`. So `x` is illegal. Contradiction.

All cases are impossible. Therefore no legal move survives.

## 5. Counting the four phases

To finish the theorem we show that the total number of Shortener moves used by the strategy is `O_alpha(n/log n)`.

### Phase 1

There are at most `pi(n) = O(n/log n)` prime moves.

### Phase 2

There are at most `|B| <= pi(y)` squares, hence
\[
|B| \le \pi(y)=o\!\left(\frac{n}{\log n}\right)
\]
because `alpha < 1/2`.

### Phase 3

There are at most
\[
\binom{|B|}{2}\le \pi(y)^2
\]
squarefree semiprimes on `B`, and
\[
\pi(y)^2=o\!\left(\frac{n}{\log n}\right)
\]
again because `2 alpha < 1`.

### Phase 4

Let
\[
T_\alpha(n):=\#\{p<q<r\le y:\ pqr\le n\}.
\]

The only nontrivial count is to show
\[
T_\alpha(n)=O_\alpha\!\left(\frac{n}{\log n}\right).
\]

### Proposition 5.1

For each fixed `alpha in (1/3, 1/2)`,
\[
T_\alpha(n)=O_\alpha\!\left(\frac{n}{\log n}\right).
\]

### Proof

Split the triples according to whether
\[
pq \le \frac{n}{y}=n^{1-\alpha}
\]
or
\[
pq > n^{1-\alpha}.
\]

#### Regime 1: `pq <= n^{1-alpha}`

For each such pair `(p,q)`, the prime `r` has at most `pi(y)` choices. Hence
\[
T_1 \le \pi(y)\cdot \#\{p<q:\ pq\le n^{1-\alpha}\}.
\]

Using the standard semiprime count,
\[
\#\{p<q:\ pq\le X\}
=
O\!\left(\frac{X\log\log X}{\log X}\right),
\]
we get
\[
T_1
\ll
\frac{n^\alpha}{\log n}\cdot \frac{n^{1-\alpha}\log\log n}{\log n}
=
O\!\left(\frac{n\log\log n}{\log^2 n}\right)
=
o\!\left(\frac{n}{\log n}\right).
\]

#### Regime 2: `pq > n^{1-alpha}`

Since `q <= y = n^\alpha`, the inequality `pq > n^{1-\alpha}` forces
\[
p>n^{1-2\alpha}.
\]

So
\[
T_2
\le
\sum_{n^{1-2\alpha}<p<q\le n^\alpha}\pi\!\left(\frac{n}{pq}\right).
\]

For these terms we have
\[
\log\!\left(\frac{n}{pq}\right)\ge (1-2\alpha)\log n,
\]
so
\[
\pi\!\left(\frac{n}{pq}\right)\ll_\alpha \frac{n}{pq\log n}.
\]

Therefore
\[
T_2
\ll_\alpha
\frac{n}{\log n}
\sum_{n^{1-2\alpha}<p<q\le n^\alpha}\frac1{pq}.
\]

By Mertens,
\[
\sum_{n^{1-2\alpha}<p\le n^\alpha}\frac1p
=
\log\log(n^\alpha)-\log\log(n^{1-2\alpha})+O(1)
=
O_\alpha(1),
\]
so the double reciprocal sum is `O_alpha(1)`. Hence
\[
T_2=O_\alpha\!\left(\frac{n}{\log n}\right).
\]

Combining the two regimes gives the claim.

### Corollary 5.2

The full four-phase Shortener strategy uses `O_alpha(n/log n)` moves.

Together with Proposition 4.1, this proves Theorem 1.1.

## 6. Resolution of `{30,42,70}`

The old `{30,42,70}` example is not a genuine rank-3 obstruction.

Here the carrier primes are `{2,3,5,7}`. The theorem strategy gives:

1. Phase 1 plays the legal prime `11`, which already kills `22`;
2. Phase 2 plays the four squares `4,9,25,49`;
3. Phase 4 plays the triple `105`.

Every dependency in the example is captured inside the theorem mechanism. So the example does not witness a failure of rank-3 local repair.

## 7. Relation to Theorem 5

Theorem 6 should be presented as the next restricted-class theorem after Theorem 5.

- Theorem 5 handled disjoint small-prime carriers.
- Theorem 6 handles **overlapping** squarefree small-prime carriers of rank at most `3`.

So the paper-facing conclusion is:

- block-product is not the hard case;
- disjoint carriers are not the hard case;
- rank-3 overlap is not the hard case either.

The first unresolved overlap barrier begins only once the minimal troublesome support size reaches `4` or more.

## 8. Honest scope

Theorem 6 does **not** prove `L(n)=O(n/log n)` in full generality.

It leaves open exactly the two classes the audits identified:

1. **Higher-rank overlap.**
   Squarefree carrier families of support size `>= 4` can generate legal-circuit witnesses that are not captured by bounded-rank local repair.

2. **Mixed small/large-prime fibers.**
   Constructions with moves `pq` where `p <= y < q`, especially the blocked-large-prime regime, lie outside the theorem hypothesis and are not touched by the proof.

So Theorem 6 should be sold as a strong restricted-class theorem and as a precise localization result: the small-prime overlap program survives through rank `3`, and the real open overlap obstruction starts only after that.
