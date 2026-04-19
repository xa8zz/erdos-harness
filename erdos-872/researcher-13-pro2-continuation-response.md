# Round 13 Pro-2 continuation response — static obstruction on case (b)

**Result.** Proves a rigorous static obstruction: if Prolonger succeeds in installing a specific squarefree 3-prime carrier family $\mathcal{E}_Q$ (for $Q = \{q \text{ prime} : n^\beta \le q \le n^\gamma\}$), then the residual legal move set $\mathcal{M}_Q$ of isolated maximal $qab$-moves in $(n/3, n]$ has $|\mathcal{M}_Q| \gg n \log\log n / \log n$. Consequence: any Resolution-Theorem-style *post hoc* extension to case (b) is ruled out; the only remaining route to $O(n/\log n)$ is genuinely online (Shortener must prevent $\mathcal{E}_Q$ from being installed). Does not settle $L(n)$.

Numerical checks (Python): at $n = 10^6$, the unrestricted $2pqr$ cone leaves 25,070 isolated maximal odd-4-prime moves in $(n/3, n]$; the fiber construction with $q \in [200, 500]$ yields 7,209 isolated $qab$-moves.

---

follow up pro returned:

Using the circuit lemma, I can prove a genuine structural obstruction. It does **not** settle the minimax value (L(n)), but it does show that any extension of the Resolution Theorem to arbitrary overlap cannot be a **post hoc** theorem that waits for the carrier prefix to be installed and then resolves it in (O(n/\log n)).

The cleanest obstruction is on gap **(b)**.

Let (\alpha<\beta<\gamma<1/2), and let
[
Q:={q\ \text{prime}: n^\beta\le q\le n^\gamma}.
]
Consider the static carrier family
[
\mathcal E_Q
:=
{,2ab:\ a,b\ \text{odd primes},\ a\ne b,\ 2ab\le n,}
;\cup;
{,2qa:\ q\in Q,\ a\ \text{odd prime},\ a\ne q,\ 2qa\le n,}.
]

Every carrier here is squarefree with exactly three prime factors, so (\mathcal E_Q) is an antichain.

Now define
[
\mathcal M_Q
:=
{,m=qab:\ q\in Q,\ a,b\ \text{odd distinct primes},\ n/3<m\le n,}.
]

For any (m=qab\in\mathcal M_Q), let (T={q,a,b}). Then:

* every carrier in (\mathcal E_Q) contains (2), while (T) does not, so (T) is incomparable with every carrier;
* every proper subset of (T) is contained in a carrier:
  [
  {q,a}\subseteq {2,q,a},\qquad
  {q,b}\subseteq {2,q,b},\qquad
  {a,b}\subseteq {2,a,b}.
  ]

So (T) is a legal circuit. By the Circuit Lemma, (m) is a legal move, and any legal move comparable with (m) must be divisible by (m).

Because (m>n/3), any odd proper multiple of (m) exceeds (n). Any even multiple of (m) contains either (2qa), or (2qb), or (2ab), so it contains a carrier and is illegal. Hence:

[
\boxed{\text{Each }m\in\mathcal M_Q\text{ is an isolated maximal legal move.}}
]

That means once (\mathcal E_Q) has been installed, every element of (\mathcal M_Q) must be played individually by one side or the other before the game can end.

So the question becomes: how large is (|\mathcal M_Q|)?

Pick any fixed (\delta\in(0,1-\gamma)). For each (q\in Q) and each prime (a\le n^\delta), put
[
X:=\frac{n}{qa}.
]
Then (X\ge n^{1-\gamma-\delta}\to\infty). By the prime number theorem, for large (n),
[
\pi(X)-\pi(X/3)\gg \frac{X}{\log n}.
]
Every prime (b\in(X/3,X]) gives
[
\frac n3 < qab \le n,
]
so (m=qab\in\mathcal M_Q). Since (X/3\gg n^\delta), these (b)'s are (>a); if (b=q) happens, that costs at most one value, which is negligible.

Therefore
[
|\mathcal M_Q|
\gg
\sum_{q\in Q}\sum_{a\le n^\delta}
\frac{n}{qa\log n}
==================

\frac{n}{\log n}
\left(\sum_{q\in Q}\frac1q\right)
\left(\sum_{a\le n^\delta}\frac1a\right).
]
By Mertens,
[
\sum_{q\in Q}\frac1q \asymp 1
\quad\text{for any fixed polynomial window }[n^\beta,n^\gamma],
]
and
[
\sum_{a\le n^\delta}\frac1a \sim \log\log n.
]
So
[
\boxed{
|\mathcal M_Q|
\gg_{\beta,\gamma}
\frac{n\log\log n}{\log n}.
}
]

This gives the theorem:

[
\boxed{
\text{After the carrier family }\mathcal E_Q\text{ is installed, at least }
\gg \frac{n\log\log n}{\log n}
\text{ further moves are unavoidable.}
}
]

That is a direct static obstruction to an (O(n/\log n)) post-prefix resolution in the blocked-large-prime regime.

There is also a broader overlap obstruction. If one takes
[
\mathcal C_3:={,2pqr:\ p<q<r\text{ odd primes},\ 2pqr\le n,},
]
then every odd squarefree (m=pqrs\in(n/3,n]) is likewise an isolated maximal circuit. Counting such (m) gives
[
\gg \frac{n(\log\log n)^3}{\log n}
]
forced residual moves. That one is broader, but it uses unrestricted odd primes, so I view it as a general-overlap obstruction rather than a pure small-prime result.

What this means for the central problem is precise:

A Resolution-Theorem-style extension cannot work **after** an arbitrary overlapping prefix has already been created. In particular, gap (b) has a rigorous static obstruction of the exact (\log\log n)-loss shape that the naive pair-repair heuristics were running into.

So the only plausible route left to (L(n)=O(n/\log n)) is genuinely **online**: Shortener would have to stop these cone/spoke infrastructures from being installed in the first place. My result does not rule that out, so it does not settle (L(n)); but it does pin down where a post hoc extension must fail.

For sanity, I checked two instances in Python. At (n=10^6), the unrestricted (2pqr) cone already leaves (25{,}070) isolated maximal odd (4)-prime moves in ((n/3,n]). Also at (n=10^6), taking the fiber construction with (q\in[200,500]) already yields (7{,}209) isolated (qab)-moves. These match the theorem’s mechanism.
