Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Prove or refute the shadow-closed uniform preparation capacity inequality (SC) stated below. A proof of (SC) proves the second-shell clearing statement outright (the implication is already established); a refutation must exhibit the structure that defeats it on realized trajectories.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Attachment A defines, for fixed \(J\ge1\) and \(0<\eta<1\), the finite-shell clearing statement \(\mathrm{FSC}(J,\eta)\) (process dyadic shells \(S_j=(n/2^{j+1},n/2^j]\) in order after an \(o(n)\)-move prelude; while \(|Q_j(A)|>\eta|S_j|\), where \(Q_j\) is the live nonminimal shell population, play a currently legal lower element maximizing deletions from \(Q_j\); every turn counted; a fixed prefix-measurable tie-break) and proves: if \(\mathrm{FSC}(J,\eta)\) holds for every fixed \(J\) and \(\eta\), then \(L(n)=o(n)\) — deep shells are controlled by total size, so no growing-depth estimate is needed. Attachment B PROVES \(\mathrm{FSC}(1,\eta)\) for every fixed \(0<\eta<1\) (degree availability plus a disjointness bootstrap), and localizes the obstruction to the second shell: a previously chosen \(a\in(n/2,n]\) can satisfy \(d\mid a\) with \(a\) incomparable to a target \(x\in S_1\), killing the lower move \(d\) without killing \(x\) — external blockers absent from any rescaled smaller board.

The target (Attachment M states it exactly, with the implication proof). In a linear active second-shell greedy interval under the prescribed minimal-maximum-degree policy (entry B after an o(n) prelude + completed top phase, greedy moves g_t, Prolonger replies p_t, T >= cn turns, degree ledger sum_t Delta_t <= E <= n/4), each greedy root g_t >= alpha*n carries nu_Y(g_t) = #{primes pi <= Y : pi | g_t, pi != release prime} small-prime preparation obligations, each requiring a distinct earlier Prolonger reply, in the four-layer chronology shadow-blocking < coatom-blocking < release < service (sigma < beta < gamma < t; the downward-shadow dichotomy is proven: the gcd d_U of ANY nonempty coatom subfamily inside one reply's packet is either legal at that turn, forcing |U| <= Delta_j, or illegal with its own strictly earlier Prolonger first-blocker).

(SC): for every fixed alpha > 0 there exists C_alpha such that, for some uniformly chosen Y_n -> infinity, every realized shadow-closed bad interval satisfies sum_{t : g_t >= alpha*n} nu_{Y_n}(g_t) <= C_alpha * E + o(n log log Y_n).

Already established (Attachment M): (SC) implies no linear active interval exists — a linear tail supplies (delta-o(1))n roots in [alpha*n, n/4], whose Turán–Kubilius demand is >= (delta/3-o(1)) n log log Y_n, contradicting (SC). Also established: no nonnegative multiscale aggregation of the fixed-Y bound (Y/alpha)E can prove (SC) (Proposition 1 — the aggregation is dominated by its principal terms); any proof must be a genuinely cross-scale, cross-reply correlation argument exploiting shadow-closure; and one reply CAN prepare Theta(Y/log Y) target-private coatoms, but only through a packet with a hidden common lower face that the shadow dichotomy exposes (its gcd either has large current degree — costing the degree ledger — or needs its own earlier blocker, recursing the obligation downward). A refutation must construct realized shadow-closed bad intervals (on-trajectory against the prescribed policy, all four causal layers accounted) with preparation demand genuinely reaching n log log Y for every admissible uniform Y_n — evading the recursion that the shadow dichotomy sets up. Formulation caution: twenty-four degenerate-collapse families are catalogued in the record; if (SC) as stated hides another, proving THAT with the exact repair is a valuable resolution. If you prove (SC), state explicitly whether the argument gives depth-J uniformity (shadow blockers sourced from earlier-processed shells S_0..S_{j-1}) or only the second shell.

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

## Attachment K (verbatim): unique release times, the exact prefix Hall equality, future-service pressure, and the bi-causal reply system

# Verdict

There is another causal collapse, distinct from post-blocker player laundering:

\[
\boxed{\textbf{postponed-service laundering}.}
\]

The final-survivor deadlines from Attachment I govern **which divisors of \(X\) must be blocked, and how early**. They do not govern whether the successive greedy moves themselves have been supplied with minimal roots early enough to be played.

Under the minimal-maximum-degree policy, every greedy move after the sparse baseline must be released by an **earlier Prolonger reply**. Hence a genuine bad interval carries two independent causal systems:

1. the **survivor-cover system**, indexed by divisors of \(X\);
2. the **greedy-service system**, indexed by the roots actually selected by Shortener.

A total endpoint statement such as “linearly many roots were eventually created” is insufficient. The roots must satisfy a strict prefix Hall condition. Moreover, each reply must simultaneously satisfy its survivor-cover obligations and its root-service obligations through one common divisor packet.

I prove the exact repair below. It is an unconditional structural theorem. It also shows why the existing causal deadline theorem does not yet exclude a linear interval.

I do **not** obtain either a valid unconditional no-tail theorem or an on-policy Prolonger construction after imposing this repair. The remaining missing assertion is a joint capacity theorem for the two causal systems, not survivor coverage alone.

---

## 1. Setup

Write the active interval as

\[
A_1
 \xrightarrow{\,g_1\,}
 \xrightarrow{\,p_1\,}
A_2
 \xrightarrow{\,g_2\,}
 \xrightarrow{\,p_2\,}
\cdots
A_T
 \xrightarrow{\,g_T\,}
 \xrightarrow{\,p_T\,}
A_{T+1}=C.
\]

Here:

\[
Q_t=Q_1(A_t),
\]

\[
D_t=N_{Q_t}(g_t)
   =\{y\in Q_t:g_t\mid y\},
\qquad
\Delta_t=|D_t|,
\]

and

\[
X=Q_1(C),\qquad
E=|Q_1(A_1)\setminus X|.
\]

The policy chooses \(g_t\) to be a divisibility-minimal legal integer of maximum current \(Q_t\)-degree. Consequently,

\[
g_t\in\mathcal M(A_t),
\qquad
|D_t|=\Delta_t.
\]

The sets \(D_t\) are pairwise disjoint and disjoint from \(X\), so

\[
\sum_{t=1}^{T}\Delta_t\le E.
\tag{1}
\]

---

# 2. Every future greedy move already has a live target

This elementary observation couples the root-release problem back to the degree ledger.

## Lemma 1: future-target persistence

For every \(i\), choose one representative

\[
y_i\in D_i.
\]

Then for every \(t\le i\),

\[
y_i\in Q_t
\quad\text{and}\quad
g_i\text{ is legal at }A_t.
\]

In particular, the elements

\[
X\cup\{y_i:i\ge t\}
\tag{2}
\]

are distinct members of \(Q_t\).

### Proof

The move \(g_i\) is legal immediately before it is selected. Legality only disappears as the chosen set grows, so \(g_i\) was legal at every earlier position \(A_t\).

Likewise, \(y_i\) survives until the \(i\)-th Shortener move, so it was legal at every earlier time. Since

\[
g_i\mid y_i
\]

and \(g_i\) is a proper legal divisor at all those earlier times, \(y_i\) is nonminimal there. Hence \(y_i\in Q_t\).

The sets \(D_i\) are disjoint and are disjoint from \(X\), proving distinctness. ∎

Thus a long interval does not merely preserve \(X\). At time \(t\), the current lower-root system must also support one distinct still-live target for every future Shortener turn.

---

## Corollary 2: future-service pressure

Let \(\mathcal R_t\) be any family of current minimal legal roots covering the set in (2). Then

\[
\Delta_t
\ge
\frac{|X|+T-t+1}{|\mathcal R_t|}.
\tag{3}
\]

Moreover,

\[
|\mathcal R_t|
\le
\frac n8-t+O(1)+o(n).
\tag{4}
\]

Consequently,

\[
\boxed{
\Delta_t
\ge
\frac{|X|+T-t+1}
     {\,n/8-t+O(1)+o(n)\,}
}
\tag{5}
\]

whenever the denominator is positive.

### Proof

Assign to every member of (2) one current minimal legal divisor. Some root receives at least the average number of assignments, giving (3).

Every root in \(\mathcal R_t\) is at most \(n/4\). The already selected moves

\[
g_1,\ldots,g_{t-1}
\]

also lie in \([2,n/4]\). Since the roots are legal, they are incomparable with the already selected moves; and distinct minimal legal elements are mutually incomparable. Therefore

\[
\{g_1,\ldots,g_{t-1}\}\cup\mathcal R_t
\]

is primitive inside \([2,n/4]\).

The largest primitive subset of \([2,n/4]\) has size \(n/8+O(1)\), yielding (4). ∎

Combining (1) and (5) gives the valid additional necessary inequality

\[
E
\ge
\sum_{t=1}^{T}
\max\left\{
1,\,
\frac{|X|+T-t+1}
     {n/8-t+O(1)+o(n)}
\right\}.
\tag{6}
\]

This rules out some large parameter combinations, but it does not rule out an arbitrarily small fixed \(c>0\). For small \(c\), the right side can still be only \(O(cn)\).

---

# 3. The unique service time of every greedy root

The noncreation lemma has a stronger chronological consequence than the endpoint statement “there are \(T\) fresh roots.”

## Theorem 3: unique Prolonger release time

For every \(t\), exactly one of the following holds:

1. \(g_t\in\mathcal M(A_1)\); or
2. there is a unique index
   \[
   \gamma(t)<t
   \]
   such that \(g_t\) first becomes minimal legal immediately after the reply \(p_{\gamma(t)}\).

### Proof

The integer \(g_t\) is legal at every earlier position because it is eventually selected.

If it is not already minimal at \(A_1\), it has a first time at which it becomes minimal. By the noncreation lemma, a surviving nonminimal legal integer cannot first become minimal on a minimal Shortener move. Hence its first-minimal event occurs on a Prolonger reply.

It cannot occur on \(p_t\), since \(p_t\) is played only after \(g_t\) has already been selected. Therefore \(\gamma(t)<t\).

Once a legal integer is minimal, it remains minimal for as long as it remains legal: proper legal divisors can disappear but cannot reappear. Thus the first-minimal time is unique. ∎

