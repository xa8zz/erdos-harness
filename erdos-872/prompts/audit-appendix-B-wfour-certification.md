This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

## Task

Below is a numerical-certification appendix from a mathematics paper. Its
main claim is an interval-arithmetic upper bound on a specific constant
$\Wfour/2$ that must be strictly less than $0.19$ for the paper's headline
theorem to hold. The margin is small ($\approx 2.9 \times 10^{-4}$), so the
certification must be rigorous — floating-point arithmetic alone does not
suffice.

Audit at referee standard for a specialist number theory journal.
Adversarial stance: a certified numerical bound is only as strong as its
weakest rounding-direction claim; look for any step where a reader might
suspect an incorrect rounding mode, an off-by-one in the convolution, a
truncation error larger than stated, or a formula that doesn't quite match
the integrand it claims to integrate.

## Specific checks

**1. Antiderivative formula.** The appendix claims that on
$(1/(h+1), 1/h]$, the antiderivative of $\rho(u) = 1/((\lfloor 1/u\rfloor
+ 1) u)$ is
\[
  F(x) = T_{h+1} + \frac{\log((h+1) x)}{h+1},
\qquad
  T_k := \sum_{\ell \ge k} \frac{\log(1 + 1/\ell)}{\ell + 1}.
\]
Verify this is correct by:

(a) Checking $F'(x) = 1/((h+1) x) = \rho(x)$ on the open interval.
(b) Checking the right-continuity / matching condition $F(1/h^+) = F(1/h^-)$
    at the breakpoints (i.e., the piecewise pieces actually glue to a
    continuous function).
(c) Checking $F(0^+) = 0$ (so that $F(x)$ really is $\int_0^x \rho$).

**2. Tail bound.** The appendix truncates the sum $T_{h+1}$ at
$H^\star = 10^6$ and bounds the tail
\[
  \sum_{\ell > H^\star} \frac{\log(1 + 1/\ell)}{\ell + 1}
\]
by $1/(H^\star + 1)$. Verify:

(a) The upper inequality
$\log(1 + 1/\ell)/(\ell + 1) \le 1/(\ell(\ell+1))$ using
$\log(1 + x) \le x$.
(b) The telescope $\sum_{\ell > H^\star} 1/(\ell(\ell+1)) = 1/(H^\star + 1)$.
(c) The lower inequality (stated for completeness, not needed for an upper
bound of $T_k$): does $\log(1 + 1/\ell)/(\ell+1) \ge 1/(\ell+1)^2$ hold?
(This is only needed if a two-sided bound on $T_k$ is claimed.)

**3. Convolution bounds for $J_r$.** Define the cell masses
$m_i = \mu(I_i) = F(i/N) - F((i-1)/N)$ for $I_i = ((i-1)/N, i/N]$, $N = 10^5$.
Define
\[
  c_s^{(r)} := \sum_{\substack{i_1, \ldots, i_r \ge 1 \\ i_1 + \cdots + i_r = s}}
               m_{i_1} \cdots m_{i_r}.
\]
The appendix claims
\[
  \frac{1}{r!} \sum_{s \le N} c_s^{(r)}
  \;\le\; J_r \;\le\;
  \frac{1}{r!} \sum_{s \le N + r} c_s^{(r)}.
\]
Verify:

(a) Which $r$-cell products have supports wholly inside the simplex
$\{u_1 + \cdots + u_r \le 1, u_i \in (0, 1]\}$? The product
$I_{i_1} \times \cdots \times I_{i_r}$ is wholly inside iff
$i_1/N + \cdots + i_r/N \le 1$, i.e., $s \le N$. So the lower bound is
correct.

(b) Which $r$-cell products have supports that meet the simplex at all?
The product meets the simplex iff the lower-endpoint sum $((i_1 - 1) + \cdots
+ (i_r - 1))/N < 1$, i.e., $s \le N + r$. So the upper bound is correct.

