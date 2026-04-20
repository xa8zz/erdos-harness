---
id: R34-codex-resilience-online-promotion
type: research
date: 2026-04-19
intent: >
  Determine whether the R33 static ingredients (thickness dichotomy, multi-cell
  product-star) can be promoted to an online closure of L(n) = o(n).
predecessors: [R33-pro-A-thickness-dichotomy, R33-fresh-pro-defect-layer-counting]
action:
  kind: standalone
claim: >
  R33 ingredients do not yet close the online promotion. The thickness
  dichotomy is a static result; the online amortization step (translating
  state inequalities to game-length bounds) requires an independent
  freshness/witnessing lemma that R33 does not provide.
---

# Round 34 Codex — the R33 ingredients do not yet close the online promotion

## Outcome

I do **not** have a full proof of the cell-thickness online resilience lemma, hence I do **not** have a proof of
\[
L(n)=o(n)
\]
from the R33 program in this pass.

What I can close cleanly is the logical status of the four R33 subitems:

1. **Neighboring-cell replacements:** probably only a slowly varying loss, not the main obstruction.
2. **Lower-defect certificates:** already closed by the fresh R33 counting lemma.
3. **Adversarial interleaving:** still the genuine load-bearing gap.
4. **Central-rank summation:** routine once item 3 is solved.

So the current state is sharper than "four open items". The real situation is:

> **The R33 ingredients reduce the entire problem to one missing online shadow anti-concentration statement.**

The rest of this note makes that precise.

---

## 1. What R33 Pro A already proves

Pro A R33 proves a clean **target-level** dichotomy for the closed residual mass in the arithmetic model.

Let
\[
\tau(S)=\sum_{p\in S}\frac{1}{M_{\mathcal Q(p)}}
\]
be the cell-thickness of a rank-\(h\) target \(S\), where \(\mathcal Q_j=[P_j,e^{1/h}P_j]\) are the short multiplicative cells and \(M_{\mathcal Q(p)}\) is the prime population of the cell containing \(p\).

Then for a population threshold \(L\):

- **thick targets** \((\tau(S)\ge 1/L)\) are paid for by fractional charging at total cost
  \[
  \ll L\cdot(\text{scored star mass}),
  \]
- **thin targets** \((\tau(S)<1/L)\) contribute at most
  \[
  \ll \frac{N_h}{\log(hL)}.
  \]

Optimizing \(L\asymp h/\log h\) gives the product-star bound
\[
|\operatorname{Cl}_h| \ll \frac{N_h}{\log h}.
\]

This is strong enough for sublinearity:
\[
g(h)\asymp \frac{h}{\log h}
\quad\Longrightarrow\quad
L(n)\ll \frac{n}{\log\log\log n}.
\]

So the **rate** is no longer the issue. The issue is whether this target-level dichotomy survives the actual online game.

---

## 2. What fresh R33 already proves

Fresh R33 proves the clean cross-layer combinatorial lemma
\[
|\operatorname{Cl}_h(R,C)|
\le
\frac{D_{h,k}}{\binom{h}{k}}\,|C_{h-k}|
=
\frac{N_h}{V_{h,k}}\,|C_{h-k}|
\qquad (1\le k\le h),
\]
where \(C_{h-k}\) is the downward closure of the captured \((h-1)\)-faces.

This completely settles the old subitem

> "extend from top facets to lower-defect certificates."

There is no longer a separate lower-defect problem. The cross-layer reduction is already done.

In particular:

- **item (2) from the R33 checklist is closed;**
- any remaining proof must fail or succeed already at the level of controlling the sets \(C_{h-k}\).

This is the first key simplification.

---

## 3. Why the two R33 ingredients do not automatically compose

At first sight it is tempting to say:

1. thickness dichotomy bounds closed targets;
2. counting lemma converts closed targets to lower-defect certificates;
3. therefore the proof is done.

That implication is false as stated.

The reason is a quantitative mismatch:

- Pro A R33 controls **targets** by their cell-thickness.
- Fresh R33 controls \(|\operatorname{Cl}_h|\) by the **number of captured certificates** \(|C_{h-k}|\).

To pass from certificates back to targets, one pays the factor
\[
\frac{D_{h,k}}{\binom{h}{k}}
\asymp
\frac{H^k}{k!\binom{h}{k}}
\cdot \frac{h!}{H^h}
\cdot \frac{H^h}{h!}

=
\frac{N_h}{V_{h,k}},
\]
and in the central regime \(h\sim H\) this is large.

Concrete sizes:

- for \(k=1\),
  \[
  D_{h,1}\asymp H\asymp h,
  \]
- but the desired thick-target multiplier is only
  \[
  L\asymp \frac{h}{\log h}.
  \]

So a naive certificate-count bound of the form
\[
|C_{h-1}| \ll \text{scored}
\]
would only imply
\[
|\operatorname{Cl}_h|
\ll
D_{h,1}\cdot \text{scored}
\asymp
h\cdot \text{scored},
not
\[
\frac{h}{\log h}\cdot \text{scored}.
\]

For \(k\ge 2\) the loss is even worse, since \(D_{h,k}\asymp H^k/k!\).

This is exactly why the fresh counting lemma does **not** by itself "compose" with the thickness dichotomy.

### Structural interpretation

The thickness lemma is a **target anti-concentration** statement.

The counting lemma needs a **certificate anti-concentration** statement inside the residual shadow.

Those are different objects, and the R33 notes do not bridge them.

---

## 4. The exact remaining gap

Fresh R33 already writes the combinatorial bottleneck explicitly:

\[
|\operatorname{Cl}_h|
\le
\frac{D_{h,k}}{\binom{h}{k}}
\Big(
|\partial_{h-k}R|-|U_{h-k}|+|C_{h-k}\setminus \partial_{h-k}R|
\Big),
\]
where
\[
U_{h-k}=\partial_{h-k}R\setminus C_{h-k}.
\]

So the obstruction is the amount of captured certificate mass that sits **inside** the residual \((h-k)\)-shadow together with the "wasted capture" outside that shadow.

The true missing statement is therefore an online shadow anti-concentration bound of the shape
\[
|C_{h-k}\cap \partial_{h-k}R|
\le
O\!\left(\frac{h}{\log h}\right)\,|U_{h-k}|

+\,
O\!\big(\binom{h}{k}\big)\cdot(\text{scored/history term}),
\tag{A}
\]
or a weighted cell-thickness refinement of (A) strong enough to recover the \(L\asymp h/\log h\) multiplier after the factor \(D_{h,k}/\binom{h}{k}\) from the counting lemma.

I do **not** see this proved in either R33 note, and I do not have a proof of it.

That is the real residual theorem.

---

## 5. Status of the four R33 online-promotion items

### Item 1. Replacements across neighboring short cells

This no longer looks like the main obstruction.

Pro A R33 already notes that in the clean product-star model the shielding replacement satisfies
\[
r_j/p\in[e^{-1/h},e^{1/h}],
\]
so the arithmetic replacement really is scale-local at the short-cell level in that cylinder model.

If the genuine online geometry forces bundling to fixed factor-\(<2\) windows, Pro A's own note says the thin-term estimate degrades from
\[
\frac{N_h}{\log(hL)}
\quad\text{to something closer to}\quad
\frac{N_h}{\log\log h},
\]
which is worse but still \(o(N_h)\), hence still compatible with \(L(n)=o(n)\) if the online coupling is available.

So item 1 is best viewed as a **slowly varying loss issue**, not the main conceptual gap.

### Item 2. Lower-defect certificates

Closed by the fresh R33 counting lemma.

### Item 3. Adversarial interleaving

Still open, and now clearly the real problem.

Everything reduces to controlling how Prolonger's steals populate the residual lower shadows \(C_{h-k}\cap \partial_{h-k}R\) under alternating play.

### Item 4. Central-rank summation

Routine once one has a per-\(h\) bound of the form
\[
|\operatorname{Cl}_h|
\ll
\frac{N_h}{\log h}
\quad\text{or}\quad
\ll
\frac{N_h}{\log\log h}.
\]
Nothing in the current notes suggests a separate obstruction here.

---

## 6. What the Codex cascade data does and does not prove

Codex R33 shows that the explicit simplex-star cascade does **not** dynamically destroy the max-degree rule \(\sigma\):

- worst observed \(\sigma/\tau_{\text{lower}}=1.133\) on the tested grid;
- on \((6,3)\), full minimax gives \(T^*=5\) but best play against the fixed cascade is only \(4\), so the cascade is not even Prolonger-optimal there.

This is useful, but it is only a **negative result about one explicit obstruction family**.

It does **not** prove the missing online anti-concentration statement (A).

What it *does* justify is the following sharpened heuristic:

> any true dynamic counterexample must create large captured-shadow mass by a more adaptive moving-pivot or cross-cell synchronization mechanism, not by a fixed simplex-star cylinder.

So the empirical story is consistent with the R33 program, but it does not close it.

---

## 7. Literature check: no off-the-shelf online set cover theorem closes this

I checked the standard online set cover / hitting-set literature for a ready-made theorem that might imply the needed online transversal lemma.

Two relevant reference points:

1. **Alon–Awerbuch–Azar–Buchbinder–Naor, "The Online Set Cover Problem" (STOC 2003).**  
   General deterministic online set cover is only \(O(\log m \log n)\)-competitive; even bounded-frequency variants remain logarithmic in the ambient parameters, not \(h/\log h\) or \(O(\log h)\). See the PDF at  
   [tau.ac.il/~nogaa/PDFS/aaabnproc2.pdf](https://www.tau.ac.il/~nogaa/PDFS/aaabnproc2.pdf).

2. **Gupta–Krishnaswamy–Kumar–Panigrahi, "Online and Dynamic Algorithms for Set Cover" (2016).**  
   In the dynamic/recourse setting they obtain \(O(\min\{\log n,f\})\)-competitive solutions with constant amortized recourse, where \(f\) is frequency. That is the wrong model here (our choices are irrevocable), and even the bound \(O(f)\) is too coarse when \(f\sim h\). See  
   [arXiv:1611.05646](https://arxiv.org/abs/1611.05646).

Conclusion: the R33 gap is genuinely special to this divisibility-generated hypergraph. The general online-cover toolbox is too weak and in the wrong model.

---

## 8. Sharp conditional reduction

The best honest synthesis I can defend is:

> **Conditional reduction.**  
> If one proves an online shadow anti-concentration estimate of type (A) at scale \(h/\log h\) (or even \(h/\log\log h\) in the bundled-window version), then Pro A R33's thickness dichotomy plus fresh R33's counting lemma yield the desired cell-thickness online resilience bound, hence
> \[
> L(n)=o(n).
> \]

Conversely, without such an anti-concentration statement on captured lower-defect certificates in the residual shadow, the current R33 ingredients do not close.

So the "one remaining theorem" is now sharper than the original prompt:

\[
\boxed{
\text{Prove online shadow anti-concentration for }C_{h-k}\cap\partial_{h-k}R
\text{ at scale }h/\log h.
}
\]

That is the real load-bearing lemma.

---

## 9. Bottom line

I do not think it is honest to promote the current R33 package to a proof of \(L(n)=o(n)\).

What **is** honest and useful:

- the lower-defect extension is already solved;
- the neighboring-cell issue is probably only a slow-factor loss;
- the central-rank summation is routine;
- the entire problem is now concentrated in one online captured-shadow statement.

So this pass closes one of the four items and demotes the remaining "cell-thickness online resilience lemma" to the following precise bottleneck:

\[
\boxed{
\text{control the captured residual shadow, not just the closed target mass.}
}
\]

That is the theorem the next round has to prove or refute.
