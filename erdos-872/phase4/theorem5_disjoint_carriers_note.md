# Theorem 5: disjoint small-prime carriers

This note packages Theorem 5 into one paper-grade statement and fixes the wording issues flagged by the audits.

The theorem is important for two reasons.

1. It is a genuine positive theorem: it proves `L(n)=O(n/\log n)` for a nontrivial class of Prolonger strategies.
2. It shows that the universal block-product obstruction is **not** the real hard case, because block-product Prolonger lies inside this class.

The audits agreed that the proof idea is sound. The two things that needed cleanup were:

- the proof should be stated as an **online priority strategy**, not as an offline batched sweep;
- the pure-prime-power case needed one corrected sentence.

This note makes those fixes explicit.

## 1. Setup and definitions

Fix
\[
y=n^\alpha,\qquad \frac13<\alpha<\frac12.
\]

Assume every composite Prolonger move has all prime factors at most `y`, and that the prime supports of distinct composite Prolonger moves are pairwise disjoint.

Let `A` be the current game position.

### Definition 1.1

A prime `p` is **resolved** at `A` if there is no legal move `x` with `p\mid x`.

This notion is monotone: once a prime is resolved, it stays resolved forever.

Let `B` be the set of primes `p\le y` that occur in some composite Prolonger move. By the disjoint-support hypothesis, each `p\in B` belongs to a unique composite carrier, which we denote by `C(p)`. Write
\[
e(p):=v_p(C(p)).
\]

## 2. If all small primes are resolved, only a sparse set remains

The key reduction is independent of the carrier structure.

### Proposition 2.1

If at some stage every prime `p\le y` is resolved, then every future legal move lies in
\[
\mathcal S_y:=\{x\le n: P^-(x)>y,\ \Omega(x)\le 2\}.
\]
Consequently the number of remaining legal moves is `O_\alpha(n/\log n)`.

### Proof

If a legal move `x` had a prime divisor `p\le y`, then `p` would not be resolved. So every prime divisor of `x` is greater than `y`.

Since `y^3=n^{3\alpha}>n`, no integer `x\le n` can have three prime factors all exceeding `y`. Hence `\Omega(x)\le 2`, proving `x\in\mathcal S_y`.

Now count:

- primes in `\mathcal S_y` contribute `\pi(n)-\pi(y)=O(n/\log n)`;
- semiprimes in `\mathcal S_y` contribute
  \[
  \sum_{y<p\le \sqrt n} \bigl(\pi(n/p)-\pi(p-1)\bigr)
  \ll \frac{n}{\log n}\sum_{y<p\le \sqrt n}\frac1p
  = O_\alpha\!\left(\frac{n}{\log n}\right),
  \]
  because
  \[
  \sum_{y<p\le \sqrt n}\frac1p
  =
  \log\!\frac{\log \sqrt n}{\log y}+O(1)
  =
  O_\alpha(1).
  \]

So the number of remaining legal moves is `O_\alpha(n/\log n)`.

## 3. The online Shortener strategy

Shortener uses a priority strategy with three move types.

### Phase 1 priority: legal primes

Whenever a legal prime exists, Shortener plays a legal prime.

This phase does **not** mean that all prime moves happen before all other moves in real time. It means prime moves have highest priority throughout the strategy.

### Phase 2 priority: power repairs inside non-pure-power carriers

For each `p\in B` such that `C(p)` has at least two distinct prime factors, Shortener earmarks the repair move
\[
p^{e(p)+1},
\]
provided `p^{e(p)+1}\le n`.

Whenever no legal prime exists, and some such power repair is legal and unplayed, Shortener plays one.

### Phase 3 priority: cross-carrier semiprime repairs

For each pair of distinct carrier primes `p,q\in B` with `C(p)\neq C(q)`, Shortener earmarks the repair move
\[
pq.
\]

Whenever neither a phase-1 move nor a phase-2 move is available, and some such cross-carrier pair is legal and unplayed, Shortener plays one.

Any earmarked repair that becomes illegal before it is played is simply skipped; this can only reduce the move count.

## 4. Legality of the repair moves

The proof rests on the disjoint-support hypothesis.

### Lemma 4.1 (phase-2 powers are legal when chosen)

Suppose `p\in B`, the carrier `C(p)` has at least two distinct prime factors, and `p^{e(p)+1}\le n`. Then whenever Shortener chooses `p^{e(p)+1}` under the priority rule above, that move is legal.

### Proof

We check comparability with every earlier move.

1. **Earlier prime moves.** If a prime `r` divides `p^{e(p)+1}`, then `r=p`. But if `p` had already been played as a prime, then `p` is already resolved and no phase-2 repair for `p` is needed. So `p^{e(p)+1}` is not comparable with any earlier prime move.

2. **Its own carrier.** Since `C(p)` has another prime factor besides `p`, the number `p^{e(p)+1}` neither divides `C(p)` nor is divided by `C(p)`.

3. **Other carriers.** Distinct carriers have disjoint prime supports, so no other carrier shares the prime `p`; therefore no other carrier is comparable with `p^{e(p)+1}`.

4. **Cross-carrier phase-3 pairs.** Every phase-3 move has the form `pq` with `q\neq p`, so it is not comparable with the pure prime power `p^{e(p)+1}`.

Thus `p^{e(p)+1}` is legal whenever it is chosen.

### Lemma 4.2 (phase-3 pairs are legal when chosen)

Suppose `p,q\in B` with `C(p)\neq C(q)`. Then whenever Shortener chooses the repair move `pq` under the priority rule above, that move is legal.

### Proof

Again check comparability with earlier moves.

1. **Earlier prime moves.** If `p` or `q` had already been played as a prime, then that prime is already resolved and no phase-3 repair involving it is needed. So `pq` is not comparable with an earlier prime move.

