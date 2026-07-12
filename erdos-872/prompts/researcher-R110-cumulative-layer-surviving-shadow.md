Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the single statement (CL) in the Problem section.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Prove or disprove the cumulative minimal-layer statement (CL): there exists \(H=H(n)\to\infty\) and a Shortener sweep policy such that, against every Prolonger strategy, the peeling sweeps satisfy \(\sum_{\ell<\lceil\log_2 H\rceil}|M_\ell|=o(n)\), where \(M_\ell\) is the minimal legal layer at the start of sweep \(\ell\).

Context on both directions, established (see the attached verbatim analysis for the exact framework, and the facts sections below): the one-sweep containment theorem bounds the sum by \(|M_0|+|\operatorname{Sh}^-(K_0)|\), but the raw-shadow route is closed — for every \(H\) there are obtainable positions where every ordering concedes a linear raw shadow (construction attached verbatim below). However the raw shadow over-counts: the very carriers creating the advance-kills may make much of that shadow illegal. So (CL) hinges on SURVIVING descendant mass. A proof must exploit carrier self-destruction or a mechanism finer than the raw shadow; a disproof must upgrade the attached construction so that a linear part of the shadow chronologically survives into later minimal layers against Shortener's best sweep. Resolve (CL) in either direction with a complete proof.

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


## Attached verbatim: the ordering-robust linear-raw-shadow construction (verified by two independent audits). Its Section 7 states the scope honestly.

# Verdict

\[
\boxed{\text{The first-sweep ordered-shadow statement (OS) is false.}}
\]

In fact, the negation holds in a quantitatively strong form.

> **Theorem.** There is an absolute constant \(\varepsilon>0\) such that, for every function \(H(n)\to\infty\) and all sufficiently large \(n\), one can obtain a post-Phase-0 position \(A_0\) with the following property: for **every** ordering of its first minimal layer \(M_0\), Prolonger has a legal continuation during the first sweep for which
> \[
> \left|\operatorname{Sh}^{-}(K_0)\right|\ge \varepsilon n.
> \]
> Consequently neither (OS) nor the stronger weighted statement (WOS) holds.

I use the literal definitions of the first sweep, advance-killing, and the proper-multiple shadow from the attachment. 

The counterexample is genuinely first-sweep-local. It is not a terminal-position loophole, and it does not by itself resolve \(L(n)\): the shadow in (OS) counts potential proper multiples without requiring those multiples to remain legal after the killing carriers are played.

---

## 1. A post-peel position available for every \(H\)

Fix a proposed function \(H=H(n)\to\infty\), and write

\[
h:=H(n),\qquad Y:=\left\lfloor \frac nh\right\rfloor .
\]

Assume first \(Y\ge2\), and define

\[
S_Y:=\left\{\left\lfloor\frac Y2\right\rfloor+1,\ldots,Y\right\}.
\]

This is an antichain: if \(a,b\in S_Y\) and \(a<b\), then \(2a>Y\ge b\), so \(a\nmid b\).

Moreover, every integer \(d\in[2,Y]\) is comparable with an element of \(S_Y\). This is immediate when \(d\in S_Y\). If \(d\le Y/2\), put

\[
q=\left\lfloor\frac Yd\right\rfloor .
\]

Then \(q\ge2\), and

\[
qd=Y-r>Y-d\ge \frac Y2
\]

for some \(0\le r<d\). Hence \(qd\in S_Y\) and \(d\mid qd\).

The players can select the members of \(S_Y\) successively during Phase 0. Every unselected member remains legal because \(S_Y\) is an antichain. Once all of \(S_Y\) has been selected, every integer at most \(Y\) is illegal.

Depending on the parity convention for the transition from Phase 0 to the sweep, Prolonger may receive one additional turn after the last member of \(S_Y\) is selected. On that turn he chooses a prime

\[
q_n\in(n/2,n],
\]

which exists by Bertrand’s theorem. This upper-half prime is incomparable with all of \(S_Y\) and has no proper divisor in the board that affects the lower legal set. Thus the resulting post-peel position is either

\[
A_0=S_Y
\qquad\text{or}\qquad
A_0=S_Y\cup\{q_n\}.
\tag{1}
\]

Both have exactly the same legal lower set.

When \(Y<2\), Prolonger simply takes such an upper-half prime \(q_n\) on his initial turn. There is no integer \(d\ge2\) with \(d\le n/h\), so Phase 0 immediately ends with \(A_0=\{q_n\}\).

