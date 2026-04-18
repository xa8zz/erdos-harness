# Phase 1 report

## Single-most-important finding

Across the full stress grid, no tested strategy pair broke the `n / log n` scale: `L(n) log n / n` stayed in a bounded band rather than trending upward toward linear growth or downward toward a faster decay.
What *did* break was the putative universal constant near `1.5`: against stronger Prolonger heuristics, the apparent constant moved up to about `2.28`, while weaker ones sat near `1.16`.

## Part A — Reproduction

| n | reported vs P_pb | reproduced vs P_pb | reproduced vs P_sh | delta vs reported |
|---:|---:|---:|---:|---:|
| 500 | 1.490 | 1.467 | 1.827 | -0.023 |
| 1000 | 1.450 | 1.506 | 1.934 | +0.056 |
| 2000 | 1.430 | 1.532 | 1.953 | +0.102 |
| 5000 | 1.550 | 1.576 | 1.979 | +0.026 |
| 10000 | 1.520 | 1.556 | 2.015 | +0.036 |
| 20000 | 1.470 | 1.414 | 2.040 | -0.056 |

The earlier `P_pb` fit is qualitatively reproducible but not to three decimal places.
The strongest mismatch is at `n = 2000`, where this implementation gives `1.532` instead of the reported `1.430`.

## Part B — Stress grid

