Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Resolve the Prolonger-reply coverage question stated below: prove that no linear active greedy interval can realize the causal obligations, or construct a Prolonger strategy realizing them on-trajectory.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Attachment A defines, for fixed \(J\ge1\) and \(0<\eta<1\), the finite-shell clearing statement \(\mathrm{FSC}(J,\eta)\) (process dyadic shells \(S_j=(n/2^{j+1},n/2^j]\) in order after an \(o(n)\)-move prelude; while \(|Q_j(A)|>\eta|S_j|\), where \(Q_j\) is the live nonminimal shell population, play a currently legal lower element maximizing deletions from \(Q_j\); every turn counted; a fixed prefix-measurable tie-break) and proves: if \(\mathrm{FSC}(J,\eta)\) holds for every fixed \(J\) and \(\eta\), then \(L(n)=o(n)\) — deep shells are controlled by total size, so no growing-depth estimate is needed. Attachment B PROVES \(\mathrm{FSC}(1,\eta)\) for every fixed \(0<\eta<1\) (degree availability plus a disjointness bootstrap), and localizes the obstruction to the second shell: a previously chosen \(a\in(n/2,n]\) can satisfy \(d\mid a\) with \(a\) incomparable to a target \(x\in S_1\), killing the lower move \(d\) without killing \(x\) — external blockers absent from any rescaled smaller board.

The target. Attachment I proves the causal orientation theorem: in a second-shell active greedy interval (positions A_t, greedy maximum-deletion Shortener moves g_t, Prolonger replies p_t, final survivor set X, E = |Q_1(B)\X| targets lost), every divisor d legal at B with k_X(d)>0 is divisibility-incomparable with every g_t, so the FIRST blocker of every such d is a PROLONGER reply; and the causal deadline holds: if k_X(d) > E/s then d divides p_j for some j < s. Attachment J proves that, under the minimal-maximum-degree Shortener policy (always available: some divisibility-minimal legal integer attains maximum degree), a surviving nonminimal target can become minimal ONLY on a Prolonger turn (noncreation), and that one Prolonger reply can make k ≍ log n/log log n targets simultaneously minimal (common-core construction), so no O(1)-per-reply bound exists.

The question, with all burdens now provably on Prolonger's replies: can a Prolonger strategy, playing against the prescribed minimal-maximum-degree greedy policy from a genuine o(n)-prelude-plus-top-phase position, sustain a linear active second-shell interval — meeting every causal deadline (each high-incidence divisor d killed by an actual reply p_j with d | p_j before its deadline), keeping X legal and nonminimal throughout, and releasing enough re-rooting mass (new minima are Prolonger-created only) to prevent the greedy degree ledger from terminating the phase? Prove impossibility for every Prolonger strategy (this proves FSC(2,eta); state whether the method iterates to deeper shells where earlier-shell replies serve as upward blockers), or construct such a strategy explicitly (this closes the weakest sufficient route; state exactly what it implies for other Shortener policies and for L(n)). Formulation caution: twenty degenerate-collapse families are catalogued in the record (the twentieth: post-blocker player laundering — obligations must be charged to the EARLIEST causal blocker, which is a Prolonger reply); if the question as posed hides another, proving THAT with the exact repair is a valuable resolution. Note (Attachment I section 7): a purely arithmetic schedule meeting all static requirements EXISTS at linear scale — any impossibility proof must use the greedy dynamics (the degree ledger, the noncreation asymmetry, or the reply-timing coupling), not statics alone.

## Known progress (complete proofs exist for all items; take as given)

