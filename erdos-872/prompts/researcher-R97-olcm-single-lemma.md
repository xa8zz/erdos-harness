Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full proof or disproof of the inequality stated at the end.

## Setup

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the number of moves; Shortener minimizes it; \(L(n)\) is the optimal length.

Fix a cap parameter \(H\to\infty\) and the lift primes \(\mathcal P_H=\{p\ \text{prime}:H<p\le2H\}\), \(E_H=|\mathcal P_H|\asymp H/\log H\). For a currently legal integer \(f\) (a face) and \(p\in\mathcal P_H\) with \(p\nmid f\), the integer \(fp\) is a lift of \(f\).

## Established facts (complete elementary proofs exist; take them as given)

1. Trace normal form: if an earlier actual move \(a\) makes the lift \(fp\) illegal while \(f\) remains legal, and \(a\) is neither a multiple of \(fp\) nor comparable with \(f\), then \(a=pd\) with \(d\mid f\); call \(d\) the trace. One actual move cannot destroy two distinct prime lifts of the same legal face (it would divide \(\gcd(fp,fq)=f\)). Every collection of traces incident to one face \(f\) has least common multiple dividing \(f\).
2. Low-lcm energy lemma: for faces in a dyadic interval \((Y,2Y]\) and any collection \(\mathcal I\) of spoiler atoms \(\alpha=(a_\alpha,p_\alpha,d_\alpha)\), let \(\mathcal E_E\) be the faces incident to at least \(E\) atoms with distinct lift primes. Then for every \(s\le E\): \(|\mathcal E_E|\binom Es\le 2Y\,\Lambda_s(\mathcal I)\), where \(\Lambda_s(\mathcal I)=\sum 1/\operatorname{lcm}(d_\alpha:\alpha\in J)\) over \(s\)-subsets \(J\) with distinct lift primes. Proof: double count pairs \((f,J)\); each admissible \(J\) has \(\operatorname{lcm}\mid f\), and \((Y,2Y]\) has at most \(2Y/D\) multiples of \(D\).
3. Sharpness of raw multiplicity: with \(m=\lfloor cH/\log H\rfloor\), distinct primes \(p_t\in(H,2H]\) and \(r_t\in(H^2,2H^2]\), \(R=\prod r_t\) (so \(\log R=(2c+o(1))H\)), and \(\mathcal F=\{gRb: B<b\le2B\}\) with \(B=Y/(gR)\to\infty\) and \(b\) coprime to \(gR\prod p_t\): the ordered decreasing-product spoilers \(a_t=r_tp_t\) are pairwise incomparable legal moves, each killing the \(p_t\)-lift of every face in \(\mathcal F\) while leaving all faces legal, and \(|\mathcal F|\gg Y/R\). So one spoiler can hit arbitrarily many active faces (no bound by any function of \(H\) alone), but all affected faces are multiples of \(R\), giving \(|\mathcal F|\le 2Y/R=Y e^{-(2c+o(1))H}\): maximal raw multiplicity forces exponentially small shell density. Only lcm-weighted statements can be true.
4. Frozen repair results: for a FIXED (frozen) residual clutter, a single middle-rank cross-spoiler admits a product-escalating repair of normalized reciprocal weight at most \(2/q_1\); diagonal semiprime matchings admit logarithmic coded repairs via a covering-array lemma; within one full rank-\(r\) divisor cube, common-core splitting costs at most \(\binom r{\lfloor r/2\rfloor}\) carrier moves in total. These control each frozen snapshot; they do not control how often the repair must change as new spoilers arrive. A later minimum-product spoiler can be a previously unused divisor of the CURRENT lcm, reusing a low-lcm shadow without growing it.
5. Consequences (proved reductions, both directions): if (OLCM) below holds uniformly under the actual maximum-degree/coded-repair Shortener policy, then all but \(o(Y)\) faces per shell escape full lift exhaustion, the online-area machinery applies, and \(L(n)=o(n)\). If Prolonger can FORCE \(|\mathcal E_{E_H}|\gg Y\) throughout \(t\asymp X/H\) rounds against arbitrary replies (exact opposing plays scored, not free), then \(L(n)\gg n/H\). The current unconditional bracket is \(c_\delta n(\log\log n)^2/\log n\le L(n)\le(0.1897123371+o(1))n\).

## Question

Prove or disprove the shell-stable low-lcm energy estimate (OLCM): there is \(s=s(H)\le E_H\) such that
\[
\Lambda_s(\mathcal I_T)=o\!\left(\binom{E_H}{s}\right)
\]
uniformly over every stopping time \(T\), every dyadic shell, and every history generated against the actual maximum-degree/coded-repair Shortener policy — equivalently, a hereditary bounded-recourse decomposition: trace incidences are assigned permanently to packets so that packets inside a fixed low-lcm divisor cube are handled by the frozen repairs, any incidence that cannot join an existing packet grows the packet lcm enough to pay \(O(Y/D)\) for all faces carrying it, and a later minimum-product edge can never re-expose a previously charged shadow.

A proof yields \(L(n)=o(n)\). A disproof must exhibit a FORCEABLE positive-density violation — an adaptive Prolonger scheme keeping \(\Lambda_s\) of full order against every legal reply sequence, not one cooperative history — and yields \(L(n)\gg n/H\). Either outcome decides the direction of the game at this cap scale; do not force one. If neither is reached, state precisely the single sub-step that cannot be closed.

REMEMBER - this argument may require non-trivial, creative and novel elements.
