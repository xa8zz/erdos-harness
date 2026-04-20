---
id: R38-codex-first-appearance-reduction
type: research
date: 2026-04-19
intent: >
  Attempt to close the R37 per-score projection gap; reduce same-prime
  chain multiplicity to first-appearance events.
predecessors: [R37-pro-A-per-score-projection, R37-fresh-pro-one-cylinder-closure]
action:
  kind: extends
  target: R37-pro-A-per-score-projection
claim: >
  Same-prime chain collapse to first-appearance events proved as a rigorous
  partial: each same-prime chain of pre-shielding events charges to the
  first-appearance score in that chain. Multiplicity-per-first-appearance
  bound is O(h) but not O(1), leaving a factor-of-h gap before full closure.
---

# Round 38 Codex — same-prime chain collapse to first appearance (rigorous partial)

## Status

I still do **not** have the full R38 closure. But there is a clean new main-game
partial that sharpens route 2 substantially:

> any useful shield with no fresh defect-`k` witness already forces
> `\Omega(h)` live-degree exposure at the **first** same-prime score containing
> the missing prime.

So the recursive same-prime-chain problem collapses to a multiplicity problem on
first-appearance rounds. This is strictly narrower than the original chain
formulation.

## 1. Setup

Work in one large-prime fibre `b`. Let
\[
S = T \cup \{p\}, \qquad |T| = h-1,
\]
be a live residual rank-`h` target at time `t`, and suppose its top facet `T`
is usefully shielded.

Fix a defect parameter `k`, and assume:

\[
\text{there is no fresh legal witness of defect }k
\]
for this useful shield.

Equivalently, there is no fresh legal certificate
\[
c \subsetneq S, \qquad |S \setminus c| = k,
\]
with live degree at least `h`.

Let
\[
r_p(t^-)
  := \#\{\text{earlier scored supports in the same fibre containing }p\}.
\]

Let `\tau_p` be the first round in this fibre when Prolonger scored a support
containing `p`.

## 2. Input from R37 bounded-depth freshness

From
[researcher-37-codex-freshness-bounded-depth-partial.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-37-codex-freshness-bounded-depth-partial.md),
failure of freshness at defect `k` implies

\[
r_p(t^-) \ge h-k.
\tag{1}
\]

This is already the “long same-prime prehistory” conclusion.

The new point here is that one can push all the way back to the **first**
appearance of `p`.

## 3. First-appearance exposure lemma

\[
\textbf{Theorem A (first-appearance exposure).}
\]

Let `S = T \cup \{p\}` be a useful shield at time `t` with no fresh defect-`k`
witness. Then, at the round `\tau_p` of the **first** scored support containing
`p`, the certificate

\[
bp
\]

is legal just before Shortener replies, and its live degree satisfies

\[
d_{\tau_p^-}(bp) \ge r_p(t^-)+1 \ge h-k+1.
\]

Consequently, under multi-defect `\sigma^\star`,

\[
d_{\tau_p^-}(x_{\tau_p}) \ge h-k+1.
\]

### Proof

By definition of `\tau_p`, no earlier Prolonger score in the fibre contains `p`,
so no earlier Prolonger score captures `bp`.

Also, `bp` cannot have been previously claimed by Shortener: if Shortener had
claimed `bp` earlier, then the later residual target `b p A_T` would not be live
at time `t`.

Thus `bp` is legal just before Shortener replies at round `\tau_p`.

Now count live targets through `bp` at that moment.

Every earlier scored support containing `p` that appears before time `t`
corresponds to a distinct rank-`h` target in the same fibre containing `p`.
There are exactly `r_p(t^-)` such supports by definition.

In addition, the later useful residual target `S = T \cup \{p\}` is distinct
from all those scored supports.

All these targets were already live at time `\tau_p^-`:

- none had yet been scored,
- none was removed by an earlier Prolonger score (same-rank fibre targets are
  incomparable),
- and none contains an earlier Shortener claim, because scored targets remain
  legal when later played and `S` is live at time `t`.

Therefore all `r_p(t^-)+1` of these targets contribute to the live degree of
`bp` at time `\tau_p^-`, so

\[
d_{\tau_p^-}(bp) \ge r_p(t^-)+1.
\]

Combining with (1),

\[
d_{\tau_p^-}(bp) \ge h-k+1.
\]

Since `\sigma^\star` claims a legal proper divisor of maximum live degree, its
reply `x_{\tau_p}` satisfies

\[
d_{\tau_p}(x_{\tau_p}) \ge d_{\tau_p^-}(bp) \ge h-k+1.
\]

∎

## 4. Counting consequence

This immediately gives a reduction from route 2 to a multiplicity bound.

\[
\textbf{Corollary B (first-appearance charging reduction).}
\]

Suppose every useful shield with no fresh defect-`k` witness is charged to the
round `\tau_p` of first appearance of its missing prime `p`.

If each round `u` is charged by at most `M_k(h)` such useful shields, then

\[
|F_{\mathrm{bad},k}|
  \le
  \frac{M_k(h)}{h-k+1}
  \sum_u d_u(x_u)
  \le
  \frac{M_k(h)}{h-k+1} N_h.
\]

In particular:

- `M_k(h)=O(1)` gives `|F_{\mathrm{bad},k}| \ll N_h/h`,
- `M_k(h)=O(\log\log h)` gives `|F_{\mathrm{bad},k}| \ll N_h \log\log h / h`,
  still enough for `L(n)=o(n)` after the R35 static estimate.

### Proof

By Theorem A, every charge to round `u=\tau_p` carries degree at least `h-k+1`.
If at most `M_k(h)` shields charge to the same round, then

\[
(h-k+1)\,|F_{\mathrm{bad},k}|
  \le
  M_k(h)\sum_u d_u(x_u).
\]

Now use the already proved multi-defect online domination
\[
\sum_u d_u(x_u)\le N_h.
\]
∎

## 5. What this improves

Before this note, route 2 was:

> long same-prime chains must be shown not to persist against `\sigma^\star`.

After this note, the chain aspect is no longer the real burden. The chain has
already been compressed to the first appearance of `p`.

So the real remaining question is:

\[
\boxed{
\text{how many bad useful shields can charge to one first-appearance round?}
}
\]

That is a **multiplicity problem**, not a persistence problem.

This aligns route 2 much more closely with route 3:

- route 2 now wants multiplicity per first-appearance score,
- route 3 wants a short-interval divisor bound controlling exactly that
  multiplicity.

## 6. Limits of the lemma

The theorem does **not** yet prove sublinearity by itself, because `M_k(h)` is
still open.

The toy data do suggest the multiplicity is small, but not obviously 1:

- charging useful shields to the first same-prime score in the one-cylinder toy
  gave max multiplicities `6` at `(h,M)=(3,9)`, `5` at `(4,9)`, and `3` at
  `(4,8)` in my quick probe.

So first-appearance charging is much cleaner structurally, but still needs a
nontrivial arithmetic bound.

## 7. Best current conclusion

The remaining gap can now be phrased even more sharply:

\[
\boxed{
\text{prove }M_k(h)=O(1)\text{ or }O(\log\log h)\text{ in the low-window regime.}
}
\]

That would close the bad-useful contribution through Corollary B and, combined
with the R35 static estimate, finish the sublinear upper bound.
