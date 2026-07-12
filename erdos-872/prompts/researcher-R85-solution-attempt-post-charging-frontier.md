Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the problem.

## Problem

For (n\ge 2), two players alternately choose previously unchosen integers from 
\(\{2,3,\ldots,n\}\), always keeping the chosen set an antichain under divisibility. The game ends when the antichain is maximal. Prolonger moves first and maximizes the final cardinality; Shortener minimizes it. Let (L(n)) be the value under optimal play.

Determine (L(n)) asymptotically. In particular, decide whether (L(n)=\Theta(n)) or (L(n)=o(n)). A valid answer must be an unconditional proof; a conditional strategy or a finite computation alone is not sufficient.

## Known progress

Manuscript excerpts appended after the prompt (notation, lower-bound section, and the deferred-proofs appendix, in LaTeX) contain complete proofs of the first block of results below; a further appended note contains complete elementary proofs of the fractional-invariant results, which are recent and not yet independently verified.

- Shortener can force
  \[
  L(n)\le \left(\frac{W_4}{2}+o(1)\right)n,
  \qquad \frac{W_4}{2}\le 0.1897123371<0.19.
  \]
  Here \(\rho(u)=1/((\lfloor1/u\rfloor+1)u)\),
  \(J_r=(1/r!)\int_{u_1+\cdots+u_r\le1}\prod_i\rho(u_i)\,du_i\), and
  \(W_4=1-J_1+J_2-J_3+J_4\). The strategy is a prefix of the smallest legal odd primes. A local prime-packet count gives the lower profile \(\rho\); a monotone cumulative envelope and generalized inverse produce a comparison sequence; prime rounding preserves its first four factorial moments; fourth-order Bonferroni applied to the odd-part compression gives the displayed bound.

- Prolonger can force, for every fixed \(0<\delta<1/4\),
  \[
  L(n)\ge c_\delta\,\frac{n(\log\log n)^2}{\log n}.
  \]
  Targets are \(acb\in(n/2,n]\) with distinct primes \(a,c\le n^\delta\) and \(b\) a suitable large prime; their initial mass is \(W_0\gg_\delta n(\log\log n)^2/\log n\). Phase 1 (weighted activation): each live small-prime pair \(e=(a,c)\) with remaining target weight \(w_e\) gets coefficient \(\phi(e)=2^{|e\cap C|-3}w_e\), where \(C\) is the set of endpoints already captured; comparing the largest uncaptured weighted vertex star \(H\) against the largest single live-edge coefficient \(K\) yields a move whose bank gain dominates both modeled replies (deleting an uncaptured vertex; deleting a live pair edge). The bank counts actual moves by both players, secured target mass \(M\), and remaining fractional coefficients, giving \(T_{\rm act}+M\ge W_0/8-E\) with \(T_{\rm act}=o(W_0)\) and \(E=o(W_0)\) (off-model target losses are charged to a deletion budget), hence \(M\gg_\delta n(\log\log n)^2/\log n\). Phase 2 (exact-move residual): surviving targets are grouped by large prime \(q\) into fibers, pessimistically reset to unactivated shadow states with potential
  \[
  \Psi_{\rm res}=T_{\rm res}+\frac18\sum_{q\ \text{unactivated}}|E_q|+\sum_{q\ \text{activated},\ e\in E_q}2^{c_q(e)-2},
  \]
  where \(T_{\rm res}\) counts exact targets played by either player. Playing the target meeting the largest common-slot or side-star threat covers every direct slot reply; an exact target played by the minimizing player has coefficient at most one while incrementing \(T_{\rm res}\), so it cannot decrease the bank. Conclusion: \(T_{\rm res}\ge M/8\). The accounting is essential: in a variant auxiliary game where an exact target may be deleted without being scored, finite fiber computations show every first activation edge loses potential, so the counted exact move is exactly what rescues the bound.

- Fractional residual invariant (complete elementary proof appended; not yet independently verified). For the antichain \(A\) already played, let \(U(A)\) be the legal upper-half integers and \(D(A)\) the legal lower-half integers, and let
  \[
  \nu(A):=\max\Big\{\sum_{u\in U(A)}z_u\ :\ 0\le z_u\le1,\ \ \sum_{u\in U(A),\,d\mid u}z_u\le1\ \ \forall d\in D(A)\Big\}.
  \]
  Then for every legal move \(m\), \(\nu(A\cup\{m\})\ge\nu(A)-1\): an upper move removes one variable of mass at most one, and a lower move \(m\) removes variables of total mass at most one by \(m\)'s own packing constraint. Hence \(T+\nu(A)\) is nondecreasing throughout the game, and from any reachable state every continuation to a terminal position has at least \(\nu(A)\) further moves. The dual expresses \(\nu(A)\) as the minimum fractional cost of covering the live upper half by legal lower shadows and upper singletons. Initially \(\nu(\varnothing)\ge\pi(n)-\pi(n/2)\). Consequence: a Prolonger strategy forcing any reachable state with \(\nu(A)\ge cn\) would prove \(L(n)=\Theta(n)\).

