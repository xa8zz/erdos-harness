Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. First formulate the canonical nondegenerate statement described in the Problem section (and prove its nondegeneracy), then provide a full proof or disproof of it.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Your task has two parts.

Part 1 — formulate. The attached analyses isolate an "ancestor-harvest" inequality as the decisive missing statement for the sublinear side, and then document, across three failed formulation attempts, how naive statements collapse: a cost-only activation deadline is equivalent to the full problem; freezing a ledger at a prescribed activation time still allows a preannounced sublinear pre-freeze sequence that forces the stopping condition to hold at the freeze (empty processing interval); and an audit's repair list requires a fixed online trapping algorithm with a uniform \(o(n)\) deadline, the freeze placed at that algorithm's prescribed first endpoint (the common post-trapping baseline) with ALL subsequent losses including scheduling losses charged to that original ledger, ledger normalization (no zero weights, no omitted faces, no policy-dependent reassignment of first-exit channels), and stopping events that cannot be forced merely by deferral. Write down THE canonical nondegenerate ancestor-harvest statement meeting every one of these constraints, and prove it is nondegenerate: show no vacuous witness of the terminal-delay, prelude-delay, or pre-freeze-forcing families exists, and that your statement still implies \(L(n)=o(n)\) through the attached conditional pipeline without silently strengthening or weakening it into the full problem.

Part 2 — resolve. Prove or disprove your canonical statement, in full.

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


## Attached analysis 1 (verbatim): the reduction isolating the ancestor-harvest inequality (residual channel closed, trace-1 anchor neutralized; prime-product lemma requires S nonempty)

## Verdict

I do **not** obtain a valid proof or disproof of the statement.

The established machinery closes the residual lifetime channel and the literal trace-\(1\) anchor channel. After those are removed, the argument reduces to one precise, policy-dependent assertion:

\[
\boxed{\text{a uniform chronological first-exit bound for direct ancestors.}}
\]

Neither the supplied facts nor the arguments below prove that bound. Conversely, the known direct-ancestor examples do not give the persistent, policy-independent Prolonger strategy required for a disproof.

I will make this reduction precise and show that there is only one remaining gap.

---

# 1. The residual channel really can be closed

Put

\[
\mathfrak T(n):=\max_{m\le n}\tau(m).
\]

Fix \(\delta>0\), and choose

\[
H=\mathfrak T(n)^{1+\delta}.
\tag{1}
\]

The elementary maximal-divisor estimate gives \(\mathfrak T(n)=n^{o(1)}\), so \(H=n^{o(1)}\). Choose

\[
r=\left\lfloor (\log H)^{1/3}\right\rfloor .
\]

Then

\[
2^r=H^{o(1)},\qquad
W_r:=\binom r{\lfloor r/2\rfloor}=H^{o(1)}.
\]

Let

\[
E_H=|\{p:H<p\le 2H,\ p\text{ prime}\}|
  \asymp \frac H{\log H},
\]

and let

\[
q_H:=E_H-(2W_r+1)
     =(1-o(1))E_H
     \asymp \frac H{\log H}.
\tag{2}
\]

Thus a face which is unusable at first activation because fewer than \(2W_r+1\) lifts remain has at least \(q_H\) distinct dead face-tag pairs.

Consider \(t\) actual moves \(c_1,\dots,c_t\). For the residual channel, the atomic ledger gives

\[
\#\{F:c_i\text{ ever appears in the residual record of }F\}
 \le 2^r\tau(c_i)
 \le 2^r\mathfrak T(n).
\tag{3}
\]

One actual move cannot first-kill two different prime tags of the same still-legal face. Therefore, double-counting residual face-blocker incidences gives

\[
q_H\,|\mathcal E_{\mathrm{res}}|
 \le
 \sum_{i\le t}2^r\tau(c_i)
 \le
 2^r\mathfrak T(n)t.
\tag{4}
\]

Consequently,

\[
|\mathcal E_{\mathrm{res}}|
 \le
 \frac{2^r\mathfrak T(n)}{q_H}\,t.
\tag{5}
\]

By (1) and (2),

\[
\frac{2^r\mathfrak T(n)}{q_H}
 \ll
 \frac{H^{o(1)}\mathfrak T(n)\log H}{H}
 =
 \mathfrak T(n)^{-\delta+o(1)}\log \mathfrak T(n)
 =o(1).
\tag{6}
\]

