Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. First formulate the trajectory-restricted statement per the Problem section (with nondegeneracy proofs), then provide a full proof or disproof of it.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Your task continues a formulation-and-resolution loop; the two attachments are its latest round and the audit adjudicating it.

Part 1 — formulate the TRAJECTORY-RESTRICTED statement. Attachment 1 constructs a baseline-complete capped-state/ancestor-harvest statement and validly disproves it — but only because its capped-state clause quantifies over ALL baseline positions, including positions unreachable against the very policy being quantified (the disproving fortress is provably NOT reachable against a policy incorporating the established fixed-density clearing sweep). Attachment 2 (the audit) shows the family-wide no-go therefore fails and identifies the surviving canonical target: the trajectory-restricted formulation, in which every obligation (capped-state processing, ledgers, budgets, stopping events) applies ONLY to states actually reachable against the policy on the realized play, while retaining all the nondegeneracy machinery already developed (master ledger, global budgets, frozen-mass domination of H). Attachment 2 also exhibits an ELEVENTH collapse (uncharged scheduling delay) that your formulation must additionally close. Write the trajectory-restricted statement precisely and prove it nondegenerate against all eleven known collapse families plus your own search for a twelfth.

Part 2 — resolve. Prove or disprove your trajectory-restricted statement in full. Note the asymmetry your formulation creates: a disproof can no longer use off-path states — it must force bad reachable states against every complete policy; a proof may now use everything the policy actually does, including clearing sweeps, since only realized trajectories carry obligations.

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


## Attachment 1 (verbatim): the baseline-complete formulation, its ten nondegeneracy exclusions, and its (valid, off-path) self-disproof

# Verdict

The previous one-baseline statement cannot be repaired merely by adding the condition \(|\widehat Q_X|/H\to\infty\) and replacing the global time \(t\) by epoch-local clocks. Two further defects appear:

1. **Epoch-boundary laundering:** setup performed in one epoch can finance a large direct-ancestor jump immediately after rebasing unless all epoch ledgers are pre-registered in one master ledger and every clock/error has a global budget.
2. **Cap escape:** an epoch may reach \(D_X\le H\) with a linear reservoir and essentially no ancestor loss. An ancestor inequality then says nothing, while the shell need not halve within the required processing budget.

The second defect is decisive. The strongest baseline-complete repair is false by the accepted primorial-fortress construction. Restricting the repair to only those capped states reached by the proposed policy avoids the counterexample only by inserting the missing capped-state part of (OA) into the theorem itself. Thus there is no baseline-independent, ancestor-harvest-only separator of this family.

I treat the previous formulation and its audit as the supplied record. 

---

# Part I. The repaired canonical statement

## 1. Fixed outer data and parameter order

For each \(n\), let

\[
\mathcal X_n=\left\{\frac{n}{2^j}:0\le j\le \left\lfloor\log_2\frac n2\right\rfloor\right\},
\qquad
S_X=(X/2,X]\cap\mathbb Z.
\]

These shells are pairwise disjoint.

Fix, **outside every existential quantifier below**, a data sequence

\[
\mathbf K^\star=(\mathbf K^\star_n)_{n\ge2}.
\]

For each \(n\), the datum \(\mathbf K^\star_n\) consists of actual total functions on finite legal histories:

\[
\mathbf K^\star_n=
\bigl(
\mathcal B_n,\,
\Omega,\pi,w,\,
(I_c)_{c\in\mathcal C},\prec,\,
\operatorname{Sched},\rho
\bigr).
\]

Here:

- \(\mathcal B_n\) is the fixed set of admissible post-trapping baseline positions. It is not chosen by the eventual Shortener policy.
- \(\Omega,\pi,w\) are the canonical master-ledger maps described below.
- \(\mathcal C\) is a finite channel set containing a distinguished channel \(\mathrm{anc}\).
- Each
  \[
  I_c(A,X,\omega,\mathfrak h)\in\{0,1\}
  \]
  is a fixed Boolean function of the baseline, shell, ledger atom and current history extension.
- \(\prec\) is a fixed total order on \(\mathcal C\), used to resolve simultaneous channel events.
- \(\operatorname{Sched}\) is the fixed shell/epoch scheduling map.
- \(\rho\) is the fixed relevance map used to define charged clocks.

Thus expressions such as “required lift,” “represented payload,” “ordinary failure” and “first prescribed endpoint” do not occur in the theorem as prose predicates. They have already been replaced by components of \(\mathbf K^\star\).

For concreteness, a smooth/rough trapping predicate can be written mathematically. With \(y=\frac14\log n\), define

\[
m_{\mathrm{sm}}
=
\prod_{\substack{p^a\parallel m\\p\le y}}p^a,
\qquad
m_{\mathrm{rf}}=\frac{m}{m_{\mathrm{sm}}},
\]

and

\[
\operatorname{Trap}_n(A)
\iff
\forall m\in\mathcal L(A)\ 
\exists a_{\mathrm{sm}},a_{\mathrm{rf}}\in A:
m_{\mathrm{sm}}\mid a_{\mathrm{sm}}
\ \text{and}\
m_{\mathrm{rf}}\mid a_{\mathrm{rf}}.
\]

A baseline-complete datum has

\[
\{A:\ A\text{ primitive},\ |A|\le \eta_n n,\ 
\operatorname{Trap}_n(A)\}
\subseteq \mathcal B_n
\]

for some fixed \(\eta_n\to0\), and includes the accepted primorial-batched trapped positions.

Now fix \(\delta>0\) and put

\[
\mathfrak T(n)=\max_{m\le n}\tau(m),
\qquad
H=\mathfrak T(n)^{1+\delta},
\qquad
r=\left\lfloor(\log H)^{1/3}\right\rfloor,
\qquad
h=H^2.
\]

The quantitative hierarchy is required to be

\[
\varepsilon_\delta(H)H^4\log H\longrightarrow0,
\tag{H1}
\]

