Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. First produce the repaired canonical statement per the Problem section (with nondegeneracy proofs), then provide a full proof or disproof of it.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Your task has two parts, iterating a formulation loop whose previous round is attached in full.

Part 1 — formulate, surviving the attached audit. Attachment 1 is the best current candidate for the decisive "ancestor-harvest" statement on the sublinear side: baseline-frozen, globally clocked, with seven nondegeneracy exclusions and a claimed implication to \(L(n)=o(n)\). Attachment 2 is an adversarial audit that BREAKS it three ways: (A, repairable) outer data without quantifier status and prose predicates; (B, refuted) an eighth collapse — a micro-baseline compression sweep inside the unconstrained trapping algorithm reduces every baseline-active ledger to mass \(O(H)\) while passing all stated nontriviality tests, because the formulation never requires the frozen reservoir mass to greatly exceed \(H\); (C, refuted) the implication silently iterates a one-baseline one-stopping-event statement after forbidding rebasing, and treats the unbudgeted global \(Ht\) term as a local summable cost. The audit's sections A.4 and C.5 prescribe repairs. Produce the repaired canonical statement: every predicate mathematical, outer data with explicit quantifier status, frozen reservoir mass required to dominate \(H\) by an explicit factor, a genuinely multi-epoch or globally-budgeted inequality with a stated error hierarchy, and nondegeneracy proofs covering ALL EIGHT known collapse families plus your own search for a ninth.

Part 2 — resolve. Prove or disprove your repaired statement, in full. If instead you can show that NO statement of this family can simultaneously be nondegenerate and imply \(L(n)=o(n)\) through the accepted reductions — a formulation no-go theorem — that is an equally valuable resolution.

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


## Attachment 1 (verbatim): the current candidate formulation and its seven nondegeneracy exclusions

# Verdict

The canonical repair is a **baseline-frozen, globally clocked ancestor-harvest statement**. Every shell ledger is frozen simultaneously at the first prescribed endpoint of one fixed trapping algorithm; all later moves, including moves spent processing other shells, remain on that ledger; the ledger has exact positive mass normalization; and the stopping test begins from a genuinely nontrivial baseline and includes the stopping move.

This formulation is nondegenerate and, together with the accepted residual-channel, prime-guard, and online-area reductions, implies \(L(n)=o(n)\).

I do **not** obtain a valid proof or disproof of the resulting statement. The remaining assertion is exactly the uniform chronological direct-ancestor inequality already isolated in the attachments. The known examples refute pointwise charging, order-only policies, and common-blocker responses, but they do not beat every complete post-trapping Shortener policy. Conversely, the supplied positive facts do not furnish the required chronological potential. Declaring the statement true or false would therefore insert an unproved lemma at precisely that point. I take the attached facts and audits as stipulated throughout. 

---

# Part 1: the canonical nondegenerate statement

## 1. Parameters fixed before play

Fix \(\delta>0\), and put

\[
\mathfrak T(n):=\max_{m\le n}\tau(m),
\qquad
H=H(n):=\mathfrak T(n)^{1+\delta}.
\]

Thus \(H\to\infty\) and \(H=n^{o(1)}\). As in the accepted batch reduction, set

\[
r=\left\lfloor(\log H)^{1/3}\right\rfloor,
\qquad
W_r=\binom r{\lfloor r/2\rfloor}.
\]

Fix once and for all the following data, independently of the eventual Prolonger continuation.

1. A deterministic smooth/rough trapping algorithm \(\mathcal T_n\), including all tie-breaking and fallback moves.
2. A deterministic stopping rule for \(\mathcal T_n\). Along every continuation, its **first prescribed endpoint** occurs after at most
   \[
   a(n)=o(n)
   \]
   actual moves.
3. The canonical cube, face, lift-slot, and first-exit construction used in the accepted advance-depletion reduction.
4. The shell scheduler used by the accepted online-area reduction, including the order in which shells and batches are serviced and every batch, guard, maximum-degree, and fallback rule.

The last item means that a witness is a total deterministic map from every finite legal history at which Shortener moves to a specific legal integer. Phrases such as “choose a suitable blocker” are not a policy.

Let \(b\) denote the first endpoint of \(\mathcal T_n\) on the realized history. If the game has already terminated by \(b\), then its total length is at most \(a(n)=o(n)\), and that branch is already harmless. Otherwise, time \(0\) below means the position \(A_b\).

The crucial point is that the post-trapping policy has no authority to alter \(b\).

---

## 2. Simultaneous baseline freeze

For every dyadic shell

\[
S_X=(X/2,X]\cap[2,n],
\]

freeze at time \(b\)

\[
\widehat Q_X:=Q_X(A_b).
\]

At the same instant, apply the fixed canonical decomposition and freeze

\[
\widehat{\mathscr F}_X
\quad\text{and}\quad
\widehat w_X:\widehat{\mathscr F}_X\to(0,\infty).
\]

A convenient exact formulation of ledger normalization is the following. There are fixed coefficients

\[
\lambda_{X,F}(u)\ge0
\qquad
(F\in\widehat{\mathscr F}_X,\ u\in\widehat Q_X)
\]

such that

\[
\sum_{F\in\widehat{\mathscr F}_X}\lambda_{X,F}(u)=1
\quad\text{for every }u\in\widehat Q_X,
\tag{N1}
\]

and

\[
\widehat w_X(F)
=
\sum_{u\in\widehat Q_X}\lambda_{X,F}(u)>0.
\tag{N2}
\]

Consequently,

\[
\sum_{F\in\widehat{\mathscr F}_X}\widehat w_X(F)
=
|\widehat Q_X|.
\tag{N3}
\]