Under a degree cap \(O(H)\), each face has shell weight \(O(H)\). Hence the total residual-channel repair mass is

\[
O(H)|\mathcal E_{\mathrm{res}}|
   =o(Ht).
\tag{7}
\]

Any extra \(2^{O(r)}\) cell, signature, or narrow-window factors remain \(H^{o(1)}\) and are absorbed by the fixed \(\delta\) margin in (6).

Thus the residual channel is not the remaining obstruction.

---

# 2. The trace-\(1\) prime anchor can be defeated by a legal online guard

There is a useful legality fact which makes the batch response completely explicit.

### Lemma 1: product of currently legal primes

Let \(A\) be the present primitive set, and let \(S\) be a finite set of primes, every one of which is currently legal. If

\[
B_S:=\prod_{p\in S}p\le n,
\]

then \(B_S\) is legal.

### Proof

Suppose some \(a\in A\) is comparable with \(B_S\).

If \(a\mid B_S\), then \(a\) is a nontrivial squarefree product of primes from \(S\). In particular, some \(p\in S\) divides \(a\), contradicting the legality of \(p\).

If \(B_S\mid a\), then every \(p\in S\) divides \(a\), again contradicting the legality of \(p\).

Thus \(B_S\) is incomparable with every member of \(A\). ∎

So whenever the full packet product fits on the board, Shortener can play the product of **all currently legal** lift primes. Prolonger can steal at most the one prime played immediately before that response.

The same idea works when the full packet product does not fit. Partition \(\mathcal P_H\) into groups of size

\[
g=\left\lfloor
\frac{\log n}{20\log(2H)}
\right\rfloor .
\tag{8}
\]

Because \(H=n^{o(1)}\), we have \(g\to\infty\). For each group, Shortener recomputes the currently legal primes and, when at least \(g/2\) remain, plays their product. This product is legal by Lemma 1 and satisfies

\[
B\le (2H)^g\le n^{1/20}.
\tag{9}
\]

There are only

\[
G
 \le 1+\frac{E_H}{g}
 =O\!\left(\frac{H}{\log n}\right)+1
 =n^{o(1)}
\tag{10}
\]

guard turns. During the entire guard phase, Prolonger can play at most \(G+1\) singleton lift primes. Since

\[
\frac{G}{E_H}
 =
 O\!\left(\frac{\log H}{\log n}\right)+o(1)
 =o(1),
\tag{11}
\]

only \(o(E_H)\) tags can acquire trace \(1\) in this way.

If fewer than \(g/2\) primes remain legal in a group, then at least \(g/2\) tags in that group have already been destroyed by previous chronological blockers. That group is not a free anchor: its depletion must already be charged to one of the residual or direct-ancestor channels.

The collateral of a good guard product is negligible. Indeed, with \(|S|\ge g/2\),

\[
B_S\ge H^{g/2}=n^{\Omega(1)},
\]

while \(B_S\) has only

\[
\tau(B_S)=2^{|S|}\le 2^g=n^{o(1)}
\]

divisors. Thus the faces comparable with guard products contribute only the accepted high-lcm and bottom-shell errors.

Therefore the literal anchor strategy against maximum current degree is not a universal disproof: a completely legal online batch guard eliminates it.

---

# 3. What remains is not a lift-death problem

After the two preceding reductions, the unresolved obstruction is the direct-ancestor channel.

Let \(\mathscr F_s\) be the latent canonical faces relevant to shell \(S_X\) at time \(s\), and let \(w_s(F)\) denote the residual shell mass represented by \(F\). Count a face only at its first exit.

A direct-ancestor event is qualitatively different from a residual lift death:

- in the residual channel, \(F\) remains legal and a specific lift \(Fp\) becomes illegal;
- in the direct-ancestor channel, an earlier move makes the intended ancestor or root unavailable before \(F\) is activated.

Thus no actual lift target need leave \(Q_X\) when the bookkeeping family is erased. The first-death normal form does not apply because its hypothesis is that the face stays legal.

Define

\[
\operatorname{Anc}_X(t)
:=
\sum_{\substack{F\text{ whose first exit occurs before }t\\
                 \text{through the direct-ancestor channel}}}
w(F).
\tag{12}
\]

The needed statement is the following.

## Ancestor-harvest inequality

There must be a fully specified online Shortener policy \(\sigma\) such that, uniformly over every Prolonger play and every stopping time before the shell is already halved,

