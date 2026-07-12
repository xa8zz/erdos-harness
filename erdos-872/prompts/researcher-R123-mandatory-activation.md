Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. First produce the closed statement (or the impossibility theorem) per the Problem section, then provide a full proof or disproof.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Your task continues a formulation-and-resolution loop, now at its thirteenth collapse family. Attachment 1 is the current trajectory-restricted statement (obligations only at states reachable against the policy; twelve collapse families closed). Attachments 2 and 3 are two independent audits that both break it the same way — REGISTRATION STARVATION: nothing forces the policy ever to activate a high-degree epoch or create a ticket, so both clocks stay idle and every obligation is vacuous — and both supply repair prescriptions: a mandatory-activation / no-idle ticket-coverage invariant tied to the ACTUAL shell populations (whenever a reachable state exhibits a linear live shell with degree above H, an epoch must open within a stated budget), canonical prefix-measurable witness maps for causal certificates, and fully defined epoch creation, succession, and re-registration.

Part 1 — close the loop. Produce the statement with the mandatory-activation invariant built in, all thirteen collapse families excluded, and every object the audits flagged made mathematical. Then search for a fourteenth witness yourself. If you conclude the family CANNOT be closed — that every nondegeneracy repair either admits a new starvation-type witness or re-inserts the online-area statement — prove that as a theorem instead; after five iterations that outcome is now live and would itself be decisive for the route's architecture.

Part 2 — resolve. Prove or disprove your final statement, in full, including verifying it still implies \(L(n)=o(n)\) through the stipulated pipeline (the audits show this needs the no-idle invariant explicitly).

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


## Attachment 1 (verbatim): the trajectory-restricted statement, twelve exclusions

I treat the two verbatim attachments and all “established facts” in the uploaded record as hypotheses. 

# Verdict

There is a precise trajectory-restricted replacement of the baseline-uniform statement. It closes the eleven identified collapses. A twelfth collapse also has to be excluded:

\[
\boxed{\text{post-hoc cohort selection}}
\]

Pre-registering a large universe of latent atoms is not enough if, at a later epoch, the policy may choose which still-undamaged atoms receive the unit mass. The epoch cohort and all its weights must be fixed before the moves capable of damaging it.

After making that repair, however, I do **not** obtain a valid proof or disproof of the resulting statement. The old fortress disproof is genuinely inapplicable: it supplies an off-policy state, while the corrected quantifiers require an actual Prolonger strategy that forces a bad state against every candidate Shortener policy. None of the stipulated negative constructions has that quantifier strength, and none of the stipulated positive results proves the remaining chronological direct-ancestor inequality.

The exact outcome is therefore:

\[
\boxed{
\begin{array}{c}
\text{A closed trajectory-restricted statement can be formulated,}\\[2mm]
\text{and it is sufficient for }L(n)=o(n),\\[2mm]
\text{but its truth value is not settled by the supplied results.}
\end{array}}
\]

A purported unconditional proof or disproof would have to add a genuinely new arbitrary-policy theorem at the point isolated in Part IV below.

---

# Part I. The trajectory-restricted statement

## 1. Parameters and quantifiers

Let

\[
\mathcal X_n=
\left\{
\frac{n}{2^j}:
0\le j\le\left\lfloor\log_2\frac n2\right\rfloor
\right\},
\qquad
S_X=(X/2,X]\cap\mathbb Z.
\]

Fix, outside all strategy quantifiers, a canonical datum

\[
\mathbf K^\star
=
\bigl(
\mathcal T,\Omega,\pi,w,
(\mathsf E_c)_{c\in\mathcal C},
\prec,\rho,\mathsf{Queue}
\bigr).
\]

Its components are:

1. A completely specified trapping-and-fixed-density preprocessing policy \(\mathcal T_n\), with a first prescribed stopping time \(b\) and a uniform cost \(a(n)=o(n)\). If the game ends before \(b\), its total length is already \(o(n)\).

2. A finite channel set \(\mathcal C\), containing a distinguished direct-ancestor channel \(\mathrm{anc}\), and a fixed priority order \(\prec\).

3. Canonical, prefix-measurable ledger maps \(\Omega,\pi,w\).

4. Total Boolean exit predicates
   \[
   \mathsf E_c(\omega,\mathfrak h_t)\in\{0,1\},
   \qquad c\in\mathcal C,
   \]
   together with the coverage and soundness axioms stated below.

5. A prefix-measurable relevance map \(\rho\).

6. A fixed serial queue protocol \(\mathsf{Queue}\).

Fix \(\delta>0\), and define

\[
\mathfrak T(n)=\max_{m\le n}\tau(m),
\qquad
H=\mathfrak T(n)^{1+\delta},
\qquad
r=\lfloor(\log H)^{1/3}\rfloor,
\qquad
h=H^2.
\]

Let

\[
J_H=2\lceil\log_2h\rceil+3.
\]

The required hierarchy is

\[
\varepsilon_\delta(H)H^4J_H\longrightarrow0,
\tag{1}
\]

\[
\beta_\delta(n)\longrightarrow0,
\tag{2}
\]

\[
\frac{HJ_H\log h}{h}
=
O\!\left(\frac{\log^2H}{H}\right)
\longrightarrow0,
\tag{3}
\]

and

\[
H^6=o(n).
\tag{4}
\]

The quantifier prefix is

\[
\boxed{
\mathbf K^\star\text{ fixed};\
\exists C_0>0\
\forall\delta>0\
\exists K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}_{n\ge N_\delta}\
\forall n\ge N_\delta\
\forall\Pi.
}
\tag{Q}
\]

Here \(\Sigma_{n,\delta}\) is a complete deterministic Shortener policy extending \(\mathcal T_n\). For each Prolonger policy \(\Pi\), every condition below is imposed only on the single realized play

\[
\mathfrak h(\Sigma_{n,\delta},\Pi).
\]

There is no universal quantifier over externally supplied baselines.

---

## 2. Actual baseline and actual shell populations

Let \(b=b(\Sigma,\Pi)\) be the first prescribed endpoint of \(\mathcal T_n\) on the realized play, and write

\[
B=A_b.
\]

For \(t\ge b\), define

\[
Q_X(t)=Q_X(A_t)\cap Q_X(B),
\]

and

\[
D_X(t)
=
\max_{d\in D(A_t)}
\#\{u\in Q_X(t):d\mid u\}.
\]

Everything is measured on the actual continuation from \(B\). States not reached against \(\Sigma\) carry no obligations.

---

## 3. Predictable master cohorts

For each actual baseline \(B\), shell \(X\), and potential epoch

\[
0\le j<J_H,
\]

the fixed map \(\Omega\) produces a finite atom set

\[
\Omega_{X,j}(B).
\]

There are maps

\[
\pi_{X,j}:\Omega_{X,j}(B)\to Q_X(B)
\]

and

\[
w_{X,j}:\Omega_{X,j}(B)\to(0,\infty)
\]

such that for every baseline target \(u\in Q_X(B)\),

\[
\sum_{\substack{\omega\in\Omega_{X,j}(B)\\
\pi_{X,j}(\omega)=u}}
w_{X,j}(\omega)=1.
\tag{5}
\]

Thus every potential epoch has a unit, positive-weight copy of every baseline target. All these weights are fixed at \(b\). They do not depend on:

- which atoms later become damaged;
- the future Prolonger strategy;
- the epoch start time;
- the order in which shells are serviced.

