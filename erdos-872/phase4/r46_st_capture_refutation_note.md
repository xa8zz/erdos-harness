# R46: ST-capture refutation and the conditional smallest-legal-prime rule

This note packages the stable Round 46 output into one paper-grade statement.

The right R46 takeaway is slightly narrower, and cleaner, than the first raw round summary suggested:

1. the proposed ST-capture / time-resolved Carleson route is rigorously false as stated;
2. the "smallest legal prime" rule for `sigma^*` is valid under a natural extra hypothesis;
3. without that hypothesis, a later local obstruction shows the unconditional version is false.

So the paper should present R46 as:

- an unconditional negative theorem about Angle 2;
- a conditional positive lemma that is still useful inside the burn-in refutation and similar clean states;
- a game-legality warning about what `sigma^*` cannot be forced to claim.

## 1. Conditional smallest-legal-prime lemma

The valid positive lemma is conditional.

### Lemma 1.1

Assume we are in a game state where every legal composite move has at least one legal prime factor. Then `sigma^*` claims the smallest remaining legal prime.

### Proof

Let `p < q` be legal primes.

For every unresolved rank-`h` squarefree facet divisible by `q`, replacing `q` by `p` yields another unresolved facet of no larger product and strictly larger harmonic weight. Therefore
\[
\deg_t(p) > \deg_t(q).
\]

Now let `y` be any legal composite. By hypothesis, `y` has some legal prime factor `r`. Every unresolved facet counted in `deg_t(y)` is also counted in `deg_t(r)`, because divisibility by `y` implies divisibility by `r`. Hence
\[
\deg_t(y)\le \deg_t(r).
\]

So every legal composite is dominated by some legal prime, and among legal primes the smallest one has largest unresolved degree. Therefore `sigma^*` claims the smallest remaining legal prime.

This is the exact form of the rule that is safe to use.

## 2. ST-capture theorem is false

The main R46 theorem is the negative one.

### Theorem 2.1

The proposed ST-capture / time-resolved Carleson inequality
\[
\mu_h(S(D)\cap U_{\tau(D)}) \ge c\,\nu(C(D))
\]
is false for every absolute constant `c>0`.

Here `D` is a strongly fresh local shield, `C(D)` is its certificate coface, `S(D)` is its local rank-`h` shadow, and `U_{\tau(D)}` is the set touched by Shortener at the first post-activation response time.

### Proof

Fix any `c>0`. We construct, for all sufficiently large `h`, a legal play state and a defect-two strongly fresh local shield `D` such that
\[
\mu_h(S(D)\cap U_{\tau(D)}) < c\,\nu(C(D)).
\]

Choose
\[
n=\lfloor e^{e^h}\rfloor,
\qquad
K:=h^2.
\]

Pick a prime `z` near `n^{1/h}/4`, and then choose `h-1+K` further primes in the dyadic interval `(z,2z]`. Split them as
\[
C=\{c_1,\dots,c_{h-1}\},
\qquad
W=\{w_1,\dots,w_K\}.
\]

Define the defect-two local star
\[
D=C\setminus\{c_1\},
\qquad
C(D)=C,
\]
with local shadow
\[
S(D)=\left\{a\prod_{c\in C} c:\ a\in W\cup\{z\}\right\}.
\]

### Burn-in

Before activating `D`, Prolonger plays fresh large primes `R_p` for every prime `p<z`, always outside the packet. In the clean burn-in state, every legal composite has a legal prime factor, so Lemma 1.1 applies and forces `sigma^*` to claim the primes
\[
2,3,5,\dots,p,\dots < z
\]
in increasing order.

None of these prime moves touches `S(D)`, because every element of `S(D)` has all prime factors at least `z`.

### Activator and forced first touch

After the burn-in, Prolonger plays the activator
\[
F_0 := w_1 \prod_{c\in C} c.
\]

This is legal, strongly fresh, and locally useful.

Once `F_0` is played, the primes in `C` and the leaf `w_1` are illegal as Shortener claims, because they divide `F_0`. But `z` remains legal since `z \nmid F_0`.

At the next Shortener turn, the smallest legal prime is therefore `z` (or, in equivalent versions of the construction, the next leaf). Again the clean burn-in hypothesis ensures Lemma 1.1 applies, so `sigma^*` is forced to claim that smallest legal prime.

But this first touch captures only a single element of the shadow:
\[
S(D)\cap U_{\tau(D)}
=
\left\{z\prod_{c\in C} c\right\}.
\]

