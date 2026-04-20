---
id: R12-followup-essentially-sound
type: verification
date: 2026-04-18
intent: >
  Adversarial audit of Theorem 5 (disjoint-carrier Shortener resolution)
  from followup-12-pro-closeout-response, checking legality and counting.
predecessors: [R12-followup-pro-resolution-disjoint-carriers]
action:
  kind: confirms
  target: R12-followup-pro-resolution-disjoint-carriers
claim: >
  Theorem 5 is essentially correct as a rigorous result for its stated class.
  No fatal error in legality, resolution, or counting. Two caveats: overlapping
  carriers are a genuine obstruction (not patchable via "slightly stronger strategy"),
  and the online patch is needed for the actual alternating game.
siblings: [R12-followup-online-patch-needed, R12-followup-overlap-fatal]
---

# Audit of Theorem 5 — essentially-sound

**Source:** informal audit via user's tabs. Extracted verbatim from session transcript.

---

Adversarial audit of Theorem 5
Bottom line. The proof is essentially correct as a rigorous result for its stated class. I could not find a fatal error in legality, resolution, or counting. The framing as a "genuine new rigorous theorem" is fair — but with two caveats the write-up should be more explicit about. And the overlapping-carrier counterexample is a genuine obstruction, not something a "slightly stronger" strategy handles without paying the log⁡log⁡n\log\log n
loglogn factor.

Going through your specific checks:
1. Does the class include the universal block-product counter? (Yes — verified)
Block-product construction: primes ≤n1/3\le n^{1/3}
≤n1/3 greedily partitioned into disjoint sets S1,…,SrS_1,\dots,S_r
S1,…,Sr; Prolonger plays blocks xi=∏p∈Sipx_i = \prod_{p\in S_i}p
xi=∏p∈Sip.

Check against theorem's hypothesis:

*All prime factors ≤y\le y
≤y?* Every prime in any SiS_i
Si is ≤n1/3<nα=y\le n^{1/3} < n^\alpha = y
≤n1/3<nα=y for α>1/3\alpha > 1/3
α>1/3. ✓

*Disjoint supports among distinct composites?* Si∩Sj=∅S_i\cap S_j = \emptyset
Si∩Sj=∅ by construction. ✓


Prolonger's prime moves (if any) are unrestricted by the hypothesis but cannot collide with BB
B (prime in BB
B and its carrier simultaneously in AA
A violates antichain). So the class correctly subsumes the block-product counter.
No gap here.
2. Phase-2 legality and the skipped-move case
Phase-2 plays pe(p)+1p^{e(p)+1}
pe(p)+1 only when pe(p)+1≤np^{e(p)+1}\le n
pe(p)+1≤n. The question: if that move is skipped, does resolution still work?

Trace the resolution argument: we're in the sub-case C(p)C(p)
C(p) has ≥2\ge 2
≥2 primes, and we reach "some prime r∣xr\mid x
r∣x has vr(x)>e(r)v_r(x) > e(r)
vr(x)>e(r), hence re(r)+1∣xr^{e(r)+1}\mid x
re(r)+1∣x." If phase 2 skipped re(r)+1r^{e(r)+1}
re(r)+1 because re(r)+1>nr^{e(r)+1}>n
re(r)+1>n, then any xx
x with re(r)+1∣xr^{e(r)+1}\mid x
re(r)+1∣x satisfies x≥re(r)+1>nx\ge r^{e(r)+1}>n
x≥re(r)+1>n, contradicting x≤nx\le n
x≤n.
The case is vacuous, not broken. ✓
Legality of phase-2 itself (against primes, the carrier C(p)C(p)
C(p), other carriers via disjoint supports, phase-3 semiprimes via the prime-power-vs-two-prime argument) all check out.

3. Phase-3 legality: does "disjoint supports" imply "no carrier contains both pp
p and qq
q"?

Yes, and rigorously so. Disjoint supports means each prime appears in at most one carrier; write C(⋅)C(\cdot)
C(⋅) for that unique carrier. Phase 3 plays pqpq
pq only when C(p)≠C(q)C(p)\ne C(q)
C(p)=C(q). Then:


p∈supp(C(p))p\in\mathrm{supp}(C(p))
p∈supp(C(p)) only (by disjointness), so p∉supp(C(q))p\notin\mathrm{supp}(C(q))
p∈/supp(C(q)) and p∉supp(C′)p\notin\mathrm{supp}(C')
p∈/supp(C′) for any other carrier C′C'
C′.

Symmetrically for qq
q.


So no carrier has {p,q}\{p,q\}
{p,q} in its support, hence pq∤Cpq\nmid C
pq∤C for any carrier CC
C. And C∣pqC\mid pq
C∣pq would force C∈{p,q,pq}C\in\{p,q,pq\}
C∈{p,q,pq}; the first two are prime (not composite), and C=pqC=pq
C=pq would mean CC
C has support {p,q}\{p,q\}
{p,q} contradicting C(p)≠C(q)C(p)\ne C(q)
C(p)=C(q). ✓

Legality against primes, phase-2 prime-powers, and other phase-3 semiprimes all hold by the same atomic divisor-counting. No gap.
4. Resolution argument, both sub-cases
Pure prime power C(p)=raC(p) = r^a
C(p)=ra:
 Single-carrier constraint forces all primes of xx
x to be in {r}\{r\}
{r}, so x=rbx=r^b
x=rb. Any two powers of rr
r are comparable (rmin⁡(a,b)∣rmax⁡(a,b)r^{\min(a,b)}\mid r^{\max(a,b)}
rmin(a,b)∣rmax(a,b)), so xx
x comparable with C(p)∈AC(p)\in A
C(p)∈A. ✓

C(p)C(p)
C(p) has ≥2\ge 2
≥2 primes:
 Dichotomy: either vr(x)≤e(r)v_r(x)\le e(r)
vr(x)≤e(r) for every prime r∣xr\mid x
r∣x (in which case x∣C(p)x\mid C(p)
x∣C(p), comparable), or some rr
r has vr(x)>e(r)v_r(x)>e(r)
vr(x)>e(r) (giving re(r)+1∣xr^{e(r)+1}\mid x
re(r)+1∣x, comparable with phase-2 move which exists iff re(r)+1≤nr^{e(r)+1}\le n
re(r)+1≤n, which is forced by x≤nx\le n
x≤n). ✓

Both sub-cases handled. No gap.
5. Move count π(n)+π(y)+π(y)2=O(n/log⁡n)\pi(n) + \pi(y) + \pi(y)^2 = O(n/\log n)
π(n)+π(y)+π(y)2=O(n/logn)
Verified directly. π(y)2∼n2α/(αlog⁡n)2\pi(y)^2 \sim n^{2\alpha}/(\alpha\log n)^2
π(y)2∼n2α/(αlogn)2, so

π(y)2n/log⁡n∼n2α−1α2log⁡n→0 when α<1/2.\frac{\pi(y)^2}{n/\log n} \sim \frac{n^{2\alpha-1}}{\alpha^2\log n} \to 0 \text{ when } \alpha < 1/2.n/lognπ(y)2∼α2lognn2α−1→0 when α<1/2.
At n=106,α=0.45n=10^6, \alpha=0.45
n=106,α=0.45: the ratio is 0.125, and it decays like n−0.1n^{-0.1}
n−0.1. π(n)\pi(n)
π(n) dominates; the bound is genuinely O(n/log⁡n)O(n/\log n)
O(n/logn). ✓

6. Is the overlapping-carriers example (30, 42, 70 → 105) a genuine obstruction?
Yes — genuine. Verified computationally:

105 is incomparable with all three carriers.
None of {9, 25, 49} (phase-2 squares) divides 105.
Every pair {p,q}⊆{3,5,7}\{p,q\}\subseteq\{3,5,7\}
{p,q}⊆{3,5,7} is already contained in some single carrier (3,5 in 30; 3,7 in 42; 5,7 in 70), so under any reasonable interpretation of phase 3, the pqpq
pq moves {15,21,35}\{15,21,35\}
{15,21,35} are either (i) not played because no phase-3 condition fires, or (ii) already blocked as divisors of the carriers themselves.


The natural patch — phase 4, playing triples pqrpqr
pqr not dominated by any carrier — gets the count wrong. My sandbox:

α\alpha
απ(y)\pi(y)
π(y)#squarefree triples pqr≤npqr\le n
pqr≤n with primes ≤y\le y
≤y/ (n/log⁡n)/\,(n/\log n)
/(n/logn)0.34293,6430.050.405415,4240.210.459535,4150.490.4915057,4600.79
At fixed nn
n the numbers look survivable, but asymptotically the count scales as ∼n(log⁡log⁡n)2/log⁡n\sim n(\log\log n)^2/\log n
∼n(loglogn)2/logn (standard Mertens-type bound: ∑p≤y1/p∼log⁡log⁡y\sum_{p\le y}1/p \sim \log\log y
∑p≤y1/p∼loglogy summed across the two "free" prime slots under pqr≤npqr\le n
pqr≤n). That beats O(n/log⁡n)O(n/\log n)
O(n/logn) by a (log⁡log⁡n)2(\log\log n)^2
(loglogn)2 factor. So Pro's framing is accurate: naive phase-4 is exactly the log⁡log⁡n\log\log n
loglogn-off answer, matching the rough-Ω≥3\Omega\ge 3
Ω≥3 tail from the brief's positive lemma.

A stronger strategy might prune phase-4 — e.g., only play pqrpqr
pqr that are not dominated by any phase-3 or phase-2 move already — but this is speculation; no argument in the response shows the reduction closes. The obstruction as stated holds.

Issues the write-up should flag but doesn't
(a) Online/adaptive execution is glossed over
The proof presents phases 1→2→3 as sequential Shortener actions, but the game alternates. BB
B, C(⋅)C(\cdot)
C(⋅), and e(⋅)e(\cdot)
e(⋅) are not known in advance — they grow as Prolonger plays composites. The correct reading is an
online version: on each Shortener turn, play the highest-priority legal strategy move (phase 1 > 2 > 3); new Prolonger composites trigger new phase-2 and phase-3 obligations.
This is fixable — counts still bound by π(n)+∣B∣final+(∣B∣final2)\pi(n)+|B|_{\text{final}}+\binom{|B|_{\text{final}}}{2}
π(n)+∣B∣final+(2∣B∣final) — but the proof as written doesn't acknowledge the reordering and the obligation to re-verify legality at each intervening step. A careful writeup needs a monotone-priority lemma.

(b) Prolonger's prime moves are never directly addressed
The hypothesis restricts *composite* Prolonger moves. Prolonger's prime moves are unrestricted, which is actually fine — but the proof doesn't note why. The key fact (which I verified but the proof elides): if Prolonger plays prime pp
p and also plays a composite CC
C with p∣Cp\mid C
p∣C, that violates antichain, so p∈B⇒p∉Ap\in B \Rightarrow p\notin A
p∈B⇒p∈/A. This forces Prolonger's primes to be outside BB
B, which phase 1 handles. Worth a sentence.

(c) "O(n/log⁡n)O(n/\log n)
O(n/logn) *of her own turns*" vs total game length

The conclusion bounds Shortener turns; the "L(n)=O(n/log⁡n)L(n)=O(n/\log n)
L(n)=O(n/logn)" corollary relies on alternation (TP≤TS+1T_P \le T_S+1
TP≤TS+1) plus ∣Sy∣=O(n/log⁡n)|\mathcal{S}_y|=O(n/\log n)
∣Sy∣=O(n/logn) for post-resolution. This step is trivial but unstated.