| n | shortener | prolonger | median moves | median L log n / n | runs |
|---:|---|---|---:|---:|---:|
| 1000 | S_primorial | P_anti_S_star | 303.0 | 2.093 | 1 |
| 1000 | S_primorial | P_composite | 243.0 | 1.679 | 1 |
| 1000 | S_primorial | P_maker_breaker | 171.0 | 1.181 | 1 |
| 1000 | S_primorial | P_pb | 225.0 | 1.554 | 1 |
| 1000 | S_primorial | P_pivot | 283.0 | 1.955 | 1 |
| 1000 | S_primorial | P_primorial_template | 173.0 | 1.195 | 1 |
| 1000 | S_primorial | P_random | 174.0 | 1.202 | 5 |
| 1000 | S_primorial | P_sh | 280.0 | 1.934 | 1 |
| 1000 | S_shadow | P_anti_S_star | 304.0 | 2.100 | 1 |
| 1000 | S_shadow | P_composite | 219.0 | 1.513 | 1 |
| 1000 | S_shadow | P_maker_breaker | 173.0 | 1.195 | 1 |
| 1000 | S_shadow | P_pb | 267.0 | 1.844 | 1 |
| 1000 | S_shadow | P_pivot | 275.0 | 1.900 | 1 |
| 1000 | S_shadow | P_primorial_template | 173.0 | 1.195 | 1 |
| 1000 | S_shadow | P_random | 174.0 | 1.202 | 5 |
| 1000 | S_shadow | P_sh | 283.0 | 1.955 | 1 |
| 1000 | S_star | P_anti_S_star | 305.0 | 2.107 | 1 |
| 1000 | S_star | P_composite | 243.0 | 1.679 | 1 |
| 1000 | S_star | P_maker_breaker | 171.0 | 1.181 | 1 |
| 1000 | S_star | P_pb | 218.0 | 1.506 | 1 |
| 1000 | S_star | P_pivot | 283.0 | 1.955 | 1 |
| 1000 | S_star | P_primorial_template | 173.0 | 1.195 | 1 |
| 1000 | S_star | P_random | 174.0 | 1.202 | 5 |
| 1000 | S_star | P_sh | 280.0 | 1.934 | 1 |
| 5000 | S_primorial | P_anti_S_star | 1347.0 | 2.295 | 1 |
| 5000 | S_primorial | P_composite | 941.0 | 1.603 | 1 |
| 5000 | S_primorial | P_maker_breaker | 804.0 | 1.370 | 1 |
| 5000 | S_primorial | P_pb | 941.0 | 1.603 | 1 |
| 5000 | S_primorial | P_pivot | 1177.0 | 2.005 | 1 |
| 5000 | S_primorial | P_primorial_template | 865.0 | 1.473 | 1 |
| 5000 | S_primorial | P_random | 739.0 | 1.259 | 5 |
| 5000 | S_primorial | P_sh | 1162.0 | 1.979 | 1 |
| 5000 | S_shadow | P_anti_S_star | 1314.0 | 2.238 | 1 |
| 5000 | S_shadow | P_composite | 864.0 | 1.472 | 1 |
| 5000 | S_shadow | P_maker_breaker | 771.0 | 1.313 | 1 |
| 5000 | S_shadow | P_pb | 1113.0 | 1.896 | 1 |
| 5000 | S_shadow | P_pivot | 1167.0 | 1.988 | 1 |
| 5000 | S_shadow | P_primorial_template | 771.0 | 1.313 | 1 |
| 5000 | S_shadow | P_random | 708.0 | 1.206 | 5 |
| 5000 | S_shadow | P_sh | 1160.0 | 1.976 | 1 |
| 5000 | S_star | P_anti_S_star | 1347.0 | 2.295 | 1 |
| 5000 | S_star | P_composite | 941.0 | 1.603 | 1 |
| 5000 | S_star | P_maker_breaker | 805.0 | 1.371 | 1 |
| 5000 | S_star | P_pb | 925.0 | 1.576 | 1 |
| 5000 | S_star | P_pivot | 1177.0 | 2.005 | 1 |
| 5000 | S_star | P_primorial_template | 865.0 | 1.473 | 1 |
| 5000 | S_star | P_random | 739.0 | 1.259 | 5 |
| 5000 | S_star | P_sh | 1162.0 | 1.979 | 1 |
| 20000 | S_primorial | P_anti_S_star | 4518.0 | 2.237 | 1 |
| 20000 | S_primorial | P_composite | 2782.0 | 1.378 | 1 |
| 20000 | S_primorial | P_maker_breaker | 2560.0 | 1.268 | 1 |
| 20000 | S_primorial | P_pb | 2891.0 | 1.432 | 1 |
| 20000 | S_primorial | P_pivot | 4094.0 | 2.027 | 1 |
| 20000 | S_primorial | P_primorial_template | 2740.0 | 1.357 | 1 |
| 20000 | S_primorial | P_random | 2420.0 | 1.198 | 5 |
| 20000 | S_primorial | P_sh | 4120.0 | 2.040 | 1 |
| 20000 | S_shadow | P_anti_S_star | 4581.0 | 2.268 | 1 |
| 20000 | S_shadow | P_composite | 2703.0 | 1.338 | 1 |
| 20000 | S_shadow | P_maker_breaker | 2398.0 | 1.187 | 1 |
| 20000 | S_shadow | P_pb | 3144.0 | 1.557 | 1 |
| 20000 | S_shadow | P_pivot | 4073.0 | 2.017 | 1 |
| 20000 | S_shadow | P_primorial_template | 2398.0 | 1.187 | 1 |
| 20000 | S_shadow | P_random | 2370.0 | 1.174 | 5 |
| 20000 | S_shadow | P_sh | 4121.0 | 2.041 | 1 |
| 20000 | S_star | P_anti_S_star | 4518.0 | 2.237 | 1 |
| 20000 | S_star | P_composite | 2782.0 | 1.378 | 1 |
| 20000 | S_star | P_maker_breaker | 2561.0 | 1.268 | 1 |
| 20000 | S_star | P_pb | 2856.0 | 1.414 | 1 |
| 20000 | S_star | P_pivot | 4094.0 | 2.027 | 1 |
| 20000 | S_star | P_primorial_template | 2740.0 | 1.357 | 1 |
| 20000 | S_star | P_random | 2420.0 | 1.198 | 5 |
| 20000 | S_star | P_sh | 4120.0 | 2.040 | 1 |
| 50000 | S_primorial | P_anti_S_star | 10465.0 | 2.265 | 1 |
| 50000 | S_primorial | P_composite | 6741.0 | 1.459 | 1 |
| 50000 | S_primorial | P_maker_breaker | 5899.0 | 1.277 | 1 |
| 50000 | S_primorial | P_pb | 7457.0 | 1.614 | 1 |
| 50000 | S_primorial | P_pivot | 9720.0 | 2.103 | 1 |
| 50000 | S_primorial | P_primorial_template | 6928.0 | 1.499 | 1 |
| 50000 | S_primorial | P_random | 5369.0 | 1.162 | 5 |
| 50000 | S_primorial | P_sh | 9629.0 | 2.084 | 1 |
| 50000 | S_shadow | P_anti_S_star | 9675.0 | 2.094 | 1 |
| 50000 | S_shadow | P_composite | 6627.0 | 1.434 | 1 |
| 50000 | S_shadow | P_maker_breaker | 5849.0 | 1.266 | 1 |
| 50000 | S_shadow | P_pb | 8293.0 | 1.795 | 1 |
| 50000 | S_shadow | P_pivot | 9725.0 | 2.104 | 1 |
| 50000 | S_shadow | P_primorial_template | 5849.0 | 1.266 | 1 |
| 50000 | S_shadow | P_random | 5415.0 | 1.172 | 5 |
| 50000 | S_shadow | P_sh | 9611.0 | 2.080 | 1 |
| 50000 | S_star | P_anti_S_star | 10465.0 | 2.265 | 1 |
| 50000 | S_star | P_composite | 6741.0 | 1.459 | 1 |
| 50000 | S_star | P_maker_breaker | 5898.0 | 1.276 | 1 |
| 50000 | S_star | P_pb | 7348.0 | 1.590 | 1 |
| 50000 | S_star | P_pivot | 9720.0 | 2.103 | 1 |
| 50000 | S_star | P_primorial_template | 6928.0 | 1.499 | 1 |
| 50000 | S_star | P_random | 5369.0 | 1.162 | 5 |
| 50000 | S_star | P_sh | 9629.0 | 2.084 | 1 |
| 100000 | S_star | P_anti_S_star | 19814.0 | 2.281 | 1 |

