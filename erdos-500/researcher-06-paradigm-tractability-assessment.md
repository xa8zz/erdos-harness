---
id: R06-paradigm-tractability-assessment
type: synthesis
date: 2026-04-23
intent: >
  Tractability evaluation of R05's four proposed paradigms for bypassing
  the bounded-type flag-algebra SDP plateau. Ranks paradigms on prior
  work, first-lemma target, and SOS-escape, and identifies the one or
  two most likely to produce a new rigorous upper bound below 0.5611.
predecessors: [R05-paradigms-beyond-flag-algebra]
action:
  kind: extends
  target: R05-paradigms-beyond-flag-algebra
claim: >
  Ranks the four R05 paradigms by near-term tractability for proving
  pi(K_4^(3)) < 0.5611: (4) rational / localized flag Positivstellensatz
  > (2) entropy / information geometry >> (1) continuous hypergraphon
  variational > (3) topological combinatorics. Paradigm (4) is strongest
  because (a) it is close to existing flag-algebra machinery and therefore
  certifiable, (b) a strict improvement below 0.5611 requires only
  separating the current SDP pseudo-extremizer from the true realizable
  hypergraphon region, not proving the exact 5/9 bound, (c) rational
  certificates can compactly encode unbounded-order constraints via
  case-split on denominator magnitude. Paradigm (2) is second: link-
  neighborhood entropy inequalities on triple intersections N(a,b) cap
  N(a,c) cap N(b,c) (which must be empty for any edge abc in a
  K_4^(3)-free 3-graph) could give genuinely non-SOS global constraints.
  Corrects specific R05 claims: (i) compact hypergraphon space requires
  the full Aldous-Hoover framework with pair-level coordinates, not just
  symmetric measurable W on [0,1]^3; (ii) Ingleton inequality is valid
  only for linear-rank representable polymatroids, not for arbitrary
  entropy vectors — the universal non-Shannon inequalities are
  Zhang-Yeung / Matus type; (iii) Kalai algebraic shifting does not
  generally preserve K_4^(3)-freeness, so shifted complexes may create
  forbidden tetrahedra; (iv) rational-looking flag-algebra inequalities
  often collapse to polynomial SOS after multiplying by type density,
  so the escape from bounded-order SOS is conditional on the denominator
  compactly encoding an unbounded-order family. Diagnoses the core
  obstruction to (1): K_4^(3)-freeness is a hard product-zero constraint
  (W(x_1,x_2,x_3) W(x_1,x_2,x_4) W(x_1,x_3,x_4) W(x_2,x_3,x_4) = 0 a.e.),
  not smooth for Euler-Lagrange, and extremizers are essentially 0/1-valued
  and highly non-unique per the Kostochka / Liu-Mubayi multi-family
  phenomenon. Provides first-lemma targets for each paradigm.
prompt: erdos-500/prompts/researcher-06-paradigm-tractability-lit-state.md
---

"Under the no-search constraint, based on my knowledge: the value of

π(K
4
(3)
	

)

is not currently determined as a theorem. The conjectural value remains

π(K
4
(3)
	

)=5/9,
	


but the known rigorous upper bounds are still above 5/9. So the right assessment is not “which paradigm already solves it,” but “which paradigm is most likely to add a genuinely new global constraint beyond finite-order flag-SOS.”

A useful diagnostic: any argument depending only on the distribution of induced subgraphs on at most m vertices is, in principle, just a higher-order flag-algebra inequality. To beat the bounded-order plateau for structural reasons, a method must either use unbounded-order information compactly, or impose some genuinely global realizability condition that finite pseudo-moments fail.

1. Continuous variational calculus on hypergraphons
Prior work

There is a substantial graphon and hypergraphon literature relevant in spirit: dense graph limits by Lovász–Szegedy, hypergraph limits by Elek–Szegedy, Tao, Gowers, Rödl–Schacht, and the flag-algebra formalism of Razborov as a dual algebraic language for subgraph-density inequalities. For ordinary graph Turán problems, graphon symmetrization and variational arguments are very natural: Mantel/Turán-type theorems can be viewed as optimization over graphons, and Zykov symmetrization has a clean graphon analogue.

For hypergraphs, there are also symmetrization ideas, for example in work of Sidorenko, Pikhurko, Brown–Simonovits-type extremal theory, and later stability-based hypergraph Turán arguments. But I do not know of a successful continuous Euler–Lagrange or Steiner-flow-style proof for K
4
(3)
	