- Exact-only targets are rare after a sublinear prefix (complete elementary proof appended; not yet independently verified). For any set \(P\) of \(k=o(n)\) played integers, the number of live upper-half targets all of whose proper divisors are already illegal is
  \[
  \ll \frac{n}{\log z}+kz^2+e^{O(z)}=o(n)
  \]
  for \(z\to\infty\) slowly. Proof mechanism: for a live target \(m\) with small prime factor \(p\le z\), the divisor \(d=m/p\) must divide a played carrier \(c=de\) with \(e<2p\), and \((c,e,p)\) determines \(m\); integers free of prime factors up to \(z\) are counted by Mertens. Consequence: after any sublinear number of moves, almost every live upper-half target still has a legal proper divisor. This supplies divisor abundance but not shared kills: it does not bound how many targets one legal divisor resolves.

- Put \(U_n=(n/2,n]\cap\mathbb Z\), \(L_n=[2,n/2]\cap\mathbb Z\), \(M_n(x)=\{u\in U_n:x\mid u\}\), and \(w_n(x)=|M_n(x)|-1\). For \(P\subseteq U_n\), let \(\mathcal L_n(P)=\{x\in L_n:x\nmid u\text{ for every }u\in P\}\) and
  \[
  \beta_n(P)=\max\left\{\sum_{x\in B}w_n(x):B\subseteq\mathcal L_n(P)\text{ is a divisibility antichain}\right\}.
  \]
  If \(A\) is any terminal antichain and \(P\subseteq A\cap U_n\), then \(|A|\ge |U_n|-\beta_n(P)\). Moreover, uniformly for every \(|P|\le n^\alpha\) with fixed \(0<\alpha<1\),
  \[
  \beta_n(P)\ge \left(\frac12\log\frac1\alpha-o(1)\right)n.
  \]
  Thus any linear lower bound obtained solely by a short upper-half shield prefix and this weighted-shadow reduction requires a polynomially long prefix.

- The minimum size of a set \(C\subseteq U_n\) such that every \(x\in L_n\) divides some \(u\in C\) is
  \[
  \tau(n)=\frac{5}{24}n+O(1).
  \]
  An optimal cover is given, up to endpoints, by upper-half integers congruent to \(2\pmod4\), together with those greater than \(2n/3\) and congruent to \(0\pmod4\); a matching lower-half witness packing proves optimality.

- In the weighted quotient model where targets are mutually incomparable objects \(X_d\), \(2\le d\le t\), with weight \(1/d\), Prolonger preserves a positive fraction of the harmonic mass against any opponent who covers only by primes. However, cross-batch semiprime covers reduce the same batching strategy's surviving mass to \(O((\log\log t)^2)=o(\log t)\), and a static semiprime obstruction is itself insufficient because one mixed carrier can preempt many cross-pairs at once.

- Reported exhaustive computation (alpha-beta; not re-derived here): optimal game lengths are known for all \(n\le 120\) and grow weakly monotonically. For \(105\le n\le 164\) the minimizing player's optimal first move is 2 or 3, equi-optimally, and every other first move is strictly worse. At \(n=85\) the optimal length is 32 while the cooperative extremes are \(\pi(85)=23\) and \(\lceil85/2\rceil=43\), so optimal play is not the arithmetic mean of the cooperative extremes.

- Uniformly over positions with \(|A|=o(n)\): almost every live upper-half target has an unboundedly growing number of legal prime-removal divisors \(u/p\) (all but \(2kz^2+C2^r(n/\sqrt{\log z}+(3/2)^{\pi(z)})\) targets have at least \(r\) of them); consequently \(\nu(A)=o(n)\) uniformly, and there is a static legal antichain of \(o(n)\) lower moves covering all but \(o(n)\) of the live upper half. At any such position with a linear live reservoir, some legal lower move kills at least \((2\eta-o(1))r(n)\) live targets, \(r(n)\to\infty\). (Complete proofs appended.)

- Static sublinear completion: for any primitive \(P\) with \(|P|=o(n)\), the minimal legal elements \(\mathcal M(P)\) number \(o(n)\) and \(P\cup\mathcal M(P)\) is a maximal primitive set. Smooth/rough trapping: with \(y=\tfrac14\log n\), the minimizing player can in \(o(n)\) actual moves reach a position where every live \(m\) has its \(y\)-smooth part dividing one played carrier and its \(y\)-rough part dividing another. (Complete proofs appended.)

## What does not work, and why it fails

- A static carrier-capacity inequality of the form \(\sum_{p\in B(P)}1/p\le C(\varepsilon)\) for every upper-half antichain \(P\) of size \(\varepsilon n\) is false. For \(0<\varepsilon<1/4\), take \(P\) to be \(\lfloor\varepsilon n\rfloor\) consecutive integers in \((n/2,n]\). Every prime \(p\le |P|\) divides some member of the block, so the reciprocal mass is at least \(\sum_{p\le\varepsilon n}1/p=\log\log n+O(1)\). Excluding any fixed finite set of primes does not help: use a progression with step equal to their product.

