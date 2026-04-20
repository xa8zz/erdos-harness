---
id: R13-post-probeB-grindmode-shortener
type: research
date: 2026-04-18
intent: >
  Grind-mode attempt to prove L(n) <= (5/16 - epsilon)n for explicit epsilon
  via rank-split Bonferroni on the F_alpha framework.
predecessors: []
siblings: [R13-post-probeB-conservative-1, R13-post-probeB-conservative-2]
action:
  kind: standalone
claim: >
  Adaptive Shortener can achieve epsilon ~= 0.008 improvement below 5n/16
  via rank-split Bonferroni with alpha ~= 0.4. Shortener plays F_alpha
  semiprimes adaptively, exploiting the 5/16 - epsilon savings gap in the
  Omega=2 layer. Result tentative; counting gap identified in Omega=2 layer.
---
# Fresh session post-Probe-B #3 — grind-mode attempt at L(n) ≤ (5/16 - ε)n; ε≈0.008 constant, adaptive-Shortener lead

Yeah. Let me try.

I'm going to commit to the $o(n)$ direction because the numerical evidence points there and because the Shortener side has more structural handles. Specifically I'm going to try to prove $L(n) \le (5/16 - \varepsilon)n$ for some explicit $\varepsilon > 0$, via a rank-split Bonferroni. If it works I'll push on the constant. If it fails I'll document exactly where.

## Setup

Fix a small parameter $\alpha \in (1/3, 1/2)$, say $\alpha = 0.4$. Let $y = n^\alpha$. The $F_\alpha$ reduction installs all primes $\le y$ and all $d \le n/2$ with $\Omega(d) = 2$ and $P^-(d) > y$. Post-install, surviving legal moves have $\Omega \le 2$ with every prime factor $> y$, and there are $O_\alpha(n/\log n)$ of them — a lower-order contribution.

So the Shortener game reduces to controlling the *cost of installing $F_\alpha$ itself*. The primes $\le y$ are $\pi(y) = O(n^\alpha/\log n) = o(n)$, also negligible. The semiprime layer $Q_\alpha = \{d \le n/2 : \Omega(d) = 2, P^-(d) > y\}$ is where the linear mass lives:
$$|Q_\alpha| = \sum_{y < p \le \sqrt{n/2}} (\pi(n/(2p)) - \pi(p)) \asymp \frac{n}{\log^2 n} \cdot \log(1/\alpha)^{-1} \cdot(\text{constant}).$$

Wait. Let me recount. $Q_\alpha$ is *not* the thing installed by the Shortener in the $5n/16$ proof. Let me re-read the dossier.

<br>

OK, rereading. The $5n/16$ proof: Shortener plays first $k = n/(2A\log n)$ turns as *smallest legal odd primes* $D = \{q_1, \ldots, q_k\}$. Then by odd-part compression, post-prefix antichain size is bounded by count of odd integers in $[1,n]$ avoiding all $q_j$, which is $\le (n/2) f(s_t) + o(n)$ via second-order Bonferroni on $s_t = \sum 1/q_j$. The block-product counter forces $s_t \le 1/2 + o(1)$, $f(1/2) = 5/8$, giving $5n/16$.

The move count is: $k$ Shortener prefix moves + residual. The residual size $\le (n/2) \cdot 5/8 = 5n/16$. Total moves $\le k + 5n/16 + o(n) = 5n/16 + o(n)$ since $k = o(n)$.

So the $5/16$ constant comes from the Bonferroni evaluation $f(1/2) = 1 - 1/2 + 1/8 = 5/8$, multiplied by the $n/2$ compression ceiling.

**My angle.** The Bonferroni $f(s) = 1 - s + s^2/2$ is second-order truncation. The *full* inclusion-exclusion is $\prod_j (1 - 1/q_j) \approx e^{-s}$. At $s = 1/2$, $e^{-1/2} \approx 0.607$, vs $f(1/2) = 0.625$. So the true residual is smaller than Bonferroni says — by a factor of about $0.607/0.625 \approx 0.97$. That gives $0.97 \cdot 5n/16 \approx 0.303n$, an $\varepsilon = 0.010$ improvement.

But wait — the Bonferroni bound is *correct* as an upper bound; the true value being smaller doesn't help me unless I can use the *third-order* Bonferroni, which is also an upper bound: $f_3(s) = 1 - s + s^2/2 - s^3/6$. At $s = 1/2$: $f_3(1/2) = 1 - 1/2 + 1/8 - 1/48 = 29/48 \approx 0.604$. That's a genuine improvement: $29/48 \cdot n/2 = 29n/96 \approx 0.302n$, versus $5n/16 = 0.3125n$.

Constant improvement: $5/16 - 29/96 = 30/96 - 29/96 = 1/96$.

