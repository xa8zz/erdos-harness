---
id: R20-pro-two-shadow-disproof
type: refutation
date: 2026-04-19
intent: >
  Test whether a two-shadow control theorem can bound the residual legal
  moves after Shortener's small-semiprime phase to o(n).
predecessors: []
prompt: erdos-872/prompts/round20-two-shadow-control.md
action:
  kind: standalone
claim: >
  Two-shadow control Theorem 2 and Theorem 3 are false: stronger residual
  statements do not hold under stated hypotheses. Theorem 1 (static bound
  on sum over small semiprimes) is trivially true but insufficient.
  Omega(n) legal moves remain after the semiprime phase regardless of
  the shadow bound.
failure_mechanism: >
  Static Mertens bound sum_{pq in U} 1/(pq) <= (1/2)(sum 1/p)^2 is trivially
  provable but does not control the game. The residual set of legal composites
  in (n/2, n] not blocked by U is Omega(n) because large primes in (n/2, n]
  form an independent Omega(n/log n) antichain untouched by small-prime shadow.
---

# Round 20 Pro — two-shadow control theorem disproved via Ω(n) legal-moves counterexample

The requested nontrivial online-control theorem is not true as stated. There is a simple formal proof of **Theorem 1** as written, but it is only the static bound over all small semiprimes and it does **not** close the gap. In fact, the stronger residual statements, **Theorem 2** and **Theorem 3**, are false under the stated hypotheses.

First, the literal proof of Theorem 1 is immediate. If (U) is the set of small semiprimes (pq) “used” in any sense, then
[
U\subseteq {pq:p<q\le y}.
]
Therefore, by Mertens,
[
\sum_{pq\in U}\frac1{pq}
\le
\sum_{p<q\le y}\frac1{pq}
=========================

\frac12\left(\left(\sum_{p\le y}\frac1p\right)^2-\sum_{p\le y}\frac1{p^2}\right)
\ll (\log\log y)^2
\ll_\alpha (\log\log n)^2.
]
So Theorem 1 is true literally. The problem is that this bound does not control the multiplicative closure of the safe small primes. Once Prolonger has preempted all pairs inside a moderately large small-prime set, future legal upper-half moves may carry arbitrarily many of those safe primes. That creates far more than (O(n(\log\log n)^2/\log n)) legal high-support moves.

Here is the counterexample.

Let
[
N=\log n,\qquad y=n^\alpha,\qquad \alpha\in(1/3,1/2).
]
Choose a constant
[
\frac{\alpha}{3}<\beta<\frac{\alpha}{2}
]
and set
[
z=n^\beta,\qquad S={p\le z:p\text{ prime}}.
]
Then
[
|{p<q:p,q\in S}| \asymp \frac{z^2}{\log^2 z}=n^{2\beta+o(1)}.
]
Because (2\beta<\alpha), the interval ((z,y]) contains many more primes:
[
\pi(y)-\pi(z)\asymp \frac{n^\alpha}{\log n}\gg n^{2\beta+o(1)}.
]

Now consider a legal Shortener strategy that begins by playing fresh primes from ((z,y]), and only afterwards continues with the promised small-prime, small-semiprime, and large-prime/large-semiprime installation steps. This is a legitimate strategy “including” the advertised steps, just in a bad order.

During those first
[
E=\binom{\pi(z)}2
]
Prolonger turns, Prolonger preempts every pair (pq) with (p,q\in S). For each such pair choose a prime (R_{pq}) with
[
\frac{n}{2pq}<R_{pq}\le \frac{n}{pq}.
]
This interval lies above (y), because
[
\frac{n}{2pq}\ge \frac{n}{2z^2}
=\frac12 n^{1-2\beta}

> n^\alpha=y
> ]
> for large (n), since (1-2\beta>\alpha). By the prime number theorem, such a prime exists. Prolonger plays
> [
> x_{pq}=pqR_{pq}\in(n/2,n].
> ]

These setup moves are legal: all (x_{pq}) lie in the upper half, hence are mutually incomparable, and none is divisible by the primes Shortener is playing from ((z,y]). After this setup, every prime in (S) and every semiprime (pq) with (p,q\in S) has been preempted by Prolonger.

Now we build many future legal high-support moves.

Choose small constants (\eta,\varepsilon,\gamma>0) so that
[
\eta<\min(3\beta-\alpha,,1-2\alpha),
]
[
u=\frac{\alpha+\eta/2}{3}<\beta,
]
[
u+\varepsilon<\beta,\qquad 3u+3\varepsilon<\alpha+\eta,
]
and
[
0<\gamma<\min(u,,1-2\alpha-\eta).
]
Let (T=n^\gamma). Let (\mathcal B) be the set of squarefree triple products
[
b=p_1p_2p_3
]
where the (p_i) are distinct primes in
[
[n^u,n^{u+\varepsilon}].
]
Then every such (b) satisfies
[
b>n^\alpha=y
]
and
[
b<n^{\alpha+\eta}.
]
Moreover, by Mertens in a fixed logarithmic prime interval,
[
\sum_{b\in\mathcal B}\frac1b \gg_{\alpha,\beta,\eta,\varepsilon} 1.
]

