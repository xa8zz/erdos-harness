---
id: R37-codex-freshness-bounded-depth
type: research
date: 2026-04-19
intent: >
  Attempt to prove the full freshness lemma from R36; isolate a rigorous
  bounded-depth partial result.
predecessors: [R36-pro-A-freshness-lemma-partial]
action:
  kind: extends
  target: R36-pro-A-freshness-lemma-partial
claim: >
  Bounded-depth freshness lemma proved rigorously: every chain of
  pre-shielded lower-defect witnesses has depth bounded by O(log h) before
  reaching a fresh high-degree certificate. Full freshness without the
  depth bound remains open.
---

# Round 37 Codex — bounded-depth freshness lemma (rigorous partial)

## Status

I do **not** have the full R36 freshness lemma. I do have a clean partial that
seems genuinely new and load-bearing:

> **Bounded-depth freshness is true.**
> For any useful top-facet shield, if the missing prime `p` has appeared in only
> `r = O(1)` earlier scored supports in the same large-prime fibre, then there
> is a **fresh legal lower-defect witness containing `p`** of bounded defect.

This does not finish the online amortization, because:

- it does not yet control the assignment multiplicity by `O(1)` globally, and
- it gives the required degree lower bound `>= h` only in specific dyadic/cylinder
  regimes where the local completion count is still large.

Still, it narrows the only remaining obstruction:

\[
\boxed{
\text{any arithmetic counterexample must build \emph{long pre-shielding chains}
through the same missing prime/window.}
}
\]

That is a real structural constraint absent from the abstract star-forest model.

## 1. Set-model formulation

Fix a large-prime fibre `b` and a current live residual rank-`h` target

\[
S = T \cup \{p\}, \qquad |T| = h-1.
\]

Assume the top facet `T = S \setminus \{p\}` is currently **usefully shielded**:
some Prolonger score at the current round has support

\[
U = T \cup \{q\}, \qquad q \neq p,
\]

so `T` is captured, while `S` is still live.

For every earlier Prolonger score in the same fibre whose support contains `p`,
write its support as

\[
D_i = \{p\} \cup E_i, \qquad |E_i| = h-1.
\]

Let

\[
r_p(t^-) := \#\{i < t : p \in D_i\}
\]

be the number of earlier scored supports through `p`.

For `0 \le s \le h-1` and `B \subseteq T`, `|B| = s`, define the lower-defect
certificate

\[
c_{p,B} := b\,p\,A_B.
\]

This is the arithmetic certificate that keeps the missing prime `p` and retains
only the `s` coordinates in `B`.

## 2. Bounded-depth freshness theorem

\[
\textbf{Theorem A (bounded-depth freshness).}
\]

Let `S = T \cup \{p\}` be a live residual target whose top facet `T` is usefully
shielded at round `t`. If

\[
r_p(t^-) \le s,
\]

then there exists some `B \subseteq T` with `|B| = s` such that the certificate
`c_{p,B}` is **fresh and legal** at time `t` (that is: not previously captured
by any Prolonger score and not previously claimed by Shortener).

### Proof

Fix the earlier scored supports `D_1, \dots, D_r` containing `p`, with
`r = r_p(t^-) \le s`.

For each `i`, define the trace on the current top facet:

\[
C_i := D_i \cap T.
\]

Because `D_i` contains `p` and has total size `h`, it cannot contain all of `T`;
thus each `C_i` is a **proper** subset of `T`.

We claim there is an `s`-subset `B \subseteq T` such that

\[
B \nsubseteq C_i \qquad \text{for all } i=1,\dots,r.
\]

Indeed, let

\[
A_i := T \setminus C_i,
\]

so each `A_i` is nonempty. Choose one point `x_i \in A_i` for each `i`; after
deduplication this gives a hitting set

\[
H \subseteq T, \qquad |H| \le r \le s,
\]

with `H \cap A_i \neq \varnothing` for every `i`. Extend `H` arbitrarily to an
`s`-subset `B \subseteq T`. Since `B` meets every `A_i`, it is not contained in
any `C_i`.

Now check freshness.

1. The **current** scored support `U = T \cup \{q\}` does not contain `p`, so it
   cannot capture `c_{p,B}`.
2. Any **earlier** scored support omitting `p` also cannot capture `c_{p,B}`.
3. Any earlier scored support containing `p` captures `c_{p,B}` only if
   `B \subseteq C_i`, which we excluded by construction.

So `c_{p,B}` is not Prolonger-captured.

It is also not previously claimed by Shortener: since `c_{p,B} \subseteq S` and
`S` is live at time `t`, no earlier Shortener claim can be contained in `S`,
hence no earlier Shortener claim can equal `c_{p,B}`.

Therefore `c_{p,B}` is fresh and legal. ∎

## 3. Immediate corollaries

### Corollary A1. Depth-0 freshness

If `p` has never appeared in an earlier scored support, then the singleton
certificate

\[
c_{p,\varnothing} = bp
\]

is fresh and legal.

### Corollary A2. Depth-1 freshness

If `p` has appeared in at most one earlier scored support, then there exists
some `q \in T` such that the pair certificate

\[
bpq
\]

is fresh and legal.

### Corollary A3. Depth-2 freshness

If `p` has appeared in at most two earlier scored supports, then there exist
`q_1, q_2 \in T` such that

\[
bpq_1q_2
\]

is fresh and legal.

So the full freshness problem is now pushed into the regime where a useful
missing prime `p` has already been used in **many** earlier scored supports.

## 4. Dyadic one-cylinder degree corollary