The coefficients are produced by the fixed canonical decomposition, not chosen by the eventual Shortener policy. Thus one cannot put all mass on “exceptional” faces, set weights equal to zero, or omit inconvenient targets.

No coefficient, face, weight, designated ancestor, or lift slot may later be changed.

---

## 3. Frozen first-exit channels

For each \(F\in\widehat{\mathscr F}_X\), the canonical construction specifies its designated ancestors and lift slots.

As play continues, let \(\xi_X(F)\) be the first actual time after \(b\) at which \(F\) exits the canonical active family. At that first exit, assign it one channel according to one fixed, predeclared priority rule. In particular:

- it is a **target-death or transfer exit** when its represented live shell payload actually leaves \(Q_X\);
- it is a **residual exit** when the face remains legal but a required lift slot first becomes illegal;
- it is a **direct-ancestor exit** when a designated ancestor becomes illegal through a proper-multiple move before the face is processed, without that event already being charged as an actual target death or transfer;
- the remaining ordinary, boundary, pairwise-overlap, and exact/minimal channels are those of the accepted reduction.

Only the first exit counts. Later events cannot change its channel.

Define

\[
\operatorname{Anc}_X(t)
:=
\sum_{\substack{F\in\widehat{\mathscr F}_X\\
                 \xi_X(F)\le t\\
                 F\text{ exits through the direct-ancestor channel}}}
\widehat w_X(F).
\tag{1}
\]

This definition includes direct-ancestor exits occurring while the policy is processing other shells.

---

## 4. The global clock and actual area

Index **all** actual moves after \(b\) by \(1,2,\ldots\), including both players’ moves and moves devoted to other shells.

Let

\[
Q_X^t:=\widehat Q_X\cap Q_X(A_{b+t}).
\]

Thus halving is always measured relative to the common frozen baseline, not relative to a later shell-specific activation set.

Write

\[
D_X(t)
:=
\max_{d\in D(A_{b+t})}
\#\{u\in Q_X^t:d\mid u\}
\tag{2}
\]

for the current residual shell degree. Define the contemporaneous favorable area on move \(i\) by

\[
\alpha_{X,i}:=
|Q_X^{i-1}\setminus Q_X^i|.
\tag{3}
\]

This includes direct target deaths and irreversible transfers out of the live nonminimal shell population. Put

\[
\mathsf A_X(t):=\sum_{i=1}^{t}\alpha_{X,i}.
\tag{4}
\]

One may replace \(\mathsf A_X\) by the equivalent maximum-degree-area bank used in the accepted reduction; the important point is that it is actual contemporaneous progress, not endpoint degree times elapsed time.

---

## 5. Genuine active blocks and genuine stopping events

Let \(h=h(n)\to\infty\) be chosen sufficiently slowly for the accepted parameter hierarchy.

A shell is **active at the baseline** when

\[
|\widehat Q_X|>\frac{X}{h^2}
\qquad\text{and}\qquad
D_X(0)>H.
\tag{5}
\]

For an active shell define

\[
\tau_X
:=
\min\left\{
t\ge1:
D_X(t)\le H
\ \text{or}\
|Q_X^t|\le\frac12|\widehat Q_X|
\right\}.
\tag{6}
\]

The requirement \(t\ge1\), together with (5), guarantees

\[
\tau_X\ge1.
\]

The estimate below is required at every deterministic or history-dependent stopping time

\[
0\le t\le\tau_X,
\]

including \(t=\tau_X\). In particular, a large jump on the stopping move cannot be discarded.

---

## 6. Canonical baseline-frozen ancestor harvest

### Statement \((\mathrm{BF\!-\!AH})\)

There exist:

- an absolute constant \(C\);
- a function \(\varepsilon(H)\to0\);
- a function \(h(n)\to\infty\);
- and a completely specified deterministic online Shortener policy \(\Sigma\) extending the fixed trapping algorithm and using the fixed shell scheduler,

such that, uniformly over every Prolonger strategy, every sufficiently large \(n\), every baseline-active dyadic shell \(S_X\), and every stopping time \(0\le t\le\tau_X\),

\[
\boxed{
\operatorname{Anc}_X(t)
\le
\varepsilon(H)X
+
C\,\mathsf A_X(t)
+
CHt.
}
\tag{BF-AH}
\]

The policy may not:

- change the freeze time;
- rebase a shell when its scheduled processing begins;
- discard or repartition frozen mass;
- alter a first-exit channel;
- or count only moves made while that shell is actively being serviced.

That is the canonical nondegenerate statement.

---

# 2. Proof that \((\mathrm{BF\!-\!AH})\) is nondegenerate

## 2.1 Terminal delay cannot witness it

Suppose \(\widehat Q_X\) is baseline-active. Then

\[
|\widehat Q_X|>\frac{X}{h^2}>0
\quad\text{and}\quad
D_X(0)>H,
\]

so the baseline position is not terminal and neither stopping condition holds at time \(0\). Hence \(\tau_X\ge1\).

There is no later operation called “activate shell \(X\).” Its ledger and clock already exist at time \(b\). If the policy waits until the game becomes terminal, then at the terminal move

\[
Q_X^t=\varnothing,
\]

so shell halving occurs. Every earlier time and the terminal stopping move itself lie in the quantified interval, and every direct-ancestor exit during the delay remains in \(\operatorname{Anc}_X(t)\).

Thus the old witness

\[
\text{wait until terminal, then initialize an empty ledger}
\]

is syntactically impossible.

If the game terminates during the fixed trapping phase, before a nonterminal baseline exists, then it has terminated in at most \(a(n)=o(n)\) moves. That is genuine progress, not a vacuous ancestor-harvest certificate.

