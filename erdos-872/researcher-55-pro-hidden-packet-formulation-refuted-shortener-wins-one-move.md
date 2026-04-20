---
id: R55-pro-hidden-packet-formulation-refuted
type: refutation
date: 2026-04-19
intent: >
  Analyze the hidden-packet game formulation; determine if Shortener wins
  trivially or if the formulation captures the intended difficulty.
predecessors: [R54-pro-followup-separator-first, R55-claude-local-packet-guard-min]
action:
  kind: standalone
claim: >
  Hidden-packet formulation refuted: under the rules as written, Shortener
  wins in one move (cost(P) = infinity trivially). The formulation fails
  to capture the intended difficulty because it allows Shortener to play
  the packet apex directly, which exposes the packet and defeats it
  simultaneously.
failure_mechanism: >
  Hidden-packet rules allow Shortener to play any legal move, including
  the packet apex a. Playing a exposes the packet (revealing its structure)
  AND simultaneously defeats it (a is the separator). So cost(P) is achieved
  in 1 move, not Omega(h) as intended. The hidden-packet concept requires
  an additional "exposure cost" parameter to model the true difficulty.
---

Using the hidden-packet rules exactly as written, the answer is more basic than A/B:

cost(P)=∞
	


for every nontrivial packet with q
0
	

<h. In particular, Prolonger cannot reach a winning state at all against τ
SF
	

 in the finite game as stated.

The reason is that any Shortener separator is fatal.

Suppose Shortener legally plays

s
Q
	

=
p∈Q
∏
	

p,1≤∣Q∣≤q
0
	

.

Because s
Q
	

 was legal when played, Q was not already contained in any blocker support B=P∖C, and was not already contained in any shield support Q
′
. Afterward, Prolonger can never repair this:

Any future blocker b
C
	

 whose support B=P∖C contains Q would satisfy s
Q
	

∣b
C
	

, so it is illegal.
Any future shield z
Q
′
	

=r
Q
′
	

∏
p∈Q
′
	

p with Q⊆Q
′
 would satisfy s
Q
	

∣z
Q
′
	

, so it is illegal.

So once Shortener plays even one separator s
Q
	

, the win condition for that Q is permanently impossible.

Therefore, in any winning play, Shortener must pass after every Prolonger move. Equivalently, after Prolonger’s very first move, every Q⊆P with 1≤∣Q∣≤q
0
	

 must already be protected by that single move.

But no legal first move can do that.

If Prolonger’s first move is a blocker with support B⊂P, ∣B∣=k=h−ℓ<h, choose p∈P∖B. If singleton separators are allowed, then s
{p}
	

=p is legal. If the intended separator universe excludes singletons, choose

Q={p}∪T,T⊆B,∣T∣=q
0
	

−1,

which is possible for the asymptotic parameters because k≫q
0
	

. Then Q

⊆B, so s
Q
	

∤b
C
	

, while b
C
	

∤s
Q
	

 since k>q
0
	

. Thus s
Q
	

 is legal.

If Prolonger’s first move is a shield z
R
	

=r
R
	

∏
p∈R
	

p with ∣R∣≤q
0
	

<h, choose Q

⊆R, for instance a singleton outside R if singletons count, or a q
0
	

-set not contained in R. Then s
Q
	

∤z
R
	

, and z
R
	

∤s
Q
	

 because of the outside prime r
R
	

. So s
Q
	

 is again legal.

Thus Shortener has a legal fatal separator immediately after Prolonger’s first move. The lexicographic rule is irrelevant; existence already suffices.

For the toy example, after the first blocker

b
C
1
	

	

=2310=2⋅3⋅5⋅7⋅11,

the singleton 13 is legal if singletons are separators. If only pairs are intended, then 2⋅13=26 is already legal. So the stated 91=7⋅13 after two blockers is not the first local obstruction under the finite rules as written.

So A is false for the written hidden-packet game. B is only vacuously true in the sense that ∞ exceeds any proposed lower bound, but it does not establish the intended r
1
	

(n) upper mechanism. The finite game needs an additional rule or initial condition to suppress the immediate one-move separator problem.

On the shield-counting question: the antichain constraint does not force shields to have smaller ∣Q
′
∣. A shield of size q
0
	

,

z
Q
′
	

=r
Q
′
	

p∈Q
′
∏
	

p,

can coexist with blockers and with other shields as long as the outside primes r
Q
′
	

 are distinct. The outside prime prevents divisibility between shields even when their packet supports are nested, and it prevents divisibility between shields and packet-only blockers. Also,

p∈Q
′
∏
	

p≤(2Y)
q
0
	

=2
q
0
	

n
q
0
	

/(2h)
≈n
1/8+o(1)
,

so outside primes up to about n
7/8−o(1)
 are enough.

However, the proposed division by 2
q
0
	

 is not valid if the lower bound is being taken from the q
0
	

-uniform layer. A shield with ∣Q
′
∣=q
0
	

 covers all lower subsets Q⊆Q
′
, but among q
0
	

-sets it covers exactly one set, namely Q=Q
′
. Thus, if there are M uncovered q
0
	

-sets, one needs at least M shields to cover them, not M/2
q
0
	

.

There is also a static-counting issue: a family of n
o(1)
 blockers can already cover all q
0
	

-sets in the final, offline sense. For the disjointness target, one blocker complement C covers

(
q
0
	

h−ℓ
	

)

many q
0
	

-sets, so the elementary lower bound is

∣C∣≥
(
q
0
	

h−ℓ
	

)
(
q
0
	

h
	

)
	

≈(
3
4
	

)
ℓ
=exp(
logh
0.28768h
	

+o(
logh
h
	

)),

not a positive fraction of (
q
0
	

h
	

). A random construction of comparable order, up to logarithmic factors, covers all q
0
	

-sets. So the real obstruction is online: Shortener can play a fatal separator before the sparse covering design has been assembled.

My verdict is therefore:

As stated, the hidden-packet game is unwinnable for Prolonger.
	


If the intended model forbids singleton and one-blocker-complement separators, or assumes an initial ambient state that makes them illegal, that extra condition has to be made explicit. Under such a corrected model, the direct static shield-counting heuristic still needs repair: size-q
0
	

 shields are fully achievable, but they cover only one q
0
	

-set each, and n
o(1)
 blockers can statically cover the whole q
0
	

-layer.