Notation: for a position \(A\), \(U_n=(n/2,n]\), \(L_n=[2,n/2]\); \(R(A)\subseteq U_n\) and \(D(A)\subseteq L_n\) are the integers still legal relative to \(A\); \(\deg_A(d)=\#\{u\in R(A):d\mid u\}\), \(\Delta(A)=\max_d\deg_A(d)\).

- Bounds: \(c_\delta\,n(\log\log n)^2/\log n\le L(n)\le(0.1897123371+o(1))n\), both by explicit strategies.
- Static completion: any primitive \(P\) with \(|P|=o(n)\) has \(o(n)\) minimal legal elements \(\mathcal M(P)\), and \(P\cup\mathcal M(P)\) is a maximal primitive set.
- Smooth/rough trapping: with \(y=\tfrac14\log n\), Shortener can in \(o(n)\) actual moves reach a position where every live \(m\) has its \(y\)-smooth part dividing one played carrier and its \(y\)-rough part dividing another (this is the trapping prelude).
- Degree availability: at any position with \(|A|=o(n)\) and \(|R(A)|\ge\eta n\), some legal lower move kills at least \((2\eta-o(1))r(n)\) live targets with \(r(n)\to\infty\) (\(\log\log\) scale).
- Exact-only bank: along any play with \(t\) actual moves, the number of targets that ever become exact-only is \(o(n)+t\).
- Trace normal form: a residual spoiler killing lift \(fp\) of a still-legal face \(f\) has the form \(a=pd\), \(d\mid f\) (the trace); one actual move cannot destroy two distinct prime lifts of the same legal face; traces incident to one face have lcm dividing it.
- All-orders witness inequality: if \(\mathcal F\) is a family of distinct advance-depleted face cores in one shell, each with at least \(q\) blocked lift tags, and the earlier harmful moves are \(a_i=e_ip_i\), then for every \(s\le q\): \(|\mathcal F|\binom qs\le\sum N_{\mathcal F}(\operatorname{lcm}_{i\in I}e_i)\) over \(s\)-subsets \(I\) with distinct tags; tuples with lcm above \(Z\) contribute at most \((2X/Z)\binom ts\).
- Atomic ledger: pre-registering all core-signature faces as latent objects gives a lifetime bound — faces whose blocker record ever contains \(c\) number at most \(2^r\tau(c)\) — for the channel oriented by \(\kappa(F)\mid c\). Direct ancestors (\(c\mid a_F\)) escape every \(M\cdot\tau(c)\) bound: one move can erase whole lift families of \(H^{\Omega(1)}\) unmergeable faces with \(\tau(c)\) constant. This direct-ancestor escape is exactly the phenomenon item 2 of (GNR) must overcome or a disproof must exploit.
- Frozen repair theorems without chronology: coded and product-escalating repairs solve frozen blocker configurations, but one later minimum-product edge can join low-lcm witness tuples of many already-repaired structures simultaneously — a jump of \(N(e)\binom{q-1}{s-1}\) from one reply. The missing Lipschitz property of the optimal repair potential under chronological edge insertion is what frozen results do not supply.
- Promoting instantaneous incidence bounds to lifetime capacities fails: across an adaptive refinement history the same opposing move \(c\) is inherited by up to \(2^r\) sequentially revealed core-signature pairs per core; realized legally at \(n=4000\), \(c=30\): lifetime multiplicity 128 versus instantaneous cap 48.
- Prime-product guard: for any NONEMPTY set \(S\) of currently legal primes with \(\prod_{p\in S}p\le n\), the product is itself a legal move; grouped guard products let Shortener block whole packets of lift primes in \(n^{o(1)}\) turns.
- Policy sensitivity: against the LITERAL maximum-degree policy, an anchor plus lift primes \(p\in(H,2H]\) exhausts \((1-o(1))\) of a shell's faces at trace 1 within \(O(H/\log H)\) moves; but one legal batch blocker \(\prod_{H<p\le2H}p\le n^{1/12}\) kills every lift prime at once. Any policy in (GNR) must specify its handling of such batch moves.
- Fixed-cap fortress entry is impossible (verified twice): no linear upper reservoir can be robustly entered at any cap \(H(n)=o(r(n))\) — a fixed-density clearing sweep is incompatible with bounded per-move erosion of a capped reservoir. Hence off-policy fortresses cannot refute trajectory-restricted statements like (GNR); a disproof must force its bad interval against the specific policy.
- Per-shell serial-ticket dichotomy (verified twice; scope-limited): any trajectory-restricted PER-SHELL serial-ticket scheme with ticket-local certificates and bounded per-chain budgets is either starvation-degenerate or precisely a scheduled online-area decomposition; a mandatory GLOBAL batch ticket over the aggregate excess escapes this dichotomy — which is why the aggregate formulation \((\mathrm{AE}^\dagger)\) is the canonical target.
- Fifteen known collapse families for intermediate statements (terminal delay, prelude delay, pre-freeze cap forcing, shell deferral, zero weights, first-exit reassignment, cost-only equivalence, micro-baseline compression, cap escape, epoch-boundary laundering, uncharged scheduling delay, post-hoc cohort selection, registration starvation, additive-floor chattering, parameter-level vacuity): check any repaired statement you propose against all of them; prescribe activation data in advance, freeze ledgers at a common baseline, restrict obligations to realized trajectories, and state every parameter range explicitly.
## Audit-established second-shell machinery (adversarially verified; take as given with the stated scopes)

- Legal-divisor upset: the legal divisors of a fixed legal element form an upper ideal in its divisor poset.
- Deletion-set root equality (NARROW scope): a maximum-degree lower candidate \(d\le n/4\) and its divisibility-minimal legal divisor \(r\) satisfy \(N_Q(r)=N_Q(d)\) for the current second-shell target set — but \(r\) is NOT substitutable for \(d\) as a game move (at \(n=48\), \(A=\{5,7,11,16\}\): \(d=6\) and \(r=3\) both delete \(\{18,24\}\) from the shell, yet \(r\) additionally kills \(9\)). Use only as a counting device.
- Linear tail forces fresh minimal roots: a \(T\)-turn second-shell greedy phase yields \(T\) distinct charged roots of which \(T-o(n)\) first become minimal legal after the sparse entry position; for \(T\ge cn\), at least \((c/2)n-o(n)\) of them lie in the fixed interval \(((c/2)n, n/4]\).
- Constant-cap suffix: every \(T\ge cn\)-turn tail contains a suffix of length \(\ge(c/2)n-O(1)\) on which the greedy degree is bounded by a fixed constant \(D(c)\).
- Deadline inequality: for the surviving target set after a \(cn\)-turn interval, any divisor legal throughout the interval has degree at most \(1/(4c)+o(1)\) against that set (legality-throughout is an explicit hypothesis).
- Equivalence with four conditions: the "no linear capped tail" exclusion is equivalent to second-shell \(o(n)\)-clearing only when the statement carries: \(0<\eta_0<\eta/2\); a uniform activation bound (sup over Prolonger strategies of the activation time \(=o(n)\)); adversarial quantification of the tail witness (no \(c>0\), \(n_k\to\infty\), strategies \(\sigma_k\), caps \(H_k\to\infty\), sparse active times followed by \(\ge cn_k\) capped active turns); and top/second-shell threshold alignment.
- The isolated open mechanism (all routes converge here): whether one blocker move, divisible by many currently-legal roots at once, can satisfy many final-survivor deadlines simultaneously — equivalently, a chronological trichotomy (within an o(n)-move window a fixed positive fraction of targets is directly deleted, or played, or irreversibly banked) of aggregate-excess-halving strength. Ruled out as substitutes: widening prime coatoms to all divisors \(\le K\) (one move \(a=dk\) invalidates many high-degree roots without comparability), and every integrable-rate degree estimate.

- Persistent-incidence and persistent roots (proved): any divisor legal throughout a T>=cn tail has final-survivor incidence k_X(d) <= 1/(4c)+o(1); the final minimal roots covering X give a linear family of >=(eta*c/(1-eta)-o(1))n distinct roots legal throughout (Attachment I section 4). This forces only |M(B)| >~ n/H at the sparse entry — consistent with static completion; a contradiction would need o(n/H).
- Conditional cone theorem (proved): with the d^{-s} hazard policy, if the shallow quotient cone C_T(H)={mq : m ever-minimal in the prefix, q<=H} stays o(n) for some T=o(n), H->infty, TH^s/n->infty, then L(n)=o(n). The counter-profile blocking a proof of the hypothesis: Theta(n/G) roots at scale n/G with Theta(G) quotients each (mass migrates to deeper shells).
- Cumulative sparsity (proved): the union of ALL minimal-legal sets over an entire o(n)-move prefix is o(n); and only o(n) integers of any fixed interval (alpha n, beta n] ever become minimal during such a prefix.

## Attachment A (verbatim): the finite-shell clearing family, its sufficiency proof, and where the general case gets stuck

# Verdict

\[
\boxed{\text{I do not have a valid unconditional proof or disproof of }L(n)=o(n).}
\]

After treating every listed result as an axiom and auditing the remaining routes, a complete resolution would still require a genuinely new chronology-sensitive theorem. The supplied record itself leaves aggregate-excess halving, the cumulative minimal-layer problem, and direct-ancestor lifetime control unresolved; on the lower side, every established construction remains compatible with \(o(n)\). 

Presenting either conclusion as proved would therefore conceal an unproved step. What can be given rigorously is a sharper, nonvacuous reduction that seems weaker than the existing online-area statement and pinpoints where the obstruction first appears.

## 1. Why the existing upper-bound ingredients do not close the problem

Let

\[
\mu_n(\alpha)=
 \max\left\{
 \frac{|\mathcal M(P)|}{n}:
 P\text{ primitive},\ |P|\le \alpha n
 \right\}.
\]

The static-completion theorem says that

\[
\alpha_n\longrightarrow 0
\quad\Longrightarrow\quad
\mu_n(\alpha_n)\longrightarrow 0.
\]

The maximal-cone lemma says that, when the current legal set has linear size, some minimal legal move deletes on the order of \(1/\mu_n(\alpha)\) nonminimal legal integers at a position of size \(\alpha n\).

That is not enough. A modulus such as

\[
\mu(\alpha)=\frac1{\log(1/\alpha)}
\]

still tends to zero, but the amount directly cleared in the first \(\alpha n\) turns can be only on the scale

\[
n\int_0^\alpha \log(1/s)\,ds
  =n\bigl(\alpha\log(1/\alpha)+\alpha\bigr)
  =o(n)
\]

whenever \(\alpha=o(1)\). The interval-blocker construction shows that a modulus of essentially this slow size really does occur for off-policy sparse positions. Thus static completion cannot be iterated without using reachability information.

The peel-plus-continuation argument has the same rate defect. After peeling through \(n/H\), suppose \(C\) is a maximal completion. The continuation lemma gives

\[
\text{remaining moves}\le (2H+1)|C|.
\]

Static completion gives only \(|C|=o(n)\), whereas one needs

\[
|C|=o(n/H).
\]

For example,

\[
|C|=\frac{n}{\log H}
\]

is \(o(n)\) for every \(H\to\infty\), but

\[
\frac{H|C|}{n}=\frac{H}{\log H}\longrightarrow\infty.
\]

Choosing \(H\) “sufficiently slowly” does not repair that mismatch.

Finally, first-failure localization only proves that a failed aggregate-halving interval occurs during an \(o(n)\)-move prefix. It does not bound the amount of surviving excess attributable to moves made before the interval or to a single interval move after future refinements. Once ownership is required to be fresh, interval-local, immutable and causal, the proposed ledger statement becomes precisely aggregate-excess halving itself. So localization is useful, but it is not the missing contraction theorem.

## 2. A weaker finite-shell statement that would suffice

For \(j\ge0\), put

\[
S_j=\left(\frac{n}{2^{j+1}},\frac{n}{2^j}\right]
\]

and, for a position \(A\), define

\[
Q_j(A)
 =
S_j\cap
\bigl(\mathcal L(A)\setminus\mathcal M(A)\bigr).
\]

Thus \(Q_j(A)\) consists of the live, nonminimal elements of the \(j\)-th dyadic shell.

Fix constants \(J\ge1\) and \(\eta>0\). Consider the following completely prescribed policy after the accepted trapping prelude:

1. Process \(S_0,S_1,\ldots,S_{J-1}\) in that order.
2. While
   \[
   |Q_j(A)|>\eta |S_j|,
   \]
   Shortener plays a currently legal lower element maximizing the number of members of \(Q_j(A)\) that it deletes.
3. Every Shortener turn is counted. There are no uncharged guards, optional epochs or post-hoc activations.

Call the following assertion \(\mathrm{FSC}(J,\eta)\):

> Against every Prolonger strategy, the prescribed \(J\) shell phases finish in \(o(n)\) Shortener turns.

This statement is trajectory-restricted and policy-specific. It cannot be satisfied by merely naming a terminal position or suppressing activation.

### Proposition

If \(\mathrm{FSC}(J,\eta)\) holds for every fixed \(J\) and every fixed \(\eta>0\), then

\[
L(n)=o(n).
\]

### Proof

Let \(A\) be the position after the trapping prelude and all \(J\) shell phases. The number of actual moves used so far is \(o(n)\), since Prolonger has at most one reply to each Shortener move. Therefore

\[
|A|=o(n).
\]

By static completion,

\[
|\mathcal M(A)|=o(n).
\]

At the end of the prescribed phases,

\[
|Q_j(A)|\le \eta |S_j|
\qquad (0\le j<J).
\]

Hence the nonminimal legal elements in the processed shells number at most

\[
\sum_{j=0}^{J-1}|Q_j(A)|
 \le
\eta\sum_{j=0}^{J-1}|S_j|
 <\eta n.
\]

Every legal element below those shells lies in

\[
[2,n/2^J],
\]

which contains at most \(n/2^J\) integers. Consequently,

\[
\begin{aligned}
|\mathcal L(A)|
&=
|\mathcal M(A)|
+
|\mathcal L(A)\setminus\mathcal M(A)|\\
&\le
o(n)+\eta n+\frac{n}{2^J}.
\end{aligned}
\]

Legal sets are monotone decreasing: after \(A\), every further move consumes one currently legal integer and no illegal integer can become legal. Thus every continuation, regardless of either player’s later strategy, has length at most \(|\mathcal L(A)|\). Including the \(o(n)\)-move prelude and shell processing,

\[
L(n)
\le
\left(\eta+2^{-J}\right)n+o(n).
\]

Given \(\varepsilon>0\), choose fixed \(\eta<\varepsilon/3\) and fixed \(J\) with \(2^{-J}<\varepsilon/3\). Then

\[
\limsup_{n\to\infty}\frac{L(n)}n
\le \frac{2\varepsilon}{3}.
\]

Since \(\varepsilon\) is arbitrary,

\[
L(n)=o(n).
\qquad\square
\]

## 3. Where this reduction gets stuck

The accepted fixed-density clearing result handles \(J=1\), the original upper half \(S_0=(n/2,n]\).

The first genuinely new case is \(J=2\), namely the shell

\[
S_1=(n/4,n/2].
\]

It is tempting to replace \(n\) by \(n/2\) and invoke upper-half degree availability again. That rescaling is invalid. Moves already selected in \((n/2,n]\) do not belong to the smaller board \(\{2,\ldots,n/2\}\), yet they can make many divisors \(d\le n/4\) illegal:

\[
d\mid a,\qquad a\in(n/2,n],
\]

while leaving many \(x\in(n/4,n/2]\) incomparable with \(a\), and hence still legal. Thus the scaled position has external blockers that are invisible to the smaller-board theorem.

The face-carrier and primorial-batching examples show that this is not a bookkeeping nuisance. A sparse family of upper carriers can simultaneously:

\[
|Q_1(A)|\asymp n,
\qquad
|A|=o(n),
\qquad
\Delta_{Q_1}(A)\ \text{small},
\]

without killing the shell targets themselves. Endpoint inequalities, static covers and individual-move capacities therefore cannot prove \(\mathrm{FSC}(2,\eta)\).

To establish even this second-shell statement, one must show that such external blocking cannot persist **along the prescribed clearing trajectory** without one of the following occurring:

\[
\text{large accumulated direct deletion},
\quad
\text{many helpful Prolonger moves},
\quad\text{or}\quad
\text{transfer of targets into }\mathcal M(A).
\]

That is exactly the chronology-sensitive content still missing from online area and aggregate-excess halving. First-failure localization usefully says the bad interval may be assumed sparse, but the direct-ancestor/refinement phenomenon prevents converting sparsity into a bounded interval-local charge.

## 4. Why the current lower-bound machinery does not disprove the statement

A growing-cap fortress gives only

\[
L(n)\ge \frac{cn}{H(n)}.
\]

For every \(H(n)\to\infty\),

\[
\frac{n}{H(n)}=o(n),
\]

so even \(n^{1-o(1)}\) is compatible with the conjectured conclusion. A linear lower bound would need a bounded cap, an amplification that converts \(n/H\) into \(cn\), or a different non-reservoir mechanism.

But bounded-cap positive-density entry is ruled out against the fixed-density clearing policy. Meanwhile the rank-\(k\) fan hierarchy gives

\[
L(n)\ge
c_k\frac{n(\log\log n)^{k-1}}{\log n},
\qquad
c_k=2^{-k-2^{k-1}+1},
\]

and the doubly exponential decay of \(c_k\) prevents taking \(k=k(n)\to\infty\) to obtain a linear bound. Thus no supplied lower strategy reaches \(\Omega(n)\).

# Conclusion

The mathematically defensible conclusion is

\[
\boxed{
\begin{array}{c}
\text{Neither }L(n)=o(n)\text{ nor its negation is proved by the supplied record.}\\[1mm]
\text{The weakest clean additional target identified here is fixed-depth}\\
\text{trajectory-restricted clearing of finitely many top dyadic shells.}\\[1mm]
\text{Even the second shell still requires new chronological control.}
\end{array}}
\]

A claimed unconditional resolution at this point would necessarily be using, without proof, either a trajectory-restricted shell-clearing theorem or an interval-local direct-ancestor bound strong enough to imply aggregate contraction.

## Attachment B (verbatim): the proof of FSC(1, eta) and the exact reason it stops at the second shell

# Verdict

The statement as written has a **degenerate parameter range**: whenever \(\eta\ge 1\), every phase is empty because \(Q_j(A)\subseteq S_j\). More substantively, the accepted degree-availability theorem proves the entire nondegenerate top-shell case:

\[
\boxed{\mathrm{FSC}(1,\eta)\text{ holds for every fixed }\eta>0.}
\]

In particular, this gives a full proof for the explicit nondegenerate pair

\[
\boxed{(J,\eta)=\left(1,\frac14\right).}
\]

The definitions and accepted degree-availability result used below are those in the uploaded record. 

This does **not** establish \(\mathrm{FSC}(J,\eta)\) for \(J\ge2\), so it does not prove \(L(n)=o(n)\).

## 1. The threshold-range collapse

For every position \(A\) and every shell \(S_j\),

\[
Q_j(A)\subseteq S_j,
\]

and hence

\[
|Q_j(A)|\le |S_j|.
\]

Therefore, if \(\eta\ge1\),

\[
|Q_j(A)|>\eta |S_j|
\]

is impossible. Every one of the \(J\) phases takes exactly zero Shortener turns. Thus

\[
\boxed{\mathrm{FSC}(J,\eta)\text{ holds vacuously for all fixed }J
       \text{ whenever }\eta\ge1.}
\]

The strict inequality in the activation condition means that \(\eta=1\) is already vacuous.

This is a genuine formulation collapse. The meaningful range is

\[
0<\eta<1.
\]

## 2. Nondegenerate theorem for the top shell

### Theorem

For every fixed \(0<\eta<1\),

\[
\mathrm{FSC}(1,\eta)
\]

holds uniformly against every Prolonger strategy. In fact, the trapping property itself is unnecessary here; only the fact that the prelude uses \(o(n)\) actual moves is needed.

### Proof

Write

\[
S_0=(n/2,n],
\qquad
Q_0(A)=S_0\cap\bigl(\mathcal L(A)\setminus\mathcal M(A)\bigr).
\]

Let \(A^{\mathrm{pre}}\) be the position at the end of the accepted trapping prelude. Uniformly against Prolonger,

\[
|A^{\mathrm{pre}}|=o(n).
\]

Fix \(0<\eta<1\). While the \(S_0\)-phase is active, we have

\[
|Q_0(A)|>\eta |S_0|.
\]

Since

\[
|S_0|=\left\lceil\frac n2\right\rceil,
\]

this implies, for all sufficiently large \(n\),

\[
|Q_0(A)|>\frac{\eta n}{2}.
\tag{1}
\]

Let

\[
R(A)=\mathcal L(A)\cap(n/2,n].
\]

Certainly \(Q_0(A)\subseteq R(A)\), so (1) gives

\[
|R(A)|\ge \frac{\eta n}{2}.
\tag{2}
\]

Apply the accepted degree-availability result with, say,

\[
\theta=\frac{\eta}{3}.
\]

It supplies a function \(r(n)\to\infty\) such that, at every position satisfying

\[
|A|=o(n),
\qquad
|R(A)|\ge\theta n,
\]

there is a currently legal lower move \(d\le n/2\) satisfying

\[
\deg_A(d)
=
\#\{u\in R(A):d\mid u\}
\ge
\bigl(2\theta-o(1)\bigr)r(n).
\]

Consequently, for all sufficiently large \(n\),

\[
\deg_A(d)\ge \frac{\eta}{2}r(n).
\tag{3}
\]

Every upper-half integer counted in \(\deg_A(d)\) lies in \(Q_0(A)\). Indeed, if \(u\in R(A)\), \(d\) is legal, and \(d\mid u\), then \(d<u\), so \(u\) has a legal proper divisor and is therefore nonminimal. Hence the move \(d\) deletes at least

\[
\frac{\eta}{2}r(n)
\]

members of the current \(Q_0(A)\).

The prescribed policy maximizes the number of deleted members of \(Q_0(A)\). It therefore deletes at least as many:

\[
\text{each active Shortener move deletes at least }
\frac{\eta}{2}r(n)
\text{ current }Q_0\text{-members}.
\tag{4}
\]

The only remaining point is to justify applying degree availability throughout the required interval without presupposing that the phase is sublinear.

Define

\[
K_n
=
\left\lfloor
\frac{2|S_0|}{\eta r(n)}
\right\rfloor+2.
\]

Because \(r(n)\to\infty\),

\[
K_n=O\!\left(\frac n{r(n)}\right)=o(n).
\tag{5}
\]

Suppose, for contradiction, that the phase lasts for at least \(K_n\) Shortener turns. Before any of those first \(K_n\) turns, the total number of selected integers is at most

\[
|A^{\mathrm{pre}}|+2K_n+1=o(n),
\]

because there is at most one intervening Prolonger move for each Shortener move. Thus all positions encountered during these first \(K_n\) turns satisfy the sparsity hypothesis \(|A|=o(n)\). Since the phase is still active, they also satisfy (1) and (2). Therefore (4) applies at every one of these turns.

Legal sets are monotone decreasing. In particular, a member deleted from \(Q_0\) can never later re-enter \(Q_0\). Hence the sets of targets counted as deleted on distinct Shortener turns are disjoint. The first \(K_n\) Shortener moves would therefore delete at least

\[
K_n\frac{\eta}{2}r(n)
>
|S_0|
\]

distinct members of \(S_0\), by the definition of \(K_n\). That is impossible because \(Q_0(A)\subseteq S_0\) at every time.

Consequently the phase takes fewer than \(K_n\) Shortener turns. By (5),

\[
T_{S_0}(n)=o(n),
\]

uniformly over every Prolonger strategy. This proves

\[
\boxed{\mathrm{FSC}(1,\eta)}
\]

for every fixed \(0<\eta<1\). Together with the vacuous \(\eta\ge1\) case, it holds for every fixed \(\eta>0\). \(\square\)

## 3. Explicit requested pair

Taking \(\eta=\tfrac14\), the proof gives the concrete uniform estimate

\[
T_{S_0}(n)
\le
\frac{8|S_0|}{r(n)}+O(1)
=
o(n).
\]

Thus

\[
\boxed{\mathrm{FSC}\!\left(1,\frac14\right)\text{ is true}.}
\]

Prolonger’s replies are fully arbitrary in this proof. They may directly delete shell targets, transfer them into the minimal legal set, block prospective lower moves, or play elsewhere. Any such action either helps terminate the phase or leaves the degree-availability argument applicable.

## 4. Why this proof stops exactly at \(J=1\)

The crucial implication was

\[
d\text{ legal},\quad u\in(n/2,n]\text{ legal},\quad d\mid u
\quad\Longrightarrow\quad
u\in Q_0(A),
\]

combined with a degree theorem explicitly controlling the live upper half \(R(A)\).

For \(S_1=(n/4,n/2]\), the available upper-half theorem cannot simply be applied with \(n\) replaced by \(n/2\). A previously chosen \(a\in(n/2,n]\) may satisfy

\[
d\mid a,\qquad d\mid x,\qquad a\nmid x,\qquad x\nmid a,
\]

where \(x\in S_1\). Then \(a\) makes \(d\) illegal without making \(x\) illegal. Such external blockers are absent from the rescaled smaller-board position and can destroy the needed uniform degree guarantee.

The top-shell argument works because the accepted theorem supplies a rate \(r(n)\to\infty\) that remains valid over the whole \(O(n/r(n))\)-turn bootstrap interval. Static completion alone does not supply the analogous rate for \(S_1\): the refuted worst-case modulus permits

\[
|\mathcal M(A)|
\asymp
\frac{n}{\log(1/\alpha)}
\quad\text{when}\quad
|A|\asymp\alpha n,
\]

and then the accumulated minimal-cone deletion rate over a linearizing prefix can remain only \(O(n)\), not force an \(o(n)\) stopping time.

## 5. Exact repair of the challenge formulation

To exclude the two already-settled loopholes, the substantive challenge should read:

> Either prove \(\mathrm{FSC}(J,\eta)\) for every fixed \(J\ge2\) and every fixed \(0<\eta<1\), or disprove it for one explicit pair \(J\ge2\), \(0<\eta<1\), by forcing \(\Omega(n)\) Shortener turns.

For complete formal precision, it should also fix the trapping-prelude strategy and its stopping rule and either fix a prefix-measurable tie-break among maximum-deletion moves or quantify uniformly over every such tie-break.

The result proved here is therefore precise but limited:

\[
\boxed{
\begin{aligned}
&\mathrm{FSC}(J,\eta)\text{ is vacuous for }\eta\ge1,\\
&\mathrm{FSC}(1,\eta)\text{ holds for every }0<\eta<1,\\
&\text{the first genuinely unresolved case remains }J=2,\ 0<\eta<1.
\end{aligned}}
\]

It neither proves \(L(n)=o(n)\) nor provides a Prolonger construction forcing a linear game or a linear second-shell phase.


## Attachment C (verbatim): the cap-entry normal form, the doubling lemma, and the precise statement of the capped-tail exclusion

# Verdict

\[
\boxed{\text{I do not obtain a valid proof or disproof of }\mathrm{FSC}(2,\eta).}
\]

A claimed proof would have to insert a new chronology-sensitive no-entry theorem for externally blocked divisors. A claimed disproof would have to construct a **reachable linear capped tail**, not merely an off-policy low-degree position or a latent-face failure. Neither follows from the stipulated results. I use the definitions and accepted facts exactly as stated in the attachment. 

There is, however, a sharp unconditional normal form for any counterexample. It substantially narrows what remains and shows precisely why the direct-ancestor obstruction is unavoidable already in the second shell.

---

## 1. Setup

Let \(A_t\) be the position immediately before Shortener’s \(t\)-th move in the second-shell phase, and write

\[
Q_t=Q_1(A_t),\qquad q_t=|Q_t|.
\]

For a currently legal lower element \(d\), put

\[
N_t(d)=\{x\in Q_t:d\mid x\},
\]

and define the current second-shell degree

\[
\Delta_t=\max_{d\text{ legal}}|N_t(d)|.
\]

Every proper divisor of an element of

\[
S_1=(n/4,n/2]
\]

is at most \(n/4\), so it is harmless to restrict the maximum to \(d\le n/4\).

The prescribed policy selects some \(d_t\) with

\[
|N_t(d_t)|=\Delta_t,
\]

using the fixed prefix-measurable tie-break.

Let \(T=T(n)\) denote the total number of Shortener turns in this phase.

---

# 2. Monotone-degree lemma

## Lemma 1

Throughout the second-shell phase,

\[
q_{t+1}\le q_t-\Delta_t
\tag{1}
\]

and

\[
\Delta_{t+1}\le \Delta_t.
\tag{2}
\]

Consequently,

\[
\sum_{t<T}\Delta_t\le q_0\le |S_1|.
\tag{3}
\]

### Proof

Shortener plays \(d_t\). Every member of \(N_t(d_t)\) is a multiple of the newly selected \(d_t\), so all those targets immediately become illegal. Prolonger’s following move can only remove further legal elements or cause further transfers into the minimal legal set. Legality never regenerates. Therefore

\[
Q_{t+1}\subseteq Q_t\setminus N_t(d_t),
\]

which proves (1).

Now let \(d\) be legal at time \(t+1\). It was also legal at time \(t\), and

\[
Q_{t+1}\subseteq Q_t.
\]

Hence

\[
N_{t+1}(d)\subseteq N_t(d),
\]

so

\[
|N_{t+1}(d)|\le |N_t(d)|\le\Delta_t.
\]

Taking the maximum over the smaller set of moves that remain legal at time \(t+1\) gives (2).

Finally, the sets \(N_t(d_t)\) are disjoint as sets of targets at their deletion times: once a target leaves the legal set, it never re-enters it. Summing (1) yields (3). \(\square\)

This monotonicity is stronger than is needed for the top-shell bootstrap: once the greedy degree falls below a cap, it stays below that cap for the remainder of the phase.

---

# 3. Sparse cap-entry theorem

## Theorem 2

Let \(H=H(n)\ge1\). If the second-shell phase lasts more than

\[
m_H=
\left\lfloor\frac{|S_1|}{H+1}\right\rfloor+1
\tag{4}
\]

Shortener turns, then before turn \(m_H\) it reaches an active position satisfying

\[
\Delta_t\le H.
\tag{5}
\]

In particular, suppose that for some fixed \(c>0\), along an infinite sequence of \(n\),

\[
T(n)\ge cn.
\tag{6}
\]

Then for **every** choice \(H(n)\to\infty\), the realized trajectory reaches, after \(o(n)\) phase turns, a position \(B_n\) for which

\[
|B_n|=o(n),
\tag{7}
\]

\[
|Q_1(B_n)|>\eta|S_1|,
\tag{8}
\]

\[
\Delta_{Q_1}(B_n)\le H(n),
\tag{9}
\]

and the remaining second-shell phase has length

\[
cn-o(n)=\Omega(n),
\tag{10}
\]

throughout which the degree stays at most \(H(n)\).

### Proof

If \(\Delta_t>H\) for each \(0\le t<m_H\), integrality gives

\[
\Delta_t\ge H+1.
\]

Then Lemma 1 gives

\[
|S_1|
\ge
\sum_{t<m_H}\Delta_t
\ge
m_H(H+1)
>
|S_1|,
\]

a contradiction. This proves (5).

Now assume (6) and choose any \(H(n)\to\infty\). Since

\[
|S_1|=\frac n4+O(1),
\]

we have

\[
m_H=O\!\left(\frac nH\right)=o(n).
\]

For sufficiently large \(n\), \(m_H<T(n)\), so the position supplied above is still inside the active phase and therefore satisfies (8).

The phase starts from a position of size \(o(n)\). Before the first \(m_H\) Shortener turns there are at most \(2m_H+O(1)=o(n)\) additional actual moves. Hence (7) holds.

Finally, Lemma 1 says that \(\Delta_t\) is nonincreasing. Once it has fallen below \(H(n)\), it remains below \(H(n)\) for the entire remaining phase. Since the cap was reached after \(o(n)\) turns and the full phase has at least \(cn\) turns, (10) follows. \(\square\)

Thus a disproof of \(\mathrm{FSC}(2,\eta)\) is not merely a capped-reservoir construction. It must force the following very specific object:

\[
\boxed{
\begin{array}{c}
\text{a positive-density active second-shell reservoir, reached on the}\\
\text{prescribed trajectory while the position is still sparse, followed by}\\
\text{a linear-length tail whose maximum deletion degree is }H(n)=o(n)\\
\text{for every arbitrarily slowly growing chosen cap }H(n).
\end{array}}
\tag{11}
\]

Conversely, such a realized linear capped tail is plainly a disproof. Hence (11) is an exact counterexample normal form.

---

# 4. What static completion says at the cap

At the cap-entry position \(B=B_n\), every \(x\in Q_1(B)\) has a proper legal divisor. By finite descent, it has a divisibility-minimal legal divisor

\[
\rho(x)\in\mathcal M(B),\qquad \rho(x)\mid x,\qquad \rho(x)<x.
\]

Since \(x\le n/2\),

\[
\rho(x)\le n/4.
\]

A fixed root \(\rho\) divides at most \(H\) members of \(Q_1(B)\), by (9). Therefore

\[
|Q_1(B)|
\le
H\,|\mathcal M(B)|.
\]

Using (8),

\[
|\mathcal M(B)|
>
\frac{\eta|S_1|}{H}
=
\left(\frac{\eta}{4}+o(1)\right)\frac nH.
\tag{12}
\]

But this does not contradict static completion. Since \(H(n)\to\infty\),

\[
\frac nH=o(n),
\]

and static completion permits an \(o(n)\)-sized minimal layer. The interval-blocker modulus shows why no rate of the form

\[
|\mathcal M(B)|=o(n/H)
\]

can be extracted from the qualitative theorem.

This is the exact quantitative obstruction: the cap-entry theorem produces only the lower bound \(n/H\), while static completion supplies only an unspecified \(o(n)\).

---

# 5. The previous shell forces linear direct-ancestor mass

The completed top-shell phase supplies additional structure that is absent from a generic sparse position.

Because \(\mathrm{FSC}(1,\eta_0)\) holds for every fixed \(\eta_0>0\), in the phase-alone formulation one may, for example, process the top shell down to

\[
|Q_0|\le \eta_0|S_0|
\qquad\text{with}\qquad
\eta_0=\frac{\eta}{4}.
\tag{13}
\]

This costs only \(o(n)\) turns.

## Lemma 3: doubling/direct-ancestor lemma

At any subsequent position \(A\),

\[
\#\{x\in Q_1(A):2x\text{ is legal}\}\le |Q_0(A)|.
\tag{14}
\]

Consequently, while

\[
|Q_1(A)|>\eta|S_1|
\]

and (13) holds, at least

\[
\left(\frac{\eta}{8}+o(1)\right)n
\tag{15}
\]

members \(x\in Q_1(A)\) have an illegal double \(2x\). For every such \(x\), some previously selected integer has the form

\[
a_x=2d_x,\qquad d_x\mid x,\qquad \frac{x}{d_x}\ \text{odd}.
\tag{16}
\]

The possibility \(d_x=1\), corresponding to \(a_x=2\), is allowed.

### Proof

If \(x\in Q_1(A)\) and \(2x\) is legal, then \(x\) is a legal proper divisor of \(2x\). Hence \(2x\) is nonminimal. Since

\[
x\in(n/4,n/2]
\quad\Longrightarrow\quad
2x\in(n/2,n],
\]

we have

\[
2x\in Q_0(A).
\]

The map \(x\mapsto2x\) is injective, proving (14).

Now

\[
|Q_1(A)|>\eta|S_1|
=
\left(\frac{\eta}{4}+o(1)\right)n
\]

and

\[
|Q_0(A)|
\le
\eta_0|S_0|
=
\left(\frac{\eta_0}{2}+o(1)\right)n.
\]

With \(\eta_0=\eta/4\), the number of \(x\in Q_1\) whose double is illegal is at least

\[
|Q_1|-|Q_0|
>
\left(
\frac{\eta}{4}-\frac{\eta}{8}+o(1)
\right)n,
\]

which is (15).

Fix one such \(x\). Because \(2x\) is illegal, it is comparable with a previously selected \(a_x\). We cannot have

\[
2x\mid a_x,
\]

because then \(x\mid a_x\), contradicting the legality of \(x\). Thus

\[
a_x\mid2x.
\]

Similarly \(a_x\nmid x\), again because \(x\) is legal. Comparing \(2\)-adic valuations, the fact that \(a_x\mid2x\) but \(a_x\nmid x\) implies

\[
v_2(a_x)=v_2(x)+1.
\]

Therefore \(a_x=2d_x\) for some \(d_x\mid x\), and

\[
v_2(x/d_x)=0.
\]

This is exactly (16). \(\square\)

So any linear counterexample tail necessarily begins with a linear population carrying explicit ratio-\(2\) direct-ancestor certificates.

The same observation iterates formally between adjacent shells:

\[
x\in Q_j,\quad 2x\text{ legal}
\quad\Longrightarrow\quad
2x\in Q_{j-1}.
\tag{17}
\]

What does **not** iterate is a capacity estimate for the blockers in (16).

---

# 6. Why Lemma 3 does not finish the proof

The obstruction is genuine concentration. A single selected integer can certify linearly many targets.

For instance, if \(a=2\), then every odd \(x\) has

\[
a\mid2x,\qquad a\nmid x.
\]

More generally, for a fixed blocker

\[
a=2d,
\]

all targets in its trace fiber have the form

\[
x=dm,\qquad m\text{ odd},
\]

and a single such fiber may contain \(\Theta(n/d)\) shell elements.

Thus no inequality of the form

\[
\#\{x:a_x=a\}\le C\tau(a)
\tag{18}
\]

is possible. This is precisely the direct-ancestor orientation that escapes the atomic ledger. The doubling lemma identifies the obstruction canonically, but it does not bound its lifetime capacity.

Nor does the literal anchor-and-lift construction supply the missing disproof. It proves that the maximum-degree policy can ignore a useful zero-current-deletion batch guard and that a sparse sequence of replies can destroy many **latent repair faces**. It does not establish all three facts needed here:

\[
|Q_1|\asymp n,
\qquad
Q_1\text{ remains nonminimal},
\qquad
\text{the actual capped tail lasts }cn.
\]

Destroying a bookkeeping family is not the same as keeping actual shell targets alive for linearly many greedy turns.

---

# 7. The precise unresolved assertion

The preceding proof reduces the positive direction to the following trajectory statement.

> **Second-shell capped-tail exclusion.**  
> For each fixed \(0<\eta<1\), after the fixed prelude and a top phase run at some fixed \(\eta_0<\eta/2\), there is no Prolonger strategy producing a sequence \(H(n)\to\infty\) and an active sparse position \(B_n\) such that
> \[
> |Q_1(B_n)|>\eta|S_1|,
> \qquad
> \Delta_{Q_1}(B_n)\le H(n),
> \]
> followed by \(\Omega(n)\) further active turns while the degree remains at most \(H(n)\).

By Theorem 2, this exclusion is equivalent to ruling out the normal form of every linear counterexample. But none of the supplied results proves it:

- Static completion permits the \(n/H\) minimal layer in (12).
- The exact-only bank does not control a move that simultaneously removes many legal divisors and jumps targets directly across intermediate depths.
- Frozen blocker repairs do not have chronological Lipschitz control.
- The atomic ledger controls the opposite divisibility orientation.
- All-orders witnesses allow the common trace \(d_x=1\).
- Fixed-cap fortress exclusion does not apply after rescaling, because the elements \(a_x\) in (16) are exactly the external blockers omitted by the rescaled board.
- The known lower constructions supply capped reservoirs of only \(n/H=o(n)\) moves or produce them off the required trajectory.

Accordingly, asserting \(\mathrm{FSC}(2,\eta)\) would amount to assuming capped-tail exclusion. Asserting its negation would require an explicit strategy realizing that tail. Neither implication is currently justified.

---

# 8. Formulation repair

The phrase “a fixed prefix-measurable tie-break” must mean that the following data are fixed before Prolonger is quantified:

\[
\mathcal T_n
=
\text{the exact prelude and stopping rule},
\]

\[
\prec_n(h)
=
\text{the tie-breaking order after every finite history }h.
\]

The substantive proposition is therefore properly indexed as

\[
\mathrm{FSC}_{\mathcal T,\prec}(2,\eta;\eta_0).
\]

A proof may establish it for one fully specified tie-break, or uniformly over all prefix-measurable tie-breaks. A disproof must attack the tie-break actually fixed; it may not choose a favorable tie-break after seeing the construction.

With that quantifier made explicit, I find no terminal, activation, zero-weight, scheduling, or parameter-level collapse. The obstruction is mathematical rather than definitional.

---

# Conclusion

The strongest rigorous conclusion is

\[
\boxed{
\begin{array}{c}
\text{Every failure of }\mathrm{FSC}(2,\eta)\text{ has a sparse cap-entry}\\
\text{after }o(n)\text{ turns and then a linear capped tail.}\\[1mm]
\text{After a slightly stronger completed top phase, that tail contains}\\
\text{linearly many explicit ratio-2 direct-ancestor certificates }a_x=2d_x.\\[1mm]
\text{The supplied results neither exclude such a tail nor force one.}
\end{array}}
\]

The monotone cap-entry normal form extends to every fixed shell. The direct-ancestor control does not: deeper shells inherit blockers from every previously processed shell. Therefore this method is a localization theorem, not yet a finite-shell induction.

A disproof of the prescribed greedy policy would not imply \(L(n)=\Omega(n)\), because a batch-aware or otherwise different Shortener policy could still succeed. A proof would be the first genuine step of the desired finite induction, but it requires exactly the new chronology-sensitive capped-tail exclusion isolated above.
## Attachment D (verbatim): canonical-lift blocker structure and the cumulative fixed-shell sparsity theorem

## Verdict

After carrying the two most promising attacks through their bookkeeping, **no valid unconditional proof or disproof survives**. The mathematically correct conclusion from the supplied record is

\[
\boxed{\text{The assertion }L(n)=o(n)\text{ remains unresolved.}}
\]

The known estimates

\[
c_\delta\,\frac{n(\log\log n)^2}{\log n}
   \le L(n)
   \le (0.1897123371+o(1))n
\]

are compatible both with \(L(n)=o(n)\) and with \(\limsup L(n)/n>0\). 

This is not just an appeal to the word “open.” I tried to close the first unresolved finite-shell case. The attack produces two valid structural lemmas, including a cumulative fixed-shell result that appears stronger than the ordinary static-completion statement, but it still encounters precisely the direct-ancestor/shared-core obstruction identified in the record.

## 1. A precise second-shell blocker lemma

Let \(A\) be the current primitive set. Suppose

\[
x\in S_1=\left(\frac n4,\frac n2\right]
\]

is legal, but \(2x\in(n/2,n]\) is illegal. Choose \(a\in A\) comparable with \(2x\).

### Lemma 1

Writing \(x=2^v m\), with \(m\) odd, one necessarily has

\[
a=2^{v+1}e
\qquad\text{for some }e\mid m,\quad e<m.
\]

### Proof

Because \(x\) is legal, no member of \(A\) is comparable with \(x\).

If \(2x\mid a\), then \(x\mid a\), contradicting legality of \(x\). Hence \(a\mid2x\). But \(a\nmid x\), again because \(x\) is legal.

Now

\[
2x=2^{v+1}m.
\]

A divisor of \(2^{v+1}m\) which does not divide \(2^vm\) must contain the full \(2^{v+1}\)-part. Thus \(a=2^{v+1}e\) for some \(e\mid m\). If \(e=m\), then \(a=2x\), hence \(x\mid a\), again impossible. Therefore \(e<m\). ∎

This is a genuine constraint: every external blocker of the canonical lift \(2x\) replaces an odd part of \(x\) by one extra factor of \(2\).

It does **not**, however, give bounded multiplicity. For example, the single chosen move

\[
a=4
\]

blocks \(2x\) for every

\[
x=2m,\qquad m\text{ odd},\qquad \frac n8<m\le\frac n4.
\]

All these \(x\) are incomparable with \(4\), and there are \(\Theta(n)\) of them. Thus the canonical-lift map cannot by itself charge external blocking to \(o(n)\) targets. This is exactly the phenomenon making \(S_1\) different from the top shell; the supplied record identifies the second-shell phase as the first unresolved FSC case. 

## 2. Coatom ownership

There is a stronger ownership fact once a number actually becomes minimal legal.

### Lemma 2

Let \(x\) be legal and minimal legal relative to \(A\). For every distinct prime divisor \(p\mid x\), let

\[
d_p=\frac{x}{p}.
\]

Then the divisors \(d_p\), as \(p\) ranges over the distinct prime factors of \(x\), require **distinct** blocking moves from \(A\). Consequently, at least \(\omega(x)\) distinct chosen moves are needed to make \(x\) minimal while preserving its legality.

### Proof

Since \(x\) is minimal legal, every \(d_p\) is illegal. Choose \(a_p\in A\) comparable with \(d_p\).

The relation \(a_p\mid d_p\) is impossible, since then

\[
a_p\mid d_p\mid x,
\]

which would make \(x\) illegal. Therefore

\[
d_p\mid a_p.
\]

Suppose the same \(a\in A\) blocked \(d_p\) and \(d_q\) for distinct primes \(p,q\mid x\). Then

\[
\operatorname{lcm}\!\left(\frac{x}{p},\frac{x}{q}\right)=x
\]

divides \(a\). Hence \(x\mid a\), again contradicting legality of \(x\). Thus the blockers are distinct. ∎

This yields a useful cumulative strengthening.

### Corollary 3: cumulative fixed-shell minima are sparse

Fix \(0<\alpha<\beta\le1\), and consider the shell

\[
I_n=(\alpha n,\beta n].
\]

During any prefix containing \(t=o(n)\) chosen moves, only \(o(n)\) distinct members of \(I_n\) can ever become minimal legal.

### Proof

Fix a constant \(Y\). Split the integers that become minimal into two classes.

First, the \(Y\)-rough integers, having no prime divisor at most \(Y\), number

\[
O\!\left(n\prod_{p\le Y}\left(1-\frac1p\right)\right)
 =O\!\left(\frac n{\log Y}\right).
\]

Now let \(x\in I_n\) have a prime divisor \(p\le Y\), and suppose \(x\) becomes minimal while legal. By Lemma 2, \(d=x/p\) is blocked by some chosen \(a\) satisfying \(d\mid a\). Write

\[
a=dq=\frac{x}{p}q.
\]

Since \(d\ge\alpha n/Y\) and \(a\le n\),

\[
q\le\frac{Y}{\alpha}.
\]

For a fixed chosen move \(a\), the pair \((p,q)\) determines

\[
x=\frac{ap}{q}.
\]

There are at most

\[
\pi(Y)\left\lfloor\frac{Y}{\alpha}\right\rfloor
   =O_\alpha(Y^2)
\]

such pairs. Hence the number of non-\(Y\)-rough integers in \(I_n\) that ever become minimal is at most

\[
O_\alpha(Y^2t).
\]

Altogether,

\[
\#\{x\in I_n:x\text{ ever becomes minimal}\}
 \le O\!\left(\frac n{\log Y}\right)+O_\alpha(Y^2t).
\]

Given \(\varepsilon>0\), first choose fixed \(Y\) sufficiently large that the first term is below \(\varepsilon n\), and then use \(t=o(n)\) to make the second term below \(\varepsilon n\). This proves the claim. ∎

So, during a sparse prefix, **even cumulative transfers into the minimal layer of any fixed dyadic shell are \(o(n)\)**. This is stronger than merely saying the active minimal layer at a single snapshot is \(o(n)\).

## 3. Why this still does not prove \(L(n)=o(n)\)

The missing step is not the control of targets that become minimal. It is the control of targets that remain nonminimal by repeatedly switching among incomparable legal divisors.

If a legal divisor \(d\mid x\) is killed by an upward blocker \(a=dq\), the target \(x=dr\) may survive whenever \(q\) and \(r\) are incomparable. It may then possess a different legal divisor \(d'\mid x\), incomparable with \(d\). A single shared-core blocker can cause this replacement simultaneously for a very large family of targets. None of those targets has yet entered the cumulative-minimum bank controlled by Corollary 3.

Thus a long bad trajectory can, in principle, have:

\[
\text{few direct deletions}
\quad+\quad
\text{few transfers to minimality}
\quad+\quad
\text{many divisor refinements}.
\]

To rule that out, one needs a lifetime ownership bound saying that an earlier blocker cannot repeatedly erase large families of future repair faces without paying proportional new move-debt. The record calls this the **direct-ancestor bounded lifetime ownership** problem and states that it remains open. 

The two tempting shortcuts do not repair it:

1. **Static completion does not self-bootstrap.** The interval-blocker construction permits a completion modulus on the order of \(1/\log(1/\alpha)\), much larger than the prefix density \(\alpha\). Therefore iterating “the current minimal layer is \(o(n)\)” can reach a nonsparse scale before enough targets have been removed. 

2. **Pointwise degree divergence does not give accumulated area.** At a prefix of size \(n/H\), a guaranteed degree only on the \(\log\log H\) scale yields total certified deletion

\[
\frac nH\,O(\log\log H)=o(n),
\]

so it cannot by itself clear a positive-density shell. This is explicitly one of the ruled-out arguments in the supplied record. 

## 4. The lower-bound direction also remains incomplete

A disproof would require a strategy forcing \(\Omega(n)\) moves. The available fortresses give only

\[
\Omega\!\left(\frac nH\right)
\]

when their degree cap is \(H\to\infty\). Keeping \(H\) fixed would give a linear lower bound, but the fixed-cap entry theorem says Shortener can prevent a positive-density upper reservoir from being robustly entered at such a cap. Meanwhile, the fixed-rank fan hierarchy loses a doubly exponentially decaying constant \(c_k\), so letting the rank grow cannot produce linearity. 

Therefore neither known lower mechanism can disprove sublinearity.

## Final conclusion

The strongest unconditional conclusion justified here is:

\[
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le(0.1897123371+o(1))n,
\]

together with the two lemmas above. They do not decide whether \(L(n)/n\to0\).

A proof of \(L(n)=o(n)\) would still need, at minimum, a valid second-shell clearing theorem or an equivalent online-area/lifetime-ownership argument. A disproof would need a new positive-density mechanism avoiding both the fixed-cap entry obstruction and the collapsing-rank constants. Providing either conclusion without such an argument would be a fabricated proof rather than an unconditional settlement.



## Attachment E (verbatim): the repaired statement, the root reduction, the constant-cap suffix, and the deadline formulation

# Verdict

There are two mathematically different readings.

\[
\boxed{\text{As literally quantified, the displayed exclusion is true but vacuous.}}
\]

The omission is the lower bound \(\eta _0>0\), together with an explicit requirement that the top phase terminate uniformly in \(o(n)\) turns. Without those requirements, one may choose a fixed negative threshold. The top phase then never reaches its stopping condition before the game ends, so no active post-top position \(B_n\) exists.

Under the intended reading inherited from \(\mathrm{FSC}\),

\[
0<\eta _0<\eta/2
\]

with uniform \(o(n)\) termination, this collapse disappears. My argument below does **not** prove or disprove that repaired substantive assertion. It does, however, give an exact root-reduction theorem and a strong necessary normal form for any counterexample.

---

## 1. Literal proof by parameter-level activation suppression

Fix \(0<\eta<1\). The quoted statement requires only that the top phase be run at “some fixed”

\[
\eta _0<\eta/2.
\]

It does not explicitly require \(\eta _0>0\). Choose, before Prolonger is quantified,

\[
\eta _0=-1.
\]

This choice is fixed, deterministic, and independent of Prolonger and of the realized history.

Let the top-phase stopping time be the one dictated by the definition:

\[
\tau_0
=
\inf\left\{
t:
|Q_0(A_t)|\le \eta _0|S_0|
\right\}.
\]

For every position \(A_t\),

\[
|Q_0(A_t)|\ge0,
\]

whereas

\[
\eta _0|S_0|=-|S_0|<0.
\]

Therefore

\[
|Q_0(A_t)|\le\eta _0|S_0|
\]

is impossible at every finite nonterminal history. Hence the threshold stopping time is never attained.

There are now two possible phase conventions.

1. If a post-top position is defined only when the prescribed threshold stopping time is finite, there is no post-top position at all.
2. If every phase is forcibly terminated when the game itself terminates, its only possible post-top position is terminal. A terminal position is not an active second-shell position.

Under either convention, no Prolonger strategy can produce an active sparse position \(B_n\) **after** this top phase. In particular, no strategy can produce such a \(B_n\) followed by a linear capped tail.

Thus the quantified nonexistence assertion holds:

\[
\boxed{\text{No prohibited witness exists.}}
\]

This completes the literal proof. It is a combination of **parameter-level vacuity** and **top-phase delay/activation suppression**.

Notice that fixing \(\mathcal T_n\) and \(\prec_n\) before Prolonger is quantified does not close this particular loophole: the defective stopping rule itself is fixed before Prolonger.

---

## 2. Exact repair

The substantive statement should say the following.

> For every fixed \(0<\eta<1\), choose and fix a number
> \[
> 0<\eta _0<\eta/2,
> \]
> for example \(\eta _0=\eta/4\). Fix the complete prelude, its stopping rule, the top-phase stopping rule, and the prefix-measurable tie-break before Prolonger is quantified. Require that, uniformly against every Prolonger strategy, the prelude and top phase terminate after \(o(n)\) actual moves. Then there do not exist a constant \(c>0\), an infinite sequence \(n_k\to\infty\), a function \(H(n_k)\to\infty\), and finite on-trajectory post-top times \(b_k\), lying inside the active second-shell phase, such that
> \[
> |A_{b_k}|=o(n_k),\qquad
> |Q_1(A_{b_k})|>\eta|S_1|,
> \qquad
> \Delta_{Q_1}(A_{b_k})\le H(n_k),
> \]
> and the next at least \(c n_k\) Shortener turns all occur while the phase remains active and the degree remains at most \(H(n_k)\).

This repair explicitly supplies:

\[
0<\eta _0<\eta/2,
\]

uniform finite \(o(n)\) activation, a realized on-policy position, a fixed positive constant behind \(\Omega(n)\), and the correct quantifier order.

With this repair, the negative-\(\eta _0\) proof is unavailable. The statement becomes precisely the substantive \(\mathrm{FSC}(2,\eta)\) problem isolated in Attachment C.

---

# 3. An exact root reduction for the repaired problem

Although it does not by itself exclude the tail, the following observation substantially sharpens what such a tail must do.

For a current position \(A\), a target set \(Q=Q_1(A)\), and a legal \(d\le n/4\), write

\[
N_Q(d)=\{x\in Q:d\mid x\}.
\]

## Lemma 1: legal divisors form an upset

Let \(x\) be legal. If

\[
d\mid e\mid x
\]

and \(d\) is legal, then \(e\) is legal.

### Proof

Suppose instead that \(e\) is illegal. Then some chosen \(a\in A\) is comparable with \(e\).

If \(a\mid e\), then

\[
a\mid e\mid x,
\]

contradicting the legality of \(x\).

If \(e\mid a\), then

\[
d\mid e\mid a,
\]

contradicting the legality of \(d\).

Both possibilities are impossible. Therefore \(e\) is legal. \(\square\)

Thus, inside the divisor lattice of a legal target, the legal divisors constitute an upper order ideal.

## Lemma 2: every greedy move is equivalent to a minimal legal root

Suppose Shortener’s prescribed move \(d\) has maximum current degree

\[
|N_Q(d)|=\Delta_Q.
\]

Choose, by finite descent, a divisibility-minimal legal element \(r\) satisfying

\[
r\mid d.
\]

Then

\[
r\in\mathcal M(A)
\]

and

\[
N_Q(r)=N_Q(d).
\]

### Proof

Certainly

\[
N_Q(d)\subseteq N_Q(r),
\]

because \(r\mid d\).

But \(r\) is itself a legal candidate move. By maximality of the degree of \(d\),

\[
|N_Q(r)|\le \Delta_Q=|N_Q(d)|.
\]

The inclusion and the cardinality inequality force equality:

\[
N_Q(r)=N_Q(d).
\]

The choice of \(r\) makes it minimal legal. \(\square\)

Because every \(x\in S_1\) is larger than every proper divisor used by the policy, selecting \(d\) removes from \(Q\) exactly its multiples. Consequently, as far as the current shell is concerned, selecting \(d\) has exactly the same deletion set as selecting \(r\).

Moreover, the selected \(d\) permanently kills \(r\), since \(r\mid d\). Hence the roots charged to different Shortener turns are distinct.

## Corollary 3: a linear tail requires linearly many minimal-root events

If a second-shell phase contains \(T\) Shortener turns, then during those turns there are at least \(T\) distinct integers which are minimal legal immediately before their charged turns.

In particular, a counterexample tail of length

\[
T\ge cn
\]

requires at least \(cn\) distinct minimal-root events.

At its sparse entry position \(B_n\), static completion gives only

\[
|\mathcal M(B_n)|=o(n).
\]

Therefore all but \(o(n)\) of the charged roots must become minimal **after** entry into the capped tail.

This rules out an interpretation in which Prolonger merely rotates the greedy policy among a fixed sparse family of roots. A real counterexample must generate new minimal roots at a linear cumulative rate once the trajectory has left its sparse initial segment.

---

## 4. A fixed macroscopic interval must contain linearly many charged roots

Every charged root is at most \(n/4\). Assume \(T\ge cn\). Since each Shortener move deletes at least one target,

\[
c\le\frac14+o(1).
\]

There are at most \(cn/2\) integers not exceeding \(cn/2\). Therefore, among the \(cn\) distinct charged roots, at least

\[
\frac c2n
\]

lie in the fixed interval

\[
\left(\frac c2n,\frac n4\right].
\]

Thus any linear counterexample has the stronger property

\[
\boxed{
\text{linearly many distinct integers in one fixed macroscopic interval
become minimal legal during the tail.}
}
\]

This interfaces exactly with the cumulative sparsity theorem in Attachment D. That theorem shows that only \(o(n)\) such events can occur during an \(o(n)\)-move prefix. Hence the linear family above cannot be created during cap entry. It must be created after a positive linear number of actual moves have accumulated.

That is why cumulative sparse-prefix control does not alone prove exclusion.

---

# 5. Every linear tail contains a linear fixed-cap suffix

There is another useful sharpening that does not appear to require a growing cap.

Suppose the phase has \(T\ge cn\) Shortener turns. From the monotone-degree lemma,

\[
\sum_{t<T}\Delta_t\le |S_1|=\frac n4+O(1),
\]

and \(\Delta_t\) is nonincreasing.

Fix an integer \(D\ge1\). The number of turns with \(\Delta_t>D\) is at most

\[
\frac{|S_1|}{D+1}
\le
\frac{n}{4(D+1)}+O(1).
\]

Since the degree is nonincreasing, all such turns form an initial segment. Choose \(D=D(c)\) so large that

\[
\frac1{4(D+1)}<\frac c2.
\]

Then the final

\[
\frac c2n-O(1)
\]

turns satisfy the **fixed** cap

\[
\Delta_t\le D.
\]

Therefore:

\[
\boxed{
\text{A linear growing-cap counterexample necessarily has a linear
constant-cap suffix.}
}
\]

This does not contradict the accepted fixed-cap entry theorem. The constant-cap suffix need only begin after as many as

\[
\frac{n}{4(D+1)}
\]

turns, which is a small but fixed positive fraction of \(n\), not \(o(n)\). By that time the position need not be sparse. This is the exact boundary between the existing fixed-cap no-entry theorem and the required exclusion.

---

# 6. A deadline formulation for the final survivors

Let \(Q_T\) be the target population after a prefix of \(T\) active tail turns, and put

\[
X=Q_T.
\]

For a lower integer \(d\), define its incidence with the final survivors by

\[
k_X(d)=|\{x\in X:d\mid x\}|.
\]

Because legality and membership in \(Q\) only disappear,

\[
X\subseteq Q_t
\]

for every earlier time \(t\).

Suppose \(d\) remains legal for the first \(s\) Shortener positions of this interval. Then on each of those positions,

\[
\Delta_t\ge k_X(d).
\]

Consequently,

\[
s\,k_X(d)
\le
\sum_{t<s}\Delta_t
\le |S_1|.
\]

Thus every divisor \(d\) of many final survivors has an early blocking deadline:

\[
\boxed{
s\le\frac{|S_1|}{k_X(d)}.
}
\]

If \(d\) stays legal for the entire \(T\)-turn interval, then

\[
T\,k_X(d)\le |S_1|.
\]

For a linear interval \(T\ge cn\), this implies

\[
k_X(d)\le \frac1{4c}+o(1)
\]

for every divisor that remains legal throughout.

So a counterexample strategy must schedule blockers early enough to meet simultaneously all these incidence-dependent deadlines.

The remaining obstruction is that one chosen move can meet many deadlines at once: if it is divisible by many currently legal roots, it can make all of them illegal while leaving their targets alive. That is exactly the direct-ancestor batch phenomenon. The deadline system therefore isolates the missing assertion but does not, by itself, prove that the schedule is impossible.

---

# 7. What this resolves—and what it does not

The exact displayed sentence is settled by the negative-\(\eta _0\) witness:

\[
\boxed{\text{It is true for a degenerate activation-suppression reason.}}
\]

This literal resolution does **not** prove \(\mathrm{FSC}(2,\eta)\), because it prevents the second-shell phase from being validly activated. It consequently says nothing about \(L(n)\), and it says nothing about whether a batch-aware or otherwise different Shortener policy succeeds.

For the repaired positive-threshold statement, the root reduction proves that a counterexample must simultaneously exhibit all of the following:

\[
\begin{gathered}
\text{a sparse growing-cap entry},\\
\text{a linear constant-cap suffix after the position is no longer sparse},\\
\text{linearly many newly created minimal roots in a fixed macroscopic interval},\\
\text{and a blocker schedule satisfying every final-survivor deadline.}
\end{gathered}
\]

The accepted direct-ancestor examples explain why none of those conditions alone is contradictory.

The legal-divisor upset lemma, root reduction, fixed-cap-suffix reduction, and deadline inequality apply without change to any fixed deeper shell. They therefore **iterate as localization statements**. They do not give a finite-shell induction: in deeper shells, roots can be destroyed by elements from every previously processed shell, so the same batch-deadline obstruction only becomes more complicated.

Hence the final scope is:

\[
\boxed{
\begin{array}{l}
\textbf{Literal statement: proved, but vacuously, by the missing condition }\eta_0>0.\\[1mm]
\textbf{Exact repair: require }0<\eta_0<\eta/2\textbf{ and uniform }o(n)\textbf{ activation.}\\[1mm]
\textbf{Repaired statement: not decided by this proof; the remaining issue is}\\
\textbf{chronological batch blocking of linearly many newly exposed roots.}
\end{array}}
\]
## Attachment F (verbatim): the loglog(n/t) degree lemma and the integrability obstruction

# Verdict

I do **not** have a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]

The supplied results leave a genuine mathematical gap. Filling it would require a new chronology-sensitive theorem controlling divisor refinement along the realized trajectory. Treating the static-completion theorem, degree divergence, or the capped-state results as though they already supplied that theorem produces a false proof.

Below is the precise obstruction, together with a further shell-specific estimate that can be proved unconditionally but still falls short.

---

## 1. Why static completion does not finish the upper bound

Write
\[
\mu_n(\alpha)=
\max_{\substack{P\text{ primitive}\\ |P|\le \alpha n}}
\frac{|\mathcal M(P)|}{n}.
\]
The static-completion theorem says that for every \(\alpha_n\to0\),
\[
\mu_n(\alpha_n)\longrightarrow0.
\]

Suppose a shell contains \(q\ge c n\) live nonminimal targets. Every such target is divisible by a minimal legal element. Hence
\[
\Delta_Q(A)\ge \frac{|Q|}{|\mathcal M(A)|}
   \ge \frac{c}{\mu_n(\alpha)}
\]
as long as \(|A|\le \alpha n\).

It is tempting to conclude that greedy deletion clears the shell in
\[
O\!\left(n\mu_n(\alpha)\right)
\]
turns. But for the argument to remain inside the region \(|A|\le\alpha n\), one needs
\[
\mu_n(\alpha)=o(\alpha).
\]
That is exactly the strengthened modulus which the interval-blocker construction refutes. A behavior such as
\[
\mu_n(\alpha)\asymp \frac1{\log(1/\alpha)}
\]
is entirely compatible with static completion, but then
\[
n\mu_n(\alpha)\gg \alpha n.
\]
The argument exits its sparse regime before it has cleared a fixed fraction of the shell.

The same problem appears in the capped-tail normal form. Cap entry at threshold \(H\) occurs only after as many as \(O(n/H)\) turns. At that point,
\[
|Q|\le H|\mathcal M(A)|.
\]
To contradict \(|Q|\ge c n\), static completion would have to give
\[
|\mathcal M(A)|=o(n/H),
\]
not merely \(o(n)\). Equivalently one would need
\[
H\,\mu_n(C/H)\longrightarrow0,
\]
which is again false for the interval-blocker modulus.

So the apparently short proof from “minimal cones cover \(Q\)” contains a substantive, not cosmetic, gap.

---

## 2. A valid chronology-sensitive second-shell estimate

There is nevertheless a stronger shell-local degree statement than the bare static argument suggests.

### Lemma

Fix \(\eta>0\). Let \(A\) be a primitive position with
\[
t=|A|=o(n),
\]
and let
\[
Q\subseteq (n/4,n/2]
\]
be a set of legal integers satisfying \(|Q|\ge\eta n\). Then some legal \(d\le n/4\) divides at least
\[
c_\eta\log\log\frac nt
\]
members of \(Q\), with the usual harmless truncation when \(t\) is extremely small.

Thus, at a sparse prefix,
\[
\Delta_Q(A)\gg_\eta \log\log(n/t).
\]

### Proof

Set
\[
K=\min\left\{n^{1/8},\left(\frac nt\right)^{1/4}\right\},
\]
interpreting \(K=n^{1/8}\) if \(t=0\). Since \(t=o(n)\), we have \(K\to\infty\), and
\[
K^2t=o(n).
\]

For \(x\in Q\), let
\[
\omega_K(x)=\#\{p\le K:p\text{ prime and }p\mid x\}.
\]
Put
\[
\lambda_K=\sum_{p\le K}\frac1p
          =\log\log K+O(1).
\]

The standard Turán–Kubilius estimate, restricted to the fixed interval \((n/4,n/2]\), gives
\[
\sum_{n/4<x\le n/2}
   \bigl(\omega_K(x)-\lambda_K\bigr)^2
   =O(n\lambda_K).
\]
Consequently,
\[
\#\left\{x\in(n/4,n/2]:
  \omega_K(x)<\frac{\lambda_K}{2}\right\}
  =O\left(\frac n{\lambda_K}\right)=o(n).
\]
Since \(|Q|\ge\eta n\),
\[
\sum_{x\in Q}\omega_K(x)
   \ge c_\eta n\lambda_K. \tag{1}
\]

