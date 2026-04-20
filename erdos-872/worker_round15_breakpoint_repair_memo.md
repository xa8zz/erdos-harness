# Round 15 Breakpoint-Repair Memo

This memo audits only the Round 15 piecewise-density upper-bound route.

## Bottom line

The current mathematical gap is narrow and specific:

- the local range-count lemma is real;
- the piecewise density
  \[
  \rho(u)=\frac{1}{(\lfloor 1/u\rfloor+1)u}
  \]
  is the right local limit away from breakpoints;
- the numerics for `W_4/2 < 0.19` and for `\mathcal W/2 \approx 0.18969` are well supported;
- the missing theorem-grade step is still the global transfer from those local interval counts to a single increasing comparison sequence that Round 14's monotone replacement / factorial-moment machinery can actually use.

So the blocker is not the convolution numerics. The blocker is the breakpoint transfer.

## 1. The exact missing repair

The missing repair is the following explicit four-stage passage.

### A. Uniformize the local count away from breakpoints

For fixed `delta > 0` and `tau > 0`, consider only the finitely many compact subintervals
\[
I_h(\tau)=\left[\frac{1}{h+1}+\tau,\ \frac{1}{h}-\tau\right]
\subset [\delta,1]
\]
for `1 <= h <= floor(1/delta)`.

On each `I_h(\tau)`, choose one fixed `eta_h < tau`. Then the Round 15 count gives, uniformly for `u in I_h(\tau)`,
\[
S(n^u)\ge (1-o_{n,\delta,\tau}(1))\frac{n^u}{(h+1)u\log n}.
\]

This is the rigorous version of "the density is `1/((h+1)u)` away from the breakpoint."

### B. Build a monotone cumulative lower envelope

Define the piecewise lower profile
\[
L_{\delta,\tau}(u)
=
\max_{v\le u,\ v\in \bigcup_h I_h(\tau)}
\Bigl((1-\epsilon_n)\frac{n^v}{(\lfloor 1/v\rfloor+1)v\log n}\Bigr),
\]
where `epsilon_n -> 0`.

The key point is that `L_{delta,tau}` is monotone by construction. This is what the Round 15 note does not currently write down. Without this monotone hull, the naive inverse profile drops at each breakpoint `u = 1/h`, so it is not a valid comparison sequence.

### C. Invert the envelope to an increasing model sequence

Define
\[
b_j=b_j(\delta,\tau,n):=\inf\{x\le n:\ L_{\delta,\tau}(\log x/\log n)\ge j\},
\]
rounded upward to the next odd prime if desired.

Then `b_j` is increasing, and by definition of `L_{delta,tau}` one gets
\[
q_j\le b_j
\]
throughout the relevant prefix after the initial `n^\delta` ignored primes.

This is the missing input needed by the Round 14 monotone-replacement lemma.

### D. Prove the breakpoint correction is negligible in reciprocal mass

Two corrections must be shown harmless.

1. The excised `tau`-neighborhoods of the finitely many breakpoints in `[delta,1]`.
2. The flat segments created when the monotone hull bridges a downward jump of the naive inverse at `u=1/h`.

The correct claim is that both carry negligible reciprocal mass:

- for fixed `delta`, the excised neighborhoods contribute `O_delta(tau)`;
- the flat bridge at breakpoint `1/h` has width `O(n^{1/h}/log n)` in index-space and sits at height `~ n^{1/h}`, so its reciprocal mass is `O(1/log n)`;
- summing over the finitely many breakpoints in `[delta,1]` still gives `o_n(1)`.

That is the exact repair. Once written explicitly, the "phantom atom" intuition from Audit #2 becomes a theorem rather than a heuristic.

## 2. Proposed lemma sequence to make `0.18969` theorem-grade

The cleanest path is a short lemma ladder.

### Lemma 1. Uniform interval count away from breakpoints

For fixed `delta, tau > 0`, uniformly on each `I_h(tau)`,
\[
S(n^u)\ge (1-o(1))\frac{n^u}{(h+1)u\log n}.
\]

This is the already-believed local ingredient, but it should be stated with the quantifiers in the uniform form above.

### Lemma 2. Monotone cumulative envelope

From Lemma 1, construct a monotone lower envelope `L_{delta,tau}(u)` on `[delta,1]` whose graph agrees with the piecewise profile away from the excised breakpoint neighborhoods and only flattens across the gaps.

This is the first genuinely missing lemma.

### Lemma 3. Inverse comparison sequence

Invert `L_{delta,tau}` to an increasing model-prime sequence `b_j` with
\[
q_j \le b_j
\]
for all `j > n^\delta` in the Shortener prefix.

This is the second genuinely missing lemma.

