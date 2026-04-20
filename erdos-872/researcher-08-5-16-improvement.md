---
id: R08-5-16-improvement
type: research
date: 2026-04-17
intent: >
  Improve the 13/36 upper bound by taking a longer odd-prime prefix k = floor(n/(2A log n))
  and optimizing the parameter A -> 2.
predecessors: [R07-13-36-closeout]
prompt: erdos-872/prompts/researcher-08-open-solution.md
action:
  kind: supersedes
  target: R07-13-36-closeout
claim: >
  For every A > 2: L(n) <= (1/2 - 1/(2A) + 1/(4A^2) + o(1))n.
  Optimizing A -> 2 gives L(n) <= (5/16 + o(1))n = (0.3125 + o(1))n,
  improving the 13/36 ~ 0.3612 bound.
failure_mechanism: >
  The 13/36 bound used k = sqrt(n)/log n (too short); the longer k = n/(2A log n)
  prefix achieves sum 1/q_j >= 1/A via the q_j <= A*j*log n bound,
  enabling the second Bonferroni at s_t in [1/A, 1/A + 1/3].
---

# Researcher output — $L(n) \le 5n/16 + o(n)$ via longer odd-prime prefix

**Source:** ChatGPT Pro (continuation of the 6B / 13-36 thread). Prompt: `prompts/researcher-08-open-solution.md`.
**Extracted:** 2026-04-18.
**Status:** rigorous; not yet audited; not yet Aristotle-verified. Improves the previous $13n/36 \approx 0.3611 n$ upper bound to $5n/16 = 0.3125 n$.

---

I can materially improve the upper bound.

A useful rephrasing is that this is the maximal independent set game on the divisibility-comparability graph on $\{2, \ldots, n\}$: a move picks a vertex and deletes its closed neighborhood. I did not settle the linear-vs-sublinear dichotomy, but the same odd-prime-prefix idea already gives a better constant than $13/36$.

For every fixed $A > 2$,
$$L(n) \le \left(\tfrac{1}{2} - \tfrac{1}{2A} + \tfrac{1}{4A^2} + o(1)\right) n.$$

Letting $A \downarrow 2$ yields
$$L(n) \le \left(\tfrac{5}{16} + o(1)\right) n = (0.3125 + o(1)) n.$$

So the established $13/36 \approx 0.3611$ can be replaced by $5/16 = 0.3125$.

The proof is short.

## A much longer odd-prime prefix is available

Fix $A > 2$, and let
$$k = \left\lfloor \frac{n}{2A \log n} \right\rfloor.$$

Shortener plays the smallest legal odd prime on her first $k$ turns.

If the game ends before her $k$-th turn, then the total number of moves is $< 2k = o(n)$, which is already stronger than any linear upper bound. So assume she does get $k$ such turns, and call her primes
$$q_1 < q_2 < \cdots < q_k.$$

**Claim:**
$$q_j \le A j \log n \qquad (1 \le j \le k).$$

Why? Suppose instead $q_j > X := A j \log n$. Then before Shortener's $j$-th move, every odd prime $< X$ is already illegal. Since Shortener has only played odd primes so far, each such prime is either one of $q_1, \ldots, q_{j-1}$, or divides one of Prolonger's first $j$ moves $a_1, \ldots, a_j$. Hence
$$\vartheta_{\text{odd}}(X) \le \sum_{r=1}^{j} \log \mathrm{rad}_{\text{odd}}(a_r) + \sum_{i < j} \log q_i \le j \log n + (j-1) \log X.$$

Because $j \le k$, we have $X \le n/2$, so $\log X \le \log n + O(1)$. Therefore the right side is
$$\le 2 j \log n + o(j \log n).$$

But $\vartheta_{\text{odd}}(X) = X + o(X) = A j \log n + o(j \log n)$, and $A > 2$ — contradiction.

So indeed $q_j \le A j \log n$. Therefore
$$\sum_{j \le k} \frac{1}{q_j} \ge \frac{1}{A \log n} \sum_{j \le k} \frac{1}{j} = \frac{1}{A} + o(1).$$

This is the key new point: the reciprocal mass is not stuck at $1/3$; with the same strategy it reaches $1/2 - o(1)$ in the limit $A \downarrow 2$.

## Run the same odd-part reduction, but with the longer prefix

Let $t \le k$ be minimal with
$$s_t := \sum_{j \le t} \frac{1}{q_j} \ge \frac{1}{A} - o(1),$$
and put $D = \{q_1, \ldots, q_t\}$.

As in your existing proof, the odd-part map is injective on the eventual antichain outside $D$, and every later chosen number has odd part coprime to all $q_j$. So if $N_D(n)$ denotes the number of odd integers $\le n$ coprime to $D$, then
$$|A_{\text{final}}| \le t + N_D(n).$$

Since $t \le k = O(n/\log n) = o(n)$, it remains to bound $N_D(n)$.

Now use second-order Bonferroni on the odd integers up to $n$:
$$N_D(n) \le \frac{n}{2} - \frac{n}{2} \sum_{j \le t} \frac{1}{q_j} + \frac{n}{2} \sum_{\substack{i < j \\ q_i q_j \le n}} \frac{1}{q_i q_j} + O(t + R_2(n)),$$
where
$$R_2(n) = \#\{(i, j) : i < j, q_i q_j \le n\}.$$

The error is still $o(n)$, because $t = o(n)$, and
$$R_2(n) \le \#\{p < q \text{ odd primes} : pq \le n\} \le \sum_{p \le \sqrt n} \pi(n/p) \ll \frac{n}{\log n} \sum_{p \le \sqrt n} \frac{1}{p} = o(n).$$

Also,
$$\sum_{\substack{i < j \\ q_i q_j \le n}} \frac{1}{q_i q_j} \le \sum_{i < j} \frac{1}{q_i q_j} \le \frac{s_t^2}{2}.$$

Hence
$$N_D(n) \le \frac{n}{2}\left(1 - s_t + \frac{s_t^2}{2}\right) + o(n).$$

Since $s_t \ge 1/A - o(1)$, and $f(s) = 1 - s + s^2/2$ is decreasing on $[0, 1]$, we get
$$N_D(n) \le \frac{n}{2}\left(1 - \frac{1}{A} + \frac{1}{2A^2}\right) + o(n).$$

Therefore
$$L(n) \le t + N_D(n) \le \frac{n}{2}\left(1 - \frac{1}{A} + \frac{1}{2A^2}\right) + o(n).$$

## Optimize

Now let $A \downarrow 2$. This gives
$$L(n) \le \frac{n}{2}\left(1 - \frac{1}{2} + \frac{1}{8}\right) + o(n) = \frac{5}{16} n + o(n).$$

That is the improvement.

## What changed relative to $13/36$

...is not the combinatorics of odd parts; it is the prefix length. The old $\sqrt n / \log n$ cutoff came from treating the pairwise Bonferroni error as $O(t^2)$. The true error only comes from prime pairs with product $\le n$, and there are only $o(n)$ of those, so the same strategy can be continued out to order $n/\log n$ turns.

## What this says about the bigger question

The odd-prime-prefix approach still has some slack left, but only constant-factor slack. The block-product counter still caps $\sum 1/q_j$ at $1/2 + o(1)$, so this line alone is not heading toward $O(n/\log n)$. My current read is that to get genuinely sublinear upper bounds, one really does need either a different Shortener family or an argument that uses the structure of Prolonger's composite moves, not just the divisor set $D$.
