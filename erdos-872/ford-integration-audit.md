# Ford Integration Audit

## Bottom line

After re-reading the Ford literature against the current repo state, my conclusion is:

- Ford's work does **not** rescue the old universal packing-lemma dream in the form
  "any game-achievable \(P \subseteq U\) has small effective prime coverage." The
  sparse carrier-recycling counterexample remains fatal to that interpretation.
- The surviving Ford route is **dynamic and bandwise**, not universal-over-all-\(P\).
  The right target is a specific Shortener strategy that forces unresolved upper moves
  into classes counted by divisor-in-interval and rough-divisor theorems.
- Ford's 2020 prime-factor-distribution paper is probably the cleanest rigorous backend
  for the Round 14/15 density heuristics and any future prime-power / composite
  Shortener program.

So the refined Ford thesis is:

> Do not use Ford to bound arbitrary Prolonger antichains. Use Ford to count the
> residual move classes produced by a specific top-down Shortener strategy.


## Exact imported facts

### 1. Divisors in a short interval

Ford 2008 studies
\[
H(x,y,z) := \#\{n \le x : \exists d \mid n \text{ with } y < d \le z\}.
\]

For fixed \(c>1\), one corollary of the main theorem is
\[
H(x,y,cy) \asymp_c \frac{x}{(\log Y)^{\mathcal E}(\log\log Y)^{3/2}},
\qquad
Y=\min(y,x/y)+3,
\]
where
\[
\mathcal E = 1-\frac{1+\log\log 2}{\log 2} \approx 0.08607.
\]

This is the right scale for "how many integers admit a divisor in a fixed-width
interval," not the right scale for arbitrary reciprocal-mass bounds.

Source:
- Ford 2008, Theorem 1 / Corollary B in the arXiv source and Annals paper.

### 2. Rough integers with a divisor in \((y,2y]\)

Ford 2019 studies
\[
H(x,y,2y;\mathcal R_w)
=
\#\{n \le x : P^-(n)>w,\ \exists d \mid n \text{ with } y<d\le 2y\}.
\]

Write
\[
\delta = \frac{\log_2 w}{\log_2 y}.
\]
Then for \(4 \le y \le \sqrt{x}\), \(4 \le w \le y/8\), the upper-half quantity
\[
H(x,y,2y;\mathcal R_w)-H(x/2,y,2y;\mathcal R_w)
\]
has the same order as \(H(x,y,2y;\mathcal R_w)\), and:

- near the threshold \(1-1/\log 4 \le \delta \le 1\),
  \[
  H(x,y,2y;\mathcal R_w)-H(x/2,y,2y;\mathcal R_w) \gg \frac{x}{\log^2 w};
  \]
- for \(0 \le \delta < 1-1/\log 4\),
  \[
  H(x,y,2y;\mathcal R_w)-H(x/2,y,2y;\mathcal R_w)
  \gg
  x\,\delta\,B(w,y)\,
  (\log y)^{-\mathcal E + \frac{\log(1-\delta)}{\log 2}},
  \]
  where
  \[
  B(w,y)=\min\!\left(1,\frac{(\log_2 y)^{-1/2}}{(1-\delta)\log 4 -1}\right).
  \]

This is the most plausible Ford input for the remaining overlap / blocked-large-prime
 problem, because it counts **upper-half** integers whose uncontrolled factor is rough.

### 3. Joint Poisson distribution of prime factors in sets

Ford 2020 proves that for disjoint sets of primes \(T_1,\dots,T_m \subseteq [2,y]\)
with \(y\) "not too large" relative to \(x\), the random vector
\[
(\omega(n,T_1),\dots,\omega(n,T_m))
\]
for \(n \le x\) is close in total variation to independent Poisson variables. The
explicit bound is
\[
d_{TV}((f_1,\dots,f_m),(Z_1,\dots,Z_m))
\ll
\sum_{j=1}^m \frac{H''(T_j)}{1+H(T_j)} + u^{-u},
\qquad
u=\frac{\log x}{\log y}.
\]

This is not a direct solution to the game, but it is the right rigorous language for:

- the Round 14 log-density \(du/(1+u)\) heuristics,
- the Round 15 piecewise density \(\rho(u)=1/((\lfloor 1/u\rfloor+1)u)\),
- any future prime-power / composite Shortener strategy that works by controlling
  prime counts in logarithmic bands.


## What Ford does not do here

### 1. It does not prove a universal packing lemma on arbitrary \(P \subseteq U\)

The repo already killed the version
\[
\text{"any size-}t\text{ family }P\subseteq U\text{ can realize only }X(t,n)\lesssim t\log\log n\text{ effective prime budget."}
\]