## ASCII plots

### S_star vs P_sh

n=   500 ###################..... 1.827
n=  1000 ####################.... 1.934
n=  2000 ####################.... 1.953
n=  5000 #####################... 1.979
n= 10000 #####################... 2.015
n= 20000 #####################... 2.040
n= 50000 ######################.. 2.084

### S_star vs P_pb

n=   500 ###############......... 1.467
n=  1000 ################........ 1.506
n=  2000 ################........ 1.532
n=  5000 ################........ 1.576
n= 10000 ################........ 1.556
n= 20000 ###############......... 1.414
n= 50000 #################....... 1.590

### S_star vs P_random

n=  1000 #############........... 1.202
n=  5000 #############........... 1.259
n= 20000 #############........... 1.198
n= 50000 ############............ 1.162

### S_star vs P_primorial_template

n=  1000 ############............ 1.195
n=  5000 ###############......... 1.473
n= 20000 ##############.......... 1.357
n= 50000 ################........ 1.499

### S_star vs P_composite

n=  1000 ##################...... 1.679
n=  5000 #################....... 1.603
n= 20000 ##############.......... 1.378
n= 50000 ###############......... 1.459

### S_star vs P_pivot

n=  1000 ####################.... 1.955
n=  5000 #####################... 2.005
n= 20000 #####################... 2.027
n= 50000 ######################.. 2.103

### S_star vs P_maker_breaker

n=  1000 ############............ 1.181
n=  5000 ##############.......... 1.371
n= 20000 #############........... 1.268
n= 50000 #############........... 1.276

### S_star vs P_anti_S_star

n=  1000 ######################.. 2.107
n=  5000 ######################## 2.295
n= 20000 #######################. 2.237
n= 50000 ######################## 2.265
n=100000 ######################## 2.281

### S_shadow vs P_sh

n=  1000 ####################.... 1.955
n=  5000 #####################... 1.976
n= 20000 #####################... 2.041
n= 50000 ######################.. 2.080

### S_shadow vs P_pb

n=  1000 ###################..... 1.844
n=  5000 ####################.... 1.896
n= 20000 ################........ 1.557
n= 50000 ###################..... 1.795

### S_shadow vs P_random

n=  1000 #############........... 1.202
n=  5000 #############........... 1.206
n= 20000 ############............ 1.174
n= 50000 ############............ 1.172

### S_shadow vs P_primorial_template

n=  1000 ############............ 1.195
n=  5000 ##############.......... 1.313
n= 20000 ############............ 1.187
n= 50000 #############........... 1.266

### S_shadow vs P_composite

n=  1000 ################........ 1.513
n=  5000 ###############......... 1.472
n= 20000 ##############.......... 1.338
n= 50000 ###############......... 1.434