Let
\[
P_C := \prod_{c\in C} c.
\]

Then
\[
\mu_h(S(D)\cap U_{\tau(D)})=\frac{1}{P_C z}.
\]

On the other hand,
\[
\mu_h(S(D))
=
\frac{1}{P_C}\left(\frac1z+\sum_{j=1}^K \frac1{w_j}\right)
\ge
\frac{K}{2P_C z},
\]
because each `w_j <= 2z`.

Since `r(D)=1`,
\[
\nu(C(D))=\frac{\mu_h(S(D))}{h}
\ge
\frac{K}{2hP_C z}.
\]

Therefore
\[
\frac{\mu_h(S(D)\cap U_{\tau(D)})}{\nu(C(D))}
\le
\frac{2h}{K}
=
\frac{2}{h}.
\]

As `h -> \infty`, this ratio tends to `0`. Choosing `h > 2/c` gives
\[
\mu_h(S(D)\cap U_{\tau(D)}) < c\,\nu(C(D)).
\]

So no absolute constant `c` can make the ST-capture inequality true.

## 3. Why this is not a tie-breaking artefact

The failure mechanism is not "bad tie-breaking." It is structural:

\[
\text{global max unresolved degree}
\not\Rightarrow
\text{large conditional capture inside one specific shield shadow}.
\]

The leaf `z` has the largest global unresolved degree among legal moves after the burn-in and activator, but it touches only one leaf of the particular local star `S(D)`.

That is exactly why Angle 2 fails.

## 4. The unconditional smallest-legal-prime claim is false

The raw Round 46 summary promoted the statement "`sigma^*` always claims the smallest legal prime." That is too strong.

A later local obstruction gives a perfectly legal state where a composite beats the smallest legal prime in limiting harmonic degree.

### Proposition 4.1

The unconditional smallest-legal-prime rule is false.

### Proof

Fix a prime `r >= 13` and a larger prime `q > r`. Let
\[
S_{q,r}:=\{qp : p<r,\ p\text{ prime}\}.
\]

Take `n` large enough that every element of `S_{q,r}` lies in `[2,n]`.

Then:

1. `S_{q,r}` is an antichain;
2. every prime `p<r` is illegal, because `p | qp in S_{q,r}`;
3. the prime `r` is legal and is the smallest legal prime;
4. the composite `6` is legal.

In the Sathe-Selberg limiting rank-`h` harmonic degree model one gets
\[
D_S(6)=\frac{q}{12(q+1)},
\]
while
\[
D_S(r)
=
\frac{1}{r+1}
\left(
\frac{q}{q+1}
+
\frac{1}{q+1}\prod_{p<r}\frac{p}{p+1}
\right).
\]

Hence
\[
D_S(6)-D_S(r)
=
\frac{q(r-11)-12\Pi_r}{12(q+1)(r+1)},
\qquad
\Pi_r:=\prod_{p<r}\frac{p}{p+1}.
\]

Since `r >= 13`, `q > r`, and `0 < \Pi_r < 1`, the numerator is positive, so
\[
D_S(6) > D_S(r).
\]

Thus there are legal states where a legal composite strictly beats the smallest legal prime. So the unconditional smallest-legal-prime rule is false.

The safe paper-facing statement is Lemma 1.1, not the unconditional version.

## 5. Game-legality warning

R46 also banks a useful negative meta-lemma.

### Proposition 5.1

Once Prolonger plays an activator `F`, no prime divisor of `F` is a legal Shortener move.

### Proof

If `p | F`, then the new chosen set would contain two comparable elements `p` and `F`, violating the antichain rule. So `p` is illegal immediately after `F` is played.

This sounds obvious, but it killed two attempted refutations of Angle 1. Any proof or refutation that relies on `sigma^*` claiming a prime divisor of Prolonger's already-played activator is invalid.

## 6. Honest conclusion

The stable paper-facing R46 package is:

1. **Unconditional theorem:** ST-capture / time-resolved Carleson packing is false as stated.
2. **Conditional lemma:** `sigma^*` claims the smallest legal prime in states where every legal composite has a legal prime factor.
3. **Counterexample to overreach:** without that hypothesis, the unconditional smallest-legal-prime rule is false.
4. **Legality lesson:** activator divisors are not legal Shortener claims.

So Angle 2 is dead, but the paper should not oversell R46 as proving an unconditional global response law for `sigma^*`.
