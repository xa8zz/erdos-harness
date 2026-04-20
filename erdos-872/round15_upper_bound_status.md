# Round 15 Upper-Bound Status

Last updated: 2026-04-20

This note separates four different things that had started to blur together in the repo:

1. what Round 15 proves safely today;
2. what Round 15 supports computationally;
3. what still blocks theorem promotion for the sub-`0.19` constant;
4. how the paper should describe the result right now.

## 1. Safest theorem-level content from Round 15

The strongest fully safe theorem-content currently extracted from Round 15 is the local prime-count-per-range lemma away from the breakpoints `u = 1/h`.

### Local prime-count-per-range lemma

Fix an integer `h >= 1`, a real `u` with

```math
\frac{1}{h+1} < u \le \frac{1}{h},
```

and choose `eta > 0` such that

```math
u - \eta > \frac{1}{h+1}.
```

Set

```math
X = n^u, \qquad Y = n^{u-\eta}.
```

Let Shortener use the Round 15 opening strategy: on each of the first

```math
K = \left\lfloor (1-\varepsilon)\frac{n}{2\log n}\right\rfloor
```

of her turns, play the smallest legal odd prime.

Before Shortener's first move with prime `> X`, every odd prime in `(Y, X]` is either:

- already played by Shortener, or
- a divisor of some earlier Prolonger move.

Each Prolonger move contains at most `h` distinct prime factors greater than `Y`, because

```math
Y^{h+1} = n^{(u-\eta)(h+1)} > n.
```

If `S(X)` denotes the number of Shortener-played primes at most `X` by that time, then Prolonger has made at most `S(X)+1` moves, so

```math
\pi(X)-\pi(Y)\le S(X)+h(S(X)+1).
```

Therefore

```math
S(X)\ge \frac{\pi(X)-\pi(Y)}{h+1}-O(1).
```

Using the prime number theorem for fixed `u, eta`, this yields

```math
S(n^u)\ge (1-o(1))\frac{n^u}{(h+1)u\log n}
```

uniformly on compact subintervals

```math
u \in \left[\frac{1}{h+1}+\tau,\ \frac{1}{h}-\tau\right]
```

for fixed `tau > 0`.

### Interpretation

On each open interval `(1/(h+1), 1/h)`, the correct local log-scale density is

```math
\rho(u)=\frac{1}{(h+1)u}.
```

This is the core new combinatorial input of Round 15, and all audits agree that this part is real.

## 2. What is computationally certified

The same Round 15 density leads to the piecewise model

```math
\rho(u)=\frac{1}{(\lfloor 1/u \rfloor + 1)u}, \qquad 0 < u \le 1.
```

Define

```math
J_r=\frac{1}{r!}\int_{u_1+\cdots+u_r\le 1}\prod_{i=1}^r \rho(u_i)\,du_i,
\qquad
\mathcal W=\sum_{r=0}^{\infty}(-1)^r J_r.
```

The independently reproducible computational facts currently on file are:

- `J_1 = \int_0^1 \rho(u)\,du = \sum_{m \ge 2} (1/m)\log(m/(m-1)) \approx 0.788530565912`;
- stable numerical values:

```math
J_2 \approx 0.18682,\qquad
J_3 \approx 0.02009,\qquad
J_4 \approx 0.0012226;
```

- Bonferroni-4 truncation:

```math
W_4 := 1 - J_1 + J_2 - J_3 + J_4 \approx 0.379421185;
```

- therefore

```math
W_4/2 \approx 0.189710592 < 0.19;
```

- the full convolution is numerically stable near

```math
\mathcal W/2 \approx 0.189687.
```

Best computational source:

- [shortener_piecewise_bonferroni4_summary.md](/Users/omisverycool/erdos-harness/erdos-872/phase3/shortener_piecewise_bonferroni4_summary.md)

Best audit sources:

- [verify-postresp-15-pro-prime-count-refinement-audit1.md](/Users/omisverycool/erdos-harness/erdos-872/verify-postresp-15-pro-prime-count-refinement-audit1.md)
- [verify-postresp-15-pro-prime-count-refinement-audit3-codex.md](/Users/omisverycool/erdos-harness/erdos-872/verify-postresp-15-pro-prime-count-refinement-audit3-codex.md)

## 3. What is not theorem-grade yet

The blocker is not the integral numerics. The blocker is the missing transfer from local interval counts to a global increasing comparison sequence that the Round 14 monotone replacement / factorial-moment machinery can actually consume.

### Exact missing repair

The proof still needs an explicit writeup of the following chain.

1. Fix `delta > 0` and excise small neighborhoods of the finitely many breakpoints `u = 1/h` inside `[delta, 1]`.
2. On each remaining compact subinterval, choose `eta` uniformly and prove a uniform lower bound for `S(n^u)`.
3. Assemble these bounds into a monotone cumulative lower envelope `C_{delta,tau}(X)`.
4. Invert that envelope to an explicit increasing comparison sequence `b_j` with `q_j <= b_j` across the whole relevant prefix.
5. Show that the excised breakpoint neighborhoods and any flat-envelope / atom corrections contribute negligible reciprocal mass, so the factorial-moment limits still converge to the same piecewise-density integrals.

Until Steps 3-5 are written explicitly, neither of the following should be promoted to theorem status:

- the finite sub-`0.19` Bonferroni-4 statement;
- the sharper `0.18969n` limit constant.

## 4. Current paper wording

### Safe theorem wording

Use the already banked theorem:

```math
L(n)\le (13/36+o(1))n.
```

If the paper wants a formal Round 15 statement today, use the local prime-count-per-range lemma and present it as the new structural input behind the refined density.

### Safe computational wording

The best honest paper-facing language for the constant right now is:

> The Round 15 piecewise-density model yields a computationally certified candidate upper constant below `0.19`. The Bonferroni-4 truncation is reproducibly `0.189710592`, and the full convolution is numerically stable near `0.18969`. Promoting this to a theorem still requires an explicit monotone-envelope / breakpoint transfer.

### What not to say yet

Do not currently write either of these as theorem statements:

- `L(n) <= (0.190 + o(1)) n`;
- `L(n) <= (0.18969 + o(1)) n`.

Both are still pending the breakpoint/model-sequence repair.

## 5. Practical paper split

If we need one clean narrative right now, the Round 15 material should be split like this:

- **Theorem layer:** local prime-count-per-range lemma away from breakpoints;
- **Computation layer:** Bonferroni-4 sub-`0.19` certification and the sharper `0.18969` numerical target;
- **Open repair layer:** explicit monotone comparison sequence across breakpoints.

That gives the paper a strong and honest story without overstating the current rigor.
