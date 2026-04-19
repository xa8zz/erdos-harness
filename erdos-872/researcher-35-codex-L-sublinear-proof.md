# Round 35 Codex — candidate closure of the online promotion via direct top-facet charging

## Status

This note is a **candidate closure**, not yet promoted to `Established` in [current_state.md](/Users/omisverycool/.codex/worktrees/34d7af/erdos-harness/erdos-872/current_state.md). Under the harness protocol it still needs the usual external verifier pass. The point of this round is that the supposed remaining “online shadow anti-concentration” gap appears to disappear once the R33 thickness dichotomy is rewritten directly on the **top-facet hypergraph**, using local factor-2 replacement windows rather than exact short-cell matching.

The key simplification is:

- the final online game is already formulated on **top facets**;
- a residual target is closed exactly when each of its top facets has been **stolen** by some scored target;
- Shortener claims never contribute to the closed residual family, because any target containing a claimed top facet is already hit and is not residual;
- therefore the online promotion does **not** need a new lower-defect counting theorem at the load-bearing step.

The lower-defect R33 lemma remains useful background, but it is not needed for the actual online promotion.

## Claim

Let the central rank be `h ~ H`, and let `Cl_h` denote the residual rank-`h` targets that are still unhit by Shortener but whose entire top-facet boundary has already been stolen by Prolonger. Then, after bundling replacements into local factor-2 prime windows,

$$
\mu(Cl_h)
\ll
L \cdot B_h^{\mathrm{stolen}}
\;+\;
\frac{N_h}{\log L},
$$

where:

- `\mu` is the usual central weighted target mass (`\asymp n/(\log n A_S)` on the fibre over `S`);
- `B_h^{\mathrm{stolen}}` is the stolen top-facet boundary mass at rank `h`;
- `L >= 2` is a free parameter.

Choosing

$$
L \asymp \frac{h}{\log h}
$$

gives

$$
\mu(Cl_h)
\ll
\frac{h}{\log h}\,B_h^{\mathrm{stolen}}
\;+\;
\frac{N_h}{\log h}.
$$

This is exactly the state inequality that R33 isolated as the remaining online-promotion step. By the already-established R22 defect-budget reduction and the standard central-window summation, it yields

$$
L(n) \ll \frac{n}{\log\log\log n},
$$

hence `L(n)=o(n)`.

The rest of the note is the proof.

## 1. Local Replacement Windows

For each prime `p <= y`, define the local replacement window

$$
W(p):=\{q \le y : \tfrac12 < q/p < 2\},
\qquad
M(p):=|W(p)|.
$$

By the prime number theorem,

$$
M(p)\asymp \frac{p}{\log p}
$$

uniformly away from the tiny-prime fringe, which is already negligible in the central-rank analysis.

Now fix a residual rank-`h` target `bA_S` and one of its top facets `bA_{S\setminus\{p\}}`. If that top facet is stolen, it was stolen by some scored target

$$
bA_{S\setminus\{p\}}q
$$

with the same large prime fibre `b`.

Because both numbers

$$
bA_{S\setminus\{p\}}p
\quad\text{and}\quad
bA_{S\setminus\{p\}}q
$$

lie in the same central interval (for example `(n/2,n]`, or any fixed-width central interval already used in the R22/R33 setup), their ratio is bounded:

$$
\frac{q}{p}
=
\frac{bA_{S\setminus\{p\}}q}{bA_{S\setminus\{p\}}p}
\in (1/2,2).
$$

Hence

$$
q \in W(p)
\quad\text{and symmetrically}\quad
p \in W(q).
$$

This resolves the old “same short cell vs neighboring short cell” bookkeeping issue: exact `e^{1/h}`-cell equality is unnecessary. A fixed factor-2 local window is enough.

## 2. Thickness

Define the window-thickness of a rank-`h` small-prime set `S` by

$$
\tau(S):=\sum_{p \in S}\frac1{M(p)}.
$$

Call `S` **thick** if `\tau(S) \ge 1/L`, and **thin** otherwise.

