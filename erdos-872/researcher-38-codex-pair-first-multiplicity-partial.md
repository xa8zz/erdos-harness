# R38 Pair-First Multiplicity: Empirical Partial

Date: 2026-04-19

## What Was Instrumented

`phase4/freshness_toy.py` now measures two different charge multiplicities on the toy models:

- `pair_first_charge_multiplicities`: charge each first-useful shield with no fresh pair witness to the latest first-covered pair round.
- `M_k(h)` proxy via first-appearance charging: charge each first-useful shield with no fresh defect-`k` witness of degree at least `h` to the first appearance round of the missing point.

The script also now supports three variants:

- `one-cylinder`: original arithmetic toy, accelerated by `FastOneCylinderAudit`
- `balanced`: product-of-cells proxy with evenly spread microcells
- `clustered`: product-of-cells proxy with one dense cell and all other cells singleton

The small cases are regression-tested against the existing toy:

- `python3 -m unittest erdos-872/phase4/test_transversal_small_h.py`
- passed with `16` tests

In particular:

- `h=3, M=7`: pair charges `={2:1, 3:2, 4:1, 5:2}`, first-appearance charges `={1:3, 2:2, 4:1}`
- `h=4, M=8`: the fast bitset audit agrees with the slow toy sequence and shield set

## Requested Grid: Completed Runs

Command shape:

```bash
python3 -u erdos-872/phase4/freshness_toy.py \
  --cases 4:14,5:14,6:12,4:20,5:20 \
  --variants one-cylinder,balanced,clustered \
  --defects 1,2
```

### One-cylinder

Completed:

| case | useful shields | pair bad | pair max | pair mean/shield | `M_1(h)` bad | `M_1(h)` max | `M_1(h)` mean/shield | `M_2(h)` bad | `M_2(h)` max | `M_2(h)` mean/shield |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| `(4,14)` | 20 | 20 | 4 | 2.400 | 20 | 13 | 9.000 | 20 | 13 | 9.000 |
| `(5,14)` | 10 | 10 | 3 | 2.600 | 10 | 7 | 5.200 | 10 | 7 | 5.200 |
| `(6,12)` | 0 | 0 | 0 | 0.000 | 0 | 0 | 0.000 | 0 | 0 | 0.000 |
| `(4,20)` | 56 | 56 | 6 | 3.429 | 56 | 34 | 22.071 | 56 | 34 | 22.071 |

Not completed within the interactive runtime budget:

- `(5,20)`

### Balanced product-cell proxy

Completed:

| case | cell sizes | useful shields | pair bad | `M_1(h)` bad | `M_2(h)` bad |
|---|---|---:|---:|---:|---:|
| `(4,14)` | `(4,4,3,3)` | 0 | 0 | 0 | 0 |
| `(5,14)` | `(3,3,3,3,2)` | 0 | 0 | 0 | 0 |
| `(6,12)` | `(2,2,2,2,2,2)` | 0 | 0 | 0 | 0 |
| `(4,20)` | `(5,5,5,5)` | 0 | 0 | 0 | 0 |

Not completed within the interactive runtime budget:

- `(5,20)`

### Clustered product-cell proxy

All requested cases completed, all with no terminal useful shields:

| case | cell sizes | useful shields | pair bad | `M_1(h)` bad | `M_2(h)` bad |
|---|---|---:|---:|---:|---:|
| `(4,14)` | `(11,1,1,1)` | 0 | 0 | 0 | 0 |
| `(5,14)` | `(10,1,1,1,1)` | 0 | 0 | 0 | 0 |
| `(6,12)` | `(7,1,1,1,1,1)` | 0 | 0 | 0 | 0 |
| `(4,20)` | `(17,1,1,1)` | 0 | 0 | 0 | 0 |
| `(5,20)` | `(16,1,1,1,1)` | 0 | 0 | 0 | 0 |

## Readout

1. In the original one-cylinder toy, the multiplicities are definitely **not** staying `O(1)`.
   Already by `(h,M)=(4,20)`, the pair-first charge max is `6`, while the first-appearance `M_1(h), M_2(h)` maxima are `34`.

2. On the completed one-cylinder cases, the first-appearance multiplicity is much larger than the pair-first multiplicity.
   So the R38 first-appearance bottleneck still looks genuinely harder than the pair-first `O_h(N_h)` charging result.

3. The current clustered product-cell proxy is too rigid to witness the obstruction.
   It produces **no** terminal useful shields on the tested grid, so it does not yet validate the intended claim
   “clustered-cell configurations are exactly the entropy-tail ones.”

4. The balanced product-cell proxy is also too weak so far.
   The completed balanced runs similarly produce no useful shields, so they do not currently discriminate clustered from non-clustered bad multiplicity.

## Honest Status

This is a real empirical partial for sub-task (1), but not yet the decisive one.

- It gives trustworthy measurements for the original one-cylinder toy.
- It does **not** yet isolate an “outside the clustered tail” regime inside that toy.
- The current product-cell clustered/balanced proxies are best viewed as negative control models, not as faithful arithmetic surrogates for Pro's clustered-microcell obstruction.

So the remaining useful next step is more specific than before:

- add a cell partition *inside the one-cylinder toy itself* and classify charged shields/events by whether their first-covered pair witnesses are concentrated in one microcell;
- then test whether the large multiplicity in `(4,20)` is entirely carried by that clustered subfamily or survives in the non-clustered remainder.
