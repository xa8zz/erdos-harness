# Phase 0 report

These are heuristic upper bounds on `psi_n(alpha)` produced by exact `beta(P)` solves inside greedy shield searches.
The Mertens term is a proven lower bound, so tightness is suggested only when the heuristic upper bounds sit close to it.

## Empirical grid

| n | alpha | k | beta_min/n | (1/2)log(1/alpha) | gap | elapsed (s) |
|---:|---:|---:|---:|---:|---:|---:|
| 5000 | 0.30 | 12 | 0.4710 | 0.6020 | -0.1310 | 0.12 |
| 5000 | 0.35 | 19 | 0.4190 | 0.5249 | -0.1059 | 0.21 |
| 5000 | 0.40 | 30 | 0.3638 | 0.4581 | -0.0943 | 0.29 |
| 5000 | 0.45 | 46 | 0.3156 | 0.3993 | -0.0837 | 0.44 |
| 5000 | 0.50 | 70 | 0.2680 | 0.3466 | -0.0786 | 0.63 |
| 5000 | 0.55 | 108 | 0.2146 | 0.2989 | -0.0843 | 0.91 |
| 5000 | 0.60 | 165 | 0.1564 | 0.2554 | -0.0990 | 1.34 |
| 5000 | 0.65 | 253 | 0.0994 | 0.2154 | -0.1160 | 2.20 |
| 5000 | 0.70 | 388 | 0.0504 | 0.1783 | -0.1279 | 3.06 |
| 10000 | 0.30 | 15 | 0.5263 | 0.6020 | -0.0757 | 0.39 |
| 10000 | 0.35 | 25 | 0.4672 | 0.5249 | -0.0577 | 0.64 |
| 10000 | 0.40 | 39 | 0.4134 | 0.4581 | -0.0447 | 0.96 |
| 10000 | 0.45 | 63 | 0.3560 | 0.3993 | -0.0433 | 1.41 |
| 10000 | 0.50 | 100 | 0.3046 | 0.3466 | -0.0420 | 2.13 |
| 10000 | 0.55 | 158 | 0.2527 | 0.2989 | -0.0462 | 3.10 |
| 10000 | 0.60 | 251 | 0.1945 | 0.2554 | -0.0609 | 4.51 |
| 10000 | 0.65 | 398 | 0.1319 | 0.2154 | -0.0835 | 6.89 |
| 10000 | 0.70 | 630 | 0.0743 | 0.1783 | -0.1040 | 11.03 |
| 20000 | 0.30 | 19 | 0.5730 | 0.6020 | -0.0289 | 1.04 |
| 20000 | 0.35 | 32 | 0.5159 | 0.5249 | -0.0090 | 1.77 |
| 20000 | 0.40 | 52 | 0.4536 | 0.4581 | -0.0045 | 2.78 |
| 20000 | 0.45 | 86 | 0.3953 | 0.3993 | -0.0039 | 4.32 |
| 20000 | 0.50 | 141 | 0.3428 | 0.3466 | -0.0038 | 7.13 |
| 20000 | 0.55 | 232 | 0.2903 | 0.2989 | -0.0087 | 12.10 |
| 20000 | 0.60 | 380 | 0.2314 | 0.2554 | -0.0240 | 18.80 |
| 20000 | 0.65 | 624 | 0.1653 | 0.2154 | -0.0501 | 34.40 |
| 20000 | 0.70 | 1024 | 0.0974 | 0.1783 | -0.0809 | 51.32 |
| 50000 | 0.30 | 25 | 0.6468 | 0.6020 | 0.0449 | 5.49 |
| 50000 | 0.35 | 44 | 0.5865 | 0.5249 | 0.0616 | 9.92 |
| 50000 | 0.40 | 75 | 0.5179 | 0.4581 | 0.0598 | 16.18 |
| 50000 | 0.45 | 130 | 0.4527 | 0.3993 | 0.0535 | 27.93 |
| 50000 | 0.50 | 223 | 0.3929 | 0.3466 | 0.0463 | 43.43 |
| 50000 | 0.55 | 384 | 0.3356 | 0.2989 | 0.0367 | 64.43 |
| 50000 | 0.60 | 659 | 0.2770 | 0.2554 | 0.0215 | 116.53 |
| 50000 | 0.65 | 1133 | 0.2095 | 0.2154 | -0.0059 | 181.22 |
| 50000 | 0.70 | 1946 | 0.1337 | 0.1783 | -0.0446 | 284.97 |