---

## 2.2 Prelude delay cannot witness it

The endpoint \(b\) belongs to the already fixed algorithm \(\mathcal T_n\). It is the algorithm’s first prescribed endpoint and satisfies a uniform \(o(n)\) bound.

The post-trapping policy \(\Sigma\) has no parameter corresponding to “continue the prelude.” The freeze occurs before the first subsequent move. Therefore \(\Sigma\) cannot:

- inspect later Prolonger play;
- run until a shell becomes small;
- run until the game becomes terminal;
- or run a degree-reduction sweep and call its endpoint the trapping endpoint.

Every such move necessarily occurs after the ledger has been frozen.

---

## 2.3 Pre-freeze cap forcing cannot witness it

Consider the previous degenerate construction in which Shortener devoted

\[
m_X=\left\lceil\frac{|S_X|}{H+1}\right\rceil
\]

turns to reducing the shell degree and froze the ledger only afterward.

Under \((\mathrm{BF\!-\!AH})\), these \(m_X\) turns occur after time \(0\). Therefore:

- all direct-ancestor exits during those turns are charged to the original ledger;
- all target deaths contribute to \(\mathsf A_X(t)\);
- all elapsed turns contribute to \(Ht\);
- halving is tested against \(\widehat Q_X\), not the smaller post-sweep reservoir;
- and the cap crossing is tested at its actual time.

Since \(D_X(0)>H\), the cap condition cannot already hold at the freeze. If it first holds at time \(m\), then

\[
m=\tau_X
\]

unless baseline halving occurred earlier, and the inequality is required for every \(t\le m\), including \(m\).

Thus the processing interval cannot be made empty by a cap-before-freeze sweep.

---

## 2.4 Deferring a shell does not force a stopping event for free

Suppose the scheduler spends several moves processing other shells.

Those moves still increment the clock of shell \(X\). If they alter \(Q_X^t\), its frozen ledger records the resulting exits and its area bank records actual losses. If they do not alter \(Q_X^t\), neither halving nor the monotone degree cap is triggered merely by the passage of “scheduler time.”

Hence deferral supplies no free state transition. The term \(CHt\) records actual moves and is part of the global sublinear scheduling budget in the accepted shell pipeline.

---

## 2.5 Zero weights and omitted faces are impossible

Equations (N1)–(N3) imply

\[
\widehat w_X(F)>0
\]

for every ledger face and

\[
\sum_F\widehat w_X(F)=|\widehat Q_X|.
\]

Therefore neither

\[
\widehat w_X\equiv0
\]

nor a ledger covering only a negligible preferred subfamily is admissible.

Because the canonical decomposition is fixed before the existential policy \(\Sigma\), the policy cannot choose a favorable decomposition.

---

## 2.6 First-exit reassignment is impossible

A face is charged at its first irreversible exit, using a priority rule frozen at \(b\). A later event cannot relabel a direct-ancestor exit as:

- a residual exit;
- a boundary loss;
- an exact-only event;
- or a loss belonging to a later processing block.

Thus policy-dependent bookkeeping cannot make \(\operatorname{Anc}_X\) small.

---

## 2.7 It is not the cost-only statement equivalent to \(L(n)=o(n)\)

The earlier reverse implication from \(L(n)=o(n)\) used an optimal Shortener strategy until termination and initialized the ledger only at the terminal node.

That construction does not witness \((\mathrm{BF\!-\!AH})\):

- the trapping algorithm and first endpoint are fixed independently of the optimal terminal strategy;
- a nonempty ledger is frozen there;
- the inequality is tested at every early stopping time;
- and later terminal activation is not permitted.

In particular, knowing only that the total continuation length is \(o(n)\) gives no bound on a possible direct-ancestor jump at time \(1\), \(2\), or any other early time. Thus \((\mathrm{BF\!-\!AH})\) is not definitionally a statement that Shortener can end the game in \(o(n)\) moves.

It is a specific local chronological inequality for one canonical channel. Its implication to \(L(n)=o(n)\) uses the other accepted theorems.

---

# 3. Why \((\mathrm{BF\!-\!AH})\) implies \(L(n)=o(n)\)

The attached residual calculation gives, with

\[
q_H\asymp\frac{H}{\log H},
\]

the bound

\[
q_H|\mathcal E_{\mathrm{res}}|
\le
2^r\mathfrak T(n)t.
\]

Hence

\[
|\mathcal E_{\mathrm{res}}|
\le
\frac{2^r\mathfrak T(n)}{q_H}\,t.
\]

Because

\[
H=\mathfrak T(n)^{1+\delta},
\qquad
2^r=H^{o(1)},
\]

we have

\[
\frac{2^r\mathfrak T(n)}{q_H}=o(1).
\]

Since a capped face has weight \(O(H)\), the residual-channel repair mass is

\[
o(Ht).
\tag{7}
\]

The legal prime-product guard removes the pure trace-\(1\) anchor channel at a negligible cost. Ordinary lift failures, high-\(\operatorname{lcm}\) tuples, boundary cubes, pairwise overlaps, and exact/minimal transfers are already controlled by the accepted banks.

Adding \((\mathrm{BF\!-\!AH})\) therefore gives the total repair estimate

\[
\operatorname{Repair}_X(t)
\le
o(X)
+
O(Ht)
+
C\,\mathsf A_X(t).
\tag{8}
\]

This is exactly the contemporaneous-area repair estimate required by the accepted advance-depletion-to-online-area reduction. Choosing \(h(n)\to\infty\) sufficiently slowly absorbs \(\varepsilon(H)\), the \(H^{o(1)}\) cell factors, and the other uniform error moduli.