### Lemma 4. Breakpoint-flat segments have negligible reciprocal mass

Show that the extra indices created by the monotone hull contribute
\[
\sum_{\text{flat bridge}} \frac{1}{b_j}=o(1),
\]
uniformly for fixed `delta`, and that the total contribution over all breakpoint bridges in `[delta,1]` is still `o(1)`.

This is the precise replacement for the current informal "atoms are harmless" sentence.

### Lemma 5. Fixed-order factorial-moment convergence for the repaired sequence

For each fixed `r`,
\[
\sum_{\substack{i_1<\cdots<i_r\\ b_{i_1}\cdots b_{i_r}\le n}}
\frac{1}{b_{i_1}\cdots b_{i_r}}
\to
\frac{1}{r!}\int_{\substack{u_1+\cdots+u_r\le 1\\ u_i\in[\delta,1]}}
\prod_{i=1}^r \rho(u_i)\,du_i,
\]
with the breakpoint corrections absorbed into the error term by Lemma 4.

This is the key transfer from the repaired discrete model to the piecewise-density simplex integrals.

### Lemma 6. `delta -> 0` and `tau -> 0` passage

For fixed `r`, let `tau -> 0` first and then `delta -> 0`. Because the breakpoint set is finite on `[delta,1]` and has measure zero in the limit, the repaired integrals converge to the full `J_r`.

This is easy once Lemmas 4-5 are in place, but it still needs to be written.

### Lemma 7. Full-series tail control

For the full `0.18969` constant, add the standard tail bound
\[
J_r \le \frac{J_1^r}{r!},
\qquad
J_1=\int_0^1 \rho(u)\,du < 1,
\]
so
\[
\sum_{r>R} J_r
\]
is absolutely and effectively small.

This is not the hard part, but it is the extra step that the finite Bonferroni-4 statement does not need.

### Lemma 8. Certified numerics

Finally, certify the relevant integrals numerically:

- for the full theorem-grade `0.18969`, certify enough `J_r` plus the series tail to pin down `\mathcal W/2`;
- for the Bonferroni-4 version, certify only `J_2, J_3, J_4` to the precision needed for `W_4 < 0.38`.

This is a computation appendix task, not a structural proof task.

## 3. Does finite Bonferroni-4 become theorem-safe first?

Yes.

That is the conservative ordering.

The reason is simple:

- the same breakpoint/envelope repair is needed in both versions;
- once that repair exists, the Bonferroni-4 theorem only needs fixed-order moment convergence for `r <= 4` plus rigorous numerical bounds on `J_2, J_3, J_4`;
- the sharper `0.18969` limit also needs the infinite-series passage and certified tail control.

So the first theorem-safe promotion target should be:
\[
L(n)\le (W_4/2+o(1))n
\]
with a rigorous bound `W_4/2 < 0.19`.

Only after that should the full limit constant
\[
L(n)\le (\mathcal W/2+o(1))n \approx 0.18969n
\]
be promoted.

In other words:

- `sub-0.19 via Bonferroni-4` should become theorem-safe first;
- `0.18969` is the next refinement, not the first one to bank.

## 4. Strongest theorem-safe statement we can already extract today

There are two different answers, depending on scope.

### A. Strongest theorem-safe global upper bound in the project today

Still the banked
\[
L(n)\le (13/36+o(1))n.
\]

Round 15 has not yet displaced that as a promoted theorem.

### B. Strongest theorem-safe statement from the Round 15 route itself

Only the local range-count theorem away from breakpoints:

for each fixed `h >= 1` and each fixed compact subinterval
\[
\left[\frac{1}{h+1}+\tau,\ \frac{1}{h}-\tau\right],
\]
the Shortener prime-count satisfies
\[
S(n^u)\ge (1-o(1))\frac{n^u}{(h+1)u\log n}
\]
uniformly on that interval.

Equivalently: the piecewise density `rho(u)=1/((h+1)u)` is theorem-safe locally away from the breakpoints.

What is not yet theorem-safe today:

- `L(n) <= (0.190+o(1))n`;
- `L(n) <= (0.18969+o(1))n`.

Both still need the explicit monotone-envelope / breakpoint transfer.

## Recommended promotion posture

The correct conservative posture is:

1. Keep `0.18969` as a numerically ratified target, not a theorem.
2. Treat `W_4/2 = 0.189710592` as computational certification that the finite truncation is plausibly sub-`0.19`, not yet banked.
3. Prioritize the breakpoint-envelope repair with the finite Bonferroni-4 statement as the first promotion target.
4. Continue to cite `13/36` as the strongest banked upper theorem until that repair is written.

That is the sharpest conservative summary I would sign today.