Let (\mathcal C) be the set of squarefree integers (c\le T). Since (T<n^u), the prime factors of (c) are disjoint from the prime factors of every (b\in\mathcal B). Also
[
\sum_{c\in\mathcal C}\frac1c
\sim \frac6{\pi^2}\log T
\asymp_\gamma N.
]

For each pair ((b,c)\in\mathcal B\times\mathcal C), put
[
a=bc.
]
Then (a) is squarefree, all its prime factors lie in (S), and
[
a>2y
]
for large (n), while
[
a\le n^{\alpha+\eta}n^\gamma<n^{1-\alpha}/2=\frac{n}{2y}
]
for large (n). Therefore the interval
[
\left(\frac{n}{2a},\frac{n}{a}\right]
]
lies inside
[
(y,n/(2y)].
]
For every prime (\ell) in that interval, define
[
w=a\ell.
]
Then
[
n/2<w\le n.
]

Each such (w) is a legal high-support move after the setup and after Shortener has installed the stated blockers:

[
\omega_y(w)\ge 3,
]
because (a) contains the three primes from (b).

No played small prime divides (w): its small primes all lie in (S), and those primes were preempted.

No played small semiprime divides (w): every pair (pq) with (p,q\in S) was preempted during setup, and (w) has no small prime outside (S).

No large prime from Shortener’s step 3 divides (w): the only prime factor of (w) above (y) is (\ell), and
[
\ell\le \frac{n}{2y},
]
whereas step 3 only plays large primes in ((n/(2y),n/2]).

No large semiprime from step 3 divides (w), because (w) has only one prime factor above (y).

Finally, all these (w)’s lie in ((n/2,n]), so they form an antichain and are incomparable with all setup moves (x_{pq}), which also lie in ((n/2,n]).

Counting them, the prime number theorem gives, uniformly for these (a),
[
#\left{\ell\text{ prime}:\frac{n}{2a}<\ell\le \frac{n}{a}\right}
\gg_\alpha \frac{n}{a\log n}.
]
Hence the number of residual high-support upper-half moves is at least
[
\gg_\alpha
\frac{n}{\log n}
\sum_{b\in\mathcal B}\frac1b
\sum_{c\in\mathcal C}\frac1c
\gg
\frac{n}{N}\cdot 1\cdot N
\gg n.
]

So after the setup, there are (\Omega(n)) legal Prolonger moves with (\omega_y(w)\ge 3). Even if Shortener later spends every turn selecting one of them, Prolonger still obtains (\Omega(n)) such moves. Since
[
\frac{n(\log\log n)^2}{\log n}=o(n),
]
this contradicts Theorem 3.

The same construction also contradicts Theorem 2. For the setup sequence (P=(x_{pq})), the union shadow (\Sigma_2(P)) contains every pair (pq) with (p,q\le z). Every residual (w=a\ell) above has its canonical small semiprime core inside (\Sigma_2(P)), and the residual family is an antichain of size (\Omega(n)) incomparable with every setup move. Thus the claimed residual width
[
O!\left(\frac{n(\log\log n)^2}{\log n}\right)
]
fails.

So the situation is:

[
\boxed{\text{Theorem 1 is true as written, but too weak.}}
]

[
\boxed{\text{Theorems 2 and 3 are false as stated.}}
]

The underlying obstruction is that 2-shadow reciprocal mass controls only the pair layer. It does not control the multiplicative closure generated by a safe set of small primes. Once all pairs inside (S) are preempted, Shortener’s prime/semiprime installation no longer prevents Prolonger from using products (bc) with many safe small prime factors, and that extra squarefree factor (c) contributes harmonic mass (\asymp \log n), producing (\Omega(n)) legal upper-half high-support moves.


I sent a codex a prompt as well:

A stronger version of **Theorem 3** is true:

\[
\boxed{\#\{x\in A:\omega_y(x)\ge 3\}\ll_\alpha \frac{n\log\log n}{\log n}}
\]

for every divisibility antichain \(A\subseteq \{2,\dots,n\}\), where \(y=n^\alpha\) and \(1/3<\alpha<1/2\). Since this is stronger than \(O(n(\log\log n)^2/\log n)\), it closes the round-20 reduction.

**Proof.** Let
\[
H:=\{x\in A:\omega_y(x)\ge 3\}.
\]

Split \(H=H_{\mathrm{sm}}\sqcup H_{\mathrm{rg}}\), where \(H_{\mathrm{sm}}\) is the set of \(y\)-smooth elements and \(H_{\mathrm{rg}}\) the set with at least one prime factor \(>y\).

For \(H_{\mathrm{sm}}\): these form an antichain inside the \(y\)-smooth integers \(\le n\). By DTK,
\[
|H_{\mathrm{sm}}|
\ll \frac{\Psi(n,y)}{\sqrt{\pi(y)}}.
\]
Here \(\Psi(n,y)=n\rho(1/\alpha)+O(n/\log n)=O_\alpha(n)\), so
\[
|H_{\mathrm{sm}}|\ll \frac{n}{\sqrt{\pi(y)}}
\ll n^{1-\alpha/2}\sqrt{\log n}
=o\!\left(\frac{n(\log\log n)^2}{\log n}\right).
\]

Now handle \(H_{\mathrm{rg}}\). For each \(x\in H_{\mathrm{rg}}\), let \(q>p\) be the largest and second-largest distinct primes \(\le y\) dividing \(x\). Write uniquely
\[
x=q^a p^b s r,
\]
with \(a,b\ge 1\), all prime factors of \(s\) \(<p\), and \(r>1\) \(y\)-rough (\(P^-(r)>y\)).

Fix \(p,q,a,b,r\), and set \(X:=n/(q^ap^b)\). Then the set of possible \(s\) with \(q^ap^bsr\in H_{\mathrm{rg}}\) is an antichain in the \((<p)\)-smooth integers \(\le X/r\). Let \(W_p(T)\) be the max width of that poset. By DTK again,
\[
W_p(T)\ll \frac{\Psi_{<p}(T)}{\lambda(p)},
\qquad
\lambda(p):=\max(1,\sqrt{\pi(p-1)}).
\]

So for fixed \(p,q,a,b\),
\[
N_{p,q,a,b}
\ll \frac{1}{\lambda(p)}
\sum_{\substack{r>1\\P^-(r)>y}}\Psi_{<p}(X/r).
\]

Reorder by the \((<p)\)-smooth part:
\[
\sum_{\substack{r>1\\P^-(r)>y}}\Psi_{<p}(X/r)
=
\sum_{\substack{s\le X/y\\P^+(s)<p}} R_y(X/s),
\]
where
\[
R_y(T):=\#\{r\le T:\ r>1,\ P^-(r)>y\}.
\]

Uniformly,
\[
R_y(T)\ll \frac{T}{\log y}.
\]
Reason: if \(T<y\), it is \(0\); if \(y\le T<y^2\), such \(r\) are prime; if \(T\ge y^2\), apply Buchstab with \(w=y\).

Hence
\[
N_{p,q,a,b}
\ll \frac{X}{\lambda(p)\log y}
\sum_{P^+(s)<p}\frac1s.
\]
By Mertens,
\[
\sum_{P^+(s)<p}\frac1s
=
\prod_{\ell<p}\left(1-\frac1\ell\right)^{-1}
\asymp \log p.
\]
Therefore
\[
N_{p,q,a,b}
\ll
\frac{n\log p}{q^ap^b\,\lambda(p)\,\log y}.
\]

Sum over \(a,b\ge1\):
\[
\sum_{a,b\ge1}\frac1{q^ap^b}\ll \frac1{pq}.
\]
So
\[
|H_{\mathrm{rg}}|
\ll
\frac{n}{\log y}
\sum_{p<q\le y}\frac{\log p}{pq\,\lambda(p)}.
\]
Now
\[
\sum_{q>p}\frac1q \ll \log\log y,
\]
and for \(p\ge5\),
\[
\frac{\log p}{p\,\lambda(p)}
\ll
\frac{(\log p)^{3/2}}{p^{3/2}},
\]
so the \(p\)-sum converges. Thus
\[
|H_{\mathrm{rg}}|
\ll
\frac{n\log\log y}{\log y}
\asymp
\frac{n\log\log n}{\log n}.
\]

Combining the smooth and rough parts,
\[
|H|
\ll_\alpha
\frac{n\log\log n}{\log n}.
\]

This proves a stronger form of Theorem 3, hence the requested
\[
O\!\left(\frac{n(\log\log n)^2}{\log n}\right)
\]
bound.

**Consequence.** The already-established charging argument handles the \(\omega_y\le2\) moves at \(O(n(\log\log n)^2/\log n)\), and the theorem above handles the \(\omega_y\ge3\) moves. So the Shortener program from [round20-two-shadow-control.md](/Users/omisverycool/erdos-harness/erdos-872/prompts/round20-two-shadow-control.md:1) yields
\[
L(n)\ll_\alpha \frac{n(\log\log n)^2}{\log n}.
\]

No repo files changed.
