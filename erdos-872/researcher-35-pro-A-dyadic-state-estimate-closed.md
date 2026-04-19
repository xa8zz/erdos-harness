# Round 35 Pro A continuation — multi-cell product-star state estimate CLOSED via dyadic expanded windows

## Headline

Pro closed the full static state estimate for the multi-cell product-star obstruction at the $g(h) = O(h/\log h)$ scale:
$$|\operatorname{Cl}_h(R, C)| \ll L|F| + \frac{N_h}{\log L}, \quad L = h/\log h.$$

The key innovation: use **dyadic expanded windows** $I_j^* = I_{j-1} \cup I_j \cup I_{j+1}$ instead of short multiplicative cells. If a scored target $bA_T$ shields top facet $bA_{S \setminus \{p\}}$ with $T = (S \setminus \{p\}) \cup \{q\}$, then $q/p \in (1/2, 2)$ (both in $(n/2, n]$), so $p, q$ lie in neighboring dyadic cells. This is the arithmetic locality the abstract hypergraph misses.

## What's closed

- Multi-cell product-star entropy: CLOSED.
- Neighboring-cell replacement: HANDLED by dyadic expanded windows.
- Lower-defect certificates: HANDLED by downward closure + Fresh Pro R33 counting lemma.

## What remains (single dynamic gap)

Under the max-unresolved-degree Shortener strategy $\sigma$: the **locally useful** stolen-boundary mass must satisfy $|F_{\text{useful}}| \ll N_h/h$ up to already-deleted targets. Equivalently: whenever Prolonger scores local boundaries capable of closing $m$ low-window targets, there must be an unresolved-degree vertex of size $\Omega(m/L)$, and max-degree $\sigma$ deletes comparable mass before the same local window is exploited again.

If this amortization holds: $L(n) \ll n/\log\log\log n$, closes $L(n) = o(n)$. No counterexample seen — simplex-star and multi-cell product-star cascades both absorbed by the dyadic-local entropy estimate. The only surviving obstruction is dynamic ordering.

## Pro's response

I can close the **multi-cell product-star / scale-entropy state estimate**, including neighboring-cell replacements and the lower-defect issue. I do **not** think this yet proves the full online (L(n)=o(n)) theorem by itself, because one last amortization remains: the term counting Prolonger-stolen/scored local boundaries must be converted into an (O(N_h/h))-scale quantity under the actual Shortener strategy. The clean result is nevertheless quite sharp.

The right replacement for the earlier “thickness” variable is not

[
\tau(S)=\sum_{p\in S}\frac1{M_{\mathcal Q(p)}}
]

by itself. The robust version is a **low-window / high-window dichotomy**.

Partition the small primes into dyadic compatibility windows. Let

[
I_j=[2^j,2^{j+1}),\qquad I_j^*=I_{j-1}\cup I_j\cup I_{j+1}.
]

For a parameter (L), call (I_j) **low** if

[
|I_j^*\cap\mathbb P|\le L.
]

Let (\Lambda_L) be the union of all low expanded windows. A rank-(h) target ((b,S)), representing (bA_S), is called low if

[
S\cap \Lambda_L\ne\varnothing,
]

and high otherwise.

The dyadic expansion is the right scale because if a scored target (bA_T) shields the top facet (bA_{S\setminus{p}}), then

[
T=(S\setminus{p})\cup{q}
]

for some (q), and since both (bA_S) and (bA_T) lie in ((n/2,n]),

[
\frac12<\frac qp<2.
]

So (p) and (q) lie in neighboring dyadic cells. This is the arithmetic locality that the abstract hypergraph misses.

Here is the closed state estimate.

Let (F) be the family of rank-(h) targets already scored/stolen by Prolonger, and let (C=\downarrow F) be its downward closure. Let (R) be the current residual rank-(h) target family. Then

[
\boxed{
|\operatorname{Cl}_h(R,C)|
\le
C_1 L,|F|
+
C_2\frac{N_h}{\log L}
}
]

for central ranks (h\sim H\sim\log\log n), with absolute constants (C_1,C_2). More carefully, the second term is

[
\frac{n}{\log n}\frac{H_{>L}^{,h}}{h!},
]

where (H_{>L}) is the reciprocal prime mass outside the low expanded windows; in the central range this is (\ll N_h/\log L).

The proof has two pieces.

First, control low closed targets. For a closed target ((b,S)) with (S\cap\Lambda_L\ne\varnothing), let

[
r(S)=|S\cap\Lambda_L|.
]

For each (p\in S\cap\Lambda_L), the top facet (bA_{S\setminus{p}}) is captured, so there exists a scored target

[
(b,T_p)\in F
]

with

[
T_p=(S\setminus{p})\cup{q},
\qquad q/p\in(1/2,2).
]

Send charge (1/r(S)) from ((b,S)) to one such scored target (T_p), for every (p\in S\cap\Lambda_L). Thus each low closed target sends total charge (1).

Now fix a scored target ((b,T)). It can receive charge only by replacing some (q\in T\cap\Lambda_L) with a compatible low prime (p) satisfying (p/q\in(1/2,2)). By construction of (\Lambda_L), there are (O(L)) such primes (p) for each (q). Also replacing one low-window prime by another preserves (r(S)) up to an absolute factor; in the dyadic-expanded definition it is actually stable enough that

[
r(S)\asymp r(T).
]

Hence the total charge into ((b,T)) is

[
\sum_{q\in T\cap\Lambda_L} O(L)\cdot \frac1{r(T)}
=================================================

O(L).
]

