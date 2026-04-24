---
id: R03-codegree-kernel-stability
type: research
date: 2026-04-23
intent: >
  Channel C contrarian dispatch asking for machinery fundamentally
  different from bounded-type flag-algebra SDP to determine π(K_4^(3)).
predecessors: []
action:
  kind: orthogonal
  target: R02-independent-flag-lift
claim: >
  Proposes a structurally different proof paradigm: strong stability /
  inverse theorem for near-extremal K_4^(3)-free 3-graphs via the
  codegree kernel d(x,y) = |{z : xyz in E(H)}|/n. Stability target:
  every K_4^(3)-free 3-graph with |E(H)| >= (5/9 - delta)(n choose 3)
  admits a partition V = V_0 cup V_1 cup V_2 with |V_i| = (1/3 pm eps)n
  differing from the cyclic construction by o(n^3) triples. Key object:
  B(x,y) = 2 - 3 d(x,y) is conjecturally an approximate equivalence-
  relation kernel on 3 classes for near-extremal graphs, satisfying
  B^2 approx B/3; spectral clustering recovers the three parts, and
  the final density optimization 6xyz + 3x^2 y + 3y^2 z + 3z^2 x <= 5/9
  on the simplex closes the upper bound. Formalization as a
  hypergraphon-rigidity theorem: for K_4^(3)-free 3-graphon W,
  int W d mu^3 <= 5/9 with equality only on the cyclic three-part
  construction up to measure-preserving relabeling. Explains the
  flag-algebra plateau as a local-vs-global information gap: bounded
  flags see only bounded-radius local statistics, while the cyclic
  construction is governed by global glue-consistency of pair-
  neighborhood labels into a Z/3-partition. This is orthogonal to
  R01/R02 and does not produce a new rigorous bound at this round.
prompt: erdos-500/prompts/researcher-03-contrarian-beyond-flag-algebra.md
---

The exact value is not currently determined from the established facts. The standard conjectural answer is

π(K
4
(3)
	

)=5/9
	

,

but the missing part is a proof of the upper bound π(K
4
(3)
	

)≤5/9. The evidence you list strongly points to 5/9, and if bounded flag-SDP certificates plateau near 0.5611, then the proof likely has to be nonlocal: it must extract the hidden cyclic 3-partition structure rather than just count all configurations on 7,8,9,… vertices.

The most plausible fundamentally different machinery is a strong stability / inverse theorem for near-extremal K
4
(3)
	

-free hypergraphs.

A decisive theorem would look like this:

Stability target:

For every ε>0, there is δ>0 such that every K
4
(3)
	

-free 3-graph H with

∣E(H)∣≥(
9
5
	

−δ)(
3
n
	

)

admits a partition

V(H)=V
0
	

⊔V
1
	

⊔V
2
	


with ∣V
i
	

∣=(1/3±ε)n, such that H differs in o(n
3
) triples from the cyclic construction with allowed types

001,012,112,022.

Then a cleanup argument would finish the problem: any edge outside the cyclic template creates many potential K
4
(3)
	

’s unless many template edges are missing, so a graph close to the template cannot beat

T(n)=
a+b+c=n
max
	

(abc+(
2
a
	

)b+(
2
b
	

)c+(
2
c
	

)a).

Since

(
3
n
	

)
T(n)
	

→
9
5
	

,

that would prove π(K
4
(3)
	

)≤5/9, and the known construction gives equality.

The key analytic object should be the codegree kernel. For a dense K
4
(3)
	

-free hypergraph, define

d(x,y)=
n
∣{z:xyz∈E(H)}∣
	

.

In the cyclic construction, asymptotically,

d(x,y)≈{
1/3,
2/3,
	

x,y in the same class,
x,y in different classes.
	


So the hidden structure is not first visible at the triple level; it is visible in the pair-codegree geometry. A strong inverse theorem would prove that any near-extremal K
4
(3)
	

-free graph has codegrees close to this two-valued pattern, and that the low-codegree relation is close to an equivalence relation with three classes.

The K
4
(3)
	

-free condition gives the local constraint

N(x,y)∩N(x,z)∩N(y,z)=∅

whenever xyz∈E(H), where N(x,y) is the codegree neighborhood of the pair xy. Elementary averaging of this condition only gives the weak 2/3-type upper bound. The missing step is an inverse statement: if the density is close to 5/9, then these neighborhoods must almost organize themselves into the cyclic three-class pattern. That is a global rigidity statement, not a bounded local-counting statement.

One concrete route is spectral. Set, heuristically,

B(x,y)=2−3d(x,y).

In the cyclic construction, B(x,y) behaves like the indicator that x and y are in the same part. Thus B is approximately an equivalence-relation kernel with three equal atoms. A proof could try to show that high density plus K
4
(3)
	

-freeness forces B to be nearly nonnegative and nearly idempotent:

B
2
≈
3
1
	

B.

A spectral clustering argument would then recover the three parts. Once the three parts are recovered, the final density optimization is just

6xyz+3x
2
y+3y
2
z+3z
2
x≤
9
5
	

,

with equality at x=y=z=1/3.

Another way to phrase the same idea is as a measurable hypergraphon rigidity theorem. Let W:X
3
→{0,1} be a K
4
(3)
	

-free 3-graphon, meaning

W(a,b,c)W(a,b,d)W(a,c,d)W(b,c,d)=0

almost everywhere. The desired theorem is:

∫
X
3
	

Wdμ
3
≤
9
5
	

,

with equality only for the cyclic three-part construction, up to measure-preserving relabeling. This would bypass bounded flag bases because it is an infinite-dimensional structural theorem, not a finite list of local inequalities.

The reason bounded flag algebra may plateau is that finite flags only see bounded-radius local statistics. The cyclic construction is governed by a global consistency rule: local pair-neighborhood labels must glue into a genuine Z/3-valued partition. Proving that the local labels are globally consistent is more like proving a cocycle is a coboundary, or proving approximate transitivity of a relation. That type of obstruction can require unbounded information, much as bipartiteness is locally invisible on bounded samples if long odd cycles are not sampled.

So the machinery I would bet on is:

hypergraphon compactness + codegree-kernel inverse theorem + strong stability/cleanup.
	


If the conjecture is false, the opposite route is also clear: one should search not merely over small n edge counts, but over weighted Lagrangians of large K
4
(3)
	

-free 3-graphs. A finite K
4
(3)
	

-free graph G with weights x
v
	

 gives blow-up density

6
abc∈E(G)
∑
	

x
a
	

x
b
	

x
c
	

.

Thus a counterexample to 5/9 would ultimately appear as a finite weighted certificate with value >5/9. But since no such structure is known, the more plausible determination remains the structural upper-bound route above, proving that every near-extremal object is forced into the cyclic 3-partite template.