Consequently the prescribed processing block satisfies

\[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|
+
\frac{X}{h(n)^2}.
\tag{9}
\]

Applying (9) \(O(\log h)\) times gives a residual \(O(X/h)\) in shell \(S_X\), using

\[
O\!\left(\frac{X\log h}{h}\right)
\]

Shortener turns. Geometric summation over the dyadic shells gives \(o(n)\) total processing moves. The trapping phase costs \(o(n)\), and the resulting \(o(n)\)-sized position has an \(o(n)\)-sized maximal completion by the accepted static-completion theorem.

Therefore

\[
\boxed{(\mathrm{BF\!-\!AH})\Longrightarrow L(n)=o(n).}
\]

No additional post-entry persistence theorem or completion estimate is being inserted here.

---

# Part 2: resolution attempt

## 4. The exact statement that would prove \((\mathrm{BF\!-\!AH})\)

For a future move \(c_i\), let

\[
\mathcal B_i
\]

be the baseline faces whose first exit occurs at \(i\) through the direct-ancestor channel. Since first exits are disjoint,

\[
\operatorname{Anc}_X(t)
=
\sum_{i\le t}\widehat w_X(\mathcal B_i).
\]

The missing theorem is a chronological weighted capacity inequality:

\[
\boxed{
\sum_{i\le t}\widehat w_X(\mathcal B_i)
\le
o(X)
+
C\sum_{i\le t}\alpha_{X,i}
+
CHt
}
\tag{CH}
\]

uniformly over the actual ordered history generated against a single complete Shortener policy.

A proof cannot be pointwise. The known one-carrier construction permits

\[
\widehat w_X(\mathcal B_i)=\Omega(H^2)
\]

while

\[
\alpha_{X,i}=O(H).
\]

Thus the stronger increment inequality

\[
\widehat w_X(\mathcal B_i)
\le C(\alpha_{X,i}+H)
\]

is false. Any valid proof of (CH) must show that a move capable of such a jump required earlier setup, refinement, or lost opportunities whose accumulated credit pays for that jump.

Equivalently, one needs a potential \(\Phi_X(t)\) satisfying

\[
\Phi_X(0)=o(X)
\]

and

\[
\operatorname{Anc}_X(t)
\le
\Phi_X(t)+C\mathsf A_X(t)+CHt,
\]

with chronology-stable increments. No supplied frozen repair potential has this property: one later minimum-product edge can simultaneously interact with many previously repaired objects.

---

## 5. Why the known obstructions do not disprove it

A disproof of \((\mathrm{BF\!-\!AH})\) would have to show that for **every** completely specified Shortener policy there is an actual post-trapping continuation, a baseline-active shell, and a time \(t\le\tau_X\) such that, for some fixed \(c>0\),

\[
\operatorname{Anc}_X(t)\ge cX,
\tag{10}
\]

while simultaneously

\[
\mathsf A_X(t)=o(X)
\qquad\text{and}\qquad
Ht=o(X).
\tag{11}
\]

Then the right side of \((\mathrm{BF\!-\!AH})\) would be \(o(X)\), contradicting (10).

None of the accepted counterexamples supplies all of these quantifiers.

### The one-carrier jump

It disproves a per-move area charge, but not the cumulative inequality. The carrier may require a substantial prehistory, and \(Ht\) and earlier area are measured from the common baseline.

### The private-carrier drafting construction

It defeats every **ordering** of a fixed minimal layer and can leave a linear family of descendants legal. But its proof assumes that the intervening Shortener moves are exact selections from that fixed layer. A general Shortener policy may insert cross-cone blockers, guard products, or other lower moves. Moreover, the obtainable post-peel position used by the construction is not shown to be forceable as the endpoint of every fixed trapping algorithm.

Thus it refutes order-only ancestor harvesting, not the policy-existential statement above.

### The example \(A=\{6,35\}\)

The legal threats \(10\) and \(15\) have no common legal blocker. This refutes the rule “respond to all threats by playing their product or least common multiple.” It does not prove that Shortener cannot harvest the two families separately or use another coordinate.

### The lifetime inheritance example

The \(128\)-versus-\(48\) history proves that instantaneous Sperner width cannot be promoted to lifetime capacity. The atomic ledger correctly loses a factor \(2^r\). It does not itself force linear ancestor mass with both quantities in (11) sublinear.

### The raw-shadow counterexample

A linear raw proper-multiple shadow is insufficient. Even a linear legal descendant set may have a sublinear current minimal cover; subsequent regeneration of those covers is precisely the unresolved chronological phenomenon.

---

## 6. Why the positive facts do not prove it

The accepted positive statements stop just short of (CH):

- exhaustion cost counts distinct blocked lift tags of a face, but direct-ancestor exit can erase the face before those actual lift deaths occur;
- the atomic ledger controls the residual orientation \(\kappa(F)\mid c\), not the reverse orientation \(c\mid a_F\);
- the all-orders witness inequality is static and permits a common low-\(\operatorname{lcm}\) core;
- frozen coded repairs have no Lipschitz bound under later edge insertion;
- the root-indexed first-blocker bound gives only
  \[
  \sum_{j>i}|C_j|\le (H/2^i)^2p_i,
  \]
  which is too weak in the first few generations;
- the refinement-forest theorem says a low-area counterexample must maintain many simultaneously active refined classes, but supplies neither a Shortener strategy that harvests them nor a Prolonger strategy that robustly maintains them.

The missing implication is therefore not algebraic bookkeeping. It is an online weighted transversal theorem for the actual divisibility trace system.

---

# Final conclusion

The canonical statement is