, nor of such an argument beating the Razborov/flag-algebra upper bound for the (3,4)-problem.

One technical caveat: the compact hypergraphon space for 3-uniform hypergraphs is subtler than simply symmetric measurable functions W:[0,1]
3
→[0,1]. Finite 3-graphs can be represented by such step functions, so an inequality proved for all such W would still imply the finite result, but compactness and genuine limit arguments often require the full Aldous–Hoover/hypergraphon framework with pair-level coordinates.

Tractability

A plausible route would be:

K
4
(3)
	

-free hypergraphon W⟹density-increasing deformation toward cyclic/Kostochka form.

The first serious lemma would need to look something like this:

Monotone cyclic symmetrization lemma.
Every K
4
(3)
	

-free 3-graphon W of density >0.5611 admits a nontrivial measurable symmetrization or partition refinement that preserves K
4
(3)
	

-freeness and does not decrease edge density, unless W already belongs to a known 5/9-density extremal family.

That lemma would be extremely powerful. It would essentially be a replacement for classical stability, but one capable of handling the Kostochka/Brown/Fon-der-Flaass/Frohmader non-unique extremal landscape.

The main obstacle is that K
4
(3)
	

-freeness is a hard product-zero constraint:

W(x
1
	

,x
2
	

,x
3
	

)W(x
1
	

,x
2
	

,x
4
	

)W(x
1
	

,x
3
	

,x
4
	

)W(x
2
	

,x
3
	

,x
4
	

)=0

for almost every quadruple. That is not a smooth constraint in the useful Euler–Lagrange sense. Extremizers are expected to be essentially 0/1-valued and highly nonunique. Infinitesimal variations tend to create forbidden tetrahedra unless they are extremely carefully coordinated.

So this paradigm genuinely addresses the right object, but the first required structural theorem is close in difficulty to the original conjecture.

Relation to the SOS / pseudo-moment barrier

If carried out directly in the actual hypergraphon space, this would genuinely escape bounded-order SOS, because it would optimize over globally realizable limits rather than finite pseudo-moment relaxations.

But if the variational argument is discretized into finitely many local density constraints, it collapses back into a high-order flag-algebra calculation. The escape only happens if the proof uses an infinite-dimensional monotonicity or compactness principle that cannot be truncated to a fixed flag order.

Assessment: conceptually clean, but unlikely to give a modest new numerical upper bound quickly. More plausible as part of an eventual exact 5/9 proof than as an incremental improvement below 0.5611.

2. Information geometry / entropy polymatroids
Prior work

Entropy methods are extremely important in extremal combinatorics: Shearer’s lemma, entropy proofs of Bregman-type inequalities, Kahn’s work on independent sets and matchings, Galvin–Tetali-type arguments, entropy approaches to graph homomorphism inequalities and Sidorenko-type problems, and entropy methods in hypergraph containers and random discrete structures.

There is also relevant work in database theory and join-size bounds, where entropy vectors and non-Shannon inequalities can improve fractional-cover-type estimates. That world is genuinely adjacent to hypergraph extremal questions because both involve constraints on compatible marginals.

However, I do not know of a successful application of non-Shannon entropy inequalities to the classical K
4
(3)
	

 Turán problem, nor to standard adjacent problems such as K
4
(3)−
	

, F
5
	

, or tight-cycle Turán densities.

Important caveat: Ingleton itself is not a valid inequality for all entropy vectors. It is valid for linear-rank representable polymatroids, but not for arbitrary random variables. For arbitrary hypergraphs, one would need universally valid Shannon and non-Shannon information inequalities, such as Zhang–Yeung/Matúš-type inequalities, not linear-rank-only inequalities.

Tractability

The natural entropy objects would be random link neighborhoods. For a random pair (a,b), define its link

N(a,b)={x:abx∈E(H)}.

For a hyperedge abc, K
4
(3)
	

-freeness says

N(a,b)∩N(a,c)∩N(b,c)=∅.

So one possible first lemma would be:

Link-neighborhood entropy inequality.
In every K
4
(3)
	

-free 3-graph H of edge density p, the joint entropy or mutual-information profile of the random variables

N(A,B),N(A,C),N(B,C)

satisfies an inequality forcing p≤0.5611−ε.

That would be genuinely new if it used global constraints on the simultaneous realizability of many link neighborhoods, rather than just densities of small configurations.

