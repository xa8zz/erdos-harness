Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the single statement (CL) in the Problem section.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Prove or disprove the cumulative minimal-layer statement (CL): there exists \(H=H(n)\to\infty\) and a Shortener sweep policy such that, against every Prolonger strategy, the peeling sweeps satisfy \(\sum_{\ell<\lceil\log_2 H\rceil}|M_\ell|=o(n)\), where \(M_\ell\) is the minimal legal layer at the start of sweep \(\ell\).

Context on both directions, established (see the attached verbatim analysis for the exact framework, and the facts sections below): the one-sweep containment theorem bounds the sum by \(|M_0|+|\operatorname{Sh}^-(K_0)|\), but the raw-shadow route is closed — for every \(H\) there are obtainable positions where every ordering concedes a linear raw shadow (construction attached verbatim below). However the raw shadow over-counts: the very carriers creating the advance-kills may make much of that shadow illegal. So (CL) hinges on SURVIVING descendant mass, and the attached analyses sharpen this further: a linear part of the shadow provably remains LEGAL through the first sweep (carrier self-destruction is not a viable proof mechanism), yet within the known construction the exposed next minimal layer is only o(n) because cone structure compresses legal mass into few minima (quotient divisibility: new minima are prime multiples). A proof of (CL) must show this compression persists across sweeps under repeated regeneration, for a well-specified sweep policy; a disproof must build a position where linear legal mass is exposed through linearly many successive minimal layers against every sweep order. Resolve (CL) in either direction with a complete proof.

## Known progress

