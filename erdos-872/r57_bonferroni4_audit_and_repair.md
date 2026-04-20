# R57 Bonferroni-4 Audit And Repair

Last updated: 2026-04-20

## Bottom line

The Round 57 writeup at
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md)
does close the old breakpoint-envelope gap from the Round 15 route:

- the cumulative envelope in Step 3 is real;
- the inversion to a monotone comparison scale in Step 4 is real;
- the flat-block mass estimate and weak-convergence bookkeeping in Step 5 are real.

The first actual gap is earlier and more specific:

- I could not locate the quoted "already-established comparison theorem" anywhere in the repo in the exact form used at
  [researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:17](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:17).
- The nearest rigorous ancestor I found is the prime-by-prime monotone replacement lemma in
  [researcher-14-pro-shortener-upperbound-02-probabilistic-sieve.md:175](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-14-pro-shortener-upperbound-02-probabilistic-sieve.md:175)
  to
  [researcher-14-pro-shortener-upperbound-02-probabilistic-sieve.md:205](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-14-pro-shortener-upperbound-02-probabilistic-sieve.md:205),
  which compares one increasing sequence of actual odd primes to another.

So the right repair is:

1. state and prove the Bonferroni-4 comparison theorem in the prime-sequence form that the Round 14 machinery actually supports;
2. add the short prime-rounding bridge from R57's real comparison scale `(b_j)` to an actual odd-prime comparison sequence;
3. then the Round 57 conclusion is rigorous.

That repair is written below.

## 1. What I could and could not locate

I checked the main upper-bound infrastructure:

- [aristotle/shortener_13_36_v2.tex](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/aristotle/shortener_13_36_v2.tex)
- [aristotle/shortener_5_16.tex](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/aristotle/shortener_5_16.tex)
- [researcher-14-pro-shortener-upperbound-01-log-density.md](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-14-pro-shortener-upperbound-01-log-density.md)
- [researcher-14-pro-shortener-upperbound-02-probabilistic-sieve.md](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-14-pro-shortener-upperbound-02-probabilistic-sieve.md)
- [researcher-15-pro-shortener-upperbound-prime-count-refinement.md](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-15-pro-shortener-upperbound-prime-count-refinement.md)
- [round15_upper_bound_status.md](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/round15_upper_bound_status.md)
- [worker_round15_breakpoint_repair_memo.md](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/worker_round15_breakpoint_repair_memo.md)

I did not find a repo-banked proof of the exact statement quoted in R57:

> if `(b_1 <= ... <= b_K)` with `q_j <= b_j`, and if
> `T_r(n) = Lambda_r + o(1)` for `r = 1,2,3,4`,
> then
> `L(n) <= (n/2)(1 - Lambda_1 + Lambda_2 - Lambda_3 + Lambda_4 + o(1))`.

What *is* banked in the older Round 14 prose is weaker and more concrete:

- replace the actual Shortener primes `(q_j)` by a coordinatewise larger increasing sequence of actual odd primes `(p_j)`;
- then compare survivor counts set-theoretically;
- then run Bonferroni on the actual prime sequence `(p_j)`.

That is enough for R57, but it is not the same as the already-proved theorem claimed at
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:17](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:17).

## 2. Correct comparison theorem

The correct theorem that the Round 14 machinery supports is the following.

### Theorem 2.1. Prime-sequence Bonferroni-4 comparison

Let `q_1 < ... < q_K` be the first `K = floor((1 - eps) n / (2 log n))` odd primes played by Shortener under the chosen prefix strategy. Let `p_1 < ... < p_K` be an increasing sequence of odd primes such that

```math
q_j \le p_j \qquad (1 \le j \le K).
```

For `r = 1,2,3,4`, define

```math
T_r^{(p)}(n)
:=
\sum_{\substack{1 \le j_1 < \cdots < j_r \le K \\ p_{j_1}\cdots p_{j_r} \le n}}
\frac{1}{p_{j_1}\cdots p_{j_r}}.
```

If

```math
T_r^{(p)}(n)=\Lambda_r+o(1)
\qquad (r=1,2,3,4),
```

then

```math
L(n)\le \frac n2\Bigl(1-\Lambda_1+\Lambda_2-\Lambda_3+\Lambda_4+o(1)\Bigr).
```

### Proof

Let `A` be the final antichain under this Shortener strategy.

First use odd-part injection, exactly as in the older upper-bound proofs. Define

```math
\phi(x)=x/2^{v_2(x)}.
```

On any antichain, `phi` is injective. Since `q_1,...,q_K` all lie in `A`, every other final element has odd part not divisible by any `q_j`. Hence

