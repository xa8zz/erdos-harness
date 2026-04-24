# Erdős Problem #500 - Discussion thread

**URL:** https://www.erdosproblems.com/forum/thread/500
**Status:** OPEN — This is open, and cannot be resolved with a finite computation.
**Prize:** $500
**Last edited on erdosproblems.com:** 2025-10-05
**Captured locally:** 2026-04-23 (via curl, no user paste — page fetched directly)

## Problem Statement

What is $\mathrm{ex}_3(n, K_4^3)$? That is, the largest number of $3$-edges which can be placed on $n$ vertices so that there exists no $K_4^3$, a set of $4$ vertices which is covered by all $4$ possible $3$-edges.

**#500:** [Er61], [Er71, p.104], [Er74c, p.81], [Er81]

**Tags:** graph theory | hypergraphs | turán number

## Background (from the erdosproblems.com entry)

A problem of Turán. Turán observed that dividing the vertices into three equal parts $X_1, X_2, X_3$, and taking the edges to be those triples that either have exactly one vertex in each part or two vertices in $X_i$ and one vertex in $X_{i+1}$ (where $X_4 = X_1$) shows that

$$\mathrm{ex}_3(n, K_4^3) \geq \left(\frac{5}{9} + o(1)\right)\binom{n}{3}.$$

This is probably the truth. The current best upper bound is

$$\mathrm{ex}_3(n, K_4^3) \leq 0.5611666 \binom{n}{3},$$

due to Razborov [Ra10].

See also **[#712]** for the general case.

## Related OEIS

- [A140462](https://oeis.org/A140462)

## Formalisation status

No Lean formalisation on erdosproblems.com as of 2026-04-23.

## Comments (0)

No comments on this problem as of 2026-04-23.

## See also — Problem #712 (the general case)

**URL:** https://www.erdosproblems.com/forum/thread/712
**Status:** OPEN | **Prize:** $500 per (k, r) pair; $1000 for the whole family

Determine, for any $k > r > 2$, the value of

$$\frac{\mathrm{ex}_r(n, K_k^r)}{\binom{n}{r}},$$

where $\mathrm{ex}_r(n, K_k^r)$ is the largest number of $r$-edges which can be placed on $n$ vertices so that there exists no set of $k$ vertices which is covered by all $\binom{k}{r}$ possible $r$-edges.

**#712:** [Er71, p.104], [Er74c, p.76], [Er81]

Turán proved that, when $r = 2$, this limit is $\frac{1}{2}\left(1 - \frac{1}{k-1}\right)$. Erdős [Er81] offered \$500 for the determination of this value for any fixed $k > r > 2$, and \$1000 for "clearing up the whole set of problems."

Problem #500 is the case $r = 3$, $k = 4$.

## Suggested citation (per erdosproblems.com)

> T. F. Bloom, Erdős Problem #500, https://www.erdosproblems.com/500, accessed 2026-04-23