(d) Scope claim
"Includes the universal block-product counter" is correct, but the brief's obstruction list flags *multiple* structural issues: block-products, RyR_y
Ry rough-integer tails, the e−1e^{-1}
e−1 polynomial-shield barrier. Theorem 5 closes only one of these (and only for Prolonger strategies that happen to satisfy disjoint supports). The bottom-line claim that "the block-product obstruction is not the real barrier" — moving the open question to overlapping carriers + blocked large primes — is a reasonable summary of where this proof leaves things, but it rests on the informal phase-4 count not closing. The actual theorem doesn't prove that the remaining gap has the log⁡log⁡n\log\log n
loglogn shape Pro suggests; that's conjecture.

What I'd ask Pro to tighten before calling it done

Explicit online strategy statement with a priority invariant, and a lemma that each new Prolonger composite requires at most (one phase-2 obligation per prime it introduces) + (linear-in-∣B∣|B|
∣B∣ new phase-3 obligations).

Formal handling of Prolonger's prime moves — the "Prolonger's primes are outside BB
B" fact needs one line.

The hypothesis needs to be stated as "at the end of the game, Prolonger's composite moves have disjoint supports" or "at every moment, the composites played so far have disjoint supports" — these are equivalent here but the distinction matters for the online argument.
Consider whether the claim "C(p)=raC(p) = r^a
C(p)=ra is a pure prime power" case actually arises under disjoint-support Prolonger play against this strategy: if Prolonger plays rar^a
ra, the support is {r}\{r\}
{r}, so rr
r becomes a single-prime carrier. Phase-2 skips it (condition is "≥2\ge 2
≥2 distinct primes"). The resolution case handles it via "x=rbx=r^b
x=rb comparable with rar^a
ra." All good — but this is a slightly different argument than the ≥2\ge 2
≥2-primes case and deserves to not be buried in a bullet.


Net assessment. The theorem is real, the proof is essentially sound, and the overlapping-carrier + blocked-large-prime gap is the correct place to push next. The three items I'd describe as "unclear steps" are (a), (b), (c) above; none of them refute the result, but they are places where a careful referee would push back before accepting.