### S_shadow vs P_pivot

n=  1000 ####################.... 1.900
n=  5000 #####################... 1.988
n= 20000 #####################... 2.017
n= 50000 ######################.. 2.104

### S_shadow vs P_maker_breaker

n=  1000 ############............ 1.195
n=  5000 ##############.......... 1.313
n= 20000 ############............ 1.187
n= 50000 #############........... 1.266

### S_shadow vs P_anti_S_star

n=  1000 ######################.. 2.100
n=  5000 #######################. 2.238
n= 20000 ######################## 2.268
n= 50000 ######################.. 2.094

### S_primorial vs P_sh

n=  1000 ####################.... 1.934
n=  5000 #####################... 1.979
n= 20000 #####################... 2.040
n= 50000 ######################.. 2.084

### S_primorial vs P_pb

n=  1000 ################........ 1.554
n=  5000 #################....... 1.603
n= 20000 ###############......... 1.432
n= 50000 #################....... 1.614

### S_primorial vs P_random

n=  1000 #############........... 1.202
n=  5000 #############........... 1.259
n= 20000 #############........... 1.198
n= 50000 ############............ 1.162

### S_primorial vs P_primorial_template

n=  1000 ############............ 1.195
n=  5000 ###############......... 1.473
n= 20000 ##############.......... 1.357
n= 50000 ################........ 1.499

### S_primorial vs P_composite

n=  1000 ##################...... 1.679
n=  5000 #################....... 1.603
n= 20000 ##############.......... 1.378
n= 50000 ###############......... 1.459

### S_primorial vs P_pivot

n=  1000 ####################.... 1.955
n=  5000 #####################... 2.005
n= 20000 #####################... 2.027
n= 50000 ######################.. 2.103

### S_primorial vs P_maker_breaker

n=  1000 ############............ 1.181
n=  5000 ##############.......... 1.370
n= 20000 #############........... 1.268
n= 50000 #############........... 1.277

### S_primorial vs P_anti_S_star

n=  1000 ######################.. 2.093
n=  5000 ######################## 2.295
n= 20000 #######################. 2.237
n= 50000 ######################## 2.265

## Part C — Apparent constants


For `S_star`, the observed large-`n` constants span roughly `1.162` to `2.295` across Prolonger heuristics.
That is far too wide to support a universal constant near `1.5`; the constant is strategy-dependent in this grid.

### S_star

- `P_sh`: latest `L log n / n` = 2.084 at n = 50000.
- `P_pb`: latest `L log n / n` = 1.590 at n = 50000.
- `P_random`: latest `L log n / n` = 1.162 at n = 50000.
- `P_primorial_template`: latest `L log n / n` = 1.499 at n = 50000.
- `P_composite`: latest `L log n / n` = 1.459 at n = 50000.
- `P_pivot`: latest `L log n / n` = 2.103 at n = 50000.
- `P_maker_breaker`: latest `L log n / n` = 1.276 at n = 50000.
- `P_anti_S_star`: latest `L log n / n` = 2.281 at n = 100000.

### S_shadow

- `P_sh`: latest `L log n / n` = 2.080 at n = 50000.
- `P_pb`: latest `L log n / n` = 1.795 at n = 50000.
- `P_random`: latest `L log n / n` = 1.172 at n = 50000.
- `P_primorial_template`: latest `L log n / n` = 1.266 at n = 50000.
- `P_composite`: latest `L log n / n` = 1.434 at n = 50000.
- `P_pivot`: latest `L log n / n` = 2.104 at n = 50000.
- `P_maker_breaker`: latest `L log n / n` = 1.266 at n = 50000.
- `P_anti_S_star`: latest `L log n / n` = 2.094 at n = 50000.

### S_primorial

- `P_sh`: latest `L log n / n` = 2.084 at n = 50000.
- `P_pb`: latest `L log n / n` = 1.614 at n = 50000.
- `P_random`: latest `L log n / n` = 1.162 at n = 50000.
- `P_primorial_template`: latest `L log n / n` = 1.499 at n = 50000.
- `P_composite`: latest `L log n / n` = 1.459 at n = 50000.
- `P_pivot`: latest `L log n / n` = 2.103 at n = 50000.
- `P_maker_breaker`: latest `L log n / n` = 1.277 at n = 50000.
- `P_anti_S_star`: latest `L log n / n` = 2.265 at n = 50000.