\[
\boxed{\mathrm{BF\!-\!AH}}
\]

as formulated above: a simultaneous baseline freeze at the first prescribed trapping endpoint, exact positive ledger normalization, immutable first-exit channels, a global clock including scheduling moves, baseline-relative halving, a genuinely positive cap-crossing interval, and endpoint-inclusive estimates.

It has no terminal-delay, prelude-delay, or cap-before-freeze witness, and the accepted conditional pipeline proves

\[
\mathrm{BF\!-\!AH}\Longrightarrow L(n)=o(n).
\]

The resolution currently stops at the following exact separator:

\[
\boxed{
\begin{minipage}{0.88\linewidth}
Construct a complete online Shortener policy and a chronology-stable
potential proving (CH), or construct, against every such policy, an actual
post-trapping history satisfying
\[
\operatorname{Anc}_X(t)=\Omega(X),\qquad
\mathsf A_X(t)=o(X),\qquad
Ht=o(X).
\]
\end{minipage}}
\]

The supplied results establish neither side. A claimed full proof would need a new historical no-repetition or potential theorem; a claimed disproof would need an arbitrary-policy persistent direct-ancestor cascade.

## Attachment 2 (verbatim): the audit refuting it — the eighth witness (B.1), the outer-quantifier defect (B.3), the implication failures (C.1, C.2, C.3), and the repair prescriptions (A.4, C.5)

I audited the uploaded document as written, rather than the stronger statement it appears to intend. 

## Verdicts

| Item | Verdict | Decisive reason |
|---|---|---|
| **A. Well-formedness** | **REPAIRABLE** | Several objects and predicates are not mathematically defined, and the outer “fixed” data have no clear quantifier status. |
| **B. Nondegeneracy** | **REFUTED** | There is an eighth collapse: incorporate an \(O(n/H)\)-move **micro-baseline compression sweep** into the unspecified trapping algorithm. Every baseline-active ledger then has mass \(O(H)\), so the term \(CHt\) pays for the entire ledger after the first move. |
| **C. \((\mathrm{BF\!-\!AH})\Rightarrow L(n)=o(n)\)** | **REFUTED** | The proof applies a one-baseline, one-stopping-event statement repeatedly after expressly forbidding rebasing. It also treats an unbudgeted global \(Ht\) term as though it were a local, summable block cost. |

The verdict on C refutes the claimed deduction, not the underlying possibility that \(L(n)=o(n)\).

---

# A. Well-formedness: **REPAIRABLE**

The displayed inequality itself is syntactically clear once all its ingredients exist. The problem is that the document does not define a single closed tuple of ingredients.

## A.1 The outer data have no quantifier status

The document says to “fix once and for all”:

- a trapping algorithm \(\mathcal T_n\);
- its stopping rule;
- a canonical decomposition and first-exit construction;
- a shell scheduler.

It then existentially quantifies only \(C,\varepsilon,h,\Sigma\). 

There are at least three inequivalent readings:

\[
\begin{aligned}
&\text{(i) for one particular externally supplied }\mathcal T_n;\\
&\text{(ii) for every }\mathcal T_n\text{ satisfying the listed conditions};\\
&\text{(iii) for some }\mathcal T_n\text{ satisfying those conditions}.
\end{aligned}
\]

The truth and nondegeneracy of BF-AH change drastically between these readings. “Fixed” is not a substitute for identifying the object or quantifying it.

There is a similar dependency ambiguity around \(\delta\). The text first fixes \(\delta>0\), then asserts an “absolute” \(C\). It is unclear whether \(C\) is independent of \(\delta\). If so, \(C\) must be quantified before \(\delta\); if not, it is not absolute in the usual sense.

## A.2 Several predicates remain prose rather than mathematics

The following expressions are not defined as predicates or maps:

- “smooth/rough trapping algorithm”;
- “first prescribed endpoint”;
- “canonical active family”;
- “represented live shell payload”;
- “required lift slot”;
- “before the face is processed”;
- “actual target death or transfer”;
- “ordinary, boundary, pairwise-overlap, and exact/minimal channels”;
- “chosen sufficiently slowly for the accepted parameter hierarchy”;
- “equivalent maximum-degree-area bank.”

The first-exit section, for example, gives descriptions of overlapping channels but does not state the priority order that turns them into a disjoint partition. A proper-multiple event can potentially coincide with a lift-slot failure; saying there is “one fixed, predeclared priority rule” without declaring that rule does not determine \(\operatorname{Anc}_X(t)\). 

The phrase

> “One may replace \(\mathsf A_X\) by the equivalent maximum-degree-area bank”

is particularly fatal to singleness: those are two different right-hand sides unless a proved identity or comparison is incorporated into the statement. A theorem cannot leave its principal quantity optional. 

## A.3 Smaller formal gaps

There are also several local omissions:

1. The index set of “dyadic shells” is not specified. Is \(X\) restricted to powers of two, to \(n/2^j\), or to every real \(X\)? This matters both for overlap and for summing costs.

2. The convention for
   \[
   \max_{d\in D(A)}(\cdots)
   \]
   when \(D(A)=\varnothing\) is missing. The terminal-branch argument implicitly needs this maximum to be \(0\).

3. If a face never exits, one needs \(\xi_X(F)=\infty\).

4. “Every deterministic or history-dependent stopping time \(0\le t\le\tau_X\)” requires a filtration and a quantification over stopping rules. Since the desired assertion is pathwise, the clean formulation is simply “for every integer \(t\in\{0,\ldots,\tau_X\}\).”

5. The functions should be nonnegative:
   \[
   C>0,\qquad \varepsilon(H)\ge0,\qquad h(n)>0.
   \]

