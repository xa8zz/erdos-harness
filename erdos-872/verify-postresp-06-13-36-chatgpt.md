# Audit — ChatGPT-thinking on Pro's 13/36 upper bound (Round 6, Prompt 6B)

**Source:** ChatGPT with thinking mode (web tab). Extracted 2026-04-18.
**Prompt sent:** `prompts/verify-postresp-06-shortener-13-36.md`.
**Verdict:** **Not fatally broken; essentially correct but not fully written up rigorously yet.** Compression map and second-order Bonferroni are SOUND (audit checks the Bonferroni direction explicitly: $N_D \le |\mathcal{O}| - \sum|U_q| + \sum|U_q \cap U_r|$ is correct via a lower-bound on the union). **Weakest link: the prefix-stage executability** — the proof never explicitly shows that at each of Shortener's first $k$ turns a legal odd prime exists. Repairable: same log-mass argument bounds blocked log-mass by $(3/2+o(1))\sqrt n \ll n$, so legal primes remain. Step 1 uses PNT-level input (not just Chebyshev), and needs uniformity statement. $13/36$ is not sharp: big slack is in $S \ge 1/3$, not in Bonferroni.

**Note: audit finds Bonferroni step SOUND, in disagreement with the Gemini audit (`verify-postresp-06-13-36-gemini.md`) which flags it as BROKEN due to parabola-direction issue. Needs reconciliation.**

---

## ChatGPT said

My verdict: **the proof is not obviously broken, but it is not fully rigorous as written**. The tail of the argument — compression to odd $D$-free integers and the Bonferroni upper bound — looks sound. The **weakest link** is the **front-end prime-prefix argument**, especially the fact that the strategy is not explicitly proved to be executable for $k$ turns and the Step 1 induction is stated a bit too loosely. I think those issues are **repairable**, so I would not reject the $13/36$ claim outright, but I also would not call the writeup fully closed without patching them.

Here is the adversarial audit.

1. 
**Step 1: the $q_j \le (3/2+\varepsilon)j\log n$ induction**

This is the delicate part, but I do not think it breaks.

For 1(a): the log-mass accounting is okay, but it should be written more carefully.

Before Shortener’s $j$-th move, if every odd prime $p\le y$ is blocked, then each such $p$ is either:

- 
one of the earlier Shortener primes $q_1,\dots,q_{j-1}$, or

- 
a prime dividing at least one of Prolonger’s first $j$ moves $x_1,\dots,x_j$.

So if $P_j$ is the set of odd primes dividing $x_1\cdots x_j$, then

$$\sum_{p\in P_j}\log p
= \log \operatorname{rad}_{\mathrm{odd}}(x_1\cdots x_j)
\le \log(x_1\cdots x_j)
\le j\log n.$$

Hence

$$\vartheta_{\rm odd}(y)\le j\log n+\sum_{i<j}\log q_i.$$

That is valid. Shared primes across different Prolonger moves do **not** hurt the argument; if anything, they only make the bound cruder.

For 1(b): the induction closure is also okay, but the displayed estimate in the proof is too compressed.

From $q_i\le C\,i\log n$ with $C=3/2+\varepsilon$,

$$\sum_{i<j}\log q_i
\le \sum_{i<j}\log(C\,i\log n)
= (j-1)\log(C\log n)+\log((j-1)!).$$

By Stirling,

$$\log((j-1)!)
= j\log j - j + O(\log j),$$

so

$$\sum_{i<j}\log q_i
\le j\bigl(\log(C\log n)+\log j -1\bigr)+O(\log j).$$

Since $j\le \sqrt n/\log n$,

$$\log j \le \tfrac12\log n - \log\log n + O(1),$$

and therefore

$$\sum_{i<j}\log q_i \le \Bigl(\tfrac12+o(1)\Bigr)j\log n.$$

So that part closes.

For 1(c): the proof says “by Chebyshev,” but it is really using a **PNT-level** input:

$$\vartheta_{\rm odd}(y)=y+o(y).$$

That is strong enough here. The only possible worry is uniformity because $y=(3/2+\varepsilon)j\log n$ ranges from about $\log n$ up to about $\sqrt n$. But the minimum $y$ still tends to infinity, so one can make it uniform by writing

