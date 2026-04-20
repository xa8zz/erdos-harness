---
id: R37-verify-codex-freshness-sharpness
type: verification
date: 2026-04-19
intent: >
  Verify sharpness of the R37 bounded-depth freshness result and probe
  a high-window toy counterexample.
predecessors: [R37-codex-freshness-bounded-depth, R37-codex-freshness-toy-counterexample]
action:
  kind: standalone
claim: >
  Two rigorous negative complements to R37: (1) bounded-depth freshness
  is tight -- the depth bound O(log h) cannot be improved in the abstract
  model; (2) high-window toy counterexample shows the full freshness lemma
  fails without arithmetic structure. Both support the conclusion that the
  divisor-lattice non-privacy is essential for closing the gap.
---

# R37 Codex — sharpness of bounded-depth freshness and a high-window toy counterexample

## Status

This note gives two rigorous negative complements to
[researcher-37-codex-freshness-bounded-depth-partial.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-37-codex-freshness-bounded-depth-partial.md):

1. **The bounded-depth theorem is sharp.**
   For witnesses of fixed kept-size `s`, `s+1` earlier same-prime supports can
   already pre-shield **all** such witnesses.
2. **The unconditional freshness lemma is false** in the exact one-cylinder
   arithmetic toy, even under deterministic multi-defect `sigma^\star`.

This does **not** refute the R36 lemma as stated, because the explicit dynamic
counterexample lies in the excluded high-window regime. But it shows the
high-window exclusion is essential, and that any successful proof must use real
low-window arithmetic rather than a purely combinatorial freshness principle.

## 1. Exact covering threshold for fixed-size witnesses

Fix a live residual target
\[
S = T \cup \{p\}, \qquad |T| = h-1.
\]

For each earlier scored support through `p`, write its trace on `T` as
\[
C_i = D_i \cap T \subsetneq T.
\]

A witness of kept-size `s` is a certificate
\[
c_{p,B} = bpA_B, \qquad B \subseteq T,\ |B|=s.
\]

It is pre-shielded by the earlier support `D_i` exactly when `B \subseteq C_i`.

So the fixed-size freshness question is equivalent to:

> does the family of proper subsets `C_i` cover all `s`-subsets of `T`?

\[
\textbf{Proposition 1 (exact threshold).}
\]

The minimum number of earlier traces needed to cover **all** `s`-subsets of `T`
is exactly `s+1`.

### Proof

Any proper subset `C_i` can be enlarged to a codimension-1 trace `T \setminus \{x_i\}`
without decreasing the collection of covered `s`-subsets. So it is enough to
consider codimension-1 traces.

Let `X = \{x_i\}` be the omitted points. Then an `s`-subset `B` is covered iff
`B \subseteq T \setminus \{x_i\}` for some `i`, i.e. iff `x_i \notin B` for some
`i`. Equivalently, `B` is **not** covered iff it contains every element of `X`.

Hence all `s`-subsets are covered iff no `s`-subset contains `X`, namely iff
\[
|X| > s.
\]

So at least `s+1` codimension-1 traces are necessary, and `s+1` are sufficient
by choosing distinct omitted points `x_1,\dots,x_{s+1}`. ∎

## 2. Sharpness of bounded-depth freshness

Theorem A from the bounded-depth note said:

> if `r_p(t^-) \le s`, then some kept-size `s` witness is fresh.

By Proposition 1 this is best possible.

\[
\textbf{Corollary 2 (sharpness).}
\]

For every `0 \le s \le h-2`, there exists a family of exactly `s+1` earlier
same-prime supports such that **every** kept-size `s` witness containing `p` is
already pre-shielded.

### Construction

Choose distinct `x_1,\dots,x_{s+1} \in T`, and let the earlier traces be
\[
C_i = T \setminus \{x_i\}.
\]

By Proposition 1 these `s+1` traces cover all `s`-subsets of `T`. So every
kept-size `s` witness `bpA_B` is pre-shielded.

Thus no argument can extend Theorem A beyond the `r_p \le s` threshold at a
fixed kept-size `s` by pure combinatorics alone.

## 3. Exact dynamic counterexample in the one-cylinder toy

Now specialize to the exact one-cylinder arithmetic toy:

- star scores are `\{0\}\cup D`, `D \in \binom{Y}{h-1}`;
- residual targets are `\binom{Y}{h}`;
- `sigma^\star` means: claim the legal proper certificate of maximum live degree,
  over all defects, with deterministic tie-break toward smaller certificates and
  then lexicographically.

I ran an exact small-state search over Prolonger play trees.

\[
\textbf{Proposition 3 (high-window toy counterexample).}
\]

In the one-cylinder toy with `(h,M) = (4,5)`, the unconditional freshness claim

> every useful shield has a fresh legal witness of static degree `>= h`

is false, even under deterministic `sigma^\star`.

### Exact play sequence

Use the symbolic pool `Y = \{1,2,3,4,5\}`.

1. Prolonger scores
   \[
   U_1 = \{0,1,2,3\}.
   \]
2. `sigma^\star` claims the singleton
   \[
   \{4\}.
   \]
3. Prolonger scores
   \[
   U_2 = \{0,1,2,5\}.
   \]

After step 3, the residual target
\[
S = \{1,2,3,5\}
\]
is still live, because the only Shortener claim was `{4}`.

Its top facet
\[
T = \{1,2,5\}
\]
is usefully shielded by `U_2 = \{0\}\cup T`.

Take the missing prime to be `p=3`.

### Why no fresh degree-`>= h` witness exists

For `(h,M)=(4,5)`, the static degree of a kept-size `s` witness is
\[
\binom{M-s-1}{h-s-1}.
\]

So:

- `s=0`: degree `\binom{4}{3}=4`;
- `s=1`: degree `\binom{3}{2}=3`;
- `s=2`: degree `\binom{2}{1}=2`.

Hence the **only** witnesses with degree `>= h=4` are singleton witnesses,
namely just
\[
\{3\}.
\]

But `{3}` was already captured by the first Prolonger score `U_1`.

Therefore, at the moment of the useful shield `U_2`, there is **no** fresh legal
witness of static degree `>= h`.

This is a genuine dynamic failure of the unconditional freshness statement.

## 4. Interpretation

The counterexample above does **not** refute the R36 freshness lemma as stated,
because this one-cylinder model is exactly the sort of high-window regime that
R35 throws into the entropy tail.

Still, it matters for two reasons.

1. It shows the tail exclusion is essential.
   A proof of freshness cannot be purely combinatorial and global.
2. It shows the bounded-depth positive theorem is essentially the best possible
   fixed-size result.
   Once `s+1` same-prime pre-shields are available, all kept-size `s` witnesses
   may already be gone.

So any remaining successful proof must use one of the following genuinely
arithmetic inputs:

- low-window scale restrictions;
- a live-degree argument beyond static completion counts;
- or a recursive variable-defect charging scheme that climbs to larger witnesses
  when small ones are pre-shielded.

## 5. Best current state

Taken together with the bounded-depth positive theorem, the picture is now:

\[
\boxed{
\text{Bounded-depth freshness: true.}
}
\]
\[
\boxed{
\text{Unconditional freshness: false already in the high-window toy.}
}
\]

So the remaining open target is a **low-window / non-tail freshness theorem**,
not a universal one.
