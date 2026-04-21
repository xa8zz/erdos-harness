# Section 7 Audit Findings — GPT Pro Adversarial Review

Pro audit of `sections/07-main-upper-bound.tex` (the `0.19n` upper bound proof chain).
Verdict: the proof does not hold at referee standard as written; multiple real
gaps identified, most repairable. Recorded verbatim for reference while repair
dispatches run.

---

Pro came back:



Referee verdict: the proof chain does not hold up as written. I found several real gaps. The largest one is in the Bonferroni comparison theorem; another serious one is in the prime-rounding bridge’s matching argument. Most of the problems look repairable, but they are not cosmetic.



I did not find the specific “local lemma applies but lemma is absent” anti-pattern: the local prime-count lemma is present. The main failures are elsewhere.



1. Theorem Prime-sequence Bonferroni--4 comparison: the stated error term is wrong



The proof says:



Applying fourth-order Bonferroni … gives



N(p

1

	



,…,p

K

	



)≤

2

n

	



(1−T

1

(p)

	



+T

2

(p)

	



−T

3

(p)

	



+T

4

(p)

	



)+O(M

2

	



+M

3

	



+M

4

	



),



where M

r

	



 is the number of odd integers ≤n with at least r distinct prime divisors from {p

j

	



}.

The standard squarefree divisor-count bound gives



M

r

	



=O

r

	



(

logn

n(loglogn)

r−1

	



)=o(n).



This is false as stated.



The standard Landau-type bound



#{m≤n:ω(m)=r}=O

r

	



(

logn

n(loglogn)

r−1

	



)



counts integers with exactly r prime factors, not integers with at least r prime factors from a specified set. For all primes, the number of integers with at least two distinct prime factors is ∼n, not o(n). More importantly, in the present application T

2

(p)

	



→J

2

	



>0, so the pair-intersection mass is genuinely of order n. The objects counted by M

2

	



 are not a negligible floor-error term; they are part of the main Bonferroni phenomenon.



What the proof actually needs is not M

r

	



. It needs to bound the number of r-fold squarefree products



D

r

	



:=#{j

1

	



<⋯<j

r

	



:p

j

1

	



	



⋯p

j

r

	



	



≤n}.



Then the floor errors are



O(D

1

	



+D

2

	



+D

3

	



+D

4

	



),



because each intersection count is



#{m≤n:m odd,p

j

1

	



	



⋯p

j

r

	



	



∣m}=

2p

j

1

	



	



⋯p

j

r

	



	



n

	



+O(1).



Now



D

r

	



≤#{m≤n:m squarefree with exactly r prime factors}=O

r

	



(

logn

n(loglogn)

r−1

	



)=o(n),



so the intended Bonferroni theorem is probably repairable. But the theorem proof as written invokes the wrong counting object and a false bound.



This is the cleanest serious break in the section.



2. The same theorem uses a nontrivial monotonicity claim without proof



The proof says:



The count of odd integers avoiding a finite prime set is monotone in each prime, so



N(q

1

	



,…,q

K

	



)≤N(p

1

	



,…,p

K

	



).



This is not a set-inclusion statement, and it is not obvious from the displayed hypotheses. It is probably true under the sorted coordinatewise hypothesis q

j

	



≤p

j

	



, but it needs proof.



A repair is available: replace primes from the largest index downwards. If R is the set of other primes at a given step, the number of R-free odd multiples of a prime s is



A

R

	



(n/s),



where A

R

	



(t) counts R-free odd integers ≤t. Since A

R

	



 is nondecreasing and q

j

	



≤p

j

	



, replacing q

j

	



 by p

j

	



 can only increase the avoiding count, provided one checks that descending replacement avoids collision issues. This should be written; the one-line assertion is too compressed for a referee-standard proof.



3. The prime-rounding bridge’s boundary-reservoir matching is not proved



The serious gap is here:



the sorted lower bounds b