This gives a strict service discipline. A reply cannot be credited with supplying the greedy move of the same round.

---

# 4. The prefix Hall obligations

For \(s\le T\), define

\[
C_j(s)
=
\{t\le s:\gamma(t)=j\},
\]

and let

\[
I(s)
=
\{t\le s:g_t\in\mathcal M(A_1)\}.
\]

## Theorem 4: exact prefix Hall equality

For every \(1\le s\le T\),

\[
\boxed{
s
=
|I(s)|
+
\sum_{j<s}|C_j(s)|.
}
\tag{7}
\]

In particular,

\[
\boxed{
s
\le
|\mathcal M(A_1)|
+
\sum_{j<s}|C_j(s)|.
}
\tag{8}
\]

Since the entry position is sparse,

\[
|\mathcal M(A_1)|=o(n).
\]

Therefore, for every linear prefix \(s\asymp n\),

\[
\boxed{
\sum_{j<s}|C_j(s)|
\ge s-o(n).
}
\tag{9}
\]

### Proof

Partition the first \(s\) distinct greedy roots according to Theorem 3. Each is either initially minimal or has one unique release time \(j<s\). This is exactly (7). ∎

Equation (9) is the missing formal meaning of “release enough re-rooting mass.”

It is a **prefix** condition. The endpoint inequality

\[
\sum_{j<T}|C_j(T)|\ge T-o(n)
\]

is not enough.

For example, the numerical release profile

\[
|C_j(T)|=0\quad(j<T-1),
\qquad
|C_{T-1}(T)|=T
\]

has enough total release at the endpoint, but it cannot supply even the first two greedy moves. Crediting that terminal burst to earlier turns is postponed-service laundering.

This defect is distinct from post-blocker player laundering:

- post-blocker laundering assigns a divisor obligation to the wrong, later player move;
- postponed-service laundering assigns a newly created root to a greedy turn that occurred before the root existed.

---

## 5. A multiscale Hall condition

The degree carried by the released roots also matters.

For an integer \(h\ge1\), let

\[
N_h(s)=
|\{t\le s:\Delta_t\ge h\}|.
\]

If \(g_t\) is released by \(p_j\), then immediately after \(p_j\), its degree on the then-current target set is at least \(\Delta_t\). Indeed, all of \(D_t\) are still legal at that earlier time and are multiples of \(g_t\).

Define

\[
C_j^{(h)}(s)
=
\{t\le s:\gamma(t)=j,\ \Delta_t\ge h\}
\]

and

\[
I_h(s)
=
\{t\le s:g_t\in\mathcal M(A_1),\ \Delta_t\ge h\}.
\]

Then

\[
\boxed{
N_h(s)
=
|I_h(s)|
+
\sum_{j<s}|C_j^{(h)}(s)|.
}
\tag{10}
\]

Thus, for every prefix and every degree threshold \(h\), enough roots of degree at least \(h\) must have been released strictly before their service times.

A raw count of newly minimal integers is insufficient: degree-zero or too-low-degree minima do not feed the maximum-degree queue.

---

# 6. What one reply must contain to release a root

The service obligations have their own exact divisor orientation.

Fix \(j\), and let \(r\) be a future greedy root with

\[
\gamma(r)=j.
\]

Immediately before \(p_j\), define

\[
L_j(r)
=
\{d:2\le d<r,\ d\mid r,\ d\text{ legal immediately before }p_j\}.
\]

Because \(r\) is not yet minimal,

\[
L_j(r)\ne\varnothing.
\]

## Lemma 5: all last legal ancestors divide the releasing reply

For every \(d\in L_j(r)\),

\[
d\mid p_j.
\tag{11}
\]

### Proof

Every \(d\in L_j(r)\) is legal before \(p_j\) and illegal after \(p_j\), since \(r\) becomes minimal. Therefore \(d\) is comparable with \(p_j\).

The orientation

\[
p_j\mid d
\]

would imply

\[
p_j\mid d\mid r.
\]

Then selecting \(p_j\) would make \(r\) illegal, contradicting the fact that \(r\) remains legal until its later Shortener service. Hence \(d\mid p_j\). ∎

Define the last-ancestor lcm

\[
\lambda_j(r)=\operatorname{lcm}L_j(r).
\]

## Corollary 6: unique maximal last ancestor

The element \(\lambda_j(r)\) satisfies

\[
\lambda_j(r)<r,
\qquad
\lambda_j(r)\mid p_j,
\tag{12}
\]

and \(\lambda_j(r)\) is itself legal immediately before \(p_j\).

Moreover, every legal proper divisor of \(r\) at that time divides \(\lambda_j(r)\).

### Proof

Equation (11) gives \(\lambda_j(r)\mid p_j\).

Choose \(d_0\in L_j(r)\). Since

\[
d_0\mid\lambda_j(r)\mid r
\]

and legal divisors of a legal integer form an upper ideal, \(\lambda_j(r)\) is legal.

If \(\lambda_j(r)=r\), then \(r\mid p_j\), contradicting the legality of \(r\) after \(p_j\). Hence \(\lambda_j(r)<r\). ∎

Thus a root is not released by an unspecified amount of “refinement.” It is released when one reply kills its unique maximal remaining legal ancestor.

---

# 7. The joint packet carried by a reply

Let

\[
\mathcal C_j
=
\{g_t:\gamma(t)=j\}
\]

be the service roots released by \(p_j\), and let

\[
\mathcal B_j
=
\{d:\tau(d)=j\}
\]

be the final-survivor divisors whose earliest causal blocker is \(p_j\).

The causal-orientation theorem gives

\[
d\mid p_j
\qquad(d\in\mathcal B_j).
\]

Corollary 6 gives

\[
\lambda_j(r)\mid p_j
\qquad(r\in\mathcal C_j).
\]

Therefore every actual interval satisfies the joint packet constraint

\[
\boxed{
\operatorname{lcm}\left(
\mathcal B_j
\cup
\{\lambda_j(r):r\in\mathcal C_j\}
\right)
\mid p_j
\le n.
}
\tag{13}
\]

This is the correct reply-level object. The same integer \(p_j\) must simultaneously:

- meet its earliest-blocker deadlines for \(X\);
- release enough roots for future greedy service;
- remain incomparable with \(X\);
- remain incomparable with every future selected root;
- remain legal relative to all previous moves.

The final-\(X\) cover records only the first item.

---

## 8. Exact local bound—and why it still does not close the phase

Group the roots in \(\mathcal C_j\) by their last ancestor. For a legal \(\lambda\), put

\[
\mathcal C_j(\lambda)
=
\{g_t\in\mathcal C_j:
  \lambda_j(g_t)=\lambda\}.
\]

## Lemma 7: one last ancestor releases at most one current greedy degree of service roots

For every \(\lambda\),

\[
\boxed{
|\mathcal C_j(\lambda)|\le \deg_{Q_j}(\lambda)\le\Delta_j.
}
\tag{14}
\]

### Proof

For each \(g_t\in\mathcal C_j(\lambda)\), choose the representative \(y_t\in D_t\). These representatives are distinct.

Since

\[
\lambda\mid g_t\mid y_t,
\]

and \(y_t\in Q_j\), all these representatives are counted in \(N_{Q_j}(\lambda)\). Hence

\[
|\mathcal C_j(\lambda)|
\le |N_{Q_j}(\lambda)|
\le\Delta_j.
\]

∎

Consequently,

\[
|\mathcal C_j|
\le
\Delta_j\,
\bigl|
\{\lambda_j(r):r\in\mathcal C_j\}
\bigr|.
\tag{15}
\]

Equation (14) explains exactly what the common-core construction does. If one reply creates \(k\) relevant roots sharing one common last ancestor \(d\), then before the reply

\[
\deg_{Q_j}(d)\ge k,
\]

so

\[
\Delta_j\ge k.
\]

A common-core burst is therefore not free: it is accompanied by a greedy deletion of at least the same order on that round.

But (15) does **not** give a global contradiction. A reply can kill many distinct last ancestors simultaneously. The last ancestors form an antichain of divisors of \(p_j\), and their lcm divides \(p_j\). Controlling the cumulative target mass released by such low-lcm packets is precisely the direct-ancestor lifetime problem.

Neither \(\tau(p_j)\), the atomic ledger, nor the frozen repair theorems supply the required chronological bound.

---

# 9. Why survivor coverage and root service are independent

The two systems cannot be identified.

A reply can satisfy many survivor deadlines while releasing no useful greedy root: it may kill a divisor \(d\mid X\) while every affected target retains several other legal divisors, so no relevant lower integer becomes minimal.

Conversely, the common-core construction can release many future greedy roots while doing nothing toward a particular high-incidence divisor of \(X\).

Thus there is no valid implication of the form

\[
\text{“enough \(X\)-divisors were blocked”}
\quad\Longrightarrow\quad
\text{“enough greedy roots were supplied.”}
\]

Nor does the reverse implication hold.

The burdens are both on Prolonger replies, but they are burdens in two different hypergraphs.

---

# 10. Exact repair of the chronological object

A schedule-level abstraction intended to be equivalent to a bad interval must include all of the following data, fixed on the realized trajectory.

### Survivor side

For every initially legal divisor \(d\) incident with \(X\),

\[
\tau(d)=\min\{j:d\mid p_j\},
\]

with

\[
k_X(d)>\frac Es
\quad\Longrightarrow\quad
\tau(d)<s.
\tag{16}
\]

### Service side

For every greedy root \(g_t\),

\[
\gamma(t)=0
\quad\text{or}\quad
\gamma(t)<t,
\]

where \(\gamma(t)\) is its true first-minimal time.

For every \(s\) and every \(h\),

\[
N_h(s)
=
|I_h(s)|
+
\sum_{j<s}|C_j^{(h)}(s)|.
\tag{17}
\]

### Joint reply side

For every \(j\),

\[
\operatorname{lcm}\left(
\mathcal B_j
\cup
\{\lambda_j(r):r\in\mathcal C_j\}
\right)
\mid p_j\le n.
\tag{18}
\]

Every \(p_j\) must also be legal when played and incomparable with \(X\) and all future service roots.

Call this the **bi-causal reply system**.

An actual on-policy interval automatically induces such a system. Any proposed abstract exclusion theorem that drops (17) permits postponed-service laundering; any theorem that drops the earliest assignment in (16) permits post-blocker player laundering; and any theorem that separates (16) and (18) permits the same reply capacity to be counted twice.