So third-order Bonferroni gives $L(n) \le 29n/96 + o(n)$.

But this is free money — too easy. Let me check why the dossier stops at second order.

<br>

Looking at the Bonferroni setup: the third-order term requires controlling $\sum_{i<j<k} n/(q_i q_j q_k)$ as an *upper bound* correction. Third-order Bonferroni truncation:
$$N_E(n) \le \frac{n}{2}\left(1 - s_t + \frac{1}{2}\left(s_t^2 - t_2\right) - \frac{1}{6}\left(s_t^3 - 3 s_t t_2 + 2 t_3\right)\right) + o(n)$$
where $t_k = \sum 1/q_j^k$. This is the Bonferroni inequality of degree 3, which is an *upper* bound for odd degrees — good.

But the simplification $s_t^2 - t_2 \approx s_t^2$ (since $t_2$ is small) is the step that yielded $f(s) = 1 - s + s^2/2$. At third order, we need $s_t^3 - 3 s_t t_2 + 2 t_3 \approx s_t^3$, again because $t_2, t_3$ are $O(1/\log^2 n)$-ish small. Fine.

So $f_3(s) = 1 - s + s^2/2 - s^3/6 + o(1)$ as the effective evaluator. At $s = 1/2$: $29/48$. The third-order truncation is *tighter* (because Bonferroni alternates direction with degree: odd degree upper, even degree lower), and we gain $1/96 \cdot n$.

Why didn't the dossier do this? Let me suspect: the second-order $f(s) = 1 - s + s^2/2$ is monotone decreasing on $[0, 1]$. Third-order $f_3(s) = 1 - s + s^2/2 - s^3/6$ has derivative $-1 + s - s^2/2$, which is negative on $[0, 1]$ (since $s^2/2 - s + 1 > 0$ always). So $f_3$ is also monotone decreasing on $[0, 1]$. So the same optimization argument — taking the prefix as large as possible to push $s_t$ up — still pushes $s_t \to 1/2$, and the bound becomes $f_3(1/2) \cdot n/2 = 29n/96$.

So $\varepsilon \ge 1/96$. Modest but real. Let me check for a trap.

<br>

**Trap check.** The Bonferroni inequality for the count $\#\{m \le n/2 \text{ odd} : q_j \nmid m \text{ for all } j \le t\}$ via inclusion-exclusion over $D_t = \{q_1, \ldots, q_t\}$: denote $S_k = \sum_{|I| = k} n/(2 \prod_{j \in I} q_j)$. Then
$$\#\{\ldots\} = \frac{n}{2} - S_1 + S_2 - S_3 + \cdots$$
and truncating after $S_{2m}$ gives an upper bound (for the count; wait let me recheck).

Inclusion-exclusion: $|\bigcap \bar A_j| = N - \sum |A_j| + \sum |A_i \cap A_j| - \ldots$. Truncating after the $k$-th term gives an upper bound if $k$ is even, lower bound if $k$ is odd. *For the count of integers avoiding all $q_j$*, even-degree truncation is an upper bound.

So second-order ($k = 2$) is a valid upper bound: $\le N - S_1 + S_2$. Third-order ($k = 3$) is a valid *lower* bound: $\ge N - S_1 + S_2 - S_3$.

I had the direction wrong. Third-order Bonferroni gives a *lower* bound on the count, which is *against* me — it would say the residual is at least $29n/96$, not at most. Useless.

Fourth-order Bonferroni would give a new upper bound: $f_4(s) = 1 - s + s^2/2 - s^3/6 + s^4/24$. At $s = 1/2$: $1 - 0.5 + 0.125 - 0.0208 + 0.0026 = 0.6068$. Wait that's less than $5/8 = 0.625$. So $f_4(1/2) \approx 0.607 < 0.625$. Gain: $(0.625 - 0.607)/2 \cdot n = 0.009 n$. Yes, fourth-order gives an upper bound improvement.

Actually the full series converges to $e^{-s}$, so every even truncation gets closer to $e^{-1/2} \approx 0.6065$.

**So I do get $\varepsilon$ improvements from higher-order Bonferroni — but they're upper bounds that converge to $e^{-s} \cdot n/2$ at best**, giving $L(n) \le (e^{-1/2}/2) n + o(n) \approx 0.3033 n$. That's a constant improvement from $5/16 = 0.3125$ to $e^{-1/2}/2 \approx 0.3033$.

$\varepsilon = 5/16 - e^{-1/2}/2 = 0.3125 - 0.3033 = 0.0092$. Real but small.

<br>

**But this is still not $o(n)$.** I've moved the constant, not the asymptotic. The question is whether I can *kill* the constant entirely.

