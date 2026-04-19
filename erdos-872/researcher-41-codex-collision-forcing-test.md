# R41 Codex Audit — Collision-Forcing Refutation Test

## Scope note

The file named in the request,
`researcher-41-pro-collision-forcing-refuted.md`, is not present in this
checkout, so this audit checks the construction exactly as stated in the prompt
against the repo's current Phase 4 freshness / usefulness conventions.

## Task 1 — math verification

Work in the fixed-core packet gadget implemented in
`phase4/freshness_toy.py`:

- fix a core `D` of size `h-2`, one point in each of `h-2` distinct packets;
- residual targets are all `D ∪ {x, y}` with `x, y` taken from two distinct
  non-core packets;
- Pro scores only `F_i = D ∪ {a_i, b_i}`;
- Shortener uses `sigma*`: max live-target degree over legal proper
  certificates, with the existing tie-breaks (smaller certificates, then
  lexicographic).

### 1. Freshness of `E_i`

For `i >= 2`, `E_i = D ∪ {a_i, b_i}` is fresh in the prompt's stated sense:

- `E_i` is legal because `a_i, b_i` are taken from new packets, so `E_i` is not
  equal to any earlier scored target and contains no previously claimed
  singleton.
- The only Shortener claims produced by this gadget are singletons. Since
  `a_i, b_i` are chosen from packets avoiding all earlier claims, no claimed
  certificate is a subset of `E_i`.

So the `X_i` avoidance really does sidestep the only freshness obstruction that
appears in this model.

### 2. Usefulness of `F_i`

At time `F_i^-`, the facet `c_i = D ∪ {a_i}` is legal:

- it was not killed by earlier Pro scores, because every earlier `F_j` contains
  `D` but does **not** contain the fresh point `a_i`;
- it was not claimed by Shortener, because `a_i` lies in a new packet and the
  core points of `D` were already pre-shielded by `F_1`, so `sigma*` never gets
  to claim them.

After scoring `F_i`, the witness target `E_i' = D ∪ {a_i, z_i}` remains live:

- it is not itself one of the scored targets;
- it contains no claimed singleton because `z_i` is also chosen from a fresh
  packet.

So each `F_i` really does create one useful target in this gadget.

### 3. Packet separation

For `h = 4`, `D = {p, q}` and
`F_i = {p, q, a_i, b_i}`. By construction the packets of `p, q, a_i, b_i` are
all distinct, so
`coll(S_{F_i}) = 4 - |{packet(p), packet(q), packet(a_i), packet(b_i)}| = 0`.
The same argument works for general `h`.

### 4. Actual `sigma*` response after `F_1`

In this packet gadget the legal max-degree certificates are singletons, not
core-containing certificates:

- every certificate containing a legal singleton has the same live-target degree
  but loses the tie-break to the singleton;
- any two-flex certificate has degree at most `1`;
- every core singleton is already unavailable after `F_1` because it is a
  subset of the scored target `F_1`.

Therefore `sigma*`'s first move is the lexicographically smallest legal
singleton outside `D`. In the deterministic implementation this is the second
point in the first extra packet used by Pro, e.g. `(2,)` in the spread-core
grid runs.

Crucially, `sigma*` never reaches `D`: the core certificates are already
pre-shielded by `F_1`, so they are not legal Shortener moves at later times.

## Verdict on Task 1

Inside the exact fixed-core packet gadget above, I do **not** see a
`sigma*`-based loophole. The construction is internally consistent: freshness
holds, usefulness holds, `coll = 0`, and the feared "eventually `sigma*` claims
something in `D`" failure does not occur.

The one caveat is external, not internal: because the named R41 writeup file is
missing from this checkout, I could only audit the construction written in the
prompt, not any extra global-divisibility argument that may exist in that
missing note.

## Task 2 — empirical implementation

Implemented in `phase4/freshness_toy.py` as
`run_repeated_core_packet_strategy(...)`.

Model choices:

- total packets default to `(h - 2) + 3M`, so the gadget has exactly `3M`
  non-core packets available;
- core position is parameterized (`front`, `spread`, `back`);
- the reported grid uses `spread`, which best matches the "non-local core"
  wording.

Spot-check: on `(h, M) = (4, 6)` and `(5, 6)`, the achieved `J(D)` was the same
for `front`, `spread`, and `back`, so the scaling outcome here is not sensitive
to core placement.

### Grid results (`core_position='spread'`)

| `(h, M)` | `J(D)` | stop reason | first claim | last claim | max `coll` | `J(D)/(N_h/h)` |
|---|---:|---|---|---|---:|---:|
| `(4, 30)` | 30 | `no_fresh_packets` | `(2,)` | `(32,)` | 0 | `3.329e-05` |
| `(5, 30)` | 30 | `no_fresh_packets` | `(2,)` | `(32,)` | 0 | `4.161e-05` |
| `(6, 25)` | 25 | `no_fresh_packets` | `(2,)` | `(27,)` | 0 | `8.649e-05` |
| `(4, 50)` | 50 | `no_fresh_packets` | `(2,)` | `(52,)` | 0 | `7.159e-06` |
| `(5, 50)` | 50 | `no_fresh_packets` | `(2,)` | `(52,)` | 0 | `8.949e-06` |

Additional diagnostics:

- every iteration passed both the freshness and usefulness checks;
- no run had a Shortener claim intersecting the core `D`;
- the gadget scales exactly until the supply of fresh packets is exhausted.

## Interpretation

Two facts are true at once:

1. The repeated-core gadget **does** scale in this packet model: `J(D) = M`.
2. Its normalized load is still tiny on the reported grids:
   `J(D)/(N_h/h) = O(h/M^3)`, numerically around `10^-5` to `10^-4`.

So this implementation does **not** look like a decisive refutation of route 2
by itself. It gives a coherent local counterpattern, but on the natural packet
count normalization it remains far below the `N_h/h` scale.