For every incidence \((x,p)\) counted on the left, consider the coatom
\[
d=\frac{x}{p}.
\]
Because \(x\le n/2\) and \(p\ge2\),
\[
d\le n/4.
\]

We bound the incidences for which \(d\) is illegal. Since \(x\) itself is legal, illegality of \(d\) cannot be caused by a chosen \(a\in A\) satisfying \(a\mid d\), because then \(a\mid x\). Therefore there is an \(a\in A\) such that
\[
d\mid a.
\]
Write
\[
a=dr,\qquad x=dp.
\]
Then
\[
x=\frac{ap}{r}.
\]
Because \(x>n/4\) and \(a\le n\),
\[
r=\frac{ap}{x}<4p\le4K.
\]

For fixed \(a\) and \(p\), there are fewer than \(4p\) possible integers \(r\), and each \(r\) determines \(x=ap/r\). Hence a fixed \(a\) can be responsible for at most
\[
\sum_{p\le K}4p
 \le 4K\pi(K)
 \le 4K^2
\]
blocked coatom incidences. Summing over \(a\in A\), the total number of blocked incidences is at most
\[
4K^2t=o(n). \tag{2}
\]

Combining (1) and (2), the number of incidences \((x,d)\) with \(x\in Q\), \(d\mid x\), and \(d\) legal is
\[
\ge c_\eta n\lambda_K-o(n)
 \gg_\eta n\log\log K.
\]
There are at most \(n/4\) possible integers \(d\le n/4\). Therefore one legal \(d\) occurs in at least
\[
c'_\eta\log\log K
   =\Omega_\eta\!\left(\log\log\frac nt\right)
\]
of these incidences. ∎