Where it plausibly stalls: entropy is often too coarse. The cyclic construction, Kostochka-type constructions, and pseudo-flag solutions may have very similar low-order entropy profiles. Also, translating a density objective into entropy inequalities usually loses sign-sensitive algebraic information. A finite collection of entropy variables sampled from m vertices may still be only another finite relaxation unless the proof uses an entropy-rate or all-scale argument.

The most promising entropy direction would not be “throw non-Shannon inequalities at the problem.” It would be a tailored inequality about triple intersections of pair-links conditioned on hyperedges, because that is exactly where K
4
(3)
	

-freeness lives.

Relation to the SOS / pseudo-moment barrier

Entropy can genuinely escape polynomial SOS, because entropy inequalities are logarithmic/submodular rather than polynomial positive-semidefinite constraints. They can, in principle, rule out pseudo-moment systems that do not arise from any global joint distribution.

But a finite entropy relaxation is still incomplete. It may exclude some finite SDP artifacts, but it does not automatically enforce full hypergraphon realizability. The method escapes bounded-order SOS only if it uses an inequality involving an unbounded family of sampled neighborhoods, entropy rates, or a structural entropy decomposition.

Assessment: potentially genuinely orthogonal to flag-SOS, but currently underdeveloped for this specific problem. More plausible than topology, less immediately certifiable than rational/localized flag algebra.

3. Topological combinatorics
Prior work

There is a rich body of topological and algebraic work on simplicial complexes: Stanley–Reisner rings, Kruskal–Katona theory, algebraic shifting due to Kalai, Frankl–Füredi–Kalai theorems on colored complexes, the g-theorem/upper-bound-theorem circle, and topological methods in Kneser-type problems, Helly-type theorems, and independence complexes.

The observation that K
4
(3)
	

 is the boundary of a tetrahedron is correct: a 3-uniform hypergraph can be viewed as the set of 2-faces of a 2-dimensional simplicial complex, and K
4
(3)
	

 is an S
2
 on four vertices.

But I do not know of topological methods giving strong upper bounds for ex
3
	

(n,K
4
(3)
	

), nor for nearby density problems such as K
4
(3)−
	

 or F
5
	

. Algebraic shifting is powerful for intersecting families and face-number inequalities, but it does not seem well aligned with this particular forbidden-configuration problem.

Tractability

The hoped-for theorem would need to be something like:

Dense tetrahedron-boundary-free complexes admit a cyclic Z
3
	

-structure.
Every sufficiently dense 2-complex with no tetrahedral boundary has, after deleting o(n
3
) faces, a measurable Z
3
	

-cyclic orientation/coloring structure that bounds the number of triangles by 5/9+o(1).

That would be extremely strong. The problem is that ordinary topology sees the wrong feature. K
4
(3)
	

-freeness forbids the smallest triangulated 2-sphere, but it does not forbid other spheres, nontrivial homology, or complicated 2-dimensional topology. A K
4
(3)
	

-free complex can have wildly varying Betti numbers. Conversely, Betti-number constraints do not naturally control the density of 2-faces at the n
3
 scale needed here.

Algebraic shifting also appears dangerous: shifting preserves certain algebraic and face-number data, but it does not generally preserve avoidance of an arbitrary forbidden hypergraph in the way one would need. A shifted complex with the same f-vector might create a tetrahedron boundary even if the original complex avoided one.

The proposed Z
3
	

 cyclic-orientation invariant is suggestive, but it is not an invariant of the uncolored simplicial complex in any obvious canonical way. Extracting it from an arbitrary dense K
4
(3)
	

-free hypergraph would again amount to a very strong stability theorem, precisely the kind known to fail in classical form.

Relation to the SOS / pseudo-moment barrier

Topological invariants are genuinely global and not equivalent to bounded-order SOS. But here they seem global in the wrong sense. Betti numbers, Stanley–Reisner algebra, and cohomology are not naturally continuous or tight for dense 3-uniform Turán density. If the topological argument is reduced to finitely many forbidden shifted patterns, it becomes another finite local-density argument and hence effectively flag-algebraic.

Assessment: least promising of the four for a new numerical upper bound. The “K
4
(3)
	

 is an S
2
” observation is elegant but probably misleading for density.

4. Rational Positivstellensatz / localized flag algebra
Prior work

This is closest to existing successful machinery. Razborov’s flag algebras already use conditional densities through types and flags. Semantically, many flag expressions are ratios: one conditions on a labelled type appearing with positive density. After averaging, standard certificates become polynomial/linear density inequalities plus SOS constraints.