The reason is structural: Ford's interval-divisor theorems are density results. They
say that the set of integers with a given divisor pattern is sparse. They do **not**
prevent Prolonger from spending only \(O(n^{1/(m+1)})\) moves on a sparse carrier
ambush. That is exactly the flaw Gemini flagged in the carrier-recycling round.

### 2. It does not control \(\sum_{p\in B(P)}1/p\) through average \(\omega(x)\)

The repo also already killed the Erdős-Kac / average-\(\omega\) interpretation.
A block of consecutive upper-half integers can have ordinary \(\omega\)-statistics while
hitting every prime up to \(T\), so the reciprocal sum can still diverge like
\(\log\log T\).

So the correct reading is:

> Ford 2008 is not an average-\(\omega\) theorem for this game.
> It is a divisor-interval counting theorem that becomes relevant only after the game
> has been reduced to a specific residual form.


## The surviving Ford route

The refined route that still looks live is:

1. Use a stronger Shortener than SLOP.
2. Force unresolved upper moves into a decomposition
   \[
   u = a \cdot m
   \]
   where \(a\) is a controlled "small skeleton" and the uncontrolled cofactor \(m\)
   is \(w(a)\)-rough.
3. Partition the skeletons \(a\) into dyadic carrier bands
   \[
   Y < a \le 2Y.
   \]
4. Count the surviving upper moves in each band using Ford 2019.
5. Sum over bands, while using Ford 2020 / Kubilius to justify the prime-band model
   behind the Shortener strategy.

This is qualitatively different from the dead universal-packing program:

- the old target quantified over all Prolonger antichains;
- the new target quantifies only over the residual classes produced against one chosen
  Shortener strategy.


## Concrete candidate lemmas

These are not proved. They are the sharpest Ford-shaped lemmas that still look
plausible after the repo's negative results.

### Candidate Lemma A: bandwise rough-cofactor count

Fix a Shortener strategy and suppose that after a setup phase every unresolved upper move
has a distinguished factorization
\[
u = a m,
\qquad
Y < a \le 2Y,
\qquad
P^-(m) > w,
\]
for some parameters \(Y\) and \(w \le Y/8\).

Then the number of such unresolved moves in the upper half should be bounded by
Ford's upper-half rough-divisor count
\[
H(n,Y,2Y;\mathcal R_w)-H(n/2,Y,2Y;\mathcal R_w).
\]

This is the exact place where Ford 2019 can enter the game.

### Candidate Lemma B: overlap is a bandwise, not pointwise, obstruction

The disjoint-support theorem already resolved the block-product class. The real residual
difficulty is overlapping carriers and blocked large primes.

A Ford-compatible hope is:

> overlaps do not need to be repaired locally, one circuit at a time;
> it is enough to show that the entire family of overlap-generated unresolved moves in a
> dyadic band is sparse in Ford's sense.

This would bypass the simplex obstruction against bounded-rank local repair.

### Candidate Lemma C: prime-band Poisson model for a composite Shortener

Partition primes into logarithmic bands \(T_j\). If a Shortener strategy claims primes,
prime powers, and a sparse family of composite throttles in a band-adapted way, then the
remaining Prolonger-accessible prime-factor counts should be modeled by independent
Poisson variables on those bands, with explicit total-variation error from Ford 2020.

This is the most plausible route to turning the current heuristic
\[
du/u
\quad\text{or}\quad
\rho(u)=\frac{1}{(\lfloor 1/u\rfloor+1)u}
\]
densities into rigorous comparison sequences.


## Where this points strategically

If I had to force the Ford program into one sentence, it would be:

> Stop asking Ford to bound arbitrary carrier coverage. Ask Ford to count the upper-half
> residual classes left after a top-down Shortener has already stripped the easy small
> structure.

That suggests the next serious attack should be:

1. Start from the current disjoint-carrier theorem and blocked-large-prime obstruction.
2. Replace local pair/triple repair by a bandwise top-down Shortener.
3. Try to prove a reduction from unresolved moves to rough-cofactor interval classes.
4. Apply Ford 2019 band by band.
5. Use Ford 2020 to make the prime-band bookkeeping rigorous.


## Practical conclusion

The best Ford-driven route to the original problem is no longer
"prove the universal packing lemma."

It is:

- either a full \(O(n/\log n)\) proof via a bandwise rough-divisor theorem for the
  overlap case,
- or a rigorous matching sublinear upper bound at slow-growth scale by combining
  bandwise divisor counting with the Round 14/15 density machinery.

That is the route I would now prioritize.