2. **Carriers.** No carrier contains both `p` and `q`, because carriers have disjoint prime supports. Hence no carrier is divisible by `pq`. Conversely a composite carrier cannot divide `pq`, because a carrier supported on one prime is a proper prime power and a carrier supported on two or more primes lies inside a single support set, not across two distinct carriers.

3. **Phase-2 powers.** A phase-2 move is a pure prime power `r^{e(r)+1}`. It cannot divide `pq`, and `pq` cannot divide it because it has two distinct prime factors.

So `pq` is legal whenever it is chosen.

## 5. Resolution theorem for the disjoint-carrier class

### Theorem 5.1

Fix `y=n^\alpha` with `1/3<\alpha<1/2`. Assume every composite Prolonger move has all prime factors at most `y`, and that distinct composite Prolonger moves have pairwise-disjoint prime supports.

Then the online priority strategy above forces every prime `p\le y` to become resolved after `O(n/\log n)` Shortener turns.

Consequently
\[
L(n)=O\!\left(\frac{n}{\log n}\right).
\]

### Proof

Fix a prime `p\le y`. We show that after the strategy finishes, no legal move can be divisible by `p`.

There are two cases.

#### Case 1: `p\notin B`

Then `p` does not occur in any composite Prolonger carrier. If `p` is ever legal, Phase 1 plays it. After that, every future multiple of `p` is illegal by antichain comparability.

If instead Prolonger himself plays the prime `p`, then again every future multiple of `p` is illegal.

So in all cases, `p` is resolved.

#### Case 2: `p\in B`

Assume for contradiction that after all repair moves have been processed, there is still a legal move `x` with `p\mid x`.

We now constrain the prime support of `x`.

##### Step 1: every prime divisor of `x` lies in `B`

If `r\mid x` and `r\notin B`, then `r` is handled by Case 1: Phase 1 either played `r`, or Prolonger played the prime `r`. In either event every multiple of `r` is illegal, contradicting the legality of `x`.

So every prime divisor of `x` belongs to `B`.

##### Step 2: all prime divisors of `x` lie in a single carrier

Suppose `x` contains primes `p_1,p_2\in B` from two distinct carriers. Then the phase-3 repair move `p_1p_2` was earmarked. If it was legal when considered, Shortener played it, and then `p_1p_2\mid x` makes `x` illegal. If it became illegal earlier, that only means some comparable earlier move already blocks every multiple of `p_1p_2`, again making `x` illegal.

So a legal `x` cannot involve primes from two distinct carriers. Therefore all prime divisors of `x` lie in the support of one single carrier, namely `C(p)`.

##### Step 3: pure-prime-power carriers

If `C(p)=r^a` is a pure prime power, then every prime divisor of `x` is equal to `r`, so
\[
x=r^b
\]
for some `b\ge 1`. Thus `x` is comparable with `r^a=C(p)`, contradicting legality.

This is the corrected version of the one sentence that was too loose in the earlier writeup.

##### Step 4: carriers with at least two distinct prime factors

Now suppose `C:=C(p)` has at least two distinct prime factors.

Because all prime divisors of `x` lie in the support of `C`, either:

1. `x\mid C`, in which case `x` is comparable with the already-played carrier `C`, contradiction; or
2. some prime `r` in the support of `C` occurs in `x` with exponent strictly larger than `e(r)=v_r(C)`.

In the second case,
\[
r^{e(r)+1}\mid x.
\]
If `r^{e(r)+1}\le n`, then Phase 2 earmarked that repair move. If it was ever legal, Shortener played it, and then `x` is illegal. If it became illegal earlier, again some earlier comparable move already blocks every multiple of it, so `x` is illegal.

If instead `r^{e(r)+1}>n`, then `x\ge r^{e(r)+1}>n`, impossible.

Thus this case is also impossible.

We conclude that no legal move divisible by `p` remains. Since `p\in B` was arbitrary, every prime `p\le y` is resolved.

Now Proposition 2.1 applies, and the remaining game length is `O_\alpha(n/\log n)`.

## 6. Move count

The strategy uses at most:

1. Phase 1: at most `\pi(n)` prime moves.
2. Phase 2: at most `|B|\le \pi(y)` power repairs.
3. Phase 3: at most
   \[
   \binom{|B|}{2}\le \pi(y)^2.
   \]

Since `y=n^\alpha` with `\alpha<1/2`,
\[
\pi(y)^2 = o\!\left(\frac{n}{\log n}\right),
\]
so the total number of Shortener moves used by the strategy is `O(n/\log n)`.

## 7. Relation to block-product Prolonger

The universal block-product counter from `phase4/block_product_carrier_mass_note.md` lies exactly in this disjoint-carrier class:

- each block-product uses only primes `\le n^{1/3}`,
- different blocks have disjoint prime supports.

Therefore Theorem 5 gives a rigorous `O(n/\log n)` upper bound against that Prolonger family.

This is why the right paper framing is:

- the block-product theorem is a genuine obstruction theorem against bounded carrier mass;
- Theorem 5 shows that block-product itself is still not the real asymptotic enemy;
- the real unresolved difficulty is overlapping carriers and blocked large primes.

## 8. Honest scope

Theorem 5 does **not** prove `L(n)=O(n/\log n)` in full generality.

What remains open is exactly what the audits identified:

1. **Overlapping carriers.** The pair-repair mechanism breaks once small primes belong to multiple carriers.
2. **Blocked large primes.** Mixed pairs `pq` with `p\le y<q` cannot be repaired naively within the target budget.

So Theorem 5 should be presented as a strong restricted-class theorem and as evidence that the block-product obstruction is not the true hard case.
