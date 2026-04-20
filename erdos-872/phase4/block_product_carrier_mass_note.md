# Universal block-product carrier-mass counter

This note packages the carrier-mass obstruction theorem into one paper-grade statement.

The role of the theorem is very specific. It does **not** say that block-product Prolonger is the true hard case of the game; later work in the repo shows the opposite. What it does say is that an entire natural proof strategy is dead:

> one cannot prove `L(n) = O(n/\log n)` by showing that every Prolonger response has bounded reciprocal carrier mass.

Here "carrier mass" means the reciprocal prime mass of the set of primes dividing Prolonger's moves.

## 1. Definition

For a Prolonger move sequence `P`, define
\[
B(P):=\{p \text{ prime} : p \mid x \text{ for some } x\in P\}.
\]

The quantity of interest is
\[
M(P):=\sum_{p\in B(P)} \frac1p.
\]

The original carrier-capacity hope was that some Shortener strategy `\sigma` might force `M(P)=O(1)` uniformly against every Prolonger response. The next proposition explains why that would have implied a sharp sublinear upper bound.

## 2. Bounded carrier mass would imply `O(n/\log n)`

### Proposition 2.1

Assume there is a Shortener strategy `\sigma` and a constant `C` such that for every Prolonger response against `\sigma`,
\[
\sum_{p\in B(P)} \frac1p \le C.
\]
Then
\[
L(n)=O\!\left(\frac{n}{\log n}\right).
\]

### Proof

Every Prolonger move `x\in P` has all of its prime factors in `B(P)`. So the entire Prolonger set `P` is contained in the set of `B(P)`-smooth integers up to `n`.

Let `S:=B(P)`. A standard Brun-type upper-bound sieve gives
\[
\Psi(n,S)\ll n \prod_{\substack{p\le \sqrt n\\ p\notin S}}\left(1-\frac1p\right).
\]
Factor the full Mertens product:
\[
\Psi(n,S)\ll
n\cdot
\frac{\prod_{p\le \sqrt n}(1-1/p)}
{\prod_{\substack{p\le \sqrt n\\ p\in S}}(1-1/p)}.
\]
By Mertens,
\[
\prod_{p\le \sqrt n}\left(1-\frac1p\right)\asymp \frac1{\log n},
\]
while
\[
\prod_{\substack{p\le \sqrt n\\ p\in S}}\left(1-\frac1p\right)^{-1}
\le \exp\!\left(\sum_{p\in S}\frac1p+O(1)\right)
\le e^{C+O(1)}.
\]
Therefore
\[
|P|\le \Psi(n,S)\ll e^{C+O(1)}\frac{n}{\log n}.
\]
Since the game length satisfies `L(n)\le 2|P|+1`, the same upper bound follows for `L(n)`.

So a bounded-carrier theorem would indeed have given the desired `O(n/\log n)` conclusion.

## 3. Static carrier capacity already fails

Before the dynamical theorem, the repo already had a static obstruction.

### Proposition 3.1

Fix any `0<\varepsilon<1/4`. There exist legal Prolonger antichains `P\subset (n/2,n]` of size `|P|=\lfloor \varepsilon n\rfloor` such that
\[
\sum_{p\in B(P)} \frac1p
\ge
\log\log n + O(1).
\]

### Proof sketch

Take
\[
P=\{m+1,m+2,\dots,m+T\}\subset (n/2,n],
\qquad
m=\lfloor n/2\rfloor,\quad T=\lfloor \varepsilon n\rfloor.
\]
Every two distinct members of `(n/2,n]` are incomparable, so this is a legal antichain. For every prime `p\le T`, one of the first `p` terms is divisible by `p`, so `p\in B(P)`. Hence
\[
\sum_{p\in B(P)} \frac1p
\ge \sum_{p\le T}\frac1p
= \log\log T + O(1)
= \log\log n + O(1).
\]

So the static universal carrier-capacity lemma is false.

That still left open the genuinely dynamical question: could a specific Shortener strategy force bounded carrier mass against **every** alternating Prolonger response? The next theorem says no.

## 4. Universal dynamical obstruction

### Theorem 4.1

For every Shortener strategy `\sigma`, there exists a Prolonger response `P` such that
\[
\sum_{p\in B(P)} \frac1p
\ge
\frac12 \log\log n + O(1).
\]

In particular, no Shortener strategy can force
\[
\sum_{p\in B(P)} \frac1p = O(1).
\]

### Proof

Set
\[
y:=n^{1/3}.
\]
Partition the primes `p\le y` greedily into disjoint blocks `S_1,S_2,\dots,S_r` as follows: build each block by multiplying in unused primes until the running product first exceeds `\sqrt n`. Define
\[
x_i:=\prod_{p\in S_i} p.
\]

#### Step 1: size control on each block