$$\delta(T):=\sup_{t\ge T}\frac{|\vartheta_{\rm odd}(t)-t|}{t}\to 0,$$

and then taking $T=(3/2+\varepsilon)\log n\to\infty$. So the contradiction still works.

So Step 1 is **not broken**, but it needs to be stated more carefully, and it uses the prime number theorem, not merely “Chebyshev bounds.”

1. 
**The harmonic-sum lower bound $S\ge 1/3-o(1)$**

This arithmetic checks out.

From $q_j\le Cj\log n$,

$$S:=\sum_{j\le k}\frac1{q_j}
\ge \frac1{C\log n}\sum_{j\le k}\frac1j
= \frac{H_k}{C\log n}.$$

With

$$k=\left\lfloor \frac{\sqrt n}{\log n}\right\rfloor,
\qquad
\log k=\tfrac12\log n-\log\log n+O(1),$$

we get

$$H_k=\log k+O(1)=\tfrac12\log n-\log\log n+O(1),$$

hence

$$S\ge \frac{1}{C\log n}\Bigl(\tfrac12\log n-\log\log n+O(1)\Bigr)
= \frac1{2C}+o(1).$$

Putting $C=3/2+\varepsilon$,

$$S\ge \frac1{3+2\varepsilon}+o(1).$$

Then for each fixed $\eta>0$, choose $\varepsilon$ small and then $n$ large, giving

$$S\ge \frac13-\eta.$$

So $S\ge 1/3-o(1)$ is fine.

1. 
**The compression map $\phi(x)=3^bm$**

This part is basically sound.

For 3(a): yes, $\phi$ is well-defined on $A'$. Every move in $A'$ occurs after all primes in $D=\{q_1,\dots,q_k\}$ have already been played, so any later legal move must avoid divisibility by every $q\in D$. Thus every $x\in A'$ is $D$-free.

For 3(b): yes, injectivity follows exactly as claimed. If

$$x=2^a3^bm,\qquad y=2^{a'}3^{b'}m',
\qquad \phi(x)=\phi(y),$$