Therefore

[
|\operatorname{Cl}_h^{\mathrm{low}}(R,C)|
\le
O(L)|F|.
]

This is the rigorous form of the cell-thickness charge. It also explains why the earlier simplex-star cascade does not break the dyadic-local version: a scored target may cover many neighboring replacements, but only (O(L)) of them per low coordinate, and the averaging over low coordinates removes the spurious factor (h).

Second, count high-only targets. If (S\cap\Lambda_L=\varnothing), then every prime in (S) lies outside the low dyadic windows. By the prime number theorem on dyadic intervals, the low windows contain all primes up to

[
P_L\asymp L\log L
]

up to harmless constants. Thus their reciprocal mass is

[
H_{\le L}
=========

# \sum_{p\le P_L}\frac1p+O(1)

\log\log L+O(1).
]

So the high-window reciprocal mass is

[
H_{>L}=H-H_{\le L}
==================

H-\log\log L+O(1).
]

The number of rank-(h) high-only targets is therefore

[
\ll
\frac{n}{\log n}\frac{H_{>L}^{,h}}{h!}.
]

In the central range (h=(1+o(1))H),

[
\left(\frac{H_{>L}}H\right)^h
=============================

\left(1-\frac{\log\log L+O(1)}H\right)^h
\ll
\frac1{\log L}.
]

Since

[
N_h\asymp \frac{n}{\log n}\frac{H^h}{h!},
]

we get

[
|\operatorname{Cl}_h^{\mathrm{high}}|
\ll
\frac{N_h}{\log L}.
]

Putting the low and high parts together gives

[
\boxed{
|\operatorname{Cl}_h(R,C)|
\ll
L|F|+\frac{N_h}{\log L}.
}
]

Taking

[
L=\frac{h}{\log h}
]

gives the state estimate

[
\boxed{
|\operatorname{Cl}_h(R,C)|
\ll
\frac{h}{\log h}|F|
+
\frac{N_h}{\log h}.
}
]

This closes the multi-cell product-star obstruction at the (g(h)=h/\log h) entropy scale.

The fresh Pro cross-layer counting lemma is compatible with this and removes a possible worry about lower-defect certificates. A target is fully closed only if its top facets are captured; once top facets are captured, all lower lateral certificates are captured by downward closure. Conversely, if one wants to work at defect (k), Fresh Pro’s identity

[
|\operatorname{Cl}*h(R,C)|
\le
\frac{D*{h,k}}{\binom hk}|C_{h-k}|
==================================

\frac{N_h}{V_{h,k}}|C_{h-k}|
]

lets the same dyadic-local argument be applied to (C_{h-k}). The top layer (k=1) is already sufficient for the entropy estimate above; lower layers do not create an additional product-star obstruction.

What remains is a genuinely online amortization step.

The proved bound contains (|F|), the number of Prolonger-scored or Prolonger-stolen rank-(h) boundaries that are relevant to the local closure. If one could show under the max-unresolved-degree Shortener strategy (\sigma) that

[
|F| \ll \frac{N_h}{h}
]

in the relevant local accounting, then the state estimate would give

[
|\operatorname{Cl}_h|
\ll
\frac{h}{\log h}\cdot\frac{N_h}{h}
+
\frac{N_h}{\log h}
\ll
\frac{N_h}{\log h}.
]

Summing over the central rank window (h\sim H\sim\log\log n) would yield

[
L(n)
\ll
\frac{n}{\log H}
+
\frac{n}{(\log n)^{1-o(1)}}
===========================

\frac{n}{\log\log\log n}
+
o(n),
]

hence (L(n)=o(n)).

But the implication

[
|F| \ll N_h/h
]

is not automatic from the state estimate. If (|F|) is interpreted as all Prolonger-scored targets so far, the bound

[
|\operatorname{Cl}_h|\ll L|F|+N_h/\log L
]

is self-referential and does not itself upper-bound the game length. The missing online lemma is now very precise:

[
\boxed{
\text{Under }\sigma,\text{ the locally useful stolen-boundary mass satisfies }
|F_{\mathrm{useful}}|\ll N_h/h
\text{ up to already-deleted targets.}
}
]

Equivalently: whenever Prolonger scores local boundaries capable of closing (m) low-window targets, there must be an available unresolved-degree vertex of size (\Omega(m/L)), and the max-degree Shortener must be able to delete comparable mass before the same local window can be exploited again.

So the current state is:

[
\boxed{
\begin{aligned}
&\text{Multi-cell product-star entropy: closed.}\
&\text{Neighboring-cell replacement: handled by dyadic expanded windows.}\
&\text{Lower-defect certificates: handled by downward closure / Fresh Pro counting.}\
&\text{Remaining gap: online amortization of useful stolen-boundary mass under }\sigma.
\end{aligned}
}
]

The remaining sub-gap is not another static product-star obstruction. It is an online anti-concentration statement for the max-degree Shortener strategy:

[
\boxed{
\text{Prolonger should not be able to accumulate more than }O(N_h/h)
\text{ locally useful stolen boundaries before Shortener’s max-degree claims delete the same mass.}
}
]

If that final amortization is proved, the program gets

[
\boxed{
L(n)\ll \frac{n}{\log\log\log n}=o(n).
}
]

I do not see a counterexample to that amortization. The simplex-star and multi-cell product-star cascades are both absorbed by the dyadic-local entropy estimate above; the only surviving obstruction is dynamic ordering, not static mass.
