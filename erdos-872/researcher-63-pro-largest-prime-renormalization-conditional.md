---
id: R63-pro-largest-prime-renormalization-conditional
type: research
date: 2026-04-29
intent: >
  First fresh-thread dispatch under solutions-only operating mode.
  Asks a primary researcher to attempt a full unconditional proof or
  disproof of L(n) for the primitive-set divisibility game given the
  full math state (271 round docs compiled into Known progress + What
  does not work). Response proposes a new route — largest-prime
  renormalization — and isolates a single missing lemma (the
  renormalized shadow lemma) whose proof would close the problem with
  a candidate sharp rate L(n) = n / (log n)^{1 - o(1)}.
predecessors:
  - R13-fresh-dichotomy-unresolved-slowgrowth
  - R13-fresh-divisor-shadow-hierarchy
  - R18-pro-matching-sublinear-reduction
  - R57-pro-bonferroni4-L-le-0.19n
  - R60-pro-R57-repair-theorems-2-1-4-1
  - R61-external-jonaslsa-dyadic-fan-half-constant
  - R62-external-bloom-bipartite-potential-method
action:
  kind: extends
  target: R13-fresh-dichotomy-unresolved-slowgrowth
claim: >
  Conditional on the renormalized shadow lemma — that during the
  largest-prime recursive Shortener strategy, every Prolonger move
  exports lower-fiber shields charged with multiplicity
  (log n)^{o(1)} per move — the recurrence
  L(n, n) <= (log n)^{o(1)} (Psi(n, y) + pi(n) +
  sum_{y < p <= n} L(n/p, p)) holds with y = n^{1/u},
  u ~ loglog log n / loglog n; and the recurrence solves to
  L(n) <= n / (log n)^{1 - o(1)} via Dickman-rho exceptional term
  plus Mertens summation on the prime-fiber sum. Combined with the
  established hierarchy lower bound L(n) >= n / (log n)^{1 - o(1)}
  (from R13-fresh-dichotomy-unresolved-slowgrowth), this would give
  the candidate sharp rate L(n) = n / (log n)^{1 - o(1)}, ruling
  out L(n) = Theta(n). The conditional theorem (bounded-shadow
  hypothesis B(n) = (log n)^{o(1)} per Prolonger move ⇒ candidate
  rate) is proved cleanly in the response. The renormalized shadow
  lemma itself is NOT proved: the obstacle is the smooth-divisor
  explosion when Prolonger plays x = p * s with p large prime and s
  highly y-smooth — tau(s) is too large to count crudely, so the
  proof must show only a compressed subfamily of divisors of s is
  strategically relevant, with the rest absorbed into the
  Psi(n, y) = n / (log n)^{1 - o(1)} smooth exceptional term.
strategy_dependence: independent
verifiers_at_time: []
confidence_at_time: medium
prompt: erdos-872/prompts/researcher-R63-solution-attempt.md
note: >
  Response was produced after the researcher first returned a 9-min
  cursory pass; user re-pushed for a serious attempt and got a
  17m48s reasoning trace. Final verdict explicitly conditional, with
  the missing lemma named and its failure mode (smooth-divisor
  explosion) identified.
---

Pro response after I gave them a pep talk after they got scared and only spent 9m thinking on your initiial prompt:

"I’ll make a serious attempt now: test dynamic upgrades of the static bound, explore global-compression and shield-based strategies, and isolate any exact lemma where the asymptotic turns.

Thought for 17m 48s

You’re right. My previous answer was too static. Here is a real attempt.

I will not pretend the final closure is certified, but I will push a concrete path hard enough that it either produces the asymptotic or isolates the exact new lemma needed. The path I think is most promising is a largest-prime renormalization. It points strongly to

L(n)=
(logn)
1−o(1)
n
	

	


rather than L(n)=Θ(n). The lower half of that is already essentially in your “fixed h” hierarchy. The missing part is the matching upper bound.

Below is the attempted upper-bound mechanism.

1. Target theorem

The natural target is

L(n)≤
(logn)
1−o(1)
n
	

.

Together with the known lower bound

L(n)≥
(logn)
1−o(1)
n
	

,

this would give the sharp rate

L(n)=
(logn)
1−o(1)
n
	

.
	


So the question becomes: can Shortener force termination before a linear number of moves, losing only a (logn)
o(1)
 factor over the static prime lower scale n/logn?

