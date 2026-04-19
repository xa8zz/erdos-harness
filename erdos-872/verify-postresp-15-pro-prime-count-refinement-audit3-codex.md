# Audit 3 of Round 15 Pro 0.19n proof — constants verified, theorem still pending boundary/model-sequence repair

## Verdict

My independent check lands between Audit #1 and Audit #2:

- **The new combinatorial input is real and important.**
- **The numerical constant \(\approx 0.18969\) checks out independently.**
- **I would not yet promote the proof to "rigorous theorem" status.**

The remaining issue is still the same one Audit #1 identified: the proof has not yet given a fully explicit monotone comparison sequence that the Round 14 replacement / factorial-moment machinery can consume uniformly across the breakpoints \(u = 1/h\).

So my recommendation is:

> Treat the \(0.19n\) bound as **likely correct, numerically ratified, and structurally promising**, but still **pending a repair writeup** before promotion.

## What checks out

### 1. Prime-count-per-range lemma

For fixed
\[
\frac1{h+1} < u \le \frac1h,
\qquad X = n^u,
\qquad Y = n^{u-\eta},
\qquad u-\eta > \frac1{h+1},
\]
the counting argument is sound:

- before Shortener's first prime \(>X\), every odd prime in \((Y,X]\) is either already Shortener-played or divides a Prolonger move;
- each Prolonger move contains at most \(h\) distinct primes \(>Y\), since \(Y^{h+1} > n\);
- Prolonger has made at most \(S(X)+1\) moves by that time.

Hence
\[
\pi(X)-\pi(Y)\le S(X)+h(S(X)+1),
\]
so
\[
S(X)\ge \frac{\pi(X)-\pi(Y)}{h+1}-O(1).
\]

This part is genuinely stronger than Round 14's pure log-budget bound.

### 2. The constant \(\mathcal W\)

I recomputed the first terms independently by direct grid convolution of the simplex integrals for
\[
\rho(u)=\frac{1}{(\lfloor 1/u \rfloor + 1)u}.
\]

Stable values across grids \(N=2^{14},2^{15},2^{16},2^{17}\):

\[
J_1 \approx 0.78853,\qquad
J_2 \approx 0.18682,\qquad
J_3 \approx 0.02009,\qquad
J_4 \approx 0.001223.
\]

The corresponding alternating sum is stable at
\[
\mathcal W \approx 0.379374,
\qquad
\mathcal W/2 \approx 0.189687.
\]

So the quoted numerical target
\[
L(n)\le (0.18969+o(1))n
\]
is numerically consistent.

The conservative Bonferroni-4 truncation also checks:
\[
1-J_1+J_2-J_3+J_4 \approx 0.37942 < 0.3795,
\]
hence
\[
L(n)\le (0.18975+o(1))n
\]
at the truncation level.

### 3. Dominated-convergence / tail control

The total mass is
\[
J_1 = \int_0^1 \rho(u)\,du
     = \sum_{m\ge 2} \frac1m \log\frac{m}{m-1}
     \approx 0.78853.
\]

The simplex terms satisfy the standard bound
\[
J_r \le \frac{J_1^r}{r!},
\]
so the series is absolutely convergent and tails are tiny. This is not the dangerous part of the proof.

## What still blocks theorem status

### 1. Boundary-uniformity is not written

The proof uses a fixed \(\eta>0\) with \(u-\eta > 1/(h+1)\). That is fine on compact subintervals
\[
u \in \Big[\frac1{h+1}+\tau,\ \frac1h-\tau\Big],
\]
but it is **not** uniform as \(u\) approaches the breakpoints \(1/h\).

Near the lower edge \(u \downarrow 1/(h+1)\), the allowable \(\eta\) must shrink, and then \(\pi(Y)\) is no longer automatically negligible compared to \(\pi(X)\). So the density
\[
\rho(u)=\frac1{(h+1)u}
\]
is rigorously justified only away from the boundaries unless extra bookkeeping is added.

### 2. No explicit monotone model sequence has been constructed

This is the main missing step.

Round 14's machinery does **not** run directly from a heuristic density. It needs an explicit increasing model prime sequence \(b_j\) with
\[
q_j \le b_j
\]
uniformly on the relevant prefix, so that monotone replacement applies.

The Round 15 note jumps from interval-count lower bounds on \(S(n^u)\) to the continuous density \(\rho(u)\), but it does not actually define the model sequence. That is the key gap.

## Why I think the gap is repairable

I do not currently see a fatal contradiction. The repair target looks like:

1. Fix \(\delta>0\) and excise small neighborhoods of the finitely many breakpoints \(u=1/h\) in \([\delta,1]\).
2. On each remaining compact subinterval, choose \(\eta\) uniformly and obtain a uniform lower bound for \(S(n^u)\).
3. Build a monotone cumulative lower envelope \(C_{\delta,\tau}(X)\) from these interval bounds.
4. Invert \(C_{\delta,\tau}\) to an increasing comparison sequence \(b_j\).
5. Show the breakpoint neighborhoods and any flat-envelope corrections carry only negligible reciprocal mass.

The note currently gestures at Step 5, but Steps 3-4 are not written.

## Bottom line

If forced to categorize:

- **Mathematical idea:** strong.
- **Numerical constant:** independently verified.
- **Promotion status:** not yet promoted.
- **Weakest link:** explicit monotone model-sequence construction across the \(u=1/h\) breakpoints.

So this should remain in the repo as:

> **pending model-sequence / boundary repair**

rather than as an established theorem.