The cumulative target exposure is therefore bounded by

\[
\sum_{j<J_H}
\sum_{\substack{\omega\in\Omega_{X,j}(B)\\
\pi_{X,j}(\omega)=u}}
w_{X,j}(\omega)
\le J_H.
\tag{6}
\]

An epoch cohort is activated solely by target survival:

\[
\Omega^{\mathrm{act}}_{X,j}
=
\{\omega\in\Omega_{X,j}(B):
\pi_{X,j}(\omega)\in Q_X(s_{X,j})\},
\tag{7}
\]

where \(s_{X,j}\) is the actual service-start time. No damaged atom may be replaced by an undamaged atom at activation.

This is the repair of post-hoc cohort selection.

---

## 4. Global first exits and inherited damage

For every master atom, define its exit time from the original baseline, not from its epoch start:

\[
\xi(\omega)
=
\min\left\{
t\ge b:
\max_{c\in\mathcal C}
\mathsf E_c(\omega,\mathfrak h_t)=1
\right\},
\tag{8}
\]

with \(\xi(\omega)=\infty\) if no exit occurs.

If \(\xi(\omega)<\infty\), define

\[
\chi(\omega)
=
\min_{\prec}
\{c:\mathsf E_c(\omega,\mathfrak h_{\xi(\omega)})=1\}.
\tag{9}
\]

The predicates satisfy:

### Coverage

Whenever a canonical atom becomes permanently unusable for the accepted repair procedure, at least one \(\mathsf E_c\) is true.

### Soundness

Each true \(\mathsf E_c\) carries the fixed arithmetic certificate belonging to channel \(c\). In particular, \(\mathsf E_{\mathrm{anc}}\) may be true only when the atom’s prescribed ancestor has become unavailable through the designated direct-ancestor mechanism.

### Irreversibility

Once an atom exits, its channel never changes.

For an active epoch, define

\[
\operatorname{Anc}_{X,j}(t)
=
\sum_{\substack{
\omega\in\Omega^{\mathrm{act}}_{X,j}\\
\xi(\omega)\le t\\
\chi(\omega)=\mathrm{anc}
}}
w_{X,j}(\omega).
\tag{10}
\]

Crucially, atoms with

\[
\xi(\omega)<s_{X,j}
\]

are included. They are inherited debt; they are not born fresh at the epoch boundary.

---

## 5. Actual progress and the causal clock

Let

\[
m_{X,j}=|Q_X(s_{X,j})|
\]

and

\[
\mathsf A_{X,j}(t)
=
|Q_X(s_{X,j})\setminus Q_X(t)|.
\tag{11}
\]

This counts actual target deaths and transfers out of the live nonminimal shell population.

The causal clock starts at the common baseline:

\[
\ell_{X,j}(t)
=
\sum_{i=b+1}^{t}
\rho_{X,j}(\mathfrak h_{i-1},z_i),
\tag{12}
\]

where

\[
\rho_{X,j}(\mathfrak h_{i-1},z_i)\in\{0,1\}.
\]

The relevance map must obey:

> Every move used in a causal certificate for an atom in  
> \(\Omega^{\mathrm{act}}_{X,j}\), including a move made before \(s_{X,j}\), has \(\rho_{X,j}=1\).

Thus a setup move that damages a future epoch cannot disappear from that epoch’s clock.

The local and global budgets are

\[
\ell_{X,j}(\tau_{X,j})
\le
K_\delta m_{X,j}\frac{\log h}{h},
\tag{13}
\]

and

\[
H\sum_{X,j}
\ell_{X,j}(\tau_{X,j})
\le
\beta_\delta(n)n.
\tag{14}
\]

The first prevents inherited setup credit from making a particular epoch vacuous. The second prevents one actual move from providing unlimited credit to many future cohorts.

---

## 6. A separate service clock

The eleventh collapse arises if \(\ell_{X,j}\) is treated as elapsed service time. It is not.

Let

\[
v_{X,j}(t)
\]

be the number of actual Shortener turns assigned by the serial scheduler to epoch \((X,j)\) by time \(t\). Define

\[
B_\delta(m)
=
\left\lceil
K_\delta m\frac{\log h}{h}
\right\rceil.
\tag{15}
\]

Every active epoch receives at most \(B_\delta(m_{X,j})\) service turns before its high-degree deadline.

The scheduler is serial and work-conserving:

1. At most one ticket is being serviced at any time.

2. Every Shortener turn while a ticket is active increments that ticket’s \(v\), regardless of whether the move receives causal credit in \(\ell\).

3. A move made for another shell still consumes the current ticket’s service slot.

4. Waiting tickets are ordered by a fixed FIFO rule with a fixed shell tie-breaker.

5. There is at most one outstanding ticket per shell.

6. A ticket that has already achieved its contraction while waiting is discharged as helpful progress.

Consequently there is no sequence of arbitrarily many actual turns on which every relevant service clock remains frozen.

---

## 7. High-degree tickets

An epoch is audited only if

\[
X\ge H^6,
\qquad
m_{X,j}>\frac{X}{h^2}=\frac{X}{H^4}.
\tag{16}
\]

Hence

\[
\frac{m_{X,j}}H
>
\frac{X}{H^5}
\ge H.
\tag{17}
\]

This is the frozen-mass domination condition.

If

\[
D_X(s_{X,j})>H,
\]

define the high-degree stopping time as the first of:

\[
|Q_X(t)|
\le
\frac12m_{X,j}+\frac{X}{h^2},
\tag{18}
\]

\[
D_X(t)\le H,
\tag{19}
\]

or

\[
v_{X,j}(t)=B_\delta(m_{X,j}).
\tag{20}
\]

The trajectory-restricted ancestor-harvest inequality is

\[
\boxed{
\operatorname{Anc}_{X,j}(t)
\le
\varepsilon_\delta(H)X
+
C_0\mathsf A_{X,j}(t)
+
C_0H\ell_{X,j}(t)
}
\tag{TR-AH}
\]

for every actual prefix

\[
s_{X,j}\le t\le\tau_{X,j},
\]

including the stopping move.

---

## 8. Capped tickets

Whenever, on the actual play,

\[
X\ge H^6,
\qquad
q=|Q_X(c)|>\frac{X}{h^2},
\qquad
D_X(c)\le H,
\tag{21}
\]

a single capped ticket is generated for shell \(X\).

If it waits in the queue, every move during the wait remains visible to the global atom ledger and causal clocks. If, before service begins,

\[
|Q_X|\le\frac12q+\frac{X}{h^2},
\]

the ticket is discharged by actual progress.

Otherwise it receives

\[
B_\delta(q)
\]

Shortener service turns and must satisfy

\[
\boxed{
|Q_X(\mathrm{end})|
\le
\frac12q+\frac{X}{h^2}.
}
\tag{TR-CAP}
\]

A shell already carrying a ticket cannot retrigger another one. If a high-degree ticket crosses the cap, it converts into its unique capped successor; it does not erase or renormalize its old ledger.

This clause applies only to capped states actually reached against \(\Sigma\).

---

## 9. The final statement

Call the conjunction

\[
\boxed{
\mathrm{TRMEAH}^{\sharp}(\mathbf K^\star)
}
\]

of

\[
(\mathrm{TR\!-\!AH}),
\quad
(\mathrm{TR\!-\!CAP}),
\quad
(5)\text{--}(17),
\]

