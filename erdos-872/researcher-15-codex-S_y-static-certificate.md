# Round 15 Codex (in-repo) — S_y static certificate with O(n/log n) residual; dynamic realization open

I kept pushing, and I do have a new rigorous theorem. It does not finish the full game yet, but it’s a real structural advance.

**New Theorem**
Fix \(y\in[2,\sqrt{n/2}]\), and set
\[
z:=\Big\lfloor \frac{n}{2y}\Big\rfloor.
\]
Define the lower antichain
\[
S_y
=
\{p\le y:\ p\text{ prime}\}
\;\cup\;
\{z<p\le n/2:\ p\text{ prime}\}
\;\cup\;
\{ab\le n/2:\ a,b>y\text{ prime}\}.
\]

Then:

1. \(S_y\) is an antichain.

2. If \(u\in(n/2,n]\) is not divisible by any element of \(S_y\), then \(u\) is either
- an upper prime, or
- an upper semiprime \(u=qr\) with
\[
y<q\le r\le z.
\]

So after “installing” \(S_y\), the only surviving upper numbers are upper primes and medium semiprimes.

**Proof sketch**
Take \(u>n/2\) with no divisor in \(S_y\).

- If \(u\) has a prime factor \(p\le y\), then \(p\in S_y\), contradiction.
- If \(u\) has a prime factor \(p>z\) with \(p\le n/2\), then \(p\in S_y\), contradiction.
- Hence every prime factor of \(u\) lies in \((y,z]\), unless \(u\) itself is prime.
- If \(u\) is composite and \(\Omega(u)\ge 3\), let \(q\le r\) be its two smallest prime factors. Since the third prime factor is \(>y\ge2\),
\[
qr \le \frac{u}{\text{third factor}} < \frac n2,
\]
and \(q,r>y\), so \(qr\in S_y\), contradiction.
- Therefore the only composite survivors are semiprimes \(qr\) with \(y<q\le r\le z\).

That’s the theorem.

**What It Gives**
For \(y=n^\alpha\) with \(1/3<\alpha<1/2\), both
- the size of \(S_y\), and
- the number of surviving semiprimes \(qr\) with \(y<q\le r\le z\)

are \(O(n/\log n)\). So statically this gives an \(O(n/\log n)\)-sized “almost terminal” certificate.

Numerically at \(n=10^6\), \(\alpha=0.45\), the static count is very strong:
- \(|S_y|=42523\),
- residual upper survivors \(=36960\) upper primes \(+1643\) medium semiprimes,
- total \(\approx 1.12\, n/\log n\).

That is substantially better than the old static pictures I was using.

**The Remaining Gap**
The unsolved part is now much sharper:

I can prove the static theorem above, but I still do not have the dynamic theorem that Shortener can realize this \(S_y\)-certificate fast enough in the actual game. The obstruction is the small-prime block:
- the semiprime part of \(S_y\) is stable for \(y>n^{1/3}\),
- but Prolonger can preempt many of the small primes \(p\le y\) at once,
- and those missed small primes are exactly what can leave a large smooth residue.

So the original problem is not closed yet, but the gap is now much narrower and cleaner:

> If we can upgrade the static \(S_y\) certificate into a playable Shortener strategy, the game drops to \(O(n/\log n)\).

I think this theorem is worth keeping and building on next.