\[
\beta_\delta(n)\longrightarrow0,
\tag{H2}
\]

and

\[
\frac{H\log h}{h}
=
\frac{2\log H}{H}
\longrightarrow0.
\tag{H3}
\]

Also \(H=n^{o(1)}\), so

\[
H^6=o(n).
\tag{H4}
\]

The residual-channel coefficient remains valid:

\[
\frac{2^r\mathfrak T(n)}{H/\log H}
=
H^{-\delta/(1+\delta)+o(1)}\log H
=o(1).
\tag{H5}
\]

The exact quantifier prefix is

\[
\boxed{
\mathbf K^\star\text{ fixed};\
\exists C_0>0\
\forall\delta>0\
\exists K_\delta>0,\varepsilon_\delta,\beta_\delta,N_\delta,
\{\Sigma_{n,\delta}\}_{n\ge N_\delta}\
\forall n\ge N_\delta\
\forall A\in\mathcal B_n\
\forall\Pi.
}
\tag{Q}
\]

Here \(C_0\) is independent of \(\delta\), while \(K_\delta,\varepsilon_\delta,\beta_\delta\) and the strategy may depend on \(\delta\). The maps in \(\mathbf K^\star\) do not.

---

## 2. The pre-registered master ledger

Fix a baseline \(A\in\mathcal B_n\), a continuation generated by Shortener’s \(\Sigma_{n,\delta}\) against Prolonger’s strategy \(\Pi\), and a shell \(S_X\).

Write

\[
Q_X^t=Q_X(A_t)\cap Q_X(A).
\]

For every epoch \(j\), the fixed ledger supplies a finite atom set

\[
\Omega_{X,j}(A),
\]

a target map

\[
\pi_{X,j}:\Omega_{X,j}(A)\to Q_X^{s_{X,j}},
\]

and positive weights \(w_{X,j}(\omega)>0\) satisfying

\[
\sum_{\substack{\omega\in\Omega_{X,j}(A)\\
\pi_{X,j}(\omega)=u}}
w_{X,j}(\omega)=1
\qquad
(u\in Q_X^{s_{X,j}}).
\tag{L1}
\]

Consequently

\[
\sum_{\omega\in\Omega_{X,j}(A)}
w_{X,j}(\omega)
=
|Q_X^{s_{X,j}}|.
\tag{L2}
\]

All epoch atoms are pre-registered at the original baseline. They are pairwise disjoint as labelled objects:

\[
\Omega_{X,j}\cap\Omega_{X,k}=\varnothing
\qquad(j\ne k).
\tag{L3}
\]

The total exposure of one baseline target is bounded by the maximum possible number of halving epochs:

\[
\sum_j
\sum_{\substack{\omega\in\Omega_{X,j}\\\pi_{X,j}(\omega)=u}}
w_{X,j}(\omega)
\le
J_H,
\qquad
J_H:=2\lceil\log_2 h\rceil+3.
\tag{L4}
\]

Thus rebasing cannot repeatedly create unlimited new unit mass.

For \(\omega\in\Omega_{X,j}\), define

\[
\xi(\omega)
=
\min\left\{
t\ge s_{X,j}:
\max_{c\in\mathcal C}
I_c(A,X,\omega,\mathfrak h_t)=1
\right\},
\]

with \(\xi(\omega)=\infty\) if the set is empty. At time \(\xi(\omega)<\infty\), define

\[
\chi(\omega)
=
\min_{\prec}
\left\{
c\in\mathcal C:
I_c(A,X,\omega,\mathfrak h_{\xi(\omega)})=1
\right\}.
\tag{L5}
\]

This is a disjoint, immutable first-exit assignment.

The direct-ancestor mass accumulated in epoch \(j\) by time \(t\) is

\[
\operatorname{Anc}_{X,j}(t)
=
\sum_{\substack{\omega\in\Omega_{X,j}\\
s_{X,j}<\xi(\omega)\le t\\
\chi(\omega)=\mathrm{anc}}}
w_{X,j}(\omega).
\tag{L6}
\]

---

## 3. Epochs, area and charged clocks

Let

\[
m_{X,j}=|Q_X^{s_{X,j}}|.
\]

A shell epoch is audited only when

\[
X\ge H^6
\qquad\text{and}\qquad
m_{X,j}>\frac{X}{h^2}=\frac{X}{H^4}.
\tag{A1}
\]

Then automatically

\[
\frac{m_{X,j}}H
>
\frac{X}{H^5}
\ge H.
\tag{A2}
\]

Thus every audited reservoir exceeds \(H\) by the explicit factor \(H\).

Define the actual favorable area in the epoch by

\[
\mathsf A_{X,j}(t)
=
|Q_X^{s_{X,j}}\setminus Q_X^t|.
\tag{A3}
\]

The fixed relevance map gives

\[
\rho_{X,j,i}
=
\rho(A,X,j,\mathfrak h_{i-1},z_i)
\in\{0,1\},
\]

where \(z_i\) is the move made at time \(i\). The charged clock is

\[
\ell_{X,j}(t)
=
\sum_{i=s_{X,j}+1}^{t}\rho_{X,j,i}.
\tag{A4}
\]

Unrelated elapsed time gives no credit. Every move used by the canonical residual, ancestor or repair accounting must have \(\rho_{X,j,i}=1\).

A high-degree epoch begins with

\[
D_X(s_{X,j})>H
\]

and ends at

\[
\tau_{X,j}
=
\min\left\{
t>s_{X,j}:
D_X(t)\le H
\ \text{or}\
|Q_X^t|
\le
\frac12m_{X,j}+\frac{X}{h^2}
\right\}.
\tag{A5}
\]

The estimate includes \(t=\tau_{X,j}\).

---

## 4. The repaired multi-epoch harvest inequality

The ancestor component is