then $3^bm=3^{b'}m'$, so $x/y$ is a power of $2$. Hence one divides the other. Since $A'$ is an antichain, this forces $x=y$.

For 3(c): also yes. $\phi(x)$ is odd, $\phi(x)\le x\le n$, and because $\phi(x)\mid x$, any $q\in D$ dividing $\phi(x)$ would also divide $x$, impossible.

The “subtle case” in your prompt is harmless. If $3\in D$, then every $x\in A'$ is automatically not divisible by $3$, so $b=0$ for all $x$, and $\phi$ just becomes the odd part. The injection still works.

1. 
**The second-order Bonferroni sieve**

This also checks out.

For 4(a): the direction is correct. Let $U=\bigcup_{q\in D}U_q$. Then

$$N_D(n)=|\mathcal O\setminus U|=|\mathcal O|-|U|.$$

To upper-bound $N_D(n)$, we need a **lower** bound on $|U|$. The second Bonferroni bound gives

$$|U|\ge \sum_q |U_q|-\sum_{q<r}|U_q\cap U_r|,$$

hence

$$N_D(n)\le |\mathcal O|-\sum_q|U_q|+\sum_{q<r}|U_q\cap U_r|.$$

So the sign is right.

For 4(b): yes,

$$k^2=\frac{n}{(\log n)^2}=o(n).$$

For 4(c): yes,

$$\sum_{q<r}\frac1{qr}
=\frac12\left(S^2-\sum_q\frac1{q^2}\right)\le \frac{S^2}{2}.$$

For 4(d): yes,

$$1-\frac13+\frac1{18}=\frac{13}{18},
\qquad
\frac n2\cdot \frac{13}{18}=\frac{13n}{36}.$$

So Step 3 is fine.

1. 
**Total move count**

This is fine.

At most $2k$ moves occur before the tail $A'$: $k$ Shortener moves and at most $k$ Prolonger moves interleaved with them. If the game ends earlier, that only helps Shortener. So

$$L(n)\le 2k+|A'|\le 2k+N_D(n)=\frac{13}{36}n+o(n),$$

since $k=\sqrt n/\log n=o(n)$.

No hidden counting error there.

1. 
**Does the strategy actually exist for $k$ turns?**

This is the one real gap in the writeup. The proof never explicitly shows that on each of Shortener’s first $k$ turns there is a legal odd prime to play.

I do think this is repairable, and the same log-mass argument already gives it.

Before Shortener’s $j$-th move, the total log-mass of blocked odd primes is at most

$$j\log n+\sum_{i<j}\log q_i
\le \Bigl(\tfrac32+o(1)\Bigr)j\log n
\le \Bigl(\tfrac32+o(1)\Bigr)\sqrt n.$$

But

$$\vartheta_{\rm odd}(n)=n+o(n),$$

so for large $n$ that blocked mass is far too small to cover **all** odd primes up to $n$. Therefore at least one legal odd prime remains, and the “smallest legal odd prime” is well-defined.

So the strategy is probably executable, but this lemma must be added. As written, that is the biggest hole.

1. 
**Independent numerical stress test**

I did two kinds of computation.

First, I solved the game exactly for the version where Shortener is forced to use this prefix for small $n$. For $n=40$ and $42$, the exact values are $16$ and $17$, both above $13n/36$. That does **not** refute the asymptotic claim; it just means the $o(n)$ term is large at small $n$.

Second, I ran heuristic larger-$n$ simulations with:

- 
Shortener using “smallest legal odd prime” for the first $k=\lfloor \sqrt n/\log n\rfloor$ turns, then a greedy shortening move,

- 
Prolonger using two greedy heuristics, one aimed at keeping the game flexible and one aimed at blocking small primes during the prefix.

The totals I got were:

- 
$n=100$: $25$ moves

- 
$n=1000$: $168$–$170$ moves

- 
$n=10000$: $1229$–$1248$ moves

Compare with

$$\frac{13}{36}n \approx 36.1,\ 361.1,\ 3611.1.$$

So I found **no numerical counterevidence**. But this is only a heuristic stress test, not an optimal-Pro certificate.

1. 
**Sharpness**

The $13/36$ is clearly **not sharp** within the broader problem, and probably not sharp even within this proof family.

There are two sources of slack.

The main one is the lower bound

$$S=\sum_{q\in D}\frac1q \ge \frac13-o(1).$$

That is the real bottleneck. If you could push $S$ materially above $1/3$, the constant would drop noticeably.

The second-order sieve is only a small source of loss here. With $S=1/3$, the quadratic truncation gives

$$\frac12\left(1-\frac13+\frac1{18}\right)=\frac{13}{36}\approx 0.36111.$$

An “independence heuristic” would suggest about

$$\frac12 e^{-S} = \frac12 e^{-1/3}\approx 0.35827,$$

which is only about $0.0028$ better. So higher-order Bonferroni or Brun-type improvements help, but not dramatically unless $S$ itself improves.

So yes: the proof leaves slack, but the **big slack is in $S$, not in the second-order sieve**.

1. 
**Literature / novelty**

I cannot responsibly settle this under your no-browsing constraint. I do not know from raw memory of the area whether $13/36$ has appeared before in this exact game. Given the context you supplied, it would be a meaningful improvement over the quoted $0.416$ frontier, but I cannot certify novelty without searching.

So the bottom line is:

- 
**Not fatally broken.**

- 
**Weakest link:** the prefix stage, especially the missing proof that the “smallest legal odd prime” move exists for all first $k$ Shortener turns, plus the need to state the Step 1 induction with proper PNT-uniformity.

- 
**Compression map and sieve tail:** sound.

- 
**Overall status:** I would label it **“essentially correct but not fully written up rigorously yet.”**

If you want the cleanest next step, it is to rewrite Step 1 as a lemma that simultaneously proves both:

$$q_j \le (3/2+\varepsilon)j\log n
\quad\text{and}\quad
\text{the \(j\)-th smallest legal odd prime exists for all } j\le k.$$

That is the one place an adversarial referee will press hardest.