(c) Is the $r!$ divisor correctly accounting for the symmetrization of
the simplex to the unordered $r$-tuple? (Each unordered $r$-tuple is
counted $r!$ times in the sum over ordered tuples if the coordinates are
distinct, and fewer if they coincide; the strictly-ordered simplex
$\{u_1 < \cdots < u_r, \sum u_i \le 1\}$ has measure $J_r / r!$, so $J_r =
r! \int_{\text{ordered}}$. Verify the bookkeeping does not double-count.)

**4. Certified intervals.** The appendix reports:

- $J_1 \in [0.7885305658, 0.7885305661]$
- $J_2 \in [0.18681848, 0.18682451]$
- $J_3 \in [0.02009209, 0.02009370]$
- $J_4 \in [0.00122263, 0.00122282]$

Verify each interval contains the true value of $J_r$, by either:

(a) Doing a moderate-precision independent numerical integration and
checking the result lies in the claimed interval.

(b) Noting that each interval width is consistent with the cell-count and
antiderivative-tail errors (e.g., $[0.18681848, 0.18682451]$ has width
$\approx 6 \times 10^{-6}$, which should be consistent with $N = 10^5$
and $H^\star = 10^6$).

Flag any interval that seems implausibly tight given $N$ and $H^\star$,
OR any interval that does not straddle the floating-point sandbox value.

**5. Directed rounding.** Interval arithmetic on logarithms, additions,
subtractions, and convolutions requires a consistent rounding-direction
policy (always outward). Verify:

(a) The appendix states an explicit rounding-direction policy. If not,
flag as a critical omission: reporting certified intervals without
specifying rounding mode is not certification.

(b) If interval-arithmetic pseudocode or a reproducible computation
script is included, spot-check that log computations are bounded both
directions (e.g., `log_up(x)` and `log_dn(x)`).

(c) If no script is included, flag: the claim is only as certifiable as
the machinery described.

**6. Final W_4 upper bound.** From the certified intervals the appendix
derives
\[
  \frac{\Wfour}{2} \le \frac{1}{2}(1 - 0.7885305658 + 0.18682451 - 0.02009209 + 0.00122282)
                = 0.1897123371 < 0.19.
\]
Verify:

(a) The correct directions were used: lower bounds of $J_1$ and $J_3$
(which appear with $+$ sign after multiplying by $-1$ in $\Wfour$), upper
bounds of $J_2$ and $J_4$ (which appear with $+$ sign).

Wait: $\Wfour = 1 - J_1 + J_2 - J_3 + J_4$. To upper-bound $\Wfour$, use
the SMALLEST $J_1$ (most negative $-J_1$ means least reduction), the
LARGEST $J_2$, the SMALLEST $J_3$, the LARGEST $J_4$. So lower bounds of
$J_1, J_3$ and upper bounds of $J_2, J_4$. Confirm the appendix does this.

(b) The arithmetic $\frac{1}{2}(1 - 0.7885305658 + 0.18682451 - 0.02009209
+ 0.00122282)$ actually equals $0.1897123371$ when computed. Check by
hand or by sandbox.

(c) The final strict inequality $0.1897123371 < 0.19$ has a margin of
$\approx 2.877 \times 10^{-4} > 0$.

## Verdict format

If the certification holds up, say so plainly.

If any step does not, name it specifically (formula label, equation
reference, or quoted opening phrase) and say whether the issue is:

- (i) fatal — the reported interval for some $J_r$ is wrong, or the
  rounding-direction policy invalidates the upper bound
- (ii) repairable — a wider interval or a more careful rounding
  description would fix it
- (iii) presentation — the math is right but the reader would struggle
  to reproduce the certification from the text alone

Do not rubber-stamp. A numerical certification is easy to get 95% right
and load-bearingly wrong on the remaining 5%.

## Content to audit

[PASTE THE FULL CURRENT CONTENT OF
`erdos-872/paper/sections/appendix-B-numerical.tex` HERE.]