---

# 11. Why the repaired system is not contradicted by the established results

The prefix Hall conditions are strong, but they do not by themselves yield sublinearity.

At a sparse time \(s=o(n)\), cumulative fixed-shell sparsity says that only \(o(n)\) roots in a fixed macroscopic interval have become minimal. Prefix Hall requires only

\[
s-o(n)
\]

service roots by time \(s\), and \(s=o(n)\) as well. These are compatible.

At a small fixed linear time \(s=cn\), the interval-blocker profile permits on the order of

\[
\frac{n}{\log(1/c)}
\]

available macroscopic minima. For small \(c\),

\[
\frac{1}{\log(1/c)}
\gg c.
\]

Hence this numerical supply can exceed the \(cn\) roots required by Hall.

The remaining missing theorem would have to use the joint condition (18) to show that this supply cannot be realized while simultaneously:

\[
\sum_{t<T}\Delta_t\le E,
\]

meeting every deadline (16), and keeping all the releasing replies legal.

That is exactly the chronological packet-capacity problem. None of the accepted statements bounds it.

---

# 12. Consequences for deeper shells

The new causal statements iterate formally.

For any fixed shell \(S_j\):

- every future greedy move has a target already live at all earlier times;
- under a minimal maximum-degree policy, every noninitial greedy root has a unique earlier Prolonger release time;
- the prefix and multiscale Hall equalities remain valid;
- every released root has a legal last ancestor dividing its releasing reply;
- every final-survivor divisor has an earliest Prolonger blocker.

The primitive packing estimate changes from \(n/8\) to the width of the lower board appropriate to \(S_j\), but the argument is identical.

What does not iterate is the required joint packet bound. In deeper shells, a last ancestor may be killed by a reply lying in any previously processed shell. Thus the family in the lcm in (18) has more available upward channels, not fewer.

So this repair is a localization theorem, not a finite-shell induction.

---

# 13. Implications of either eventual substantive resolution

A proof that no bi-causal system can be realized on the prescribed minimal-maximum-degree trajectory would establish \(\mathrm{FSC}(2,\eta)\) for that exact activation data and tie-break. It would not by itself prove \(L(n)=o(n)\); the analogous assertion would still be needed at every fixed shell depth.

An explicit Prolonger strategy realizing the bi-causal system for \(T\ge cn\) would disprove \(\mathrm{FSC}(2,\eta)\) for that exact policy. It would not imply that another Shortener policy fails. In particular, a batch-aware policy could play zero-current-deletion guard products that the literal greedy policy ignores.

It would also not imply

\[
L(n)=\Omega(n),
\]

because \(L(n)\) uses optimal Shortener play, not the prescribed greedy policy.

---

# Conclusion

The exact unconditional resolution available is:

\[
\boxed{
\begin{array}{l}
\text{The final-survivor reply-cover is not the sole chronological object.}\\[1mm]
\text{Every bad interval also obeys strict prefix and multiscale Hall laws}\\
\text{for the Prolonger release times of the actual greedy roots.}\\[1mm]
\text{Each reply carries one joint lcm packet containing both its}\\
\text{survivor blockers and the last ancestors of its service roots.}
\end{array}}
\]

Therefore the formulation “all burdens are now on Prolonger’s reply coverage” is incomplete. The exact additional collapse is postponed-service laundering.

After repairing it, the substantive dichotomy is still not decided by the supplied theorem stack:

\[
\boxed{
\text{neither a joint packet-capacity contradiction nor an on-policy
bi-causal Prolonger construction has been established.}
}
\]

Claiming impossibility would require a new bound on the cumulative mass released by the distinct-last-ancestor packets in (18). Claiming a construction would require realizing those packets nonanticipatingly while preserving the prefix Hall inequalities and the genuine greedy maxima.
## Attachment L (verbatim): the tri-causal repair — prime-quotient lemma, coatom-preparation obligations, distinct-blocker lemma, and the fixed-prime capacity bound

# Verdict

\[
\boxed{\text{The joint packet-capacity question, as stated, has another causal collapse.}}
\]

The two recorded causal systems are still not sufficient to characterize an on-trajectory interval. There is a third, strictly earlier causal layer:

\[
\boxed{\textbf{coatom preparation before root release}.}
\]

A reply \(p_j\) cannot be credited with releasing a future greedy root merely because it contains the root’s last legal ancestor. Before that last ancestor can exist, all divisor branches outside it must already have been killed, and those deaths have their own earlier Prolonger blockers.

This gives a twenty-second collapse family:

\[
\boxed{\textbf{ancestor-preparation laundering}.}
\]

I prove below:

1. every released root is a **prime lift** of its last legal ancestor;
2. it carries a family of earlier, pairwise-time-distinct coatom-blocking obligations;
3. those obligations must be inserted into the same reply packets;
4. the numerical Hall/deadline/lcm conditions stated in Attachment K admit a linear packet table which nevertheless cannot be an actual trajectory, precisely because these coatom obligations were omitted.

Thus the advertised dichotomy is not valid:

- excluding the displayed bi-causal tables is stronger than necessary and in fact false at the purely recorded-data level;
- constructing such a table does not produce an on-trajectory Prolonger strategy.

The exact repaired object is a **tri-causal reply system**. The argument does not prove or disprove the repaired second-shell exclusion.

---

# 1. The missing prime-lift theorem

Consider one actual reply \(p_j\), and suppose it first makes a future greedy root \(r\) minimal. Immediately before \(p_j\), let

\[
L_j(r)=
\{d:2\le d<r,\ d\mid r,\ d\text{ legal}\}.
\]

This set is nonempty because \(r\) is not yet minimal. Put

\[
\lambda_j(r)=\operatorname{lcm}L_j(r).
\]

Attachment K proves that

\[
\lambda_j(r)\mid p_j,\qquad
\lambda_j(r)<r,
\]

and that \(\lambda_j(r)\) is legal.

There is a further consequence.

## Lemma 1: prime-quotient lemma

For every genuinely released root \(r\),

\[
\boxed{\frac{r}{\lambda_j(r)}\text{ is prime}.}
\]

### Proof

Write

\[
\lambda=\lambda_j(r).
\]

Suppose \(r/\lambda\) were composite. Then there exists an integer \(a\) with

\[
1<a<\frac r\lambda
\]

such that

\[
e=\lambda a\mid r.
\]

Hence

\[
\lambda<e<r.
\]

Because \(\lambda\) is legal and

\[
\lambda\mid e\mid r,
\]

the legal-divisor upset theorem implies that \(e\) is legal. Thus \(e\in L_j(r)\).

But \(\lambda\) is the lcm of every member of \(L_j(r)\), so \(e\mid\lambda\), contradicting \(e>\lambda\).

Therefore \(r/\lambda\) is prime. \(\square\)

Consequently every release has the exact form

\[
\boxed{r=\lambda q,\qquad q\ \text{prime}.}
\tag{1}
\]

So the last-ancestor packet is not an arbitrary refinement packet. It is a prime-lift packet.

---

# 2. Every prime lift has earlier coatom obligations

Let

\[
r=\lambda q
\]

be as in (1). For each distinct prime \(\pi\mid r\), define the corresponding coatom

\[
c_\pi(r)=\frac r\pi.
\]

The coatom corresponding to \(q\) is

\[
c_q(r)=\frac rq=\lambda.
\]

All other coatoms lie outside the \(\lambda\)-branch.

## Lemma 2: off-branch coatoms are already illegal

For every distinct prime divisor \(\pi\mid r\) with \(\pi\ne q\),

\[
\boxed{c_\pi(r)=\frac r\pi
\text{ is illegal immediately before }p_j.}
\tag{2}
\]

### Proof

At the prime \(q\), the exponent of \(r\) is one greater than the exponent of \(\lambda\). If \(\pi\ne q\), then \(r/\pi\) retains the full \(q\)-exponent of \(r\). Therefore

\[
\frac r\pi\nmid\lambda.
\]

Every legal proper divisor of \(r\) divides \(\lambda\), by the definition of \(\lambda\). Hence \(r/\pi\) cannot be legal. \(\square\)

Thus the reply \(p_j\) does not create the entire minimality of \(r\) in one step. It only kills the final branch \(\lambda\). Every other coatom branch was killed earlier.

Under the minimal-maximum-degree policy, those earlier deaths are also causally oriented.

## Lemma 3: coatom blockers are earlier Prolonger replies

Suppose \(c_\pi(r)\) is legal at some Shortener position and later becomes illegal while \(r\) remains legal. Its first blocker is a Prolonger reply \(p_i\), and

\[
\boxed{c_\pi(r)\mid p_i.}
\tag{3}
\]

Moreover, if \(r\) is released by \(p_j\), then

\[
i<j.
\]

### Proof

A divisibility-minimal Shortener move cannot destroy a proper legal divisor of a surviving legal integer; this is exactly the noncreation lemma.

Hence the first move destroying \(c_\pi(r)\) is a Prolonger reply \(p_i\).

Since \(r\) survives and \(c_\pi(r)\mid r\), the orientation

\[
p_i\mid c_\pi(r)
\]

would imply \(p_i\mid r\), killing \(r\). Therefore

\[
c_\pi(r)\mid p_i.
\]

Finally, (2) says the coatom is already illegal immediately before \(p_j\), so its first blocker precedes \(p_j\). \(\square\)

There is also a within-root injectivity law.

## Lemma 4: distinct coatoms of one root require distinct replies

If \(\pi,\rho\) are distinct prime divisors of \(r\), then the first blockers of

\[
\frac r\pi
\quad\text{and}\quad
\frac r\rho
\]

cannot be the same selected move.

### Proof

If one move \(a\) were divisible by both coatoms, then

\[
\operatorname{lcm}\left(\frac r\pi,\frac r\rho\right)=r
\]

would divide \(a\). That would make \(r\) illegal. \(\square\)

Therefore a released root \(r=\lambda q\) has at least

\[
\boxed{\omega(r)-1}
\tag{4}
\]

distinct earlier coatom-blocking replies, except for coatoms already blocked before the active interval.

The true chronology is therefore

\[
\boxed{
\text{coatom preparation}
\quad<\quad
\text{last-ancestor release}
\quad<\quad
\text{greedy service}.
}
\tag{5}
\]