\[
\boxed{
\operatorname{Anc}_{X,j}(t)
\le
\varepsilon_\delta(H)X
+
C_0\,\mathsf A_{X,j}(t)
+
C_0H\,\ell_{X,j}(t)
}
\tag{ME-AH}
\]

for every audited high-degree epoch and every integer

\[
s_{X,j}\le t\le\tau_{X,j}.
\]

The local and global clock requirements are

\[
\ell_{X,j}(\tau_{X,j})
\le
K_\delta
m_{X,j}\frac{\log h}{h},
\tag{B1}
\]

and

\[
H
\sum_{X,j}
\ell_{X,j}(\tau_{X,j})
\le
\beta_\delta(n)n.
\tag{B2}
\]

The first estimate makes the clock cost a vanishing fraction of the current epoch mass:

\[
\frac{H\ell_{X,j}(\tau_{X,j})}{m_{X,j}}
\le
K_\delta\frac{H\log h}{h}
=
O_\delta\!\left(\frac{\log H}{H}\right)
=o(1).
\tag{B3}
\]

The second prevents the same actual moves from creating unlimited credit in many ledgers.

Because epoch ledgers are pre-registered and satisfy (L3)–(L4), all ancestor exits from previous epochs remain in the master accounting. They are not erased by rebasing.

---

## 5. The missing capped-mode clause

The previous formulation stopped when \(D_X\le H\). That is insufficient.

For every time \(s\) at which

\[
X\ge H^6,\qquad
q:=|Q_X^s|>\frac{X}{h^2},
\qquad
D_X(s)\le H,
\tag{C1}
\]

Shortener must immediately enter an exclusive capped block for shell \(X\). Put

\[
B_\delta(q)
=
\left\lceil
K_\delta q\frac{\log h}{h}
\right\rceil.
\tag{C2}
\]

During the next \(B_\delta(q)\) Shortener turns, every Shortener move is assigned to this block. Hence there are at most \(2B_\delta(q)+1\) actual moves before the block ends.

The required capped-mode conclusion is

\[
\boxed{
|Q_X^{\mathrm{end}}|
\le
\frac12q+\frac{X}{h^2}.
}
\tag{CAP}
\]

This clause also applies when the baseline itself already satisfies \(D_X(0)\le H\).

---

## 6. The canonical repaired assertion

The repaired statement is the conjunction

\[
\boxed{
\mathrm{RMEAH}^{\sharp}(\mathbf K^\star)
:=
(\mathrm{ME\!-\!AH})+(\mathrm{B1})+(\mathrm{B2})+(\mathrm{CAP})
}
\]

with quantifiers (Q), exact ledgers (L1)–(L5), activity rule (A1), and hierarchy (H1)–(H5).

This is the minimal baseline-complete repair of the previous proposal. Omitting \((\mathrm{CAP})\) restores the cap-escape collapse proved below.

---

# Part II. Nondegeneracy

## 1. Terminal delay

An audited epoch has

\[
m_{X,j}>X/h^2>0.
\]

It therefore cannot start at a terminal position. If the game terminated during the externally fixed trapping stage, it ended after \(o(n)\) moves and is genuinely harmless.

After the baseline, the ledger already exists. Waiting until terminal does not create a new empty ledger: target deaths and transfers contribute to \(\mathsf A_{X,j}\), and ancestor exits remain in their original epoch atoms.

---

## 2. Prelude delay

The baseline \(A\) is universally quantified in \(\mathcal B_n\). Shortener receives \(A\) as input and begins immediately.

There is no existential “first endpoint” that Shortener may move. The fixed external datum \(\mathbf K^\star\) is outside the quantifier prefix (Q).

---

## 3. Cap forcing before the freeze

A baseline satisfying

\[
D_X(0)\le H,\qquad |Q_X^0|>X/h^2
\]

is not excluded. It immediately triggers \((\mathrm{CAP})\).

Thus a preprocessing sweep cannot make the ancestor theorem empty merely by crossing the cap.

---

## 4. Shell deferral and global-time credit

The right side contains no raw term \(CHt\). It contains the charged clock

\[
CH\ell_{X,j}(t).
\]

An unrelated move has \(\rho_{X,j,i}=0\), hence contributes no credit. Relevant moves may be charged, but (B2) prevents repeated global counting.

In particular, delaying a linear shell for \(q/H\) charged moves would itself consume order \(q\) of the global budget and cannot be hidden inside an \(o(n)\) allowance.

---

## 5. Zero weights and omitted mass

Equations (L1)–(L2) imply exact unit normalization on every live target. All weights are positive.

One cannot choose a preferred subfamily of faces or give inconvenient targets zero mass.

---

## 6. First-exit reassignment

The channel is the lexicographically first true Boolean predicate at the first exit time, as defined by (L5).

A later residual death, target death, boundary event or minimal transfer cannot change an earlier \(\mathrm{anc}\) assignment.

---

## 7. Collapse to the cost-only statement

The assertion is uniform over every \(A\in\mathcal B_n\), not merely the terminal node reached by an optimal Shortener policy.

Moreover, (ME-AH) is tested at every prefix of every audited epoch. Ending the game eventually does not establish the early-prefix inequalities.

---

## 8. Micro-baseline compression

Suppose a preprocessing rule reduces every uncapped shell to \(O(H)\) targets.

For \(X\ge H^6\),

\[
O(H)<\frac{X}{H^4}=\frac{X}{h^2}
\]

for all large \(n\). Such a shell is placed in the dust class.

Because the shells are disjoint and

\[
\sum_{X\in\mathcal X_n}X<2n,
\]

the total large-shell dust is at most

\[
\sum_X\frac{X}{h^2}
<
\frac{2n}{H^4}
=o(n).
\tag{D1}
\]

All shells with \(X<H^6\) together contain only

\[
O(H^6)=o(n)
\tag{D2}
\]

integers.

Therefore compressing every shell below the activity threshold is genuine global progress: only \(o(n)\) target mass remains. If instead the sweep leaves a large shell with \(D_X\le H\), it triggers \((\mathrm{CAP})\).