Complete proofs exist for all items; take them as given. Notation: for a position \(A\), \(U_n=(n/2,n]\), \(L_n=[2,n/2]\); \(R(A)\subseteq U_n\) and \(D(A)\subseteq L_n\) are the integers still legal relative to \(A\); \(\deg_A(d)=\#\{u\in R(A):d\mid u\}\), \(\Delta(A)=\max_d\deg_A(d)\).

- Bounds: \(c_\delta\,n(\log\log n)^2/\log n\le L(n)\le(0.1897123371+o(1))n\), both by explicit strategies.
- Static completion: any primitive \(P\) with \(|P|=o(n)\) has \(o(n)\) minimal legal elements \(\mathcal M(P)\), and \(P\cup\mathcal M(P)\) is a maximal primitive set. So sublinear positions are always completable at sublinear cost.
- Fractional relaxation: the LP packing value \(\nu(A)\) (maximize mass on \(R(A)\), every \(d\in D(A)\) seeing mass at most one) is \(o(n)\) uniformly over \(|A|=o(n)\), and there is a static legal antichain \(B\subseteq D(A)\), \(|B|=o(n)\), covering all but \(o(n)\) of \(R(A)\).
- Smooth/rough trapping: with \(y=\tfrac14\log n\), Shortener can in \(o(n)\) actual moves reach a position where every live \(m\) has its \(y\)-smooth part dividing one played carrier and its \(y\)-rough part dividing another.
- Degree availability: at any position with \(|A|=o(n)\) and \(|R(A)|\ge\eta n\), some legal lower move kills at least \((2\eta-o(1))r(n)\) live targets with \(r(n)\to\infty\) (\(\log\log\) scale).
- Exact-only bank: along any play with \(t\) actual moves, the number of targets that ever become exact-only is \(o(n)+t\) (each exact-only target, when played, is itself an actual move).
- Online-area sufficiency: \(L(n)=o(n)\) follows from one shell statement (OA) — there is \(h(n)\to\infty\) such that after the trapping sweep, uniformly over dyadic shells \(S_X=(X/2,X]\), the live non-minimal shell population \(Q_X\) satisfies \(|Q_X(\mathrm{end})|\le\tfrac12|Q_X(\mathrm{start})|+X/h(n)^2\) per processing block under the actual maximum-degree Shortener policy (direct maximum-degree kills, helpful opposing moves, and transfers into the minimal legal set all permitted). Proof of the implication: apply (OA) \(O(\log h)\) times per shell, \(O(X\log h/h)\) Shortener turns per shell, geometric summation over shells, then static completion.
- Absorbing fortress: once a primorial-batched position with degree cap \(\Delta_Q\le H\) and a linear trapped reservoir is reached, it is stable against arbitrary play — blocked small divisors remain illegal forever, the cap is monotone along every continuation, and the remaining game value is at least \(|E(A)|+|Q(A)|/H\) (exact-only targets are banked actual moves). Hence entry into such a position at threshold \(H=(\log n)^{o(1)}\) would give \(L(n)\ge n^{1-o(1)}\); no post-entry maintenance theorem is missing — only robust entry is open.
- Fresh-batch persistence: let \(W_r=\binom{r}{\lfloor r/2\rfloor}\). If at the moment a rank-\(r\) primorial batch is activated every legal face of the cube has at least \(2W_r+1\) currently legal prime lifts, Prolonger clears the batch in at most \(W_r\) carrier moves against arbitrary subsequent replies (inclusion-maximal face selection; the selected faces form an antichain; Sperner). So interference after activation is harmless; a batch can fail only by advance depletion before it is first touched.
- Exhaustion cost: exhausting every prime lift of one currently legal face requires \(\Omega(H/\log H)\) distinct earlier moves; within one full rank-\(r\) divisor cube, dynamic common-core splitting costs at most \(W_r\) carrier moves in total.
- All-orders witness inequality: if \(\mathcal F\) is a family of distinct advance-depleted face cores in one shell, each with at least \(q\) blocked lift tags, and the earlier harmful moves are \(a_i=e_ip_i\), then for every \(s\le q\): \(|\mathcal F|\binom qs\le\sum N_{\mathcal F}(\operatorname{lcm}_{i\in I}e_i)\), summed over \(s\)-subsets \(I\) with distinct tags, where \(N_{\mathcal F}(\ell)=\#\{d\in\mathcal F:\ell\mid d\}\). Tuples with lcm above \(Z\) contribute at most \((2X/Z)\binom ts\), so only low-lcm witness tuples matter.
- Refinement-forest constraint: any history in which a linear target set survives \(t\asymp X/h\) rounds with accumulated maximum-degree area \(\sum_{i<t}\Delta_i=o(X)\) must maintain \(\omega(t)\) simultaneously active minimal-root classes, all created by paid successive refinements from \(O(t)\) ancestral classes with the sum of largest ancestral class sizes \(o(X)\).
- Sandbox evidence (finite boards, not asymptotic proof): greedy entry policies at \(n\) up to \(8000\) reach capped positions retaining a visibly linear reservoir with cumulative maximum-degree area about \((0.16\text{–}0.20)n\); shell-local carrier-greedy searches at \(X=500\ldots2000\) keep cumulative area near \(0.45X\) with half the shell live afterward. Low-area persistence is empirically favored at these sizes.

## What does not work, and why it fails

- Fixed-budget charging \(|R(A)|\le b(n)+C(|A|+b(n))\Delta(A)\), for any \(b(n)=o(n)\): disproved by two independent mechanisms. (i) Face-carrier diagonalization: reachable positions with \(|R(A)|\gg b(n)\), exactly one legal lower move, and \(\Delta(A)=0\); also kills every dyadic-shell analogue with a fixed \(o(n)\) exceptional allowance. (ii) Primorial batching: reachable positions with \(|R(A)|=(\tfrac12-o(1))n\), \(\Delta(A)\le H\) slowly growing, and \((|A|+b(n))H=o(n)\) — a sublinear family of upper-half primorial-batched carriers makes every lower integer up to \(n/H\) illegal without killing any upper target.
- Every current-state charge of live targets to individual earlier moves with capacity \(O(\Delta)\) per move: fails on the primorial-batched endpoint (linear reservoir, capped degree, sublinear cost, essentially no exact-only targets). The relevant dynamic quantity is the accumulated area \(\sum_{i<t}\Delta_i\), not the endpoint product \(t\Delta_t\).
- Static \(s\)-th-moment estimates for advance depletion, any fixed or growing \(s\): one shared witness core (\(e_i=e\) for one witness in every tag) makes every \(s\)-tuple have lcm \(=e\), contributing \(N(e)\binom qs\) at once; \(N(e)\) can be linear while the current degree stays capped. Only chronology-sensitive arguments can work.
- Promoting instantaneous incidence bounds to lifetime capacities: at any instant one opposing move \(c\) meets at most \(B_r\tau(c)\) active faces (\(B_r=\binom r{\lfloor r/2\rfloor}\), Sperner over at most \(\tau(c)\) cores), but across an adaptive refinement history the same \(c\) is inherited by up to \(2^r\) sequentially revealed core-signature pairs per core. Realized legally at \(n=4000\), \(c=30\): lifetime multiplicity \(128\) versus instantaneous cap \(48\), on a verified 258-move antichain history. Any temporal capacity claim requires a historical no-repetition invariant for the splitting process; none is known.
- Pointwise degree growth alone: \(r(n)=O(\log\log H)\) fresh kills per turn at horizon \(|A|\asymp n/H\) totals \(o(n)\); maximum degree tending to infinity does not self-bootstrap into a sublinear game bound.
- LP or covering certificates for linear length: \(\nu(A)=o(n)\) uniformly, so no fractional packing bound can force \(L(n)=\Omega(n)\).
- Persistence or entry theorems at growing cap \(H(n)\to\infty\) as a resolution: entry gives only \(L(n)\ge n^{1-o(1)}\) (refutes (OA), does not prove \(\Omega(n)\) — that needs \(H=O(1)\) or an amplification converting \(n/H(n)\) to \(cn\)). Separately, histories beating the maximum-degree or minimal-legal Shortener policies do not lower-bound the game: neither policy is proved dominant, so a lower bound must handle arbitrary replies.
- Frozen repair theorems without chronology: coded and product-escalating repairs solve frozen blocker configurations (a single middle-rank cross-spoiler has a product-escalating repair of normalized reciprocal weight at most \(2/q_1\); diagonal semiprime matchings admit logarithmic coded repairs via a covering-array lemma), but one later minimum-product edge can join low-lcm witness tuples of many already-repaired structures simultaneously — a jump of \(N(e)\binom{q-1}{s-1}\) from one reply. The missing Lipschitz property of the optimal repair potential under chronological edge insertion is exactly what frozen results do not supply.

- Trace normal form and energy lemma: a residual spoiler killing lift \(fp\) of a still-legal face \(f\) has the form \(a=pd\), \(d\mid f\) (the trace); one actual move cannot destroy two distinct prime lifts of the same legal face; traces incident to one face have lcm dividing it. Hence for faces in \((Y,2Y]\) with at least \(E\) blocked tags of distinct lift primes: \(|\mathcal E_E|\binom Es\le 2Y\sum 1/\operatorname{lcm}(\text{traces})\) over distinct-tag witness \(s\)-tuples; high-lcm tuples contribute at most \((2X/Z)\binom ts\).
- Atomic ledger: pre-registering all core-signature faces as latent objects gives a genuine lifetime bound — faces whose blocker record ever contains \(c\) number at most \(2^r\tau(c)\) — for the channel oriented by \(\kappa(F)\mid c\). Direct ancestors (\(c\mid a_F\)) escape every \(M\cdot\tau(c)\) bound: one move can erase whole lift families of \(H^{\Omega(1)}\) unmergeable faces with \(\tau(c)\) constant.
- Canonical cube partition (audit-verified): writing \(d=c(d)\prod_{j\in S(d)}\ell_j\) with all \(\ell_j\)-valuations of \(c(d)\) even partitions the integers into rank-\(r\) cubes; a face integer belongs to exactly one cube forever; first deaths of lift slots are irreversible actual-state events.
- Layer peeling: Shortener can make every integer up to \(n/H\) illegal in at most \(n/H\) moves (legality is monotone); after this peel, \(L(n)=o(n)\) reduces to the growing-depth uniformity statement that the total minimal-legal-layer mass \(\sum_{j<\log_2H}|\mathcal M(A_j)|\) along the induced sweep is \(o(n)\) for some \(H\to\infty\) — the fixed-prefix static-completion theorem gives each layer \(o(n)\) but does not iterate across growing depth.
- Policy sensitivity is load-bearing: against the LITERAL maximum-degree policy, the anchor \(B_H=\operatorname{lcm}(2,\ldots,H)\) followed by playing lift primes \(p\in(H,2H]\) (provably never preemptable by a max-degree reply) exhausts \((1-o(1))\) of a shell's faces at trace 1 within \(O(H/\log H)\) moves; but one legal batch blocker \(\prod_{H<p\le2H}p\le n^{1/12}\) kills every lift prime at once at face-density cost \(e^{-\Theta(H)}\). Any upper-bound strategy must specify its policy including such batch moves; any lower bound must survive them.

## Additional approaches that do not work, and why

- Raw all-witness low-lcm sums: inflated by redundant re-witnessing of dead lifts — a semiprime grid \(a_jp_i\) (\(R\) ancestors, \(q\) tags) produces \(R^s\) witness tuples from \(Rq\) actual moves; no inequality linear in the move bank controls the raw count.
- First-witness tuples indexed by MOVE indices: ill-defined — one move can first-witness different tags with different traces for different faces (move \(35=5\cdot7\): face \(77\) at tag \(5\) with trace \(7\), face \(65\) at tag \(7\) with trace \(5\)); any valid normalization must be indexed by face-tag pairs and carry a no-reuse statement that survives later batches.
- Globalizing per-snapshot pairwise cross-carrier cleanups to chronological injectivity: not free; the accepted results are per-snapshot only.
- Using Prolonger-side clearing theorems (fresh-batch persistence) inside a Shortener upper-bound strategy: player-quantifier reversal; the theorem's mover is Prolonger and a Shortener strategy cannot schedule those moves.
- Iterating fixed-prefix static completion across \(\log_2H\) growing-depth minimal layers: a growing-depth uniformity problem the theorem does not cover; quadratic regeneration (\(t\) incomparable semiprime carriers leave \(t(t-1)\) minimal legal cross-products) is the known inflation mechanism.
- Random-witness repairs: unavoidable \(2^r/\binom r{\lfloor r/2\rfloor}\asymp\sqrt r\) temporal loss.

## Additional established facts (proofs verified; take as given)

- Continuation lemma: if every integer legal at a position \(A\) exceeds \(n/H\), and \(C\subseteq\mathcal L(A)\) (the set of integers legal at \(A\)) is such that \(A\cup C\) is a maximal primitive set, then \(|\mathcal L(A)|\le(2H+1)|C|\); consequently every continuation from \(A\), under arbitrary play by both players, lasts at most \((2H+1)|C|\) further moves. (Proof: each legal \(x\notin C\) is comparable with some \(c\in C\); a fixed \(c>n/H\) has fewer than \(H\) multiples and at most \(H\) divisors above \(n/H\).)

## Additional ruled-out mechanisms

- Composing the fixed-prefix static-completion theorem with the \(n/H\)-move peel: by the continuation lemma the peel route needs the strengthening \(|C|=o(n/H)\) for some maximal completion \(C\) of the post-peel position, not the theorem's \(o(n)\). "Choose \(H\) growing slowly" cannot repair this: a completion-size modulus \(|C|\le n/\log H\) is compatible with \(|C|=o(n)\) for every \(H\to\infty\), yet gives \(H|C|/n\ge H/\log H\to\infty\). Composition of the two little-\(o\) statements is not available.
- Amortizing pointwise degree divergence into linear cleared area: a degree guarantee \(\Delta_t\to\infty\) at horizon \(t=n/H\) is compatible with \(t\,\Delta_t=o(n)\) (e.g. \(\Delta_t\asymp\log\log H\)). In modulus form, with \(\phi_n(\alpha)=\sup\{\nu(A)/n:|A|\le\alpha n\}\to0\), the accumulated direct progress by horizon \(\alpha n\) is (heuristically) \(n\int_0^\alpha ds/\phi_n(s)\), and \(\phi(\alpha)=\sqrt\alpha\) makes it \(o(n)\). Nothing in the accepted facts lower-bounds this integral.

## Further established facts (proofs verified; take as given)

- One-sweep shadow containment: peel in sweeps; in sweep j with minimal layer \(M_j\), call \(m\in M_j\) advance-killed if a proper multiple of \(m\) is played before \(m\) is selected (a minimal element can only be selected exactly or killed upward). Then all later layers satisfy \(\bigcup_{\ell>j}M_\ell\subseteq\operatorname{Sh}^-(K_j)\) (proper-lower-multiple shadow of the advance-killed set), the layers are pairwise disjoint, and \(\sum_{\ell}|M_\ell|\le|M_0|+|\operatorname{Sh}^-(K_0)|\). Hence growing-depth uniformity reduces to one first-sweep statement: can Shortener order \(M_0\) so that \(|\operatorname{Sh}^-(K_0)|=o(n)\) against all legal replies? Roots with at most \(R_n\) proper multiples contribute \(R_n|M_0|=o(n)\), so only roots with \(n/H<m<n/(2(R_n+1))\) matter.
- Prime-product guard: for any NONEMPTY set \(S\) of currently legal primes with \(\prod_{p\in S}p\le n\), the product is itself a legal move. Grouped guard products of size \(g=\lfloor\log n/(20\log 2H)\rfloor\) let Shortener block whole packets of lift primes in \(n^{o(1)}\) turns; the literal trace-1 anchor exploit is thereby neutralized as a universal mechanism.
- Root-indexed first blocker: during a phase where Shortener plays only members of the fixed minimal layer \(C=\mathcal M(A)\), every \(x\) legal at phase end and every root \(c\in C\), \(c\mid x\), has a canonical Prolonger move \(a_c\) (first move making \(c\) illegal) with \(c\mid a_c\) properly, \(a_c\) incomparable to \(x\); per fixed move \(a\): \(\#\{c:a_c=a\}\le\tau(a)\), and \(\le H\) if all legal integers exceed \(n/H\). Iterated: a depth-\(j\) root has \(j\) distinct paid ancestors, giving \(\sum_{j>i}|C_j|\le(H/2^i)^2p_i\) — a genuine lifetime bound, but too weak at small \(i\).

- Fixed-cap fortress entry is impossible (verified twice, independent adversarial audits): for every fixed \(H_0\) and \(c>0\), Shortener prevents any position with degree cap \(\le H_0\) and trapped upper reservoir \(\ge cn\); more strongly, no linear upper reservoir can be robustly entered at any cap \(H(n)=o(r(n))\), \(r(n)\) the degree-availability scale. Mechanism: a fixed-density clearing sweep (max-degree moves clear \(R(A)\) below \(\eta n\) in \(O_\eta(n/r(n))\) moves) is incompatible with the bounded per-move erosion of a capped reservoir (upper moves remove only themselves; an entry-legal lower move divides at most \(H\) reservoir members). A positive-density lower bound therefore requires caps comparable to \(r(n)\) or a non-reservoir mechanism.
- The first-sweep ordered-shadow statement is false (verified twice, independent adversarial audits): for every \(H(n)\to\infty\) there is an obtainable post-peel position such that for EVERY ordering of the first minimal layer \(M_0\), Prolonger has a legal continuation making the raw proper-multiple shadow of the advance-killed set linear (private-carrier drafting: roots with private pairwise-incomparable carriers \(2m\); Prolonger secures half the shadow value regardless of ordering; prime-root + Bonferroni variant for \(H\ge n^{1/4}\)). CRITICAL scope: the one-sweep containment theorem stands, and a linear RAW shadow does not imply linearly many SURVIVING descendants — the carriers creating the advance-kills may destroy much of their own shadow. The cumulative minimal-layer question is open.

## Further ruled-out mechanisms

- Targeted intermediate statements quantified with strategy-dependent \(H\) and a position clause that a terminal position satisfies vacuously: proved EQUIVALENT to the full problem (an optimal Shortener strategy reaches a terminal position in \(<n/H\) moves with \(H=n/(L(n)+1)\), empty completion). Intermediate targets must exclude the degenerate terminal witness.


## Attached analysis 1 (verbatim): the surviving-shadow theorem and cone-compression analysis — a linear part of the shadow remains LEGAL through the first sweep against every ordering, but the next minimal layer within the construction's cones is o(n). An audit (attachment 2, items 1-2) found one gap in its carrier-legality step and supplied the exact repair; treat the theorem as valid WITH that repair.

## Verdict

I do **not** have a valid unconditional proof or disproof of \((\mathrm{CL})\). The accepted facts leave a genuine chronological gap, and claiming either conclusion would require an inference not presently justified.

I can, however, prove a substantially stronger obstruction than the attached raw-shadow construction: for every slowly growing cap \(H<n^{1/4}\), there are obtainable post-peel positions where Prolonger forces **linearly many descendants that are still legal at the end of the first sweep**, against every ordering of \(M_0\). Thus the problem cannot be solved merely by observing that the killing carriers destroy their own raw shadows. What remains unresolved is whether the linear legal reservoir can be exposed through linearly many subsequent minimal layers, rather than compressed by a sublinear covering layer.

The definitions and accepted framework below are those in the uploaded analysis. 

---

# 1. A surviving-shadow theorem

Write

\[
h=H(n),\qquad Y=\left\lfloor\frac nh\right\rfloor,
\qquad N=\left\lfloor\frac n2\right\rfloor.
\]

Assume throughout this section that

\[
h\longrightarrow\infty,
\qquad
h<n^{1/4}.
\tag{1}
\]

## Theorem 1

There is an absolute constant \(\varepsilon>0\) such that, for every \(h\) satisfying (1) and all sufficiently large \(n\), there is an obtainable post-Phase-0 position \(A_0\) with the following property.

For every ordering of the first minimal layer \(M_0\), Prolonger has a legal continuation through the first sweep such that, at its conclusion \(A_1\),

\[
\left|
D(A_1)\cap\operatorname{Sh}^{-}(K_0)
\right|
\ge \varepsilon n.
\tag{2}
\]

Thus a linear part of the shadow not only exists formally: it survives every carrier and every exact move made during the first sweep.

This disproves the possible strengthening

\[
\left|
D(A_1)\cap\operatorname{Sh}^{-}(K_0)
\right|=o(n)
\tag{3}
\]

uniformly over post-peel positions.

---

# 2. The post-peel position

As in the attached construction, take

\[
S_Y=
\left\{
\left\lfloor\frac Y2\right\rfloor+1,\ldots,Y
\right\}.
\]

It is an antichain. Moreover every \(d\le Y\) divides an element of \(S_Y\), so after all members of \(S_Y\) have been selected, every integer at most \(Y\) is illegal. The alternating play required to select \(S_Y\) is legal because its elements are mutually incomparable. A harmless upper-half prime can absorb a parity discrepancy.

Hence we obtain a post-Phase-0 position \(A_0\) satisfying

\[
[2,Y]\cap\mathcal L(A_0)=\varnothing.
\tag{4}
\]

Only this property of \(A_0\) will be used.

---

# 3. Rough roots and almost non-destructive carriers

Let \(\mathcal R\) consist of the \(h\)-rough integers \(m\) in complete dyadic intervals contained in

\[
2Y<m\le\frac n{10},
\qquad
P^{-}(m)>h.
\tag{5}
\]

The same rough-number estimate used in the attached construction gives absolute constants \(\eta,C>0\) such that

\[
\sum_{m\in\mathcal R}\frac1m\ge\eta,
\qquad
|\mathcal R|\le C\frac n{\log h}=o(n).
\tag{6}
\]

Indeed, there are \(\Theta(\log h)\) relevant dyadic intervals, and each contributes \(\gg1/\log h\) to the reciprocal sum.

For \(m\in\mathcal R\), define

\[
K_m=\left\lfloor\frac Nm\right\rfloor.
\tag{7}
\]

Because \(m>2Y\),

\[
K_m<\frac h3
\tag{8}
\]

for large \(n\); because \(m\le n/10\), we also have \(K_m\ge4\).

Choose, by Bertrand’s theorem, a prime

\[
\frac{K_m}{2}<q_m\le K_m,
\tag{9}
\]

and define the carrier

\[
c_m=mq_m.
\tag{10}
\]

The point of placing \(q_m\) in the top half of the multiplier interval is that among \(2,\ldots,K_m\), its only multiple is \(q_m\) itself.

## Lemma 2

For every \(m\in\mathcal R\):

1. \(m\in M_0\);
2. \(c_m\) is legal at \(A_0\);
3. among the roots in \(M_0\), the only divisor of \(c_m\) is \(m\);
4. the carriers \(c_m\) are pairwise incomparable.

### Proof

Every proper divisor \(d\mid m\) satisfies

\[
d\le \frac{m}{P^{-}(m)}
<\frac mh
\le \frac{n}{10h}<Y.
\tag{11}
\]

Thus every proper divisor of \(m\) is illegal by (4). No member of \(S_Y\) divides \(m\), while \(m>Y\) cannot divide a member of \(S_Y\). Hence \(m\) is legal and minimal.

Now consider a proper divisor of \(c_m=mq_m\) other than \(m\). It has the form \(d\) or \(dq_m\), where \(d\mid m\) is proper. Using (7)–(9),

\[
dq_m
\le
\frac{m}{P^{-}(m)}K_m
<
\frac mh\frac Nm
=
\frac Nh
\le\frac Y2+O(1).
\tag{12}
\]

So every such divisor is already illegal. Therefore \(c_m\) is legal, and its only divisor belonging to \(M_0\) is \(m\).

Finally, every prime factor of \(m\) exceeds \(h\), whereas \(q_m<h\). If

\[
m q_m\mid m' q_{m'},
\]

comparison of the prime factors exceeding \(h\) gives \(m\mid m'\). But distinct members of \(\mathcal R\) cannot divide one another: if \(m\mid m'\) properly, then \(m'/m>h\), while from (5),

\[
\frac{m'}m<\frac{n/10}{2n/h}<\frac h{10}.
\]

Thus \(m=m'\), and then \(q_m=q_{m'}\). The carriers are pairwise incomparable. ∎

---

# 4. A whole descendant cone survives each carrier

For \(m\in\mathcal R\), define

\[
\Gamma_m
=
\left\{
mk:2\le k\le K_m,\ k\ne q_m
\right\}.
\tag{13}
\]

Thus

\[
|\Gamma_m|=K_m-2.
\tag{14}
\]

## Lemma 3

Suppose Prolonger plays carriers \(c_m\) for a subfamily \(B\subseteq\mathcal R\), while the other moves during the sweep are exact selections from \(M_0\). At the end of the sweep,

\[
\bigcup_{m\in B}\Gamma_m\subseteq D(A_1).
\tag{15}
\]

Moreover, the sets \(\Gamma_m\) are pairwise disjoint.

### Proof

Fix \(x=mk\in\Gamma_m\).

First compare \(x\) with its own carrier \(c_m=mq_m\). We have

\[
c_m\mid x \iff q_m\mid k.
\]

Since \(q_m>K_m/2\) and \(k\le K_m\), this happens only for \(k=q_m\), which was excluded. Conversely,

\[
x\mid c_m \iff k\mid q_m.
\]

Because \(q_m\) is prime and \(k\ge2\), this again forces \(k=q_m\). Hence \(x\) is incomparable with \(c_m\).

For a different carrier \(c_{m'}=m'q_{m'}\), note that \(k,q_{m'}<h\), while all prime factors of \(m,m'\) exceed \(h\). If \(c_{m'}\mid x\), comparison of the \(>h\) parts gives \(m'\mid m\); if \(x\mid c_{m'}\), it gives \(m\mid m'\). Both are impossible for distinct roots.

It remains to check exact selections from \(M_0\). Suppose \(r\in M_0\) divides \(x=mk\). If \(r\) omits even one prime factor of \(m\), counted with multiplicity, then

\[
r\le \frac{x}{P^{-}(m)}
\le \frac Nh
\le\frac Y2+O(1),
\]

contradicting the legality of \(r\). Therefore \(m\mid r\), say \(r=md\) with \(d\mid k\). If \(d>1\), then the legal integer \(m\) properly divides \(r\), contradicting \(r\in M_0\). Thus \(r=m\), and \(m\) was not selected exactly: it was killed by \(c_m\).

Conversely, if \(x\mid r\in M_0\), then \(m\mid r\); since \(m,r\in M_0\), their incomparability forces \(m=r\), impossible because \(x>m\).

So every exact selection from \(M_0\) other than \(m\) is incomparable with \(x\). This proves (15).

Finally, if

\[
mk=m'k',
\qquad
k,k'<h,
\]

comparison of prime factors exceeding \(h\) gives \(m=m'\), and then \(k=k'\). Hence the cones are disjoint. ∎

The carrier \(c_m\) therefore destroys exactly one point of the lower-half cone of \(m\), namely \(mq_m\), rather than a positive fraction of it.

---

# 5. Prolonger secures linear surviving mass against every order

Assign to \(m\in\mathcal R\) the weight

\[
w(m)=|\Gamma_m|=K_m-2.
\tag{16}
\]

While some member of \(\mathcal R\) remains legal, Prolonger chooses a surviving root of maximum weight and plays its carrier.

The private-carrier property means that each such move kills exactly the chosen root among \(M_0\). Pair every root from \(\mathcal R\) selected exactly by Shortener, except possibly her first one, with the carrier move immediately preceding its selection. At that preceding move the selected root was still available, so the maximum-weight rule chose a root of at least as much weight. Distinct Shortener roots receive distinct partners.

Consequently, if \(B\subseteq\mathcal R\) is the family killed by Prolonger’s carriers, then

\[
\sum_{m\in B}w(m)
\ge
\frac12
\left(
\sum_{m\in\mathcal R}w(m)
-
\max_{m\in\mathcal R}w(m)
\right).
\tag{17}
\]

After no root from \(\mathcal R\) remains, Prolonger may select any remaining legal member of \(M_0\) exactly. Such roots are incomparable with all the survivor cones by Lemma 3, so this finishes the sweep harmlessly.

Using \(K_m\ge N/m-1\), (6) gives

\[
\begin{aligned}
\sum_{m\in\mathcal R}w(m)
&=
\sum_{m\in\mathcal R}(K_m-2)\\
&\ge
N\sum_{m\in\mathcal R}\frac1m
-3|\mathcal R|\\
&\ge
\eta N-o(n)
\ge c n
\end{aligned}
\tag{18}
\]

for an absolute \(c>0\). On the other hand,

\[
\max_m w(m)\le\max_m K_m<h=o(n).
\tag{19}
\]

Combining (17)–(19),

\[
\sum_{m\in B}|\Gamma_m|\ge \varepsilon n
\tag{20}
\]

for some absolute \(\varepsilon>0\). By Lemma 3, all these integers remain legal at the end of the first sweep. They are also proper multiples of advance-killed roots, so they lie in \(\operatorname{Sh}^{-}(K_0)\).

This proves Theorem 1.

---

# 6. Why this still does not disprove \((\mathrm{CL})\)

The obstruction is that **legal mass and minimal-layer mass are radically different quantities**.

Inside a cone \(\Gamma_m\), divisibility is exactly quotient divisibility:

\[
mk\mid mk'
\iff
k\mid k'.
\tag{21}
\]

Moreover, the proof of Lemma 3 shows that every legal divisor of a cone element must itself contain the whole rough root \(m\). Thus, after \(m\) is killed, the next minimal elements in this cone are precisely

\[
mp,
\qquad
p\le K_m\text{ prime},\quad p\ne q_m.
\tag{22}
\]

So a cone with \(K_m-O(1)\) legal elements contributes only approximately \(\pi(K_m)\) elements to \(M_1\).

In fact, grouping the roots according to \(K_m\asymp2^s\), the upper rough-number estimate and \(\pi(x)\ll x/\log x\) give

\[
\begin{aligned}
\left|
M_1\cap\bigcup_{m\in B}\Gamma_m
\right|
&\le
\sum_{m\in\mathcal R}\pi(K_m)\\
&\ll
\frac n{\log h}
\sum_{1\le s\ll\log h}\frac1s\\
&\ll
n\,\frac{\log\log h}{\log h}
=o(n).
\end{aligned}
\tag{23}
\]

Thus the construction exhibits the exact phenomenon that blocks a quick disproof:

\[
\boxed{
\text{linear legal descendant mass}
\quad\text{but}\quad
\text{sublinear next minimal layer}.
}
\]

The later sweeps then operate on the quotient divisibility posets

\[
\{2,\ldots,K_m\},
\qquad K_m\le h.
\tag{24}
\]

Prolonger may again advance-kill prime or composite quotient roots, while Shortener may select a sparse family that covers a large fraction of each cone. Controlling the total number of quotient minima exposed over \(\log h\) rounds is a scaled version of the same chronological problem.

The static-completion theorem is perfectly consistent with (20): the first-sweep position has \(o(n)\) played elements, so its entire linear legal set can be covered by \(o(n)\) current minimal elements. What is unknown is how much that cover regenerates after Prolonger preempts parts of it.

There is also a quantifier issue. The position \(A_0\) above is **obtainable**, but \((\mathrm{CL})\) only concerns the positions actually produced against Shortener’s chosen Phase-0 policy. Therefore an all-depth counterexample at this particular \(A_0\) would still have to be made forceable against that policy.

---

# 7. Why the obvious recursive counterexample loses density

A natural attempted upgrade is a complement cascade. At some stage take active roots

\[
d_1,\ldots,d_q.
\]

After Shortener selects \(d_i\), Prolonger would like one carrier \(a_i\) satisfying

\[
d_j\mid a_i\quad(j\ne i),
\qquad
d_i\nmid a_i.
\tag{25}
\]

It would kill all unselected roots in one move and expose a new generation.

There is a sharp arithmetic cost.

## Lemma 4: private-coordinate cost

If integers \(d_1,\ldots,d_q\) admit carriers satisfying (25), then there are \(q\) distinct primes \(p_1,\ldots,p_q\) such that

\[
v_{p_i}(d_i)>
\max_{j\ne i}v_{p_i}(d_j).
\tag{26}
\]

Consequently every \(a_i\) is at least the product of \(q-1\) distinct primes, and hence

\[
a_i\ge (q-1)^\#,
\tag{27}
\]

where \((q-1)^\#\) denotes the product of the first \(q-1\) primes.

### Proof

Let

\[
L_i=\operatorname{lcm}_{j\ne i}d_j.
\]

By (25), \(L_i\mid a_i\). Since \(d_i\nmid a_i\), necessarily \(d_i\nmid L_i\). Hence some prime \(p_i\) has

\[
v_{p_i}(d_i)>v_{p_i}(L_i)
=
\max_{j\ne i}v_{p_i}(d_j).
\]

A single prime cannot be a strict unique maximum for two different roots, so the primes \(p_i\) are distinct. For \(j\ne i\), \(d_j\mid a_i\), and therefore \(a_i\) contains the private prime \(p_j\). This proves (27). ∎

If one replicates such a \(q\)-root gadget through product-separated cores, the board bound permits at most \(O(n/(q-1)^\#)\) copies, while a \(q\)-stage cascade contributes only \(O(q^2)\) layer elements per copy. Its total contribution is therefore at most

\[
O\left(
n\frac{q^2}{(q-1)^\#}
\right)
=o(n)
\qquad(q\to\infty).
\tag{28}
\]

This rigorously rules out the cleanest arbitrary-order recursive version of the quadratic semiprime construction. It does **not** rule out more complicated overlapping, coded, or non-complement cascades; proving that every robust cascade incurs comparable entropy is precisely the missing global theorem.

---

# 8. The exact remaining separator

A proof of \((\mathrm{CL})\) now needs a chronological covering statement of the following kind:

> After a first sweep, even if a linear legal descendant family survives, the sum of the minimal covers exposed by successively preempting those covers is \(o(n)\), uniformly through \(\lceil\log_2H\rceil\) generations.

A disproof needs the opposite:

> A Prolonger strategy, forceable against Shortener’s actual Phase-0 and sweep policies, that repeatedly converts sparse covers into new covers whose cumulative cardinality is \(\Omega(n)\), while avoiding the private-coordinate/primorial density loss.

The supplied static theorems, raw-shadow construction, root-indexed lifetime ledger, and the survivor theorem above establish neither assertion. In particular:

\[
\text{linear raw shadow}
\;\not\Rightarrow\;
\text{linear legal descendants}
\;\not\Rightarrow\;
\text{linear cumulative minimal layers}.
\]

The first implication is false in general, and Theorem 1 shows that even making the middle term linear still does not resolve the second.

Therefore the honest conclusion is

\[
\boxed{
\text{\((\mathrm{CL})\) is not proved or disproved by a valid argument here.}
}
\]

The new rigorous advance is that **first-sweep carrier self-destruction is not sufficient**: in the natural slowly growing regime, Prolonger can force a linear shadow that genuinely survives the entire first sweep. The unresolved difficulty begins only when that linear legal mass is compressed into, and repeatedly regenerated from, subsequent sublinear minimal covers.

## Attached analysis 2 (verbatim): the audit — items 1 and 2 adjudicate attachment 1 (REPAIRABLE with exact fix; compression VALID); items 3-5 concern a different statement family and document how naive activation-time formulations collapse (relevant to formulating any sweep-policy statement)

I audited the claims as literal mathematical statements, not according to their intended meaning. 

**1. REPAIRABLE.** The surviving-shadow construction is essentially correct, including the obtainability and the order-independent weighted pairing, but Lemmas 2–3 omit a necessary legality check. From “every proper divisor of \(c_m\) is illegal” it does **not** follow that \(c_m\) is legal: a proper divisor might be one of the already selected elements of \(S_Y\), and selected elements are themselves illegal. The repair is an exact sharpening of (12). If \(z=dq_m\) with \(d\mid m\) proper, then
\[
z<\frac Nh<\frac{Y+1}{2},
\]
so, since \(z\) is integral, \(z\le\lfloor Y/2\rfloor\); hence no member of \(S_Y=(\lfloor Y/2\rfloor,Y]\) divides \(c_m\). Similarly, a proper divisor of \(m\) is \(<n/(10h)<Y/2\). Lemma 3 also never explicitly checks the old position \(A_0\): for \(x=mk\), any divisor omitting one \(>h\) prime factor of \(m\) is at most \(N/h<(Y+1)/2\), whereas any divisor containing all of \(m\) exceeds \(2Y\); therefore no \(s\in S_Y\) divides \(x\), and \(x>S_Y\) cannot divide an \(s\). With those lines added, carrier legality, cone survival, disjointness, and the greedy pairing
\[
\sum_{m\in B}w(m)\ge \frac12\biggl(\sum_{\mathcal R}w-\max_{\mathcal R}w\biggr)
\]
are valid against every ordering. The optional upper-half prime is indeed harmless and can fix the player-to-move parity.

**2. VALID, with a scope qualification.** Once the missing \(A_0\)-legality check from item 1 is supplied, the quotient-poset argument is correct. In \(\Gamma_m\), divisibility is exactly quotient divisibility. If \(k\) is composite, a prime \(p\mid k\) gives a proper legal divisor \(mp\); moreover \(p\neq q_m\), since \(q_m>K_m/2\) cannot divide a composite \(k\le K_m\). If \(p\le K_m\) is prime and \(p\neq q_m\), every proper divisor of \(mp\) either omits part of \(m\), hence lies below \(Y\) and is permanently illegal, or is \(m\), which was killed by \(c_m\). Thus the new minima **inside that cone** are precisely the stated \(mp\). For \(K_m\asymp2^s\), the number of relevant \(h\)-rough roots is
\[
O\!\left(\frac{n}{2^s\log h}\right),
\]
while \(\pi(K_m)=O(2^s/s)\), giving
\[
\sum_s O\!\left(\frac{n}{s\log h}\right)
=O\!\left(n\frac{\log\log h}{\log h}\right)=o(n).
\]
Equation (23), however, directly proves only
\[
\left|M_1\cap\bigcup_{m\in B}\Gamma_m\right|=o(n),
\]
not the size of every component of \(M_1\). The global statement \(M_1=o(n)\) requires the separately cited static-completion theorem applied to the \(o(n)\)-sized position \(A_1\). With that theorem available, the global wording is also justified.

**3. REFUTED.** The least-currently-legal move rule is legal, and the vague phrase “may execute the stipulated trapping sweep” could easily be made deterministic. The fatal step is instead a quantifier change: displayed (AH) quantifies uniformly over **every stopping time before the shell is halved** along the actual play. It does not quantify only over blocks that the policy elects to activate, nor does it give the policy authority to reset the time origin or redefine \(\operatorname{Anc}_X\) at an optional initialization. If a shell is initially unhalved, \(t=0\) and all subsequent pre-halving stopping times remain in the quantifier domain even when the policy announces no block. The terminal position is reached only after the shell is empty, hence outside that pre-halving domain; additionally, there is no Shortener decision node at which to make a game move called “activate all blocks.” The equations \(\tau_X=0\) and \(\operatorname{Anc}_X(0)=0\) therefore evaluate a newly invented block-relative statement, not the displayed (AH). Terminal delay does not prove literal (AH) vacuously.

**4. VALID, but only as a statement about the explicitly redefined \((\mathrm{AH}_{\mathrm{term}})\).** Interpret “activation after \(o(n)\) moves” uniformly: there is one \(a(n)=o(n)\) such that every Prolonger continuation reaches activation by \(a(n)\). Forward, the \(o(n)\) preactivation moves plus the stipulated postactivation implication from ancestor harvest to the shell estimate give \(L(n)=o(n)\); if activation itself is terminal, the conclusion is immediate. Reverse, a finite perfect-information game has a pure optimal Shortener strategy \(\sigma_n\) satisfying
\[
\max_{\text{Prolonger strategies}}\operatorname{length}(\sigma_n,\cdot)=L(n).
\]
If \(L(n)=o(n)\), follow \(\sigma_n\) to its terminal node and then perform the permitted terminal bookkeeping initialization; the postactivation inequalities are vacuous. Thus the modified statement is equivalent to \(L(n)=o(n)\). This does **not** rescue item 3, because \((\mathrm{AH}_{\mathrm{term}})\) is a new block-relative assertion, not literal (AH).

**5. REPAIRABLE.** Freezing the reservoir, faces, and weights and forbidding later rebasing removes the most obvious **postactivation** reset, but Section 5 is not yet a formal nondegenerate theorem. A remaining collapse is to hide all delay in the “post-trapping” prelude: unless its endpoint is fixed to the first endpoint of a specified uniformly \(o(n)\)-cost trapping algorithm, the policy can let the prelude continue until the game is terminal or until \(|Q_X|\le X/h^2\), then freeze an empty or negligible reservoir. No reinitialization is needed. “Neither stopping condition may hold merely because the policy deferred activation” is not a mathematical predicate, and “prelude costs are included in the accounting” does not itself impose an upper bound. There is also a ledger-normalization gap: “representing the live shell mass” must formally rule out \(w_X^0\equiv0\), omitted faces, or policy-dependent reassignment of first-exit channels. A complete repair should require: a fixed online trapping algorithm with a uniform \(o(n)\) deadline; \(s_X\) equal to its prescribed first endpoint; for every active block,
\[
|Q_X^0|>X/h^2,\qquad \Delta_X(s_X)>H;
\]
a coverage identity or two-sided comparison tying \(\sum_Fw_X^0(F)\) to \(Q_X^0\); a frozen, canonical first-exit classification; and the estimate through the actual stopping move. Under those explicit conditions, the terminal/rebasing degeneracy is genuinely closed.

**Cross-cutting observation.** Document I’s defects are local proof-hygiene and scope defects: it repeatedly slides from “this divisor is illegal” to “this divisor was not previously selected,” and from a bound inside the constructed cones to language about the whole layer. Its central construction survives straightforward repairs. Document II has a more serious logical defect: it changes the domain and origin of time in (AH). Freezing a ledger is useful only after the clock, activation deadline, nontrivial starting conditions, mass normalization, and stopping-event convention are fixed as part of the quantified statement.

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.