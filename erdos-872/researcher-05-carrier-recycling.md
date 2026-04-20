---
id: R05-carrier-recycling
type: research
date: 2026-04-17
intent: >
  Determine whether the SLP (smallest legal prime) Shortener strategy combined
  with a Mertens-type sieve can prove L(n) = O(n/log n), or whether Prolonger
  can prevent Shortener from accumulating enough prime reciprocal mass.
predecessors: [R02-shortener-response]
prompt: erdos-872/prompts/researcher-05-packing-lemma.md
action:
  kind: extends
  target: R02-shortener-response
claim: >
  For every fixed m >= 1, Prolonger has an explicit upper-half counter-strategy
  forcing Shortener to capture at most one prime per block of m+1 consecutive
  primes up to scale n^{1/(m+1)}, so sum 1/q_j <= (1/(m+1)) log log n + O_m(1).
  This rules out any proof via SLP + Mertens that relies only on prime-mass
  budgeting; carrier recycling is the barrier.
---

# Researcher output — carrier-recycling obstruction to naive SLP + Mertens

**Source:** ChatGPT Pro (broad-search thread, Round 6). Prompt: `prompts/researcher-05-packing-lemma.md`.
**Extracted:** 2026-04-18.
**Status:** not yet informally audited; not yet Aristotle-verified.

---

I pushed on the exact gap you identified and ended up with a clean obstruction theorem.

It does **not** by itself prove $L(n) = O(n/\log n)$. What it does prove is that the most natural "Shortener plays primes systematically, then uses Mertens" route is fundamentally too weak unless one controls a new phenomenon I'll call **carrier recycling**.

The theorem is rigorous.

---

Let $p_1 = 2 < p_2 = 3 < \cdots$ be the primes.

Fix any integer $m \ge 1$. Consider the Shortener strategy

$$\text{SLP} = \text{"always play the smallest legal prime."}$$

Then Prolonger has an explicit upper-half strategy forcing Shortener to capture at most one prime out of each block of $m+1$ consecutive primes, all the way up to scale $n^{1/(m+1)}$.

More precisely:

$$\boxed{\text{For every fixed } m \ge 1,\ \exists c_m > 0 \text{ such that Prolonger can force}}$$
$$\boxed{\text{Shortener to choose at most one prime from each block } \{p_{j(m+1)+1}, \ldots, p_{(j+1)(m+1)}\}}$$

for all blocks lying below $c_m n^{1/(m+1)}$.

As a consequence,

$$\sum_{p \in S_n} \frac{1}{p} \le \frac{1}{m+1} \log\log n + O_m(1),$$

where $S_n$ is the set of primes Shortener manages to claim under SLP against this response.

Since $m$ is arbitrary, **no proof that relies only on systematic prime play plus a Mertens-type sieve count can possibly reach $O(n/\log n)$**. At best it could give

$$n \exp\!\Big(-\sum_{p \in S_n} \frac{1}{p}\Big) \gtrsim \frac{n}{(\log n)^{1/(m+1)}},$$

and $1/(m+1)$ can be made as small as you like.

That is the barrier.

---

Here is the construction.

Fix $m$. Take

$$c_m := 2^{-m/2 - 2/(m+1)}.$$

Suppose Shortener has just played a legal prime $a$, and suppose

$$a \le c_m \cdot n^{1/(m+1)}.$$

Let $r_1 < \cdots < r_m$ be the next $m$ ordinary primes after $a$.

By repeated Bertrand bounds,

$$r_i < 2^i a \qquad (1 \le i \le m),$$

so

$$R := r_1 \cdots r_m < 2^{1+2+\cdots+m} a^m = 2^{m(m+1)/2} a^m.$$

By the choice of $c_m$,

$$2^{m(m+1)/2} a^m \le \frac{n}{4a},$$

hence

$$R \le \frac{n}{4a}.$$

Now look at the interval

$$\Big(\frac{n}{2R},\ \frac{n}{R}\Big].$$

Because $R \le n/(4a)$, its left endpoint is at least $2a$. By Bertrand again, there is a prime

$$q \in \Big(\frac{n}{2R},\ \frac{n}{R}\Big].$$

Define

$$u := qR.$$

Then:

* $u \in (n/2, n]$, so $u \in U$.
* Every prime divisor of $u$ is $> a$, because $r_i > a$ and $q > 2a$.
* Therefore $u$ is not divisible by any prime previously chosen by Shortener, so $u$ is legal.
* Since $r_1, \ldots, r_m \mid u$, those $m$ primes become illegal forever.

So after Shortener chooses $a$, Prolonger can immediately wipe out the next $m$ primes.

Inductively, as long as the current chosen prime stays below $c_m n^{1/(m+1)}$, Shortener gets at most one prime for every block of $m+1$.

---

Now for the harmonic-sum consequence.

Up to $x := c_m n^{1/(m+1)}$, Shortener gets at most the subsequence

$$p_1,\ p_{m+2},\ p_{2m+3},\ \ldots$$

so by the prime number theorem,

$$\sum_{\substack{p \le x \\ p \in S_n}} \frac{1}{p} \le \sum_{j: p_{j(m+1)+1} \le x} \frac{1}{p_{j(m+1)+1}} = \frac{1}{m+1} \log\log x + O_m(1) = \frac{1}{m+1} \log\log n + O_m(1).$$

The tail above $x$ contributes only a constant:

$$\sum_{x < p \le n/2} \frac{1}{p} = \log\log(n/2) - \log\log x + O(1) = \log(m+1) + O_m(1).$$

So altogether

$$\sum_{p \in S_n} \frac{1}{p} \le \frac{1}{m+1} \log\log n + O_m(1).$$

That is the advertised bound.

---

## Why this matters for your program

The obstruction is **not** the offline $|P| \log n$ budget; you already knew that was too weak.

The obstruction is stronger and genuinely online:

A single upper-half move can look like

$$u = q \cdot r_1 \cdots r_m$$

with $r_1, \ldots, r_m$ the next $m$ future small primes and $q$ a large "carrier" chosen only to lift the product into $U$.

This means Prolonger can realize fixed-size future-prime blocks online, for any fixed $m$, all the way up to the natural threshold $n^{1/(m+1)}$.

So any realizability theorem that only says "an upper integer cannot carry too many fresh primes because $\sum \log p \le \log n$" is still far too coarse. The real issue is:

**How often can Prolonger recycle carriers to keep lifting fresh small-prime blocks into $U$?**

That is the quantity that has to be bounded.

In other words, the missing theorem is not just about fresh prime sets. It has to control factorizations

$$u = c \cdot g$$

where $g$ is the fresh small-prime block and $c$ is a carrier assembled from already-available factors, with $u \in U$ and all the $u$'s distinct.

That is exactly the place where a Ford-type "divisor in a short interval" theorem starts to look like the right technology.

---

I also checked the relaxed chunk model in the sandbox. In that model, the prime-harmonic mass captured by Shortener at $n = 10^4, 10^5, 10^6$ was about

$$1.385,\ 1.414,\ 1.441$$

while the total prime-harmonic mass up to $n/2$ was about

$$2.405,\ 2.643,\ 2.836.$$

So the numerical picture matches the theorem: prime-only play captures a fixed fraction of the $\log\log n$ mass, not all of it.

---

My take is this:

The cleanest rigorous advance available from the present ingredients is a **barrier theorem**:

> Any upper-bound proof that runs only through "Shortener systematically claims primes" must also defeat the carrier-recycling construction above. Otherwise it cannot reach $O(n/\log n)$.

So the next target is a realizability theorem on the carrier side, not just on the fresh-prime side.
