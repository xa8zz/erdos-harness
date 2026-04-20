# R56: finite odd-carrier separator-only barrier

This note packages the cleanest R56 obstruction theorem into one paper-grade statement.

The point of the theorem is not to determine the true order of `L(n)`. Its role is narrower and important:

1. it gives a rigorous no-go theorem for a precisely defined separator-only proof class;
2. it explains why the late separator-first packet program does **not** currently supersede the refined prime-prefix upper-bound route;
3. it cleanly separates "this proof class fails" from the much stronger and false claim "all separator ideas fail."

The right headline is:

> finite odd-carrier separator-only closures cannot prove `L(n)=O(r_1(n))`, and in fact cannot prove any `o(n)` upper bound.

Here
\[
r_1(n):=\frac{n(\log\log n)^2}{\log n}.
\]

## 1. Setup

Let
\[
U_n := (n/2,n]\cap \mathbf Z.
\]

Every subset of `U_n` is an antichain, since two distinct integers larger than `n/2` cannot divide one another.

We now define the proof class that the theorem rules out.

### Definition 1.1

A **finite odd-carrier separator-only closure** consists, for each large `n`, of a finite set
\[
S_n \subseteq [2,n/2]
\]
of odd integers such that:

1. `|S_n| = o(r_1(n))`;
2. if
   \[
   P(S_n):=\{p \text{ odd prime}: p\mid s \text{ for some } s\in S_n\},
   \]
   then
   \[
   H(S_n):=\sum_{p\in P(S_n)}\frac1p = o(1);
   \]
3. the only lower-half composite moves the method uses to kill elements of `U_n` are Shortener-claimed elements of `S_n`.

Condition (3) is the "separator-only" hypothesis. The method may of course remove elements of `U_n` one-by-one by actually playing them, but it has no lower-half composite fallback outside `S_n`.

## 2. The barrier theorem

### Theorem 2.1

No finite odd-carrier separator-only closure can prove
\[
L(n)=O(r_1(n)).
\]

In fact, for every such family `S_n`, Prolonger has a legal play prefix of length `o(r_1(n))` after which:

1. every separator in `S_n` is dead, and
2. at least
   \[
   \frac n2-o(n)
   \]
   elements of `U_n` remain legal.

Consequently this proof class cannot prove any `o(n)` upper bound.

### Proof

Fix `n` and write
\[
S:=S_n,\qquad P:=P(S).
\]

Suppose the current chosen set is an antichain `A`, every lower-half Shortener claim lies in `S`, and some separator `s in S` is still legal.

We show that Prolonger can immediately kill `s` by a legal upper-half move.

### Lemma 2.2

For every legal `s in S`, there exists a legal move
\[
x \in U_n
\]
with `s | x`.

### Proof

Because `s <= n/2`, choose
\[
a:=\left\lfloor \log_2(n/s)\right\rfloor.
\]
Then
\[
x:=2^a s
\]
satisfies
\[
n/2 < x \le n,
\]
so `x in U_n`.

We claim `x` is legal.

1. **Comparison with earlier upper-half moves.**
   Any previously played `y in A \cap U_n` is incomparable with `x`, unless `x=y`, because two distinct elements of `U_n` cannot divide one another.

   Equality cannot occur. If `y=2^b s'` is a previous dyadic preemption move with `s'` odd, then
   \[
   2^a s = 2^b s'
   \]
   forces `a=b` and `s=s'`, so `s | y`, contradicting that `s` was still legal.

2. **Comparison with earlier lower-half moves.**
   Let `t in A \setminus U_n`. By definition of the proof class, every such `t` lies in `S`, hence is odd and at most `n/2`.

   Since `x>n/2`, we cannot have `x | t`.

   If `t | x = 2^a s`, then oddness of `t` implies `t | s`, so `t` is comparable with `s`, contradicting the legality of `s`.

So `x` is legal.

Since `s | x`, once Prolonger plays `x`, the separator `s` becomes illegal forever.

This proves the lemma.

### Completing the theorem

Repeat Lemma 2.2 whenever a legal separator remains.

Because legality is monotone decreasing as the antichain grows, a separator that has been killed never revives. Each Prolonger preemption kills at least one still-legal separator, and any separator played by Shortener can only reduce the remaining legal separator set further.

Therefore, after at most `|S|` Prolonger moves and at most `|S|` Shortener moves, no separator in `S` remains legal. The total prefix length is at most
\[
2|S| = o(r_1(n)).
\]

We now count how many upper-half integers remain legal.

Let
\[
A_U := A\cap U_n.
\]
By construction,
\[
|A_U| \le 2|S| = o(n),
\]
because `r_1(n)=o(n)`.

Take `u in U_n \setminus A_U`. Such a number can be illegal because of a lower-half separator only if some `t in S` divides `u`. If `t | u`, then `u` is divisible by at least one prime `p in P`. Hence the number of elements of `U_n` killed by lower-half separators is at most
\[
\left|\bigcup_{p\in P}\{u\in U_n : p\mid u\}\right|
\le
\sum_{p\in P}\left(\frac np + 1\right).
\]

Since every `p in P` satisfies `p <= n`, we have `1 <= n/p`, so
\[
\sum_{p\in P}\left(\frac np + 1\right)
\le
2n\sum_{p\in P}\frac1p
=
2n H(S)
=
o(n).
\]

Therefore at least
\[
|U_n| - |A_U| - o(n)
=
\frac n2 - o(n)
\]
elements of `U_n` remain legal.

