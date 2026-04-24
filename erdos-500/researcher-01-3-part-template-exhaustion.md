---
id: R01-3-part-template-exhaustion
type: research
date: 2026-04-23
intent: >
  First dispatch attempting determination of π(K_4^(3)), presenting all
  known upper/lower bounds as validated facts with no anchoring toward
  an expected answer.
predecessors: []
action:
  kind: standalone
claim: >
  Exhaustive enumeration over all 1024 triple-templates on three labeled
  classes shows the cyclic template {001, 012, 022, 112} is (up to
  relabeling) the unique K_4^(3)-free blow-up with maximum edge density,
  attaining 5/9 at the balanced partition. Density polynomial
  f(x,y,z) = 6xyz + 3x^2 y + 3y^2 z + 3z^2 x on the simplex x+y+z=1, max
  5/9 at x=y=z=1/3. Exact ex_3(n, K_4^(3)) at small n match the cyclic
  3-partite construction: {3, 7, 14, 23, 36, 54} for n in {4..9}. A
  universal upper bound pi(K_4^(3)) <= 2/3 + o(1) is re-derived via
  codegree-squared sum and Jensen. 5-vertex codegree-moment LP stalls at
  ~0.644, well above 5/9. Author concedes pi(K_4^(3)) = 5/9 is not
  rigorously established at this round; the round's supporting evidence
  narrows the question rather than closing it.
---

My determination is

π(K
4
(3)
	

)=
9
5
	

,

but I cannot honestly present that as a proved theorem here. The rigorous status, from the facts you gave and the calculations I could do, is still

9
5
	

≤π(K
4
(3)
	

)≤0.5617,

so the exact value remains unproved. What I can add is that every independent check I ran points to 5/9, not to anything larger.

The cleanest universal upper bound I could re-derive is 2/3. Let d(xy) be the codegree of the pair xy. Then

xy
∑
	

(
2
d(xy)
	

)=
Q∈(
4
V(H)
	

)
∑
	

(
2
e(Q)
	

)≤
Q∈(
4
V(H)
	

)
∑
	

e(Q)=(n−3)e(H),

because every 4-set spans at most 3 edges. By convexity,

(
2
n
	

)(
2
(
2
n
	

)
3e(H)
	

	

)≤
xy
∑
	

(
2
d(xy)
	

),

so

e(H)≤
9
2n−3
	

(
2
n
	

)=(
3
2
	

+o(1))(
3
n
	

).

That is far from 5/9, but it shows the basic obstruction.

I also checked exact small cases by solving the integer program

max
e∈(
3
[n]
	

)
∑
	

x
e
	

subject to
e⊂Q
∑
	

x
e
	

≤3 for every Q∈(
4
[n]
	

),x
e
	

∈{0,1}.

For n=4,5,6,7,8,9 this gives

3, 7, 14, 23, 36, 54,

which exactly match the cyclic 3-part construction

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

So the first exact values support the 5/9 picture perfectly.

The strongest new thing I could verify exactly is this: among all “coarse” constructions on 3 classes, the cyclic one is optimal. On 3 labeled parts there are 10 possible triple-types by class-multiplicity. I exhaustively checked all 2
10
=1024 such templates, imposed the blow-up K
4
(3)
	

-free condition on every 4-multiset of class labels, and only 45 templates survive. Among those, the unique optimum up to relabeling is the cyclic template

001, 012, 022, 112,

whose density polynomial is

f(x,y,z)=6xyz+3x
2
y+3y
2
z+3z
2
x,x+y+z=1,

and its maximum is 5/9, attained at x=y=z=1/3. So no 3-part type construction beats 5/9.

I also tried a higher-moment refinement using 5-vertex local data and codegree moments. It still stalls far above 5/9, around 0.644, which is another way of seeing why elementary local counting does not finish the problem and why one needs genuinely stronger machinery to get down near the SDP plateau you quoted.

So the mathematically honest bottom line is:

The exact value is not yet proved, but all the evidence here points to π(K
4
(3)
	

)=
9
5
	

.
	


If I had to write the “answer” on one line, I would write 5/9, with the explicit caveat that this is still conjectural rather than established.