\[
\boxed{
\operatorname{Anc}_X(t)
\le
\varepsilon(H)X
+
C\sum_{i<t}\Delta_i
+
CHt,
\qquad
\varepsilon(H)\longrightarrow0,
}
\tag{AH}
\]

where \(\Delta_i\) is the contemporaneous shell area removed on turn \(i\).

Under the degree cap \(\Delta_i\le H\), this reduces to

\[
\operatorname{Anc}_X(t)
\le o(X)+O(Ht).
\tag{13}
\]

This is precisely the ancestor-harvest formulation named in the question.

---

# 4. Why neither maximum degree nor the atomic ledger proves (AH)

The atomic ledger cannot be extended to this channel. Fact 3 explicitly supplies examples in which a fixed blocker of bounded divisor count is inherited by \(H^{\Omega(1)}\) unmergeable descendant faces. Thus an estimate of the form

\[
\#\{F:c\text{ directly removes }F\}
 \le M\tau(c)
\]

is false for every acceptable \(M=H^{o(1)}\).

Maximum current \(Q_X\)-degree does not fix this. A move can erase a collection of latent roots while leaving most of the upper targets represented by those roots legal. Consequently,

\[
\text{first-exit root mass}
\not\ll
\text{current target degree of the move}.
\]

The one-carrier construction in the assumptions gives exactly this quantitative failure: a legal carrier can remove \(H\) incomparable roots, each having degree at most \(H\), with total root-shadow mass \(\Omega(H^2)\). Its contemporaneous target area need only be \(O(H)\).

Therefore a target-death potential sees the wrong object.

---

# 5. Why the prime batch trick does not extend automatically

The legality of the prime product in Lemma 1 is special. Even two individually legal composite threats need not have any common legal blocker.

For example, take the current primitive set

\[
A=\{6,35\}.
\]

Both \(10\) and \(15\) are legal:

\[
10\parallel 6,\quad 10\parallel35,\qquad
15\parallel6,\quad15\parallel35,
\]

where \(\parallel\) denotes incomparability.

But there is no legal integer comparable with both \(10\) and \(15\).

Indeed, such an integer \(b\) must fall into one of four cases.

1. If \(b\mid10\) and \(b\mid15\), then \(b=5\), which is illegal because \(5\mid35\).

2. If \(10\mid b\) and \(15\mid b\), then \(30\mid b\), which is illegal because \(6\mid b\).

3. The relation \(15\mid b\mid10\) is impossible.

4. The relation \(10\mid b\mid15\) is impossible.

Thus two legal dangerous carriers can fail to admit even one legal batch blocker.

This does not prove that Shortener loses globally. Shortener might harvest one threatened family, use a blocker acting through another coordinate, or exploit interactions with other shells. But it rules out the pointwise strategy

> whenever several dangerous moves exist, play one product or lcm that blocks all of them.

The prime anchor is therefore genuinely easier than the general direct-ancestor channel.

---

# 6. Conditional completion if (AH) were proved

Suppose a legal online policy satisfying (AH) were available.

From Section 1, the residual-channel repair mass in \(t\) rounds is

\[
o(Ht).
\tag{14}
\]

From Section 2, pure trace-\(1\) anchoring contributes only the negligible guard error, while groups already depleted by composite moves are assigned to the residual or direct-ancestor ledger.

The ordinary first-death, high-lcm, boundary, and canonical-cube errors are already controlled by the established facts. Hence the total repair term would satisfy

\[
\operatorname{Repair}_X(t)
\le
o(X)
+
O(Ht)
+
C\sum_{i<t}\Delta_i.
\tag{15}
\]

This is exactly the contemporaneous-area repair estimate required in fact 1. That reduction would then give

\[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|
+
\frac{X}{h(n)^2}
\]

for some \(h(n)\to\infty\), uniformly over shells. The trapping sweep, geometric shell summation, and static completion would then imply

\[
L(n)=o(n).
\]

Thus proving (AH) completes the sublinear side without any additional unproved transition.

---

# 7. Why the present obstructions do not disprove the statement

To disprove the statement, it is not enough to exhibit:

- the trace-\(1\) anchor against maximum degree;
- one direct-ancestor carrier with anomalously large first-exit mass;
- one state with no common legal blocker;
- or one stopping time at which a repair potential jumps.

The prime guard above already defeats the first item. The other examples are local. A disproof must show that, against **every** legal online Shortener policy, Prolonger can concatenate such events for