```math
|A|
\le
K + N(q_1,\dots,q_K),
```

where `N(q_1,\dots,q_K)` is the number of odd integers `m <= n` not divisible by any `q_j`.

Second, compare to the larger prime sequence `(p_j)`. The monotone replacement lemma already written in
[researcher-14-pro-shortener-upperbound-02-probabilistic-sieve.md:177](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-14-pro-shortener-upperbound-02-probabilistic-sieve.md:177)
to
[researcher-14-pro-shortener-upperbound-02-probabilistic-sieve.md:205](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-14-pro-shortener-upperbound-02-probabilistic-sieve.md:205)
gives

```math
N(q_1,\dots,q_K)\le N(p_1,\dots,p_K).
```

Third, apply fourth-order Bonferroni to the odd integers `m <= n` and the divisibility events `p_j | m`. This yields

```math
N(p_1,\dots,p_K)
\le
\frac n2
\Bigl(
1 - T_1^{(p)}(n) + T_2^{(p)}(n) - T_3^{(p)}(n) + T_4^{(p)}(n)
\Bigr)
 + E_4(n),
```

where `E_4(n)` is the total floor-error contribution from the four inclusion-exclusion levels.

For fixed `r`, every `r`-fold intersection is counted by a squarefree divisor

```math
d=p_{j_1}\cdots p_{j_r}\le n
```

with exactly `r` prime factors, so the number of such divisors is

```math
O_r\!\left(\frac{n(\log\log n)^{r-1}}{\log n}\right)=o(n).
```

Therefore `E_4(n)=o(n)`. Since `K=O(n/\log n)=o(n)`, we get

```math
|A|
\le
\frac n2
\Bigl(
1 - T_1^{(p)}(n) + T_2^{(p)}(n) - T_3^{(p)}(n) + T_4^{(p)}(n)
\Bigr)
 + o(n),
```

which becomes the stated bound after substituting
`T_r^{(p)}(n)=Lambda_r+o(1)`.

This is the comparison theorem R57 actually needs.

## 3. Audit of R57 Steps 3, 4, 5

With the missing comparison theorem separated out, the new content of R57 is the monotone-envelope repair. That part is basically right.

### 3.1 Step 3: cumulative envelope

The construction at
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:124](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:124)
to
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:157](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:157)
correctly resolves the old breakpoint problem:

- the local interval profiles `A_{n,h}` are increasing on each block;
- the block ordering `R_h <= L_{h-1}` is forced by the explicit ratio
  at
  [researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:102](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:102)
  to
  [researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:112](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:112);
- so the piecewise-defined `C_{H,n}` is monotone.

This is the exact repair that older status notes had identified as missing.

### 3.2 Step 4: inversion

The inversion
at
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:159](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:159)
to
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:186](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:186)
is correct as written:

- `b_j := inf {X : C_{H,n}(X) >= j}` is nondecreasing;
- `C_{H,n} <= S_K` implies `S_K(b_j) >= j`;
- therefore the actual `j`-th Shortener prime satisfies `q_j <= b_j`.

So the inversion step itself is fine.

### 3.3 Step 5: flat-block mass and weak convergence

The bookkeeping at
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:188](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:188)
to
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:334](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:334)
is also correct.

The three flat-block estimates

- bottom block:
  [researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:206](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:206)
  to
  [researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:215](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:215)
- gap blocks:
  [researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:217](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:217)
  to
  [researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:224](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:224)
- top tail:
  [researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:226](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:226)
  to
  [researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:235](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:235)

all genuinely give `O_H(1 / log n)`.

The integration-by-parts error term
at
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:252](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:252)
to
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:283](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:283)
is also fine:

- `alpha_h >= alpha_{H-1} > 1/H` for fixed `H`;
- hence `n^{-alpha_h} log n -> 0` uniformly in `h`;
- so the error really is `o_H(1)`.

Finally, the excision estimate
at
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:393](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:393)
to
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:418](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:418)
is correct:

```math
|(0,1]\setminus G_H|
=
\frac1H + 2(H-1)\tau_H
\le \frac{5}{4H},
```

and because `0 < rho(u) < 1`, the missing-mass estimate

```math
0 \le J_r - J_r^{(H)} \le \frac{5r}{4H\,r!}
```

is valid.

So the old breakpoint bookkeeping gap really is closed by R57.

## 4. The one extra bridge R57 still needs

The corrected comparison theorem above expects an actual odd-prime comparison sequence `(p_j)`, while R57 only constructs a nondecreasing real scale `(b_j)`.

That bridge is short and standard.