Attachment K records only the last two arrows.

---

# 3. The actual packet has three components

For a service root \(r=g_t\), write

\[
\gamma(t)=j
\]

for its release time and

\[
q_t=\frac{g_t}{\lambda_j(g_t)}.
\]

By Lemma 1, \(q_t\) is prime.

Define its off-branch coatom family

\[
\mathcal K(t)
=
\left\{
\frac{g_t}{\pi}:
\pi\mid g_t,\ \pi\text{ prime},\ \pi\ne q_t
\right\}.
\tag{6}
\]

For each \(c\in\mathcal K(t)\), let

\[
\beta_t(c)
\]

be its true first-blocker index, with \(\beta_t(c)=0\) when the blocker lies in the sparse entry history.

Then every actual trajectory satisfies

\[
\boxed{
\beta_t(c)<\gamma(t)<t.
}
\tag{7}
\]

For a reply \(p_j\), define the multiset of coatom obligations first served at \(j\):

\[
\mathcal P_j
=
\left\{
c\in\mathcal K(t):
\beta_t(c)=j
\right\},
\]

with the root label \(t\) retained as multiplicity data.

The genuine reply packet is therefore

\[
\boxed{
\operatorname{lcm}\left(
\mathcal B_j
\cup
\{\lambda_j(r):r\in\mathcal C_j\}
\cup
\mathcal P_j
\right)
\mid p_j\le n.
}
\tag{8}
\]

Here:

- \(\mathcal B_j\) contains survivor-divisor obligations;
- \(\lambda_j(r)\) contains last-ancestor release obligations;
- \(\mathcal P_j\) contains preparation obligations for future releases.

The third term cannot be reconstructed from the first two.

This is the exact missing repair.

---

# 4. A linear table satisfying all the recorded K-conditions

I now construct a linear numerical/arithmetic packet table satisfying:

- the degree ledger;
- the exact prefix Hall equality;
- a genuinely nonvacuous survivor deadline;
- the joint blocker/last-ancestor lcm containment;
- the constant-cap suffix;
- the future-service pressure;
- primitiveness of all declared selected moves.

Nevertheless, almost every declared root release is impossible because its omitted coatom remains legal.

This proves that the recorded K-data are not sufficient to define an on-trajectory system.

Choose

\[
c_0=10^{-7},
\qquad
m=\lfloor c_0n\rfloor.
\]

For sufficiently large \(n\), choose distinct odd integers

\[
b_2,\ldots,b_m\in
\left(\frac n{171},\frac n{170}\right]
\]

coprime to \(3\cdot5\cdot13\).

For \(2\le t\le m\), set

\[
\lambda_t=5b_t,
\qquad
g_t=10b_t,
\qquad
p_{t-1}=15b_t.
\tag{9}
\]

Give \(g_t\) two designated shell targets

\[
y_t=50b_t,
\qquad
z_t=70b_t.
\tag{10}
\]

Both lie in \(S_1\), since

\[
\frac{50}{171}n>\frac n4,
\qquad
\frac{70}{170}n<\frac n2.
\]

The declared service degree is

\[
\Delta_t=2
\qquad(2\le t\le m).
\tag{11}
\]

Take \(g_1=13\) as an initially minimal root, with

\[
\Delta_1=m+1.
\tag{12}
\]

The \(m+1\) designated targets for \(g_1\) can be chosen among multiples of \(13\) in \(S_1\), avoiding the finitely many forbidden multiples coming from (9)–(10).

## 4.1 The selected moves are primitive

All \(g_t\) lie in the narrow interval

\[
\left(\frac{10n}{171},\frac n{17}\right],
\]

and all \(p_t\) lie in

\[
\left(\frac{5n}{57},\frac{3n}{34}\right].
\]

Thus moves of the same type are pairwise incomparable.

For cross-comparability,

\[
\frac{p_i}{g_t}
=
\frac32\,\frac{b_{i+1}}{b_t}
\in
\left(
\frac32\frac{170}{171},
\frac32\frac{171}{170}
\right)
\subset(1,2).
\]

Hence no \(g_t\) divides a \(p_i\), and no \(p_i\) divides a \(g_t\).

Excluding multiples of \(13\) ensures compatibility with \(g_1\). Therefore the declared move sequence itself is primitive.

## 4.2 The intended service targets are preserved

For the matching index,

\[
g_t\mid y_t,\qquad g_t\mid z_t,
\]

while

\[
\frac{p_{t-1}}{g_t}=\frac32,
\qquad
\frac{y_t}{p_{t-1}}=\frac{10}{3},
\qquad
\frac{z_t}{p_{t-1}}=\frac{14}{3}.
\]

Hence the reply preserves \(g_t,y_t,z_t\).

For \(i\ne t\),

\[
\frac{y_i}{g_t}
=
5\frac{b_i}{b_t}
\in
\left(
5\frac{170}{171},
5\frac{171}{170}
\right).
\]

The only integer in this interval is \(5\), which would force \(b_i=b_t\). Thus \(g_t\) divides only its two designated targets. The same argument with \(7b_i/b_t\) applies to \(z_i\).

So the declared deletion sets are pairwise disjoint and have the stated sizes.

---

# 5. A nonvacuous survivor deadline

Take a formal survivor set \(X\) of size \(m\). Its initially legal incidence data contain:

- one common divisor \(d_\ast=3\) with
  \[
  k_X(3)=m;
  \]
- private persistent roots, each of incidence \(1\).

The survivor values themselves may, for example, be chosen as

\[
x_i=3c_i,
\qquad
c_i\in
\left(\frac{10n}{111},\frac n{11}\right],
\]

with the \(c_i\) distinct and avoiding the finitely many selected-move divisibilities. Then \(x_i\in S_1\), while \(c_i\) is a proper divisor of \(x_i\).

Declare \(p_1=15b_2\) to be the first blocker of \(3\). Since \(3\nmid b_2\),

\[
\operatorname{lcm}(3,\lambda_2)
=
\operatorname{lcm}(3,5b_2)
=
15b_2=p_1.
\tag{13}
\]

Set

\[
T=m,
\qquad
E=3m-1.
\]

Indeed,

\[
\sum_{t=1}^{m}\Delta_t
=
(m+1)+2(m-1)
=
3m-1
=
E.
\tag{14}
\]

The deadline for \(d_\ast=3\) is genuinely active. For \(s=1,2\),

\[
m\le\frac{3m-1}{s},
\]

but at \(s=3\),

\[
m>\frac{3m-1}{3}=m-\frac13.
\]

Thus the deadline demands a blocker with index \(<3\), and \(p_1\) supplies it.

All incidence-one persistent divisors have no deadline, because for every \(s\le m\),

\[
\frac Es
\ge
\frac{3m-1}{m}
>
1.
\]

So the recorded survivor deadline system is satisfied, nonvacuously.

---

# 6. Exact prefix Hall and packet containment

Declare

\[
g_1\in\mathcal M(A_1)
\]

and, for \(t\ge2\),

\[
\gamma(t)=t-1.
\]

Then for every prefix \(s\),

\[
|I(s)|=1
\]

and

\[
\sum_{j<s}|C_j(s)|=s-1.
\]

Hence

\[
\boxed{
s
=
|I(s)|
+
\sum_{j<s}|C_j(s)|
}
\]

holds exactly.

The multiscale Hall equalities also hold:

- \(g_1\) accounts for the only degree \(>2\) service;
- each later reply supplies exactly one degree-\(2\) root before its service.

For the packets:

- \(p_1\) contains both \(3\) and \(\lambda_2\);
- for \(j\ge2\),
  \[
  \lambda_{j+1}\mid p_j.
  \]

Thus every displayed joint blocker/release containment in Attachment K holds.

The final population size is

\[
|X|=m>\eta |S_1|
\]

for any fixed \(\eta<4c_0\).

Finally, for \(t\ge2\),

\[
\frac{|X|+T-t+1}{n/8-t+O(1)+o(n)}
\le
\frac{2m}{n/9}
=
18c_0+o(1)
<2=\Delta_t.
\]

So the future-service pressure is satisfied. There is a constant-cap suffix of length \(m-1\).

We have therefore produced a linear table satisfying every displayed numerical and packet condition used in the proposed capacity question.

---

# 7. Why the table cannot be an actual trajectory

For \(t\ge2\),

\[
g_t=10b_t,
\qquad
\lambda_t=5b_t,
\qquad
\frac{g_t}{\lambda_t}=2.
\]

The prime quotient is \(q_t=2\). Consider the coatom associated with the distinct prime \(5\):

\[
c_t=\frac{g_t}{5}=2b_t.
\tag{15}
\]

It does not divide \(\lambda_t=5b_t\). Consequently Lemma 2 says that \(c_t\) must already be illegal before the alleged release of \(g_t\).

But none of the recorded moves blocks it.

Every reply \(p_j=15b_{j+1}\) is odd, while \(c_t\) is even, so

\[
c_t\nmid p_j.
\]

For an earlier service move \(g_s=10b_s\),

\[
c_t\mid g_s
\quad\Longrightarrow\quad
2b_t\mid10b_s
\quad\Longrightarrow\quad
b_t\mid5b_s.
\]

Yet

\[
5\frac{b_s}{b_t}
\in
\left(
5\frac{170}{171},
5\frac{171}{170}
\right),
\]

whose only integer is \(5\). This would force \(b_s=b_t\), impossible for \(s\ne t\).

So no earlier listed move blocks \(c_t\).

Could the sparse entry history block all the \(c_t\)? No. Since

\[
c_t>\frac{2n}{171},
\]

one integer \(a\le n\) can be divisible by at most \(85\) distinct \(c_t\): if \(c_t\mid a\), then

\[
1\le\frac a{c_t}<\frac{171}{2},
\]

and each integer quotient determines at most one \(c_t\).

An entry position of size \(o(n)\) therefore blocks at most

\[
85\,o(n)=o(n)
\]

of the \(m=\Theta(n)\) coatoms.

For all but \(o(n)\) indices \(t\), the divisor \(c_t\) remains legal immediately after \(p_{t-1}\). Since

\[
c_t\mid g_t,
\]

the declared root \(g_t\) is not minimal.

Thus the claimed release events do not exist.

