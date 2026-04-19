# Round 39 Codex — fixed-packet absorption and reduction of full closure to a packet-concentration lemma

## Status

This does **not** prove the full R38 closure. It does give a clean rigorous
partial that sharpens the remaining gap:

- any useful shield whose charged pair witnesses are confined to a fixed
  `O(1)`-packet of microcells is already absorbed by the existing R35
  entropy-tail term;
- therefore the only remaining load-bearing statement is a **packet
  concentration lemma**: large pair-first per-score multiplicity must force the
  charged shields into such packets.

So the open problem is now narrower than “prove bounded pair-first
multiplicity.” It is enough to prove bounded multiplicity **outside**
packet-concentrated families.

## 1. Setup

Use the R33/R37 microcell partition
\[
\mathcal Q_j = [P_j, e^{1/h} P_j] \cap \mathbb P,
\qquad
\alpha_j := \sum_{p \in \mathcal Q_j} \frac{1}{p},
\qquad
H := \sum_j \alpha_j \sim \log \log n .
\]

Fix an integer `c >= 1`. A `c`-packet is a union of `c` consecutive microcells
\[
\Pi_j^{(c)} := \mathcal Q_j \cup \cdots \cup \mathcal Q_{j+c-1},
\qquad
\beta_j^{(c)} := \sum_{i=0}^{c-1} \alpha_{j+i}.
\]

Let `R_{h,c}^{pkt}` denote the rank-`h` target family whose small-prime support
lies entirely inside some `c`-packet.

## 2. Fixed-packet absorption lemma

\[
\textbf{Lemma A (fixed-packet absorption).}
\]

For every fixed `c`,
\[
|R_{h,c}^{pkt}|
\ll_c
\frac{N_h}{\log h}
\]
in the central range `h \sim H`. In fact the left-hand side is much smaller
than `N_h / \log h`.

### Proof

The standard rank-`h` reciprocal-mass model gives
\[
|R_{h,c}^{pkt}|
\ll
\frac{n}{\log n} \frac{1}{h!} \sum_j \bigl(\beta_j^{(c)}\bigr)^h .
\tag{1}
\]

By convexity,
\[
\bigl(\beta_j^{(c)}\bigr)^h
=
\Bigl(\sum_{i=0}^{c-1} \alpha_{j+i}\Bigr)^h
\le
c^{h-1} \sum_{i=0}^{c-1} \alpha_{j+i}^h.
\]
Summing over `j`, each cell occurs in at most `c` packets, so
\[
\sum_j \bigl(\beta_j^{(c)}\bigr)^h
\le
c^h \sum_j \alpha_j^h
\le
c^h (\max_j \alpha_j)^{h-1} \sum_j \alpha_j.
\tag{2}
\]

For microcells of width `e^{1/h}`,
\[
\alpha_j
=
\sum_{p \in \mathcal Q_j} \frac{1}{p}
\ll
\frac{1}{h}
\]
uniformly in the central regime, so (2) gives
\[
\sum_j \bigl(\beta_j^{(c)}\bigr)^h
\ll_c
H \Bigl(\frac{C_c}{h}\Bigr)^{h-1}.
\]
Substituting into (1),
\[
|R_{h,c}^{pkt}|
\ll_c
\frac{n}{\log n} \frac{H}{h!} \Bigl(\frac{C_c}{h}\Bigr)^{h-1}.
\]

Since
\[
N_h \asymp \frac{n}{\log n} \frac{H^h}{h!}
\]
and `h \sim H`, we obtain
\[
|R_{h,c}^{pkt}|
\ll_c
N_h \cdot \frac{1}{H^{h-1}} \Bigl(\frac{C_c}{h}\Bigr)^{h-1}
\ll_c
N_h \Bigl(\frac{C_c'}{h^2}\Bigr)^{h-1}
\ll_c
\frac{N_h}{\log h}.
\]
This is far smaller than the ambient R35 entropy scale. ∎

## 3. Why this applies to pair-first concentrated shields

Let `S = T \cup {p}` be a useful shield. If **all** charged pair witnesses
`bpq` for `q \in T` lie inside one fixed `c`-packet, then `p` and every `q \in T`
lie in that packet, hence
\[
S \subseteq \Pi_j^{(c)}
\]
for some `j`. So every such useful shield belongs to `R_{h,c}^{pkt}` and is
therefore already counted inside Lemma A's packet tail.

Thus literal packet concentration of the pair-first witnesses is not an online
obstruction at all: it is already paid for by the same entropy mechanism that
absorbs the clustered single-cell examples.

## 4. Conditional reduction of the full closure

\[
\textbf{Corollary B (packet-tail reduction).}
\]

Fix `c >= 1`. Suppose that every useful shield with no fresh pair witness is of
one of the following two types:

1. `packet type`: its charged pair witnesses all lie in one `c`-packet;
2. `non-packet type`: under pair-first charging, the number of such shields
   assigned to any single Prolonger score is at most `M(h)`.

Then
\[
|F_{\mathrm{useful}}|
\ll_c
\frac{M(h)}{h} N_h
+
\frac{N_h}{\log h}.
\]

In particular:

- `M(h)=O(1)` gives `|F_{\mathrm{useful}}| \ll N_h/h`;
- `M(h)=O(\log\log h)` still gives `|F_{\mathrm{useful}}| = o(N_h)`;
- any `M(h)=O(h/\operatorname{polylog} h)` is enough for `L(n)=o(n)` after the
  R35 state estimate.

### Proof

The packet-type shields contribute `O_c(N_h/\log h)` by Lemma A.

For the non-packet family, Pro R38 pair-first charging assigns each shield to a
round `t` where the latest relevant pair witness was first covered, and each
such shield contributes degree at least `h` at that round. If at most `M(h)`
such shields charge to the same round, then
\[
h \, |F_{\mathrm{nonpkt}}|
\le
M(h) \sum_t d_t(x_t)
\le
M(h) N_h
\]
by online domination. Hence
\[
|F_{\mathrm{nonpkt}}|
\le
\frac{M(h)}{h} N_h.
\]
Add the packet contribution. ∎

## 5. What is still missing

This note does **not** prove the final implication

\[
\boxed{
\text{large pair-first multiplicity}
\Longrightarrow
\text{packet concentration.}
}
\]

That is now the precise unresolved step.

Equivalently, full closure would follow from any theorem of the form:

> if a Prolonger score carries pair-first multiplicity `> C`, then the charged
> useful shields are supported in a union of `O_C(1)` consecutive microcells.

Proving that implication would close the R38 program. Refuting it by an
explicit arithmetic construction with high multiplicity spread across several
genuinely separated packets would refute the closure route just as decisively.

## 6. Best current interpretation

The R38/R39 picture is now:

- first-appearance multiplicity is empirically too large to be the right
  invariant;
- pair-first multiplicity remains small in the one-cylinder toy;
- the clustered-microcell obstruction from the Ford refutation is already
  harmless once it is literally packet-confined;
- therefore the only plausible surviving obstruction is a **non-packet,
  spread-out high pair multiplicity** construction.

That is the sharp remaining target.