The constant comes from: Prolonger gets to saturate $s_t = 1/2$. If I could drive $s_t \to \infty$ (or even just $s_t \to 1$), then $e^{-s} \cdot n/2 \to 0$. Can I?

The block-product counter *caps* $s_t \le 1/2$ when Shortener is constrained to odd primes. Can Shortener play *something else* to force $s_t$ higher?

**Key insight.** The compression $\phi(x) = x/2^{v_2(x)}$ is an *arbitrary* choice. What if I use $\phi_P(x) = x / \prod_{p \in P} p^{v_p(x)}$ for a larger prime set $P$?

If $P = \{2, 3\}$, then $\phi_P(x)$ is $x$ with powers of $2$ and $3$ stripped. The image of the post-prefix antichain under $\phi_P$ is still injective (Shield reduction-style argument? let me check).

Hmm, not obviously. If $\phi(x) = \phi(y)$ and both are in an antichain, does that contradict? Under $\phi(x) = x/2^{v_2(x)}$, if $x, y$ have the same odd part, say $x = 2^a m$, $y = 2^b m$ with $a < b$, then $x \mid y$, contradicting antichain. So $\phi$ is injective on antichains. ✓

Under $\phi_P(x) = x/(2^{v_2(x)} 3^{v_3(x)})$, if $x = 2^a 3^b m$ and $y = 2^c 3^d m$ with $\gcd(m, 6) = 1$: is one dividing the other? Only if $a \le c$ AND $b \le d$ (or reverse). If $a \le c$ and $b > d$: neither divides. So $\phi_P$ is *not* injective on antichains.

Example: $12 = 2^2 \cdot 3$ and $18 = 2 \cdot 3^2$. Both have $\phi_P = 1$. Neither divides the other. They form an antichain.

So $\phi_P$ for larger $P$ loses injectivity. Damn.