## ASCII plot

### n = 5000

`pred` = proven lower bound, `emp` = heuristic upper bound from the best strategy prefix

alpha=0.30 pred ######################.. 0.602 | emp #################....... 0.471
alpha=0.35 pred ###################..... 0.525 | emp ################........ 0.419
alpha=0.40 pred #################....... 0.458 | emp #############........... 0.364
alpha=0.45 pred ###############......... 0.399 | emp ############............ 0.316
alpha=0.50 pred #############........... 0.347 | emp ##########.............. 0.268
alpha=0.55 pred ###########............. 0.299 | emp ########................ 0.215
alpha=0.60 pred #########............... 0.255 | emp ######.................. 0.156
alpha=0.65 pred ########................ 0.215 | emp ####.................... 0.099
alpha=0.70 pred #######................. 0.178 | emp ##...................... 0.050

### n = 10000

`pred` = proven lower bound, `emp` = heuristic upper bound from the best strategy prefix

alpha=0.30 pred ######################.. 0.602 | emp ####################.... 0.526
alpha=0.35 pred ###################..... 0.525 | emp #################....... 0.467
alpha=0.40 pred #################....... 0.458 | emp ###############......... 0.413
alpha=0.45 pred ###############......... 0.399 | emp #############........... 0.356
alpha=0.50 pred #############........... 0.347 | emp ###########............. 0.305
alpha=0.55 pred ###########............. 0.299 | emp #########............... 0.253
alpha=0.60 pred #########............... 0.255 | emp #######................. 0.195
alpha=0.65 pred ########................ 0.215 | emp #####................... 0.132
alpha=0.70 pred #######................. 0.178 | emp ###..................... 0.074

### n = 20000

`pred` = proven lower bound, `emp` = heuristic upper bound from the best strategy prefix

alpha=0.30 pred ######################.. 0.602 | emp #####################... 0.573
alpha=0.35 pred ###################..... 0.525 | emp ###################..... 0.516
alpha=0.40 pred #################....... 0.458 | emp #################....... 0.454
alpha=0.45 pred ###############......... 0.399 | emp ###############......... 0.395
alpha=0.50 pred #############........... 0.347 | emp #############........... 0.343
alpha=0.55 pred ###########............. 0.299 | emp ###########............. 0.290
alpha=0.60 pred #########............... 0.255 | emp #########............... 0.231
alpha=0.65 pred ########................ 0.215 | emp ######.................. 0.165
alpha=0.70 pred #######................. 0.178 | emp ####.................... 0.097

### n = 50000

`pred` = proven lower bound, `emp` = heuristic upper bound from the best strategy prefix

alpha=0.30 pred ######################.. 0.602 | emp ######################## 0.647
alpha=0.35 pred ###################..... 0.525 | emp ######################.. 0.586
alpha=0.40 pred #################....... 0.458 | emp ###################..... 0.518
alpha=0.45 pred ###############......... 0.399 | emp #################....... 0.453
alpha=0.50 pred #############........... 0.347 | emp ###############......... 0.393
alpha=0.55 pred ###########............. 0.299 | emp ############............ 0.336
alpha=0.60 pred #########............... 0.255 | emp ##########.............. 0.277
alpha=0.65 pred ########................ 0.215 | emp ########................ 0.209
alpha=0.70 pred #######................. 0.178 | emp #####................... 0.134

## Structural notes

