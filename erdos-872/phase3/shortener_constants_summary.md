# Shortener Constants Numerical Verification

Verdict: **Both constants ratified**.

`V = 0.440029038059` and `C = 0.227036748200`.

The `I_1` check matches both the analytic `log 2` value and an independent `quad` evaluation, with numerical `I_1 = 0.693147180559945` and analytic `log 2 = 0.693147180559945`.

The alternating series was truncated only after the first omitted-term bound dropped below `1e-13`; the returned partial sum stops at `r = 10` with next-term bound `2.677e-16`.

The `C` integral was evaluated with both `scipy.integrate.quad` and `mpmath.quad`; their difference on `C` is `0.000e+00`.

| Quantity | Codex value | Claimed value | Agreement |
|---|---:|---:|---:|
| $I_0$ | 1.000000000000000 | 1.000000000000000 | 15 |
| $I_1$ | 0.693147180559945 | 0.693147180559945 | 15 |
| $I_2$ | 0.147220676960922 | 0.147220676900000 | 9 |
| $I_3$ | 0.014886346728220 | 0.014886346700000 | 10 |
| $I_4$ | 0.000874477749730 | 0.000874480000000 | 8 |
| $\mathcal{V}$ | 0.440029038059253 | 0.440030000000000 | 5 |
| $\rho = \mathcal{V}/2$ | 0.220014519029626 | 0.220015000000000 | 6 |
| $\int_0^1 \frac{\log(2-u)}{1+u}\,du$ | 0.294441353918483 | 0.294441353918482 | 15 |
| $C$ | 0.227036748199648 | 0.227036748199648 | 15 |