j

	



 in the reservoir satisfy the one-dimensional Hall condition … every proper suffix [Y,Γ

H

	



X] contains at most half as many genuine exceptional b

j

	



 as there are odd primes there, by the interval estimate (PB2), uniformly for multiplicative lengths at most Γ

H

	



, and the prime number theorem.



This does not follow from (PB2) and the prime number theorem.



The estimate (PB2) is proved for fixed multiplicative intervals



[X,(1+Δ)X]



with fixed Δ>0. Hall’s condition for a reservoir requires control of every suffix



[Y,Γ

H

	



X],



including suffixes of arbitrarily small relative length near the right endpoint. The endpoint error +2 in (PB2) is not negligible when the suffix is short, and the prime number theorem does not give uniform prime counts in such short intervals. In particular, the argument does not rule out the largest exceptional b

j

	



 lying above the last prime in the reservoir.



So the claim that greedy assignment inside the reservoir succeeds is not established.



This is probably repairable, but it needs a different construction. For example, one could enlarge the reservoir by a fixed multiplicative safety factor and assign boundary b

j

	



’s to primes in later coarse multiplicative bins, exactly as is done for the nonexceptional indices. Alternatively, one would need a genuine short-interval prime result strong enough to verify the Hall inequalities, which is far beyond what is cited here.



As written, the prime-rounding bridge has an unproved matching step.



4. The nonexceptional bin assignment is not fully separated from the reservoirs



The proof says:



partition the remaining interval into consecutive multiplicative bins … discarding at most the first and last partial bin into E. … The prime bins are disjoint and increasing, so together with the reservoir assignments this produces one increasing sequence of odd primes.



This needs more detail. A b-bin



[X,(1+δ)X)



is assigned to primes in the next bin



[(1+δ)X,(1+δ)

2

X).



Near a right boundary reservoir, the next prime bin can overlap the boundary reservoir unless the exceptional layer is enlarged by at least a factor (1+δ)

2

, or unless the partition is explicitly stopped earlier. The proof only says “discarding at most the first and last partial bin,” which does not by itself guarantee disjointness of the prime bins and reservoir prime pools.



This is technical and likely repairable, but the current construction is under-specified.



5. The bridge’s diagonalization is asserted rather than fully produced



The diagonal step says:



For each m, the fixed-parameter construction above is valid for all n≥N

m

	



 after enlarging N

m

	



 so that also



∣T

r

(b)

	



(n)−J

r

(H

m

	



)

	



∣≤1/m.



… This gives H(n)→∞ slowly enough that the smallest genuine scale n

α

H(n)−1

	



 still tends to infinity.



This is incomplete. The N

m

	



 must also be enlarged to control:



o

H

m

	



,λ

m

	



	



(1)



in the prime-rounding comparison;



the fixed-H

m

	



, fixed-δ

m

	



 prime-number estimates used in (PB3);



the endpoint error in (PB2), especially because δ

m

	



 may be very small;



and the condition



n

α

H

m

	



−1

	



≍n

1/H

m

	



→∞.



The last condition does not follow automatically from “N

m

	



 increasing.” It can be repaired by imposing, for instance,



N

m

1/H

m

	



	



≥m



and by baking all fixed-parameter error thresholds into N

m

	



. But as written, the sentence “This gives H(n)→∞ slowly enough…” is not justified by the preceding construction.



This is a version of the diagonal-sequence anti-pattern you flagged: the diagonal is sketched, but not all required constraints are actually included in the diagonal choice.



6. Prefix existence is not proved before the section uses q

1

	



,…,q

K

	





The section begins by defining



q

1

	



<⋯<q

K

	





as the odd primes Shortener plays during the prefix of length



K=⌊

2logn

(1−ε)n

	



⌋.



But the section never proves that Shortener can in fact make K legal odd-prime moves unless the game has already ended. The Bonferroni theorem handles the case where the game ends before the prefix is completed, but it does not handle the possibility that no legal odd prime remains while the game itself has not ended.