The R33 product-star proof used the same thick/thin split, but with exact short cells. The point here is that the proof only needs a bounded local replacement class, not a global star structure.

## 3. Thick Closed Targets Charge to Stolen Top Facets

Let `\mathcal C_h^{\mathrm{thick}}` be the thick closed residual targets. For each `S` in this family and each `p in S`, the top facet `T=S\setminus\{p\}` is stolen. Choose one scored witness

$$
U(T)=T \cup \{q(T)\}
$$

that stole it. By the previous section, `q(T) \in W(p)`.

Write the usual central fibre weight as

$$
w(S)\asymp \frac{n}{\log n}\frac1{A_S}.
$$

For each thick closed `S`, send charge

$$
\frac{w(S)}{M(p)}
$$

from `S` through the facet `T=S\setminus\{p\}` to its witness `U(T)`.

The total outgoing charge from `S` is

$$
w(S)\tau(S)\ge \frac{w(S)}{L}.
$$

So, after multiplying the final inequality by `L`, it is enough to show that every stolen top facet receives `O(w(U))`, or equivalently that every scored target receives `O(h\,w(U)) = O(\text{its boundary mass})`.

### Load on one stolen top facet

Fix one stolen top facet `T` with witness `U=T\cup\{q\}`. Any `S` charging through `T` has the form `S=T\cup\{p\}` with `p \in W(q)`. For such `p`,

$$
M(p)\asymp M(q)
$$

and

$$
w(T\cup\{p\})\asymp w(T\cup\{q\}),
$$

since `p` and `q` differ by at most a factor `2`.

Therefore the total charge into the facet `T` is

$$
\sum_{p \in W(q)} \frac{w(T\cup\{p\})}{M(p)}
\ll
\frac1{M(q)}
\sum_{p \in W(q)} w(T\cup\{q\})
\ll
w(T\cup\{q\}),
$$

because there are only `M(q)` admissible choices of `p`.

Thus each stolen top facet receives `O(w(U))`, and each scored target `U` has only `h` stolen top facets. Summing over all scored targets gives

$$
\mu(\mathcal C_h^{\mathrm{thick}})
\ll
L \cdot B_h^{\mathrm{stolen}}.
$$

This is the exact online promotion that was missing in R33. Crucially, it is **state-local** and makes no reference to move order. Once a top facet is stolen, it is just a witnessable resource. Adversarial interleaving does not create any extra load.

## 4. Thin Targets Are Entropically Sparse

If `S` is thin, then every `p \in S` satisfies `M(p) > L`; otherwise one term `1/M(p)` would already be at least `1/L`.

By `M(p)\asymp p/\log p`, this implies

$$
p \gg L\log L.
$$

So the small primes usable by a thin target lie above `cL\log L`, and the excluded reciprocal mass is

$$
\sum_{p \le cL\log L}\frac1p
=
\log\log L + O(1).
$$

Hence, if

$$
A_{>}(L):=\sum_{M(p)>L}\frac1p,
$$

then

$$
A_{>}(L)\le H-\log\log L+O(1).
$$

Therefore the total mass of thin rank-`h` targets is

$$
\frac{n}{\log n}\frac{A_{>}(L)^h}{h!}
\le
N_h
\left(1-\frac{\log\log L+O(1)}{H}\right)^h.
$$

In the central window `h \sim H`, this is

$$
\ll
N_h \exp(-(1+o(1))\log\log L)
\ll
\frac{N_h}{\log L}.
$$

So

$$
\mu(\mathcal C_h^{\mathrm{thin}})
\ll
\frac{N_h}{\log L}.
$$

## 5. The Cell-Thickness Online Resilience Bound

Combining the thick and thin pieces,

$$
\mu(Cl_h)
\ll
L \cdot B_h^{\mathrm{stolen}}
\;+\;
\frac{N_h}{\log L}.
$$

Take

$$
L\asymp \frac{h}{\log h}.
$$

Then `\log L \asymp \log h`, so

$$
\mu(Cl_h)
\ll
\frac{h}{\log h}\,B_h^{\mathrm{stolen}}
\;+\;
\frac{N_h}{\log h}.
$$

