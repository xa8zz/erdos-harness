# Round 16 Codex — definitive negative result for the dynamic `S_y` program

## Statement

Fix any \(\alpha \in (1/3, 1/2)\), set \(y = n^\alpha\), \(z = \lfloor n/(2y)\rfloor\), and let
\[
S_y
=
\{p \le y : p \text{ prime}\}
\cup
\{z < p \le n/2 : p \text{ prime}\}
\cup
\{ab \le n/2 : a,b > y \text{ prime}\}.
\]

Round 15 proved the static theorem:

> If an antichain contains \(S_y\), then every surviving upper legal move is either
> an upper prime or an upper semiprime \(qr\) with \(y < q \le r \le z\).
> Hence the total remaining game length is \(O_\alpha(n/\log n)\).

The current source-of-truth lower bound is
\[
L(n) \ge c_\delta \,\frac{n(\log\log n)^2}{\log n}
\qquad (0<\delta<1/4).
\]

Therefore:

## Negative theorem

There is **no** theorem of the form
\[
\text{“Shortener can reach the \(S_y\)-residual regime in }O(n/\log n)\text{ turns.”}
\]
In particular, Shortener cannot dynamically realize the Round 15 \(S_y\)-certificate in
\(O(n/\log n)\) moves.

More generally, if \(T_y(n)\) denotes the earliest move number at which the position has entered the
Round 15 residual regime (equivalently: after that time, every legal future move has no prime
factor \(\le y\)), then
\[
T_y(n)
=
\Omega\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]

## Proof

By Round 15, once the game has entered the \(S_y\)-residual regime, the number of moves still
available is only \(O_\alpha(n/\log n)\).

So if \(T_y(n)\) were \(O(n/\log n)\), the full game length would satisfy
\[
L(n) = O(n/\log n),
\]
contradicting the established lower bound
\[
L(n) \ge c_\delta\,\frac{n(\log\log n)^2}{\log n}.
\]

Thus
\[
T_y(n) \ge L(n) - O_\alpha(n/\log n)
= \Omega\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]
This proves both claims.

## Interpretation

The unresolved “small-prime block” in Round 15 is not a technical leftover. It is the entire
asymptotic barrier. The semiprime/large-prime part of \(S_y\) is only \(O(n/\log n)\), so the
second-order lower bound forces the small-prime-resolution stage itself to cost
\(\Omega(n(\log\log n)^2/\log n)\).

So the correct next use of the Round 15 theorem is not to prove \(O(n/\log n)\), but to isolate
where the lower-bound mass must live.
