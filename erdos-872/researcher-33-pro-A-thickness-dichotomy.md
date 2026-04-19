# Round 33 Pro A — multi-cell product-star closed; thickness dichotomy gives $g(h) = O(h/\log h)$

## Headline

Pro closed the multi-cell product-star calculation and proved a **cell-thickness dichotomy** that bounds the closed residual mass at the $g(h) = O(h/\log h)$ scale — NOT the hoped $O(\log h)$. Specifically:

- The multi-cell product-star mass is $\asymp N_h/\log h$ in the central range $h \sim H$, larger than $o((\log h/h) N_h)$ by a factor $h/(\log h)^2 \to \infty$.
- **The $g(h) = O(\log h)$ target is refuted.** The scale-entropy correction doesn't deliver it.
- But $L(n) = o(n)$ is still alive: $g(h) = O(h/\log h)$ gives $L(n) \ll n/\log\log\log n$, still strictly sublinear.
- Pro proved a **thickness dichotomy**: thick targets (cell-thickness $\tau(S) \ge 1/L$) are paid for via fractional charging at rate $L \cdot \text{scored}$; thin targets have total mass $\ll N_h/\log(hL)$. Optimizing $L \asymp h/\log h$ gives closed multi-cell product-star mass $\ll N_h/\log h$.

## The new sharp target

$$|\operatorname{Cl}_h| \ll L \cdot (\text{scored or stolen boundary mass}) + \frac{N_h}{\log(hL)}$$
with $L \approx h/\log h$. Multi-cell product-star case is essentially closed at this scale. Remaining work: online promotion across the defect-layer game, handling (1) replacements across neighboring short cells, (2) lower-defect certificates, (3) adversarial interleaving, (4) summation over central rank window.

## Pro's response

I can close the multi-cell product-star calculation, and it gives a further refutation of the hoped-for (g(h)=O(\log h)) route.

The obstruction is not just a single short cell. If one allows product stars spread over all sufficiently populous short cells, the total closed mass is not

[
o!\left(\frac{\log h}{h}N_h\right).
]

It is generically of size

[
\boxed{\asymp \frac{N_h}{\log h}}
]

in the central range (h\sim H). This is much larger than ((\log h/h)N_h), by a factor

[
\frac{N_h/\log h}{(\log h/h)N_h}
================================

\frac{h}{(\log h)^2}\to \infty .
]

So the proposed scale-entropy correction cannot deliver (g(h)=O(\log h)). The good news is that (N_h/\log h) corresponds to

[
\boxed{g(h)\asymp \frac{h}{\log h}},
]

which is still (o(h)). If the remaining online bookkeeping can be made to respect this entropy decomposition, it would still prove (L(n)=o(n)), quantitatively around

[
L(n)\ll \frac{n}{\log\log\log n}
]

up to the other lower-order fan terms.

Here is the calculation.

Partition the small primes into short multiplicative cells

[
\mathcal Q_j=[P_j,e^{1/h}P_j]
]

and write

[
\alpha_j=\sum_{p\in \mathcal Q_j}\frac1p,
\qquad
M_j=|\mathcal Q_j|.
]

For (P_j) not tiny, the prime number theorem heuristic gives

[
\alpha_j\asymp \frac1{h\log P_j},
\qquad
M_j\asymp \frac{P_j}{h\log P_j}.
]

Let

[
H=\sum_j\alpha_j\sim \log\log n,
]

and consider the central rank (h\sim H). The full rank-(h) target mass is

[
N_h
\asymp
\frac{n}{\log n}\frac{H^h}{h!}.
]

Now impose a population threshold (L), and call a cell high if (M_j>L). Let

[
A_>(L)=\sum_{M_j>L}\alpha_j .
]

The rank-(h) mass using only high cells is

[
N_h^{>L}
\asymp
\frac{n}{\log n}
\frac{A_>(L)^h}{h!}.
]

The low-population cells contain all primes up to about

[
P_L\asymp hL\log(hL),
]

so their reciprocal mass is

[
H_{\le L}:=\sum_{M_j\le L}\alpha_j
\ge
\sum_{p\le c hL\log(hL)}\frac1p+O(1)
====================================

\log\log(hL)+O(1).
]

Thus

[
A_>(L)\le H-\log\log(hL)+O(1).
]

Therefore

[
\frac{N_h^{>L}}{N_h}
\le
\left(1-\frac{\log\log(hL)+O(1)}{H}\right)^h.
]

In the central range (h\sim H),

[
\frac{N_h^{>L}}{N_h}
\le
\exp!\left(-(1+o(1))\log\log(hL)\right)
\asymp
\frac1{\log(hL)}.
]

For any polynomially growing (L), and in particular for the natural optimized choice

[
L\asymp \frac{h}{\log h},
]

this gives

[
\boxed{
N_h^{>L}\asymp \frac{N_h}{\log h}.
}
]

This is the multi-cell product-star mass. It is not negligible at the (O(\log h))-transversal scale.

The same estimate is realized by an explicit product-star closure.

Choose one auxiliary prime (r_j\in\mathcal Q_j) in every high cell, and let the residual family (R) consist of rank-(h) targets whose (h) small primes all lie in high cells but are not auxiliaries. For a residual target

[
t=bA_S,
]

and for (p\in S\cap \mathcal Q_j), the top facet