The route below tries to prove exactly that.

2. The renormalization idea

Fix a parameter

u=u(n)→∞,u∼
logloglogn
loglogn
	

,

and put

y=n
1/u
.

An integer m≤n has at most u prime factors >y, counted with multiplicity, because

y
u+1
>n.

Call primes >y large and primes ≤y small.

Every nonsmooth integer m≤n has a largest large prime factor p>y. Write

m=pq,q≤n/p,P
+
(q)≤p.

This suggests a recursive decomposition by largest prime factor. If Shortener can play the prime p, then every remaining multiple of p dies. If Prolonger has already played some multiple pq
0
	

, then p is shielded, and the remaining battle inside the p-fiber resembles the same game on the quotient interval {2,…,n/p}, with prime ceiling p.

So the dream recurrence is

L(n,n)≲Ψ(n,y)+
y<p≤n
∑
	

L(n/p,p)+π(n),
(1)

where L(N,z) denotes the analogous game restricted to integers ≤N all of whose prime factors are ≤z, and Ψ(n,y) is the number of y-smooth integers ≤n.

If (1) were valid with only a (logn)
o(1)
 loss, it would solve the problem.

3. Why the recurrence gives the right asymptotic

Let us ignore, for the moment, the dynamic shielding issue and solve the recurrence.

The smooth exceptional term is

Ψ(n,y)=nρ(u),

where ρ is the Dickman function. For

u∼
logloglogn
loglogn
	

,

we have

ρ(u)=exp(−(1+o(1))ulogu)=
(logn)
1−o(1)
1
	

.

Thus

Ψ(n,y)≤
(logn)
1−o(1)
n
	

.

Now estimate the prime-fiber contribution. Suppose inductively that

L(M,z)≤ME(M)/logM,

where E(M)=(logM)
o(1)
. Then

y<p≤n
∑
	

L(n/p,p)≤n
y<p≤n
∑
	

plog(n/p)
E(n/p)
	

.

Using Mertens’ estimate for primes,

y<p≤n
∑
	

plog(n/p)
1
	

≪
logn
loglogn+logu
	

.

The extra loglogn factor is harmless because it is (logn)
o(1)
. Therefore

y<p≤n
∑
	

L(n/p,p)≤
logn
n
	

(logn)
o(1)
=
(logn)
1−o(1)
n
	

.

The prime term π(n) is also O(n/logn). So the recurrence would yield

L(n)≤
(logn)
1−o(1)
n
	

.

Together with the lower hierarchy, this gives the sharp answer.

4. The obstruction: exported shields

The recurrence above is not automatically valid. The hard issue is this:

A Prolonger move in a larger-prime fiber can shield divisors belonging to smaller-prime fibers.

Example: Prolonger plays

x=pqr,p>q>y.

This simultaneously makes p, q, pq, pr, qr, and many small-divisor multiples illegal. If Shortener later wants to use q or qr as a separator in the q-fiber, it may already be shielded by the earlier p-fiber move.

This is exactly the overlapping-carrier / mixed-pair batching obstruction listed in the prompt.

So the largest-prime recurrence needs a shield-accounting lemma.

5. The needed lemma

Here is the lemma that would close the problem.

Renormalized shadow lemma

Let y=n
1/u
, with

u∼
logloglogn
loglogn
	

.

During the largest-prime recursive Shortener strategy, every Prolonger move exports shield-obstructions into lower prime fibers. The total cost of all exported shields can be charged with multiplicity at most

exp(O(u))=(logn)
o(1)

per actual Prolonger move.

Equivalently, the largest-prime recurrence holds in the softened form

L(n,n)≤(logn)
o(1)
(Ψ(n,y)+π(n)+
y<p≤n
∑
	

L(n/p,p)).
(2)

If (2) holds, then

L(n)≤
(logn)
1−o(1)
n
	

.

The lower hierarchy gives the reverse inequality, so

L(n)=
(logn)
1−o(1)
n
	

.
	

6. Why this lemma is plausible

A number x≤n has at most u large prime factors. Therefore the number of possible large-prime subcarriers exported by one Prolonger move is at most

2
u
=(logn)
o(1)
.

That part is harmless.

The dangerous part is the small-prime divisor cloud. A single move

x=p⋅s,