---

## 3. Why even this estimate does not prove \(o(n)\)

Suppose the second-shell population stays linear up to time \(T=\varepsilon n\). The lemma forces approximately
\[
\sum_{t\le \varepsilon n}
  \log\log\frac nt
\]
direct deletions, up to constant factors.

After dividing by \(n\), the corresponding continuous quantity is
\[
\int_0^\varepsilon
   \log\log\frac1s\,ds.
\]
As \(\varepsilon\downarrow0\),
\[
\int_0^\varepsilon
   \log\log\frac1s\,ds
   =
   \varepsilon\log\log\frac1\varepsilon
   +O\!\left(
      \frac{\varepsilon}{\log(1/\varepsilon)}
   \right)
   \longrightarrow0.
\]

Thus the guaranteed accumulated deletion area through an arbitrarily small linear prefix is itself an arbitrarily small fraction of \(n\). The divergence of the instantaneous degree is **integrable** at the sparse endpoint.

At cap-entry time \(t\asymp n/H\), the lemma gives only
\[
\Delta_Q(A)\gg\log\log H.
\]
This is perfectly compatible with the capped-tail condition
\[
\Delta_Q(A)\le H,
\]
because
\[
\log\log H=o(H).
\]

So this chronology-sensitive improvement still permits the following qualitative trajectory:

\[
\Delta_t\asymp \log\log(n/t),\qquad
|\mathcal M_t|\asymp
\frac{n}{\log\log(n/t)},\qquad
|Q_t|\asymp n.
\]

For every \(t=o(n)\), the minimal-root population is \(o(n)\), the degree tends to infinity, and the exact-only population can remain \(o(n)+t\); nevertheless the total accumulated area through \(\varepsilon n\) turns can be too small to contract \(Q\) by a fixed factor. This is an abstract trajectory rather than an actual divisibility-game construction, but it proves that the accepted sparse-prefix estimates do not logically exclude a linear tail.

The missing ingredient must therefore be genuinely nonlocal: a halving theorem, a nonintegrable potential drop, or a chronology-sensitive ownership rule that prevents direct ancestors from repeatedly regenerating low-degree root classes.

---

## 4. Why the lower-bound machinery also does not disprove the claim

The established fortress result at cap \(H\) supplies only
\[
\Omega(n/H)
\]
future moves. If \(H\to\infty\), this remains \(o(n)\). It can establish an \(n^{1-o(1)}\) lower bound, but not a positive-density lower bound.

Taking \(H=O(1)\) would yield \(\Omega(n)\), but fixed-cap robust entry is ruled out. More generally, entry at cap \(H=o(r(n))\) with a linear upper reservoir is impossible.

