# Round 27 Codex — one-band fiber-collapse partial result

This note sets up the post-activation one-band cleanup game and derives the first concrete mass calculus.

The main conclusion is negative-leaning:

> **Single-fiber lateral cleanup is only logarithmically effective.**
> Even with all small prime laterals available, after `t` optimal lateral attacks on one activated core, the residual reciprocal mass is still of order `1 / log t`.
> If the activation seed already contains all primes up to `z_0`, then the best `t`-move cleanup only improves this to a ratio of order `\log z_0 / \log z_t`, and constant-factor reduction needs `\Omega(z_0/\log z_0)` moves.

This does **not** refute a matching-T2 upper bound by itself, because it is still a one-fiber statement. But it identifies a precise bottleneck sublemma: whether Prolonger can realize a positive-total-mass family of fibers with large prime shields already baked into the activation seeds.

Important scope caveat:

- the analysis below is for **within-core cleanup by laterals `bd`**;
- it does **not** yet rule out stronger cross-core Shortener moves coming from pure low divisors or other multi-fiber attacks;
- so the result is a bottleneck statement, not a full no-go theorem for all possible cleanup strategies.

## 1. One-band fiber game

Fix one high-prime band
\[
\mathcal P_{\mathrm{hi}}=\{p\text{ prime}: X\le p\le X^\lambda\},
\]
one dyadic product band `(Y,2Y]`, and the associated core set
\[
\mathcal B_X=\{b=pqr:\ p<q<r,\ p,q,r\in\mathcal P_{\mathrm{hi}}\}.
\]

For a core `b\in\mathcal B_X`, write
\[
H_b:=Y/b.
\]
Its fiber is
\[
\mathcal C_Y(b)
=
\{c:\ \mu^2(c)=1,\ H_b < c \le 2H_b,\ c\le X^\gamma\}.
\]

The Round-24 weight is
\[
\omega_Y(b)

=
\sum_{c\in\mathcal C_Y(b)}\frac1{bc}
=
\frac1b\sum_{c\in\mathcal C_Y(b)}\frac1c.
\]

Suppose Prolonger has already activated a set `R\subseteq\mathcal B_X`. For each activated core `b`, let `s_b\in\mathcal C_Y(b)` denote the activation seed actually used by Prolonger. In the real divisibility game this means Prolonger has already played one move `b s_b \ell_b`, so:

- the blocker `b` is forever unavailable to Shortener,
- every lateral `bd` with `d\mid s_b` is also unavailable to Shortener,
- but laterals `bd` with `d\nmid s_b` may still be legal and can kill all future tokens `(b,c)` with `d\mid c`.

Thus the post-activation cleanup problem decouples naturally into separate fibers, one per activated core.

## 2. Dyadic squarefree harmonic mass

Let
\[
\kappa:=\frac{6}{\pi^2}\log 2.
\]

Standard squarefree harmonic asymptotics on a dyadic interval give
\[
\sum_{\substack{H<c\le 2H\\ \mu^2(c)=1}}\frac1c

=
\kappa+o(1)
\qquad (H\to\infty).
\]

Hence for every core with `H_b\to\infty`,
\[
\omega_Y(b)=\frac{\kappa+o(1)}{b}.
\]

## 3. Mass killed by one lateral

For squarefree `d`, define the `d`-slice of a fiber by
\[
\omega_Y(b;d)
:=
\sum_{\substack{c\in\mathcal C_Y(b)\\ d\mid c}}\frac1{bc}.
\]

Writing `c=dm` and using squarefreeness plus coprimality,
\[
\omega_Y(b;d)
=
\frac1{bd}
\sum_{\substack{H_b/d < m \le 2H_b/d\\ \mu^2(m)=1\\ (m,d)=1}}\frac1m.
\]

The usual local-density factorization gives, for fixed squarefree `d` and `H_b/d\to\infty`,
\[
\omega_Y(b;d)

=
\frac{\kappa+o_d(1)}{b}\prod_{p\mid d}\frac1{p+1}.
\]

In particular, for a prime `p`,
\[
\omega_Y(b;p)
=
\frac{\kappa+o_p(1)}{b(p+1)}.
\]

So a prime lateral `bp` kills about a `1/(p+1)` fraction of the whole fiber mass.

## 4. Composite laterals are never better than prime laterals

Fix an activated core `b`.

If `d` is squarefree and `p\mid d`, then
\[
\{c\in\mathcal C_Y(b): d\mid c\}\subseteq \{c\in\mathcal C_Y(b): p\mid c\}.
\]
Hence
\[
\omega_Y(b;d)\le \omega_Y(b;p).
\]

Therefore, among all currently legal laterals on a fiber, the best one is always a **prime** lateral `bp` with the smallest available prime `p`.

So for purposes of maximizing deleted reciprocal mass on one fiber, composite laterals and semiprime-like laterals are dominated by prime laterals.

## 5. Exact one-fiber optimization problem

Let `A_b` be the set of primes `p` for which the lateral `bp` is still legal after the activation seed `s_b`; equivalently,
\[
A_b=\{p\le 2H_b:\ p\nmid s_b\},
\]
up to the harmless squarefree/dyadic boundary conventions.

Let `P_t(b)` be the set of the `t` smallest primes in `A_b`.

By the domination remark above, the optimal `t`-move Shortener strategy on a **single** fiber is:

- play the prime laterals `bp` for `p\in P_t(b)`.

After those attacks, the surviving tokens are exactly the `c\in\mathcal C_Y(b)` with no prime factor in `P_t(b)`.