The eighth collapse is therefore excluded.

---

## 9. New collapse: cap escape

The old stopping rule regarded \(D_X\le H\) as an acceptable endpoint even if the shell retained linear mass.

At such an endpoint one can have

\[
\operatorname{Anc}_{X,j}=0,
\qquad
\mathsf A_{X,j}=0,
\]

so every ancestor inequality holds, but no shell contraction has occurred.

Clause \((\mathrm{CAP})\) is precisely the repair.

---

## 10. New collapse: epoch-boundary laundering

Without (L3)–(L4), one could perform setup during epoch \(j\), rebase after an unrelated halving, and let a single move at the beginning of epoch \(j+1\) erase a large new face ledger. All setup costs would lie in the old epoch while the ancestor loss would lie in the new one.

Here every epoch atom is pre-registered, every atom has one first exit, and the cumulative exposure of one target is at most \(J_H=O(\log h)\). No previous exit is deleted when the epoch number changes.

The rate condition

\[
\varepsilon(H)h^2\log h\to0
\]

is exactly (H1), so even the \(O(\log h)\) repetition allowed by (L4) cannot inflate the error beyond \(X/h^2\).

---

# Part III. Why the repaired statement would imply \(L(n)=o(n)\)

For a high-degree epoch, the accepted residual estimate gives

\[
|\mathcal E_{\mathrm{res}}|
\le
o(1)\,\ell_{X,j},
\]

and capped face weights contribute only \(o(H\ell_{X,j})\). The ordinary, boundary, high-lcm, overlap, guard and exact/minimal channels are already covered by the accepted reductions.

Combining them with (ME-AH) gives, on the epoch,

\[
\operatorname{Repair}_{X,j}
\le
o(m_{X,j})
+
C_0\mathsf A_{X,j}
+
O(H\ell_{X,j})
+
\varepsilon(H)X.
\]

By (B3),

\[
H\ell_{X,j}=o(m_{X,j}).
\]

Since an audited epoch satisfies \(m_{X,j}\ge X/h^2\), condition (H1) gives

\[
\varepsilon(H)X=o(m_{X,j}/\log h).
\]

The accepted advance-depletion reduction therefore yields one of two events:

\[
|Q_X^{\tau_{X,j}}|
\le
\frac12m_{X,j}+\frac{X}{h^2},
\]

or

\[
D_X(\tau_{X,j})\le H.
\]

In the second case, \((\mathrm{CAP})\) gives the same contraction after at most one additional capped block.

Hence every completed macro-epoch satisfies

\[
m_{X,j+1}
\le
\frac12m_{X,j}+\frac{X}{h^2}.
\tag{R1}
\]

After \(O(\log h)\) epochs,

\[
m_{X,j}=O(X/h^2).
\]

Moreover,

\[
\sum_j m_{X,j}=O(X),
\]

so the number of Shortener service turns in shell \(X\) is

\[
O\!\left(
\frac{\log h}{h}\sum_jm_{X,j}
\right)
=
O\!\left(\frac{X\log h}{h}\right).
\]

Summing over the disjoint shells gives

\[
O\!\left(\frac{n\log h}{h}\right)=o(n).
\]

The small shells contribute \(O(H^6)=o(n)\), and the final dust contributes \(O(n/h^2)=o(n)\). Adding the \(o(n)\)-move trapping stage, the position has size \(o(n)\); the accepted static-completion theorem supplies an \(o(n)\)-sized maximal completion.

Therefore

\[
\mathrm{RMEAH}^{\sharp}(\mathbf K^\star)
\Longrightarrow
L(n)=o(n).
\]

The implication is now valid: it uses genuinely repeatable ledgers, a summable clock and an explicit capped-state branch.

---

# Part IV. Disproof of the repaired statement

The obstruction is the accepted primorial-batched fortress.

## 1. The fortress baseline

Choose a slowly growing function \(H_0(n)\to\infty\) with

\[
H_0(n)\le H(n).
\]

By the stipulated primorial-batching construction, for infinitely many \(n\) there is an obtainable trapped position \(A_n^\star\) with a top-shell reservoir

\[
Q_n^\star\subseteq(n/2,n]
\]

such that

\[
q_n:=|Q_n^\star|\ge c n
\tag{F1}
\]

for some fixed \(c>0\),

\[
\Delta_{Q_n^\star}(A_n^\star)\le H_0(n),
\tag{F2}
\]

and the number of exact-only targets present or previously created is \(o(n)\).

The fortress property says that the degree cap is monotone along every continuation.

Take \(X=n\). Since \(h\to\infty\),

\[
q_n>\frac{n}{h^2}
\]

for all sufficiently large \(n\). Also

\[
D_n(0)\le H_0\le H.
\]

Thus \((\mathrm{CAP})\) applies immediately.

---

## 2. How quickly can \(Q_n^\star\) shrink?

Consider any continuation of \(T\) actual moves.

A member of \(Q_n^\star\) can leave the live nonminimal population in three relevant ways.

### Direct illegality from a lower move

Every legal lower move divides at most \(H_0\) current fortress targets, because the cap is monotone. Thus at most

\[
H_0T
\]

targets leave by this mechanism.

### The target itself is selected

Distinct integers in \((n/2,n]\) are incomparable under divisibility. Hence an upper move removes at most the selected target from \(Q_n^\star\). There are at most \(T\) such losses.

### Transfer into the minimal legal set

For an upper-half target, becoming minimal while still legal means becoming exact-only: it has no other upper-half comparable and no legal proper divisor.

The accepted exact-only bank says that along a play of \(t\) actual moves, the number of targets that ever become exact-only is

\[
e_n+t,
\qquad e_n=o(n).
\]

The history reaching \(A_n^\star\) has \(o(n)\) moves, so during the next \(T\) moves the number of such transfers is at most

\[
o(n)+T.
\]

Combining these bounds,

