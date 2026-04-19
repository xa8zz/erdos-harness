# Round 40 Codex — naive fixed-packet absorption is not the right clustered-cell statement

## Status

I did **not** close the packet lemma. But this pass does sharpen the statement
in a useful way:

> a closure proof via packet absorption cannot be phrased using a **fixed global
> dense packet**.

Even in the clustered one-cylinder stress test, the bad pair-first charges are
not carried by pairs lying inside the designated dense block. So if the packet
route is correct, the relevant packet has to be a **moving packet** attached to
the missing prime or to the Prolonger score, not a fixed dense region.

That does not refute the packet strategy, but it does refute the most naive
version of it.

## Setup checked

I used the existing fast one-cylinder clustered stress test from
[freshness_toy.py](/Users/omisverycool/erdos-harness/erdos-872/phase4/freshness_toy.py):

- run `FastOneCylinderAudit(h, M)`,
- play the clustered greedy policy `greedy_sequence(clustered_dense_size=h)`,
- form the first-useful event stream with `useful_shield_first_events(...)`,
- among pair-bad events, check whether the charged latest pair lies entirely in
  the distinguished dense block \(\{1,\dots,h\}\).

This is the strongest fixed-packet version available in the current toy: all
cluster pressure is deliberately pushed toward that block.

## Computed result

For the clustered one-cylinder stress test:

| case | pair-bad events | max pair-first charge | bad events whose charged pair lies inside the fixed dense block |
|---|---:|---:|---:|
| \((4,14)\) | 20 | 4 | 0 |
| \((5,14)\) | 15 | 3 | 0 |
| \((6,12)\) | 6 | 4 | 0 |
| \((4,20)\) | 56 | 6 | 0 |

So on every computed clustered one-cylinder case, **none** of the bad
pair-first events are charged to a pair entirely contained in the designated
dense block.

## Consequence

This falsifies the naive statement:

> “the bad pair-first multiplicity comes from a fixed dense microcell packet,
> and that packet is directly visible as a globally distinguished dense region.”

That statement is simply not what the toy is doing.

The remaining plausible packet formulation has to be relative:

1. either a packet centered on the **missing prime** \(p\),
2. or a packet attached to the **first-shielding score** \(F_t\),
3. or a packet defined from the local replacement geometry \(q/p \in e^{O(1)/h}\),
   not from an absolute dense subset of labels.

In other words, the “cluster” in the arithmetic proof cannot be a global subset
of primes. It must be a **local compatibility packet**.

## Why this matters

This is exactly the distinction between:

- an invalid fixed-window heuristic, and
- the actual R35 mechanism, which is local in the replacement ratio.

So the packet route is still alive, but the theorem that would close it must now
look more like:

\[
\text{large pair-first multiplicity at score }F_t
\Longrightarrow
\text{many charged pairs lie in }O(1)\text{ packets local to }F_t,
\]

not

\[
\text{large pair-first multiplicity}
\Longrightarrow
\text{global dense packet concentration}.
\]

That is a sharper and, I think, more accurate formulation of the remaining
central-rank lemma.

## Best current interpretation

- This is **not** a refutation of the packet strategy.
- It **is** a refutation of the easiest global-dense-packet version.
- So the next viable proof attempt should formulate packets relative to the
  scored support \(F_t\) or to the missing prime \(p\), then try to marry that
  local packet concentration to the R35 dyadic expanded-window entropy term.

## Artifacts

- Code already used: [freshness_toy.py](/Users/omisverycool/erdos-harness/erdos-872/phase4/freshness_toy.py)
- Prior multiplicity table: [freshness_toy_multiplicity_results.csv](/Users/omisverycool/erdos-harness/erdos-872/phase4/freshness_toy_multiplicity_results.csv)