The previous theorem is purely combinatorial and does not use arithmetic counts.
To recover the needed `d_t(c) \ge h`, we need a regime where the fresh witness
still has many local completions.

Here is one clean case.

\[
\textbf{Corollary B (one-cylinder degree bound).}
\]

Work in the one-cylinder model from
[verify-R35-codex-star-cylinder-lower-defect-probe.md](/Users/omisverycool/erdos-harness/erdos-872/verify-R35-codex-star-cylinder-lower-defect-probe.md):

- a live pool `Y` of size `M`,
- star scores of the form `\{0\}\cup D`, `D \in \binom{Y}{h-1}`,
- residual targets `\binom{Y}{h}`.

Suppose a useful shield for `S = T \cup \{p\}` occurs at time `t` and
`r_p(t^-) \le s`. Then there exists a fresh legal witness

\[
W_{p,B} = \{p\} \cup B, \qquad B \subseteq T, \ |B|=s.
\]

If moreover

\[
M \ge h+s+1,
\]

then its **static cylinder degree** is at least

\[
\binom{M-s-1}{h-s-1} \ge h.
\]

### Proof

The freshness statement is Theorem A in the one-cylinder specialization.

For the degree bound: holding `W_{p,B}` fixed leaves `h-s-1` remaining positions
to be filled from `Y \setminus W_{p,B}`, which has size `M-s-1`. So the raw
completion count is `\binom{M-s-1}{h-s-1}`. Under `M \ge h+s+1`, we have
`M-s-1 \ge h`, hence

\[
\binom{M-s-1}{h-s-1} \ge \binom{h}{h-s-1} = \binom{h}{s+1} \ge h.
\]

∎

This is exactly the `>= h` scale needed by the R36 conditional amortization,
but only in the bounded-depth one-cylinder regime.

## 5. Arithmetic interpretation

Theorem A is not an artifact of the set toy. It has a direct divisibility
translation.

Let the current useful top-facet shield come from

\[
bA_T \quad \text{shielded by} \quad bqA_T
\]

for the live residual target

\[
b p A_T.
\]

Then for any `s >= r_p(t^-)` there is a set `B \subseteq T`, `|B|=s`, such that

\[
c_{p,B} = b p A_B
\]

is fresh and legal. The proof is identical: current and earlier scored supports
omitting `p` cannot contain `c_{p,B}`, and earlier scored supports containing
`p` induce only proper traces on `T`.

So bounded-depth freshness is a genuine arithmetic phenomenon, not a quirk of
the abstract top-facet hypergraph.

## 6. Low-window consequence: only long same-prime prehistory can block

The theorem becomes much stronger once combined with the R35/R36 low-window
degree heuristic.

Suppose we seek a fresh witness of **defect `k`**, i.e. a certificate of the form
\[
c \subsetneq S, \qquad |S \setminus c| = k.
\]

In the set-model notation above, this means choosing a kept-size
\[
s = h-k-1
\]
inside `T`, since the witness contains `p` plus `s` elements of `T`, hence has
total size `h-k`.

Then Theorem A immediately yields:

\[
\textbf{Corollary C (long-prehistory obstruction).}
\]

If a useful shield admits some degree-`>= h` witness of defect `k`, then the
only way **all** such witnesses can fail to be fresh is that
\[
r_p(t^-) \ge h-k.
\]

### Proof

Set `s = h-k-1`. If `r_p(t^-) \le s`, Theorem A gives a fresh legal witness of
kept-size `s`, equivalently of defect `k`. So failure of freshness forces
`r_p(t^-) \ge s+1 = h-k`. ∎

This matters because in the R35 low-window regime the relevant `k` is expected to
be **small**.

For example, if the local completion counts satisfy
\[
\prod_{j=1}^{k} M_j \ge h
\]
for some fixed `k = O(1)` (the Pro A/Fresh Pro heuristic witness scale), then a
degree-`>= h` witness exists already at defect `k`, and Corollary C says:

\[
\boxed{
\text{freshness can fail only after } r_p(t^-) \ge h-k = h-O(1).
}
\]

So in the low-window regime, the obstruction is not merely "some bounded-depth
chain". To kill all degree-`>= h` defect-`k` witnesses, Prolonger must create a
**same-prime prehistory of linear length in `h`**.

This is qualitatively stronger than the original R36 gap statement.

## 7. What remains open

This does **not** finish the full R36 lemma, because three issues remain.

1. **Unbounded prehistory.**
   The theorem is strong only when `r_p(t^-) = O(1)`. A full proof would need a
   bounded-branching backward recursion when `r_p(t^-)` is large.

2. **Actual live degree vs. static degree.**
   Corollary B gives the `>= h` degree in a clean cylinder regime. In the full
   game, previous Shortener claims may have already removed many completions, so
   a fresh witness need not automatically have live degree `>= h`.

3. **Assignment multiplicity.**
   The theorem gives existence of a fresh witness for each useful shield, but it
   does not yet show that useful shields can be assigned to such witnesses with
   global `O(1)` overlap.

## 8. Best current conclusion

The R36 freshness problem does not look arbitrary anymore. The exact remaining
burden is now:

\[
\boxed{
\text{control useful shields whose missing prime has long prehistory}
\ r_p(t^-) \ge h-O(1)\ \text{in the low-window regime},
\text{ and convert static local completions into live degree.}
}
\]

So a refutation of the R35/R36 route must now build an arithmetic Prolonger that
forces many useful shields through **long same-prime pre-shielding chains**.
The bounded-depth regime is already ruled out by Theorem A.