the **trajectory-restricted master-ledger ancestor-harvest statement**.

Its operative quantifiers are

\[
\exists\Sigma\ \forall\Pi\
P\bigl(\operatorname{Play}(\Sigma,\Pi)\bigr),
\]

not

\[
\exists\Sigma\ \forall A\in\mathcal B_n\ \forall\Pi\
P(\Sigma,A,\Pi).
\]

That is the load-bearing correction.

---

# Part II. Nondegeneracy

## 1. Terminal delay

An audited epoch has positive mass exceeding \(X/h^2\). It therefore cannot be initialized at a terminal position.

The ledger is frozen at the prescribed actual baseline, and all inequalities are prefix inequalities. Ending the game later does not erase an earlier ancestor jump.

If the game terminates during the fixed \(o(n)\)-move preprocessing policy, that is genuine sublinear termination.

---

## 2. Prelude delay

The preprocessing policy and its first endpoint are fixed outside the existential continuation policy. Shortener cannot redefine the baseline after seeing later play.

Any clearing sweep admitted before the baseline is part of the fixed preprocessing algorithm and has its actual \(o(n)\) cost. Any later sweep occurs under the already existing master ledger.

---

## 3. Cap before the freeze

If the actual baseline is already capped and its shell mass exceeds the dust threshold, it immediately produces a capped ticket.

Thus cap attainment cannot make the active domain empty unless the remaining mass is already globally negligible.

---

## 4. Shell deferral and raw-time credit

Unrelated elapsed time does not enlarge the term \(H\ell\), because \(\ell\) is causal rather than temporal.

Conversely, unrelated elapsed time cannot be ignored: every Shortener turn consumes the unique active ticket’s service budget \(v\). Hence neither “delay for free credit” nor “delay with zero credit” is possible.

---

## 5. Zero weights and omitted targets

Equation (5) gives exact unit mass on every target in every potential cohort, with strictly positive weights.

The policy cannot discard inconvenient targets or assign them zero mass.

---

## 6. First-exit reassignment

The first global exit time and the priority order (8)–(9) are immutable.

A later target death, residual lift death, or boundary event cannot relabel an earlier direct-ancestor exit.

---

## 7. Collapse to the cost-only statement

The baseline is the first endpoint of a fixed structural procedure, not a strategy-dependent terminal witness.

The estimates are tested on early prefixes. Merely knowing that some policy eventually terminates in \(o(n)\) moves supplies no proof of the first-move or first-epoch inequalities.

The parameter \(H\) is fixed arithmetically from \(\mathfrak T(n)\); it cannot be chosen as \(n/(L(n)+1)\).

---

## 8. Micro-baseline compression

If preprocessing reduces every large shell below

\[
X/h^2,
\]

then

\[
\sum_{X\in\mathcal X_n}\frac{X}{h^2}
<\frac{2n}{h^2}=o(n).
\]

The shells \(X<H^6\) contain only \(O(H^6)=o(n)\) integers.

Thus compression below the activity threshold is genuine global progress. If a shell retains more than dust, it necessarily creates a high-degree or capped ticket.

---

## 9. Cap escape

Crossing from \(D_X>H\) to \(D_X\le H\) does not terminate the obligation. It creates or converts to the unique capped ticket.

The ledger, area, and clocks are not reset.

---

## 10. Epoch-boundary laundering

Exit times are measured from the common baseline \(b\), and ancestor mass includes atoms with

\[
\xi(\omega)<s_{X,j}.
\]

Every causal move responsible for that inherited damage is included in the cohort’s clock, even if it occurred during an earlier epoch.

Therefore an atom cannot be born already damaged with neither debt nor causal cost.

---

## 11. Uncharged scheduling delay

The service counter \(v\) is distinct from the credit counter \(\ell\).

Every actual Shortener turn while a ticket is active increments \(v\), even when \(\rho=0\). The serial queue ensures that a ticket cannot be postponed behind an infinite sequence of zero-cost moves.

The gap identified in the audit,

\[
\ell\text{ small}
\not\Rightarrow
\text{few actual turns},
\]

is closed by explicitly budgeting actual service turns.

---

## 12. Post-hoc cohort selection

Here is the additional collapse.

Suppose each target has many pre-registered latent signatures. An earlier blocker destroys one subset of them. If, at epoch activation, the policy is allowed to choose a fresh unit-weight distribution supported only on surviving signatures, the old damage disappears even though the latent universe was nominally pre-registered.

That is not ordinary epoch-boundary laundering: even global exit times do not help if the cohort itself is selected after the exits are known.

Equations (5)–(7) close it. Every epoch’s weights are fixed at the original baseline, and activation depends only on target survival and the epoch number. Pre-exited signatures remain in the active cohort as inherited debt.

---

## Additional formal closures

The serial queue also resolves conflicting simultaneous CAP triggers. Channel coverage prevents \(I_{\mathrm{anc}}\equiv0\). Prefix measurability prevents ledger data from depending retrospectively on the future Prolonger strategy.

---

# Part III. Why the statement implies \(L(n)=o(n)\)

Consider an audited high-degree ticket.

The accepted residual-channel estimate, the atomic ledger, prime guards, ordinary-failure bounds, high-\(\operatorname{lcm}\) truncation, boundary estimates, and exact/minimal banks control every channel except the direct-ancestor channel.

Adding \((\mathrm{TR\!-\!AH})\) gives, before the service deadline,

\[
\operatorname{Repair}_{X,j}(t)
\le
o(m_{X,j})
+
C_0\mathsf A_{X,j}(t)
+
O(H\ell_{X,j}(t))
+
\varepsilon_\delta(H)X.
\tag{22}
\]

By (13),

\[
H\ell_{X,j}(\tau)
\le
K_\delta
m_{X,j}\frac{H\log h}{h}
=
o(m_{X,j}).
\tag{23}
\]

Since

\[
m_{X,j}>\frac{X}{H^4},
\]

equation (1) gives

\[
\varepsilon_\delta(H)X
=
o\!\left(\frac{m_{X,j}}{J_H}\right).
\tag{24}
\]

The stipulated advance-depletion reduction then shows that the high-degree service deadline cannot occur while both

\[
D_X>H
\]

and

\[
|Q_X|>
\frac12m_{X,j}+\frac{X}{h^2}
\]

remain true. Hence the ticket either contracts or enters capped mode.

The capped mode gives the same contraction by \((\mathrm{TR\!-\!CAP})\). Thus every completed macro-epoch satisfies

\[
m_{X,j+1}
\le
\frac12m_{X,j}+\frac{X}{h^2}.
\tag{25}
\]

After \(O(\log h)\) macro-epochs,

\[
m_{X,j}=O(X/h^2).
\tag{26}
\]

Moreover,

\[
\sum_jm_{X,j}=O(X),
\]

so the total Shortener service allocated to shell \(X\) is

\[
O\!\left(
\frac{\log h}{h}\sum_jm_{X,j}
\right)
=
O\!\left(\frac{X\log h}{h}\right).
\tag{27}
\]

Summing over the disjoint dyadic shells,

\[
\sum_X O\!\left(\frac{X\log h}{h}\right)
=
O\!\left(\frac{n\log h}{h}\right)
=o(n).
\tag{28}
\]

The queue is work-conserving, so waiting creates no additional unaccounted actual turns. The small shells contribute \(O(H^6)=o(n)\), and the dust contributes \(O(n/h^2)=o(n)\).