6. The proof later chooses \(h\) after seeing error moduli. The theorem must encode that dependency order rather than list \(\varepsilon\) and \(h\) simultaneously.

## A.4 Repair

A closed formulation should begin by fixing a named external data tuple

\[
\mathbf K_n=
\bigl(
\mathcal X_n,\mathcal T_n,b_n,
\mathscr F,\lambda,
\operatorname{Ancestors},
\operatorname{Slots},
\chi,
\operatorname{Sched}
\bigr),
\]

where \(\chi\) is an explicit disjoint first-exit channel map and every component is an actual function on finite histories.

Then state an exact quantifier prefix. For example, if \(C\) is genuinely absolute,

\[
\exists C>0\ \forall\delta>0\
\exists \varepsilon_\delta,h_\delta,\{\Sigma_{n,\delta}\}_{n\ge2}\
\exists N_\delta\
\forall n\ge N_\delta\
\forall \Pi\
\forall X\in\mathcal X_n\
\forall t\in\{0,\ldots,\tau_X\}.
\]

The statement must also choose one area bank and state every parameter relation needed later, such as

\[
\varepsilon(H)h(n)^2\longrightarrow0
\]

if the \(\varepsilon(H)X\) term is to be absorbed into \(X/h^2\).

That repair makes A precise, but it does not rescue B or C.

---

# B. Nondegeneracy: **REFUTED**

## B.1 Eighth witness: micro-baseline compression inside the trapping algorithm

The document tries to ensure nontriviality using

\[
|\widehat Q_X|>\frac{X}{h^2},
\qquad
D_X(0)>H,
\qquad
\tau_X\ge1.
\]

But it never requires

\[
|\widehat Q_X|\gg H.
\]

That omission lets the entire frozen ledger be paid for by the single first clock increment \(CH\).

Let

\[
B:=\lfloor H\rfloor+1.
\]

Use the standard disjoint dyadic shell system. Define a deterministic trapping algorithm \(\widetilde{\mathcal T}_n\) as follows. One may prepend whatever smooth/rough routine the document intends; before declaring its first endpoint, continue with this sweep.

At every nonterminal Shortener turn:

1. Search the shells in a fixed order for the first \(X\) satisfying
   \[
   D_X(A)>H
   \quad\text{and}\quad
   |Q_X(A)|>B.
   \]
2. If such a shell exists, play the least
   \[
   d\in D(A)
   \]
   attaining \(D_X(A)\).
3. If no such shell exists, declare the first prescribed endpoint \(b\).

All tie-breaking is explicit. The move is legal because \(d\in D(A)\).

### Uniform \(o(n)\) endpoint bound

Whenever the algorithm makes a sweep move, the integer-valued degree satisfies

\[
D_X(A)\ge B.
\]

Therefore the chosen \(d\) makes at least \(B\) currently live members of \(Q_X(A)\) illegal. Those target-shell incidences never return.

For disjoint dyadic shells there are at most \(n-1\) target-shell incidences initially. Hence the number of Shortener sweep moves is at most

\[
\frac{n-1}{B}.
\]

Including interleaved Prolonger moves, the endpoint occurs within

\[
\frac{2(n-1)}{B}+1
=
O\!\left(\frac nH\right)
=
o(n)
\]

actual moves, uniformly over every Prolonger continuation.

Thus \(\widetilde{\mathcal T}_n\) satisfies every formal endpoint condition listed in the document.

### State at the freeze

At its endpoint, every shell satisfies

\[
D_X(A_b)\le H
\quad\text{or}\quad
|\widehat Q_X|\le B.
\tag{B1}
\]

Consequently, every **baseline-active** shell must satisfy

\[
|\widehat Q_X|\le B.
\tag{B2}
\]

The exact normalization (N3) now gives

\[
\operatorname{Anc}_X(t)
\le
\sum_{F\in\widehat{\mathscr F}_X}\widehat w_X(F)
=
|\widehat Q_X|
\le B.
\tag{B3}
\]

At \(t=0\), no post-freeze first exit has occurred, so

\[
\operatorname{Anc}_X(0)=0.
\]

For every integer \(t\ge1\), and all sufficiently large \(n\),

\[
B
=
\lfloor H\rfloor+1
\le H+1
\le 2H
\le 2Ht.
\]

Therefore BF-AH holds with the completely uninformative choices

\[
\boxed{
C=2,\qquad
\varepsilon(H)\equiv0
}
\]

and any \(h(n)\to\infty\). Indeed,

\[
\operatorname{Anc}_X(t)
\le B
\le 2Ht
\le 2\mathsf A_X(t)+2Ht
\]

for every \(1\le t\le\tau_X\), uniformly over every subsequent Prolonger strategy and regardless of what the post-freeze policy does.

Take, for completeness, the following deterministic extension \(\Sigma\): on each Shortener turn, service the first shell in the fixed order with degree \(>H\) by choosing its least maximum-degree divisor; if none exists, choose the least legal integer.

This is a fully specified legal policy.

## B.2 Why this is an eighth collapse

This witness is not any of the seven named ones:

- The game need not be terminal.
- A nonempty baseline-active shell may remain.
- Its degree cap need not hold at \(b\).
- The stopping interval has positive length:
  \[
  \tau_X\ge1.
  \]
- The stopping move is included.
- The ledger is frozen exactly once.
- Every weight is positive and the total mass is exact.
- No face is omitted.
- No channel is changed after the freeze.
- The global clock includes every move.

Nevertheless no chronological ancestor estimate is proved. The entire ledger is merely compressed to \(O(H)\) before the freeze, and the first \(CH\) clock allowance pays for all of it.