The rank-\(k\) fan hierarchy also remains sublinear after optimizing \(k\):
\[
c_k\,\frac{n(\log\log n)^{k-1}}{\log n},
\qquad
c_k=2^{-k-2^{k-1}+1}.
\]
The doubly exponential decay in \(c_k\) prevents a growing-rank choice from reaching \(cn\).

Finally, a history that defeats maximum-degree or smallest-prime play is not a game lower bound. A disproof must produce one Prolonger strategy surviving **every** legal Shortener policy, including packet guards and fixed-density clearing moves. No supplied result gives such a strategy.

---

## 5. Exact status

A correct upper proof still needs something of the strength of the trajectory-restricted aggregate-excess halving assertion, or an alternative theorem that supplies comparable nonintegrable progress. In the second-shell formulation, it must rule out the capped tail after entry at \(t\asymp n/H\), despite the fact that:

\[
|\mathcal M(A)|\asymp n/H
\]
is compatible with static completion,

\[
\Delta_Q(A)\asymp \log\log H
\]
is compatible with all known degree estimates, and direct-ancestor refinements can be caused by single moves with very large lifetime multiplicity.

A correct disproof, on the other hand, must realize such a low-area trajectory inside the actual divisibility game against arbitrary Shortener play and then amplify it to \(\Omega(n)\), not merely \(n/H(n)\).

Accordingly, the honest mathematical conclusion is that the proposition
\[
\boxed{L(n)=o(n)}
\]
is **not resolved by the stated results**, and I did not obtain the missing unconditional proof or the required arbitrary-reply linear lower strategy. Claiming either conclusion would require asserting precisely the chronology theorem that remains unproved.

## Attachment I (verbatim): the causal orientation theorem, the corrected chronological obligation, and the linear-scale static realization

# Verdict

\[
\boxed{\text{The two stated “faces” are not actually equivalent.}}
\]

The scheduling face in the question contains a **player-role and causality collapse**. A divisor of a final survivor cannot be first blocked by a maximum-degree Shortener move. Its first blocker is necessarily a **Prolonger reply**. If “divides a Shortener-selected move” is allowed to mean a later Shortener move, after the divisor was already blocked, the condition becomes post-hoc bookkeeping and no longer expresses the deadline.

Thus there are two readings:

\[
\begin{array}{ll}
\textbf{Causal Shortener-cover reading:}
&\text{impossible, by a strict-containment argument};\\[1mm]
\textbf{Noncausal Shortener-cover reading:}
&\text{too weak, because obligations can be laundered through later moves}.
\end{array}
\]

Attachment G itself used “one of the moves selected,” not “one of the Shortener-selected moves.” That distinction is essential.

I give below:

1. the exact causal-orientation theorem;
2. a stronger survivor deadline than the one in Attachment G;
3. an explicit legal greedy example exhibiting post-blocker laundering;
4. the exact repaired chronological object;
5. a linear primitive cover skeleton showing that the corrected cover constraints alone are arithmetically realizable.

The result resolves a hidden formulation collapse. It does **not** prove or disprove the correctly repaired \(\mathrm{FSC}(2,\eta)\).

---

# 1. Setup for one tail

Let \(B=A_1\) be the position immediately before the first Shortener move in a \(T\)-turn active second-shell interval. Write

\[
Q_t=Q_1(A_t).
\]

Let \(g_t\) be Shortener’s prescribed maximum-deletion move at \(A_t\), and let \(p_t\) denote the following Prolonger reply. Put

\[
D_t=N_{Q_t}(g_t)
=\{y\in Q_t:g_t\mid y\},
\qquad
\Delta_t=|D_t|.
\]

Let \(C\) be the position after these \(T\) rounds, and define

\[
X=Q_1(C).
\]

Because legality never regenerates, and because a target that is nonminimal at the final position has a final legal proper divisor which was legal at every earlier time,

\[
X\subseteq Q_t
\qquad(1\le t\le T).
\tag{1}
\]

For any lower integer \(d\), put

\[
k_X(d)=|\{x\in X:d\mid x\}|.
\]

---

# 2. Causal-orientation theorem

## Lemma 1: a greedy Shortener move is incomparable with every currently legal survivor divisor

Fix a Shortener position \(A_t\). Suppose \(d\) is legal at \(A_t\) and

\[
k_X(d)>0.
\]

Then \(d\) and \(g_t\) are incomparable.

### Proof

Choose \(x\in X\) with \(d\mid x\).

First suppose

\[
g_t\mid d.
\]

Then

\[
g_t\mid d\mid x.
\]

Selecting \(g_t\) would make \(x\) illegal, contrary to \(x\in X\).

Now suppose

\[
d\mid g_t.
\]

Every target deleted by \(g_t\) is also divisible by \(d\), so

\[
D_t=N_{Q_t}(g_t)\subseteq N_{Q_t}(d).
\]

But \(x\in N_{Q_t}(d)\), while \(x\notin D_t\), since \(x\) survives the selection of \(g_t\). Hence the inclusion is strict:

\[
N_{Q_t}(g_t)\subsetneq N_{Q_t}(d).
\]

Therefore

\[
|N_{Q_t}(d)|>\Delta_t,
\]

contradicting the fact that \(g_t\) has maximum current deletion degree.

Both divisibility orientations are impossible. Thus \(d\) and \(g_t\) are incomparable. \(\square\)

This conclusion is independent of the tie-break and uniform over every Prolonger strategy.

## Corollary 2: every first blocker of a survivor divisor is a Prolonger reply