\[
q_n-|Q_n^T|
\le
H_0T+2T+o(n).
\tag{F3}
\]

This estimate holds for every pair of continuation strategies.

---

## 3. The capped processing budget is too short

The repaired statement allows

\[
B_\delta(q_n)
=
\left\lceil
K_\delta q_n\frac{\log h}{h}
\right\rceil
\]

Shortener turns, hence at most

\[
T_n:=2B_\delta(q_n)+1
=
O_\delta\!\left(n\frac{\log h}{h}\right)
=
O_\delta\!\left(n\frac{\log H}{H^2}\right)
\tag{F4}
\]

actual moves.

Since \(H_0\le H\),

\[
\frac{H_0T_n}{n}
=
O_\delta\!\left(
\frac{H_0\log H}{H^2}
\right)
\le
O_\delta\!\left(
\frac{\log H}{H}
\right)
=o(1).
\tag{F5}
\]

Also \(T_n=o(n)\). Substituting into (F3),

\[
q_n-|Q_n^{T_n}|=o(n).
\]

Using \(q_n\ge cn\),

\[
|Q_n^{T_n}|=q_n-o(n).
\tag{F6}
\]

But \((\mathrm{CAP})\) requires

\[
|Q_n^{T_n}|
\le
\frac12q_n+\frac{n}{h^2}.
\]

The right side equals

\[
\frac12q_n+o(n),
\]

whereas (F6) is \(q_n-o(n)\). For sufficiently large \(n\),

\[
q_n-o(n)>
\frac12q_n+\frac{n}{h^2}.
\]

This is a contradiction.

Therefore

\[
\boxed{
\mathrm{RMEAH}^{\sharp}(\mathbf K^\star)
\text{ is false for every baseline-complete }\mathbf K^\star.
}
\]

The contradiction is independent of the proposed Shortener policy: no continuation can shrink the fortress top-shell population by one half in the prescribed capped-block budget.

---

# Part V. The formulation no-go theorem

The preceding disproof yields a precise trichotomy.

## Theorem

Consider a proposed baseline-frozen or epoch-frozen ancestor-harvest statement using the threshold \(H\), intended to imply (OA).

Exactly one of the following occurs.

### Case 1: Large capped states are exempt

The statement stops when \(D_X\le H\), with no separate conclusion about the surviving reservoir.

Then it does **not** imply (OA). A capped primorial fortress may have

\[
\operatorname{Anc}=0
\]

and satisfy every ancestor inequality while keeping a linear shell population for much longer than the claimed block budget.

### Case 2: Large capped states are audited uniformly over all admissible baselines

Then the assertion is false by the fortress proof above.

### Case 3: Large capped states are audited only when reached by the same existential Shortener policy

Then the statement must assert, for every reached capped block,

\[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|
+
\frac{X}{h^2}
\]

within the required shell budget.

For high-degree blocks, the ancestor inequality plus the accepted reductions is supposed to give precisely the same conclusion. Therefore, after projecting away the ledger variables, the full trajectory-restricted statement already contains

\[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|
+
\frac{X}{h^2}
\]

for every processing block. That projection is (OA).

Hence the trajectory-restricted repair is not a proper intermediate ancestor theorem; it contains the desired shell contraction as one of its policy-specific clauses.

This proves:

\[
\boxed{
\begin{minipage}{0.88\linewidth}
There is no baseline-complete, ancestor-harvest-only statement of the
stop-at-cap family that is both nondegenerate and sufficient for
\(L(n)=o(n)\).

Omitting capped-state control makes the implication invalid. Requiring
robust capped-state control makes the assertion false. Restricting
capped-state control to the chosen policy inserts the missing (OA)
branch into the statement itself.
\end{minipage}
}
\]

---

# Final conclusion

The eighth audit repair, \(|Q|/H\to\infty\), is necessary but not sufficient. The genuinely closed formulation also needs:

\[
\text{pre-registered epoch ledgers},
\]

\[
\text{a globally summable relevance clock},
\]

\[
\varepsilon(H)h^2\log h\to0,
\]

and

\[
\text{an explicit theorem for large capped reservoirs}.
\]

After including all of those, the baseline-complete assertion is refuted by a primorial-batched fortress. Over the allowed capped-block duration, direct deaths contribute \(o(n)\), exact selections contribute \(o(n)\), and transfers contribute only \(o(n)\) by the exact-only bank, so a linear top-shell reservoir cannot halve.

Thus the formulation loop resolves as follows:

\[
\boxed{
\text{The robust repaired statement is false.}
}
\]

\[
\boxed{
\text{A policy-trajectory repair is no longer an intermediate
ancestor-harvest theorem; it contains the capped branch of (OA).}
}
\]

This disproves the claimed existence of a canonical ancestor-harvest separator of the advertised family. It does not, by itself, decide whether \(L(n)=o(n)\); any successful sublinear proof must add a new policy-specific theorem preventing or rapidly clearing large capped reservoirs, rather than treating cap attainment as a harmless stopping event.

## Attachment 2 (verbatim): the adjudicating audit — quantifier analysis, reachability correction, the eleventh collapse (uncharged scheduling delay), and the surviving-target identification

# Adjudication

The decisive quantifier issue favors Part IV **for the statement actually written**, but not for a trajectory-restricted replacement. Parts I–II still have formulation defects, and Part V substantially overstates what Part IV proves. I treat the uploaded document as the operative record. 

| Item | Verdict |
|---|---|
| **B. Part IV and Document II** | **VALID**, with an important correction: the fortress is not reachable against the clearing policy, but reachability is irrelevant under Document I’s universal-baseline quantifiers |
| **A. Parts I–II** | **REPAIRABLE**, but not valid as written; epoch laundering is not fully closed, and there is an eleventh collapse through uncharged scheduling delay |
| **C. Family-wide no-go** | **REFUTED**; Part IV rules out a particular uniform off-path CAP formulation, not the whole advertised family |