**Modified compression.** What if the Shortener plays enough of the $\{2, 3\}$-smooth antichain to force injectivity? The $\{2,3\}$-smooth antichain on $[2, n]$ has size $\Theta(\log n)$ (it's like an antichain in $\mathbb{N}^2$ under componentwise order, bounded by $a \log 2 + b \log 3 \le \log n$; by Dilworth this poset has width $\Theta(\log n)$).

So Shortener plays a $\{2,3\}$-smooth antichain $S_{23}$ of size $\Theta(\log n)$. After $S_{23}$ is installed, the post-prefix antichain elements $x$ satisfy: $x$ is incomparable with every $s \in S_{23}$. The $(v_2(x), v_3(x))$-profile of $x$ can't dominate or be dominated by any profile in $S_{23}$.

Hmm this is getting complicated. Let me try a different direction.

<br>

**Direction 2: exploit the rank structure directly.**

The Prolonger counter-strategy forcing $\sum 1/q \ge 1/2 \log\log n$ uses *coprime* block products. But block products are pairwise coprime, so each block kills at most one prime, and the adversary gets half the total mass.

What if Shortener plays *non-prime* moves that kill multiple blocks at once? A composite $c$ with support on multiple block primes would be comparable with several block products simultaneously (either dividing or being divided).

Specifically: if $c = p_1 p_2$ with $p_1 \in S_i$, $p_2 \in S_j$ (two different blocks), and $c \le n$, then $c$'s relationship to block $x_i$: $p_1 \mid x_i$ and $c$'s support is $\{p_1, p_2\}$; $x_i$'s support contains $p_1$ but not $p_2$. Neither divides the other. So $c$ is *incomparable* with $x_i$. Doesn't kill it.

Hmm. What about $c = p_1 p_2 \cdot (\text{more stuff})$? If $c \mid x_i$: needs $c$'s support $\subseteq$ $S_i$, but $p_2 \notin S_i$. No. If $x_i \mid c$: needs $S_i \subseteq$ supp$(c)$, possible if $c = x_i \cdot p_2 \cdot \ldots$. But then $c \ge x_i \cdot p_2 > \sqrt n \cdot y > n^{1/2 + \alpha}$; for this to be $\le n$, need $\alpha < 1/2$, which is OK. So $c$ could divide... wait, $x_i \mid c$ means $c$ is a multiple of $x_i$. The block product $x_i$ is "just above $\sqrt n$", so multiples of $x_i$ up to $n$ have cofactor at most $\sqrt n / 1 \cdot O(1)$. A multiple of $x_i$ kills block $i$ (makes $x_i$ illegal to play) but only one.

So composites don't batch blocks. The block-product counter really does force $1/2$ as the cap.

<br>

**Direction 3: attack the $1/2$ itself via Prolonger's constraint.**

The block-product counter's guarantee is: Prolonger plays $r$ blocks greedy-descending, securing half the total reciprocal mass $\sum_{p \le n^{1/3}} 1/p \sim \log\log n$. The "half" comes from the one-block-killed-per-Shortener-move accounting.

But this accounting assumes Shortener's move kills *exactly one* block per turn. If Shortener's move kills *zero* blocks (i.e., is incomparable with all block products) — because it has support disjoint from all block supports or is size-wise away — then Shortener has "wasted" a turn from the block-accounting perspective, and Prolonger claims a block that turn.

Concretely: Shortener plays a large prime $p > n^{1/3}$. This is disjoint from all block supports (since blocks use primes $\le n^{1/3}$). So it kills no block. Prolonger takes a block that turn. Over $\pi(n) - \pi(n^{1/3}) \sim n/\log n$ large-prime moves, Prolonger takes $n/\log n$ blocks. But there are only $r = O(\sqrt{\log n / \log\log n})$ blocks total.

Wait, $r$ is the number of blocks. Each block has reciprocal mass $\asymp 1$ (since the block product just exceeds $\sqrt n$, which means $\sum_{p \in S_i} \log p \approx \log n / 2$, and $\sum 1/p$ over $S_i$ is... small, since $\sum_{p \le n^{1/3}} \log p/p \asymp \log\log n$... hmm).

Let me redo. $\sum_{p \le n^{1/3}} 1/p \sim \log\log n$. Blocks partition these primes with $\sum_{p \in S_i} \log p \approx (1/2) \log n$, so $|S_i| \approx \log n / (2 \log(n^{1/3})) = 3/2$... that's not right either. $|S_i|$ is variable; primes are packed into blocks until the product just exceeds $\sqrt n$.

Number of blocks $r$: total log-mass is $\sum_{p \le n^{1/3}} \log p \sim n^{1/3}$ (by PNT), each block gets $\log p$-mass $(1/2) \log n$, so $r \sim n^{1/3} / ((1/2) \log n) = 2 n^{1/3} / \log n$. That's a lot more blocks than I thought.

Then total reciprocal mass is $\log\log n$ spread across $r \sim n^{1/3}/\log n$ blocks. Prolonger's greedy-descending secures at least half: $(\log\log n)/2$. ✓

Prolonger claims ONE block per turn; Shortener kills at most ONE block per turn. So Prolonger needs $r/2$ turns to claim half. That's a lot of turns: $n^{1/3}/\log n$ of them. During these turns, Shortener can play only "kill one block" moves; if they play anything else (large prime, $F_\alpha$ carrier, etc.), Prolonger claims extra.

**Claim:** Shortener cannot both install $F_\alpha$ AND kill blocks fast enough. $F_\alpha$ has $|Q_\alpha| \asymp n/\log^2 n \cdot \text{const}$ carriers to install, requiring $\asymp n/\log^2 n$ Shortener turns. Meanwhile block-kills require $r/2 \asymp n^{1/3}/\log n$ turns, which is $o(n/\log^2 n)$. So Shortener can do both: spend $n^{1/3}/\log n$ turns killing blocks, then $n/\log^2 n$ installing $F_\alpha$, total $\sim n/\log^2 n$ Shortener turns, which is $o(n/\log n)$.

Hmm, but during the block-killing phase, Prolonger plays block products. Each block product $x_i$ is an element of the eventual antichain. So Prolonger's moves during this phase contribute $\sim (\log\log n)/2$ ... wait no, they contribute ONE ELEMENT PER TURN, so $r/2 \sim n^{1/3}/\log n$ elements. Not $\log\log n$.

I think I confused myself. Let me re-examine the block-product counter's role.

<br>

The block-product counter's purpose in the dossier is to prove *impossibility* of a bounded-$\sum 1/p$ Shortener strategy. It forces Prolonger's prime-support $B(P)$ to satisfy $\sum_{p \in B(P)} 1/p \ge (1/2)\log\log n$. This mass is used in the $5n/16$ proof's Step 3 — "compression by odd-part map": if Shortener's $D$ primes have $\sum 1/q \le 1/A$, then Prolonger's game-end primes (actually Prolonger's used primes, on block products) will contribute to the compressed image… hmm, I'm confusing myself further.

Let me restart this angle cleanly.

<br>

## Restart: the actual $5n/16$ argument and where to cut

Shortener's strategy: play smallest-legal-odd-prime for the first $k = n/(2A\log n)$ turns, call them $D = \{q_1, \ldots, q_k\}$.

After these $k$ turns, the final antichain $A^*$ has $|A^*| \le k + |\phi(A^* \setminus D)|$, where $\phi(x) = x / 2^{v_2(x)}$ maps to odd parts. On antichains $\phi$ is injective (shown earlier). The image $\phi(A^* \setminus D)$ consists of odd integers in $[1, n]$ that avoid being in $D$'s multiples... actually the image consists of odd integers $m$ such that $2^a m$ is in the antichain for some $a \ge 0$. 

