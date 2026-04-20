# Piecewise Bonferroni-4 Numerical Verification

Verdict: **constants numerically ratified**.

The finest-grid Bonferroni-4 truncation is `W4 = 0.379421185`, so `W4/2 = 0.189710592`.
This is below the paper threshold `0.19` by `0.000289` and below the conservative truncation target `0.3795` by `0.000079`.

Independent analytic check: `J1 = ∫_0^1 rho(u) du = sum_(k>=2) log(k/(k-1))/k = 0.788530565912`.
The finest-grid `J1` differs from the analytic value by `3.525e-06`.

Grid convergence on successive powers of two:

| Grid | J1 | J2 | J3 | J4 | W4 | W4/2 |
|---|---:|---:|---:|---:|---:|---:|
| `2^13` | 0.78844185 | 0.18676003 | 0.02008041 | 0.00122154 | 0.37945930 | 0.18972965 |
| `2^14` | 0.78849100 | 0.18679383 | 0.02008737 | 0.00122220 | 0.37943767 | 0.18971883 |
| `2^15` | 0.78851725 | 0.18681153 | 0.02009097 | 0.00122255 | 0.37942586 | 0.18971293 |
| `2^16` | 0.78852127 | 0.18681405 | 0.02009149 | 0.00122260 | 0.37942388 | 0.18971194 |
| `2^17` | 0.78852704 | 0.18681777 | 0.02009220 | 0.00122266 | 0.37942118 | 0.18971059 |

Finest-vs-next-finest grid deltas:
- `|ΔJ1| = 5.770e-06`
- `|ΔJ2| = 3.721e-06`
- `|ΔJ3| = 7.157e-07`
- `|ΔJ4| = 6.531e-08`

Comparison to audit-level values:
- `J_1` finest-grid value `0.78852704` matches the audit-level claimed value `0.78853` to 5 decimals.
- `J_2` finest-grid value `0.18681777` matches the audit-level claimed value `0.18682` to 5 decimals.
- `J_3` finest-grid value `0.02009220` matches the audit-level claimed value `0.02009` to 5 decimals.
- `J_4` finest-grid value `0.00122266` matches the audit-level claimed value `0.00122` to 5 decimals.

Interpretation:
- This verifies the numerical side of the Round 15 Bonferroni-4 truncation cleanly and reproducibly.
- It does not by itself settle the monotone-envelope / breakpoint rigor issue for the full `0.18969n` theorem.
- It does support using `0.190n` as the best numerically certified linear headline from the piecewise-density route while the full boundary writeup is still pending.