There is also relevant algebraic background from quantum graphs and graph-density inequalities: Lovász–Szegedy’s quantum graph framework, Razborov’s flag algebra calculus, and Hatami–Norine-type phenomena showing that positivity in graph-density algebras is subtler than finite SOS. In real algebraic geometry, Artin’s solution to Hilbert’s 17th problem and Positivstellensatz certificates show that rational sums of squares can certify positivity beyond ordinary polynomial SOS.

For hypergraph Turán problems specifically, I do not know of a widely used “rational Positivstellensatz flag algebra” framework that has beaten the best bounded-order SDP for K
4
(3)
	

. But this paradigm is much closer to something one could actually implement and certify.

Tractability

A concrete path is plausible:

Take the near-extremal finite-order SDP pseudo-solution at the plateau.
Identify a diagnostic configuration or conditional distribution where it behaves unlike any actual K
4
(3)
	

-free hypergraphon.
Add a localized/rational inequality valid for actual hypergraphs but violated by the pseudo-solution.
Clear denominators with explicit case splits to obtain a rigorous certificate.

The first useful lemma would be something like:

Localized realizability separator.
For every actual K
4
(3)
	

-free limit of density >0.5611−ε, at least one of finitely many positive-density types σ has conditional flag distribution satisfying an inequality Φ
σ
	

≤0, while the bounded-order pseudo-solution violates all such localized inequalities.

Equivalently, one wants a certificate of the schematic form

ρ−c≤
i
∑
	

D
i
	

SOS
i
	

	

+known K
4
(3)
	

-free relations,

where D
i
	

 are positive densities of conditioning events. For rigorous verification, one would split into cases D
i
	

≥η and D
i
	

<η, clear denominators in the first case, and handle the second case by ordinary flag inequalities.

The likely stall point is discovery. Finding the right denominator is nonconvex and highly problem-specific. If the denominator is bounded away from zero, the rational certificate may merely be a compact encoding of a very high-order ordinary flag certificate. If the denominator vanishes on the 5/9 extremal family, the certificate becomes singular, and the small-denominator case may require exactly the missing structural analysis.

Still, for a strict improvement below 0.5611, one does not need to prove the exact 5/9. One only needs to separate the current SDP pseudo-extremizer from the true realizable region. Rational/localized constraints are a plausible way to do that.

Relation to the SOS / pseudo-moment barrier

This paradigm partly escapes and partly does not.

It does not escape merely by writing ratios. Standard flag algebras already contain conditional densities, and after multiplying by the type density, many rational-looking inequalities become ordinary polynomial flag inequalities.

It can escape a fixed bounded-order SDP if the rational expression compactly represents an unbounded-order family of constraints, or if it uses singular conditioning that finite moment matrices cannot emulate. In that case, it may act like a finite certificate for an infinite hierarchy.

Assessment: most promising for a new rigorous numerical upper bound. It is close enough to existing flag computations to be certifiable, but flexible enough to target the pseudo-moment pathology.

Comparative ranking for producing a new upper bound below ≈0.5611

My ranking would be:

Most promising: 4. Rational/localized flag algebra
	

Second: 2. Entropy / information geometry
	


Then, with a larger gap:

3rd: 1. Continuous hypergraphon variational calculus
4th: 3. Topological combinatorics.

The reason is not that rational Positivstellensatz is philosophically the deepest. It is that it gives the most realistic path to a checkable certificate. The current obstruction is a finite-order pseudo-solution. The natural response is to add a constraint that actual hypergraphs satisfy and that this pseudo-solution fails. Localized rational flag inequalities are well suited to that kind of targeted separation.

Entropy is the only other paradigm here that seems genuinely capable of adding non-SOS global realizability constraints without requiring a full stability theorem. But it needs a very specific inequality about link-neighborhood intersections; generic non-Shannon inequalities are unlikely to be enough.

The continuous variational approach attacks the true object, but its first required lemma is essentially a new global symmetrization/stability theorem for the whole nonunique 5/9 extremal family. That is probably harder than obtaining a small numerical improvement.

The topological approach seems misaligned: forbidding the tetrahedral sphere is a local 4-vertex density condition, not a strong topological restriction on the whole 2-complex.

So my bottom line is:

π(K
4
(3)
	

)=5/9 remains the right conjecture, but not a theorem from these methods yet.
	


For near-term progress below the bounded-order flag plateau, I would focus on localized/rational flag certificates, possibly informed by entropy-style diagnostics of link neighborhoods."