## Part D — Exact minimax

| n | L(n) | first move | elapsed (s) | L log n / n |
|---:|---:|---:|---:|---:|
| 2 | 1 | 2 | 0.000 | 0.347 |
| 3 | 2 | 2 | 0.000 | 0.732 |
| 4 | 2 | 2 | 0.000 | 0.693 |
| 5 | 3 | 2 | 0.000 | 0.966 |
| 6 | 3 | 2 | 0.000 | 0.896 |
| 7 | 4 | 2 | 0.000 | 1.112 |
| 8 | 4 | 2 | 0.000 | 1.040 |
| 9 | 5 | 6 | 0.000 | 1.221 |
| 10 | 5 | 6 | 0.000 | 1.151 |
| 11 | 6 | 6 | 0.000 | 1.308 |
| 12 | 6 | 6 | 0.000 | 1.242 |
| 13 | 7 | 6 | 0.000 | 1.381 |
| 14 | 7 | 6 | 0.000 | 1.320 |
| 15 | 7 | 6 | 0.000 | 1.264 |
| 16 | 7 | 6 | 0.000 | 1.213 |
| 17 | 8 | 6 | 0.001 | 1.333 |
| 18 | 8 | 6 | 0.001 | 1.285 |
| 19 | 9 | 6 | 0.002 | 1.395 |
| 20 | 9 | 6 | 0.002 | 1.348 |
| 21 | 10 | 6 | 0.003 | 1.450 |
| 22 | 10 | 6 | 0.004 | 1.405 |
| 23 | 11 | 6 | 0.008 | 1.500 |
| 24 | 11 | 6 | 0.008 | 1.457 |
| 25 | 11 | 6 | 0.010 | 1.416 |
| 26 | 11 | 6 | 0.013 | 1.378 |
| 27 | 12 | 12 | 0.021 | 1.465 |
| 28 | 12 | 12 | 0.023 | 1.428 |
| 29 | 13 | 12 | 0.040 | 1.509 |
| 30 | 13 | 12 | 0.057 | 1.474 |
| 31 | 14 | 12 | 0.101 | 1.551 |
| 32 | 14 | 12 | 0.121 | 1.516 |
| 33 | 14 | 12 | 0.257 | 1.483 |
| 34 | 14 | 12 | 0.326 | 1.452 |
| 35 | 15 | 30 | 0.524 | 1.524 |
| 36 | 15 | 30 | 0.512 | 1.493 |
| 37 | 16 | 30 | 0.874 | 1.561 |
| 38 | 16 | 30 | 1.069 | 1.532 |
| 39 | 17 | 30 | 2.591 | 1.597 |
| 40 | 17 | 30 | 2.826 | 1.568 |
| 41 | 18 | 30 | 4.877 | 1.630 |
| 42 | 18 | 30 | 6.332 | 1.602 |
| 43 | 19 | 30 | 11.106 | 1.662 |
| 44 | 19 | 30 | 11.596 | 1.634 |
| 45 | 20 | 30 | 19.642 | 1.692 |
| 46 | 20 | 30 | 24.442 | 1.665 |
| 47 | 21 | 30 | 42.363 | 1.720 |
| 48 | 21 | 30 | 53.988 | 1.694 |

The exact frontier reached `n = 48` before timing out at `n = 49`.

## Part E — Larger-n extension

The strongest Prolonger observed against `S_star` at the large end was `P_anti_S_star` with `L log n / n = 2.281` at `n = 100000`.

## Verdict

The data support the scaling-law part of the conjecture: across all tested pairs, `L(n)` behaves like `const(strategy-pair) * n / log n` rather than like a linear fraction of `n`.

The specific claim that `L(n) log n / n` converges to a universal constant around `1.5` is not supported.
A stronger summary is: `n / log n` scaling survived this stress test, but the constant depends materially on the strategy pair and can be as high as about `2.28` in the current grid.

Caveat: `P_pivot` and `P_anti_S_star` use screened candidate pools at large `n` for tractability, so those rows are strong heuristics rather than exhaustive global searches.