\[
t\asymp \frac XH
\]

rounds while simultaneously maintaining:

\[
|Q_X(t)|\asymp X,
\qquad
\sum_{i<t}\Delta_i=o(X),
\]

and preventing the lost ancestor mass from being transferred into the minimal or exact-only bank.

None of the supplied mechanisms gives that persistent universal strategy. In particular, repeating independent local gadgets is not automatic: Shortener may use cross-gadget batch blockers, and proving that all such blockers can themselves be avoided is precisely an online cover-free or transversal problem.

---

# Final separator

The argument therefore stops at exactly one assertion:

\[
\boxed{
\begin{minipage}{0.88\linewidth}
Construct a fully specified legal online Shortener policy, including its
batch and fallback moves, for which the cumulative residual weight of
canonical faces lost through first-exit direct ancestors satisfies
\[
\operatorname{Anc}_X(t)
\le o(X)+O(Ht)
\]
uniformly at every stopping time before the degree cap or shell halving.
\end{minipage}
}
\]

Equivalently, construct a repair potential dominating direct-ancestor regeneration whose chronological increment is controlled by contemporaneous shell area.

I do not see a valid proof of this inequality, and the known local direct-ancestor examples do not yield the universal persistent exploit needed to refute it. Therefore the stated existence claim—and hence the sublinear question—remains unresolved at this single sub-step.

## Attached analysis 2 (verbatim): audit adjudicating the degeneracy claims — its item 3 shows the terminal-delay witness FAILS against the literal statement (quantifier domain), its item 5 is the repair list adopted above

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

## Attached analysis 3 (verbatim): the pre-freeze forcing degeneracy of a frozen-ledger variant, with the monotonicity facts and the baseline-freezing repair direction

# Verdict

\[
\boxed{\text{(AH*) is unconditionally true as stated, but for a degenerate pre-freeze reason.}}
\]

The freezing condition prevents **reinitialization after** \(s_X\). It does not prevent Shortener from using a preannounced, sublinear sequence of moves **before** \(s_X\) to make the degree-cap stopping condition hold, and only then freezing the ledger. Consequently the quantified processing interval has length zero.

This is stronger than the old terminal-delay defect:

- the activation schedule is fixed before the subsequent Prolonger play;
- no ledger is ever rebased;
- the game need not be terminal;
- the complete preactivation cost is only \(O(n/H+\log n)=o(n)\) when \(H\to\infty\).

Thus “fixed in advance” controls adaptivity of the activation time, but not lateness of the first freeze. The uploaded specification freezes the ledger at \(s_X\), rather than freezing it at the common post-trapping baseline and counting all losses thereafter. 

---

## 1. Monotonicity

For a shell \(S_X\), write

\[
\deg_A^X(d)
   :=\#\{u\in Q_X(A):d\mid u\},
\qquad
\Delta_X(A):=\max_{d\in D(A)}\deg_A^X(d),
\]

with \(\Delta_X(A)=0\) when \(D(A)=\varnothing\).