This is `omega(r_1(n))`, and in fact linear in `n`. So no method in this proof class can yield an `o(n)` upper bound, let alone an `O(r_1(n))` upper bound.

## 3. Packet-separator methods are a special case

The late packet separator programs fit naturally into Definition 1.1.

In the standard packet setup one chooses

\[
h:=\lfloor \log\log n\rfloor,\qquad
Y:=n^{1/(2h)},\qquad
q_0\le h/4,
\]

and a packet prime set `P_n \subseteq [Y,2Y]`. The separator family is
\[
S_n:=\left\{\prod_{p\in Q} p:\ Q\subseteq P_n,\ 1\le |Q|\le q_0\right\}.
\]

Then:

1. `|S_n| <= (2Y)^{q_0+1} = n^{1/8+o(1)} = o(r_1(n))`;
2. every separator is odd;
3. the packet-prime reciprocal mass is
   \[
   \sum_{p\in P_n}\frac1p \ll \frac1{\log Y} = o(1),
   \]
   so `H(S_n)=o(1)`.

Thus Theorem 2.1 applies directly to this entire separator-only packet class.

## 4. Concrete corollary: `tau_SF` does not close the full game

The theorem above is already the main result. The most useful concrete corollary is the failure of the separator-first / prime-fallback strategy usually denoted `tau_SF`.

The point is not that every completion of `tau_SF` fails. The point is that the **separator-first / prime-fallback rule by itself** is not a complete Shortener strategy in the full integer game.

### Corollary 4.1

The separator-first / prime-fallback route `tau_SF` does not prove
\[
L(n)=O(r_1(n)).
\]

Under the natural pass interpretation inherited from the hidden-packet game, Prolonger can force
\[
L_{\tau_{SF}}(n) \ge c n = \omega(r_1(n))
\]
for some absolute `c>0`.

### Proof sketch

There are two stages.

#### Stage 1: kill all legal separators

Prolonger first plays one even element of `U_n`. This makes the prime `2` illegal forever.

Then, whenever `tau_SF` would next play a legal separator `s_Q`, Prolonger instead plays its dyadic shield
\[
2^a s_Q \in U_n,
\]
which is legal by the same argument as in Lemma 2.2 and kills `s_Q`.

Since the total number of possible separators is
\[
|S_n| = n^{1/8+o(1)} = o(r_1(n)),
\]
after `o(r_1(n))` alternating moves no legal separator remains.

#### Stage 2: kill the legal prime fallback quickly

While legal primes remain, let `p` be the smallest legal odd prime. Prolonger takes a consecutive block `B` of current legal primes beginning at `p`, with product
\[
D=\prod_{q\in B} q \le n,
\]
chosen so that either `D > \sqrt n` or `B` contains all remaining legal primes. He then plays an upper-half dyadic lift
\[
u_B = 2^a D \in U_n.
\]

This kills every prime in `B`.

Each full block has
\[
\log D > \frac12 \log n.
\]
Since
\[
\sum_{p\le n}\log p = \vartheta(n)=O(n),
\]
the number of such block moves is
\[
O\!\left(\frac{n}{\log n}\right)=o(r_1(n)).
\]

Shortener responds once per block by playing the smallest remaining legal prime, if one exists. Those fallback primes have bounded total reciprocal mass: if they are `q_1<q_2<...`, then the block construction forces
\[
\vartheta(q_i)\gg i\log n,
\]
hence `q_i \gg i\log n` and therefore
\[
\sum_i \frac1{q_i} = O(1).
\]

The separator moves Shortener managed to play are even less dangerous: every upper-half multiple they kill is divisible by a packet prime in `[Y,2Y]`, and the total packet-prime reciprocal mass is `o(1)`.

So after all legal separators and all legal primes have been eliminated, the total reciprocal mass of primes appearing in Shortener's played lower-half moves is still `O(1)`. A standard lower-bound sieve then leaves
\[
\gg n
\]
elements of `U_n` not divisible by any Shortener move.

Prolonger has used only
\[
n^{1/8+o(1)} + O(n/\log n) = o(r_1(n))
\]
moves before this point, so there remain linearly many unused legal elements of `U_n`. Since all primes are now illegal, these survivors are composite.

Thus the position has:

1. no legal separator,
2. no legal prime,
3. but linearly many legal composite moves in the upper half.

That is exactly the failure mode. The separator-first / prime-fallback rule has stalled while the game is still far from over.

Under the pass interpretation, Shortener now passes forever and Prolonger simply continues taking the remaining legal upper-half composites, giving
\[
L_{\tau_{SF}}(n)\ge c n.
\]

If one instead completes `tau_SF` by saying "after no legal prime exists, play the smallest legal composite," then one has defined a **different** strategy. The hard problem is then the composite fallback, not the separator-first stage.

## 5. Honest scope

Theorem 2.1 is a theorem about a proof class. It does **not** say:

1. that every separator method fails;
2. that no nonlocal covering, entropy, or probabilistic argument can prove `O(r_1(n))`;
3. that the true order of `L(n)` is linear.

What it does say is precise and useful:

- a finite odd-carrier separator-only closure cannot reach `O(r_1(n))`;
- the late separator-first packet line, in its natural separator-only form, does not currently furnish a full-game upper bound;
- any successful `O(r_1(n))` proof will need a genuinely different ingredient, namely some composite fallback or nonlocal mechanism that survives after the separator space has been exhausted.