This is stronger than the already discussed cap-before-freeze defect. The previous defect made \(\tau_X=0\). Here one can have

\[
D_X(0)>H,\qquad \tau_X\ge1,
\]

yet the estimate is automatic.

The document’s activity conditions and endpoint inclusion therefore do not establish a “genuinely nontrivial baseline.” They establish only a positive-length interval, not a ledger whose mass is asymptotically larger than the built-in \(O(H)\) allowance. The claimed BF-AH quantifiers are exactly those displayed in the document. 

## B.3 The outer-quantifier defect

The document’s response to prelude and pre-freeze attacks is that the post-trapping policy cannot alter \(b\). 

My policy does not alter \(b\) after the fact. The trapping algorithm itself, fixed before play, declares its first endpoint only after the compression sweep.

If the intended meaning is that one particular externally supplied \(\mathcal T_n^\star\) must be used and may not be replaced by \(\widetilde{\mathcal T}_n\), then the document must name \(\mathcal T_n^\star\). Under that repaired statement this witness may become inadmissible, but that is precisely the well-formedness repair identified in A. The literal statement cannot invoke an unspecified adjective such as “smooth/rough” to disqualify a fully defined algorithm satisfying all the conditions it actually lists.

## B.4 Audit of the seven advertised exclusions

### 1. Terminal delay

Conditionally sound. Once a particular nonterminal \(b\) and a baseline-active shell are fixed, terminal delay cannot erase its ledger, and the terminal stopping move is included.

It does not address an empty active-shell domain or an \(O(H)\)-mass active ledger.

### 2. Prelude delay

Not closed as written. It proves only that \(\Sigma\) cannot change the endpoint of an already identified \(\mathcal T_n\). It does not prevent the selected trapping algorithm or selected stopping rule from containing the compression sweep.

### 3. Pre-freeze cap forcing

The argument excludes a sweep that reaches \(D_X\le H\) after the freeze.

It does not exclude the present sweep, which freezes with either

\[
D_X\le H
\]

or

\[
|\widehat Q_X|\le H+1.
\]

The second alternative can satisfy \(D_X>H\), so the formal positive-interval test survives while BF-AH remains trivial.

### 4. Shell deferral

The document proves only that elapsed time does not by itself trigger halving or degree capping. It overlooks that elapsed time makes the **inequality** itself vacuous.

In general, N3 gives

\[
\operatorname{Anc}_X(t)\le|\widehat Q_X|.
\]

Therefore once

\[
t\ge\frac{|\widehat Q_X|}{CH},
\]

the \(CHt\) term alone proves BF-AH. Thus deferral supplies free certificate credit even when it supplies no free state transition. The assertion that this is automatically part of a “global sublinear scheduling budget” is not accompanied by a summability or prefix bound. 

In the eighth witness, saturation occurs already at \(t=1\).

### 5. Zero weights and omitted faces

N1–N3 correctly rule out zero total mass and literal omission of targets.

They do not rule out all mass lying in a ledger of total size \(O(H)\), which is the present collapse.

They also do not by themselves ensure that each positive mass unit has a meaningful designated-ancestor channel; that still depends on the external canonical construction.

### 6. First-exit reassignment

Freezing an explicit channel assignment would prevent later reassignment.

But the initial priority partition is not actually declared. Thus the argument is valid only after the A-level formalization repair.

### 7. Non-collapse to the cost-only statement

The document correctly rules out the particular strategy “play optimally until terminal, then initialize the ledger.”

That establishes only that one old collapse is absent. It does not establish that every BF-AH witness must prove a direct-ancestor theorem. The micro-baseline witness is unconditional, costs \(O(n/H)=o(n)\), and never uses an optimal terminal strategy.

Hence the verdict for B is decisively **REFUTED**.

A suitable repair would have to do both of the following:

\[
\text{fix the trapping algorithm externally}
\]

and require, for every audited shell,

\[
\frac{|\widehat Q_X|}{H}\longrightarrow\infty
\]

uniformly, or else place all \(O(H)\)-mass shells into a separately proved globally negligible error class.

---

# C. The implication: **REFUTED**

There are two independently fatal steps.

## C.1 A one-epoch statement is silently iterated

BF-AH freezes exactly one reservoir

\[
\widehat Q_X=Q_X(A_b)
\]

and defines exactly one stopping event

\[
\tau_X
=
\min\left\{
t\ge1:
D_X(t)\le H
\ \text{or}\
|Q_X^t|\le\tfrac12|\widehat Q_X|
\right\}.
\]

Its inequality is required only for

\[
0\le t\le\tau_X.
\]

The document also expressly forbids rebasing a shell or changing any frozen face, weight, ancestor, or slot. 

Suppose, charitably, that BF-AH and the stipulated reductions prove one estimate

\[
q_1
\le
\frac12q_0+\frac{X}{h^2},
\qquad
q_0=|\widehat Q_X|.
\tag{C1}
\]

To obtain a second estimate of the required form, one needs

\[
q_2
\le
\frac12q_1+\frac{X}{h^2}.
\tag{C2}
\]

But (C2) requires a new baseline \(q_1\), a new face family, new weights, and a new stopping event. BF-AH supplies none of those. Once the original reservoir is halved, \(t=\tau_X\) and the theorem stops.

Keeping the old ledger does not help: it can at most prove another estimate relative to \(q_0\), not a halving relative to \(q_1\). Moreover, the cumulative area term is then already of order \(q_0\), so the old estimate has lost the fresh-block form needed for iteration.

The document nevertheless says:

> “Applying (9) \(O(\log h)\) times gives a residual \(O(X/h)\).”