By construction,
\[
x_i>\sqrt n.
\]
On the other hand, just before the last prime was inserted, the running product was at most `\sqrt n`, and the last inserted prime is at most `y=n^{1/3}`. Therefore
\[
x_i\le y\sqrt n = n^{5/6}.
\]
So every block-product lies in
\[
(\sqrt n, n^{5/6}].
\]

#### Step 2: pairwise coprimality

The blocks use disjoint prime sets, hence the numbers `x_i` are pairwise coprime.

#### Step 3: any one Shortener move can kill at most one block

Fix any game move `s\in\{2,\dots,n\}`. We claim that `s` can be comparable with at most one block-product `x_i`.

Indeed, suppose `s` is comparable with two distinct blocks `x_i` and `x_j`.

1. If `s\mid x_i` and `s\mid x_j`, then `s\mid \gcd(x_i,x_j)=1`, impossible.

2. If `x_i\mid s` and `x_j\mid s`, then
   \[
   x_ix_j = \operatorname{lcm}(x_i,x_j)\mid s.
   \]
   But `x_i>\sqrt n` and `x_j>\sqrt n`, so `x_ix_j>n`, contradicting `s\le n`.

3. If `s\mid x_i` and `x_j\mid s`, then `x_j\mid x_i`, impossible because `x_i` and `x_j` are coprime and `x_j>1`.

So every Shortener move can invalidate at most one block.

#### Step 4: legality and persistence of Prolonger's block moves

At the start all blocks are pairwise incomparable, because distinct blocks are pairwise coprime and their product exceeds `n`. After any sequence of Shortener moves, any block not directly invalidated by a comparable Shortener move remains legal. By Step 3, one Shortener turn can invalidate at most one previously available block.

Hence after `k-1` full rounds:

- Prolonger has claimed `k-1` blocks,
- Shortener has invalidated at most `k-1` further blocks,

so at most `2k-2` blocks have been removed from the original family. In particular, as long as `2k-1\le r`, there is still at least one available block for Prolonger to play. Therefore Prolonger can force at least `\lceil r/2\rceil` block moves.

#### Step 5: greedy descending-by-mass secures at least half the reciprocal mass

For each block define its harmonic value
\[
v_i := \sum_{p\in S_i}\frac1p.
\]
Relabel the blocks so that
\[
v_1\ge v_2\ge \cdots \ge v_r.
\]

Prolonger's strategy is: whenever it is his turn, play an available block of maximum current `v_i`.

We claim that Prolonger secures total reciprocal mass at least
\[
\sum_{j\ \mathrm{odd}} v_j.
\]

Indeed, before Prolonger's `j`-th move, at most `2j-2` blocks from the original ordered list have disappeared (claimed earlier by Prolonger or killed by Shortener). So at least one of the original top `2j-1` blocks is still available. Since Prolonger chooses the available block of largest value, the value he obtains on move `j` is at least `v_{2j-1}`.

Summing over all Prolonger moves gives
\[
\sum_{x\in P} \sum_{p\mid x}\frac1p
\ge
\sum_{j\ \mathrm{odd}} v_j.
\]

Because the `v_j` are nonnegative and sorted,
\[
\sum_{j\ \mathrm{odd}} v_j
\ge \frac12 \sum_{j=1}^r v_j.
\]
But the blocks partition the primes `p\le y`, so
\[
\sum_{j=1}^r v_j = \sum_{p\le y}\frac1p.
\]
Hence
\[
\sum_{p\in B(P)} \frac1p
\ge
\frac12 \sum_{p\le y}\frac1p.
\]
By Mertens,
\[
\sum_{p\le y}\frac1p = \log\log y + O(1)=\log\log n + O(1),
\]
since `y=n^{1/3}` only changes the sum by an additive constant. Therefore
\[
\sum_{p\in B(P)} \frac1p
\ge
\frac12 \log\log n + O(1).
\]

This proves the theorem.

## 5. Consequence for the carrier-mass route

Combining Proposition 2.1 with Theorem 4.1 yields the clean obstruction statement:

### Corollary 5.1

No proof of `L(n)=O(n/\log n)` can proceed by first showing that some Shortener strategy forces
\[
\sum_{p\in B(P)} \frac1p = O(1)
\]
uniformly against every Prolonger response.

In other words, the entire bounded-reciprocal-carrier-mass program is closed, both:

- statically, by the consecutive-interval counterexample in `(n/2,n]`, and
- dynamically, by the universal block-product counter above.

## 6. Honest scope

This theorem is strong, but its scope should be stated honestly.

1. It kills a proof strategy. It does **not** show that block-product Prolonger is asymptotically optimal.

2. Later results in the repo, especially Theorem 5, show that the disjoint small-prime carrier class (which includes this block-product family) is actually manageable by Shortener in `O(n/\log n)` moves.

3. So the theorem's lasting value is as an obstruction theorem:
   bounded carrier mass is not the right universal invariant.
   The real difficulty lies in overlapping carriers and mixed prime-size interactions, not in the disjoint block-product model itself.

That is exactly why this theorem belongs in the paper's "landscape of impossibility" section rather than in the main positive core.