So the residual mass is
\[
\omega_Y^{(t)}(b)

=
\frac1b
\sum_{\substack{c\in\mathcal C_Y(b)\\ (c,\prod_{p\in P_t(b)}p)=1}}\frac1c.
\]

Again by local density factorization,
\[
\omega_Y^{(t)}(b)
=
\frac{\kappa+o(1)}{b}\prod_{p\in P_t(b)}\frac{p}{p+1}.
\]

This is the exact one-fiber cleanup law.

## 6. Consequence: unshielded cleanup is only logarithmic

First consider the optimistic case where no small primes are blocked by the activation seed, so
\[
P_t(b)=\{p_1,\dots,p_t\}
\]
are just the first `t` primes.

Then
\[
\prod_{j\le t}\frac{p_j}{p_j+1}
=
\prod_{p\le p_t}\left(1-\frac1{p+1}\right).
\]

Using
\[
1-\frac1{p+1}=\frac{p}{p+1}=\frac{1-p^{-2}}{1-p^{-1}},
\]
Mertens gives
\[
\prod_{p\le z}\frac{p}{p+1}
\asymp \frac1{\log z}.
\]

Hence
\[
\omega_Y^{(t)}(b)\asymp \frac1{b\log p_t}\asymp \frac1{b\log t}.
\]

So even under the best possible availability assumptions, after `t` optimal lateral attacks on one fiber the residual mass only falls like
\[
\frac1{\log t}.
\]

This is much weaker than the T2 capture game, where each good move bought a constant-factor potential drop.

## 7. Primorial shielding makes cleanup much harder

Now assume the activation seed `s_b` is divisible by every prime up to `z_0`. Then all prime laterals `bp` with `p\le z_0` are unavailable from the start.

So the best `t`-move cleanup on that fiber uses the first `t` available primes above `z_0`, giving
\[
\omega_Y^{(t)}(b)
=
\frac{\kappa+o(1)}{b}
\prod_{z_0<p\le z_t}\frac{p}{p+1}
\asymp
\frac1b\cdot \frac{\log z_0}{\log z_t},
\]
where `z_t` is the largest prime used among those `t` attacks.

In particular:

- every legal attack kills at most
  \[
  O\!\left(\frac1{b z_0}\right)
  \]
  mass on that fiber;
- to reduce the fiber by a fixed constant factor one needs
  \[
  \Omega\!\left(\frac{z_0}{\log z_0}\right)
  \]
  attacks on that single core.

So if Prolonger can choose activation seeds with large primorial divisors, then fiber cleanup is intrinsically expensive.

## 8. When can Prolonger choose such a shielded seed?

Let
\[
P(z_0):=\prod_{p\le z_0}p.
\]
By Chebyshev/Mertens,
\[
\log P(z_0)=\vartheta(z_0)\sim z_0.
\]

Therefore, if
\[
P(z_0)\le H_b^{1-\varepsilon},
\]
then the interval
\[
\left(\frac{H_b}{P(z_0)},\ \frac{2H_b}{P(z_0)}\right]
\]
has length \(\asymp H_b/P(z_0)\to\infty\), and one expects many squarefree integers `m` coprime to `P(z_0)` in it. Any such `m` gives a legal activation seed
\[
s_b=P(z_0)m\in(H_b,2H_b]
\]
that blocks all prime laterals `\le z_0`.

So the natural bottleneck sublemma is:

> **Shielded-seed lemma.**  
> Can Prolonger realize a positive-total-mass family of activated cores `b` for which `H_b` is large enough to admit seeds `s_b` divisible by all primes up to `z_0 \to \infty`?

If yes, then the one-fiber cleanup lower bound above becomes a real obstruction.

## 9. Interpretation for candidate Shortener strategies

The requested ordering families behave as follows on one fiber:

1. **smallest-`d`-first**  
   optimal if all those small `d` are prime and legal; gives only logarithmic decay `1/\log t`.
2. **heaviest-fiber-first**  
   sensible globally, but does not improve the per-fiber decay law.
3. **smallest-`bd`-first**  
   same as smallest-`d`-first within each core.
4. **composite-lateral strategies**  
   dominated by prime-lateral strategies on a single fiber.

So the present evidence does **not** support an easy positive Shortener strategy analogous to the T2 `1/8` capture theorem.

## 10. What is actually proved here

Two rigorous-leaning partial conclusions:

1. **Best-case one-fiber cleanup is slow.**  
   Without shielding, the optimal `t`-move lateral cleanup leaves residual reciprocal mass of order `1/\log t`.
2. **Shielded activation is a concrete obstruction.**  
   If Prolonger can pick activation seeds containing all primes up to `z_0`, then constant-factor cleanup on that fiber needs `\Omega(z_0/\log z_0)` moves.

What remains open is the global one-band realization question:

> Can Prolonger activate a positive-total-mass family of fibers with large shielding thresholds `z_0`, while still preserving enough future legal upper-half moves on those fibers?

That is now the clean bottleneck sublemma.

## 11. Bottom line

The fiber-collapse question is now sharper than in Round 26:

- pure blocker ordering is dead;
- single-fiber lateral cleanup is only logarithmically effective;
- primorial-style activation seeds would make it much slower still.

So the most plausible next step is **not** to search over lateral orderings, but to settle the shielded-seed lemma:

> either prove that Prolonger can realize a positive-mass family of heavily shielded fibers, which would strongly obstruct matching-T2 cleanup,
> or prove that game legality forces most activated fibers to have low shielding complexity, which would reopen a positive Shortener theorem.