Thus, in every case, we have an obtainable post-peel position satisfying:

\[
\boxed{\text{Every integer }2\le d\le Y\text{ is illegal at }A_0.}
\tag{2}
\]

The optional upper-half prime will be harmless in everything below, because all of our roots and carriers lie at most \(n/2\) and are composite when necessary.

---

## 2. The private-carrier drafting lemma

The following elementary online lemma handles the arbitrary ordering quantifier in (OS).

### Lemma 1: private carriers force half the shadow value

Let \(M\) be the first minimal layer at a position \(A_0\), and let \(K\subseteq M\). Suppose that for every \(v\in K\) there is an integer \(c_v\) satisfying:

1. \(c_v\) is legal at \(A_0\);
2. \(v\mid c_v\) properly;
3. among the elements of \(M\), the only one dividing \(c_v\) is \(v\):
   \[
   \{m\in M:m\mid c_v\}=\{v\};
   \tag{3}
   \]
4. the carriers \(c_v\), \(v\in K\), are pairwise incomparable.

Let \(F:2^K\to\mathbb R_{\ge0}\) be monotone, submodular, and satisfy \(F(\varnothing)=0\). Put

\[
b:=\max_{v\in K}F(\{v\}).
\]

Then, against every ordering of \(M\), Prolonger can force an advance-killed set \(B\subseteq K\) satisfying

\[
\boxed{F(B)\ge \frac{F(K)-b}{2}.}
\tag{4}
\]

#### Proof

On each Prolonger turn, as long as some element of \(K\) remains legal, let \(B\) denote the roots whose carriers Prolonger has already played. Choose a surviving \(v\in K\) maximizing

\[
F(B\cup\{v\})-F(B),
\]

and play \(c_v\).

This move is legal. It is incomparable with all earlier carriers by condition 4. If a Shortener-selected root \(r\in M\) divided \(c_v\), condition 3 would give \(r=v\), impossible because \(v\) is still legal. Conversely, if \(c_v\mid r\), then

\[
v\mid c_v\mid r,
\]

contradicting the fact that the distinct minimal elements \(v,r\in M\) are incomparable.

Condition 3 also shows that playing \(c_v\) advance-kills exactly one surviving member of \(K\), namely \(v\).

At the end of the sweep, partition

\[
K=B\sqcup T,
\]

where \(T\) consists of the roots selected exactly by Shortener. Except possibly for the first element of \(T\) when Shortener moves first, each \(t\in T\) has an immediately preceding Prolonger turn. Pair \(t\) with the root \(v(t)\in B\) chosen on that preceding turn. These paired roots of \(B\) are distinct.

Let \(B_t\) be the set of roots already taken by Prolonger immediately before \(v(t)\) was chosen. At that moment \(t\) was still available, so greedy choice gives

\[
F(B_t\cup\{v(t)\})-F(B_t)
\ge
F(B_t\cup\{t\})-F(B_t).
\tag{5}
\]

Now add the elements of \(T\) to the final set \(B\) in chronological order. By submodularity, the marginal contribution of \(t\) when added to \(B\) and the earlier members of \(T\) is at most its marginal over the smaller set \(B_t\). Hence (5) charges that marginal to the marginal by which \(v(t)\) entered \(B\).

Because distinct \(t\)'s are paired with distinct elements of \(B\), the total contribution of all paired elements of \(T\) is at most \(F(B)\). The one possible unpaired initial root contributes at most \(b\). Therefore

\[
F(K)-F(B)
=
F(B\cup T)-F(B)
\le F(B)+b.
\]

Rearranging yields (4). ∎

We will apply this to the coverage function

\[
F(B):=
\left|
\bigcup_{m\in B}
\{2m,3m,\ldots,\lfloor n/(2m)\rfloor m\}
\right|.
\tag{6}
\]

Coverage functions are monotone and submodular.

---

## 3. A standard rough-number estimate

We use the following unconditional form of the one-dimensional sieve.

### Lemma 2: rough integers in a dyadic interval

There are absolute constants \(a,A>0\) such that, whenever \(z\) is sufficiently large and \(X\ge z^3\),

\[
a\frac{X}{\log z}
\le
\#\{m:X<m\le2X,\;P^{-}(m)>z\}
\le
A\frac{X}{\log z},
\tag{7}
\]

where \(P^{-}(m)\) is the least prime factor of \(m\).