- `(n, alpha)=(5000, 0.30)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 91.67%; squarefree fraction 0.00%; mean omega 3.75; prime dependency width 13.
- `(n, alpha)=(5000, 0.35)`, strategy `diverse`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 78.95%; squarefree fraction 5.26%; mean omega 3.84; prime dependency width 18.
- `(n, alpha)=(5000, 0.40)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 86.67%; squarefree fraction 6.67%; mean omega 3.87; prime dependency width 23.
- `(n, alpha)=(5000, 0.45)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 89.13%; squarefree fraction 4.35%; mean omega 3.57; prime dependency width 34.
- `(n, alpha)=(5000, 0.50)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 90.00%; squarefree fraction 2.86%; mean omega 3.47; prime dependency width 47.
- `(n, alpha)=(5000, 0.55)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 79.63%; squarefree fraction 1.85%; mean omega 3.32; prime dependency width 74.
- `(n, alpha)=(5000, 0.60)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 83.64%; squarefree fraction 12.73%; mean omega 3.28; prime dependency width 97.
- `(n, alpha)=(5000, 0.65)`, strategy `diverse`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 84.98%; squarefree fraction 34.39%; mean omega 3.32; prime dependency width 131.
- `(n, alpha)=(5000, 0.70)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, almost entirely even, one-prime brittle (prime 2 kills almost all).
  H_n fraction 90.46%; squarefree fraction 33.76%; mean omega 3.15; prime dependency width 195.
- `(n, alpha)=(10000, 0.30)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 86.67%; squarefree fraction 13.33%; mean omega 4.00; prime dependency width 17.
- `(n, alpha)=(10000, 0.35)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 92.00%; squarefree fraction 8.00%; mean omega 4.00; prime dependency width 22.
- `(n, alpha)=(10000, 0.40)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 79.49%; squarefree fraction 5.13%; mean omega 3.92; prime dependency width 30.
- `(n, alpha)=(10000, 0.45)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 87.30%; squarefree fraction 3.17%; mean omega 3.83; prime dependency width 43.
- `(n, alpha)=(10000, 0.50)`, strategy `diverse`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 86.00%; squarefree fraction 2.00%; mean omega 3.63; prime dependency width 66.
- `(n, alpha)=(10000, 0.55)`, strategy `diverse`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 76.58%; squarefree fraction 1.90%; mean omega 3.51; prime dependency width 99.
- `(n, alpha)=(10000, 0.60)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 79.28%; squarefree fraction 2.79%; mean omega 3.43; prime dependency width 146.
- `(n, alpha)=(10000, 0.65)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 81.16%; squarefree fraction 24.62%; mean omega 3.38; prime dependency width 199.
- `(n, alpha)=(10000, 0.70)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 86.19%; squarefree fraction 38.57%; mean omega 3.37; prime dependency width 290.
- `(n, alpha)=(20000, 0.30)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 100.00%; squarefree fraction 10.53%; mean omega 4.00; prime dependency width 22.
- `(n, alpha)=(20000, 0.35)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 90.62%; squarefree fraction 6.25%; mean omega 3.97; prime dependency width 27.
- `(n, alpha)=(20000, 0.40)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 94.23%; squarefree fraction 3.85%; mean omega 4.02; prime dependency width 38.
- `(n, alpha)=(20000, 0.45)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 86.05%; squarefree fraction 5.81%; mean omega 4.03; prime dependency width 61.
- `(n, alpha)=(20000, 0.50)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 87.94%; squarefree fraction 3.55%; mean omega 3.84; prime dependency width 91.
- `(n, alpha)=(20000, 0.55)`, strategy `diverse`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 89.22%; squarefree fraction 2.59%; mean omega 3.70; prime dependency width 136.
- `(n, alpha)=(20000, 0.60)`, strategy `diverse`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 73.42%; squarefree fraction 2.11%; mean omega 3.58; prime dependency width 198.
- `(n, alpha)=(20000, 0.65)`, strategy `squarefree`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 81.57%; squarefree fraction 8.81%; mean omega 3.51; prime dependency width 286.
- `(n, alpha)=(20000, 0.70)`, strategy `squarefree`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 83.40%; squarefree fraction 33.30%; mean omega 3.48; prime dependency width 424.
- `(n, alpha)=(50000, 0.30)`, strategy `diverse`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 88.00%; squarefree fraction 8.00%; mean omega 4.12; prime dependency width 27.
- `(n, alpha)=(50000, 0.35)`, strategy `diverse`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 90.91%; squarefree fraction 4.55%; mean omega 4.18; prime dependency width 37.
- `(n, alpha)=(50000, 0.40)`, strategy `h_bias`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 90.67%; squarefree fraction 2.67%; mean omega 4.17; prime dependency width 54.
- `(n, alpha)=(50000, 0.45)`, strategy `diverse`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 92.31%; squarefree fraction 3.85%; mean omega 4.09; prime dependency width 84.
- `(n, alpha)=(50000, 0.50)`, strategy `diverse`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 85.65%; squarefree fraction 4.48%; mean omega 4.09; prime dependency width 139.
- `(n, alpha)=(50000, 0.55)`, strategy `diverse`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 86.46%; squarefree fraction 2.60%; mean omega 3.91; prime dependency width 209.
- `(n, alpha)=(50000, 0.60)`, strategy `squarefree`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 90.90%; squarefree fraction 3.64%; mean omega 3.80; prime dependency width 326.
- `(n, alpha)=(50000, 0.65)`, strategy `squarefree`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 80.05%; squarefree fraction 3.18%; mean omega 3.66; prime dependency width 532.
- `(n, alpha)=(50000, 0.70)`, strategy `squarefree`: strongly H_n-biased, composite-heavy, high-omega, heavily 6-divisible, one-prime brittle (prime 2 kills almost all).
  H_n fraction 83.30%; squarefree fraction 20.76%; mean omega 3.60; prime dependency width 732.

## Sniping audit

- `(n, alpha)=(5000, 0.30)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(5000, 0.35)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(5000, 0.40)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(5000, 0.45)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(5000, 0.50)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(5000, 0.55)`: kill fractions with best primes are k*=1 -> 99.07% via [2], k*=5 -> 100.00% via [2, 3], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(5000, 0.60)`: kill fractions with best primes are k*=1 -> 96.97% via [2], k*=5 -> 100.00% via [2, 3], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(5000, 0.65)`: kill fractions with best primes are k*=1 -> 94.86% via [2], k*=5 -> 100.00% via [3, 5, 7, 13], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(5000, 0.70)`: kill fractions with best primes are k*=1 -> 96.91% via [2], k*=5 -> 100.00% via [2, 3, 7], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(10000, 0.30)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [3], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(10000, 0.35)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [3], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(10000, 0.40)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(10000, 0.45)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(10000, 0.50)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(10000, 0.55)`: kill fractions with best primes are k*=1 -> 99.37% via [2], k*=5 -> 100.00% via [2, 3], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(10000, 0.60)`: kill fractions with best primes are k*=1 -> 99.20% via [2], k*=5 -> 100.00% via [2, 7], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(10000, 0.65)`: kill fractions with best primes are k*=1 -> 94.97% via [2], k*=5 -> 100.00% via [2, 3, 7], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(10000, 0.70)`: kill fractions with best primes are k*=1 -> 95.40% via [2], k*=5 -> 100.00% via [2, 3, 7], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(20000, 0.30)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [3], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(20000, 0.35)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [3], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(20000, 0.40)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(20000, 0.45)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(20000, 0.50)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(20000, 0.55)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(20000, 0.60)`: kill fractions with best primes are k*=1 -> 99.21% via [2], k*=5 -> 100.00% via [2, 3], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(20000, 0.65)`: kill fractions with best primes are k*=1 -> 97.92% via [2], k*=5 -> 100.00% via [2, 3], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(20000, 0.70)`: kill fractions with best primes are k*=1 -> 93.85% via [2], k*=5 -> 100.00% via [2, 3, 5], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(50000, 0.30)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(50000, 0.35)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(50000, 0.40)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(50000, 0.45)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(50000, 0.50)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(50000, 0.55)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(50000, 0.60)`: kill fractions with best primes are k*=1 -> 100.00% via [2], k*=5 -> 100.00% via [2], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(50000, 0.65)`: kill fractions with best primes are k*=1 -> 99.47% via [2], k*=5 -> 100.00% via [2, 3], k*=10 -> 100.00%, k*=50 -> 100.00%.
- `(n, alpha)=(50000, 0.70)`: kill fractions with best primes are k*=1 -> 95.48% via [2], k*=5 -> 100.00% via [2, 3, 5], k*=10 -> 100.00%, k*=50 -> 100.00%.

## Assessment

The grid is broadly consistent with `psi(alpha)` being close to the Mertens lower bound at this scale.
Because the search is heuristic, this is evidence for tightness, not proof.

The most trustworthy signal here is not just the gap, but the structure of the best shield sets.
If the best sets are very brittle under prime sniping, that weakens the online Prolonger outlook even if the offline values look promising.

## Runtime notes

- `n=5000` used strategies `h_bias, diverse, squarefree` with combined trajectory time 10.26s.
- `n=10000` used strategies `h_bias, diverse, squarefree` with combined trajectory time 36.86s.
- `n=20000` used strategies `h_bias, diverse, squarefree` with combined trajectory time 137.10s.
- `n=50000` used strategies `h_bias, diverse, squarefree` with combined trajectory time 746.90s.
