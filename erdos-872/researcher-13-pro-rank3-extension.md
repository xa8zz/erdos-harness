---
id: R13-pro-rank3-extension
type: research
date: 2026-04-18
intent: >
  Attempt positive extension of Theorem 5 to overlapping carriers; if
  possible, extend to squarefree rank-<=3 and resolve the {30, 42, 70}
  counterexample.
predecessors: [R12-pro-response]
prompt: erdos-872/prompts/round13-B-deepthink-open.md
action:
  kind: extends
  target: R12-pro-response
claim: >
  Squarefree rank-<=3 overlapping carriers on primes <= y = n^alpha give
  L(n) = O_alpha(n/log n) via four-phase strategy: play-all-primes + prime
  squares + semiprimes + triples. Resolves {30, 42, 70} counterexample. First
  genuine overlap barrier is at rank >= 4. Best guess: true rate L(n) ~ n/log n.
---
# Round 13 Pro response — Channel B/D (positive extension)

**Result:** new theorem — squarefree rank-≤3 overlapping carriers on primes ≤ y = n^α give L(n) = O_α(n/log n). Resolves {30, 42, 70} via play-all-primes + squares + semiprimes + triples (four-phase). Claims first genuine overlap barrier is at rank ≥ 4, not at rank 3.

---

I do not have a full proof for arbitrary Prolonger, but I can prove a substantial new extension of the (O(n/\log n)) side, and it changes where the real obstruction sits.

My current best guess is that the true order is

[
L(n)\asymp \frac{n}{\log n},
]

not linear.

The strongest thing I can rigorously add is this.

**New theorem.** Fix (\alpha\in(1/3,1/2)) and (y=n^\alpha). Suppose every composite Prolonger move is

* squarefree,
* supported on primes (\le y),
* and has at most three distinct prime factors.

Then Shortener can force

[
L(n)=O_\alpha!\left(\frac{n}{\log n}\right).
]

So the “overlapping small-prime carrier” obstruction is gone for the entire squarefree rank-(\le 3) class, not just for disjoint carriers.

The proof is a four-phase repair.

Let (B) be the set of primes appearing in composite Prolonger moves.

First, Shortener plays every legal prime. After that, any future legal number must use only primes from (B), because any prime factor outside (B) was either played by Shortener or already played by Prolonger as a prime.

Second, for each (p\in B), Shortener plays (p^2) whenever it is legal. Because the composite Prolonger moves are squarefree, (p^2) is incomparable with every composite carrier using (p), so unless (p) was already played as a prime, this move is legal. Hence after this phase every surviving legal number is squarefree.

Third, Shortener plays every legal squarefree semiprime (pq) with (p,q\in B).

Fourth, Shortener plays every legal squarefree triple (pqr) with (p,q,r\in B).

Now take any number (x) still legal at the end.

After phases 1 and 2, (x) must be squarefree and all its prime factors lie in (B).

If (|\operatorname{supp}(x)|=1), then its prime lies in a Prolonger carrier, so (x) was never legal.

If (|\operatorname{supp}(x)|=2), then (x) is a squarefree semiprime on (B). If it was legal after phase 2, phase 3 played it. If it was not legal, then it was already comparable with a previously chosen move. Either way, contradiction.

If (|\operatorname{supp}(x)|=3), the same argument applies with phase 4.

If (|\operatorname{supp}(x)|\ge 4), choose any three prime factors (p,q,r\mid x). The triple (pqr) divides (x). If (pqr) was legal after phase 3, phase 4 played it, so (x) is comparable with a chosen move. If (pqr) was not legal, then some earlier move was already comparable with (pqr). Since (pqr) is squarefree of support size (3), that earlier move must be a prime, a legal semiprime from phase 3, or a Prolonger carrier supported inside ({p,q,r}); in every case it divides (x). Again contradiction.

So no legal move survives.

The count is also on-budget.

Phase 1 contributes (\pi(n)=O(n/\log n)).

Phase 2 contributes at most (|B|\le \pi(y)=o(n/\log n)).

Phase 3 contributes at most the number of squarefree semiprimes (pq\le n) with (p,q\le y), which is at most (\pi(y)^2=o(n/\log n)) because (2\alpha<1).

The only nontrivial count is phase 4. Let

[
T_\alpha(n):=#{p<q<r\le y:\ pqr\le n}.
]

Then (T_\alpha(n)=O_\alpha(n/\log n)). A clean proof is to split at (pq=n/y=n^{1-\alpha}).

If (pq\le n^{1-\alpha}), then (r) has at most (\pi(y)) choices, so this part is

[
\ll \pi(y)\cdot #{pq\le n^{1-\alpha}}
\ll \frac{n^\alpha}{\log n}\cdot \frac{n^{1-\alpha}\log\log n}{\log n}
= o!\left(\frac{n}{\log n}\right).
]

If (pq>n^{1-\alpha}), then (q\le y=n^\alpha) forces (p>n^{1-2\alpha}). Thus both (p) and (q) lie in the fixed-power interval ((n^{1-2\alpha},n^\alpha]), whose prime harmonic mass is (O_\alpha(1)) by Mertens. Also (r\le n/(pq)), and when this is nonempty one has (\log(n/(pq))\ge (1-2\alpha)\log n). So

[
\sum_{pq>n^{1-\alpha}} \pi!\left(\frac{n}{pq}\right)
\ll_\alpha
\frac{n}{\log n}
\sum_{n^{1-2\alpha}<p<q\le n^\alpha}\frac1{pq}
\ll_\alpha \frac{n}{\log n}.
]

Hence phase 4 is (O_\alpha(n/\log n)).

That proves the theorem.

This already resolves the concrete overlap example ({30,42,70}). The right repair is not “just play (105)”; it is:

* play all legal primes first, so (11) is already in the set and (22) is dead,
* then squares (4,9,25,49),
* then the triple (105).

So the example is not a genuine rank-3 obstruction.

There is also a conceptual takeaway. The raw counting objection to “phase-4 triples” is not the real issue in the small-prime case. Under the cutoff (p,q,r\le n^\alpha) with (\alpha>1/3), the whole triple layer is already (O_\alpha(n/\log n)). In my Python checks at (n=10^6,\ \alpha=0.45), the total number of squarefree triples (pqr\le n) with (p,q,r\le 501) is only (35{,}415), i.e. about (0.489,n/\log n), very much on scale.

So what remains is narrower than it looked.

The unresolved part of case (a) is not “triples are too numerous.” It is higher-rank overlap: carrier families with unbounded support size, where the minimal unresolved supports can have size (4,5,\dots), and I do not yet have a uniform (O(n/\log n)) bound for that minimal-support layer.

Case (b), blocked large primes, is still genuinely open. The difficulty there is different: once a large (q) appears, the residual problem lives in the fiber (q\cdot \mathcal F_q), and simple one-pair repairs do not globally resolve all (pq)-type survivors.

So my updated view is:

* the disjoint small-prime class is (O(n/\log n)),
* the arbitrary-overlap squarefree rank-(\le 3) small-prime class is also (O(n/\log n)),
* the real remaining obstruction is higher-rank small-prime overlap together with mixed small/large fibers.

That makes me more confident that the final answer is sublinear, and specifically (L(n)=\Theta(n/\log n)), rather than linear.

If you want the cleanest single sentence summary of the progress here, it is this:

**The first genuine overlap barrier is not at triples. Rank-3 overlap is already resolvable at (O(n/\log n)); the hard part starts only once the minimal unresolved support rank is unbounded, or when large-prime fibers enter.**
