---
id: R12-followup-online-patch-needed
type: verification
date: 2026-04-18
intent: >
  Adversarial audit of Theorem 5 focusing on the offline-vs-online gap:
  Shortener knowing the carrier family B in advance vs. the actual alternating game.
predecessors: [R12-followup-pro-resolution-disjoint-carriers]
action:
  kind: confirms
  target: R12-followup-pro-resolution-disjoint-carriers
claim: >
  Local combinatorial core of Theorem 5 is mostly right. Hidden issue:
  proof is written offline (Shortener knows B in advance), not as an
  online alternating-game strategy. Patch is plausible for the disjoint-support
  class but is not written.
siblings: [R12-followup-essentially-sound, R12-followup-overlap-fatal]
---

# Audit of Theorem 5 — online-patch-needed

**Source:** informal audit via user's tabs. Extracted verbatim from session transcript.

---

Overall verdict: The local combinatorial core of Theorem 5 looks mostly right, but the response overstates it as a fully rigorous game-theoretic theorem. The specific bullets you asked about are mostly okay, but there is a more serious hidden issue: the proof is written offline, as if Shortener knows the final carrier family B in advance. In the actual alternating game, that has to be turned into an online strategy. I think that patch is plausible in the disjoint-support class, but it is not written.

Here is the adversarial audit.

1. Phase 2 legality when p
e(p)+1
>n and the move is skipped

This part is fine, and the proof can actually be made cleaner.

The relevant subcase in the resolution argument is:

all prime factors of x lie in a single carrier C,
x∤C,
so for some prime r∣x, v
r
	

(x)>e(r):=v
r
	

(C).

Then automatically

r
e(r)+1
∣x≤n,

so in particular

r
e(r)+1
≤n.

That means the “skipped because r
e(r)+1
>n” alternative cannot occur in any actual counterexample x≤n. So the proof’s line

“phase 2 played this (or r
e(r)+1
>n so x>n, contradiction)”

is correct, but weaker than it could be. The stronger statement is simply: if v
r
	

(x)>e(r), then the phase-2 move was available and should have been played.

So on your first bullet: no break here.

2. Phase 3 legality of pq

In the fixed final carrier family, this is essentially correct.

You asked specifically whether “disjoint supports” really implies no carrier contains both p and q. Yes:

p∈B means p occurs in some composite carrier.
Under pairwise disjoint supports of distinct composite carriers, each prime belongs to a unique composite carrier.
So if C(p)

=C(q), no composite carrier can contain both p and q, or else both primes would belong to the same unique carrier.

Also:

pq is not comparable with any chosen prime, since the only prime divisors of pq are p and q, and those primes cannot already have been chosen as primes.
pq is not comparable with C(p) or C(q), because those carriers have support contained in one carrier each, not both.
pq is not comparable with any phase-2 power r
e(r)+1
, since r
e(r)+1
 is a nontrivial prime power and pq has two distinct prime factors.

There are two omissions, though:

The proof should also explicitly note that different phase-3 products are pairwise incomparable. That is easy: two distinct semiprimes pq and rs with distinct prime sets do not divide each other.
More importantly, the proof is written as though all carriers are already known. In the actual game, you need to know that a queued phase-3 move pq stays legal when Prolonger later reveals more disjoint carriers. It does stay legal, but that permanence should be stated.

So on this bullet: the local legality is okay; the writeup is slightly incomplete, but not wrong.

3. The key resolution dichotomy inside one carrier

This is valid, but one sentence is too loose.

Once the proof has shown that every prime factor of x lies in a single carrier C, then:

if for every prime r in supp(x), v
r
	

(x)≤e(r), then x∣C;
otherwise some r has v
r
	

(x)>e(r), so r
e(r)+1
∣x.

That dichotomy is just coordinatewise comparison of exponent vectors. It is correct.

The only sloppy part is this line in the pure prime-power case:

“If C(p) is a pure prime power r
a
: any x divisible by r is comparable with r
a
.”

Taken literally, that is false: 6 is divisible by 2 but is not comparable with 8.

What is true is:

after the previous reduction, all prime factors of x lie in the single carrier r
a
,
hence x=r
b
,
and then x is indeed comparable with r
a
.

So this is a wording bug, not a structural bug.

4. Does the class include the universal block-product counter?

Yes. This match looks correct.

The universal block-product construction uses composite moves of the form

x
i
	

=
p∈S
i
	

∏
	

p

where the S
i
	

 partition the primes ≤n
1/3
. Therefore:

every prime factor of every composite block-product move is ≤n
1/3
,
for any y=n
α
 with α>1/3, these are certainly ≤y,
distinct block products have disjoint prime supports because the S
i
	

 are disjoint.

So the disjoint small-prime carrier hypothesis does cover that counterexample class.

I do not see a mismatch there.

5. Move count π(n)+π(y)+π(y)
2

This is correct.

For y=n
α
 with α<1/2,

π(y)
2
≪(
logy
y
	

)
2
≍
log
2
n
n
2α
	

.

Relative to n/logn, this is

n/logn
π(y)
2
	

≪
logn
n
2α−1
	

→0

because 2α−1<0.

So indeed

π(y)
2
=o(n/logn),

hence the total is O(n/logn).

No arithmetic problem there.

6. Is the overlapping-carriers example 30,42,70 with surviving 105 a genuine obstruction?

Not as stated. It is an obstruction to the specific pair-repair scheme, but not a convincing obstruction to any slightly stronger Shortener repair.

In that example:

30=2⋅3⋅5,
42=2⋅3⋅7,
70=2⋅5⋅7,

and indeed 105=3⋅5⋅7 is legal against all three.

But then a stronger Shortener can simply play 105. It is legal, and once it is chosen, any future move divisible by 3,5,7 becomes illegal.

So this example shows only:

the naive “repair all missing cross-carrier pairs pq” idea is insufficient when carriers overlap.

It does not show:

overlapping carriers are a genuine unresolved obstruction in any strong sense.

To make it a real obstruction, one would need a family where all natural higher-order omitted-vertex repairs either become illegal or require too many moves. The 30,42,70 toy example does not do that.

So on this bullet: the response overclaims. The example is useful, but it is not decisive.

The biggest hidden issue is not in your bullet list.

The proof of Theorem 5 is written as if Shortener can say:

“Let B be the set of primes occurring in some composite Prolonger move,”
“for each p∈B, play …,”
“for each pair p,q∈B, play …”

That is a hindsight description of the final carrier family, not yet an online alternating-game strategy.

For a fully rigorous theorem, the writeup needs one more lemma:

when a carrier first appears, its associated phase-2 powers and phase-3 products can be put on a queue;
every queued repair move stays legal forever because later carriers are disjoint and later prime moves cannot reuse those primes;
once the queue empties, all currently seen small primes are resolved;
total queue size is still O(π(n)+π(y)+π(y)
2
).

I think that patch probably works. But until it is written, calling Theorem 5 a “genuine new rigorous theorem” is too strong.

So my bottom line is:

Phase 2 skip: okay.
Phase 3 legality: okay in the static sense; a couple of omissions, but no obvious local failure.
Single-carrier resolution dichotomy: okay; one sentence is imprecise.
Inclusion of block-product counter: okay.
Move count: okay.
Overlap example: not a genuine obstruction; only a refutation of pair-repair.

Weakest link: the proof is still missing the explicit online implementation of the three phases against carriers revealed over time. Without that, I would not call Theorem 5 fully rigorous yet.