This should be repairable using the large primes p>

n

	



. Before K Shortener prime moves, fewer than roughly 2K moves have occurred. Each previous move can kill at most one prime p>

n

	



, while



π(n)−π(

n

	



)∼

logn

n

	



.



Since



2K∼(1−ε)

logn

n

	



,



there should still be a legal odd prime >

n

	



 for large n. But this argument is absent, and the proof chain depends on it.



7. The local-density step is mostly sound, but one equality needs conditioning



In Proposition Local density away from breakpoints, the proof claims:



We claim that S(X)=S

K

	



(X) … once n is large enough. Indeed, u≤1−τ

H

	



, so π(n

u

)=o(K). Therefore all odd primes at most X are exhausted before the prefix of length K.



This is essentially correct if the K-prime prefix exists: while the next legal odd prime is ≤X, Shortener plays a distinct odd prime ≤X, so the stopping time occurs after at most π(X) Shortener prime moves, and π(X)=o(K).



But as written, this argument is entangled with the missing prefix-existence issue. It should be stated conditionally: assuming the prime prefix has not already failed or ended the game, the stopping time occurs before the K-th Shortener prime move. Otherwise the main proof needs a separate trivial-ending argument.



This is repairable.



8. The weak-convergence explanation in the bridge is insufficient for the shrinking boundary strip



The bridge says:



For fixed H and λ, this boundary layer is o

H,λ

	



(1): in logarithmic coordinates it is a strip of width rlogλ/logn around the hyperplane … and the empirical measures … converge to an absolutely continuous limit.



Weak convergence to an absolutely continuous limit does not by itself control shrinking neighborhoods of a boundary. Atomic empirical measures can concentrate on shrinking sets even while converging weakly.



The proof then gives a cell-count alternative:



Equivalently, one may partition into unit logarithmic cells …



That is the right kind of argument, but it needs to be made primary and fully proved. In particular, the proof must establish uniformly that each relevant logarithmic cell has reciprocal mass O

H

	



(1/logn), including cells adjacent to the exceptional layers. This is likely repairable from (PB2), but the weak-convergence sentence alone is not valid.



9. The numerical constant is plausible but not certified in the section



The section states:



\Wfour=0.3794224,\Wfour/2=0.1897112<0.19.



A quick numerical sanity check of the integrals gives a value consistent with this. For example, numerically one gets approximately



J

1

	



≈0.7885306,J

2

	



≈0.18682,J

3

	



≈0.02009,J

4

	



≈0.001223,



which gives \Wfour≈0.37942.



But the section itself does not provide a certified numerical integration method or an interval bound. Since the margin



0.19−0.1897112≈2.888×10

−4



is small, a publication proof should include interval arithmetic, a rigorous tail bound for the infinitely many ρ

U

	



-pieces, or a precise reference to a formal certificate. The current remark about a “formal artifact” verifies the endgame reduction, but from the text alone it does not certify the numerical evaluation of J

1

	



,…,J

4

	



.



This is not necessarily mathematically wrong, but it is not referee-complete.



Bottom line



The proof does not meet referee-standard rigor as written.



The most serious hard break is in Theorem [Prime-sequence Bonferroni--4 comparison]: the M

r

	



=o(n) assertion is false for the M

r

	



 actually defined. That theorem can likely be repaired by replacing M

r

	



 with the number of r-fold squarefree products D

r

	



≤n.



The second major break is in Theorem [Prime-rounding bridge]: the boundary-reservoir Hall/greedy assignment is not justified by the fixed-interval density estimate (PB2) and the prime number theorem. That also looks repairable, but it requires a more explicit coarse-bin matching construction or a stronger prime-distribution input.



The local-density and envelope/inversion portions are mostly plausible after conditioning on prefix existence, but the final chain cannot be accepted until the Bonferroni error term, prime-rounding matching, diagonal construction, and prefix-existence issues are fixed.