Adding the fixed \(o(n)\)-move preprocessing stage and applying the stipulated static-completion endgame yields

\[
L(n)=o(n).
\]

Therefore

\[
\boxed{
\mathrm{TRMEAH}^{\sharp}(\mathbf K^\star)
\Longrightarrow
L(n)=o(n).
}
\tag{29}
\]

---

# Part IV. Resolution attempt

## 1. Why the fortress no longer disproves the statement

The old argument had the quantifier form

\[
\forall\Sigma\ \exists A^\star\in\mathcal B_n:
\neg\mathrm{CAP}(\Sigma,A^\star).
\]

The corrected negation would require

\[
\forall\Sigma\ \exists\Pi:
A^\star\in
\operatorname{Play}(\Sigma,\Pi).
\]

These are not equivalent.

For a policy incorporating the established fixed-density clearing sweep, the low-cap linear fortress is not on the trajectory. Supplying it as a hypothetical starting node is forbidden by the new statement.

Thus the erosion estimate

\[
q-|Q^T|
\le H_0T+2T+o(n)
\]

remains correct **conditional on fortress entry**, but no stipulated theorem forces that entry against the clearing policy.

---

## 2. What a genuine disproof must construct

A disproof must establish, for some fixed \(\delta>0\),

\[
\forall\Sigma\
\exists n\ \exists\Pi
\]

such that on the realized play at least one of the following occurs:

1. A reached high-degree epoch and prefix satisfy
   \[
   \operatorname{Anc}_{X,j}(t)
   >
   \varepsilon_\delta(H)X
   +
   C_0\mathsf A_{X,j}(t)
   +
   C_0H\ell_{X,j}(t).
   \]

2. A reached capped ticket retains more than
   \[
   \frac12q+\frac{X}{h^2}
   \]
   after its full service budget.

3. The fixed global clock or service budget is necessarily exceeded.

The known counterexamples do not do this:

- The primorial fortress is only known to be obtainable on some play, not forceable against the clearing policy.
- The private-carrier construction defeats every ordering of one fixed minimal layer, but not arbitrary cross-cone or guard moves.
- The literal maximum-degree anchor exploit is defeated by a legal packet guard.
- The \(128\)-versus-\(48\) history refutes an instantaneous-to-lifetime promotion but does not force a linear weighted ancestor jump against every policy.
- The one-carrier example is a pointwise jump; its required prehistory can be harvested or prevented by a general policy.
- The raw-shadow construction does not force linearly many surviving later minimal elements.
- The example \(\{6,35\}\) defeats one common-blocker rule, not every possible policy.

So no supplied negative theorem has the necessary

\[
\forall\Sigma\exists\Pi
\]

quantifiers.

---

## 3. What a genuine proof must establish

The positive direction needs a chronology-stable online transversal theorem for the reverse orientation

\[
c\mid a_F.
\]

Concretely, it must show that along one complete policy’s actual trajectories, direct-ancestor first exits admit a causal allocation satisfying

\[
\operatorname{Anc}
\le
o(X)+O(\mathsf A)+O(H\ell)
\]

with both the local and global clock budgets.

The stipulated facts do not supply it:

- The atomic ledger controls the opposite orientation \(\kappa(F)\mid c\).
- Exhaustion cost counts actual lift deaths, whereas a direct ancestor can erase a face before its lifts die.
- All-orders witness inequalities are static and permit a shared low-lcm core.
- Frozen coded repairs have no chronological Lipschitz bound.
- Root-indexed first blockers apply to a restricted minimal-layer sweep and are too weak in the early generations.
- Fixed-density clearing controls constant-density reservoirs at sufficiently low caps; it does not give the shrinking-density, all-shell chronological inequality.
- The refinement-forest theorem describes what a counterexample must look like, but gives neither a policy that destroys it nor a Prolonger strategy that maintains it.

A full proof therefore needs a new online weighted-hitting or no-repetition theorem. A full disproof needs an arbitrary-policy persistent direct-ancestor cascade.

---

# Final conclusion

The correct repaired target is

\[
\boxed{\mathrm{TRMEAH}^{\sharp}(\mathbf K^\star)}
\]

with:

\[
\text{actual-trajectory quantifiers},
\]

\[
\text{globally monitored, predictable epoch cohorts},
\]

\[
\text{immutable first exits and complete channels},
\]

\[
\text{local and global causal-clock budgets},
\]

\[
\text{a separate actual-service counter},
\]

\[
\text{a serialized capped-state queue},
\]

and

\[
\text{no post-hoc choice of undamaged signatures}.
\]

It is nondegenerate against all eleven stated collapses and the additional post-hoc-cohort collapse. It implies \(L(n)=o(n)\).

But the supplied facts prove neither

\[
\mathrm{TRMEAH}^{\sharp}
\]

nor its negation. In particular, the valid off-path fortress argument cannot be recycled under the corrected reachability quantifiers. The remaining separator is exactly:

\[
\boxed{
\begin{minipage}{0.88\linewidth}
Either construct one complete Shortener policy giving a
chronology-stable direct-ancestor allocation on every realized play, or
construct one Prolonger strategy which, against every complete policy,
forces a reached prefix with large ancestor mass, small actual area, and
small charged clock.
\end{minipage}}
\]

I am not confident that either direction can be completed from the stipulated lemmas alone; asserting otherwise would conceal the missing arbitrary-policy theorem rather than prove it.

## Attachment 2 (verbatim): first audit — epoch-suppression witness, seven-item well-formedness repair list

I audited the uploaded statement as written, including the literal Section 9 conjunction rather than silently supplying missing scheduler axioms. 

## Verdicts

| Issue | Verdict | Decisive point |
|---|---|---|
| **A. Well-formedness** | **REPAIRABLE** | The on-path strategy quantifier is clear, but ticket creation, epoch succession, causal witnesses, and several outer quantifiers are not fully defined. |
| **B. Nondegeneracy** | **REFUTED** | There is a thirteenth collapse: **post-hoc epoch suppression / null registration**. Potential cohorts may all be pre-registered while no high-degree epoch is ever activated. |
| **C. Inapplicability and implication** | **REPAIRABLE** | The off-path fortress objection is indeed inapplicable, but the stated negation is not exact and the \(L(n)=o(n)\) derivation assumes an unstated total-service-cover invariant. |

# A. Well-formedness — **REPAIRABLE**

The trajectory restriction itself is correctly expressed. A deterministic \(\Sigma_{n,\delta}\) is chosen before \(\Pi\), and all subsequent quantities are evaluated on the one realized play, with \(B=A_b\). Thus there is genuinely no obligation at externally supplied baselines. 

But the Section 9 box is not yet a single closed mathematical proposition.

### 1. \(\mathbf K^\star\) is neither concretely specified nor quantified

The text says “\(\mathbf K^\star\) fixed,” but only gives axiomatic descriptions of its components. It never says whether the theorem is:

\[
\forall \mathbf K^\star\in\mathcal K,\qquad
\exists \mathbf K^\star\in\mathcal K,
\]

or about one explicitly defined datum. Different admissible choices of exit predicates, priorities, relevance maps, and queue protocols give different statements. 

Similarly, \(\varepsilon_\delta\) and \(\beta_\delta\) are used as functions but their domains, codomains, nonnegativity, and the precise meaning of their limits are unstated. \(K_\delta\) should explicitly satisfy \(0<K_\delta<\infty\).