Suppose \(d\) is legal immediately before Shortener’s \(t\)-th move, \(k_X(d)>0\), and \(d\) is illegal at the next Shortener position.

Then the Prolonger reply \(p_t\) satisfies

\[
d\mid p_t.
\tag{2}
\]

### Proof

Lemma 1 says \(g_t\) is incomparable with \(d\), so Shortener’s move does not block \(d\). Thus \(p_t\) must be comparable with \(d\).

The orientation

\[
p_t\mid d
\]

is impossible, because then \(p_t\mid d\mid x\) for every \(x\in X\) divisible by \(d\), killing such an \(x\). Therefore \(d\mid p_t\). \(\square\)

So the blocker edges in the actual deadline schedule have a forced orientation:

\[
\boxed{
\text{currently legal divisor of }X
\longrightarrow
\text{Prolonger reply}.
}
\tag{3}
\]

They never point to the contemporaneous greedy Shortener move.

---

# 3. A stronger exact deadline

Define the number of initial shell targets that do not survive:

\[
E=|Q_1(B)\setminus X|.
\]

The Shortener deletion sets \(D_t\) are pairwise disjoint, and every \(D_t\) is disjoint from \(X\). Hence

\[
\sum_{t=1}^{T}\Delta_t
\le E
\le |S_1|-|X|.
\tag{4}
\]

This improves the ledger bound \(\sum\Delta_t\le |S_1|\) used in the attachments.

## Theorem 3: causal Prolonger deadline

For \(1\le s\le T\), suppose \(d\) is legal at \(B\) and

\[
k_X(d)>\frac{E}{s}.
\tag{5}
\]

Then there exists \(j<s\) such that the Prolonger reply \(p_j\) is the first blocker of \(d\), and

\[
d\mid p_j.
\tag{6}
\]

### Proof

Suppose no Prolonger reply \(p_j\), \(j<s\), blocks \(d\).

By Lemma 1, none of the first \(s\) Shortener moves can block \(d\) while \(d\) remains legal and incident with \(X\). Therefore \(d\) is legal at each of the first \(s\) Shortener positions.

At every such position,

\[
\Delta_t\ge k_X(d),
\]

because all members of \(X\) divisible by \(d\) are still current targets. Consequently,

\[
s\,k_X(d)
\le \sum_{t=1}^{s}\Delta_t
\le E,
\]

contrary to (5).

Thus \(d\) is first blocked by some reply \(p_j\) with \(j<s\), and Corollary 2 supplies \(d\mid p_j\). \(\square\)

Equivalently, if

\[
\operatorname{Div}(p)=\{d:d\mid p\},
\]

then every realized bad interval satisfies

\[
\boxed{
\left\{
d\in\mathcal L(B):
k_X(d)>\frac{E}{s}
\right\}
\subseteq
\bigcup_{j<s}\operatorname{Div}(p_j).
}
\tag{7}
\]

Since \(E\le |S_1|\), this implies the weaker Attachment G deadline with \(|S_1|/s\).

The index \(j<s\), rather than \(j\le s\), is also important: a reply after Shortener’s \(s\)-th position is too late to prevent \(d\) from contributing to all of the first \(s\) greedy degrees.

---

# 4. Strengthening the persistent-root bound

Let \(\mathcal R\) be a family of final minimal roots covering \(X\), choosing one

\[
\rho(x)\in\mathcal M(C),
\qquad
\rho(x)\mid x
\]

for every \(x\in X\).

Each \(r\in\mathcal R\) is legal throughout the interval. Hence Theorem 3’s proof, with \(s=T\), gives

\[
T\,k_X(r)\le E.
\tag{8}
\]

Therefore every root fiber has size at most \(E/T\), and

\[
|\mathcal R|
\ge
\frac{|X|T}{E}.
\tag{9}
\]

If

\[
|X|>\left(\frac{\eta}{4}+o(1)\right)n,
\qquad
T\ge cn,
\]

then

\[
E\le
\left(\frac{1-\eta}{4}+o(1)\right)n,
\]

so

\[
\boxed{
|\mathcal R|
\ge
\left(
\frac{\eta c}{1-\eta}-o(1)
\right)n.
}
\tag{10}
\]

This improves the previously quoted lower bound

\[
|\mathcal R|\ge(\eta c-o(1))n.
\]

It still gives no contradiction: every Shortener turn removes at least one member of \(Q_1(B)\setminus X\), so \(T\le E\), and (9) is compatible with the available population.

---

# 5. Why “Shortener-selected multiple” has two defective readings

## 5.1 Causal reading

Suppose the statement means:

> The Shortener move \(g_j\) which contains \(d\) is the move that first makes \(d\) illegal.

This is impossible by Lemma 1. While \(d\) is legal and incident with a final survivor, no maximum-degree Shortener move is comparable with \(d\).

Thus a causal Shortener-cover schedule is empty:

\[
\boxed{
\text{No first blocker of a final-survivor divisor can be a greedy Shortener move.}
}
\tag{11}
\]

If the claimed equivalence in the question truly required such a schedule, the equivalence would immediately prove \(\mathrm{FSC}(2,\eta)\), but only because its counterexample object had been defined out of existence.

That is not what Attachment G proved.

## 5.2 Noncausal reading

Suppose instead the statement merely requires that, by time \(s\), some Shortener move happens to be a multiple of \(d\), even though \(d\) may already have been blocked by Prolonger.

Then the condition is causally meaningless. The later Shortener move did not meet the deadline; it only contains the already-illegal divisor.

Here is a complete legal greedy example.

### Example: \(n=30\)

Let

\[
B=\{7\},
\qquad
S_1=(7.5,15].
\]

At \(B\),

\[
Q_1(B)=\{8,9,10,12,15\}.
\]

The legal lower moves \(2\) and \(3\) both have degree \(3\):

\[
N_{Q_1(B)}(2)=\{8,10,12\},
\]

\[
N_{Q_1(B)}(3)=\{9,12,15\}.
\]

Fix the prefix-measurable tie-break to choose

\[
g_1=3.
\]

Prolonger now plays

\[
p_1=22.
\]

The move \(22\) is legal relative to \(\{7,3\}\). It blocks

\[
d=2
\]

because \(2\mid22\), while preserving both \(8\) and \(10\).

The next second-shell target set is

\[
Q_2=\{8,10\}.
\]

The legal moves \(4\) and \(5\) both have degree \(1\). Fix the tie-break to choose

\[
g_2=4.
\]

Then \(8\) is deleted and the final survivor set is

\[
X=Q_1(\{7,3,22,4\})=\{10\}.
\]

Now observe:

\[
d=2\text{ was legal at }B,
\qquad
d\mid10,
\]

\[
d\mid p_1=22,
\]

and later

\[
d\mid g_2=4.
\]

But \(g_2\) did not block \(d\). The divisor \(d\) was already illegal because of \(p_1=22\).

Thus recording \(d\) against the later Shortener move \(4\) is pure post-hoc laundering.

This is a distinct collapse mechanism:

\[
\boxed{\text{post-blocker player laundering}.}
\]

An obligation generated while \(d\) is legal is discharged in the ledger by a later move which had no causal role in making \(d\) illegal.

---

# 6. Exact repair of the scheduling face

Fix in advance all the required activation data:

\[
0<\eta_0<\eta/2,
\]

the prelude, both stopping rules, and the prefix-measurable tie-break.

A bad interval must be written as

\[
B=A_1
\xrightarrow{\,g_1\,}
\xrightarrow{\,p_1\,}
A_2
\xrightarrow{\,g_2\,}
\xrightarrow{\,p_2\,}
\cdots
\xrightarrow{\,g_T\,}
\xrightarrow{\,p_T\,}
C,
\]

where every \(g_t\) is the prescribed maximum-deletion move.

For every initially legal divisor \(d\) incident with \(X\), define its causal blocker time

\[
\tau(d)=
\min\{j:d\mid p_j\}.
\tag{12}
\]

The definition is meaningful whenever \(d\) becomes illegal; Corollary 2 proves that the first blocker must have this form.

The correct chronological obligation is

\[
\boxed{
k_X(d)>\frac{E}{s}
\quad\Longrightarrow\quad
\tau(d)<s,
}
\tag{13}
\]

where

\[
E=|Q_1(B)\setminus X|.
\]

Equivalently,

\[
\boxed{
\left\{
d\in\mathcal L(B):
k_X(d)>\frac{E}{s}
\right\}
\subseteq
\bigcup_{j<s}\operatorname{Div}(p_j),
}
\tag{14}
\]

with each \(d\) charged to its **earliest** such reply.

This repair simultaneously fixes:

- the player role;
- the off-by-one issue;
- the causal-first-blocker requirement;
- the post-hoc laundering loophole;
- the unnecessarily weak numerator \(|S_1|\).

The genuine exclusion theorem would say that no linear active greedy interval can realize (12)–(14) while keeping \(X\) legal and nonminimal.

That is the direct-ancestor batch problem. One reply \(p_j\) may contain many currently legal divisors of \(X\), each of incidence at most \(\Delta_j\), and can satisfy many causal deadlines simultaneously.

---

# 7. The repaired primitive cover is arithmetically nonvacuous

The following construction shows that no theorem based only on primitiveness, survivor avoidance, final minimal roots, and the prefix deadlines can work. The maximum-degree dynamics must be used.

Take

\[
n=96N,
\qquad
S_1=(24N,48N].
\]

Let

\[
R=\{r:12N<r\le24N,\ r\text{ odd}\},
\]

and

\[
X=\{2r:r\in R\}.
\]

Then

\[
|R|=|X|=6N=\frac n{16}
=\frac14|S_1|.
\tag{15}
\]

For each odd integer

\[
1\le e\le8N,
\]

let \(k(e)\) be the unique nonnegative integer satisfying

\[
6N<2^{k(e)}e\le12N.
\]

Define

\[
a_e=4\cdot2^{k(e)}e.
\tag{16}
\]

Then

\[
24N<a_e\le48N,
\]

so every \(a_e\) lies in \(S_1\). Order these moves by increasing \(e\).

There are exactly

\[
T=4N=\frac n{24}
\]

such odd \(e\).

## 7.1 Primitiveness and survivor avoidance

The \(a_e\) are distinct and all lie in the same open ratio-\(2\) interval \(S_1\). Hence they are pairwise incomparable.

Every \(a_e\) has \(2\)-adic valuation at least \(2\), while every \(x=2r\in X\) has \(2\)-adic valuation exactly \(1\). Thus

\[
a_e\nmid x.
\]

If \(x\mid a_e\), then, comparing odd parts,

\[
r\mid e.
\]

But

\[
e\le8N<r,
\]

which is impossible. Therefore every \(x\in X\) remains incomparable with every \(a_e\).

The same argument shows every \(r\in R\) remains legal.

## 7.2 All final roots become minimal

Let \(d\ge2\) be a proper divisor of \(r\in R\). Since \(r\) is odd, \(d\) is odd. Moreover, the least prime divisor of \(r\) is at least \(3\), so

\[
d\le\frac r3\le8N.
\]

Thus \(d\) is one of the indices in the construction, and

\[
d\mid a_d.
\]

After all \(a_e\) have been selected, every proper divisor \(d\ge2\) of \(r\) is illegal. Since \(r\) itself remains legal,

\[
r\in\mathcal M
\]

at the end. Consequently every \(x=2r\in X\) is still nonminimal.

Thus a linear family of roots is made genuinely minimal only after a linear number of primitive blocker moves.

## 7.3 Prefix deadlines

If \(k_X(d)>0\), then \(d\) has \(2\)-adic valuation at most \(1\), so

\[
d=2^\nu e,
\qquad
\nu\in\{0,1\},
\qquad
e\text{ odd}.
\]

The incidence is the number of odd multiples \(r\) of \(e\) in \((12N,24N]\), so

\[
k_X(d)\le\frac{6N}{e}+1.
\tag{17}
\]

Suppose

\[
k_X(d)>\frac{|S_1|}{s}
=\frac{24N}{s},
\qquad
1\le s\le T.
\]

For \(s\le4\), this is impossible because \(k_X(d)\le|X|=6N\).

For \(s\ge5\), since \(24N/s\ge6\), (17) gives

\[
\frac{6N}{e}
>
\frac{24N}{s}-1
\ge
\frac{20N}{s},
\]

and hence

\[
e<\frac{3s}{10}.
\tag{18}
\]

The move \(a_e\) occurs at position

\[
\frac{e+1}{2}<s.
\]

Also \(d\mid a_e\), because \(a_e\) contains at least two factors of \(2\).

Therefore

\[
\boxed{
k_X(d)>\frac{|S_1|}{s}
\quad\Longrightarrow\quad
d\mid a_e
\text{ for a blocker among the first }s-1.
}
\tag{19}
\]

So the primitive multiple-cover deadlines, survivor avoidance, linear persistent roots, and postponed final refinement are all simultaneously realizable.

What is missing is exactly what must be missing: these \(a_e\) have not been embedded as Prolonger replies against the prescribed maximum-degree Shortener trajectory, with \(X\) equal to the entire final \(Q_1\). Therefore this is not a counterexample to \(\mathrm{FSC}(2,\eta)\). It proves that a frozen or purely arithmetic “no primitive deadline cover” theorem is false.

---

# 8. Relation to the cone face

The construction above has

\[
x=2r,
\]

so the final roots carry quotient \(2\). The shallow quotient cone is therefore linear for every \(H\ge2\).

But those linear minimal roots are produced only after

\[
T=\Theta(n)
\]

blocker moves. Hence the construction does not violate Attachment H’s \(T=o(n)\) hypothesis. It is precisely a model of the postponed-refinement phenomenon:

\[
\text{linear shallow cone mass appears only after linear chronological work.}
\]

The unresolved question is whether the greedy game can force that chronological work to consume too many shell targets before the refinement is complete.

---

# 9. Scope and deeper shells

The causal-orientation theorem and the strengthened deadline iterate verbatim to every fixed shell:

\[
Q_1,S_1
\quad\rightsquigarrow\quad
Q_j,S_j.
\]

For any final survivor set \(X\subseteq Q_j\),

\[
\text{a currently legal divisor incident with }X
\]

is incomparable with the contemporaneous maximum-degree Shortener move, and its first blocker must be an upward Prolonger reply.

Likewise,

\[
s\,k_X(d)\le |Q_j(B)\setminus X|
\]

for a divisor legal through the first \(s\) Shortener positions.

What does **not** iterate is an exclusion of the repaired Prolonger-reply schedule. In deeper shells, replies from every previously processed shell can serve as upward blockers.

Therefore:

\[
\boxed{
\begin{array}{l}
\textbf{The Shortener-cover formulation is invalid.}\\[1mm]
\textbf{Its causal reading is impossible; its noncausal reading permits laundering.}\\[1mm]
\textbf{The exact repair uses earliest Prolonger replies and the bound }E/s.\\[1mm]
\textbf{Pure primitive deadline covers are realizable at linear scale.}\\[1mm]
\textbf{The remaining problem is the greedy-area coupling, not the cover alone.}
\end{array}}
\]

Accordingly, this does not prove \(\mathrm{FSC}(2,\eta)\), does not refute another Shortener policy, and does not imply either \(L(n)=o(n)\) or \(L(n)=\Omega(n)\). It isolates and repairs a hidden twentieth collapse family: **post-blocker player laundering**.
## Attachment J (verbatim): minimal-mover availability, the noncreation lemma, the first-death ledger, and the common-core mass-release construction

## Verdict

I do **not** have a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]
The two strongest prospective closures both fail at a precise chronological point. Below are rigorous deductions that sharpen that point. In particular, one can eliminate Shortener-created root regeneration entirely; nevertheless, Prolonger’s common-core moves still defeat the required amortization.

Thus the conclusion of the problem is **not resolved by the supplied theorem stack or by the additional arguments below**. Claiming otherwise would require inserting an unproved direct-ancestor lifetime bound.

---

## 1. Maximum-degree play may be made minimal

For a legal target family \(Q\), write
\[
N_Q(d)=\{x\in Q:d\mid x\},
\qquad
\deg_Q(d)=|N_Q(d)|.
\]

### Lemma 1

At every nonterminal position, there is a divisibility-minimal legal integer \(r\) attaining the maximum \(Q\)-deletion degree.

### Proof

Let \(d\) be any legal integer of maximum \(Q\)-degree. Descend through legal divisors of \(d\) until reaching a divisibility-minimal legal divisor \(r\mid d\).

Since \(r\mid d\),
\[
N_Q(d)\subseteq N_Q(r).
\]
Hence
\[
\deg_Q(r)\ge \deg_Q(d).
\]
The maximality of \(\deg_Q(d)\) forces equality. Therefore \(r\) is also a maximum-degree move. ∎

So, for purposes of an upper-bound strategy, Shortener may use the following policy:

> On every turn, choose a divisibility-minimal legal move among those maximizing current target deletion.

This differs from a prescribed literal tie-breaking rule, but it is a legitimate Shortener strategy for the original game.

---

## 2. Minimal Shortener moves never create new minimal legal elements

This removes one entire source of regeneration.

### Lemma 2: noncreation lemma

Let \(m\in\mathcal M(A)\), and suppose \(x\) remains legal after \(m\) is selected. If \(x\) was nonminimal legal before the move, then it remains nonminimal legal afterward.

Equivalently,
\[
\mathcal M(A\cup\{m\})\cap\mathcal L(A\cup\{m\})
\subseteq \mathcal M(A).
\]

### Proof

Because \(x\) was nonminimal, it had a proper legal divisor \(d\mid x\) before the move. Suppose \(d\) becomes illegal when \(m\) is selected. Then \(d\) and \(m\) are comparable.

If \(d\mid m\), minimality of \(m\) forces \(d=m\). Consequently \(m\mid x\), contradicting the assumption that \(x\) survives the selection of \(m\).

If \(m\mid d\), then again \(m\mid x\), giving the same contradiction.

Thus no proper legal divisor of a surviving \(x\) is destroyed by the move \(m\). In particular, \(x\) retains the divisor \(d\) and stays nonminimal. ∎

### Consequence for the second shell

Under the minimal maximum-degree policy furnished by Lemma 1:

- a surviving second-shell target can become minimal only on a **Prolonger** turn;
- Shortener’s turns either delete the target or leave its nonminimality unchanged.

Hence the unresolved regeneration phenomenon is entirely attributable to Prolonger’s upward blockers. This is a genuine simplification, but it does not close the problem.

---

## 3. An exact lifetime ledger for actual survivor divisors

Fix an interval of play, and let \(X\) be a family of integers that remains legal throughout the entire interval. At time \(t\), define
\[
\mathcal D_t(X)=
\{d\in\mathcal L(A_t):d\mid x
\text{ for at least one }x\in X\}.
\]

### Lemma 3: actual-divisor first-death ledger

If the moves during the interval are \(a_1,\ldots,a_T\), then
\[
\left|\mathcal D_0(X)\setminus\mathcal D_T(X)\right|
\le
\sum_{i=1}^{T}\tau(a_i).
\tag{1}
\]

More generally, for every nonnegative weight function \(w\),
\[
\sum_{d\in\mathcal D_0(X)\setminus\mathcal D_T(X)}w(d)
\le
\sum_{i=1}^{T}\ \sum_{d\mid a_i}w(d).
\tag{2}
\]

### Proof

Assign each disappearing divisor \(d\) to the first move \(a_i\) that makes it illegal. Since \(d\) was legal immediately before \(a_i\), it must be comparable with \(a_i\).

Choose \(x\in X\) with \(d\mid x\). The alternative \(a_i\mid d\) is impossible, because it would imply
\[
a_i\mid d\mid x,
\]
so \(x\) would become illegal, contrary to the definition of \(X\). Therefore necessarily
\[
d\mid a_i.
\]

Thus all divisors first destroyed by \(a_i\) are divisors of \(a_i\), giving at most \(\tau(a_i)\) of them. Summing first deaths proves (1), and the same assignment proves (2). ∎

This is a genuine immutable, one-use ledger. It completely avoids repeated counting of the **same actual legal divisor**.

The difficulty is that the desired conclusion is about target mass, not the number of actual divisors. A single destroyed divisor can support many targets, and after its destruction those targets can use other divisors that were already legal at the interval’s beginning. Consequently (1) does not control postponed refinement.

---

## 4. Why Prolonger-created minima have no bounded per-move multiplicity

Even under the minimal Shortener policy, one Prolonger move can create an unbounded number of new minima.

### Common-core construction

Choose distinct primes
\[
p_1,\ldots,p_k,d,q
\]
such that
\[
P=\prod_{i=1}^{k}p_i\le n,
\qquad
dp_i\le n,
\qquad
dq\le n.
\]
Consider the primitive position
\[
A=\{P\}.
\]

For every \(i\), put
\[
r_i=dp_i.
\]

Then:

- \(p_i\) is illegal because \(p_i\mid P\);
- \(d\) is legal;
- \(r_i\) is legal and its only proper legal divisor is \(d\);
- \(a=dq\) is legal and incomparable with every \(r_i\).

When Prolonger selects \(a=dq\), the common divisor \(d\) becomes illegal. Therefore all
\[
r_1,\ldots,r_k
\]
simultaneously become divisibility-minimal legal elements.

Taking \(p_1,\ldots,p_k\) to be small primes gives
\[
k\asymp \frac{\log n}{\log\log n}
\]
along a suitable sequence of \(n\). Thus one Prolonger move can create a diverging number of fresh minimal roots.

This does **not** yield a linear lower bound: the sparse-position completion theorem prevents the construction from being scaled directly to linearly many minima. It does prove that the hoped-for assertion

\[
\text{“one Prolonger move creates only }O(1)\text{ relevant roots”}
\]

is false, even after Shortener is made minimal.

The higher-rank cube mechanisms in the supplied record are precisely amplified versions of this common-core phenomenon.

---

## 5. The tempting fixed-depth proof and its exact quantifier failure

There is another seemingly short upper-bound argument:

1. perform the sparse \(\Omega\bmod g\) sweep, obtaining legal-poset height below \(g\) in \(n/g=o(n)\) moves;
2. sweep the divisibility-minimal legal layer;
3. repeat until the height is exhausted;
4. invoke static completion at each layer.

For every **fixed** number of layers, this argument is valid.

### Proposition 4: fixed-depth clearing

Starting from any position \(A_0\) with \(|A_0|=o(n)\), Shortener can sweep any fixed number \(J\) of successive minimal legal layers in \(o(n)\) turns, uniformly against Prolonger.

### Proof

Freeze
\[
C_0=\mathcal M(A_0).
\]
Shortener selects still-legal elements of \(C_0\) until none remain. This takes at most \(|C_0|=o(n)\) Shortener turns by static completion. Prolonger has made at most the same number plus one of intervening moves, so the new position \(A_1\) is still sparse.

Now
\[
C_1=\mathcal M(A_1)
\]
again has size \(o(n)\). Repeat. Induction works for every fixed \(J\). ∎

The invalid step is to put \(J=g(n)\to\infty\). The following numerical profile satisfies every fixed-depth conclusion:
\[
|C_j|=\left\lfloor\frac n{g(n)}\right\rfloor,
\qquad
0\le j<g(n).
\]
For each fixed \(J\),
\[
\sum_{j<J}|C_j|
\le \frac{Jn}{g(n)}=o(n),
\]
but
\[
\sum_{j<g(n)}|C_j|=(1-o(1))n.
\]

This does not construct such a divisibility trajectory; it proves that fixed-prefix little-\(o\) estimates cannot be diagonalized into a growing-depth estimate. A new uniform chronological theorem is indispensable.

---

## 6. Where an attempted second-shell proof stops

Under the minimal maximum-degree policy, suppose a linear capped tail exists. All fresh minimal roots in the tail are created on Prolonger turns. For a Prolonger move \(a\), every newly unavailable actual divisor of a final survivor divides \(a\), by Lemma 3.

One might now try to charge fresh roots to divisors of \(a\). The strongest immediate estimate has the shape
\[
\text{new root/target incidences caused by }a
\ \le\
\sum_{\substack{d\mid a\\d\text{ legal before }a}}
\deg_X(d)
\ \le\
\tau(a)\,\Delta_X.
\tag{3}
\]

Equation (3) is insufficient for exactly the reasons encoded in the supplied direct-ancestor obstruction:

- \(\tau(a)\) is unbounded;
- even when the current maximum degree is capped, one old common-core move can be inherited by many later refinements;
- different future roots can already have been legal at the sparse baseline, so they are not “created” as actual integers when their ancestors disappear;
- endpoint bounds such as \(t\Delta_t\) do not control the accumulated chronological area;
- a static replacement-window or frozen-repair charge can reuse the same ancestral move after each subsequent split.

Thus Lemma 3 controls actual divisor deaths but not the latent root mass that those deaths release. The missing assertion would have to say that this release can be charged with bounded **lifetime target mass**, not merely bounded actual-divisor multiplicity.

That is precisely the unresolved direct-ancestor clause.

---

## 7. Why this also does not give a disproof

The common-core construction is not an on-policy linear lower-bound strategy. To disprove \(L(n)=o(n)\), Prolonger would still have to produce, against **every** Shortener strategy, a trajectory that simultaneously:

1. survives the required sparse prelude;
2. retains positive aggregate shell excess for arbitrarily slowly growing scale parameters;
3. keeps the retained targets nonminimal;
4. survives prime-product guards and other batch moves;
5. postpones the transition to linearly many private roots until the position is no longer sparse;
6. does so with a positive-density payoff, rather than \(n/H(n)\).

The established fixed-cap exclusion prevents the most direct version, and a growing-cap fortress gives only \(n/H(n)=o(n)\). The fixed-rank fan hierarchy also cannot be sent to growing rank because its constants collapse. The local common-core example above supplies no strategy satisfying these global quantifiers.

---

## Final conclusion

The rigorous additions above show that Shortener can be assumed to play minimal maximum-degree moves and therefore never causes root regeneration herself. They also give an exact one-use ledger for actual divisors of final survivors. Neither result controls the mass released by a Prolonger common-core move after arbitrarily many later refinements.

Accordingly, the problem remains at the following exact dichotomy:

- an upper proof must establish an interval-local chronological trichotomy forcing a fixed positive amount of direct deletion, exact play, or irreversible minimal banking in \(o(n)\) turns; equivalently, it must close the direct-ancestor lifetime ownership clause in the second-shell multiple-cover schedule;
- a disproof must construct a legally realized postponed-refinement schedule against arbitrary Shortener play, not merely a capped endpoint or an off-policy fortress.

No such theorem or schedule is proved here. Therefore I cannot honestly assert either \(L(n)=o(n)\) or \(L(n)\not=o(n)\). The strongest unconditional conclusion remains
\[
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le
(0.1897123371+o(1))n,
\]
with the sublinearity question unresolved.
REMEMBER - this argument may require non-trivial, creative and novel elements; both directions are valuable, and the proof must handle arbitrary replies.