---

# B. Part IV: the quantifiers do not let Document II rescue the stated theorem

## 1. The clearing policy does prevent the fortress from being reached

Write \(r_{\mathrm{av}}(n)\) for Document II’s degree-availability scale, to distinguish it from Document I’s unrelated parameter

\[
r=\lfloor(\log H)^{1/3}\rfloor.
\]

Assuming the informal phrase “\(H_0(n)\to\infty\) slowly” is made precise as

\[
H_0(n)=o(r_{\mathrm{av}}(n)),
\]

Document II gives a Shortener policy \(\Sigma_{\mathrm{clr}}\) such that, from the actual initial game position,

\[
\forall \Pi\quad
\operatorname{Play}(\Sigma_{\mathrm{clr}},\Pi)
\]

never contains a trapped upper reservoir of density at least \(c\) and cap at most \(H_0(n)\).

Thus the answer to the literal reachability question is:

\[
\boxed{\text{No, }A_n^\star\text{ is not obtainable against }\Sigma_{\mathrm{clr}}.}
\]

Document I’s use of “obtainable” must therefore not be read as “obtainable against every Shortener policy,” or even as “obtainable against the eventual witness policy \(\Sigma_{n,\delta}\).” It can only mean obtainable along some legal play.

That distinction does **not**, however, save the stated \(\mathrm{RMEAH}^{\sharp}\).

## 2. Document I does not quantify only over baselines reached by its policy

The operative portion of Document I’s prefix is

\[
\exists \Sigma_{n,\delta}\;
\forall A\in\mathcal B_n\;
\forall\Pi.
\]

This is an off-path or subgame-uniform requirement. The strategy is chosen first and must then satisfy the assertion from **every** admitted baseline \(A\), including baselines that would never arise from the initial game if that same strategy had been used earlier.

By contrast, Document II proves a statement of the form

\[
\exists\Sigma_{\mathrm{clr}}\;
\forall\Pi\;
\bigl(
\operatorname{Reach}_{\varnothing}(\Sigma_{\mathrm{clr}},\Pi)
\cap\mathcal F_{c,H_0}
=\varnothing
\bigr),
\]

where \(\mathcal F_{c,H_0}\) is the fortress class.

These statements are perfectly compatible:

- \(\Sigma_{\mathrm{clr}}\) can prevent \(A_n^\star\) from being reached from the initial position.
- The same total strategy still has prescribed moves at a hypothetical history rooted at \(A_n^\star\).
- Document I expressly tests it at that hypothetical root because \(A_n^\star\in\mathcal B_n\).

The load-bearing premise in Part IV is therefore not “\(A_n^\star\) is obtainable.” It is

\[
\boxed{A_n^\star\in\mathcal B_n.}
\]

Document I explicitly stipulates that baseline-complete data include the accepted primorial-batched trapped positions. Once that inclusion is granted, reachability against \(\Sigma\) is irrelevant.

## 3. The clearing sweep cannot be restarted after the fortress is supplied as the baseline

Document II’s sweep succeeds because, before entry into the fortress, the whole live upper set has a lower legal divisor of degree on the order of \(r_{\mathrm{av}}(n)\). It exploits those high degrees to remove a fixed density in

\[
O\!\left(\frac{n}{r_{\mathrm{av}}(n)}\right)
\]

actual moves.

At the supplied fortress baseline \(A_n^\star\), that opportunity has already disappeared. Against the entry reservoir, every subsequently legal lower move has degree at most \(H_0(n)\). Consequently, during the CAP window

\[
T_n=O_\delta\!\left(n\frac{\log H}{H^2}\right),
\]

the total direct erosion is at most

\[
H_0(n)T_n
\le
O_\delta\!\left(n\frac{\log H}{H}\right)
=o(n).
\]

Selections and exact-only transfers add only \(o(n)\). Thus even a policy that says “always play a maximum-degree lower move” cannot recover the earlier sweep once initialized at \(A_n^\star\).

The policy cannot retroactively make the moves that would have prevented the state.

## 4. Formal negation of the quantifier prefix

Fix \(\delta\), any finite \(K_\delta\), any proposed strategy family, and any \(N\). For infinitely many sufficiently large \(n\), Part IV supplies an admitted baseline \(A_n^\star\) with \(q_n\ge cn\). Its deterministic erosion estimate gives, for every continuation,

\[
|Q_n^{\mathrm{end}}|
\ge q_n-o(n)
>
\frac12q_n+\frac{n}{h^2}.
\]

Therefore, in fact, Part IV provides the stronger negation

\[
\forall\Sigma\;\forall N\;
\exists n\ge N\;
\exists A_n^\star\in\mathcal B_n\;
\forall\Pi:
\neg\mathrm{CAP}(\Sigma,A_n^\star,\Pi).
\]

That directly contradicts

\[
\exists\Sigma\;
\forall n\ge N\;
\forall A\in\mathcal B_n\;
\forall\Pi:
\mathrm{CAP}.
\]

So the decisive Part IV conclusion survives Document II.

## 5. What changes under a trajectory-restricted formulation

Suppose the theorem were instead changed to

\[
\exists\Sigma\;
\forall\Pi\;
\forall A\in
\operatorname{ReachBaselines}(\Sigma,\Pi):
P(\Sigma,A,\Pi).
\]

Then Part IV could no longer insert \(A_n^\star\) merely because it exists or is obtainable under some other play. Under the premise \(H_0=o(r_{\mathrm{av}})\), Document II’s clearing policy would exclude it.

Nor does Document I establish that its other clauses prevent the clearing sweep:

- CAP is conditional; if the bad capped state never occurs, CAP creates no obstacle.
- The high-degree inequalities do not themselves prove that the maximum-degree sweep is illegal.
- No incompatibility is shown between the sweep and the fixed scheduler.
- The fixed-density sweep does not prove OA, but it is sufficient to invalidate this particular fortress counterexample on the chosen trajectory.