- A separator-only closure with a finite family \(S_n\subseteq[2,n/2]\) of odd separators cannot prove a sublinear upper bound when \(|S_n|=o(r_1(n))\), \(r_1(n)=n(\log\log n)^2/\log n\), and the distinct odd prime divisors of \(S_n\) have reciprocal sum \(o(1)\). Whenever \(s\in S_n\) is legal, Prolonger legally plays its maximal dyadic lift \(2^a s\in U_n\), permanently killing \(s\). After \(o(r_1(n))\) moves all separators are dead, while a union bound over their prime divisors leaves \(n/2-o(n)\) upper-half integers legal. Any successful separator method must therefore control dyadic lifts or use moves outside that restricted separator layer.

- A static-to-dynamic charging step cannot replace the sum of full certificate shadows by the mass newly killed online without an injective or disjoint charging lemma. Distinct shields may have the same extracted coface before that coface is resolved, so \(\sum_D\nu(C(D))\) can repeatedly count one static shadow even though \(\sum_t\mu_t(u_t)\) counts only newly unresolved mass. Marking repeated certificates stale in bookkeeping does not bound the actual remaining game state. The dual of the fractional invariant above fails to give an upper bound for exactly this reason: a fractional cover element can later be preempted by a carrier, and recomputing covers does not produce an injective accounting of actual moves.

- A bounded-level set-cover or Sherali--Adams relaxation cannot by itself control the required online transversals. For an \(\ell\)-uniform family on an \(N\)-point set, every level \(r<\ell\) has a feasible product-Bernoulli solution of value at most \(N/(\ell-r)\), while sparse covering-design families can have integral transversal number greater than \(\alpha N\). Thus a proof must exploit divisibility structure or genuinely online information absent from the generic relaxation.

- Bounding the raw reachable closure of a fixed-rank sweep is not a sufficient policy-free route to sublinearity. At the central rank there is a fully legal sweep history with linear raw closure: a consecutive block of \(T\) upper-half Prolonger moves covers every divisor \(d\le T\) and is compatible with \(T\) harmless upper-half rank-\(q\) opponent moves. At rank one, Prolonger defeats every prime-sweep policy by batching many unclassified small primes into one carrier; the sweep primes then have reciprocal sum at most \(\log(3\sqrt3/2)+o(1)<1\), so a positive fraction of the upper half avoids them and remains a linear live antichain. No prime-only sweep, even with adaptive choice, can prove sublinearity; a fixed-rank strategy must specify an actively interdicting ordering and control the live closure intersected with the incomparability set of the actual prefix, not the raw closure.

- No rank-independent constant-fraction residual capture theorem exists for generic scored systems. For every \(r\ge1\), the \(r\)-subsets of an \((r+1)\)-set form a scored rank-\(r\) residual hypergraph with \(r+1\) edges in which the maximizing player can force only one scored edge: after the first scored edge, the minimizer deletes the single uncaptured vertex, which lies in every remaining edge. Hence generic capture guarantees at most a \(1/(r+1)\) fraction, and at central rank \(r\asymp\log\log n\) leaves only an \(O(1/\log\log n)\) fraction. Any linearity route through high-rank target systems must exploit arithmetic structure beyond generic scored capture.

- Forcing \(\nu(A)\ge cn\) at sublinear time is impossible: \(T+\nu(A)=o(n)\) whenever \(T=o(n)\), so the fractional invariant cannot certify a linear game length from any sublinear setup. Any \(\Theta(n)\) proof must produce actual moves directly.

- Pointwise unbounded interdiction does not self-bootstrap to \(L(n)=o(n)\): the rigorous degree guarantee at horizon \(|A|\asymp n/H\) is \(r=O(\log\log H)\) per turn, totalling \(o(n)\). Sparse static covers exist at every sublinear position but are preempted online: one mixed carrier can make many pairwise-incomparable cover elements illegal at once without being comparable with the targets they covered, and \(t\) semiprime carriers \(p_iq_i\) regenerate \(t(t-1)\) minimal legal cross-products \(p_iq_j\). The missing step on the sublinear side is exactly a bounded-multiplicity online charge organizing divisor stars into \(O(|A|+o(n))\) certificates.

- Higher-order Bonferroni on the existing smallest-odd-primes comparison profile cannot yield \(o(n)\): the alternating series satisfies \(W_\infty\ge1-J_1>0\), numerically \(W_\infty/2\approx0.18969\).

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.

<!-- Dispatched 2026-07-11 with manuscript files (02,04,appendix-A at commit 018a346) plus the R78, R80, R81 response bodies appended verbatim as notes 1-3. -->