\[
\boxed{
\text{The linear table satisfies the recorded bi-causal data,
but violates the omitted coatom-preparation causality.}
}
\]

This is not a Prolonger strategy. It is a counterexample to the claim that the displayed bi-causal packet data are sufficient to characterize one.

---

# 8. Exact repaired abstraction

A schedule abstraction equivalent to an actual minimal-greedy interval must contain three first-event maps.

## Survivor side

For every initially legal divisor \(d\) incident with \(X\),

\[
\tau(d)=\min\{j:d\mid p_j\},
\]

with

\[
k_X(d)>\frac Es
\quad\Longrightarrow\quad
\tau(d)<s.
\]

## Release side

For every service root \(g_t\),

\[
\gamma(t)=0
\quad\text{or}\quad
\gamma(t)<t,
\]

and when \(\gamma(t)=j>0\),

\[
g_t=\lambda_j(g_t)q_t,
\qquad q_t\text{ prime}.
\]

## Preparation side

For every

\[
c=\frac{g_t}{\pi},
\qquad
\pi\mid g_t,\quad \pi\ne q_t,
\]

one must record a true first-blocker time

\[
\beta_t(c)<\gamma(t),
\]

or an identified pre-entry blocker.

For fixed \(t\), the blocker times of its distinct coatoms are distinct.

At every reply,

\[
\operatorname{lcm}\left(
\mathcal B_j
\cup
\{\lambda_j(r):\gamma(r)=j\}
\cup
\mathcal P_j
\right)
\mid p_j\le n.
\]

This is the correct **tri-causal reply system**.

The three chronological arrows are

\[
\boxed{
\beta
\;<\;
\gamma
\;<\;
t
}
\]

for preparation, release and service.

Dropping \(\beta<\gamma\) is ancestor-preparation laundering.

---

# 9. A genuine capacity inequality for the repaired system

The repair is not merely semantic. It yields an unconditional packet-capacity bound that handles arbitrary replies.

Fix \(\alpha>0\) and a constant \(Y\). Consider service roots

\[
g_t\ge\alpha n.
\]

For each such root, count the preparation coatoms corresponding to primes \(\pi\le Y\), excluding its release prime \(q_t\):

\[
\nu_Y(g_t)
=
\#\{\pi\le Y:\pi\mid g_t,\ \pi\ne q_t\}.
\]

## Proposition 5: fixed-prime preparation capacity

Every actual interval satisfies

\[
\boxed{
\sum_{t:g_t\ge\alpha n}\nu_Y(g_t)
\le
\frac{Y}{\alpha}\,E
+
O_\alpha\!\left(Y^2|A_1|\right).
}
\tag{16}
\]

Since \(|A_1|=o(n)\), the second term is \(o(n)\) for fixed \(Y\).

### Proof

A coatom corresponding to \(\pi\le Y\) has size

\[
c=\frac{g_t}{\pi}
\ge
\frac{\alpha n}{Y}.
\]

Consider a reply \(p_j\). The number of distinct divisors \(c\mid p_j\) satisfying \(c\ge\alpha n/Y\) is at most \(Y/\alpha\), because

\[
\frac{p_j}{c}\le\frac{Y}{\alpha}
\]

and each integer quotient determines at most one \(c\).

For a fixed such coatom \(c\), every future root assigned to \(c\) has a distinct future representative \(y_t\in Q_j\) divisible by \(c\). Therefore its multiplicity is at most

\[
\deg_{Q_j}(c)\le\Delta_j.
\]

Thus reply \(p_j\) serves at most

\[
\frac{Y}{\alpha}\Delta_j
\]

such preparation obligations.

Summing over replies gives

\[
\frac{Y}{\alpha}\sum_j\Delta_j
\le
\frac{Y}{\alpha}E.
\]

For a pre-entry move \(a\), there are at most \(Y/\alpha\) relevant large coatom divisors \(c\mid a\). For fixed \(c\), a root with coatom \(c\) has the form

\[
g=c\pi,\qquad \pi\le Y\text{ prime},
\]

so at most \(Y\) roots use that \(c\). Hence one entry move serves \(O_\alpha(Y^2)\) obligations. Summing over \(A_1\) proves (16). \(\square\)

This is a real cumulative reply-capacity theorem, and it makes no assumption about the shape of Prolonger’s replies beyond legality and \(p_j\le n\).

It does not alone exclude every \(c>0\): for fixed \(Y\), both sides of (16) can be linear with compatible constants. A full exclusion would need a multiscale version that remains effective when \(Y\) grows, together with control of low-coatom packets. That is a stronger problem than Attachment K’s bi-causal formulation.

---

# 10. Consequences

## Second shell

The packet-capacity target in the question is not yet equivalent to \(\mathrm{FSC}(2,\eta)\). The exact conclusion is

\[
\boxed{
\begin{array}{c}
\text{The displayed Hall, deadline and joint-lcm conditions are necessary}\\
\text{but not sufficient for an on-trajectory interval.}\\[1mm]
\text{A third, earlier coatom-preparation system is mandatory.}
\end{array}}
\]

The linear construction above is not a disproof of the greedy policy. It explicitly fails the repaired preparation requirements.

Conversely, proving that no **tri-causal** system is realizable would prove the desired second-shell exclusion for the fixed minimal-maximum-degree policy and its fixed activation data.

## Other Shortener policies

Nothing here proves failure of a batch-aware policy, nor even failure of the prescribed greedy policy. The coatom-first-blocker orientation uses the fact that Shortener plays divisibility-minimal maximum-degree moves. For a nonminimal maximum-degree policy, Shortener herself may participate in ancestor destruction, and the causal system must be changed.

## Deeper shells

The prime-quotient lemma, the coatom preparation obligations and the strict chronology

\[
\beta<\gamma<t
\]

iterate verbatim to every fixed deeper shell under the minimal policy.

They do not produce a finite-shell induction. In deeper shells, replies from every earlier processed shell may discharge coatom obligations, so the set of available upward channels is larger. The repaired packet theorem remains necessary, but its cumulative capacity becomes harder to bound.

## The game value \(L(n)\)

No conclusion about

\[
L(n)=o(n)
\]

or its negation follows. The result establishes a formulation failure and its exact repair, not a linear Prolonger strategy and not a second-shell clearing theorem.

---

# Final ruling

\[
\boxed{
\begin{array}{l}
\textbf{The joint packet-capacity question in Attachment K is REPAIRABLE.}\\[1mm]
\textbf{Its missing condition is pre-release coatom preparation.}\\[1mm]
\textbf{Every released root is a prime lift of its last ancestor.}\\[1mm]
\textbf{All other prime coatoms require distinct earlier Prolonger blockers.}\\[1mm]
\textbf{The correct object is tri-causal, with }\beta<\gamma<t.\\[1mm]
\textbf{The recorded bi-causal inequalities admit linear nontrajectory tables,}\\
\textbf{so they cannot by themselves prove the desired capacity bound.}
\end{array}}
\]

This is the twenty-second collapse: **ancestor-preparation laundering**.
## Attachment M (verbatim): the fourth causal layer — downward-shadow dichotomy, the death of multiscale aggregation, the Turán–Kubilius demand bound, the sharp packet, and the (SC) inequality with its sufficiency proof

# Verdict

\[
\boxed{\text{The multiscale preparation-capacity question is REPAIRABLE as stated.}}
\]

It contains a further causal collapse, distinct from postponed-service laundering and ancestor-preparation laundering:

\[
\boxed{\textbf{downward-shadow laundering}}
\]

or, equivalently,

\[
\boxed{\textbf{face-pressure laundering}.}
\]

The tri-causal record tracks

\[
\text{coatom preparation}<\text{root release}<\text{root service},
\]

but it does not track the common lower faces of many coatom channels assigned to the same reply. Those common faces create the following unavoidable dichotomy:

* if a common lower face is still legal, it forces a large current greedy degree;
* if it is already illegal, its own earlier first-blocker is a fourth causal obligation.

Thus the correct chronology is not merely

\[
\beta<\gamma<t,
\]

but, for packet shadows that were killed earlier,

\[
\boxed{\sigma<\beta<\gamma<t.}
\]

This defect is substantive. The fixed-\(Y\) capacity estimate in Attachment L is in fact weaker than a trivial consequence of the degree ledger, and its \(Y\)-loss is locally sharp even when every recorded coatom has multiplicity one. Therefore no summation, integration, or diagonal choice of \(Y\) applied only to that estimate can prove the desired exclusion.

I prove all of this below and give the exact repaired capacity theorem which would suffice for \(\mathrm{FSC}(2,\eta)\). I do not construct an on-policy linear Prolonger trajectory; the packet construction below is precisely prevented from being one by the missing shadow pressure.

---

## 1. The fixed-prime capacity estimate is dominated by the trivial ledger

Let the active interval have \(T\) Shortener turns. Because the phase is active, \(Q_t\neq\varnothing\), and some legal proper divisor of a current target has positive degree. Hence

\[
\Delta_t\ge 1
\qquad(1\le t\le T).
\]

The deletion sets of the greedy moves are disjoint and contained in the nonsurvivor set of size \(E\). Consequently,

\[
T\le \sum_{t=1}^T\Delta_t\le E.
\tag{1}
\]

For any \(Y\ge2\),

\[
\nu_Y(g_t)
\le \pi(Y),
\]

since \(\nu_Y(g_t)\) counts a subset of the primes at most \(Y\). Therefore

\[
\boxed{
\sum_{t:g_t\ge\alpha n}\nu_Y(g_t)
\le \pi(Y)T
\le \pi(Y)E.
}
\tag{2}
\]

But \(\alpha\le1/4\) in the macroscopic-root interval, and hence

\[
\pi(Y)E
\le YE
\le \frac{Y}{\alpha}E.
\tag{3}
\]

Thus the main term in Attachment L’s estimate

\[
\sum_{t:g_t\ge\alpha n}\nu_Y(g_t)
\le
\frac{Y}{\alpha}E
+
O_\alpha(Y^2|A_1|)
\tag{4}
\]

is weaker than the completely trivial bound (2).

This remains true under every nonnegative multiscale aggregation.

### Proposition 1: no positive summation of the fixed-\(Y\) bounds can help

For arbitrary scales \(Y_k\ge2\) and weights \(w_k\ge0\),