There is one qualification: Document I currently starts its existential policy **after** an externally supplied baseline. To exploit Document II, the sweep must be incorporated before baseline admission, or the baseline class must be restricted to outputs reachable after the sweep. Merely saying that the continuation strategy “would have swept earlier” is not enough under the present prefix.

### B verdict

\[
\boxed{\textbf{VALID}}
\]

Part IV correctly refutes the universally baseline-complete assertion. Its rhetoric about “obtainability” should be replaced by the more precise statement that the fortress is an explicitly admitted off-path baseline.

---

# A. Parts I–II: the formulation is not yet genuinely closed

The CAP clause does close the elementary version of cap escape: if a large capped state is supplied, the theorem no longer simply stops and declares success. But the epoch construction and scheduling rules still allow genuine collapses.

## 1. Epoch-boundary laundering is not actually eliminated

For an epoch beginning at \(s=s_{X,j}\), Document I defines

\[
\xi(\omega)
=
\min\left\{
t\ge s:
\max_c I_c(A,X,\omega,\mathfrak h_t)=1
\right\},
\]

but counts ancestor mass only when

\[
s<\xi(\omega)\le t.
\]

Consider an atom in the new epoch whose relevant obstruction was created before \(s\).

There are two natural interpretations of \(I_c\).

### Persistent-state interpretation

Suppose \(I_{\mathrm{anc}}\) remains true after the old spoiler has created the obstruction. Then at the new epoch start,

\[
\xi(\omega)=s.
\]

But such an atom is excluded by the strict inequality \(s<\xi(\omega)\). It contributes neither to \(\operatorname{Anc}_{X,j}\) nor to the new epoch’s area, since

\[
\mathsf A_{X,j}(s)=0.
\]

### Event-time interpretation

Suppose \(I_{\mathrm{anc}}\) is true only when the causal event occurs. If that event occurred before \(s\), then there may be no \(t\ge s\) at which the predicate becomes true, so

\[
\xi(\omega)=\infty.
\]

Again the inherited obstruction is omitted.

In both interpretations, the earlier setup move is also outside the new clock because

\[
\ell_{X,j}(t)
=
\sum_{i=s+1}^t\rho_{X,j,i}.
\]

Thus the new atom can be born already damaged while neither the old causal move nor the inherited deficit appears in the new ledger.

The statements

\[
\Omega_{X,j}\cap\Omega_{X,k}=\varnothing
\]

and

\[
\sum_j\text{exposure}(u,j)\le J_H
\]

do not fix this. They bound how many labels may exist; they do not impose a conservation law tying a future epoch atom to the earlier move that damaged it. Pre-registering a label is not the same as globally monitoring and charging its exit.

A genuine repair needs something like:

\[
\xi^{\mathrm{glob}}(\omega)
=
\min\{t\ge t_{\mathrm{baseline}}:I_c(\omega,\mathfrak h_t)=1\},
\]

together with an inherited-debt balance carried across epochs. Alternatively, the epoch ledger must consist only of globally unexited master mass, without renormalizing each surviving target to a fresh unit.

As written, Part II §10 has not proved that epoch-boundary laundering is gone.

## 2. Eleventh collapse: uncharged service starvation

The charged clock fixes one problem: unrelated elapsed time cannot be used to enlarge the right-hand side of ME-AH.

It does not fix the dual problem: unrelated elapsed time can occur without being charged at all.

There is no axiom requiring:

- every active high-degree shell to be opened as an epoch;
- every Shortener turn while an epoch is active to count in its clock;
- an active epoch to finish within a bounded number of actual turns;
- every actual Shortener move to be assigned to some active block;
- the scheduler to be fair or work-conserving.

Consequently, an active high-degree shell can remain unchanged during a segment of \(M\) actual moves for which

\[
\rho_{X,j,i}=0.
\]

During that segment one may have

\[
\ell_{X,j}(t+M)=\ell_{X,j}(t),
\]

\[
\mathsf A_{X,j}(t+M)=\mathsf A_{X,j}(t),
\]

and

\[
\operatorname{Anc}_{X,j}(t+M)
=
\operatorname{Anc}_{X,j}(t).
\]

Every stated inequality is unaffected, while the game length has increased by \(M\). The epoch can eventually finish with a small value of \(\ell\), so B1 and B2 still hold.

This is not the old “delay to accumulate a \(CHt\) credit” collapse. It is:

\[
\boxed{\text{delay with zero credit and zero accounting cost}.}
\]

The fixedness of \(\operatorname{Sched}\) does not prevent it. A fixed scheduler can still starve a shell, and no fairness or actual-duration property is imposed on that scheduler.

This also exposes a direct gap in Part III. From B1, Document I concludes that the number of Shortener service turns in shell \(X\) is

\[
O\!\left(\frac{\log h}{h}\sum_jm_{X,j}\right).
\]

But B1 bounds \(\ell_{X,j}\), not the number of Shortener turns or elapsed actual moves. No stated axiom identifies those quantities.

A repair needs either an actual-time bound such as

\[
\tau_{X,j}-s_{X,j}
\le
C\,\ell_{X,j}(\tau_{X,j})+g_{X,j},
\qquad
\sum_{X,j}g_{X,j}=o(n),
\]

or a global assignment rule under which every post-baseline Shortener turn is charged to exactly one active block, with bounded overlap and bounded queueing delay.

## 3. CAP blocks are not globally serialized

CAP says that for **every** time \(s\) and shell \(X\) satisfying C1, Shortener must “immediately enter an exclusive capped block for shell \(X\).”

Two literal problems follow.

First, several shells can satisfy C1 at the same time. Each then demands that every one of the next \(B_\delta(q)\) Shortener moves be assigned exclusively to its block. A single move cannot be exclusively assigned to two different blocks.

Second, while a CAP block is running, the same shell will generally continue to satisfy C1 at every intermediate time. The text therefore appears to retrigger a new “immediate” exclusive block at each step.