This is the usual fundamental lemma of the dimension-one linear sieve. For completeness, take the interval sequence \(\mathcal A=(X,2X]\) and sieve by the primes up to \(z\). For squarefree \(d\),

\[
|\{m\in\mathcal A:d\mid m\}|=\frac Xd+O(1).
\]

Use Rosser lower and upper weights at level

\[
D=\frac{X}{(\log X)^4}.
\]

The total remainder is \(O(D)=o(X/\log z)\). Since

\[
s=\frac{\log D}{\log z}\ge3-o(1),
\]

the lower linear-sieve function is bounded positively—the explicit formula in \(2<s\le4\) is

\[
f(s)=\frac{2e^\gamma}{s}\log(s-1)>0,
\]

while the upper sieve function is bounded. Finally,

\[
\prod_{p\le z}\left(1-\frac1p\right)\asymp\frac1{\log z}
\]

by Mertens’ theorem. This gives both inequalities in (7).

---

## 4. The rough-root construction: \(h<n^{1/4}\)

Assume

\[
h<n^{1/4}.
\tag{8}
\]

For large \(n\), \(h>20\). Let \(K\) be the set of integers \(m\) satisfying

\[
Y<m\le\frac n5,
\qquad
P^{-}(m)>h.
\tag{9}
\]

We may restrict \(K\) to the union of the dyadic intervals used below.

### 4.1. Every \(m\in K\) is in \(M_0\)

Because \(m\) is \(h\)-rough, every proper divisor \(d\mid m\) satisfies

\[
d\le\frac{m}{P^{-}(m)}
<
\frac{m}{h}
\le
\frac{n}{5h}
<
\frac Y2
\tag{10}
\]

for all sufficiently large \(n\).

By (2), all such proper divisors are already illegal. Also, no selected member of \(S_Y\subset(Y/2,Y]\) divides \(m\), by the same bound, and \(m>Y\) cannot divide a member of \(S_Y\). Thus \(m\) is legal and has no legal proper divisor. Since \(m\le n/5<n/2\),

\[
m\in M_0.
\tag{11}
\]

### 4.2. The carrier \(c_m=2m\) is private

Since \(h>2\), every \(m\in K\) is odd. Every divisor of \(2m\) has the form \(d\) or \(2d\), with \(d\mid m\).

Apart from \(m\) and \(2m\), such a divisor is at most

\[
\frac{2m}{P^{-}(m)}
<
\frac{2n}{5h}
<
\frac Y2.
\tag{12}
\]

Consequently no element of \(S_Y\) divides \(2m\). The optional upper-half prime in (1) is also incomparable with \(2m<n/2\). Hence \(2m\) is legal at \(A_0\).

Among the minimal roots \(M_0\), the only divisor of \(2m\) is \(m\): all the other proper divisors are already illegal, and \(2m\) itself is not minimal because \(m\) is legal. Therefore

\[
\{r\in M_0:r\mid2m\}=\{m\}.
\tag{13}
\]

