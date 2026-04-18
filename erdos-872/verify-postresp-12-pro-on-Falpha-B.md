# Round 12 audit — pro-on-Falpha-B

**User-assigned auditor label:** Here is the adversarial audit.
**Note:** Audits Pro's F_α framework. Independently confirms the 85063 → 83933 correction and the Q_α-batchable-by-primes caveat.
**Source:** informal audit via user's tabs. Extracted verbatim from session transcript.

---

My overall verdict: the static F
α
	

 observation is mostly sound, but the response overstates what it proves dynamically, misstates the exact post-install survivor set, and gets the n=10
6
,α=0.45 admissible-count numerics wrong. The most serious weakness is the “unifying obstruction / missing lemma” part: with a strong formal definition of “effective resolution,” the lemma is basically correct but close to tautological; with a weaker reading, it is not proved and may be misleading.

Is F
α
	

 genuinely an antichain?

Yes.

Let

F
α
	

={p≤y:p prime}∪{d≤n/2:Ω(d)=2, P
−
(d)>y},y=n
α
, α∈(1/3,1/2).

Why it is an antichain:

Distinct primes are incomparable.
A prime p≤y cannot divide any d in the semiprime layer, because every prime factor of d is >y.

Two distinct semiprimes d
1
	

,d
2
	

 in the large-prime layer cannot be comparable. If d
1
	

∣d
2
	

 and d
1
	


=d
2
	

, then d
2
	

=d
1
	

m with m≥2, so

Ω(d
2
	

)=Ω(d
1
	

)+Ω(m)≥3,

contradicting Ω(d
2
	

)=2.

So claim 1 is fine.

The “post-F
α
	

, every legal x has Ω(x)≤2 and all prime factors >y” claim

As a necessary condition, yes.

If A⊇F
α
	

 and x is legal against A, then:

No prime factor of x can be ≤y, because that prime is already in A and divides x.
So every prime factor of x is >y.

If Ω(x)≥3, then

x>y
3
=n
3α
>n

since α>1/3, impossible.

So every legal x must satisfy:

P
−
(x)>y,Ω(x)≤2.

That part is watertight.

But there is an important overreach in the response:

“the only legal survivors are primes and semiprimes whose prime factors are all >y”

This is only a necessary description, not a sufficient one.

Counterexamples to sufficiency:

A semiprime d≤n/2 with both prime factors >y is itself already in F
α
	

, so it is not a legal future move.
A prime p>y can still be illegal if it divides some chosen semiprime pq∈F
α
	

 with pq≤n/2.

So the logic is:

the condition “P
−
(x)>y and Ω(x)≤2” is correct as a filter,
but it is not the exact survivor set.

This matters for the numerical claim in item 3.

Independent computation at n=10
6
,α=0.45

I checked this directly.

Here

y=⌊10
6⋅0.45
⌋=501.

Then:

number of primes ≤501: 95,
number of semiprimes d≤500000 with both prime factors >501: 1058,

so

∣F
α
	

∩L∣=95+1058=1153.

That part is correct.

But the reported “post-install admissible count =85063” is not the true number of legal moves remaining after installing F
α
	

.

What 85063 actually counts is:

#{x≤n: P
−
(x)>501, Ω(x)≤2}.

That is the necessary-condition pool.

The actual number of legal moves remaining after F
α
	

 is installed is:

83933.

Why the gap? Because among those 85063,

1058 are lower-half semiprimes already in F
α
	

,
72 are lower-half primes p>501 that divide some chosen semiprime pq∈F
α
	

,

so they are not legal future moves.

Numerically:

85063−1058−72=83933.

This is the exact legal survivor count.

In fact this makes the comparison with the empirical 1.17 better, not worse:

10
6
(1153+83933)log10
6
	

≈1.1755,

which is essentially right on top of the quoted 1.17.

So:

1153: correct.
85063: wrong as “admissible/legal after install.”
83933: correct legal post-install count.
The Q
α
	

 batching-resistance claim

The narrow claim the user singled out is true:

any composite move x is comparable to at most one d∈Q
α
	

.

Let

Q
α
	

={d≤n/2:Ω(d)=2, P
−
(d)>n
α
}.

Proof:

If x∣d for some d∈Q
α
	

 and x is composite, then x=d.
Reason: a composite divisor of a semiprime can only be the semiprime itself.
So if x were comparable to two distinct d
1
	

,d
2
	

∈Q
α
	

, the only possibility is d
1
	

∣x and d
2
	

∣x.

If d
1
	

,d
2
	

 share one large prime, then x contains at least three prime factors >n
α
, hence

x>n
3α
>n.
If they are disjoint, x contains at least four prime factors >n
α
, even more impossible.

