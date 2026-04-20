The WLST is false as stated.

The obstruction is not a local star or packet trap. It is a **parity-cube obstruction created by prior legal Shortener blockers**. Once (\mathcal D) is allowed, legal relative blockers become subcube certificates inside a residual cube, and dense residual sets can contain no large subcube. A parity half-cube is the clean counterexample.

I will state it as a theorem.

**Parity-cube forbidden-transversal obstruction.**

Let

[
K=h+L,\qquad L=\left\lfloor \frac{h}{\log h}\right\rfloor,
]

with (h) large. Let the packet (P) consist of (L) disjoint pairs

[
E_i={a_i,b_i},\qquad 1\le i\le L,
]

together with an auxiliary set

[
Y,\qquad |Y|=h-L.
]

Thus

[
|P|=2L+(h-L)=h+L=K.
]

Define prior Shortener blockers

[
\mathcal D={D_i:E_i={a_i,b_i},\ 1\le i\le L}.
]

Now encode each vector (\varepsilon\in{0,1}^L) by the (L)-set

[
C_\varepsilon
=============

{a_i:\varepsilon_i=0}
\cup
{b_i:\varepsilon_i=1}.
]

The corresponding rank-(h) Prolonger move is

[
B_\varepsilon=P\setminus C_\varepsilon.
]

Let Prolonger’s already-played complements be the even-parity half-cube:

[
\mathcal C
==========

{C_\varepsilon:\varepsilon_1+\cdots+\varepsilon_L\equiv 0\pmod 2}.
]

So

[
s=|\mathcal C|=2^{L-1},
\qquad
r=|\mathcal D|=L.
]

This is a fully game-legal packet state.

Each (B_\varepsilon) has size (h). Distinct (B_\varepsilon)’s are incomparable because they have the same size. Each (D_i={a_i,b_i}) is incomparable with every (B_\varepsilon), because (B_\varepsilon) contains exactly one element of the pair (E_i), not both. The (D_i)’s are pairwise incomparable. Thus no Shortener claim divides a played Prolonger element.

Moreover, the state is reachable in the packet quotient: after one even-parity Prolonger move, all (D_i)’s are legal; Shortener can claim them one by one, while Prolonger continues choosing even-parity (B_\varepsilon)’s. Extra global turns can be padded outside the packet by moves using fresh primes disjoint from (P).

Now consider any legal relative blocker (Q). By definition it must satisfy

[
Q\cap C_\varepsilon\neq\varnothing
\quad
\text{for every even }\varepsilon,
]

and

[
D_i\nsubseteq Q
\quad
\text{for every }i.
]

The second condition means that (Q) contains at most one element from each pair (E_i).

Let

[
S(Q)={i:Q\cap E_i\neq\varnothing}.
]

For each (i\in S(Q)), let (q_i\in{0,1}) denote the endpoint chosen by (Q). A residual legal complement after the prior Shortener blockers must hit every (D_i). Since it has size (L), it must contain exactly one element from every pair (E_i), and no element of (Y). Hence the residual complement space is exactly the cube

[
{C_\delta:\delta\in{0,1}^L}.
]

The residual complements captured by (Q) are those disjoint from (Q):

[
C_\delta\cap Q=\varnothing.
]

Inside the cube, this condition says

[
\delta_i=1-q_i
\quad
\text{for every }i\in S(Q),
]

with the remaining coordinates free. Therefore the captured residual set is a subcube of dimension

[
L-|S(Q)|.
]

But (Q) is required to hit every even-parity (C_\varepsilon). Equivalently, its disjointness subcube must contain no even-parity vertex.

Every positive-dimensional subcube of ({0,1}^L) contains both parities: flipping a free coordinate changes parity. Therefore the disjointness subcube must have dimension (0). Hence

[
|S(Q)|=L.
]

So every legal relative blocker (Q) captures at most one residual complement.

Under the uniform residual packet measure,

[
\pi_{\mathrm{res}}\bigl({C:C\cap Q=\varnothing}\bigr)
\le
2^{-L}.
]

With

[
L=\left\lfloor \frac{h}{\log h}\right\rfloor,
]

this gives

[
2^{-L}
======

\exp!\left(-(\log 2+o(1))\frac{h}{\log h}\right)
\le
\exp(-c h^{1/2})
]

for all sufficiently large (h). This is exponentially too small for an entropy-decrement theorem strong enough to yield the (r_1(n)) scale.

If one measures against the unconditioned rank-(L) packet measure instead of the residual legal measure, the maximum raw packet capture is still tiny. A minimal legal (Q) chooses one endpoint from every pair, so

[
\frac{\binom{h}{L}}{\binom{h+L}{L}}
===================================

\prod_{j=0}^{L-1}
\frac{h-j}{h+L-j}
\le
\left(\frac{h}{h+L}\right)^L
\le
\exp!\left(-\frac{L^2}{h+L}\right).
]

For (L=h/\log h), this is

[
\le
\exp!\left(-\Omega!\left(\frac{h}{(\log h)^2}\right)\right),
]

again (\le \exp(-c h^{1/2})) for large (h). But the residual measure is the relevant one for a game-length decrement, and there the sharper bound is (2^{-L}).

This also survives Sathe-Selberg-type nonuniformity. If the paired primes are chosen inside a fixed dyadic window, then the conditional probability of choosing either endpoint of a pair is bounded away from (0) and (1). More generally, if each coordinate has conditional endpoint weights at most (\rho<1), then every single vertex has mass at most (\rho^L). Since every legal (Q) captures at most one residual vertex,

[
\pi_{\mathrm{SS,res}}\bigl({C:C\cap Q=\varnothing}\bigr)
\le
\rho^L.
]

In a dyadic window one may take, for example, (\rho\le 2/3+o(1)), giving

[
\pi_{\mathrm{SS,res}}\le (2/3+o(1))^L
=====================================

\exp(-\Omega(h/\log h)).
]

I also exhaustively checked the finite cube model in Python. For (L=1,\dots,5), enumerating every possible (Q) gave:

[
\begin{array}{c|c|c|c}
L & |\text{residual cube}| & |\text{played even half}| & \max_Q |{C:C\cap Q=\varnothing}|\
\hline
1&2&1&1\
2&4&2&1\
3&8&4&1\
4&16&8&1\
5&32&16&1
\end{array}
]

The exact proof above gives the same conclusion for all (L).

So the requested theorem cannot be true with only the hypotheses stated. The packet transversal-capture lemma fails to extend to forbidden prior blockers in this generality because (\mathcal D) can force the residual state into a cube, while (\mathcal C) can occupy one parity class. Then every legal relative blocker corresponds to a subcube contained in the opposite parity class, and the largest such subcube is a point.

The missing foundational ingredient is therefore not just a better forbidden-transversal lemma. It would have to be a **Fourier/subcube-density alternative**:

[
\boxed{
\text{Either the unplayed residual family contains a large legal subcube, or it has high Fourier/parity structure that must be attacked by a different strategy.}
}
]

The parity construction shows that a single legal blocker cannot be the universal separator. To unblock the paradigm, one would need a strategy or theorem that prevents or exploits high-degree (\mathbb F_2)-structure in the residual cube—something like a density-increment/Fourier-junta decomposition for legal complement cubes, not another scalar blocker-capture bound.