The carriers \(2m\) are pairwise incomparable. Indeed, if \(m<m'\) and \(2m\mid2m'\), then \(m\mid m'\). The quotient \(m'/m\) is a divisor of the \(h\)-rough integer \(m'\), so either it is \(1\) or it exceeds \(h\). But

\[
1<\frac{m'}m
<
\frac{n/5}{n/h}
=
\frac h5,
\]

a contradiction.

Thus the hypotheses of Lemma 1 are satisfied.

### 4.3. The shadows are disjoint

Suppose

\[
km=k'm'
\tag{14}
\]

for \(m,m'\in K\), with

\[
2\le k\le\left\lfloor\frac{n}{2m}\right\rfloor,
\qquad
2\le k'\le\left\lfloor\frac{n}{2m'}\right\rfloor.
\]

Because \(m,m'>n/h\),

\[
k,k'<\frac h2.
\tag{15}
\]

Every prime factor of \(k,k'\) is therefore less than \(h\), while every prime factor of \(m,m'\) is greater than \(h\). Unique factorization applied to (14) gives

\[
k=k',\qquad m=m'.
\]

Hence the proper shadows of distinct roots in \(K\) are pairwise disjoint, and

\[
F(K)
=
\sum_{m\in K}
\left(\left\lfloor\frac{n}{2m}\right\rfloor-1\right).
\tag{16}
\]

### 4.4. The total shadow is linear

Take disjoint dyadic intervals

\[
(X_j,2X_j],\qquad X_j=2^{j+1}Y,
\]

for all \(j\) such that \(2X_j\le n/5\). Their number is

\[
J=\Theta(\log h).
\tag{17}
\]

Moreover \(X_j\ge2Y\ge h^3\) for large \(n\), because \(h<n^{1/4}\). Lemma 2 shows that every interval contains at least

\[
a\frac{X_j}{\log h}
\]

\(h\)-rough integers. Therefore its contribution to the reciprocal sum is at least

\[
\sum_{\substack{X_j<m\le2X_j\\P^{-}(m)>h}}\frac1m
\ge
\frac{a}{2\log h}.
\]

Summing over \(J=\Theta(\log h)\) intervals gives an absolute constant \(\eta>0\) such that

\[
\sum_{m\in K}\frac1m\ge\eta.
\tag{18}
\]

The upper half of Lemma 2, summed dyadically, gives

\[
|K|=O\!\left(\frac n{\log h}\right)=o(n).
\tag{19}
\]

Let \(N=\lfloor n/2\rfloor\). From (16),

\[
\begin{aligned}
F(K)
&\ge
\sum_{m\in K}\left(\frac Nm-2\right)\\
&=
N\sum_{m\in K}\frac1m-2|K|\\
&\ge
\eta N-o(n).
\end{aligned}
\]

Thus, for some absolute \(c_1>0\),

\[
F(K)\ge c_1n.
\tag{20}
\]

On the other hand,

\[
\max_{m\in K}F(\{m\})
\le
\max_{m\in K}\frac{N}{m}
<
\frac h2
=
o(n).
\tag{21}
\]

Lemma 1 now gives a Prolonger continuation producing an advance-killed set \(B\subseteq K\) with

\[
F(B)\ge \frac{c_1n-o(n)}2\ge\frac{c_1}{3}n
\tag{22}
\]

for large \(n\).

Since \(B\subseteq K_0\),

\[
|\operatorname{Sh}^{-}(K_0)|
\ge F(B)
\ge \frac{c_1}{3}n.
\tag{23}
\]

This works against every first-layer ordering.

---

## 5. The prime-root construction: \(h\ge n^{1/4}\)

Now suppose

\[
h\ge n^{1/4}.
\tag{24}
\]

Then

\[
Y\le n^{3/4}.
\tag{25}
\]

We divide only according to whether the element \(2\) was selected during the peel.

### 5.1. When \(Y\ge4\)

Consider the prime interval

\[
2n^{3/4}<p\le\frac n4.
\tag{26}
\]

Every such prime exceeds \(Y\), so it is legal and minimal at \(A_0\), hence lies in \(M_0\).

Its private carrier is

\[
c_p=2p.
\]

This carrier is at most \(n/2\). Its only nontrivial proper divisors are \(2\) and \(p\). Since \(Y\ge4\), the selected interval \(S_Y\) begins above \(2\), while \(2\) is nevertheless already illegal by (2). Hence \(2p\) is legal, and among \(M_0\) its only divisor is \(p\). Distinct carriers \(2p\) are incomparable.

### 5.2. When \(Y<4\)

Use instead primes

\[
n^{1/4}<p\le n^{1/3}
\tag{27}
\]

and carriers

\[
c_p=p^2.
\]

For large \(n\), these primes exceed every member of the post-peel position. Also,

\[
p^2\le n^{2/3}<\frac n2.
\]

The only nontrivial proper divisor of \(p^2\) is \(p\), so \(p^2\) is legal and has trace exactly \(\{p\}\) on \(M_0\). Distinct prime squares are incomparable.

The optional upper-half prime in \(A_0\) is incomparable with all these roots and carriers.

### 5.3. Choose a constant-reciprocal-mass subfamily

Mertens’ theorem for prime reciprocals gives, in the first case,

\[
\sum_{2n^{3/4}<p\le n/4}\frac1p
=
\log\frac43+o(1),
\tag{28}
\]

and in the second case,

\[
\sum_{n^{1/4}<p\le n^{1/3}}\frac1p
=
\log\frac43+o(1).
\tag{29}
\]

Fix, for example,

\[
\sigma=\frac1{10}.
\]

Choose primes successively from the relevant interval until their reciprocal sum first exceeds \(\sigma\). Let \(K\) be the resulting family and put

\[
s:=\sum_{p\in K}\frac1p.
\]

Because every individual reciprocal tends to zero,

\[
s=\sigma+o(1).
\tag{30}
\]

Also \(|K|=o(n)\).

### 5.4. Bonferroni gives a linear shadow

For \(p\in K\), let

\[
U_p:=\{p,2p,\ldots,\lfloor N/p\rfloor p\},
\qquad N=\lfloor n/2\rfloor.
\]

Second-order Bonferroni gives

\[
\begin{aligned}
\left|\bigcup_{p\in K}U_p\right|
&\ge
\sum_{p\in K}\left\lfloor\frac Np\right\rfloor
-
\sum_{\substack{p,q\in K\\p<q}}
\left\lfloor\frac N{pq}\right\rfloor\\
&\ge
Ns-|K|
-
N\sum_{p<q}\frac1{pq}\\
&\ge
Ns-|K|-\frac N2s^2.
\end{aligned}
\tag{31}
\]

Passing from \(U_p\) to the proper shadow merely removes the distinct primes \(p\), so

\[
F(K)
\ge
N\left(s-\frac{s^2}{2}\right)-2|K|.
\tag{32}
\]

Using \(s=1/10+o(1)\) and \(|K|=o(n)\), we obtain an absolute \(c_2>0\) such that

\[
F(K)\ge c_2n.
\tag{33}
\]

The largest individual shadow is sublinear. In the first case,

\[
\max_{p\in K}F(\{p\})
\le
\frac{n}{4n^{3/4}}
=O(n^{1/4}),
\tag{34}
\]

while in the second,

\[
\max_{p\in K}F(\{p\})
\le
\frac12n^{3/4}.
\tag{35}
\]

Thus in both cases the quantity \(b\) from Lemma 1 is \(o(n)\). The lemma produces \(B\subseteq K_0\) such that

\[
|\operatorname{Sh}^{-}(K_0)|
\ge F(B)
\ge \frac{c_2n-o(n)}2
\ge\frac{c_2}{3}n.
\tag{36}
\]

Again, this holds against every ordering.

---

## 6. Negation of (OS)

Let

\[
\varepsilon:=\frac13\min\{c_1,c_2\}>0.
\]

For every proposed \(H(n)\to\infty\), every sufficiently large \(n\) is in exactly one of the two regimes:

\[
H(n)<n^{1/4}
\qquad\text{or}\qquad
H(n)\ge n^{1/4}.
\]

In the first regime, the rough-root construction gives an obtainable \(A_0\) satisfying

\[
\forall\text{ orderings of }M_0\quad
\exists\text{ legal Prolonger continuation}\quad
|\operatorname{Sh}^{-}(K_0)|\ge\varepsilon n.
\]

The prime-root construction gives the same conclusion in the second regime. Hence

\[
\boxed{
\forall H(n)\to\infty,\ 
\exists A_0\text{ obtainable after Phase 0},\
\forall\prec,\
\exists\text{ Prolonger continuation}:
|\operatorname{Sh}^{-}(K_0)|\ge\varepsilon n.
}
\tag{37}
\]

This is precisely the strong negation of (OS).

Since

\[
|\operatorname{Sh}^{-}(K_0)|
\le
\sum_{m\in K_0}
\left(\left\lfloor\frac{n}{2m}\right\rfloor-1\right),
\]

the same construction also disproves (WOS).

---

## 7. What failed in the formulation

The one-sweep containment theorem in the attachment is correct:

\[
\bigcup_{\ell\ge1}M_\ell
\subseteq
\operatorname{Sh}^{-}(K_0).
\]

The proof correctly uses monotonicity of legality, the fact that an exactly selected minimum blocks every later multiple, and the pairwise disjointness of successive minimal layers.

The failure is the attempted converse philosophy. A linear **raw** proper-multiple shadow can be created in the first sweep by a family of roots with private, pairwise-incomparable carriers, regardless of Shortener’s ordering. But the carriers themselves may simultaneously make large portions of that raw shadow illegal. Therefore

\[
|\operatorname{Sh}^{-}(K_0)|\gg n
\]

does not imply that linearly many descendants survive into later minimal layers.

Thus (OS) does not collapse to the full primitive-set game problem. Rather, it is an excessively strong sufficient condition: it forbids linear potential shadow even when much of that shadow is already blocked or is destroyed by the very moves creating \(K_0\).

\[
\boxed{\text{(OS) and (WOS) are unconditionally false.}}
\]

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.