\[
\begin{aligned}
\sum_k w_k
\sum_{t:g_t\ge\alpha n}\nu_{Y_k}(g_t)
&\le
T\sum_k w_k\pi(Y_k)\\
&\le
E\sum_k w_k\pi(Y_k)\\
&\le
\frac E\alpha\sum_k w_kY_k.
\end{aligned}
\tag{5}
\]

The final expression is already at most the sum of the principal terms in (4). Hence integrating, summing dyadic scales, or choosing one slowly growing \(Y(n)\) does not extract any new capacity information from Proposition 5.

A valid multiscale theorem must therefore be a genuinely new **correlation inequality across scales and across replies**. It cannot be obtained by diagonalizing the fixed-\(Y\) estimates.

---

## 2. A linear root family really does carry \(n\log\log Y\) obligations

The preceding observation is not saying that the small-prime count is too weak. On the contrary, it has exactly the desired divergent lower bound.

Let \(\mathcal G\subseteq[\alpha n,\beta n]\) be any family with

\[
|\mathcal G|\ge\delta n,
\qquad
0<\alpha<\beta<1.
\]

Put

\[
\omega_Y(m)=\#\{p\le Y:p\mid m\}.
\]

For \(Y\to\infty\), the Turán–Kubilius estimate on a fixed macroscopic interval gives

\[
\sum_{\alpha n<m\le\beta n}
\left(
\omega_Y(m)-\sum_{p\le Y}\frac1p
\right)^2
=
O\!\left(n\log\log Y\right).
\tag{6}
\]

Since

\[
\sum_{p\le Y}\frac1p
=
\log\log Y+O(1),
\]

Chebyshev’s inequality implies

\[
\#\left\{
m\in[\alpha n,\beta n]:
\omega_Y(m)<\frac12\log\log Y
\right\}
=
O\!\left(\frac n{\log\log Y}\right)
=
o(n).
\tag{7}
\]

Consequently, every positive-density family \(\mathcal G\) satisfies

\[
\sum_{g\in\mathcal G}\omega_Y(g)
\ge
\left(\frac{\delta}{2}-o(1)\right)n\log\log Y.
\tag{8}
\]

Excluding the one release prime loses at most one count per root, so

\[
\boxed{
\sum_{g\in\mathcal G}\nu_Y(g)
\ge
\left(\frac{\delta}{3}-o(1)\right)n\log\log Y.
}
\tag{9}
\]

Thus the desired lower side genuinely diverges. The problem is that the fixed-prime upper side grows like \(Yn\), and

\[
Y\gg\log\log Y.
\]

The loss is not merely an inefficient proof artifact; a single reply can genuinely possess almost \(Y\) distinct large-coatom channels.

---

## 3. A sharp one-reply coatom packet

The next construction handles an arbitrary-shaped reply and shows where its hidden degree cost resides.

### Proposition 2: one reply can prepare \(\Theta(Y/\log Y)\) target-private small-prime coatoms

Let

\[
Y=Y(n)\longrightarrow\infty,
\qquad
Y\le\frac1{100}\log n.
\]

There exist

* one integer \(p\le n\);
* a prime \(\rho\le Y\);
* a family of roots \(g_h\in(n/8,n/4)\);
* targets \(y_h=2g_h\in S_1\);
* legal coatom candidates \(c_h=g_h/\rho\);

indexed by a set \(\mathcal H\) of

\[
|\mathcal H|=\Theta\!\left(\frac Y{\log Y}\right)
\]

primes, such that

\[
c_h\mid p
\qquad(h\in\mathcal H),
\tag{10}
\]

the roots and \(p\) are pairwise incomparable, and

