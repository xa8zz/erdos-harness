# R39 Codex follow-up: Gamma_2 projection scaling in the one-cylinder toy

## Setup

I extended `phase4/freshness_toy.py` with two new audits for bad useful shields:

1. For a bad useful shield event `S`, let `F` be the Prolonger score at the event's **pair-charge round** `latest_pair_round`. Define
   `Gamma_2(S,F)` to be the pairs inside `S ∩ F` whose first shielding round is exactly `F`.
   The measured density is
   `|Gamma_2(S,F)| / binom(|S ∩ F|, 2)`.
2. Group bad useful shields by the same pair-charge round `F` and count how many of those shields reuse each pair channel `(p, q0)` inside `Gamma_2`.

This is the quantity relevant to Pro's dense-packet lemma in the pair-first charging picture.

## Large one-cylinder cases

### Case `(h, M) = (5, 20)`

- Greedy scored stars: `42`
- Useful shields: `35`
- Bad pair-first shields: `35`
- `Gamma_2` density histogram:
  - `15` shields at density `1/6`
  - `18` shields at density `1/2`
  - `2` shields at density `2/3`
- So `20 / 35` bad shields already satisfy the dense threshold `density >= 1/2`.

Largest pair-channel reuse buckets:

- Round `9`, score `F = (0, 1, 2, 3, 20)`:
  - `6` bad shields
  - only `3` pair channels: `(1,20), (2,20), (3,20)`
  - each of the three channels appears in all `6` shields
- Round `7`, score `F = (0, 1, 2, 3, 16)`:
  - `5` bad shields
  - only `3` pair channels: `(1,16), (2,16), (3,16)`
  - max per-channel reuse `5`

The densest bad shields are still low-support: e.g. at round `7`, support `(1,2,16)` gives
`Gamma_2 = {(1,16), (2,16)}` and density `2/3`.

### Case `(h, M) = (6, 16)`

- Greedy scored stars: `23`
- Useful shields: `6`
- Bad pair-first shields: `6`
- `Gamma_2` density histogram:
  - `2` shields at density `1/10`
  - `4` shields at density `4/10`
- No bad shield reaches the dense threshold `density >= 1/2`.

Largest pair-channel reuse buckets:

- Round `6`, score `F = (0, 1, 2, 3, 4, 15)`:
  - `4` bad shields
  - only `4` pair channels: `(1,15), (2,15), (3,15), (4,15)`
  - each of the four channels appears in all `4` shields
- Round `12`, score `F = (0, 1, 2, 3, 7, 15)`:
  - `2` bad shields
  - exactly one pair channel: `(7,15)`
  - reuse `2`

So the sparse regime really does occur here, but it is still extremely structured: all bad shields sit on one late coordinate `15` and a tiny hub set.

### Case `(h, M) = (7, 14)`

- Greedy scored stars: `14`
- Useful shields: `0`
- Bad pair-first shields: `0`

No obstruction survives at this scale.

## Takeaway

The one-cylinder obstruction is not spreading over many unrelated pairs.

- At `(5,20)`, the dense-packet lemma already captures a majority of the bad shields.
- At `(6,16)`, the remaining bad shields are sparse in `Gamma_2`, but the support is still just a single late coordinate `q0` paired with a tiny fixed hub.
- At `(7,14)`, the obstruction disappears entirely.

So the empirical picture after R39 is:

1. There is still no evidence for a broad sparse-chain refutation in the main direction.
2. The actual bad packets look one-axis / one-late-coordinate, not combinatorially diffuse.
3. A recursive charging lemma that collapses sparse chains onto one late coordinate still looks like the right closure target.
