---
id: R02-independent-flag-lift
type: research
date: 2026-04-23
intent: >
  Independent attempt to reproduce a flag-algebra upper-bound certificate
  for pi(K_4^(3)) from scratch, parallel to R01. Tests whether the
  published 0.5617-class bound is reproducible with modest flag-basis
  choices, and maps where weaker certificate hierarchies stall.
predecessors: []
action:
  kind: orthogonal
  target: R01-3-part-template-exhaustion
claim: >
  Independent flag-square upper-bound reproduction yields
  pi(K_4^(3)) <= 0.56869, weaker than the published 0.5617 and much
  weaker than the 0.5611 plateau. Enumerates non-isomorphic K_4^(3)-free
  3-graphs: |F_4| = 4, |F_5| = 23, |F_6| = 964. Extends each 6-vertex
  representative to 7 vertices, producing 13,051,375 labeled 7-vertex
  extensions, with high-edge counts e=20 -> 70,827; e=21 -> 13,135;
  e=22 -> 1,349; e=23 -> 39. Flag certificate chain: 6-vertex flags
  with types up to s=3 gives U ~ 0.57227; adding rank-limited s=4, m=5
  flags yields U ~ 0.56881; lifting to 7 vertices with exact
  one-labeled-vertex s=1, m=4 flags yields U ~ 0.5686926. Specific
  obstruction identified: the one-label 7-vertex flag is too weak;
  closing the gap to 0.5617 requires the full s=3, m=5 flag family
  (hundreds of flags per 3-label type).
prompt: erdos-500/prompts/researcher-01-3-part-template-exhaustion.md
---

I continued the search self-contained, without web lookup. I did not rediscover a bound improving the stated 0.5617. The best numerical certificate I was able to reproduce in this run is weaker:

π(K
4
(3)
	

)≲0.56869.
	


That is a real flag-style upper certificate from the sandbox computation, but it does not beat the known SDP bounds you listed.

The most useful thing I found is where the lightweight attempt stalls.

I enumerated admissible K
4
(3)
	

-free 3-graphs through 6 vertices and then generated all 7-vertex extensions from the 6-vertex representatives. The non-isomorphic counts I got were:

∣F
4
	

∣=4,∣F
5
	

∣=23,∣F
6
	

∣=964.

Generating all labeled 7-vertex extensions from the 6-vertex representatives gave

13,051,375

raw 7-vertex extensions. The high-edge counts among those were:

e=20:70,827,e=21:13,135,e=22:1,349,e=23:39.

The certificate route was:

d(G)+
σ
∑
	

c
σ,Q
σ
	

	

(G)≤U

over every admissible 6- or 7-vertex graph G, where the c
σ,Q
σ
	

	

 come from positive semidefinite flag-square terms

E
θ
	

[p
θ
⊤
	

Q
σ
	

p
θ
	

]≥0.

Using 6-vertex flags with types up to s=3, I got

U≈0.57227.

Adding rank-limited s=4,m=5 flags pushed this to about

U≈0.56881.

Then I lifted that 6-vertex certificate to 7 vertices and added the exact one-labeled-vertex s=1,m=4 7-vertex flag. That only improved the maximum slightly:

U≈0.5686926.
	


This is still far above the known 0.5617-level certificates. The obstruction is clear: the one-label 7-vertex flag is too weak. The missing component is the full k=7 SDP strength, especially the s=3,m=5 flags. Those have much larger flag spaces, roughly hundreds of flags for the two 3-label types, and my rank-limited/low-dimensional substitutes did not reproduce the stronger certificate.

So my honest status is:

9
5
	

≤π(K
4
(3)
	

)<0.5617 remains the best bound from the prompt,
	


and from this continued attempt I can only independently reproduce a weaker numerical flag upper bound around

0.56869.
	


I did not recover the private stronger bound in this run.