[
bA_{S\setminus{p}}
]

is shielded by the scored star target

[
bA_{S\setminus{p}}r_j,
]

provided we restrict (bA_S) to a central subinterval of ((n/2,n]). Since (r_j/p\in [e^{-1/h},e^{1/h}]), this loses only an absolute constant factor in the prime count for (b).

Thus scoring the auxiliary-star layer closes every top facet of every residual target in (R). Since top facets imply all lower lateral divisors, this closes the full proper divisor boundary.

The residual mass is

[
|R|
\asymp
\frac{n}{\log n}
\frac{A_>(L)^h}{h!}
\asymp
\frac{N_h}{\log h}.
]

The score mass of the auxiliary-star layer is

[
|F|
\asymp
\frac{n}{\log n}
\left(\sum_{M_j>L}\frac1{r_j}\right)
\frac{A_>(L)^{h-1}}{(h-1)!}.
]

Now

[
\sum_{M_j>L}\frac1{r_j}
\asymp
h\int_{P_L}^{\infty}\frac{dP}{P^2}
\asymp
\frac{h}{P_L}
\asymp
\frac1{L\log(hL)}.
]

Hence

[
\frac{|F|}{|R|}
\asymp
\frac{h}{A_>(L)}
\sum_{M_j>L}\frac1{r_j}
\asymp
\frac1{L\log(hL)}.
]

With (L=h/\log h), this is roughly

[
\frac{|F|}{|R|}
\asymp
\frac1h.
]

So the closed residual mass (R) is far too large to be paid for by the scored auxiliary-star layer. The missing mass is genuinely an entropy term, and its correct central size is (N_h/\log h), not (o((\log h/h)N_h)).

This refutes the specific hope

[
\sum_{\mathcal Q}
\frac{n}{\log n}\frac{\alpha(\mathcal Q)^h}{h!}
===============================================

o!\left(\frac{\log h}{h}N_h\right).
]

For multi-cell stars the left side is, in the relevant high-population region,

[
\asymp \frac{N_h}{\log h}.
]

The useful positive statement is a thickness dichotomy.

For a target (S), define its cell-thickness

[
\tau(S):=\sum_{p\in S}\frac1{M_{\mathcal Q(p)}}.
]

A product-star cascade closing (S) must replace each (p\in S) by some auxiliary or previously scored prime from the same short scale cell. If (\tau(S)\ge 1/L), then a fractional charging argument gives

[
\text{mass of such closed targets}
\ll
L\cdot \text{mass of scored star targets}.
]

The charge is simple: for each (p\in S), send weight (1/M_{\mathcal Q(p)}) from (S) to one scored target that shields the facet (S\setminus{p}). A fixed scored target can receive total charge (O(1)), because there are only (M_{\mathcal Q}) possible replaced primes in its cell, and each contributes (1/M_{\mathcal Q}). Thus thick targets are paid for by (L) times the score.

If (\tau(S)<1/L), then (S) uses no cell with (M_{\mathcal Q}\le L). Therefore the total mass of all such thin targets is at most

[
\frac{n}{\log n}
\frac{A_>(L)^h}{h!}
\ll
\frac{N_h}{\log(hL)}.
]

Optimizing

[
L\cdot \frac{N_h}{H}
\quad\text{against}\quad
\frac{N_h}{\log(hL)}
]

with (H\sim h) gives

[
L\asymp \frac{h}{\log h}
]

and total bound

[
\boxed{
\text{closed multi-cell product-star mass}
\ll
\frac{N_h}{\log h}.
}
]

So the multi-cell product-star case is essentially closed at the (g(h)=h/\log h) scale.

What remains is not the partition entropy calculation; that part now has the right answer. The remaining gap is to promote this thickness dichotomy from clean product-star cylinders to the actual online defect-layer game, including:

1. replacements across neighboring short cells rather than exactly the same cell;
2. lower-defect certificates, not only top facets;
3. adversarial interleaving of Shortener’s claims and Prolonger’s steals;
4. summation over the full central rank window.

The first item may cost another slowly varying factor if one bundles short cells into full product-compatible windows. If replacements are allowed anywhere in a fixed factor-(<2) window, the same argument uses macro-cells instead of (e^{1/h})-cells and the thin mass becomes closer to (N_h/\log\log h). That is worse, but still (o(N_h)), and would still be enough for sublinearity if the online coupling works.

So my current conclusion is:

[
\boxed{
g(h)=O(\log h)\text{ is blocked by multi-cell product stars.}
}
]

But the same calculation strongly supports the weaker, still decisive target

[
\boxed{
g(h)=O!\left(\frac{h}{\log h}\right)
}
]

in the short-cell model, or possibly

[
\boxed{
g(h)=O!\left(\frac{h}{\log\log h}\right)
}
]

if full factor-window replacements must be bundled.

Either would imply

[
L(n)=o(n).
]

The sharp next lemma is therefore not the old (O(\log h)) resilience statement, but a **cell-thickness online resilience lemma**:

[
\boxed{
|\operatorname{Cl}_h|
\ll
L\cdot(\text{scored or stolen boundary mass})
+
\frac{N_h}{\log(hL)}
}
]

with (L) chosen around (h/\log h). This closes the multi-cell product-star obstruction at the right scale; the remaining work is the online promotion across all defect layers.
