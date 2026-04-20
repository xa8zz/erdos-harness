---
id: R41-codex-pair-reuse-bottleneck
type: research
date: 2026-04-19
intent: >
  After collision-forcing audit, push the packet route further and reduce
  the remaining gap to a concrete pair-reuse bound.
predecessors: [R41-codex-collision-forcing-test, R40-codex-packet-formulation-sharpening]
action:
  kind: extends
  target: R40-codex-packet-formulation-sharpening
claim: >
  Packet route reduces to a pair-reuse bound: the remaining gap is whether
  any single cell-pair can be reused as the location of more than O(log h)
  distinct useful top scores under sigma^star. Pair-reuse bottleneck is the
  minimal remaining combinatorial statement for the closure route.
---

# Round 41 Codex — full closure still open; the remaining packet route reduces further to a pair-reuse bound

## Status

I did **not** finish the full closure.

What I can now say cleanly is:

1. the **entropy side** of the packet route is already under control for any
   fixed packet size `c` (this is the R39 fixed-packet absorption lemma);
2. the still-missing combinatorial implication is **not**
   “large pair-first multiplicity means many distinct first-covered pairs”;
3. in the one-cylinder toy, the worst pair-first rounds come from
   **repeated reuse of only 2–3 latest pairs**, not from a proliferation of
   distinct pair channels.

So the actual unresolved theorem is sharper than the R39 prompt phrasing:

\[
\boxed{
\text{outside the moving dyadic-packet tail, a fixed latest pair cannot be reused many times.}
}
\]

That is the load-bearing statement still missing for the pair-first route.

## 1. What is already rigorous

R39 already proved the fixed-packet absorption lemma:

\[
|R_{h,c}^{\mathrm{pkt}}| \ll_c \frac{N_h}{\log h}
\]

for every fixed packet size `c`, where `R_{h,c}^{pkt}` is the rank-`h` family
whose small-prime support lies inside some `c`-packet of consecutive microcells.

So any bad family that is **literally packet-confined** is already absorbed by
the existing R35 entropy term.

That part is not the obstruction anymore.

## 2. The missing implication is stronger than “many distinct pairs”

The natural but too-weak heuristic is:

> if a Prolonger score has large pair-first multiplicity, then it must be
> first-covering many different pair witnesses, and those pair witnesses should
> concentrate in one local packet.

The toy data show this is the wrong bottleneck.

### Example: `(h,M) = (4,14)`

The worst baseline round has multiplicity `4`, charged to score

\[
(0,1,2,11).
\]

The four bad first-useful shields are

- `(1,2,5,11)` missing `1`
- `(1,2,5,11)` missing `2`
- `(1,2,7,11)` missing `1`
- `(1,2,7,11)` missing `2`

and the actual latest pairs are only

\[
(1,11),\quad (2,11).
\]

So multiplicity `4` is produced by **two** latest-pair channels, each reused.

### Example: `(h,M) = (4,20)`

The worst baseline round has multiplicity `6`, charged to score

\[
(0,1,2,15).
\]

The six bad first-useful shields are

- `(1,2,3,15)` missing `1`
- `(1,2,3,15)` missing `2`
- `(1,2,5,15)` missing `1`
- `(1,2,5,15)` missing `2`
- `(1,3,5,15)` missing `1`
- `(2,3,5,15)` missing `2`

and again the actual latest pairs are only

\[
(1,15),\quad (2,15).
\]

So multiplicity `6` is **not** coming from six distinct first-covered pairs.
It is coming from repeated reuse of the same two pair channels.

### Example: `(h,M) = (5,14)`

The worst baseline round has multiplicity `3`, charged to

\[
(0,1,2,3,12),
\]

with the single bad residual target `(1,2,3,4,12)` contributing missing primes
`1,2,3`, hence latest pairs

\[
(1,12),\quad (2,12),\quad (3,12).
\]

Again the number of distinct latest pairs is only `3`.

## 3. Consequence for the proof strategy

The remaining packet theorem cannot just be:

\[
\text{large pair-first multiplicity}
\Longrightarrow
\text{many first-covered pairs in one packet}.
\]

That misses the observed mechanism.

The correct unresolved statement has to control **pair reuse**:

> for a fixed Prolonger score `F_t` and a fixed actual latest pair witness
> `bpq` first-covered at time `t`, how many later useful shields can still be
> charged through that same pair, outside the moving dyadic-packet tail?

If that per-pair reuse is `O(1)` or even `O(h / polylog h)` outside the packet
tail, then the pair-first route is still viable.

If not, then the route is false for a deeper reason than the original
first-appearance obstruction.

## 4. Best current reduction

The full closure attempt now splits into three layers:

1. **Packet-confined bad families:** already absorbed by R39 fixed-packet
   entropy.
2. **Number of actual latest-pair channels per score:** empirically tiny in the
   toy (`2` or `3` in the examples above), but not yet proved arithmetically.
3. **Reuse of one latest-pair channel:** this is the genuinely unresolved
   combinatorial/arithmetic question.

So the precise next theorem to try is:

\[
\boxed{
\text{outside a moving }O(1)\text{-packet tail, one first-covered pair supports only }O(1)
\text{ (or }O(h/\operatorname{polylog} h)\text{) useful shields.}
}
\]

That is now a more faithful formulation of the remaining gap than the broader
“pair-first multiplicity is bounded outside packet concentration” slogan.

## 5. Honest conclusion

I do **not** have the full proof of

\[
L(n) \ll \frac{n}{\log\log\log n}.
\]

The strongest honest update is:

- fixed-packet entropy absorption: yes;
- naive first-appearance route: dead;
- naive “many bad shields means many distinct first-covered pairs” reduction:
  also wrong target;
- remaining live route: a **moving-packet per-pair reuse bound**.

That is the sharpest formulation I can currently justify.
