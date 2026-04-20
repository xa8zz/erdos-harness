---
id: R12-pro-response
type: research
date: 2026-04-18
intent: >
  Synthesize the state after R11 and identify the clean structural reduction
  that isolates the remaining gap for the sublinear conjecture.
predecessors: [R11-pro-response, R11-deepthink-response]
prompt: erdos-872/prompts/researcher-12-synthesis-open.md
action:
  kind: standalone
claim: >
  F_alpha = {p <= y} union {d <= n/2 : Omega(d)=2, P^-(d) > y} is an antichain
  for y = n^alpha (1/3 < alpha < 1/2). Every d in {2,...,n/2} has a multiple in
  F_alpha's shadow. The key missing lemma is "small-prime resolution above n^{1/3}":
  Shortener can resolve all primes <= y in o(n) moves if composites have disjoint
  supports (Theorem 5); overlapping carriers are the remaining open case.
siblings: [R12-deepthink-response, R12-claude-response]
---

# Round 12 — GPT Pro response (F_alpha + omitted-vertex shadowing)

**Source:** GPT Pro, fresh thread, `prompts/researcher-12-synthesis-open.md`. Extracted verbatim from session transcript.
**Status:** Major new structural insight. Not a complete proof; reduces the problem to a specific missing lemma (small-prime resolution above $n^{1/3}$).

---

I think the problem is very likely on the sublinear side, and more specifically I now think the natural scale is n/logn.

I do not have a full proof. What I do have is a reduction that, in my view, isolates the real missing piece very sharply.

For α∈(1/3,1/2), set y=n
α
, and define

F
α
	

:={p≤y: p prime}∪{d≤n/2: Ω(d)=2, every prime factor of d is >y}.

This is the clean mixed “prime + large semiprime” family.

First, F
α
	

 is an antichain. Distinct primes are incomparable. Distinct Ω=2 numbers are incomparable. And a prime ≤y cannot divide a semiprime all of whose prime factors are >y.

Now here is the key static fact.

If an antichain A contains F
α
	

, then every further legal element x≤n must satisfy:

no prime factor of x is ≤y, because then one of those chosen primes divides x;

Ω(x)≤2, because if Ω(x)≥3 and every prime factor is >y=n
α
, then

x>y
3
=n
3α
>n,

impossible since α>1/3.

So after F
α
	

 is installed, the only legal survivors are primes and semiprimes whose prime factors are all >y.

That already gives an O(n/logn) static finish, because

#{p≤n prime}∼
logn
n
	

,

and the semiprime part is also O
α
	

(n/logn):

#{pq≤n/2: y<p≤q}≤
y<p≤
n
	

∑
	

π(n/p)≪
y<p≤
n
	

∑
	

plog(n/p)
n
	

≪
α
	

logn
n
	

.

So, if Shortener could force F
α
	

 to be chosen up to O(n/logn) losses, the game would be over in O(n/logn) moves.

This is already a real reduction:

The whole problem is now: can Shortener dynamically realize F
α
	

 for some α>1/3?
	


There is also a useful dynamic fact: the semiprime half of F
α
	

 is not the hard part.

Let

Q
α
	

:={d≤n/2: Ω(d)=2, P
−
(d)>n
α
}.

Then any composite Prolonger move x is comparable to at most one element of Q
α
	

.

Why? If two distinct d
1
	

,d
2
	

∈Q
α
	

 both divide x, then x contains at least three prime factors >n
α
 if they share one prime, or four if they are disjoint. Either way

x>n
3α
>n,

contradiction. And if x∣d
i
	

, then since d
i
	

 has Ω=2, the only composite possibility is x=d
i
	

, again at most one.

So the usual block-product batching does not hit the large-semiprime layer. The only place where real batching survives is the small-prime layer {p≤n
α
}.

That led me to what I think is the unifying structural explanation of the failures you listed.

The common obstruction is what I would call omitted-vertex shadowing.

For semiprimes, the pattern is this: if

u=p
1
	

p
2
	

p
3
	

m

is an upper number, then the three numbers

x
i
	

=
p
i
	

u
	

r
i
	


with suitable small outsider primes r
i
	

 can shadow all semiprime divisors of u: every pair p
a
	

p
b
	

 divides some x
i
	

 with i∈
/
{a,b}. The toy example is

105=3⋅5⋅7,30, 42, 70,

which shadow 15,21,35.

More generally, a fixed-Ω=k witness family is vulnerable to a k+1-move omitted-vertex shadow. That is why pure semiprime saturation, pure fixed-Ω reservoirs, and other low-level divisor sweeps keep failing in the same way: Prolonger does not need to kill the witness d itself; he can replace it by a slightly larger multiple dr built using a cheap outsider prime.

From that viewpoint, the obstructions in your prompt do look like one phenomenon, not several independent ones.

And F
α
	

 explains why the threshold α>1/3 is special: once you close the cheap outsider-prime reservoir up to n
α
, the omitted-vertex shadow stops working on the large-prime semiprime layer, because three large primes already overflow n.

So my current picture is:

The hard part is not the large semiprime layer.
The hard part is composite-hiding of small primes.
Once primes up to n
1/3+ε
 are effectively resolved, the rest of the game is already O(n/logn).

That gives a very concrete conjectural reduction:

If Shortener can force effective resolution of all primes ≤n
1/3+ε
 in O(n/logn) turns, then L(n)=O(n/logn).
	


Here “effective resolution” means either the prime itself is chosen, or every future legal number divisible by it is already killed by the semiprime layer. I have not proved that part.

A couple of sandbox checks support this picture.

For exact minimax on small n, once Prolonger’s first move becomes primorial-like, Shortener’s best reply is often a tiny semiprime or prime power rather than a prime; for n=28,…,32, the exact optimal opening is 18, and the exact best reply is 4. So the mixed prime/semiprime model is already visible very early.

And for the static family F
α
	

, the numbers line up surprisingly well with the large-n simulations. At n=10
6
:

with α=.45, the lower-half target family has only 1153 elements;
after installing it, only 85063 numbers in [2,n] remain admissible, all with Ω≤2.

That total is

10
6
(1153+85063)log(10
6
)
	

≈1.19,

very close to the empirical 1.17 you quoted for the hard block-product adversary.

So my best answer is:

I do not have a complete proof.
I do think the open question should come out on the o(n) side.

The strongest concrete form I can defend is that the real target is

L(n)=Θ(
logn
n
	

),

and the missing lemma is a small-prime resolution statement just above the n
1/3
 threshold.

If you want, I can next turn this into a clean theorem-proof note containing just the new reductions and the omitted-vertex shadowing lemma.