### 2. There is no high-degree ticket-generation rule

Section 7 says:

> “An epoch is audited only if …”

and then:

> “If \(D_X(s_{X,j})>H\), define the stopping time …”

This presupposes an already existing \(s_{X,j}\). It gives a necessary condition for auditing, not a rule saying that a shell satisfying the condition must generate an epoch. In contrast, capped tickets are introduced with an explicit “Whenever” trigger. 

Missing are recursive definitions of:

- when epoch \(j=0\) is registered;
- when \(s_{X,j}\) exists;
- when the successor \(j+1\) is registered;
- whether cancellation is allowed;
- what happens after a waiting ticket contracts but remains above dust;
- how a completed capped ticket retriggers;
- whether every post-baseline Shortener turn belongs to some ticket.

The sentence in Part II that every non-dust shell “necessarily creates a high-degree or capped ticket” is therefore an assertion, not a consequence of the formal clauses. 

### 3. The final conjunction omits the ticket domains and stopping rules

Section 9 defines the final statement as the conjunction of

\[
(\mathrm{TR\!-\!AH}),\quad
(\mathrm{TR\!-\!CAP}),\quad
(5)\text{--}(17).
\]

That literally omits conditions (18)–(21), including all three high-degree stopping events and the capped-ticket trigger. It also omits the unnumbered coverage, soundness, irreversibility, and queue axioms. 

A charitable reader can import all preceding prose, but then the Section 9 box is not itself the claimed closed statement.

### 4. “Used in a causal certificate” is not a mathematical relation

The clock requirement says every move “used in a causal certificate” must receive \(\rho=1\), but no canonical witness set is defined. If several certificates exist, it is unclear whether \(\rho\) must cover:

\[
\text{one selected certificate},\qquad
\text{all certificates},\qquad
\text{or some minimal certificate}.
\]

That distinction changes both local and global clock budgets. 

### 5. The first-exit channels need an exact partition axiom

Coverage only says that at least one channel fires. Soundness says that a true channel has an appropriate certificate. Neither says that direct-ancestor exits must be classified as \(\mathrm{anc}\), or that two channels cannot claim the same first exit. This is also the basis of the second degeneracy discussed below.

### Repair

A precise version should add a recursively defined ticket process \(\mathcal E(\mathfrak h_t)\) with these invariants:

1. Whenever \(X\ge H^6\), \(|Q_X(t)|>X/h^2\), and shell \(X\) has no outstanding ticket, its next unused epoch is immediately enqueued.
2. Its mode is high-degree when \(D_X(t)>H\), otherwise capped.
3. Every post-baseline Shortener turn before the static endgame increments exactly one active service clock.
4. A ticket can leave the system only through contraction, high-to-cap conversion, its stipulated deadline, or terminal play.
5. After contraction, a successor is immediately generated if the residual remains above dust.
6. A canonical first-cause map assigns exactly one channel to each first exit.
7. Each causal certificate has an explicitly defined finite witness set of move indices.
8. Conditions (1)–(21), all queue/channel axioms, and terminal conventions are included in the final formula.

With those additions, the obligations can still range exclusively over actual trajectories.

# B. Nondegeneracy — **REFUTED**

## Thirteenth collapse: **post-hoc epoch suppression**

The twelve exclusions freeze the contents of a cohort after an epoch is selected. They do not force any high-degree epoch to be selected.

Here is the witness.

### The data

After the stipulated preprocessing, let Shortener use the completely deterministic legal policy

\[
\Sigma_{\min}(A)
=
\min\{z\in\{2,\ldots,n\}:z\text{ is legal at }A\}.
\]

For the master cohorts, take the entirely nondegenerate unit-copy system

\[
\Omega_{X,j}(B)
=
\{(u,j):u\in Q_X(B)\},
\qquad
\pi_{X,j}(u,j)=u,
\qquad
w_{X,j}(u,j)=1.
\]

Thus every target has exactly unit weight in every potential epoch; equations (5) and (6) hold.

Now choose the fixed queue protocol:

\[
\mathsf{RegisterHigh}(X,j,\mathfrak h_t)\equiv0.
\]

In words: no high-degree potential epoch is ever registered or assigned a service-start time.

### Why it satisfies every stated queue property

The six queue conditions only regulate active or waiting tickets:

- at most one ticket is active;
- turns increment \(v\) while a ticket is active;
- waiting tickets obey FIFO;
- at most one ticket is outstanding per shell.

The empty high-degree queue satisfies all of them vacuously. Work conservation says that waiting work must be serviced; it does not say that eligible work must be created. 

Consequently:

- no \(s_{X,j}\) exists for a high-degree epoch;
- no \(\Omega^{\mathrm{act}}_{X,j}\) is formed;
- no \(\tau_{X,j}\) exists;
- \((\mathrm{TR\!-\!AH})\) has no instances;
- the local clock inequalities have no instances;
- the global clock sum over actual epochs is \(0\).

Arbitrarily many actual moves may therefore occur in high-degree states without any service clock being “frozen”: there simply is no service clock. This is **not** collapse 11, which assumes that a ticket is already active. It is also not post-hoc cohort selection: every potential cohort and every weight is honestly fixed at \(b\); the policy merely suppresses activation of all of them.

Under the literal Section 9 conjunction, the capped trigger (21) is also not included, so the same queue can generate no capped tickets either. Then both substantive boxed obligations have empty domains.

Under the most charitable reading, where Section 8’s “Whenever” clause is imported despite its omission from Section 9, capped tickets remain. But the entire high-degree direct-ancestor problem has still been bypassed; one may combine the null high-degree registration rule with whatever stipulated capped-clearing module the manuscript already assumes. The claimed new chronological work is never performed.

This is exactly the missing axiom:

\[
\boxed{
X\ge H^6,\quad |Q_X(t)|>\frac{X}{h^2},
\quad\text{no outstanding ticket}
\ \Longrightarrow\
\text{a ticket is registered at }t.
}
\]

It must apply at the baseline and immediately after every ticket discharge.

## Independent additional loophole: channel-priority laundering

The manuscript also states that “channel coverage prevents \(I_{\mathrm{anc}}\equiv0\).” That is false. 