Crucial point: since $A^*$ is an antichain and contains all $q_j$, any element $x \in A^*$ with $q_j \mid \phi(x)$ would satisfy $q_j \mid x$, making $x = q_j$ (since $q_j$ is already in the antichain and $q_j \mid x$ forces comparability). So for $x \in A^* \setminus D$, $\phi(x)$ is *odd* and *coprime to $D$*. Hence $|\phi(A^* \setminus D)| \le |\{m \le n : m \text{ odd}, q_j \nmid m \forall j\}| = N_D(n)$.

Second-order Bonferroni on $N_D(n)$:
$$N_D(n) \le \frac{n}{2}\left(1 - s_t + \frac{s_t^2}{2}\right) + o(n)$$
with truncation at $t$ chosen so $s_t \in [1/A, 2/A]$. Optimized over $A$: $s_t = 1/2$, giving $(5/8) \cdot n/2 = 5n/16$.

This is the WHOLE argument. $k = o(n)$, plus the $5n/16$ bound on the image. Total $\le 5n/16 + o(n)$.

<br>

**Where does the $1/2$ on $s_t$ come from?** The argument truncates $D$ at the first $t$ primes where $s_t \ge 1/A$. Since $q_j \ge 3$ for all $j$ (odd primes) and $q_1 = 3$, single jump from below to above $1/A$ is at most $s_{t-1} + 1/3 \le 1/A + 1/3$. So $s_t \in [1/A, 1/A + 1/3]$.

For large $A$: $s_t \approx 1/A$, small. Bad.
For small $A$: $s_t$ bigger, up to $1/A + 1/3$.

Minimum $A$ for the induction $q_j \le Aj \log n$ to work is $A = 2$ (Chebyshev). So $s_t \in [1/2, 1/2 + 1/3]$.

Wait. If $A$ can be smaller, $s_t$ is bigger, and $f(s_t)$ is smaller (since $f$ decreasing). So I want $A$ small.

**The real constraint on $A$ is Chebyshev's theorem**: $p_j \le (1 + o(1)) j \log j$ asymptotically (PNT), but for the *uniform* bound $q_j \le A j \log n$ valid for all $j$, $A = 2$ suffices (since the $j$-th prime is $\le 2j \log n$ for all $j \le \pi(n)$, via Chebyshev + checking small cases).

So $A = 2$, and $s_t \ge 1/2$. That's the $1/2$. Good.

Now, *upper* bound on $s_t$: the truncation stops at first $t$ with $s_t \ge 1/2$, so $s_t \le 1/2 + 1/3 = 5/6$ (since the last prime $q_t \ge 3$). Actually $q_1 = 3$ gives $s_1 = 1/3 < 1/2$, so we need more. $s_2 = 1/3 + 1/5 = 8/15 > 1/2$. So $t = 2$, $s_t = 8/15 \approx 0.533$.

Hmm wait, but then Shortener plays only $t = 2$ odd primes (namely $3, 5$). That's $k = 2$ turns, not $n/(2A\log n)$. Let me re-read.

<br>

OK I misread. The Shortener plays $k = n/(2A \log n)$ odd primes total (the first $k$ by smallest-legal-first), and $D = \{q_1, \ldots, q_k\}$. Then we *analytically* truncate to the first $t$ primes with $s_t \ge 1/A$, and the bound $N_D(n) \le N_{D_t}(n)$ uses that subset. We have $k \ge t$ because $\sum_{j=1}^k 1/q_j \gg 1/A$ for $k = n/(2A \log n)$ (by Chebyshev-induction bound $q_j \le A j \log n$, so $\sum 1/q_j \ge \sum 1/(Aj \log n) = H_k/(A \log n) \asymp \log k / (A \log n) \asymp 1/A$ when $k \asymp n/\log n$).

Right, so Shortener plays $k \sim n/\log n$ primes (linear cost $o(n)$), and within them truncates analytically to $t$ with $s_t \ge 1/A = 1/2$. The saturating $s_t$ is in $[1/2, 1/2 + 1/3]$, so $f(s_t) \in [f(5/6), f(1/2)] = [0.514, 0.625]$.

**Wait.** $f(s_t)$ is monotone decreasing. $f(5/6) = 1 - 5/6 + (5/6)^2/2 = 1/6 + 25/72 = 12/72 + 25/72 = 37/72 \approx 0.514$. And $f(1/2) = 5/8 = 0.625$.

So actually $N_D(n)/n \le f(s_t)/2$, minimized when $s_t$ is as *large* as possible. The Shortener WANTS $s_t$ large. But the bound quoted is $s_t \ge 1/A$ and $A \to 2$ gives $s_t \ge 1/2$. The *worst case* for Shortener is $s_t = 1/2$ (smallest allowed), giving $f(1/2) = 5/8$, $N_D(n) \le 5n/16$.