So the literal claim is correct.

But the response then overinterprets it:

“the semiprime half of F
α
	

 is not the hard part”
“the only place where real batching survives is the small-prime layer”

That is too strong.

Why? Because prime moves can still batch-kill many elements of Q
α
	

.

If Prolonger plays a prime p>y, it is comparable to every semiprime pq∈Q
α
	

 with q prime and pq≤n/2. The number of such q is about

π(
2p
n
	

)−π(p−1)≍
plogn
n
	

.

For p≈y=n
α
, this is roughly

n
1−α
/logn,

which is large.

At the concrete point n=10
6
,α=0.45, the single prime move 503 kills 72 members of Q
α
	

.

So the right statement is:

Q
α
	

 is resistant to composite batching,
but not resistant to prime batching.

That is a serious limitation if the intended dynamic use is “the semiprime half is easy.”

Omitted-vertex shadowing as the “unifying obstruction”

This is the part where the response becomes much more rhetorical than structural.

I think the idea is real, but only for a subset of the failures.

It does plausibly unify failures of the form:

fixed-Ω witness families,
pure semiprime saturation ideas,
schemes where a witness d can be replaced by a nearby multiple dr using a cheap outsider prime.

That is a genuine pattern.

But it does not really explain all the earlier obstructions in the prompt.

In particular:

The block-product counter is not an omitted-vertex phenomenon. Its engine is the coprime block design: Shortener can kill at most one block per move because the blocks are pairwise incompatible in a very strong way. That is a different mechanism.
The R
y
	

 counterexample to the one-step Ω=2 cover lemma is not fundamentally about shadowing either. Its core obstruction is quantitative: every relevant semiprime divisor is intrinsically large, so every one-step score is at most n/log
2
n, while the target set has size ≍n(loglogn)
2
/logn.
“Carrier-recycling” is closer to omitted-vertex shadowing, yes.

So I would say:

as an organizing metaphor for divisor-witness failures: useful;
as a rigorous “single structural reason” behind all listed failures: no, not yet.
The missing lemma: sufficient or not?

This depends completely on what “effective resolution” means.

If you formalize it strongly, the lemma is basically correct.

A clean version is:

Fix y=n
1/3+ε
. Suppose that by time T=O(n/logn), the position A
T
	

 has the property that for every prime p≤y, no future legal move can be divisible by p. Then the remaining game lasts O(n/logn) moves.

This is easy to prove:

Any future legal x has no prime factor ≤y.
Hence all prime factors of x are >y.
Since y
3
>n, we must have Ω(x)≤2.
So every future legal x is either:
a prime >y, or
a semiprime pq≤n with p,q>y.

The number of such integers is

O(n/logn).

Indeed:

#{p>y prime}≤π(n)=O(n/logn),

and

#{pq≤n: y<p≤q prime}≤
y<p≤
n
	

∑
	

π(n/p)≪
logn
n
	

y<p≤
n
	

∑
	

p
1
	

=O
ε
	

(n/logn),

since ∑
y<p≤
n
	

	

1/p=O
ε
	

(1).

So under that strong formalization, yes: the reduction is sufficient.

But this also shows the hidden issue. Under that formalization, “effective resolution” is already doing almost all the work. It means:

not merely that each small prime has been “touched,”
not merely that it appears in some chosen semiprime,
but that every future legal number carrying that prime is already excluded.

That is a very strong global cover condition. The reduction is correct, but it is close to tautological.

If you weaken “effective resolution” to something like

“the prime is represented in the semiprime layer,” or
“most multiples are hit,” or
“each prime participates in some chosen blocker,”

then the lemma no longer follows. One chosen semiprime pq does not remotely “resolve” p; it kills only numbers comparable to pq, while many other multiples pr may remain legal.

So my verdict on the missing lemma is:

Correct if formalized strongly as “after O(n/logn) turns, no legal future move contains any prime ≤n
1/3+ε
.”
Not yet a theorem as stated, because the phrase “effective resolution” hides the real content.
The reduction is valid, but it does not by itself shrink the hard part nearly as much as the prose suggests.

The weakest link

The weakest link is not the static antichain construction. That part is fine.

The weakest link is the jump from the clean static F
α
	

 fact to the claim that this “isolates the real missing piece” and that the semiprime half is “not the hard part.” That leap uses:

a batching-resistance statement that only handles composite Prolonger moves,
a survivor description that is only necessary, not exact,
and a missing lemma whose force depends almost entirely on an undefined phrase.

So the response has a real structural insight, but it has not yet converted that insight into a sharply proved dynamic reduction.

If you want, I can turn this into a compact referee-style audit with “sound / incomplete / false / numerically wrong” tags for each claim.