That is the exact false step. 

The proof is using an epoch-uniform theorem

\[
\text{BF-AH at every scheduler-generated restart}
\]

whereas the statement provides only

\[
\text{BF-AH at the single common baseline }b.
\]

This is not a small omission. The natural repair—fresh ledgers at later epochs—is precisely what the statement prohibits unless one introduces a master ledger that proves no old loss is forgotten.

## C.2 The global \(Ht\) term has no usable shell budget

The clock \(t\) counts every actual move after \(b\), including moves spent on other shells. 

That makes BF-AH resistant to one bookkeeping reset, but it also makes its \(CHt\) term nonlocal and repeatedly counted.

For every shell,

\[
\operatorname{Anc}_X(t)
\le |\widehat Q_X|
\le |S_X|
\le \frac X2+1.
\]

Hence, after

\[
t\asymp\frac XH,
\]

the inequality becomes automatic regardless of any ancestor-harvest mechanism.

A total scheduling cost \(t=o(n)\) does not imply

\[
Ht=o(X)
\]

uniformly over shells. For example, a shell with scale \(X=n/h^2\) can be reached after \(t=n/h=o(n)\) prior moves, while

\[
\frac{Ht}{X}
=
Hh
\longrightarrow\infty.
\]

Thus “global sublinear time” gives no useful bound at that shell scale.

There is also an incompatibility visible in the document’s own claimed block cost. It says a shell uses

\[
t=O\!\left(\frac{X\log h}{h}\right)
\]

turns. Then

\[
Ht
=
O\!\left(
X\frac{H\log h}{h}
\right).
\]

For this to be \(o(X)\), one needs at minimum

\[
\frac{H\log h}{h}\longrightarrow0.
\tag{C3}
\]

No such hierarchy appears. The phrase “choose \(h\) sufficiently slowly” ordinarily points in the opposite direction; in any case it is not the mathematical condition (C3).

Moreover, because \(t\) is an absolute clock, the same earlier move contributes \(H\) units of allowance to every shell not yet stopped. A proof that the \(Ht\) terms are “part of the global budget” requires an explicit overlap inequality such as

\[
\sum_{X,j} H\,\ell_{X,j}=o(n),
\]

where \(\ell_{X,j}\) is a properly charged local epoch clock. No such inequality is stated or derived.

Therefore the passage

\[
\operatorname{Repair}_X(t)
\le o(X)+O(Ht)+C\mathsf A_X(t)
\tag{8}
\]

to the block contraction (9) silently treats the global \(t\) as a locally bounded and summable clock. That is a substantive strengthening of BF-AH.

## C.3 The error hierarchy is also unstated

To absorb the BF-AH error

\[
\varepsilon(H)X
\]

into the desired additive error

\[
\frac{X}{h^2},
\]

one needs, quantitatively,

\[
\varepsilon(H)h^2\longrightarrow0.
\]

The two separate facts

\[
\varepsilon(H)\to0,
\qquad
h\to\infty
\]

do not imply this. A diagonal choice of \(h\) can enforce it, but only if the quantifier order explicitly permits \(h\) to be chosen after \(\varepsilon\) and after every other uniform error modulus.

This is repairable, unlike the one-epoch defect, but it is another place where “sufficiently slowly” is doing unproved work.

## C.4 What survives

The residual algebra

\[
\frac{2^r\mathfrak T(n)}{q_H}=o(1)
\]

is consistent with the stipulated parameter choices. I do not find a circular invocation of \(L(n)=o(n)\) in that calculation or in the final use of the accepted static-completion theorem.

The failure occurs between the local repair estimate and the claimed iterable shell contraction.

## C.5 Necessary repair

A sufficient replacement would need an epoch-indexed statement. For every shell \(X\) and every prescribed epoch \(j\), one would freeze

\[
Q_{X,j}^0,\qquad
\mathscr F_{X,j}^0,\qquad
w_{X,j}^0,
\]

and prove BF-AH until that epoch’s halving or cap event, while also maintaining a master first-exit ledger ensuring that moving from epoch \(j\) to \(j+1\) does not erase any earlier ancestor loss.

The clock must be replaced by a charged clock \(\ell_{X,j}\) satisfying a proved global budget, for example

\[
\sum_{X,j}H\ell_{X,j}=o(n).
\]

Alternatively, one needs a genuinely single-baseline potential valid all the way until

\[
|Q_X|\le O(X/h),
\]

not merely until the first halving.

That would be a materially stronger theorem than BF-AH.

---

# Final referee conclusion

The document has not reached a canonical nondegenerate separator.

Its literal statement admits the following unconditional collapse:

\[
\boxed{
\begin{minipage}{0.86\linewidth}
Before the first declared trapping endpoint, compress every uncapped
shell to at most \(\lfloor H\rfloor+1\) live targets. This costs
\(O(n/H)=o(n)\) moves. Every shell that is still baseline-active then
has total frozen weight \(O(H)\), so \(CHt\) dominates the entire ledger
for every \(t\ge1\). BF-AH holds with \(C=2\) and
\(\varepsilon\equiv0\), without any chronological ancestor theorem.
\end{minipage}}
\]

Even after forbidding that witness by externally fixing the trapping algorithm, the claimed implication still fails at the sentence “Applying (9) \(O(\log h)\) times”: BF-AH has only one baseline and ends at the first halving, while the proof requires a fresh uniform theorem at every subsequent block. The global-clock \(Ht\) term is also not shown to be locally useful or globally summable.

Thus the decisive assessments are:

\[
\boxed{
\text{A: REPAIRABLE,\qquad
B: REFUTED,\qquad
C: REFUTED.}
}
\]

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.