This is exactly the `g(h)=O(h/\log h)` cell-thickness online resilience inequality that R33 identified as sufficient.

## 6. Consequence for the Rank-`h` Game and Central Summation

At this point the remaining deduction is the already-established one from R22/R33: the state inequality

$$
\mu(Cl_h)
\ll
\frac{h}{\log h}\,B_h^{\mathrm{stolen}}
\;+\;
\frac{N_h}{\log h}
$$

is precisely the missing online resilience input needed to bound the rank-`h` contribution by

$$
\ll \frac{N_h}{\log h}.
$$

Once that is fed into the standard central-rank decomposition, the established Poisson-window analysis gives

$$
N_h \asymp \frac{n}{\log n}\frac{H^h}{h!},
\qquad
H\sim\log\log n,
$$

with total mass concentrated on

$$
h \in [H-\sqrt H,\;H+\sqrt H].
$$

On this window, `\log h \asymp \log H \asymp \log\log\log n`. Hence

$$
\sum_{|h-H|\le \sqrt H}\frac{N_h}{\log h}
\ll
\frac1{\log\log\log n}
\sum_{|h-H|\le \sqrt H}N_h
\ll
\frac{n}{\log\log\log n}.
$$

The off-window ranks are already negligible by the standard Poisson tail estimate. Therefore

$$
L(n)\ll \frac{n}{\log\log\log n}.
$$

In particular,

$$
L(n)=o(n).
$$

## 7. What Changed Relative to R33

The proof obstruction in R33 was phrased as four separate items:

1. neighboring-cell replacements;
2. lower-defect certificates;
3. adversarial interleaving;
4. central-window summation.

This note collapses them as follows.

### Item 1: neighboring cells

Handled by replacing rigid `e^{1/h}` short cells with local factor-2 windows `W(p)`. The argument only needs bounded multiplicative comparability, not exact cell equality.

### Item 2: lower-defect certificates

Not load-bearing for the final online promotion. The actual residual-closure event in the top-facet hypergraph is already determined by stolen top facets. Lower-defect bookkeeping is consistent with this, but not needed to prove the online charge.

### Item 3: adversarial interleaving

The thick-target charge is purely state-local. Each closed target charges directly to the scored target(s) that stole its top facets. Move order never enters.

### Item 4: summation

Routine once the rank-`h` bound is in place.

## 8. Small-`h` Sanity Check

The new phase4 helper [transversal_small_h.py](/Users/omisverycool/.codex/worktrees/34d7af/erdos-harness/erdos-872/phase4/transversal_small_h.py) now computes, for any game state, the unhit family, the fully closed subfamily, and the defect-shadow statistics induced by unavailable top facets. On the existing sigma-vs-adversarial traces, the raw closure-to-scored ratio stayed modest even under the most closure-seeking tested Prolonger heuristic:

- `h=3, N=12`: worst observed `closed/scored = 4.353`
- `h=4, N=11`: worst observed `closed/scored = 2.179`
- `h=5, N=10`: worst observed `closed/scored = 1.633`
- `h=6, N=9`: worst observed `closed/scored = 1.067`

These are only sanity checks, not proof inputs, but they are consistent with the direct top-facet charging picture: closure growth is controlled by the stolen top-facet pool rather than by an unbounded simplex-star cascade.

## Conclusion

The remaining online step appears to be simpler than R33 made it look. One does not need a new lower-defect anti-concentration lemma. The top-facet hypergraph already has the right witness structure:

- every closed residual target is witnessed by its stolen top facets;
- each stolen top facet can only support `O(1)` total thick charge inside its factor-2 replacement window;
- thin targets are entropically sparse.

So the cell-thickness online resilience lemma holds at the `g(h)=O(h/\log h)` scale, and the established R22 reduction then gives

$$
L(n)\ll \frac{n}{\log\log\log n}.
$$

The repo should still treat this as a **candidate closure pending verifier pass**, but I no longer see a live mathematical gap in the online-promotion step itself.
