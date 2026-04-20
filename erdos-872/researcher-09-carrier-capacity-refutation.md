---
id: R09-carrier-capacity-refutation
type: refutation
date: 2026-04-17
intent: >
  Determine whether the Static Carrier Capacity Bound (sum_{p in B(P)} 1/p
  bounded by constant C(eps) for |P| = eps*n) holds or can be refuted.
predecessors: [R05-carrier-recycling]
prompt: erdos-872/prompts/researcher-09-carrier-capacity.md
action:
  kind: refutes
  target: R05-carrier-recycling
claim: >
  The Static Carrier Capacity Bound is false. For any eps < 1/4, the top
  eps*n consecutive integers form a legal Prolonger antichain P with
  sum_{p in B(P)} 1/p >= log log(eps*n) -> infinity. No finite prime
  "vaccination" rescues the bound.
failure_mechanism: >
  Consecutive integers in U = (n/2, n] hit every prime p <= |P| = eps*n.
  The harmonic sum over primes up to eps*n diverges (Mertens), so no
  constant C(eps) can bound sum 1/p. Arithmetic-progression variants
  with step d = prod_{q in Q} q (for any fixed Q) give the same divergence
  over primes not in Q.
---

# Researcher output — refutation of the Carrier Capacity Bound

**Source:** ChatGPT Pro (fresh tab, open-exploration thread). Prompt: `prompts/researcher-09-carrier-capacity.md`.
**Extracted:** 2026-04-18.
**Status:** rigorous refutation; the static Lemma is false. Dynamical version (relative to a specific Shortener strategy) left open.
**Note:** Gemini DeepThink independently refuted the same Lemma with the same core idea (top-$\varepsilon n$-consecutive counterexample) shortly before this response — cross-validation. See `verify-researcher-09-gemini-refutation.md`.

---

The lemma is false as stated.

Take any fixed $0 < \varepsilon < 1/4$, and for large $n$ set
$$T = \lfloor \varepsilon n \rfloor, \qquad m = \lfloor n/2 \rfloor.$$

Consider the following legal alternating play:

Prolonger's $i$-th move is
$$x_i = m + i \quad (1 \le i \le T),$$
and Shortener's $i$-th move is
$$y_i = m + T + i \quad (1 \le i \le T-1).$$

For large $n$, all these numbers lie in $U = (n/2, n]$, because $m + 2T - 1 \le n$ when $\varepsilon < 1/4$. Since any two distinct numbers in $U$ are incomparable under divisibility, every move is legal. So this is an actual game play whose Prolonger sequence is
$$P = \{m+1, m+2, \ldots, m+T\} \subset U.$$

Now fix any prime $p \le T$. Choose $j \in \{1, \ldots, p\}$ with
$$m + j \equiv 0 \pmod{p}.$$
Such a $j$ exists, and $j \le p \le T$, so $m + j \in P$. Hence $p \mid (m + j)$, so
$$p \in B(P).$$

Therefore
$$\{p \le T : p \text{ prime}\} \subseteq B(P),$$
and thus
$$\sum_{p \in B(P)} \frac{1}{p} \ge \sum_{p \le T} \frac{1}{p}.$$

But the prime reciprocal sum diverges; in fact by Mertens,
$$\sum_{p \le T} \frac{1}{p} = \log\log T + O(1) = \log\log n + O(1).$$

So no constant $C(\varepsilon)$ can bound $\sum_{p \in B(P)} 1/p$ independently of $n$. That refutes the lemma.

---

## Stronger version of the obstruction

If you exclude any fixed finite set $Q$ of primes, let $d = \prod_{q \in Q} q$. Then for any $\varepsilon < 1/(4d)$, one can take a progression
$$P = \{a, a+d, \ldots, a+(T-1)d\} \subset U$$
with $(a, d) = 1$. Every term avoids $Q$, but for every prime $p \le T$ with $p \notin Q$, the first $p$ terms run through all residue classes mod $p$, so some term is divisible by $p$. Hence
$$\sum_{p \in B(P) \setminus Q} \frac{1}{p} \ge \sum_{\substack{p \le T \\ p \notin Q}} \frac{1}{p},$$
which still grows like $\log\log n$. So any finite "vaccination" does not rescue the statement.

---

## Why Erdős–Kac carrier-capacity breaks

Average $\omega(x)$ only controls total prime incidences
$$\sum_{x \in P} \omega(x),$$
not the weighted union
$$\sum_{p \in B(P)} \frac{1}{p}.$$

A block of $T$ consecutive integers in $U$ has completely ordinary $\omega$-statistics, yet it already hits every prime $p \le T$. So one can realize reciprocal mass $\sim \log\log n$ without using unusually highly composite numbers at all.

---

## Numerical verification

For $\varepsilon = 0.1$, at $n = 10^4, 10^5, 10^6$, the interval construction gives
$$\sum_{p \in B(P)} \frac{1}{p} \approx 2.316,\ 2.574,\ 2.780,$$
while the average $\omega$ on the block is only about
$$2.48,\ 2.70,\ 2.89.$$

So the proof and the numerics line up cleanly.

---

## Conclusion

**The Carrier Capacity Bound is false.**

This does not rule out a much more dynamical statement tied to a specific Shortener strategy, but the lemma in the form you stated cannot be used to get $L(n) = O(n/\log n)$.