\[
c_h\mid y_{h'}
\quad\Longleftrightarrow\quad
h=h'.
\tag{11}
\]

Thus every \(c_h\) has multiplicity one against the designated future targets, although one reply \(p\) blocks all of them simultaneously.

### Proof

Let

\[
L_Y=\operatorname{lcm}(1,2,\ldots,\lfloor Y\rfloor).
\]

Chebyshev’s estimate gives

\[
\log L_Y=(1+o(1))Y,
\]

so \(L_Y=n^{o(1)}\).

Choose a prime \(M\) in the interval

\[
\left(\frac{0.23n}{L_Y},\frac{0.24n}{L_Y}\right).
\]

Such a prime exists for all sufficiently large \(n\), since the interval has fixed positive relative width and \(n/L_Y\to\infty\). Put

\[
p=ML_Y.
\]

Then

\[
0.23n<p<0.24n.
\tag{12}
\]

Choose a prime

\[
0.44Y<\rho<0.46Y
\]

and let

\[
\mathcal H
=
\{h\text{ prime}:0.52Y<h<0.78Y\}.
\]

The prime number theorem gives

\[
|\mathcal H|
=
\Theta\!\left(\frac Y{\log Y}\right).
\tag{13}
\]

Every \(h\in\mathcal H\) divides \(L_Y\), so define

\[
c_h=\frac ph,
\qquad
g_h=c_h\rho=\frac{p\rho}{h},
\qquad
y_h=2g_h.
\tag{14}
\]

Since

\[
\frac{0.44}{0.78}
<
\frac{\rho}{h}
<
\frac{0.46}{0.52},
\]

we obtain

\[
0.129n<g_h<0.213n.
\]

Hence

\[
g_h\in(n/8,n/4)
\]

and

\[
y_h=2g_h\in(n/4,n/2)=S_1.
\]

Equation (10) is immediate.

The ratio

\[
\frac p{g_h}=\frac h\rho
\]

is a ratio of two distinct primes lying strictly between \(1\) and \(2\); it is therefore not an integer. Thus \(p\) and \(g_h\) are incomparable.

For distinct \(h,h'\),

\[
\frac{g_h}{g_{h'}}=\frac{h'}h,
\]

again a nonintegral ratio strictly between \(1/2\) and \(2\). The roots are pairwise incomparable.

Finally,

\[
\frac{y_{h'}}{c_h}
=
\frac{2p\rho/h'}{p/h}
=
\frac{2h\rho}{h'}.
\]

If \(c_h\mid y_{h'}\), the prime \(h'\) divides \(2h\rho\). But \(h'\) is distinct from \(2,h,\rho\), because

\[
h,h'>0.52Y,
\qquad
\rho<0.46Y.
\]

Therefore \(h'=h\). The converse is obvious. This proves (11). ∎

So a single reply has

\[
\Theta(Y/\log Y)
\]

different small-prime preparation channels even when every channel has target multiplicity one.

The factor \(Y\) in the fixed-prime proof is therefore locally sharp up to a logarithm.

---

## 4. The packet has a hidden common lower face

The preceding packet appears cheap only if one records the coatoms individually.

Let

\[
d
=
\gcd\{c_h:h\in\mathcal H\}.
\tag{15}
\]

Since the \(h\)’s are distinct primes dividing \(L_Y\),

\[
d
=
\frac{p}{\prod_{h\in\mathcal H}h}.
\tag{16}
\]

The denominator divides \(L_Y\), so \(d\) is an integer. Moreover,

\[
d\ge M>1.
\]

Every designated target satisfies

\[
d\mid c_h\mid y_h.
\]

Therefore, immediately before \(p\) is played, exactly one of the following must hold:

1. \(d\) is legal, in which case its degree against the designated future targets is at least
   \[
   |\mathcal H|
   =
   \Theta(Y/\log Y);
   \tag{17}
   \]
2. \(d\) is already illegal, in which case it has an earlier first-blocker.

The individual coatom multiplicities in (11) do not see this dichotomy.

This is the missing causal layer.

---

## 5. The fourth causal theorem

Consider an actual minimal-maximum-degree interval. Let \(p_j\) be a Prolonger reply. Let

\[
\mathcal O_j
\]

be the collection of preparation obligations first discharged by \(p_j\). An obligation \(e\in\mathcal O_j\) consists of

* a future service root \(g_e\);
* a prime \(\pi_e\mid g_e\);
* the coatom
  \[
  c_e=\frac{g_e}{\pi_e};
  \]
* a future representative target \(y_e\), with
  \[
  g_e\mid y_e.
  \]

The coatom \(c_e\) is legal immediately before \(p_j\), and

\[
c_e\mid p_j.
\]

The representatives \(y_e\) are distinct.

### Theorem 3: downward-shadow dichotomy

Let \(\mathcal U\subseteq\mathcal O_j\) be nonempty and put

\[
d_{\mathcal U}
=
\gcd\{c_e:e\in\mathcal U\}.
\]

Assume \(d_{\mathcal U}\ge2\). Then exactly one of the following holds:

\[
\boxed{
d_{\mathcal U}\text{ is legal at Shortener position }j
\quad\Longrightarrow\quad
|\mathcal U|\le\Delta_j;
}
\tag{18}
\]

or

\[
\boxed{
d_{\mathcal U}\text{ has a first Prolonger blocker strictly before }p_j.
}
\tag{19}
\]

In the second case, if \(\sigma(d_{\mathcal U})\) is the first-blocker index, then

\[
d_{\mathcal U}\mid p_{\sigma(d_{\mathcal U})}
\qquad\text{and}\qquad
\sigma(d_{\mathcal U})<j.
\tag{20}
\]

### Proof

Every future representative \(y_e\) is still a current target at Shortener position \(j\). Indeed, it survives until the later service of \(g_e\), and \(g_e\) is already a proper legal divisor at position \(j\).

If \(d_{\mathcal U}\) is legal at position \(j\), then

\[
d_{\mathcal U}\mid c_e\mid g_e\mid y_e
\qquad(e\in\mathcal U).
\]

Hence

\[
\deg_{Q_j}(d_{\mathcal U})\ge|\mathcal U|.
\]

Because \(g_j\) has maximum current degree,

\[
\Delta_j\ge|\mathcal U|,
\]

which proves (18).

Now suppose \(d_{\mathcal U}\) is illegal immediately before \(p_j\). It cannot have been first killed by the contemporaneous minimal Shortener move \(g_j\). The integer \(d_{\mathcal U}\) is a proper divisor of every surviving future root \(g_e\), and the noncreation lemma says that a minimal Shortener move cannot destroy such a divisor while the root survives.

Therefore its first blocker is either in the entry history or is a strictly earlier Prolonger reply.

If the first blocker is \(p_i\), then the orientation

\[
p_i\mid d_{\mathcal U}
\]

would imply \(p_i\mid g_e\), killing every relevant future root. Thus

\[
d_{\mathcal U}\mid p_i.
\]

Necessarily \(i<j\), proving (19)–(20). ∎

The resulting chronology is

\[
\boxed{
\text{shadow blocking}
\;<\;
\text{coatom blocking}
\;<\;
\text{root release}
\;<\;
\text{root service}.
}
\tag{21}
\]

In the notation of the attachments,

\[
\boxed{\sigma<\beta<\gamma<t.}
\]

Ancestor-preparation laundering concerned different coatoms of one root. Downward-shadow laundering concerns common divisors of coatoms belonging to many different roots in one reply packet. They are distinct defects.

---

## 6. Why the stated tri-causal record is not shadow-closed

The tri-causal data record, for every service root,

\[
\beta_t(c)<\gamma(t)<t
\]

for its off-branch coatoms \(c\).

But it does not record, for a packet such as \(\mathcal O_j\),

\[
\gcd(c_{e_1},c_{e_2}),
\quad
\gcd(c_{e_1},c_{e_2},c_{e_3}),
\quad\ldots
\]

or the first-blocker times of those lower shadows.

Consequently, the same formal packet can be interpreted in two incompatible ways:

* every coatom has individual multiplicity one, suggesting unit cost;
* their common legal shadow has degree \(K\), forcing
  \[
  \Delta_j\ge K.
  \]

Alternatively, if the common shadow was killed earlier, that earlier reply must be entered into the causal ledger.

A scalar condition

\[
\sum_j\Delta_j\le E
\]

does not identify which of these two cases occurred at any packet. Nor do the coatom first-blocker maps.

This is **face-pressure laundering**: the packet records only its maximal faces, while the degree cost is hidden in their downward intersection structure.

The local packet in Proposition 2 shows that this gap can be arbitrarily large:

\[
\text{individual coatom degree}=1,
\qquad
\text{common-shadow degree}
=
\Theta(Y/\log Y).
\]

Thus a claimed capacity theorem that assigns cost only through the coatom fibers is false locally. A valid global theorem must either charge the common legal shadows to \(\Delta_j\) or recursively charge their earlier blockers.

---

## 7. Exact repair: shadow-closed tri-causal systems

For each Shortener position \(j\), choose one representative

\[
y_t\in D_t
\]

for every future service turn \(t\ge j\), and put

\[
Z_j
=
X\cup\{y_t:t\ge j\}.
\tag{22}
\]

Every member of \(Z_j\) lies in \(Q_j\).

A repaired abstraction must include the following condition.

### Full face-pressure condition

For every currently legal \(d\),

\[
\boxed{
k_{Z_j}(d)
:=
|\{z\in Z_j:d\mid z\}|
\le\Delta_j.
}
\tag{FP}
\]

This is an immediate consequence of true maximum-degree play, but it is not a consequence of the terminal survivor deadlines or of the coatom capacities.

The causal version is stronger.

### Shadow-closure condition

For every reply \(p_j\), every nonempty subfamily \(\mathcal U\) of its coatom-preparation packet, and

\[
d_{\mathcal U}=\gcd\{c_e:e\in\mathcal U\}\ge2,
\]

one must record exactly one of:

\[
d_{\mathcal U}\text{ legal at }j,
\qquad
|\mathcal U|\le\Delta_j;
\tag{23}
\]

or

\[
\sigma(d_{\mathcal U})<j,
\qquad
d_{\mathcal U}\mid p_{\sigma(d_{\mathcal U})}.
\tag{24}
\]

If the blocker is pre-entry, it is charged to the frozen entry ledger.

Condition (24) must itself be subjected to the same analysis when one earlier reply is used to kill many such shadows. Hence the data form a finite causal directed acyclic graph, descending in divisibility and in time.

An equivalent local description is obtained by choosing, for every coatom \(c_e\), a divisibility-minimal legal support

\[
r_e\mid c_e
\]

immediately before \(p_j\). Then

\[
r_e\mid p_j,
\qquad
r_e\mid y_e,
\]

and every support fiber satisfies

\[
\boxed{
|\{e:r_e=r\}|\le\Delta_j.
}
\tag{25}
\]

The distinct supports form an antichain. Their own first-minimal histories must then be included. These “channel roots” need not ever be selected by Shortener; that is why the service-root Hall ledger alone does not count them.

Call the resulting object a **shadow-closed tri-causal reply system**.

---

## 8. The genuinely sufficient growing-\(Y\) theorem

The correct capacity target is not a \(Y E\) estimate. It must remove the \(Y\)-loss after all live-shadow degree charges and earlier-shadow blockers have been accounted for.

A clean sufficient formulation is the following.

### Shadow-closed uniform preparation capacity

For every fixed \(\alpha>0\), there exists a constant \(C_\alpha\) such that, for some uniformly chosen \(Y_n\to\infty\),

\[
\boxed{
\sum_{t:g_t\ge\alpha n}\nu_{Y_n}(g_t)
\le
C_\alpha E
+
o\!\left(n\log\log Y_n\right)
}
\tag{SC}
\]

for every realized shadow-closed bad interval.

The entry contribution must satisfy

\[
o\!\left(n\log\log Y_n\right).
\]

The accepted uniform \(o(n)\) activation allows \(Y_n\) to be fixed before Prolonger is quantified. If

\[
a_n
=
\sup_\sigma |A_1(\sigma)|=o(n),
\]

one may, for example, take

\[
Y_n
=
\min\left\{
\left(\frac{n}{a_n+1}\right)^{1/5},
\exp\!\sqrt{\log\log n}
\right\}.
\tag{26}
\]

Then

\[
Y_n\to\infty
\]

and

\[
Y_n^2a_n=o(n).
\tag{27}
\]

Thus the known pre-entry term \(O_\alpha(Y_n^2a_n)\) would be negligible.

### Proposition 4: (SC) excludes every linear tail

Assume (SC). Then no active interval with \(T\ge cn\) exists.

### Proof

A linear tail supplies constants \(\alpha,\delta>0\) and at least

\[
\delta n-o(n)
\]

distinct service roots in

\[
[\alpha n,n/4].
\]

By (9),

\[
\sum_{t:g_t\ge\alpha n}\nu_{Y_n}(g_t)
\ge
\left(\frac{\delta}{3}-o(1)\right)
n\log\log Y_n.
\tag{28}
\]

On the other hand, (SC) and \(E\le n/4\) give

\[
\sum_{t:g_t\ge\alpha n}\nu_{Y_n}(g_t)
\le
\frac{C_\alpha}{4}n
+
o\!\left(n\log\log Y_n\right).
\tag{29}
\]

Since

\[
\log\log Y_n\to\infty,
\]

the \(O(n)\) term in (29) is

\[
o\!\left(n\log\log Y_n\right),
\]

contradicting (28). ∎

So (SC) is precisely of the right scale: a \(Y\)-independent multiple of the degree ledger suffices, while the current \(YE\) estimate is tautological.

---

## 9. Why Proposition 2 does not give a Prolonger strategy

The one-reply packet is a genuine legal arithmetic packet, and it handles arbitrary replies. But it is not a greedy-game counterexample.

Its common shadow \(d\) forces the exact dichotomy:

\[
d\text{ legal}
\quad\Longrightarrow\quad
\Delta_j\ge\Theta(Y/\log Y);
\]

or

\[
d\text{ illegal}
\quad\Longrightarrow\quad
\text{an earlier reply paid for }d.
\]

Therefore the packet cannot simply be repeated while assigning unit degree to every turn. Doing so would be precisely the newly identified laundering.

The construction proves that:

* no per-reply bound based only on the number of large coatom divisors can have a constant independent of \(Y\);
* no summation of the fixed-\(Y\) capacities can prove exclusion;
* the missing theorem must recursively use lower-shadow legality and first-blocker chronology.

It does **not** produce a trajectory on which the prescribed greedy move is the intended private root.

---

## 10. Deeper shells

The downward-shadow theorem itself iterates verbatim.

For a fixed deeper shell \(S_j\), every preparation coatom still divides a future representative, and every common legal shadow still forces current maximum degree. If the shadow is illegal, its first upward blocker is earlier.

Thus the four-level chronology

\[
\sigma<\beta<\gamma<t
\]

is valid at every fixed depth.

What does not automatically iterate is the uniform capacity inequality (SC). In \(S_j\), a shadow may have been blocked by a reply lying in any of

\[
S_0,S_1,\ldots,S_{j-1},
\]

as well as by a lower off-shell reply. The repaired ledger must therefore retain the source-shell label of every shadow blocker. A depth-\(J\) theorem would need a bound of the form

\[
\sum\nu_Y(g_t)
\le
C_{\alpha,J}E
+
o(n\log\log Y),
\]

uniform over all those upward channels.

Nothing proved here supplies that bound. Earlier processed shells enlarge the packet space, so the second-shell argument would not by itself constitute a finite-shell induction.

---

# Final ruling

\[
\boxed{
\begin{array}{l}
\textbf{The fixed-prime capacity estimate is wholly dominated by }T\le E.\\[1mm]
\textbf{No nonnegative multiscale summation of it can yield a contradiction.}\\[1mm]
\textbf{A single reply can carry }\Theta(Y/\log Y)\textbf{ target-private}\\
\textbf{small-prime coatom channels.}\\[1mm]
\textbf{Those channels possess common lower shadows which either force}\\
\textbf{large current degree or require still earlier blockers.}\\[1mm]
\textbf{The omitted fourth layer is downward-shadow/face-pressure causality.}\\[1mm]
\textbf{The exact repair is a shadow-closed tri-causal system satisfying (FP).}\\[1mm]
\textbf{A uniform shadow-closed bound (SC) would immediately prove}\\
\textbf{the second-shell capped-tail exclusion.}
\end{array}}
\]

Accordingly, the proposed multiscale theorem has not been proved, and the packet construction is not an on-trajectory Prolonger strategy. The rigorous resolution is that the advertised tri-causal capacity object is still incomplete: it permits **downward-shadow laundering**, a twenty-third collapse family. After repairing that defect, the remaining substantive problem is exactly the \(Y\)-independent shadow-closed capacity inequality (SC), not a growing-\(Y\) summation of the fixed-prime estimate.
## Attachment N (verbatim): the chronology-safe L^s first-death ledger and the multi-service packet obstruction

## Verdict

I do **not** obtain a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]

The supplied results reduce the problem to a genuine chronological obstruction, and the natural new capacity estimate I can prove below is not strong enough to resolve it. In particular, it yields a true lifetime ledger, rather than another invalid snapshot charge, but its total capacity over a linear tail is still \(\Theta(n)\). A single reply can also simultaneously perform several of the required causal services, so no pointwise “one reply, one obligation” strengthening is possible.

What follows is the strongest rigorous conclusion I can presently derive.

---

# 1. A rigid coatom-release lemma

Let \(r\) be legal and nonminimal immediately before a move \(p\), and suppose that after \(p\) is selected:

1. \(r\) remains legal; and
2. \(r\) becomes minimal legal.

Then there is a **unique** prime \(q\mid r\) such that the coatom
\[
\lambda=\frac rq
\]
was legal immediately before \(p\), and necessarily
\[
\lambda\mid p.
\]

### Proof

Because \(r\) was nonminimal, it had a legal proper divisor \(e\). Choose a prime \(q\mid r/e\). Then
\[
e\mid \frac rq\mid r.
\]
The legal divisors of a legal integer form an upper ideal, so \(r/q\) was legal. Thus at least one legal coatom existed.

Every such legal coatom becomes illegal after \(p\). Since \(r\) remains legal, \(p\nmid r\). Consequently \(p\) cannot divide a coatom \(r/q\), because then \(p\mid r\). Therefore each formerly legal coatom must divide \(p\).

But two distinct coatoms have least common multiple \(r\):
\[
\operatorname{lcm}\!\left(\frac r{q_1},\frac r{q_2}\right)=r
\qquad(q_1\ne q_2).
\]
If two distinct coatoms divided \(p\), then \(r\mid p\), contradicting the legality of \(r\) after \(p\). Hence exactly one coatom was legal, and it divides \(p\). ∎

This sharpens the general “last legal ancestor” description: every one-move release is a **prime-coatom release**.

---

# 2. A chronology-safe \(L^s\) first-death ledger

Fix a set
\[
X\subseteq \left(\frac n4,\frac n2\right]
\]
that stays legal throughout an interval of play. For every pair \((x,d)\), where \(x\in X\) and \(d\mid x\), \(d<x\), suppose \(d\) becomes illegal during the interval. Charge \((x,d)\) to the **first** selected move \(a\) making \(d\) illegal.

Then, for every fixed \(s>2\), there is a constant \(C_s\), independent of \(n\), the history, and \(X\), such that every actual move \(a\) receives total charge at most \(C_s\) under the weighting
\[
w(x,d)=\left(\frac d x\right)^s.
\]

Consequently, over any interval containing \(m\) actual moves,
\[
\boxed{\quad
\sum_{\substack{x\in X,\ d\mid x,\ d<x\\
d\text{ first dies in the interval}}}
\left(\frac d x\right)^s
\le C_s m.
\quad} \tag{2.1}
\]

### Proof

Let \(a\) be the first move making \(d\) illegal. Since \(x\) remains legal, it is impossible that \(a\mid d\), because then
\[
a\mid d\mid x,
\]
which would make \(x\) illegal. Hence
\[
d\mid a.
\]

For fixed \(a\), its total charge is therefore at most
\[
\sum_{\substack{d\mid a\\d\le n/4}}
\ \sum_{\substack{q\ge2\\n/4<dq\le n/2}}
q^{-s},
\]
because \(x=dq\) and \(d/x=1/q\).

Put \(Y=n/(4d)\ge1\). For \(s>1\),
\[
\sum_{q>Y}q^{-s}
\le
\left(1+\frac1{s-1}\right)Y^{\,1-s}.
\]
It follows that the charge to \(a\) is at most
\[
c_s\sum_{d\mid a}\left(\frac{4d}{n}\right)^{s-1}
=
c_s4^{s-1}n^{1-s}\sum_{d\mid a}d^{s-1}.
\]
Writing \(d=a/e\),
\[
\sum_{d\mid a}d^{s-1}
=
a^{s-1}\sum_{e\mid a}e^{-(s-1)}
\le
a^{s-1}\zeta(s-1).
\]
Since \(a\le n\),
\[
\text{charge}(a)
\le
c_s4^{s-1}\zeta(s-1)=:C_s.
\]
Summing over the \(m\) first-owner moves proves (2.1). ∎

This is a genuine lifetime estimate:

* it uses first deaths, so there is no redundant rewitnessing;
* one divisor cannot be charged repeatedly;
* it remains valid through arbitrary later refinements;
* it does not use the invalid instantaneous-to-lifetime promotion;
* it also covers the direct-ancestor orientation that escapes the atomic \(\kappa(F)\mid c\) ledger.

---

# 3. What the ledger proves about large released roots

Suppose a family \(\mathcal R\) of newly minimal roots lies in
\[
[\alpha n,n/4]
\]
for fixed \(\alpha>0\), and give each \(r\in\mathcal R\) a distinct witness
\[
x_r\in X,\qquad r\mid x_r.
\]

Such distinct witnesses are available for:

* future greedy roots, using the distinct future-service targets; and
* final persistent roots, after assigning one distinct survivor to each root.

Fix \(K\). If \(r\) has a prime factor \(\ell\le K\), then the coatom
\[
d=\frac r\ell
\]
must have died no later than the time \(r\) became minimal. Moreover,
\[
\frac d{x_r}
=
\frac r{\ell x_r}
\ge
\frac{2\alpha}{K},
\]
because \(x_r\le n/2\).

Thus (2.1) implies
\[
\#\{r\in\mathcal R:P^-(r)\le K\}
\le
C_{s,\alpha}K^s m. \tag{3.1}
\]

The \(K\)-rough exceptional roots in a fixed linear interval number
\[
O_\alpha\!\left(\frac n{\log K}\right).
\]
Hence
\[
|\mathcal R|
\le
C_{s,\alpha}K^s m
+
O_\alpha\!\left(\frac n{\log K}\right). \tag{3.2}
\]

This recovers cumulative fixed-shell sparsity when \(m=o(n)\), by first fixing \(K\) large and then letting \(m/n\to0\).

But for a proposed tail with \(m\asymp n\), (3.2) only says
\[
|\mathcal R|=O(n).
\]
That is exactly the scale already forced by Hall release and persistent-root counting. There is no contradiction.

---

# 4. A local bi-causal packet showing why pointwise capacity fails

The failure is not merely a poor choice of constants. One reply can genuinely perform several required services at once.

Take \(m\) coprime to \(30\), and consider the numbers
\[
r_{\rm future}=2m,\qquad
r_{\rm persistent}=5m,\qquad
p=3m,
\]
together with targets
\[
y=22m,\qquad x=35m.
\]

After a harmless rescaling, both \(x,y\) can lie in the second shell and all three of \(2m,3m,5m\) below \(n/4\). They satisfy

\[
2m\mid22m,\qquad
5m\mid35m,
\]
but
\[
2m\nmid35m,\qquad
3m\nmid22m,\qquad
3m\nmid35m.
\]

Assume that, before \(p=3m\) is played:

* \(m\) is legal;
* every other proper divisor needed to make \(2m\) and \(5m\) minimal has already been blocked.

Then playing \(3m\):

1. first-blocks the survivor-incident divisor \(m\mid35m\);
2. releases \(2m\), which may be the root of a future greedy move killing \(22m\);
3. releases \(5m\), which may remain as the persistent root of \(35m\).

Thus one reply simultaneously supplies

\[
\text{deadline service}
+
\text{future-root release}
+
\text{persistent-root release}.
\]

This is only a local packet, not an on-policy Prolonger construction: preparing the alternate coatoms, doing so chronologically, and surviving the greedy degree ledger are precisely the unresolved tasks. But it proves that any inequality of the form

\[
\text{number of services performed by }p_j\le1+o(1)
\]

is false even locally. A successful capacity theorem must amortize the **preparation history** of such packets.

---

# 5. Why this does not prove \(L(n)=o(n)\)

A linear second-shell tail requires two simultaneous streams.

First, the prefix Hall equality forces essentially one newly released future greedy root per reply:
\[
\#\{\text{future greedy roots released before }s\}
\ge s-o(n).
\]

Second, the final survivor population forces a linear family of persistent roots. These too must mostly be released by Prolonger replies.

The ledger above charges every such release to genuine, chronologically earlier first deaths. But over \(T=cn\) replies its right side is
\[
C_sT=\Theta(n),
\]
while the combined release demand is also only \(\Theta(n)\). The local packet shows that the two streams can share a reply and can share preparation.

Therefore the ledger does **not** imply an overload such as
\[
\text{required causal service}
>
\text{available reply capacity}.
\]

To close the upper route, one still needs a genuinely joint historical inequality saying, roughly, that after accounting for the preparation needed to create multi-release packets, a sequence of \(T\) replies cannot simultaneously:

\[
\begin{aligned}
&\text{discharge every survivor deadline,}\\
&\text{release }T-o(n)\text{ future greedy roots,}\\
&\text{and create a linear persistent-root family,}
\end{aligned}
\]
while keeping the maximum-degree area
\[
\sum_{t<T}\Delta_t\le |S_1|
\]
and all final survivors incomparable with every selected move.

Conversely, a disproof must exhibit an actual Prolonger strategy that realizes exactly such a prepared packet schedule against **arbitrary** Shortener replies—not merely a static primitive configuration or a trajectory defeating one heuristic policy.

---

# Conclusion

The unconditional statement
\[
L(n)=o(n)
\]
is not resolved by the supplied results, and the chronology-safe extension above does not resolve it either.

The new \(L^s\) first-death ledger shows that direct-ancestor preparation does admit a legitimate lifetime accounting. Its exact limitation is decisive: it gives only linear total capacity over a linear interval, and bi-causal packets can use that capacity simultaneously for deadline discharge and both kinds of root release. The missing result remains a **joint, preparation-sensitive packet-capacity theorem**, or an on-trajectory construction refuting one. Any claimed unconditional proof that skips that step is incomplete; any claimed linear lower bound that supplies only the arithmetic schedule but not the arbitrary-reply Prolonger strategy is also incomplete.
REMEMBER - this argument may require non-trivial, creative and novel elements; both directions are valuable, and the proof must handle arbitrary replies.