Introduce a duplicate channel \(\mathrm{anc}'\) carrying exactly the same arithmetic direct-ancestor certificate, and put

\[
\mathrm{anc}'\prec\mathrm{anc}.
\]

Set

\[
\mathsf E_{\mathrm{anc}'}
=
\text{the designated direct-ancestor predicate},
\qquad
\mathsf E_{\mathrm{anc}}\equiv0.
\]

All direct-ancestor exits remain covered and sound; irreversibility is unchanged. But every such exit has

\[
\chi(\omega)=\mathrm{anc}',
\]

so

\[
\operatorname{Anc}_{X,j}(t)\equiv0.
\]

Coverage is existential over channels, while soundness is only one-way. Neither supplies **completeness of the distinguished ancestor channel**. The fixed priority order makes simultaneous first-exit laundering permanent. 

The repair is to require a unique canonical cause map, or at minimum:

\[
\chi(\omega)=\mathrm{anc}
\quad\Longleftrightarrow\quad
\omega\text{ first becomes unusable by the designated direct-ancestor mechanism}.
\]

# C. Inapplicability and implication — **REPAIRABLE**

## 1. The fortress inapplicability claim is substantively correct

The core logical distinction is valid:

\[
\forall\Sigma\ \exists A^\star:
\neg P(\Sigma,A^\star)
\]

does not imply

\[
\forall\Sigma\ \exists\Pi\ \exists t:
\neg P(\Sigma,A_t(\Sigma,\Pi)).
\]

An off-policy fortress can refute a statement uniform over all baselines. It cannot refute an existential complete policy whose obligations concern only states reached against that policy. To reuse the fortress, Prolonger must force entry into a fortress or force some other on-path violating prefix. The conditional bounded-erosion estimate by itself does not provide that forcing theorem. 

Likewise, accepting the document’s descriptions of the stipulated lemmas, none supplies the missing arbitrary-policy chronological direct-ancestor allocation. That assessment of the **intended repaired target** is reasonable.

## 2. The claimed negation is not exact

Suppressing \(\mathbf K^\star\), write the statement as

\[
\exists C_0>0\
\forall\delta>0\
\exists\Theta_\delta\
\forall n\ge N_\delta\
\forall\Pi\
P(C_0,\delta,\Theta_\delta,n,\Pi),
\]

where \(\Theta_\delta\) contains

\[
K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}_{n\ge N_\delta}.
\]

Its negation is

\[
\boxed{
\forall C_0>0\
\exists\delta>0\
\forall\Theta_\delta\text{ admissible}\
\exists n\ge N_\delta\
\exists\Pi:
\neg P(C_0,\delta,\Theta_\delta,n,\Pi).
}
\]

The manuscript’s shorthand

\[
\text{“for some fixed }\delta,\quad
\forall\Sigma\exists n\exists\Pi”
\]

omits the universal quantifiers over \(C_0,K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta\), and it obscures that \(\Sigma\) is an \(n\)-indexed family. A single fixed \(\delta\) working for every \(C_0\) would be a stronger sufficient disproof, not the literal negation. 

## 3. Trajectory restriction itself does not damage the implication

If there is one complete Shortener policy \(\Sigma_n\) such that

\[
\sup_\Pi
|\operatorname{Play}(\Sigma_n,\Pi)|
=o(n),
\]

then immediately

\[
L(n)\le
\sup_\Pi
|\operatorname{Play}(\Sigma_n,\Pi)|
=o(n).
\]

No control of states that \(\Sigma_n\) never reaches is required. In fact, the actual-trajectory quantifier is exactly what a game-value upper bound needs.

## 4. But the written ticket statement does not establish that play-length bound

Part III bounds the number of **allocated service turns**:

\[
O\!\left(\frac{\log h}{h}\sum_jm_{X,j}\right),
\]

then concludes that work conservation leaves no unaccounted time. 

That conclusion silently assumes:

\[
\boxed{
\text{Every post-baseline Shortener turn before the endgame
is assigned to exactly one active ticket.}
}
\]

The queue axioms establish only the weaker statement:

\[
\text{if a ticket exists, its service cannot be frozen.}
\]

They do not ensure:

- an initial high-degree ticket exists;
- a successor ticket exists after contraction;
- a shell above dust cannot become ticketless;
- a completed capped ticket retriggers when residual mass remains;
- the intervals covered by active tickets partition the actual continuation.

Thus the service estimate may account for every turn in the union of service intervals while leaving arbitrary gaps outside that union. “Work-conserving” does not fill a queue that the registration protocol leaves empty.

There is also a smaller accounting omission:

\[
B_\delta(m)
=
\left\lceil K_\delta m\frac{\log h}{h}\right\rceil
\]

gives an additive \(1\) per epoch. Once registration is fixed, this merely contributes

\[
O(J_H\log n)=o(n)
\]

over all shells, so it is repairable rather than fatal.

## 5. After the registration repair, the implication works

Let

\[
d_X=\frac{X}{h^2}.
\]

If every completed epoch has a successor whenever its residual exceeds \(d_X\), then

\[
m_{j+1}\le\frac12m_j+d_X
\]

implies

\[
m_j\le 2^{-j}m_0+2d_X.
\]

Since \(m_0\le X\), after \(2\lceil\log_2h\rceil+O(1)\) epochs,

\[
m_j=O(d_X),
\]

and

\[
\sum_jm_j=O(X).
\]

The actual service for shell \(X\) is then

\[
\sum_j
\left\lceil
K_\delta m_j\frac{\log h}{h}
\right\rceil
=
O\!\left(\frac{X\log h}{h}\right)+O(J_H).
\]

Summing over the \(O(\log n)\) dyadic shells yields

\[
O\!\left(\frac{n\log h}{h}\right)
+
O(J_H\log n)
=o(n).
\]

If every post-baseline Shortener turn is assigned exactly once, alternation gives at most twice that many total moves, plus one. Adding the stipulated preprocessing, small-shell, dust, and static-completion costs then proves \(L(n)=o(n)\).

# Bottom line

The central off-path/on-path correction is real. The old fortress does not disprove the intended trajectory-restricted theorem.

But the manuscript has not yet written that intended theorem. Its present box permits **epoch-registration starvation**, and its channel axioms permit **ancestor-channel laundering**. Part III then assumes the missing registration invariant when converting ticket budgets into a bound on total play.

Accordingly, the defensible conclusion is:

\[
\boxed{
\begin{array}{c}
\text{The intended on-path theorem can be repaired and would imply }L(n)=o(n),\\[1mm]
\text{the fortress still would not refute that repaired theorem,}\\[1mm]
\text{but the current Section 9 statement is degenerate and its}\\
\text{claimed implication is not established as written.}
\end{array}}
\]

## Attachment 3 (verbatim): second audit — registration-starvation witness, witness-map prescription, no-idle invariant for the implication

I audited the uploaded statement as written, including the literal Section 9 definition rather than the theorem the surrounding prose appears to intend. 

| Question | Verdict | Decisive issue |
|---|---|---|
| **A. Well-formedness** | **REFUTED** | High-degree epoch creation and re-registration are never defined; several displayed obligations therefore have unbound or partial objects. |
| **B. Nondegeneracy** | **REFUTED** | A thirteenth collapse exists: **high-degree registration starvation**. The queue may simply never create a high-degree ticket, leaving both clocks inactive. |
| **C. Inapplicability and implication** | **REPAIRABLE** | The off-path/on-path fortress distinction is correct, but the full negation is misstated and the \(L(n)=o(n)\) derivation silently assumes a missing no-idle ticket-coverage invariant. |

# A. Well-formedness — **REFUTED**

The reachability idea itself is sound: after fixing \(\Sigma_{n,\delta}\), requiring the inequalities only on histories produced by some Prolonger policy is a coherent pathwise restriction. The failure is that the document never defines which high-degree histories become audited histories.

## The fatal missing definition

The following objects are used:

\[
s_{X,j},\qquad m_{X,j}=|Q_X(s_{X,j})|,\qquad
\Omega^{\mathrm{act}}_{X,j},\qquad
v_{X,j},\qquad
\tau_{X,j}.
\]

But there is no rule assigning \(s_{X,j}\).

Section 7 says only:

- an epoch is audited **only if** the size conditions hold; and
- **if** \(D_X(s_{X,j})>H\), then a stopping time is defined.

Those are filters on an epoch that already exists. Neither is an epoch-generation rule. In contrast, Section 8 explicitly says that a capped state generates a capped ticket. 

Nothing says:

\[
\begin{split}
&\text{whenever }X\ge H^6,\quad |Q_X(t)|>X/h^2,\quad D_X(t)>H,\\
&\text{and shell }X\text{ has no outstanding ticket,}\\
&\text{the next unused epoch }j\text{ is registered and enqueued.}
\end{split}
\tag{R}
\]

Nor is there a rule saying that, after an epoch contracts, the next epoch is immediately registered if the shell remains above dust.

Consequently:

- \(s_{X,j}\) may never exist;
- \(\tau_{X,j}\) may never exist;
- the sum in (14) has no specified index set;
- “work-conserving” only controls tickets already in the queue;
- a live high-degree shell may generate no service obligation at all.

The manuscript later asserts that every shell above dust “necessarily creates a high-degree or capped ticket,” but that is not a consequence of any formal clause preceding Section 9. 

## The literal Section 9 conjunction is also incomplete

Section 9 defines the statement as the conjunction of

\[
(\mathrm{TR\!-\!AH}),\qquad
(\mathrm{TR\!-\!CAP}),\qquad
(5)\text{--}(17).
\]

Literally, this omits:

- the hierarchy (1)–(4);
- the quantifier prefix (Q);
- coverage, soundness and irreversibility;
- the queue axioms;
- stopping events (18)–(20);
- the capped trigger (21);
- ticket conversion and re-registration rules.

At best, the reader must guess that all surrounding prose is imported into the labels. Even under that charitable reading, rule (R) is absent. 

## Further formal incompletenesses

These are secondary to the missing registration rule, but real:

1. **\(\mathbf K^\star\) is not a closed quantified object.** It is declared “fixed,” but no admissible class is defined and no actual canonical datum is supplied. A theorem conditional on a named datum is legitimate; an abstract list of semantically described maps is not yet such a datum.

2. **“Causal certificate” is not a mathematical object.** There should be a fixed prefix-measurable witness map
   \[
   \Gamma_c(\omega,\mathfrak h_t)\subseteq\{1,\ldots,t\}
   \]
   specifying exactly which moves constitute the certificate. Otherwise the clock requirement depends on an unspecified choice of proof.

3. **“Permanently unusable for the accepted repair procedure” and “the prescribed ancestor” are not defined predicates.** Coverage and soundness therefore remain prose obligations.

4. **Parameter types are missing.** At minimum one needs
   \[
   K_\delta>0,\qquad
   \varepsilon_\delta:\mathbb R_{>0}\to\mathbb R_{\ge0},\qquad
   \beta_\delta:\mathbb N\to\mathbb R_{\ge0},
   \]
   and \(N_\delta\in\mathbb N\).

5. **Empty maxima need a convention.** If \(D(A_t)=\varnothing\), then \(D_X(t)\) should be defined as \(0\).

Thus the Section 9 box is not yet one precise mathematical statement.

# B. Nondegeneracy — **REFUTED**

## Thirteenth collapse: high-degree registration starvation

The twelve exclusions control what happens **after** a cohort or ticket has been activated. They do not force activation.

Here is a fully specified admissible construction under the stated axioms.

### Master cohorts

For each \(B,X,j\), put

\[
\Omega^\circ_{X,j}(B)
=
\{(X,j,u):u\in Q_X(B)\},
\]

with

\[
\pi_{X,j}(X,j,u)=u,\qquad
w_{X,j}(X,j,u)=1.
\]

Then (5) holds exactly and (6) holds with equality \(J_H\).

### Queue

Define \(\mathsf{Queue}^\circ\) as follows.

- It accepts and serially services capped tickets generated by Section 8.
- It uses the stated FIFO shell tie-breaker.
- It never generates a high-degree ticket.
- When no capped ticket exists, the queue is empty.

This queue satisfies all six listed queue properties:

- at most one ticket is serviced;
- each Shortener turn during capped service increments that ticket’s \(v\);
- FIFO is obeyed;
- there is at most one outstanding capped ticket per shell;
- helpful waiting contraction discharges a ticket;
- the server is work-conserving relative to the tickets that actually exist.

“Work-conserving” does not require a job to be manufactured when the queue is empty.

### Shortener policy

Let \(\Sigma^\circ\) be:

1. follow the prescribed preprocessing \(\mathcal T_n\);
2. while a capped ticket is active, follow the stipulated capped-state clearing module, with a fixed deterministic tie-breaker;
3. otherwise choose the least currently legal integer.

This is a complete deterministic legal Shortener policy.

Choose, for example,

\[
C_0=1,\qquad
\varepsilon_\delta(H)=\frac{1}{H^5J_H^2},\qquad
\beta_\delta(n)=\frac1{\log(n+2)},
\]

and take \(K_\delta\) to be the constant used by the stipulated capped module.

### Why the intended work disappears

No high-degree ticket is ever created. Therefore:

- no high-degree \(s_{X,j}\) exists;
- no high-degree cohort is activated;
- \((\mathrm{TR\!-\!AH})\) has no instances;
- every local causal-clock obligation is vacuous;
- the high-degree contribution to (14) is the empty sum;
- no service clock counts Shortener turns occurring while the board is high-degree and the capped queue is empty.

The policy can therefore spend an arbitrarily large portion of the play in high-degree states without invoking the direct-ancestor theorem at all. Only the separately stipulated capped module remains.

This is precisely the missing interaction between the clocks and cohort registration:

\[
\text{no ticket}
\Longrightarrow
\text{no active cohort}
\Longrightarrow
\ell=v=0
\Longrightarrow
\text{no ancestor obligation and no service accounting}.
\]

The document’s conclusion that the service clock prevents every relevant clock from remaining frozen assumes that some relevant ticket exists. That premise is absent. 

Under the strictly literal Section 9 conjunction, one may go further and choose an entirely empty queue: the capped generation clause (21) is not included in the listed conjunction. Then both ticket inequalities are vacuous and the “least legal integer” policy is a complete witness. Under the more charitable reading that Section 8 is imported, the construction above still deletes the whole high-degree/direct-ancestor component.

## Independent defect: coverage does not prevent \(\operatorname{Anc}\equiv0\)

The manuscript explicitly claims that channel coverage prevents the ancestor indicator from being identically zero. That is logically false.

Take

\[
\mathcal C=\{\mathrm{anc},\mathrm{misc}\},
\qquad
\mathrm{misc}\prec\mathrm{anc},
\]

and define

\[
\mathsf E_{\mathrm{anc}}\equiv0,
\]

while \(\mathsf E_{\mathrm{misc}}\) fires whenever the atom becomes permanently unusable, carrying the corresponding unavailability certificate.

Then:

- coverage holds;
- soundness for \(\mathrm{anc}\) holds vacuously;
- irreversibility holds;
- every exited atom has channel \(\mathrm{misc}\);
- hence
  \[
  \operatorname{Anc}_{X,j}(t)=0
  \]
  for every epoch and prefix.

Even requiring \(\mathsf E_{\mathrm{anc}}\) to be true on direct-ancestor events would not suffice if a higher-priority channel may fire simultaneously. The priority rule can still siphon all such exits away from \(\mathrm{anc}\). The text only imposes the one-way implication

\[
\mathsf E_{\mathrm{anc}}=1
\Longrightarrow
\text{direct-ancestor event},
\]

not the necessary reverse implication. 

The repair must require channel completeness, for example:

\[
\text{the first permanent-unavailability mechanism is direct ancestor}
\Longrightarrow
\chi(\omega)=\mathrm{anc}.
\tag{AC}
\]

Preferably \(\chi\) should be a directly defined total classification function, rather than overlapping Boolean predicates followed by a manipulable priority order.

## Required repair

To close the thirteenth collapse, add all of the following.

Define

\[
\mathsf{Live}(t)
=
\left\{
X\in\mathcal X_n:
X\ge H^6,\ |Q_X(t)|>X/h^2
\right\}.
\]

Then impose:

1. **Mandatory registration.** When \(X\in\mathsf{Live}(t)\) has no outstanding ticket, its next unused epoch is immediately enqueued, high-degree or capped according to \(D_X(t)\).

2. **No-idle coverage.**
   \[
   \mathsf{Live}(t)\ne\varnothing
   \Longrightarrow
   \text{a ticket is active or waiting}.
   \]

3. **Immediate re-registration.** On completion or discharge, if \(X\) remains live, the next epoch is enqueued before the next Shortener turn.

4. **No stopped-ticket blocker.** A completed or deadline-stopped ticket ceases to be outstanding unless it converts immediately to its capped successor.

5. **Channel completeness (AC).**

6. **Initial freshness or initialization debt.** Either require every master atom to be usable at \(b\),
   \[
   \mathsf E_c(\omega,\mathfrak h_b)=0
   \quad\text{for every }c,
   \]
   or explicitly charge pre-\(b\) causal damage. As written, \(\xi\) may equal \(b\), while \(\ell\) starts at \(b+1\).

# C. Inapplicability and implication — **REPAIRABLE**

## 1. The central fortress objection is genuinely inapplicable

At the strategy layer, the document is correct.

A result of the form

\[
\forall\Sigma\ \exists A^\star:
\text{\(\Sigma\) performs badly if started at }A^\star
\]

does not refute

\[
\exists\Sigma\ \forall\Pi:
P(\operatorname{Play}(\Sigma,\Pi)).
\]

One must show that, against the candidate \(\Sigma\), some Prolonger policy actually produces a bad **history**.

Indeed, because tickets, frozen masses \(q\), cohort exits and remaining service budgets are path-dependent, merely reaching the same board position \(A^\star\) is not necessarily sufficient. The disproof must reach a prefix having the relevant outstanding ticket and ledger history. A fortress reached after its reservoir has already been partly charged or after its ticket has been reset is not automatically the same counterexample.

Thus the old conditional erosion calculation remains valid conditional on entering the appropriate fortress history, but an off-policy starting state does not establish such entry. 

I also agree, on the supplied hypotheses, that none of the listed positive facts proves the intended chronology-stable direct-ancestor allocation.

## 2. The document’s “exact” negation is not exact

For fixed \(\mathbf K^\star\), the displayed quantifier prefix is

\[
\exists C_0>0\
\forall\delta>0\
\exists K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}\
\forall n\ge N_\delta\
\forall\Pi\
P.
\]