The scheduler may have been intended to serialize these triggers, but no rule says:

- which trigger has priority;
- whether other triggers are queued;
- whether “immediately” permits waiting;
- whether a shell may retrigger while already active;
- how waiting time is charged.

This is a literal well-formedness issue, not merely a proof omission.

## 4. The channel maps need correctness axioms

The text says that prose predicates have been replaced by fixed Boolean maps \(I_c\), but it imposes no formal coverage or semantic-consistency condition on those maps.

For example, the displayed axioms do not by themselves rule out

\[
I_{\mathrm{anc}}\equiv0,
\]

or a choice under which problematic events are never assigned any channel. L5 tells us how to choose the first true channel, but does not require some channel to become true whenever a relevant ledger loss occurs.

For Part III to follow, one needs an explicit partition or domination statement connecting every actual repair/lift failure to exactly one of the stipulated channels and to the accepted bounds for that channel.

Similarly, \(\Omega_{X,j}(A)\) and \(\pi_{X,j}\) are described as pre-registered at \(A\), yet their codomain

\[
Q_X^{s_{X,j}}
\]

depends on the future continuation, on \(\Pi\), and indirectly on \(\delta\). This can be formalized using contingent history-indexed atoms, but the required signatures and branch-consistency conditions are absent.

### A verdict

\[
\boxed{\textbf{REPAIRABLE}}
\]

The cap-escape idea is conceptually repaired by CAP, but the statement is not yet well-formed and nondegenerate as claimed. In particular:

1. the master ledger does not globally charge inherited pre-epoch damage;
2. the charged clock permits uncharged actual-time starvation;
3. CAP triggers lack serialization;
4. channel completeness is unstated.

The eleventh collapse is the uncharged-service or wall-clock-starvation witness. Even after adding a charged clock, the statement can ignore arbitrarily long stretches of actual play.

These repairs would improve the formulation, but they would not save the universal CAP assertion from Part IV.

---

# C. The family-wide no-go inference does not follow

Part IV proves a narrow and useful impossibility result:

> If a baseline class contains the robust fortress baselines, no theorem can demand that every such supplied capped baseline halve in
> \[
> O\!\left(q\frac{\log H}{H^2}\right)
> \]
> Shortener turns.

It also supports the separate observation:

> An ancestor inequality that simply stops at \(D_X\le H\), with no avoidance, clearing, amortization, or other capped-state argument, does not by itself imply OA.

Those conclusions do not establish the boxed family-wide no-go.

## 1. The trichotomy omits prevention

Part V asserts that if capped states are audited only on the chosen policy’s trajectory, the theorem must include direct CAP halving and therefore already contains OA.

That is false. There is another logical possibility:

\[
\boxed{
\text{The chosen policy prevents large capped states from being reached.}
}
\]

One may prove:

1. an ancestor-harvest theorem for reached high-degree states; and
2. a separate avoidance invariant such as
   \[
   D_X(t)\le H
   \Longrightarrow
   |Q_X(t)|\le X/h^2
   \]
   along the selected policy.

The second assertion is not a post-entry halving clause. It says the dangerous branch never occurs.

Document II is an independently verified fixed-density instance of exactly this logical architecture. It does not solve the full shrinking-density OA problem, but it disproves Part V’s assertion that policy restriction necessarily inserts CAP itself.

## 2. Uniform-all-baselines and policy-trajectory are not the only choices

There are intermediate formulations, for example:

- Audit all baselines satisfying a policy-independent structural invariant \(\mathcal G(A)\), and prove separately that the selected policy preserves \(\mathcal G\).
- Use a baseline class generated by a certified preprocessing map rather than all trapped \(o(n)\)-sized positions.
- Continue with a different potential below the cap instead of demanding immediate shell halving.
- Bound the aggregate mass of all capped blocks globally rather than halving each capped block individually.
- Change the cap scale dynamically or use nested cap thresholds.
- Allow capped blocks a longer local duration while paying for them through a cross-shell amortized potential.

None of these is covered by the purported “exactly one of three cases.”

## 3. “Baseline-independent” is being conflated with “uniform over all off-path baselines”

A theorem may have constants, ledger maps, and estimates that are baseline-independent while applying only to states satisfying a structural invariant. That is materially weaker than

\[
\forall A\in\mathcal B_n
\]

for a class deliberately enlarged to include every known off-path fortress.

Part IV rules out the latter. It does not rule out the former.

## 4. The corrected no-go statement

The justified conclusion is:

\[
\boxed{
\begin{minipage}{0.88\linewidth}
No baseline-uniform theorem whose admissible class contains the
primorial fortress baselines can require per-baseline CAP halving within
the budget \(O(q\log H/H^2)\).

Also, a theorem that merely stops at the cap cannot imply OA unless it
is supplemented by some independent capped-state avoidance, clearing,
or amortization mechanism.
\end{minipage}
}
\]

The unjustified conclusion is:

\[
\text{“No baseline-independent ancestor-harvest separator of the whole family exists.”}
\]

### C verdict

\[
\boxed{\textbf{REFUTED}}
\]

Part V overgeneralizes from one off-path, universally baseline-complete CAP formulation. It does not establish a formulation no-go theorem for the whole ancestor-harvest family.

# Bottom line

\[
\boxed{
\begin{aligned}
\textbf{B:}&\ \text{Part IV valid for the written universal-baseline prefix.}\\
\textbf{A:}&\ \text{Formulation repairable, but laundering and scheduling holes remain.}\\
\textbf{C:}&\ \text{Family-wide no-go inference refuted.}
\end{aligned}
}
\]

Document II prevents the fortress from arising against its clearing policy, but Document I deliberately demands success even when that fortress is supplied as an off-policy starting baseline. That preserves the narrow Part IV contradiction. It does not justify the broader claim that every policy-aware ancestor-harvest route must either be false or contain OA verbatim.

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.