If \(A'\) is a continuation of \(A\), then

\[
Q_X(A')\subseteq Q_X(A),
\qquad
D(A')\subseteq D(A).
\]

Moreover, for every \(d\in D(A')\),

\[
\deg_{A'}^X(d)\le \deg_A^X(d).
\]

Hence

\[
\Delta_X(A')\le \Delta_X(A).
\tag{1}
\]

In particular, once the degree cap \(\Delta_X\le H\) holds, it holds forever.

Also, whenever \(\Delta_X(A)>H\), Shortener can legally select some \(d\in D(A)\) with

\[
\deg_A^X(d)\ge H+1.
\]

That move makes at least \(H+1\) currently live members of \(Q_X(A)\) illegal. Those targets never return.

---

## 2. A prescribed pre-freeze cap sweep

Fix the stipulated smooth/rough trapping policy and let \(s_{\mathrm{tr}}\) be the end of its trapping phase.

Let \(\mathcal X_n\) be the fixed dyadic shell system, in any predetermined order, say decreasing \(X\). Put

\[
M_X:=|S_X\cap\{2,\ldots,n\}|.
\]

For the usual disjoint dyadic shells,

\[
\sum_{X\in\mathcal X_n}M_X\le n-1;
\]

constant overlap would make no difference.

Set

\[
B:=H+1,
\qquad
m_X:=\left\lceil\frac{M_X}{B}\right\rceil.
\tag{2}
\]

At \(s_{\mathrm{tr}}\), before observing any subsequent Prolonger play, Shortener announces the following complete schedule.

For each shell \(X\), she reserves exactly \(m_X\) of her turns before activating that shell. On every such reserved turn:

- if \(\Delta_X>H\), she plays the least legal \(d\in D(A)\) attaining \(\Delta_X\);
- if \(\Delta_X\le H\), she plays the least currently legal integer as a fallback.

After exactly those \(m_X\) Shortener turns, she activates shell \(X\), freezes

\[
Q_X^0=Q_X(s_X),\qquad
\mathscr F_X^0,\qquad
w_X^0,
\]

and never rebases that ledger.

The shell order, the integers \(m_X\), and therefore all activation offsets \(s_X-s_{\mathrm{tr}}\), are fixed before the intervening play. Only the legal move selected inside an allocated turn depends on the current position, as any online policy necessarily must. Ties and fallbacks have been completely specified.

If the game terminates before some scheduled activation, use the usual absorbing extension of the terminal state; equivalently, all remaining reservoirs are empty and already capped.

---

## 3. Every shell is capped when its ledger is frozen

Fix a shell \(X\). Suppose for contradiction that

\[
\Delta_X(s_X)>H.
\tag{3}
\]

By monotonicity (1), the cap could not have held at any earlier point during the \(m_X\) allocated turns. Therefore on every one of those turns Shortener selected a legal lower integer of shell degree at least \(B=H+1\).

Each such move removed at least \(B\) currently live shell targets. The sets removed on different turns are disjoint, because illegality is irreversible. Consequently those \(m_X\) moves removed at least

\[
m_XB
   \ge
   \left\lceil\frac{M_X}{B}\right\rceil B
   \ge M_X
\]

distinct members of \(S_X\).

But there were at most \(M_X\) shell integers altogether. Thus \(Q_X(s_X)=\varnothing\), which implies

\[
\Delta_X(s_X)=0,
\]

contradicting (3). Hence

\[
\boxed{\Delta_X(s_X)\le H}
\tag{4}
\]

for every Prolonger continuation and every shell.

Notice that \(Q_X(s_X)\) need not be empty. The sweep can make all useful lower moves have degree at most \(H\) while leaving a large reservoir. The degeneracy is therefore not terminality.

---

## 4. Verification of (AH*)

Let \(\tau_X\) denote the first postactivation time at which either

\[
\Delta_X\le H
\]

or the frozen reservoir \(Q_X^0\) has been halved.

By (4), the first condition already holds at activation, so

\[
\tau_X=0.
\]

If “before the stopping time” means \(t<\tau_X\), there are no such \(t\).

The stronger convention in the attached Section 5 tests the endpoint \(0\le t\le\tau_X\). Then the only relevant time is \(t=0\). Since the ledger has just been frozen, no face has yet had a post-freeze first exit, and therefore

\[
\operatorname{Anc}_X(0)=0.
\]

We may take

\[
\varepsilon(H)=0
\]

and any absolute \(C\ge1\). Then

\[
\operatorname{Anc}_X(0)
 =0
 \le
 \varepsilon(H)X+CH\cdot0
 =0.
\]

Thus, uniformly over every shell, starting history, and Prolonger strategy,

\[
\boxed{
\operatorname{Anc}_X(t)
   \le o(X)+O(Ht)
}
\]

at every stopping time demanded by the literal statement.

No information about residual blockers, traces, common cores, or direct ancestors was needed.

---

## 5. The preactivation cost is already sublinear

From (2),

\[
\sum_{X\in\mathcal X_n}m_X
 \le
 \frac{\sum_XM_X}{H+1}
   +|\mathcal X_n|
 =
 O\!\left(\frac nH+\log n\right).
\]

In the intended regime \(H=H(n)\to\infty\),

\[
\sum_Xm_X=o(n).
\tag{5}
\]

There is at most one Prolonger move between consecutive Shortener moves, so the number of actual moves spent during this entire pre-freeze phase is also \(o(n)\). Adding the stipulated \(o(n)\)-move trapping sweep still gives \(o(n)\).

Therefore the defect is not repaired by saying that scheduling and prelude costs must be counted. This witness has sublinear cost without assuming \(L(n)=o(n)\).

---

## 6. Even a one-move nonterminal block can be arranged

The zero-length interval is not essential.

Replace \(m_X\) by

\[
m_X'
 :=
 \max\!\left\{
 0,\,
 \left\lceil\frac{M_X}{H+1}\right\rceil-1
 \right\}.
\]

At the resulting activation time, either the cap already holds, or every one of the \(m_X'\) previous moves removed at least \(H+1\) targets. In the latter case,

\[
|Q_X^0|
 \le
 M_X-m_X'(H+1)
 \le H+1.
\tag{6}
\]

If the cap does not yet hold, then necessarily

\[
\Delta_X(s_X)>H
\quad\text{and}\quad
|Q_X^0|\le H+1.
\]

Shortener immediately plays a maximum-degree move. It removes at least \(H+1\) shell targets, so \(Q_X\) becomes empty and the cap holds after one processing move.

Under the standard normalization of the canonical weighted ledger,

\[
\sum_{F\in\mathscr F_X^0}w_X^0(F)=|Q_X^0|.
\]

Therefore, even if every frozen face were charged to the direct-ancestor channel during that single move,

\[
\operatorname{Anc}_X(1)
 \le |Q_X^0|
 \le H+1
 \le 2H.
\]

So the claimed estimate holds with \(C=2\). This shows that merely insisting on a formally positive processing interval does not repair the problem: Shortener may first compress the reservoir to \(O(H)\), freeze only then, and finish in one move.

---

## 7. Why this does not imply \(L(n)=o(n)\)

The cap sweep can reach

\[
\Delta_X\le H
\]

while leaving

\[
|Q_X|\asymp X.
\]

The frozen ancestor estimate is then vacuous, but the shell has not been halved. Such a capped large reservoir is exactly the difficult alternative highlighted by the fortress discussion.

The invalid step in the proposed conditional pipeline is therefore:

\[
\text{an estimate beginning from }Q_X(s_X)
\quad\Longrightarrow\quad
\text{halving progress from the original post-trapping }Q_X.
\]

Those two starting reservoirs need not be comparable. The policy can erase or cap almost all relevant structure before \(s_X\), and none of that pre-freeze history appears in \(\operatorname{Anc}_X\).

Freezing forbids resetting the ledger **after** \(s_X\); it does not stop Shortener from choosing a late first ledger.

---

## 8. The correction that actually closes the loophole

A genuine frozen-ledger theorem must distinguish the **baseline freeze time** from the later **scheduled processing time**.

Let \(b\) be the prescribed common end of trapping. At \(b\), simultaneously freeze for every shell

\[
\widehat Q_X:=Q_X(b),\qquad
\widehat{\mathscr F}_X,\qquad
\widehat w_X.
\]

If shell \(X\) is scheduled for active processing only at a later time \(s_X\), all first exits during

\[
[b,s_X]
\]

must remain on this original ledger and be included in \(\operatorname{Anc}_X\). Halving must likewise be measured relative to \(\widehat Q_X\), not relative to the smaller set \(Q_X(s_X)\).

Equivalently, define

\[
\tau_X
 :=
 \inf\left\{
 t\ge0:
 \Delta_X(b+t)\le H
 \ \text{or}\
 |Q_X(b+t)|\le\frac12|\widehat Q_X|
 \right\},
\]

and require the ancestor estimate from time \(b\), including all scheduling delay.

A fully explicit nondegeneracy condition would therefore require, for every relevant block,

\[
|\widehat Q_X|>\frac{X}{h^2},
\qquad
\Delta_X(b)>H,
\]

with every post-\(b\) move charged to the frozen ledger. The phrase “the stopping condition may not already hold merely because activation was deferred” should be replaced by these objective inequalities; “merely because” is not a mathematical predicate.

---

# Conclusion

\[
\boxed{
\begin{aligned}
&\text{Literal (AH*) is true;}\\
&\text{its witness is a precommitted }O(n/H)\text{-move cap-before-freeze sweep;}\\
&\text{the ledger is frozen once and never rebased;}\\
&\text{nevertheless every block begins at, or one move from, its stopping event.}
\end{aligned}}
\]

Thus the proposed freezing does **not** yet isolate the chronological direct-ancestor theorem. It freezes too late. The substantive statement needed by the online-area pipeline is the different assertion in which every shell’s ledger is frozen at the common post-trapping baseline and all subsequent losses, including scheduling losses, remain charged to that original ledger.

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.