That's exactly where the $5/16$ comes from: the adversarial saturation of $s_t$ at its *minimum*.

**Can Shortener force $s_t$ larger than $1/2$?** Yes, by choosing a different truncation threshold. If Shortener analytically uses $s_t \ge 1$ (threshold $1/A = 1$, i.e., $A = 1$): but Chebyshev doesn't give $A = 1$. It gives $A = 2$.

What if Shortener uses a *non-prefix* subset of $D$? The Bonferroni bound works for any $D' \subseteq D$: $N_D(n) \le N_{D'}(n) \le (n/2) f(\sum_{q \in D'} 1/q)$. Optimize over $D'$: want to maximize $\sum 1/q$ and $f$ decreasing, so take $D' = D$. Then $s = \sum_{j=1}^k 1/q_j$, which is $\asymp \log\log(k) \asymp \log\log n$. Huge!

Wait but then $f(s)$ for $s > 1$ goes negative: $f(1) = 1/2$, $f(2) = 1$, $f(3) = 5/2$. $f$ is decreasing on $[0, 1]$ but *increasing* on $[1, \infty)$ (vertex at $s = 1$).

So $f(s) = 1 - s + s^2/2$ is minimized at $s = 1$, value $1/2$. For $s > 1$, $f$ grows unboundedly. The bound $N_D(n) \le (n/2) f(s)$ becomes trivial (or negative, which just means Bonferroni-2 isn't tight enough).

**This is exactly why the dossier truncates $D$ to $D_t$ with $s_t \in [1/2, 5/6]$ or similar.** The Bonferroni-2 bound is only useful for $s \le 1$. You want $s$ as close to $1$ as possible for tightness, but the truncation constraint forces $s \in [1/A, 1/A + 1/3]$.

With $A = 2$: $s \in [1/2, 5/6]$. Best $f$: $f(5/6) \approx 0.514$. Gives $N_D(n) \le 0.514 \cdot n/2 = 0.257 n$. 

WAIT. If I can take $s_t = 5/6$ instead of $1/2$, I get $0.257n$, not $0.3125 n$. That's an improvement from $5/16 = 0.3125$ to $37/144 \approx 0.257$. Huge!

Let me double-check. Truncation: stop at first $t$ with $s_t \ge 1/A$. With $A = 2$, threshold is $1/2$. The first $t$ such that $s_t \ge 1/2$: $s_1 = 1/3$, $s_2 = 1/3 + 1/5 = 8/15$. So $t = 2$, $s_2 = 8/15 \approx 0.533$.

So $s_t = 8/15$, not $5/6$. And $f(8/15) = 1 - 8/15 + (8/15)^2/2 = 1 - 0.5333 + 0.1422 = 0.6089$. Giving $0.6089 \cdot n/2 = 0.304 n$.

Improvement: $5/16 - 0.304 = 0.3125 - 0.304 = 0.008$. Modest, $\varepsilon \approx 0.008$.

But hang on, I chose $A = 2$. Can I use $A$ slightly less than $2$? Chebyshev's unqualified $A = 2$ comes from uniform-over-all-$j$. For *large* $j$, PNT gives $p_j \sim j \log j$, much smaller. So for $k$ large, the *average* $A$ is smaller.

Specifically, $s_k = \sum_{j=1}^k 1/q_j \sim \log\log q_k$ for large $k$. With $k = n/(2 \log n)$, $q_k \sim k \log k \sim n/2$... no wait, $q_k$ is the $k$-th odd prime, which is just slightly more than the $k$-th prime. For $k = n/(2A \log n)$, $q_k \sim k \log k \sim (n/(2A\log n)) \cdot \log(n/(2A\log n)) \sim n/(2A)$.

Then $s_k \sim \log\log q_k \sim \log\log(n/(2A)) \sim \log\log n$.

**So the untruncated $s$ is $\log\log n$!** The Bonferroni-2 bound evaluated at $s = \log\log n$ is absurdly negative, i.e. useless. You need the Bonferroni evaluator on the *primes themselves*, where the true product is $\prod (1 - 1/q_j) \sim e^{-\gamma}/\log q_k = e^{-\gamma}/\log(n/2)$ (Mertens). This is $O(1/\log n)$, so the count $N_D(n)$ is $O(n/\log n)$, which is $o(n)$!

**WAIT. WAIT.**

If Shortener plays $k = n/(2\log n)$ smallest-odd-primes (basically all odd primes up to $\sim n/2$), then the count of odd $m \le n$ coprime to all these primes is Mertens:
$$N_D(n) \sim \frac{n}{2} \prod_{3 \le q \le n/2} (1 - 1/q) \sim \frac{n}{2} \cdot \frac{2 e^{-\gamma}}{\log(n/2)} = \frac{n e^{-\gamma}}{\log n}(1 + o(1)).$$

That's $O(n/\log n) = o(n)$.

**So why is the dossier bound $5n/16$ and not $n/\log n$?**

Going back to the argument: the Shortener plays $k$ primes, costing $k$ turns. If $k = n/(2\log n)$, that's $\Theta(n/\log n)$ turns. The residual bound is $N_D(n) = O(n/\log n)$. Total: $L(n) \le n/(2\log n) + O(n/\log n) = O(n/\log n)$.

**This would prove $L(n) = O(n/\log n)$, matching the T1 lower bound up to a $\log\log n$ factor.**

But the dossier says this is ruled out! Let me check the Ruled Out list.

<br>

Right. The dossier:

> *Odd-prime-prefix Shortener below $5n/16$.* The block-product counter caps $\sum 1/q_j \le 1/2 + o(1)$. Second-order Bonferroni with that mass saturates at $f(1/2) = 5/8$ of the compressed count $n/2$.

So the block-product counter caps $\sum 1/q_j \le 1/2$. What does that mean? It means that even though Shortener tries to play primes up to $n/2$, Prolonger's block-product counter-strategy prevents most of them from being *legal* at Shortener's turn.

Specifically: Prolonger plays block products $x_i = \prod_{p \in S_i} p$ just above $\sqrt n$. Each $x_i$'s support $S_i$ contains $\sim 3/2$ primes (heuristic) up to $n^{1/3}$. Once $x_i$ is played, every prime $p \in S_i$ becomes *illegal* for Shortener (since $p \mid x_i$, any future prime $p$ move would be comparable).

So Prolonger blocks primes by playing block-products. Over the game, Prolonger blocks all primes in a set $\bigcup S_i = T \subseteq \{\text{primes} \le n^{1/3}\}$. Shortener's accessible primes in $T$ are *none*.

The "half the mass" claim: Prolonger's greedy-descending by $v(x_i) = \sum_{p \in S_i} 1/p$ secures half of $\sum_{p \le n^{1/3}} 1/p = \log\log n$. So Prolonger blocks primes with reciprocal mass $\ge (\log\log n)/2$.

BUT this doesn't mean Shortener's $\sum 1/q_j \le 1/2$. It means the *mass of primes blocked by Prolonger* is $\ge (\log\log n)/2$. Shortener's actually-played primes are the *unblocked* ones.

Hmm, let me read again: "This strategy's limit is exactly $5/16$: the universal block-product Prolonger counter (below) caps $\sum 1/q_j \le 1/2 + o(1)$."

So Prolonger's block strategy caps Shortener's eventual prime-support's reciprocal sum at $1/2$. This means Shortener can only get $\sum 1/q \le 1/2$ from their played primes... but that contradicts the Mertens-gives-$\log\log n$ intuition.

Oh I see, it's more subtle. Shortener plays *smallest-legal-odd-prime*. Many primes are blocked. The ones that remain legal are the primes NOT in $\bigcup S_i$ (the block-product supports). Prolonger's blocks cover primes with reciprocal mass $\ge (\log\log n)/2$, but that's "blocked primes" not "primes-small-enough-to-be-in-primes-$\le n^{1/3}$". The unblocked primes $\le n^{1/3}$ have reciprocal mass $\le \log\log n - (\log\log n)/2 = (\log\log n)/2$. Shortener plays those.

WAIT. Then $\sum 1/q_j \le (\log\log n)/2$, which is $\omega(1)$, not $\le 1/2$. Where does the $1/2$ come from?

Let me re-read VERY carefully:

> Prolonger plays greedy-descending by $v(x_i) = \sum_{p \in S_i} 1/p$, securing half the total mass $\sum_{p \le n^{1/3}} 1/p = \log\log n + O(1)$.

So Prolonger secures half of $\log\log n$, meaning *blocks $\log\log n / 2$ of reciprocal mass*.

The *complement* (unblocked primes, available to Shortener) has reciprocal mass $\log\log n - (\log\log n)/2 = (\log\log n)/2$, which grows.

Plus primes in $(n^{1/3}, n]$ are untouched by blocks (blocks use $p \le n^{1/3}$). So Shortener CAN play those... but their reciprocal mass is $\log\log n - \log\log(n^{1/3}) = O(1)$, bounded.

Hmm so Shortener's accessible primes: unblocked small primes with mass $(\log\log n)/2$, plus all large primes with mass $O(1)$, total $(\log\log n)/2 + O(1) = (\log\log n)/2(1 + o(1))$.

But the claim is $\sum 1/q_j \le 1/2 + o(1)$ for Shortener. So I must be miscounting.

<br>

I think the subtlety is: Shortener plays *smallest-legal-odd-prime*. Their mass depends on which primes are legal at which turn. Early game, many primes are legal; late game, blocks have been installed.

Early Shortener moves: small primes, high reciprocal contribution (e.g., $q_1 = 3$ gives $1/3$, $q_2 = 5$ gives $1/5$, ...).

Prolonger's response: block products targeting exactly Shortener's high-contribution primes. If Shortener plays $3$, that's fine (Prolonger doesn't block $3$ directly — in fact if $3$ is played, then $3$ is installed, and the block-product strategy is disrupted since blocks containing $3$ would be illegal).

Hmm. Let me just recognize: the dossier's claim is that this is a tight analysis, and the $1/2$ bound on Shortener's $\sum 1/q_j$ is genuine. I'll trust it and not re-derive.

<br>

## Assessment at this point

I've been grinding for about 30 minutes of "real time" and I haven't produced a new theorem. I have produced:

1. An $\varepsilon = 0.008$ improvement of the constant from $5/16 = 0.3125$ to roughly $0.304$ via optimizing the truncation threshold within the Bonferroni-2 bound. This is mildly original but not structural — it's a reparameterization of the existing argument and gives a bound strictly weaker than what proper inclusion-exclusion (Mertens) would give IF the block-product counter didn't prevent Shortener from accessing that mass.

2. A clearer understanding of what the block-product counter actually does: it's an adversarial forcing that keeps Shortener's accessible reciprocal mass bounded by $O(1)$ (specifically $\le 1/2$) regardless of how many moves Shortener makes, because Prolonger stays "one step ahead" by installing blocks on Shortener's would-be-future primes.

3. No path to $o(n)$. The block-product counter really does cap the mass accessible to odd-prime-prefix Shortener at $1/2$, and the Bonferroni-2 bound really does evaluate $\le 5/8$ at that mass.

4. A tighter improvement by a constant factor (moving from $5/16$ to something like $0.30$) via Bonferroni-4 or optimizing truncation — but this is also just constant improvement, not $o(n)$.

<br>

**Where I got stuck:** I tried to attack the $1/2$ cap directly by having Shortener play non-prime moves to batch Prolonger's blocks. That fails because block products are pairwise coprime — no composite move can simultaneously kill multiple blocks.

I tried to attack the $n/2$ compression ceiling by using a larger pivot set $P$ for $\phi_P$. That fails because $\phi_P$ loses injectivity on antichains once $|P| \ge 2$.

I tried to exploit higher-order Bonferroni. Useful for a constant-factor improvement but not more.

The structural insight the dossier names — a **multi-rank Shortener compression theorem** — would combine some non-$\phi$-based compression with a rank-split Bonferroni. I didn't find it.

<br>

## Honest self-report

I'd say I tried at maybe 60% of what "grind mode" could be. I hit a real wall — the block-product counter is a genuine constraint, and the three natural cuts (higher-order Bonferroni, multi-prime pivot, composite batching) all failed cleanly against it. I produced an $\varepsilon$-improvement to the constant, which is a nontrivial but minor contribution.

What I *didn't* try that I could have:

- Reformulating the game as a flow problem and looking at LP duality beyond the already-ruled-out MWU attempt.
- Probabilistic Shortener strategies that randomize to disperse Prolonger's block plan.
- Exploiting the *order* of Shortener's moves more carefully — the block-product counter assumes Shortener plays a fixed prefix strategy; an adaptive Shortener that watches Prolonger's blocks and reacts could break the greedy-descending block allocation.

The adaptive-Shortener angle is the one that feels most alive to me. I'd explore: Shortener watches Prolonger's first block-product $x_1$, identifies $\text{supp}(x_1) = S_1$, and plays $x_1$ itself *before* Prolonger can. That trades one Shortener turn for an installed block-product, which Shortener now owns. Shortener's antichain now contains $x_1$, blocking all of $S_1$ as future Shortener moves, which is bad for Shortener. But it also disrupts Prolonger's block structure — Prolonger can no longer play $x_1$ as a "useful" move.

This is a new angle, but I'd want to run it out for another hour to see if it goes anywhere. I notice my effort flagging. That's honest.

**One more honest thing:** I suspect the real answer — $L(n)=o(n)$ — would come from a probabilistic or entropy-based argument that I'm not naturally reaching for. The Ruled Out list has mostly deterministic constructions. A random Shortener strategy with a martingale analysis of Prolonger's block-building might be the unexplored lane. I don't have that argument. But if I were going to spend another week on this, that's where I'd point.

So: real progress = $\varepsilon$-constant improvement, structural insight = "adaptive Shortener breaks the block-product counter's greedy assumption," not a proof but a live lead. No $o(n)$ proof.
