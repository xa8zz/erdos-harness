Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the single statement (AE) in the Problem section.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Prove or disprove the repaired aggregate-excess halving statement (AE\u2020), which is (AE) below with two additional requirements made explicit (they were implicit in the construction's pipeline-sufficiency and their omission admits a vacuous witness — see Attachment 0): the scale parameter satisfies \(H^6=o(n)\) (so the eligible-shell range is nonempty for large \(n\); e.g. \(H\le n^{1/12}\)), and all outer quantifiers are closed uniformly (one policy, one \(C\), one \(K\) for the \(O(\log n)\) term, working for all large \(n\) and all Prolonger strategies). Attachment 0 also proves (AE\u2020) implies \(L(n)=o(n)\) and that (AE\u2020) is NOT a rewriting of the full problem (a strictly stronger local rate assertion). The original statement (AE), for reference: with \(h=H(n)\to\infty\) and the aggregate excess potential \(R(t)=\sum_{X\ge H^6}\bigl(q_X(t)-\lceil 4X/h^2\rceil\bigr)_+\) over dyadic shells (populations \(q_X\) of live nonminimal shell targets after the standard trapping prelude), there is a fully specified legal online Shortener policy under which, whenever \(R(t)=M>0\), the policy reduces the aggregate excess to at most \(M/2\) within \(C\,M\log h/h+O(\log n)\) of its turns, against every Prolonger strategy, with mandatory immediate succession while \(R>0\).

Established context: (AE) is nondegenerate (every ticket proves real global deletion, every turn is owned, the recurrence is well-founded — Attachment 1 verifies this) and pipeline-sufficient (total service \(O(n\log h/h)+O(\log^2 n)=o(n)\) and \(o(n)\) residual mass, hence \(L(n)=o(n)\) through the accepted static-completion endgame). It escapes the per-shell impossibility dichotomy of Attachment 2 precisely because contraction is demanded only of the GLOBAL excess, not per shell. A disproof must force, against every complete policy, a reachable regime where the global excess resists halving within the service budget — note the known constructions (batch blockers, direct-ancestor cascades, private-carrier drafting) were all refuted as UNIVERSAL mechanisms only against per-shell or ordering-based obligations; whether any of them defeats a global-excess policy is open in both directions. Formulation caution: if (AE) as stated admits a degenerate witness or collapses to the full problem, proving THAT is a valuable resolution; state it explicitly.

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

- Deep-layer theorem: all peeling layers beyond depth \(C\log\log H\) contribute \(o(n)\) total minimal-layer mass (each depth-\(j\) minimal element carries a chain of \(j\) proper divisors above \(n/H\); a divisor-chain/Rankin bound makes such integers rare). Hence the cumulative-layer question is equivalent to controlling the first \(C\log\log H\) layers only.
- Surviving-shadow theorem (audited, with the carrier-legality repair): for every cap \(H\to\infty\), \(H<n^{1/4}\), there are obtainable post-peel positions where against EVERY ordering of the first minimal layer, Prolonger keeps a linear part of the advance-killed shadow LEGAL through the first sweep; but within the construction, cone quotient-structure exposes only \(o(n)\) of it as the next minimal layer (new minima are prime multiples; \(\pi(K_m)\) per cone).
- Formulation no-go, scope-limited (audited twice): any capped-state/ancestor-harvest statement whose obligations range over ALL baseline states (including states unreachable against the policy) is false via an off-path fortress with bounded erosion; but the fortress is NOT reachable against a policy containing the fixed-density clearing sweep, so trajectory-restricted statements (obligations only at reachable states) remain open. Known collapse families for such formulations now number eleven (terminal delay, prelude delay, pre-freeze cap forcing, shell deferral, zero weights, first-exit reassignment, cost-only equivalence, micro-baseline compression, cap escape, epoch-boundary laundering, uncharged scheduling delay); any intermediate statement must be checked against all of them and must prescribe activation data in advance, freeze ledgers at a common baseline with global budgets, and restrict obligations to realized trajectories.


## Attachment 0 (verbatim): the parameter-level vacuity analysis defining (AE†), its implication, and its non-tautology proof

# Verdict

\[
\boxed{\text{The literal statement (AE) is true, but vacuously.}}
\]

The defect is not in the ticket recurrence. It is in the outer quantification of the scale parameter \(H\). Attachment 1 verifies that **an existing ticket** certifies genuine progress, but it never requires the set of ticket-eligible shells to be nonempty. 

## Proof of the literal statement

For each \(n\), choose

\[
h(n)=H(n)=n.
\]

Then \(H(n)\to\infty\), as required. Every dyadic shell of the board has scale \(X\le n\), whereas

\[
H(n)^6=n^6>n.
\]

Consequently there is no dyadic shell satisfying \(X\ge H^6\). The sum defining the aggregate excess is therefore an empty sum:

\[
R(t)
=
\sum_{X\ge H^6}
\left(q_X(t)-\left\lceil\frac{4X}{h^2}\right\rceil\right)_+
=0
\qquad\text{at every time }t.
\]

Now specify any deterministic legal Shortener policy, for example:

> On every nonterminal Shortener turn, play the least currently legal integer.

This is fully specified and legal. Take \(C=1\), and take the \(O(\log n)\) term to be identically zero.

The assertion in (AE) is conditional:

\[
R(t)=M>0
\quad\Longrightarrow\quad
\text{\(R\) is reduced to at most \(M/2\) within the stated budget.}
\]

But \(R(t)>0\) never occurs. Hence the implication holds at every time, against every Prolonger strategy. Mandatory succession while \(R>0\) is also vacuous.

Thus the literal (AE) is proved. \(\square\)

# Why the stated “nondegeneracy” does not exclude this

The audit establishes a **conditional** form of nondegeneracy:

> whenever a global ticket is registered, resolving it proves genuine deletion of aggregate excess.

That does not imply that any ticket is ever registered. Universal claims over an empty family of tickets remain true.

The pipeline calculation in Attachment 1 contains the line

\[
O(n/h^2)+O(H^6)=o(n).
\]

The first term is \(o(n)\) from \(h\to\infty\), but the second conclusion requires the additional hypothesis

\[
H^6=o(n).
\tag{1}
\]

It does not follow from \(H\to\infty\). With the witness \(H=n\), the second term is \(O(n^6)\), so the advertised pipeline conclusion no longer follows. In other words, the literal ticket statement and the claimed pipeline-sufficient statement have different parameter domains.

This is an outer-quantifier collapse, not one of the fourteen internal ledger collapses.

# The nondegenerate repair

The intended proposition should explicitly be something like the following.

There exist functions \(H(n)\), a deterministic Shortener policy \(\sigma_n\), and absolute constants \(C,K\) such that

\[
H(n)\to\infty,
\qquad
H(n)^6=o(n),
\tag{2}
\]

and, with \(h=H(n)\), after the prescribed fixed trapping baseline, for every Prolonger strategy and every ticket-start time \(t\),

\[
R(t)=M>0
\quad\Longrightarrow\quad
R(t')\le \frac M2
\]

for some \(t'\) occurring within at most

\[
C M\frac{\log H}{H}+K\log n
\tag{3}
\]

Shortener turns, with every intervening Shortener turn owned and with immediate successor registration while \(R>0\).

The order of quantifiers must be

\[
\exists H,\sigma,C,K\quad
\forall n\text{ sufficiently large}\quad
\forall\Pi\quad
\forall t,
\]

so that \(H\), the policy, the constants, the baseline rule, and all tie-breakers are fixed before Prolonger’s strategy.

Call this strengthened statement \((\mathrm{AE}^{\dagger})\).

# Status of the repaired statement

The vacuous proof above does not apply to \((\mathrm{AE}^{\dagger})\). Nor do the supplied established facts prove or disprove it. The record itself identifies the global chronological problem as open in both directions. 

The exact obstruction is local-rate control. Define, for a fixed policy \(\sigma\),

\[
V_\sigma(A,M)
=
\sup_{\Pi}
\{\text{number of future Shortener turns required to reduce \(R\) from \(M\) to \(M/2\)}\}.
\]

Then \((\mathrm{AE}^{\dagger})\) asks for the uniform trajectory estimate

\[
V_\sigma(A,M)
\le
C M\frac{\log H}{H}+K\log n
\tag{4}
\]

at every reachable ticket state.

The accepted results do not provide (4):

* Static completion and the fractional relaxation give quantities that are \(o(n)\), not \(o(M)\) uniformly at every sublinear ticket mass \(M\).
* Degree availability controls positive-density upper reservoirs. Aggregate excess may be concentrated at a sublinear scale or may exceed a shell floor by a relatively small amount.
* Primorial fortresses and face-carrier configurations show that endpoint degree bounds cannot prove (4), but those states need not be reachable against the proposed policy.
* The all-orders witness inequality controls frozen witness multiplicities, while a chronological direct-ancestor move can destroy many candidate faces at once. No accepted no-reuse or Lipschitz estimate turns that inequality into the required global service bound.
* Fresh-batch persistence is a Prolonger-side theorem and cannot be used as the move scheduler for a Shortener policy.

Thus the repaired statement is a genuine additional global chronological theorem.

# It does not tautologically collapse to \(L(n)=o(n)\)

The forward implication is accepted:

\[
(\mathrm{AE}^{\dagger})\Longrightarrow L(n)=o(n).
\]

The converse is not a formal consequence of sublinear total game length. To see the distinction, consider the abstract monotone process

\[
R(0)=\lfloor\sqrt n\rfloor,
\]

in which every Shortener turn decreases \(R\) by exactly one and the process terminates when \(R=0\). Its total length is

\[
\lfloor\sqrt n\rfloor=o(n).
\]

But halving \(M=\lfloor\sqrt n\rfloor\) takes at least \(M/2\) turns. For every \(h(n)\to\infty\) and fixed \(C,K\),

\[
C M\frac{\log h}{h}+K\log n=o(M),
\]

so the aggregate-halving estimate fails.

This abstract example does not disprove a divisibility-specific converse, but it proves that aggregate halving is a stronger **local rate assertion**, not merely a logical rewriting of global sublinearity.

# Final resolution

There are therefore two mathematically distinct verdicts:

\[
\boxed{
\begin{array}{ll}
\textbf{Literal (AE):}
&
\text{true by the empty-shell witness }H(n)=n.
\\[4pt]
\textbf{Intended nondegenerate }(\mathrm{AE}^{\dagger}):
&
\text{requires at least }H^6=o(n)\text{ and uniform closed quantifiers;}\\
&
\text{the supplied results do not prove or refute it.}
\end{array}}
\]

So Attachment 1’s internal ticket mechanics may be nondegenerate, but the statement as posed still admits a parameter-level vacuous witness.

## Attachment 1 (verbatim): the audit that constructed (AE) and verified its nondegeneracy and pipeline-sufficiency (its Section B)

Source record reviewed. 

## A. **VALID**

The fourteenth collapse is real. With the old live threshold \(q_X>d_X\), a live shell with \(d_X<q\le2d_X\) already satisfies \(q\le q/2+d_X\), so a ticket can “complete” without deleting anything. The three outcomes listed are exhaustive for that architecture: zero-time re-registration loop, positive-service nonprogress loop, or finite epoch exhaustion. 

The \(4d_X\) repair works. The recurrence
\[
m_{j+1}\le \frac12m_j+d_X
\]
has fixed point \(2d_X\), and with \(J_H=2\lceil\log_2h\rceil+3\),
\[
m_{J_H}<17d_X/8<4d_X,
\]
so no further live epoch is required. The repair restores well-foundedness for the stated half-plus-dust recurrence. 

## B. **REFUTED**

The impossibility theorem is valid only for the family after feature (4) has already baked in per-shell online-area contraction. It is not an architectural impossibility theorem for all reasonable ledger/ticket intermediates.

A clean counterexample is an **aggregate-excess ticket ledger**.

Define
\[
R(t)=\sum_{X\ge H^6}\bigl(q_X(t)-\lceil4X/h^2\rceil\bigr)_+ .
\]
Whenever \(R(t)>0\), register one global ticket with mass \(M=R(t)\). Every Shortener turn while \(R>0\) is owned by this ticket. The ticket resolves within
\[
C M\frac{\log h}{h}+O(\log n)
\]
turns by proving
\[
R(t')\le M/2.
\]
Then immediately register the successor if \(R(t')>0\).

This is nondegenerate: every ticket proves real global deletion, every turn is owned, successors are mandatory, and the recurrence is well-founded. It is pipeline-sufficient because
\[
\sum M_j\le 2R(b)\le 2n,
\]
so total service is
\[
O(n\log h/h)+O(\log^2 n)=o(n),
\]
and termination leaves only \(O(n/h^2)+O(H^6)=o(n)\) residual mass.

But it is **strictly weaker than per-shell online area**. Consider an abstract monotone trajectory with \(N\) live shells, each starting at mass \(M\), and all shells eroding slowly in parallel so that none reaches \(M/2+d_X\) before time
\[
T\asymp N M\frac{\log h}{h},
\]
while the aggregate \(R\) halves at time \(T\). The aggregate ticket succeeds with budget proportional to total mass \(NM\). A serial online-area block fails: some individual shell must be active from the beginning, but no individual shell contracts within \(O(M\log h/h)\) raw Shortener turns once \(N\) is larger than the hidden constant.

So the exact failure is: Section VII’s feature list excludes aggregate-potential ledgers, and feature (4) silently identifies “successful ticket” with “per-shell half contraction.” That is already the online-area shape. The theorem proves a tautology for that subfamily, not an impossibility for ledger/ticket methods generally. 

## C. **REPAIRABLE**

Section VIII’s implication
\[
\mathsf{CTRMLA}_4\Rightarrow L(n)=o(n)
\]
is basically sound, conditional on the accepted reductions. The summation over epoch masses, the \(O(J_H\log n)\) ceiling term, the \(8n/h^2\) remaining large-shell dust, and the \(O(H^6)=o(n)\) small-shell contribution are all consistent. 

The overreach is in the final framing. The defensible statement is:

\[
\mathsf{CTRMLA}_4 \Rightarrow \mathrm{OA}^{path}_4 \Rightarrow L(n)=o(n).
\]

The non-defensible statement is “proving the repaired statement equals proving online area” without restricting to the same nonpreemptive, per-shell, serial-ticket encoding. The converse direction also needs the online-area schedule to be genuinely online and fixed before Prolonger; otherwise “register records in the order in which their online-area blocks are scheduled” is an after-the-fact quantifier slip. 

Final verdicts:

**A: VALID.**  
**B: REFUTED.**  
**C: REPAIRABLE — implication valid, equivalence/framing overclaims.**

## Attachment 2 (verbatim): the per-shell activation-area dichotomy that (AE) escapes — its collapse-family catalogue (14 families) is the checklist any (AE) policy design must respect, and its Sections I-V contain the ledger machinery available for building the policy

I use the uploaded record, including both audits and every item labeled established, as hypotheses. 

# Verdict

The thirteenth repair can be made formally complete, but it exposes a fourteenth collapse:

\[
\boxed{\textbf{additive-floor ticket chattering / epoch exhaustion}.}
\]

With the original dust threshold

\[
d_X=\frac{X}{h^2},
\]

every population \(q\in(d_X,2d_X]\) already satisfies

\[
q\le \frac q2+d_X.
\]

Consequently a ticket may satisfy its advertised “contraction” condition without removing even one target. Immediate re-registration then creates an infinite zero-time loop; delaying discharge merely creates infinitely many positive-cost tickets. A finite list of \(J_H\) epochs instead runs out while the shell is still above the registration threshold.

This fourteenth collapse is repairable by declaring populations at most \(4d_X\) to be dust. However, after that repair, mandatory registration, no-idle service, immediate succession, and the two ticket-resolution clauses are exactly a scheduled, trajectory-restricted version of the online-area statement.

The decisive conclusion is therefore the following impossibility theorem.

\[
\boxed{
\begin{minipage}{0.9\linewidth}
Within the serial-ticket/master-ledger architecture of the uploaded
statement, there is no closed, nondegenerate, pipeline-sufficient
intermediate theorem strictly weaker than trajectory-restricted online
area.

If mandatory registration, succession, or service coverage is omitted,
registration starvation remains possible. If those axioms are imposed
and every bounded ticket chain must end in the advertised
half-plus-dust contraction, the ticket intervals themselves are the
online-area processing blocks.
\end{minipage}}
\tag{IAT}
\]

Thus the route can be used as machinery for proving online area, but it cannot furnish a logically weaker separator between the presently established lemmas and online area.

---

# I. The maximally repaired statement

I first give the fully closed version to which the impossibility theorem applies.

## 1. Parameters

Let

\[
\mathcal X_n=
\left\{\frac n{2^k}:
0\le k\le\left\lfloor\log_2\frac n2\right\rfloor
\right\},
\qquad
S_X=(X/2,X]\cap\mathbb Z.
\]

For fixed \(\delta>0\), set

\[
H=\mathfrak T(n)^{1+\delta},
\qquad
h=H^2,
\qquad
d_X=\frac{X}{h^2}=\frac{X}{H^4},
\]

and

\[
J_H=2\lceil\log_2h\rceil+3.
\]

The repaired live-shell predicate is

\[
\mathsf{Live}_X(t)
\iff
X\ge H^6
\quad\text{and}\quad
|Q_X(t)|>4d_X.
\tag{1}
\]

The factor \(4\) is essential; it is not cosmetic.

The asymptotic hierarchy is

\[
\varepsilon_\delta(H)H^4J_H\longrightarrow0,
\tag{2}
\]

\[
\beta_\delta(n)\longrightarrow0,
\tag{3}
\]

\[
\frac{HJ_H\log h}{h}\longrightarrow0,
\tag{4}
\]

and

\[
H^6=o(n).
\tag{5}
\]

Here

\[
K_\delta\in(0,\infty),
\quad
\varepsilon_\delta:[1,\infty)\to[0,\infty),
\quad
\beta_\delta:\mathbb N\to[0,\infty).
\]

Define the service budget

\[
B_\delta(m)
=
\left\lceil
K_\delta m\frac{\log h}{h}
\right\rceil.
\tag{6}
\]

## 2. Closed quantifiers

Let \(\mathbf{Adm}\) denote the class of deterministic ledger constructors satisfying the axioms below.

The closed proposition has quantifier prefix

\[
\boxed{
\exists\mathcal K^\star\in\mathbf{Adm}\;
\exists C_0>0\;
\forall\delta>0\;
\exists K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}_{n\ge N_\delta}\;
\forall n\ge N_\delta\;
\forall\Pi.
}
\tag{7}
\]

The constructor \(\mathcal K^\star\), the policy family, all tie-breakers, and all witness algorithms are chosen before the universally quantified Prolonger policy \(\Pi\).

The exact negation is therefore

\[
\begin{aligned}
\forall\mathcal K^\star\in\mathbf{Adm}\;
\forall C_0>0\;
\exists\delta>0\;
\forall K_\delta,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}\;
\exists n\ge N_\delta\;
\exists\Pi:
\neg P.
\end{aligned}
\tag{8}
\]

In particular, neither \(\delta\) nor a single Prolonger policy may be moved outside the quantifiers without strengthening the negation.

## 3. Actual baseline

The Shortener policy begins with the fixed preprocessing policy \(\mathcal T_n\). Let \(b\) be its first prescribed endpoint on the actual play and put

\[
B=A_b.
\]

If the game terminates before \(b\), the accepted preprocessing theorem already gives a sublinear game.

For \(t\ge b\), define

\[
Q_X(t)=Q_X(A_t)\cap Q_X(B)
\]

and

\[
q_X(t)=|Q_X(t)|.
\]

Also define

\[
D_X(t)
=
\max_{d\in D(A_t)}
\#\{u\in Q_X(t):d\mid u\},
\tag{9}
\]

with \(D_X(t)=0\) when \(D(A_t)=\varnothing\).

Both \(q_X(t)\) and \(D_X(t)\) are nonincreasing along the actual continuation.

---

# II. Fully mathematical ledger data

At the baseline \(b\), the fixed constructor \(\mathcal K^\star\) generates, for every \(X\in\mathcal X_n\) and every \(0\le j<J_H\), the following objects.

## 1. Master atoms and weights

A finite set

\[
\Omega_{X,j}(B),
\]

a projection

\[
\pi_{X,j}:\Omega_{X,j}(B)\to Q_X(B),
\]

and positive weights

\[
w_{X,j}:\Omega_{X,j}(B)\to(0,\infty)
\]

satisfying

\[
\sum_{\substack{\omega\in\Omega_{X,j}(B)\\
\pi_{X,j}(\omega)=u}}
w_{X,j}(\omega)=1
\quad
\text{for every }u\in Q_X(B).
\tag{10}
\]

Thus every potential epoch contains a fixed unit-weight copy of every baseline target, and

\[
\sum_{j<J_H}
\sum_{\pi_{X,j}(\omega)=u}w_{X,j}(\omega)
=J_H.
\tag{11}
\]

No atom, signature, or weight can be chosen after future damage is known.

## 2. Canonical unavailability and causes

For each atom there is a total prefix-measurable Boolean map

\[
\mathsf U(\omega,\mathfrak h_t)\in\{0,1\},
\]

with

\[
\mathsf U(\omega,\mathfrak h_b)=0
\tag{12}
\]

and

\[
\mathsf U(\omega,\mathfrak h_t)
\le
\mathsf U(\omega,\mathfrak h_{t+1}).
\tag{13}
\]

The first exit time is

\[
\xi(\omega)
=
\min\{t>b:\mathsf U(\omega,\mathfrak h_t)=1\},
\tag{14}
\]

with \(\xi(\omega)=\infty\) if the set is empty.

There is a total cause map

\[
\chi(\omega)\in\mathcal C\cup\{\bot\},
\]

where \(\chi(\omega)=\bot\) exactly when \(\xi(\omega)=\infty\). The channels form an exact partition of first exits.

There is a fixed canonical predicate

\[
\mathsf{DA}(\omega,\mathfrak h_{\xi(\omega)-1},z_{\xi(\omega)})
\]

for the designated direct-ancestor mechanism, including its fixed tie-break in simultaneous-cause cases, and

\[
\boxed{
\chi(\omega)=\mathrm{anc}
\iff
\mathsf{DA}
(\omega,\mathfrak h_{\xi(\omega)-1},z_{\xi(\omega)})=1.
}
\tag{15}
\]

This excludes duplicate-channel and priority laundering. The distinguished ancestor channel is complete in both directions, not merely sound in one direction.

## 3. Online witness maps

For every channel \(c\), atom \(\omega\), and move index \(i>b\), there is a prefix-measurable mark

\[
\gamma_c(\omega,\mathfrak h_i)\in\{0,1\}.
\tag{16}
\]

If \(\chi(\omega)=c\), its canonical certificate is

\[
\Gamma_c(\omega)
=
\{i:b<i\le\xi(\omega),\
\gamma_c(\omega,\mathfrak h_i)=1\}.
\tag{17}
\]

A fixed arithmetic predicate

\[
\mathsf{Cert}_c
(\omega,\mathfrak h_{\xi(\omega)},\Gamma_c(\omega))
\]

must hold and must imply the claimed channel-\(c\) first exit.

The important online condition is that membership of \(i\) in the certificate is decided at prefix \(i\). Earlier moves cannot be inserted retrospectively into a certificate after an epoch is activated.

Define the potential-epoch relevance indicator

\[
\rho_{X,j}(i)
=
\mathbf 1
\left[
\exists\omega\in\Omega_{X,j}(B),\
\exists c\in\mathcal C:
\gamma_c(\omega,\mathfrak h_i)=1
\right].
\tag{18}
\]

This is a completely defined prefix-measurable map. There is no longer an undefined phrase such as “a move used in some causal certificate.”

---

# III. Mandatory ticket process

Tickets are queue records attached to shells. Registration and epoch activation are distinct.

## 1. Administrative closure before every Shortener move

Before each post-baseline Shortener move, repeatedly perform the following zero-move administrative operations until none applies:

1. Remove every waiting record whose shell is no longer live.

2. If a live shell has no active or waiting record, immediately enqueue one.

3. If no ticket is active and the queue is nonempty, activate the FIFO head.

The invariant after administrative closure is

\[
\boxed{
\mathsf{Live}_X(t)
\iff
\text{shell \(X\) has exactly one active or waiting record}.
}
\tag{19}
\]

If at least one live shell exists, exactly one ticket is active.

No completed ticket remains outstanding. There are no zombie tickets.

The queue order is FIFO, with a fixed deterministic shell tie-breaker. Successor records are appended after records already waiting.

## 2. Bounded activation delay

Suppose a record for \(X\) is registered at time \(r\), with registration mass \(a=q_X(r)\).

Every record ahead of it has total high-plus-cap service at most

\[
2B_\delta(a')
\]

where \(a'\) is its registration mass, because its eventual service-start mass cannot exceed \(a'\).

Therefore, unless \(X\) ceases to be live while waiting, its epoch activates within at most

\[
\sum_{\text{records ahead at registration}}
2B_\delta(a')
\tag{20}
\]

subsequent Shortener turns.

Thus “eventual service” is not merely a fairness slogan; it has a stated queue-potential bound.

## 3. Epoch start

When the record becomes active at time \(s_{X,j}\), assign it the next unused epoch index \(j\), and put

\[
m_{X,j}=q_X(s_{X,j}).
\tag{21}
\]

Since it is still live,

\[
m_{X,j}>4d_X.
\tag{22}
\]

Its active cohort is

\[
\Omega^{\mathrm{act}}_{X,j}
=
\{\omega\in\Omega_{X,j}(B):
\pi_{X,j}(\omega)\in Q_X(s_{X,j})\}.
\tag{23}
\]

This selection depends only on target survival. In particular, an already exited atom whose target survives is still included with its original weight.

Define

\[
\operatorname{Anc}_{X,j}(t)
=
\sum_{\substack{
\omega\in\Omega^{\mathrm{act}}_{X,j}\\
\xi(\omega)\le t\\
\chi(\omega)=\mathrm{anc}
}}
w_{X,j}(\omega),
\tag{24}
\]

and

\[
\mathsf A_{X,j}(t)
=
m_{X,j}-q_X(t).
\tag{25}
\]

All exits between \(b\) and \(s_{X,j}\) are inherited in (24).

The causal clock is

\[
\ell_{X,j}(t)
=
\sum_{i=b+1}^{t}\rho_{X,j}(i).
\tag{26}
\]

Thus pre-service witnesses are charged.

## 4. Separate service clock

Let

\[
v^H_{X,j}(t),\qquad v^C_{X,j}(t)
\]

count, respectively, Shortener turns assigned to this epoch while it is in high-degree or capped mode.

Every Shortener turn while any live shell exists increments exactly one of these counters for exactly one active ticket.

A move may causally affect many future cohorts, but it has only one service owner.

## 5. High-to-cap conversion and completion

If

\[
D_X(s_{X,j})>H,
\]

the ticket begins in high mode. Its high stopping time is the first of

\[
q_X(t)\le\frac12m_{X,j}+d_X,
\tag{27}
\]

\[
D_X(t)\le H,
\tag{28}
\]

or

\[
v^H_{X,j}(t)=B_\delta(m_{X,j}).
\tag{29}
\]

If (28) occurs first, the same ticket and same cohort convert to capped mode. There is no fresh epoch, no reset of \(m\), no reset of the ledger, and no reset of inherited debt.

If the ticket begins with \(D_X(s_{X,j})\le H\), it begins directly in capped mode.

A ticket leaves the system only after achieving

\[
q_X(t)\le \frac12m_{X,j}+d_X.
\tag{30}
\]

If the resulting shell remains live, its successor record is enqueued before the next Shortener move.

If no shell remains live, the policy immediately enters its fixed accepted completion phase. It may not spend an arbitrary unaccounted interval playing unrelated moves.

---

# IV. The two substantive inequalities

## 1. Ancestor harvest

For every high-mode prefix, including inherited debt at the start and the final high-mode move,

\[
\boxed{
\operatorname{Anc}_{X,j}(t)
\le
\varepsilon_\delta(H)X
+
C_0\mathsf A_{X,j}(t)
+
C_0H\ell_{X,j}(t).
}
\tag{TR-AH\(_4\)}
\]

The clock budgets are

\[
\ell_{X,j}(\tau_{X,j})
\le
K_\delta m_{X,j}\frac{\log h}{h},
\tag{31}
\]

and

\[
H\sum_{\text{activated }(X,j)}
\ell_{X,j}(\tau_{X,j})
\le
\beta_\delta(n)n.
\tag{32}
\]

## 2. Capped resolution

Every capped phase satisfies, within at most

\[
B_\delta(m_{X,j})
\]

assigned capped service turns,

\[
\boxed{
q_X(\tau_{X,j})
\le
\frac12m_{X,j}+d_X.
}
\tag{TR-CAP\(_4\)}
\]

Together with the accepted non-ancestor estimates and advance-depletion reduction, \((\mathrm{TR\!-\!AH}_4)\) implies that a high phase cannot hit (29) while both

\[
D_X>H
\]

and

\[
q_X>\frac12m_{X,j}+d_X
\]

still hold. Hence each activated ticket uses at most

\[
2B_\delta(m_{X,j})
\tag{33}
\]

Shortener service turns before contraction: at most one high budget and one capped budget.

Call the complete quantified proposition above

\[
\mathsf{CTRMLA}_4.
\]

It is the closed trajectory-restricted master-ledger activation statement.

---

# V. Closure of the first thirteen families

The exact clauses closing the known degeneracies are now:

| Collapse | Closing clause |
|---|---|
| Terminal delay | Fixed baseline; early termination already costs \(o(n)\); prefix obligations cannot be erased later. |
| Prelude delay | The preprocessing algorithm and first endpoint are fixed before the continuation. |
| Cap before freeze | Every live capped shell is immediately registered at the baseline. |
| Shell deferral/raw-time credit | Causal clocks count only online marked witnesses; service clocks count every Shortener turn. |
| Zero weights/omitted targets | Strictly positive weights and exact unit mass in every target fiber. |
| First-exit reassignment | Global monotone exit time and immutable exact cause map. |
| Cost-only/terminal equivalence | \(H\) is arithmetically fixed, and the baseline is not chosen at a terminal witness. |
| Micro-baseline compression | Populations at most \(4X/h^2\) are genuinely globally negligible. |
| Cap escape | High-to-cap conversion preserves the same ticket, mass, cohort, and ledger. |
| Epoch-boundary laundering | Exit times and clocks begin at the common baseline; inherited exits remain charged. |
| Uncharged scheduling delay | Every relevant Shortener turn has exactly one active service owner. |
| Post-hoc cohort selection | Every potential cohort and weight is fixed at \(b\); activation uses only target survival. |
| Registration starvation | Actual live shells are in exact bijection with active or waiting records; successors are immediate. |

The audits’ additional formal defects are also removed:

- direct-ancestor channel completeness is an equivalence, not a one-way soundness clause;
- witnesses are prefix-measurable online maps;
- baseline atoms are initially usable;
- stopped tickets cannot block successors;
- the conjunction includes the quantifiers, hierarchy, triggers, deadlines, queue rules, and terminal convention.

---

# VI. The fourteenth collapse

The original threshold was

\[
q_X>d_X.
\]

Choose an integer \(q\) satisfying

\[
d_X<q\le2d_X.
\tag{34}
\]

Such an integer exists for every audited shell when \(n\) is large, because

\[
d_X\ge\frac{H^6}{H^4}=H^2\to\infty.
\]

Then

\[
q\le2d_X
\iff
q\le\frac q2+d_X.
\tag{35}
\]

Therefore a newly activated ticket with mass \(m=q\) already meets its completion inequality at its starting state.

There are only three possibilities.

### Immediate discharge

The ticket is discharged without a move. Since \(q>d_X\), mandatory succession creates another ticket at the same state. This repeats forever before the policy makes its next game move.

### Positive-service discharge

The scheduler insists on spending service turns before checking completion. It may then spend \(B_\delta(q)\) turns and discharge the ticket while \(q\) is unchanged. Re-registration creates an unbounded sequence of positive-cost tickets.

### Finite epoch list

After \(J_H\) such tickets, no pre-registered epoch remains, while the shell still satisfies \(q>d_X\). Mandatory registration and the finite master ledger become inconsistent.

Thus the original registration repair is not well founded.

The recurrence explains the obstruction. If

\[
m_{j+1}\le\frac12m_j+d_X,
\tag{36}
\]

then its fixed point is \(2d_X\). A terminal threshold below that fixed point cannot be reached from (36) alone.

The threshold \(4d_X\) repairs the defect. Any constant strictly larger than \(2\) would work, with a corresponding change in the number of epochs.

---

# VII. Activation–area impossibility theorem

We now prove the architectural theorem.

## Theorem

Consider any trajectory-restricted serial-ticket scheme with the following features:

1. Apart from a fixed \(o(n)\) prelude and endgame, all Shortener time is meant to be bounded by summing ticket service budgets.

2. Ticket-local certificate inequalities are asserted only for registered or activated tickets.

3. A ticket, or a bounded chain of its non-resetting phases, has total service budget

   \[
   O\!\left(m\frac{\log h}{h}\right)+O(1).
   \]

4. A successful chain above dust must terminate with actual shell contraction

   \[
   q'\le\frac12m+d_X.
   \tag{37}
   \]

Then exactly one of the following holds.

### Starvation branch

Some live shell can have no outstanding ticket, some relevant turn can have no service owner, some completed ticket can block a successor, or an unbounded phase chain can occur before contraction. In that case the ticket assertions do not support the claimed total-time bound.

### Online-area branch

Every live shell is registered, all relevant turns are service-owned, every live successor is immediate, and every bounded phase chain ends in (37). Then the ticket chains themselves form a scheduled trajectory-restricted online-area decomposition.

For the half-plus-\(d_X\) recurrence with \(J_H=2\lceil\log_2h\rceil+3\), a well-founded \(O(\log h)\)-epoch decomposition requires a terminal threshold strictly above \(2d_X\); the choice \(4d_X\) suffices.

Consequently no nondegenerate, pipeline-sufficient member of this ticket architecture is strictly weaker than trajectory-restricted online area.

## Proof

### 1. Deletion gives registration starvation

Let \(\mathcal E\) be the collection of activated epochs.

Before mandatory registration is inserted, every ledger assertion has the form

\[
\forall e\in\mathcal E:\ P(e),
\tag{38}
\]

while clock conditions have upper-bound form

\[
\sum_{e\in\mathcal E}C(e)\le M.
\tag{39}
\]

Queue conditions similarly quantify over tickets that exist.

If eligibility does not imply registration, replace \(\mathcal E\) by any subcollection \(\mathcal E'\subseteq\mathcal E\), in particular by deleting all high-degree tickets.

Then:

- every universal condition (38) remains true;
- every upper-bound condition (39) becomes easier;
- FIFO and uniqueness properties remain true on the smaller queue;
- every deleted service counter and causal clock disappears;
- all potential master cohorts may remain honestly pre-registered.

Thus the ticket language is downward closed under ticket deletion unless it contains an explicit existence axiom.

The same argument applies after a completed ticket if successor registration is not mandatory. Delete all successors. It also applies when a stopped ticket is allowed to remain outstanding: leave one zombie record and suppress every later epoch.

Therefore a total registration-and-succession invariant is logically necessary.

### 2. Service ownership is necessary

Suppose a live shell exists but a Shortener turn need not increment any active service clock. That turn is absent from every sum of ticket budgets.

Repeating such uncovered turns produces an arbitrarily long interval not bounded by the service accounting. “Work-conserving” is irrelevant when the queue is empty or no ticket is declared active.

The only alternatives are:

- require every relevant turn to have exactly one service owner; or
- separately assume that the number of uncovered turns is \(o(n)\).

The second alternative is already a direct global time bound. Within the stipulated ticket-summing pipeline, the first is the noncircular formulation.

### 3. An unbounded phase chain is another starvation mechanism

High and capped phases may be separate, and other finite repair phases could be introduced. Coalesce all consecutive non-resetting phases of one shell until the first occurrence of (37).

If their total service is not bounded by

\[
C B_\delta(m)+O(1)
\]

for an absolute or \(\delta\)-dependent constant \(C\), then arbitrarily many service turns may occur without an online-area contraction. The total service proof fails.

If their total service is bounded, the coalesced interval is one processing block satisfying (37).

Thus adding more named phases does not avoid the dichotomy: they either form an unbounded starvation chain or coalesce into an online-area block.

### 4. The repaired recurrence has finitely many epochs

Let \(m_j\) be the service-start mass of the \(j\)-th activated epoch of shell \(X\). Waiting can only decrease the shell population, so

\[
m_{j+1}
\le
\frac12m_j+d_X.
\tag{40}
\]

Inductively,

\[
m_j
\le
2^{-j}m_0+2d_X(1-2^{-j})
<
2^{-j}X+2d_X.
\tag{41}
\]

For

\[
J_H=2\lceil\log_2h\rceil+3,
\]

we have

\[
2^{-J_H}X
\le
\frac{X}{8h^2}
=
\frac{d_X}{8}.
\tag{42}
\]

Hence

\[
m_{J_H}
<
\frac{17}{8}d_X
<
4d_X.
\tag{43}
\]

Therefore no \((J_H+1)\)-st live epoch is requested. The repaired registration process is well founded.

Moreover,

\[
\begin{aligned}
\sum_{j<J_H}m_j
&\le
\sum_{j<J_H}2^{-j}X+2J_Hd_X\\
&<
2X+\frac{2J_HX}{h^2}\\
&=O(X).
\end{aligned}
\tag{44}
\]

### 5. Tickets give online-area blocks

Consider one activated epoch with service-start mass \(m\).

If it begins capped, \((\mathrm{TR\!-\!CAP}_4)\) gives, in at most \(B_\delta(m)\) assigned turns,

\[
q_X(\mathrm{end})
\le
\frac12m+d_X.
\tag{45}
\]

If it begins high-degree, the accepted advance-depletion reduction and \((\mathrm{TR\!-\!AH}_4)\) give, within the first \(B_\delta(m)\) turns, either (45) or cap conversion.

Indeed, because \(m>4X/H^4\),

\[
\frac{\varepsilon_\delta(H)X}{m}
\le
\frac14\varepsilon_\delta(H)H^4
=
o(1/J_H),
\tag{46}
\]

and by the local clock bound,

\[
\frac{H\ell_{X,j}}{m}
\le
K_\delta\frac{H\log h}{h}
=
K_\delta\frac{\log h}{H}
=o(1).
\tag{47}
\]

The other accepted channels contribute \(o(m)\), so the stipulated high-degree reduction rules out a deadline with both high degree and no contraction.

After conversion, the capped phase uses at most one additional budget. Therefore the coalesced high-plus-cap interval has at most

\[
2B_\delta(m)
\tag{48}
\]

Shortener turns and ends with (45).

That interval is precisely an online-area processing block.

Mandatory registration ensures every live shell has such a block waiting or active. No-idle service ensures every relevant Shortener turn belongs to one block. Immediate succession repeats the construction while the shell remains above \(4d_X\).

Hence the tickets furnish a scheduled pathwise online-area decomposition.

### 6. Conversely, online-area blocks furnish tickets

Suppose a complete Shortener policy already has a scheduled pathwise online-area decomposition: whenever a shell is processed with starting mass \(m>4d_X\), a block of at most

\[
C m\frac{\log h}{h}+O(1)
\]

Shortener turns ends with

\[
q_X\le\frac12m+d_X,
\]

and all relevant turns belong to one serial block.

Register every live shell immediately. Put the records in the order in which their online-area blocks are scheduled. A record disappearing below \(4d_X\) while waiting is discharged by helpful progress. Activate the next record at the beginning of its block and re-register a successor after its block if necessary.

This gives mandatory registration, no-idle service, FIFO succession, bounded service, and the same contraction recurrence.

Therefore the operational ticket core and scheduled trajectory online area are equivalent encodings.

This proves the theorem. ∎

---

# VIII. Verification of the implication to \(L(n)=o(n)\)

The maximally repaired statement \(\mathsf{CTRMLA}_4\) does imply \(L(n)=o(n)\), but the proof now makes clear that this is because it already implies online area.

For one shell, the total Shortener service is, using (44),

\[
\begin{aligned}
\sum_{j<J_H}2B_\delta(m_j)
&\le
2K_\delta\frac{\log h}{h}
\sum_{j<J_H}m_j
+
2J_H\\
&=
O_\delta\!\left(\frac{X\log h}{h}\right)
+
O(J_H).
\end{aligned}
\tag{49}
\]

The dyadic scales satisfy

\[
\sum_{X\in\mathcal X_n}X<2n
\]

and

\[
|\mathcal X_n|=O(\log n).
\]

Therefore all large-shell ticket service is

\[
O_\delta\!\left(\frac{n\log h}{h}\right)
+
O(J_H\log n)
=
o(n).
\tag{50}
\]

The ceiling term is harmless because

\[
J_H=O(\log H)=O(\log n)
\]

and hence

\[
J_H\log n=o(n).
\]

When ticket processing terminates, every large shell has

\[
q_X\le4d_X=\frac{4X}{h^2},
\]

so the total remaining large-shell mass is at most

\[
\sum_X\frac{4X}{h^2}
<
\frac{8n}{h^2}
=o(n).
\tag{51}
\]

The shells with \(X<H^6\) contain only

\[
O(H^6)=o(n)
\tag{52}
\]

integers.

The fixed preprocessing costs \(o(n)\). Since Prolonger and Shortener alternate, \(o(n)\) Shortener service turns account for \(o(n)\) actual moves. The exact-only bank, transfers to the minimal legal set, the negligible dust and small-shell populations, and the accepted static completion theorem then give the stipulated online-area endgame.

Consequently

\[
\boxed{
\mathsf{CTRMLA}_4
\Longrightarrow
\mathrm{OA}^{\mathrm{path}}_4
\Longrightarrow
L(n)=o(n).
}
\tag{53}
\]

---

# Final resolution

The fourteenth collapse is

\[
\boxed{\text{additive-floor ticket chattering}.}
\]

It is repaired by changing the live threshold from

\[
\frac{X}{h^2}
\]

to, for example,

\[
\frac{4X}{h^2}.
\]

After making that repair and adding the audits’ mandatory registration, exact witness, unique-cause, no-idle, succession, and re-registration requirements, the formal statement is well defined and excludes all identified degeneracies.

But the repair has an unavoidable architectural consequence:

\[
\boxed{
\text{mandatory activation}
+
\text{bounded ticket resolution}
+
\text{no-idle coverage}
=
\text{trajectory-restricted online area}.
}
\]

Therefore the trajectory master-ledger family cannot be closed as a genuinely weaker intermediate theorem. Either some ticketless or noncontracting interval remains, producing a starvation witness, or the resulting statement already contains the operational content of online area.

This does not decide whether \(L(n)=o(n)\). It decisively ends this formulation loop: proving the fully repaired ancestor-ledger statement would be a proof of online area itself, while weakening it enough to avoid that implication reopens registration starvation, service starvation, phase-chain starvation, or additive-floor chattering.

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.