where s is y-smooth, may shield many divisors of s. This is the smooth-divisor explosion. It is exactly why fixed-rank fan arguments keep producing extra (loglogn)
h
 factors.

The reason the renormalized lemma might still be true is that those small-divisor shields are not independent. They live inside the y-smooth quotient poset, whose total mass is

Ψ(n,y)=
(logn)
1−o(1)
n
	

.

So the proposed accounting is:

large-prime shadows cost 2
u
, while small-prime shadows are absorbed into the smooth exceptional term Ψ(n,y).

That is the new compression step.

7. A bounded-shadow version that can be proved

Here is a clean partial theorem along this route.

Suppose Shortener uses the largest-prime recursive strategy, and suppose that every Prolonger move exports at most B(n) relevant lower-fiber shields, where

B(n)=(logn)
o(1)
.

Then

L(n)≤
(logn)
1−o(1)
n
	

.
Proof

Under this bounded-shadow hypothesis, the softened recurrence becomes

L(n,n)≤B(n)(Ψ(n,y)+π(n)+
y<p≤n
∑
	

L(n/p,p)).

Choose

u∼
logloglogn
loglogn
	

,y=n
1/u
.

Then

Ψ(n,y)≤
(logn)
1−o(1)
n
	


and

π(n)≪
logn
n
	

.

Assume inductively that for all M<n,

L(M,⋅)≤
(logM)
1−o(1)
M
	

.

Then

y<p≤n
∑
	

L(n/p,p)≤n(logn)
o(1)
y<p≤n
∑
	

plog(n/p)
1
	

.

By Mertens summation,

y<p≤n
∑
	

plog(n/p)
1
	

≪
logn
loglogn+logu
	

.

Hence

y<p≤n
∑
	

L(n/p,p)≤
logn
n
	

(logn)
o(1)
.

Multiplying by B(n)=(logn)
o(1)
 still gives

L(n)≤
(logn)
1−o(1)
n
	

.

That proves the conditional theorem.

8. Why this avoids the listed failed routes

This is not a static carrier-capacity argument. It allows the harmonic mass of carriers to diverge.

It is not a fixed-rank fan argument. The rank depth is

u∼
logloglogn
loglogn
	

→∞.

It is not a bounded certificate family. The smooth exceptional family has size

Ψ(n,y)=
(logn)
1−o(1)
n
	

,

which is large enough to absorb the Bernoulli-star obstruction.

It is not a Ford-band cover. Ford bands would try to cover by divisor intervals. This instead peels by largest prime and treats each protected prime fiber as a smaller copy of the game.

It directly attacks the “overlapping carriers plus mixed-pair batching” obstruction: a mixed move with several large primes is not treated as a disaster; it is charged to its large-prime shadow set, whose size is at most 2
u
=(logn)
o(1)
.

9. Where the proof still breaks

The remaining unproved step is exactly the renormalized shadow lemma.

The obstacle is the following configuration.

Prolonger plays

x=p⋅s,

where p>y is large and s is highly y-smooth. This one move can shield many lower objects

qd,q>y,d∣s.

The large-prime choices q cost only 2
u
, but the smooth divisors d∣s can be numerous. A crude divisor-count bound is far too large:

τ(s)≤exp(O(
loglogn
logn
	

)),

which is much bigger than (logn)
o(1)
.

So a successful proof cannot count all divisors of s. It must prove that only a small compressed subfamily of those divisors is strategically relevant, with the rest absorbed by the smooth exceptional term.

That is the exact place I cannot honestly close the argument yet.

10. My best current conclusion

I would now bet against L(n)=Θ(n). The lower hierarchy and this renormalization strongly suggest

L(n)=
(logn)
1−o(1)
n
	

.
	


The lower bound is already present in the known progress. The upper bound would follow from the renormalized shadow lemma:

exported mixed-fiber shields cost only (logn)
o(1)
 per largest-prime recursion level.
	


That lemma is the new battleground. It is not refuted by the listed failures, because it does not use fixed-rank fans, static carrier capacity, bounded certificates, or local-window residual estimates. It tries to compress all overlapping-carrier damage through largest-prime shadows plus the y-smooth exceptional set.

So I have not solved the problem unconditionally in this pass. But the sharp candidate and the precise missing lemma are now clear:

L(n)=
(logn)
1−o(1)
n
	

	


provided the renormalized shadow compression can be proved."