### Lemma 4.1. Fixed-factor prime bridge

Fix `H` and `lambda > 1`. For all sufficiently large `n`, there exists an increasing odd-prime sequence

```math
p_1^{(\lambda)} < \cdots < p_K^{(\lambda)}
```

such that:

- `q_j <= p_j^{(\lambda)}` for every `j`;
- on each genuine interval block, `b_j <= p_j^{(\lambda)} <= lambda b_j`;
- on the flat filler blocks, the total reciprocal mass of the inserted primes is still `o_H(1)`.

### Why the bridge exists

On a genuine interval block `I_h`, the model count function is

```math
A_{n,h}(u)=(1-\xi_H(n))\frac{n^u}{(h+1)u\log n},
```

so the number of model points with `b_j` in a multiplicative window `[X, lambda X]` is asymptotic to

```math
\frac{\log lambda}{h+1}\cdot \frac{X}{u\log n},
\qquad u=\log_n X.
```

By the prime number theorem, the number of odd primes in the same window is

```math
(\lambda - 1 + o(1))\frac{X}{u\log n}.
```

Since

```math
\lambda - 1 > \frac{\log lambda}{h+1},
```

there are asymptotically more available odd primes than model points in every such window. A greedy Hall-style matching therefore produces increasing odd primes in `[b_j, lambda b_j]` along each genuine interval block.

On the filler blocks, the total reciprocal mass is already `O_H(1/\log n)` by the estimates in Section 3.3, so any fixed-factor inflation of those block values still contributes only `o_H(1)` to every fixed-order moment.

### Consequence

For every fixed `r`,

```math
T_r^{(p^{(\lambda)})}(n)
=
J_r^{(H)} + O_{H,r}(\lambda - 1) + o_H(1).
```

Indeed, the log-coordinate shift from `b_j` to `p_j^{(\lambda)}` is at most

```math
\frac{\log \lambda}{\log n}=o(1),
```

and the reciprocal weight changes by a factor in `[lambda^{-1},1]`; the filler-block contribution is already `o_H(1)`.

Letting `n -> infinity` first and then `lambda -> 1^+` recovers

```math
T_r^{(p^{(\lambda)})}(n)=J_r^{(H)}+o_H(1)
\qquad (r=1,2,3,4).
```

Combining Lemma 4.1 with Theorem 2.1 closes the last logical gap in the R57 argument.

## 5. Numerical reconciliation

The numerical constant is fine. The discrepancy is just discretization.

### 5.1 Banked phase-3 computation

Running

```bash
python3 erdos-872/phase3/shortener_piecewise_bonferroni4.py
```

reproduces the existing summary claim

```math
W_4/2 = 0.189710592.
```

This is the finest raw-grid value in
[phase3/shortener_piecewise_bonferroni4_summary.md](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/phase3/shortener_piecewise_bonferroni4_summary.md:5).

### 5.2 Higher-grid rerun

I reran the same FFT recurrence on larger grids without touching the repo files. The raw values trend downward:

- `2^17`: `0.18971059245756453`
- `2^18`: `0.18971029342708795`
- `2^19`: `0.18970998467815875`
- `2^20`: `0.18970990337369845`
- `2^21`: `0.18970982051725930`

Richardson extrapolation from the `2^20` and `2^21` runs, with exact `J_1`, gives

```math
W_4/2 \approx 0.1897097539621391,
```

which matches Pro's own quoted `0.1897097533889428...` at
[researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:510](/Users/omisverycool/.codex/worktrees/549124/erdos-harness/erdos-872/researcher-57-pro-round15-bonferroni4-PROVED-L-le-0.19n.md:510)
to the displayed precision.

So the reconciliation is:

- `0.189710592` is the coarse but reproducible `2^17` raw-grid value;
- `0.189709753...` is the higher-accuracy Richardson value;
- both are approximations to the same symbolic constant `W_4/2`;
- either way, the safe theorem-grade inequality is the same:

```math
W_4/2 < 0.19.
```

## 6. Final verdict

My audit verdict is:

- the old Round 15 blocker really was the monotone-envelope transfer, and R57 fixes that part;
- the quoted comparison theorem was not actually banked in the repo in the form R57 used;
- after correcting the comparison theorem to the prime-sequence version and adding the fixed-factor prime bridge from `(b_j)` to actual odd primes, the Bonferroni-4 proof route is sound.

So I would now classify the Round 15 finite statement as:

```math
L(n) \le (W_4/2 + o(1))n
\qquad\text{with}\qquad
W_4/2 < 0.19
```

as **rigorous prose**, with the remaining work being formalization and cleanup, not a live mathematical gap.
