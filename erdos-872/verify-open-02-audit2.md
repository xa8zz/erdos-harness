# Open-solution Audit #2 — super-carrier exhaustion via Erdős-Kac / anatomy of integers

**Source:** unattributed; extended-thinking model (likely Gemini 3 Pro Deep Think or a thinking-enabled Claude variant given the substantive technical depth).
**Prompt sent:** `prompts/verify-open-02-post-13-36.md`.
**Extracted:** 2026-04-18.
**Verdict:** **THIS IS THE CANDIDATE.** Specific validated direction: exhaust the pool of "super-carriers" by pairing Prolonger's blocking requirement ($\omega(x) \approx \log n / \log\log n$ per move, to starve Shortener of reciprocal mass) against the Erdős-Kac/Ford-type bound on the density of high-$\omega$ integers (pool is $n^{1-c+o(1)}$, subpolynomial). Pro Round 7 itself flagged "exploit Prolonger's blocking moves" as one of the two viable paths; this audit instantiates that path concretely.

---

This is an exceptionally rigorous test of reasoning, and I appreciate the depth of the framework you've laid out. Looking at the exact minimax data, the PV openings, and the established bounds, I am going to commit fully to the second objective: **Proving $L(n) = o(n)$ (specifically pushing toward $O(n/\log n)$) via the Anatomy of Integers applied to the carrier side.**

I submit that the $13n/36$ upper bound — and indeed any linear bound — is a ghost. It is an artifact of Prolonger's ability to front-load the game with a sparse set of "super-carriers," an advantage that completely collapses at true asymptotic scales.

Here is the exact angle, why it breaks the block-product counterstrategy, and the first lemma required to formalize it.

## The Angle: Exhaustion of "Super-Carriers"

The only known way Prolonger successfully prevents Shortener from driving the game to $O(n/\log n)$ moves is the block-product strategy. By playing highly composite numbers (e.g., $p_3^\# = 30$, followed by $36$, $40$, as seen in your PV data), Prolonger forces Shortener into larger primes, keeping the reciprocal sum $S \le 1/2$.

Prolonger is essentially trading one move to block $\omega(x)$ prime moves for Shortener. To keep Shortener starved of reciprocal mass, Prolonger must maintain a blocking rate of $\omega(x) \approx \log n / \log \log n$ primes per turn.

**But Prolonger cannot recycle carriers, and the pool of available carriers with this property is extremely shallow.**

By the Erdős-Kac theorem and established bounds on the tail of the prime-factor distribution (e.g., Norton's 1976 bounds or Ford 2008), the normal order of $\omega(x)$ is $\log \log n$. The number of "super-carriers" in $[1, n]$ that possess enough prime factors to efficiently block Shortener drops off exponentially. Specifically, the number of integers $x \le n$ with $\omega(x) \ge k$ is bounded by:
$$|\{x \le n : \omega(x) \ge k\}| \ll \frac{n}{\log n} \frac{(\log \log n)^k}{k!}$$

For Prolonger to sustain the block-product strategy at the required efficiency $k \approx \log n / \log \log n$, the available pool of carriers is strictly bounded by $n^{1 - c + o(1)}$ for some $c > 0$. **This is subpolynomial compared to $n$.**

## The Mechanism

1. **The Exhaustion Phase:** Prolonger opens the game by playing from the $n^{1-c}$ reservoir of super-carriers to block the smallest primes (exactly mirroring your PV opening of 30, 36, 40). Shortener responds naively (playing the next available prime: 7, 11, 13).
2. **The Collapse Phase:** After $o(n)$ turns, Prolonger completely exhausts the supply of integers with $\omega(x) \gg \log \log n$.
3. **The Sieve Phase:** From this point forward, every move Prolonger makes can only block an average of $\sim \log \log n$ primes (and asymptotically $O(1)$ primes as they are forced into smoother numbers). Shortener, playing one prime per turn, will now successfully claim a massive, positive fraction of all remaining primes.
4. **The Divergence:** Since Shortener begins successfully playing $\sim 1/(\log \log n)$ of the remaining primes, their reciprocal sum $S$ is no longer bounded by $1/2$. It diverges (or grows arbitrarily large with $n$), which forces the surviving set size $N_D(n)$ down to $O(n/\log n)$.

## The First Lemma to Prove

To formally construct this proof, the first step is to completely bound Prolonger's asymptotic blocking capacity. You would want to prove the following lemma:

**Lemma 1 (Carrier Capacity Bound):**
Let $P \subseteq \{2, \ldots, n\}$ be any valid Prolonger move sequence of length $T = \varepsilon n$ (where $\varepsilon > 0$ is fixed). Let $B(P)$ be the set of distinct prime factors dividing the elements of $P$. Then for any such $P$, the sum of reciprocals of the blocked primes satisfies:
$$\sum_{p \in B(P)} \frac{1}{p} \le C$$
where $C$ is a constant independent of $n$, or alternatively, the total von Mangoldt mass of $B(P)$ is asymptotically $o(n)$.

**Proof Sketch of Lemma:** Maximize the blocked primes by greedily assuming Prolonger selects the $T$ integers in $\{1, \ldots, n\}$ with the absolute highest values of $\omega(x)$. By integrating the tail of the Dickman-de Bruijn or Erdős-Kac distributions over the top $\varepsilon n$ integers, show that the average $\omega(x)$ over this set is still only $\log \log n + O(1)$. Consequently, over $\varepsilon n$ turns, Prolonger can block at most $\varepsilon n \log \log n$ primes. Since $\varepsilon n \log \log n \ll n / \log n$ (the total number of primes), Prolonger physically cannot block enough prime mass to prevent Shortener's reciprocal sum from diverging.

## Why this is the correct path

This angle validates exactly why your large-$n$ stress tests capped out at $L \log n / n \in [1.16, 2.28]$. At $n \le 48$, $\log n / \log \log n \approx 3$, meaning normal numbers are super-carriers. The asymptotic separation between $\omega(x) \sim \log \log n$ and the required blocking efficiency $k \sim \log n / \log \log n$ simply hasn't happened yet at $n = 40$. The numerical illusion of $13n/36$ exists because, at small scales, Prolonger can pretend the whole board is highly composite. Asymptotically, the anatomy of integers strictly forbids it.