Its negation is

\[
\boxed{
\forall C_0>0\
\exists\delta>0\
\forall K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}\
\exists n\ge N_\delta\
\exists\Pi\
\neg P,
}
\tag{N}
\]

with the universal quantification restricted to admissible auxiliary functions and policy families.

The manuscript’s abbreviation

\[
\text{“for some fixed }\delta,\quad
\forall\Sigma\exists n\exists\Pi”
\]

suppresses several load-bearing quantifiers:

- \(\forall C_0\);
- all choices of \(K_\delta,\varepsilon_\delta,\beta_\delta\);
- \(\forall N_\delta\), which forces arbitrarily large counterexamples;
- policy families \(\{\Sigma_{n,\delta}\}\), rather than one isolated finite-\(n\) policy.

Moreover, the final boxed prose asks for “one Prolonger strategy which, against every complete policy,” which has the order

\[
\exists\Pi\ \forall\Sigma.
\]

That is strictly stronger than the required

\[
\forall\Sigma\ \exists\Pi.
\]

So the core off-path/on-path distinction is correct, but the claimed complete quantifier analysis is not.

## 3. The stated implication to \(L(n)=o(n)\) has a real gap

The problematic sentence is that the queue is work-conserving, so waiting causes no unaccounted turns. 

That proves only:

\[
\text{a ticket is waiting}
\Longrightarrow
\text{some ticket is being serviced}.
\]

The proof needs:

\[
\text{some large shell remains above dust}
\Longrightarrow
\text{some ticket is active}.
\tag{NI}
\]

Condition (NI) is missing. Registration-starved high-degree intervals are neither:

- charged to any \(v_{X,j}\);
- bounded by any \(B_\delta(m)\);
- counted by the causal clocks;
- included in the sum in (27).

Therefore equation (27) bounds total **ticket-service turns**, not all post-preprocessing Shortener turns. The inference from (27) to total game length is invalid as written.

This does not show that the underlying intended master-ledger theorem is false. It shows that the displayed statement does not yet imply the desired bound through the stated pipeline.

## 4. After the registration repair, trajectory restriction is sufficient

Once (NI), mandatory registration and immediate re-registration are added, no off-path uniformity is needed. A single policy \(\Sigma\) satisfying the pathwise assertions against every \(\Pi\) is exactly what an upper bound on the game value requires.

For one shell, the contraction recurrence gives

\[
m_{j+1}
\le
\frac12m_j+\frac{X}{h^2},
\]

so after \(J_H=2\lceil\log_2h\rceil+3\) epochs,

\[
m_{J_H}=O(X/h^2),
\qquad
\sum_{j<J_H}m_j=O(X).
\]

Including the ceilings omitted in the manuscript,

\[
\begin{aligned}
\sum_{j<J_H} B_\delta(m_j)
&=
\sum_{j<J_H}
\left\lceil
K_\delta m_j\frac{\log h}{h}
\right\rceil\\
&\le
K_\delta\frac{\log h}{h}\sum_jm_j+J_H\\
&=
O\!\left(\frac{X\log h}{h}\right)+O(J_H).
\end{aligned}
\]

Summing over the \(O(\log n)\) dyadic shells gives

\[
O\!\left(\frac{n\log h}{h}\right)
+
O(J_H\log n)
=
o(n).
\]

The second term is \(o(n)\) because \(J_H=O(\log H)=O(\log n)\).

Under (NI), every relevant post-baseline Shortener turn belongs to one of those service intervals. The number of Prolonger turns differs by at most one, so the actual play length is also \(o(n)\), after adding the stipulated preprocessing, small-shell, dust and completion costs.

Thus:

\[
\boxed{
\text{trajectory restriction itself does not break the implication;}
}
\]

the missing mandatory-registration invariant does.

# Final referee conclusion

The document correctly identifies why an off-policy fortress is not an on-path game-theoretic disproof. It also plausibly identifies the intended remaining mathematical obstacle.

But its stronger formal claims do not survive:

\[
\boxed{\text{A: REFUTED}}
\]

because high-degree epochs, their start times and their recursion are not defined;

\[
\boxed{\text{B: REFUTED}}
\]

because registration starvation gives a thirteenth degenerate construction, and channel coverage does not prevent \(\operatorname{Anc}\equiv0\);

\[
\boxed{\text{C: REPAIRABLE}}
\]

because the fortress distinction is right, while the exact negation and the \(L(n)=o(n)\) accounting require correction.

The manuscript’s “unresolved” assessment may still be correct for the intended repaired theorem. Section 9, however, has not yet stated that theorem.

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.
