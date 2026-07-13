Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Two independently derived reductions below (Attachments G and H) identify the same open chronological object from two sides. Resolve it: prove the persistent-root deadline statement, or construct the postponed-refinement schedule that refutes it.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Attachment A defines, for fixed \(J\ge1\) and \(0<\eta<1\), the finite-shell clearing statement \(\mathrm{FSC}(J,\eta)\) (process dyadic shells \(S_j=(n/2^{j+1},n/2^j]\) in order after an \(o(n)\)-move prelude; while \(|Q_j(A)|>\eta|S_j|\), where \(Q_j\) is the live nonminimal shell population, play a currently legal lower element maximizing deletions from \(Q_j\); every turn counted; a fixed prefix-measurable tie-break) and proves: if \(\mathrm{FSC}(J,\eta)\) holds for every fixed \(J\) and \(\eta\), then \(L(n)=o(n)\) — deep shells are controlled by total size, so no growing-depth estimate is needed. Attachment B PROVES \(\mathrm{FSC}(1,\eta)\) for every fixed \(0<\eta<1\) (degree availability plus a disjointness bootstrap), and localizes the obstruction to the second shell: a previously chosen \(a\in(n/2,n]\) can satisfy \(d\mid a\) with \(a\) incomparable to a target \(x\in S_1\), killing the lower move \(d\) without killing \(x\) — external blockers absent from any rescaled smaller board.

The two faces of the target:

(i) Scheduling face (Attachment G, exact equivalence): the repaired second-shell clearing statement FSC(2,η) — equivalently, T_1(n)=o(n) uniformly for the active second-shell greedy phase — holds if and only if there is NO time-ordered primitive multiple-cover schedule: a Prolonger-forced play in which, for a tail of T ≥ cn active turns from a sparse position B with survivor set X = Q_1 at the end (|X| > (η/4+o(1))n), every divisor d legal at B with k_X(d) > |S_1|/s divides one of the Shortener-selected moves among the first s turns (for every 1 ≤ s ≤ T), while every member of X stays incomparable to every selected move. The linear persistent root family (|R| ≥ (ηc−o(1))n minimal roots legal throughout the tail) and the survivor deadline k_X(d) ≤ 1/(4c)+o(1) are proven and available.

(ii) Cone face (Attachment H, conditional theorem): if for some T=o(n), H→∞ with TH^s/n→∞ the shallow quotient cone C_T(H) = {mq : m ever-minimal during the prefix, 1≤q≤H} stays o(n) uniformly over prefixes of ≤ 2T+1 moves, then L(n)=o(n) outright via the d^{-s} hazard policy. The known counter-profile to proving the hypothesis: Θ(n/G) roots concentrated at scale n/G, each carrying Θ(G) quotients — mass that migrates to deeper shells as n grows.

These are the same question: can Prolonger keep re-rooting a linear target population through moving-scale quotient cones (postponing final refinement past the sparse regime, meeting every prefix deadline), or must Θ(n) cone mass convert to Θ(n) direct deletions, exact plays, or irreversible transfers to the minimal bank within o(n) moves? Prove one side. A proof of the exclusion proves FSC(2,η) (state whether it iterates to deeper shells); a construction realizing the schedule refutes the weakest known sufficient route (state exactly what it shows about other policies and L(n)). Formulation caution: nineteen degenerate-collapse families are catalogued in the record; if either face still hides one, proving THAT with the exact repair is a valuable resolution.

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

## Attachment G (verbatim): the equivalence, persistent root family, and the time-ordered multiple-cover schedule characterization

# Verdict

\[
\boxed{\text{I do not have a valid proof or disproof of the repaired }\mathrm{FSC}(2,\eta).}
\]

The positive-threshold repair in Attachment E closes the previously identified activation loophole. I also do not find a new degenerate witness among the stated quantifiers. In fact, the repaired capped-tail exclusion is exactly equivalent to the substantive second-shell clearing assertion, not merely a consequence of it.

What can be proved is a stronger necessary normal form than the one in Attachment E: a prohibited tail would contain a **linear persistent family of final legal roots already legal at the sparse entry time**, together with a precise time-ordered multiple-cover schedule for all of their coatoms. That sharpening still stops at the direct-ancestor phenomenon. Supplying a positive or negative conclusion beyond it would require asserting an unproved chronological covering theorem.

## 1. The repaired exclusion is exactly \(\mathrm{FSC}(2,\eta)\)

Fix all activation data in advance:

\[
0<\eta _0<\eta/2,
\]

the trapping prelude and its stopping rule, the top-phase stopping rule, and the prefix-measurable tie-break. Assume uniformly that the prelude and top phase use \(o(n)\) actual moves.

Let \(T_1(n)\) be the number of Shortener turns in the active second-shell phase.

### Proposition 1

The repaired capped-tail exclusion holds if and only if

\[
T_1(n)=o(n)
\]

uniformly against Prolonger.

### Proof

One direction is immediate: a prohibited witness supplies at least \(c n_k\) active second-shell turns, so \(T_1(n_k)\not=o(n_k)\).

Conversely, suppose \(\mathrm{FSC}(2,\eta)\) fails. Then for some Prolonger strategies, some \(c>0\), and some sequence \(n_k\to\infty\),

\[
T_1(n_k)\ge c n_k.
\]

Take \(b_k\) to be the beginning of the second-shell phase. Uniform \(o(n)\) activation gives

\[
|A_{b_k}|=o(n_k).
\]

The phase is active at \(b_k\), so

\[
|Q_1(A_{b_k})|>\eta |S_1|.
\]

Now simply take

\[
H(n_k)=n_k.
\]

Since every second-shell degree is at most

\[
|S_1|\le n_k,
\]

both the entry degree and all subsequent degrees are at most \(H(n_k)\), and \(H(n_k)\to\infty\). The next \(c n_k\) Shortener turns occur while the phase remains active. Thus the repaired forbidden witness exists.

Hence the two assertions are equivalent. \(\square\)

The freedom to take \(H(n)=n\) is therefore not a vacuity: it deliberately makes the exclusion capture every linear phase. The cap-entry theorem then shows that the same failure can additionally be normalized to an arbitrarily slowly growing cap after \(o(n)\) turns.

## 2. Persistent final roots

Assume, for contradiction, that a prohibited tail exists. Fix one \(n\) in the sequence, suppress subscripts, and let

\[
B=A_b
\]

be its sparse entry position. Follow exactly

\[
T\ge cn
\]

active Shortener turns, including the intervening Prolonger replies, and let \(C\) be the resulting position. Put

\[
X=Q_1(C).
\]

Because the phase is still active,

\[
|X|>\eta |S_1|
   =\left(\frac{\eta}{4}+o(1)\right)n.
\tag{1}
\]

For a lower integer \(d\), write

\[
k_X(d)=|\{x\in X:d\mid x\}|.
\]

Every member of \(X\) was present throughout the interval: legality and membership in \(Q_1\) never regenerate.

### Lemma 2: persistent-incidence bound

If \(d\) is legal at every Shortener position in the \(T\)-turn interval, then

\[
T\,k_X(d)\le |S_1|.
\tag{2}
\]

Consequently,

\[
k_X(d)\le \frac1{4c}+o(1).
\tag{3}
\]

### Proof

At every one of the \(T\) Shortener positions,

\[
X\subseteq Q_1(A_t).
\]

If \(d\) is legal there, then all \(k_X(d)\) final survivors divisible by \(d\) are current \(Q_1\)-targets. Hence

\[
\Delta_t\ge k_X(d).
\]

The monotone-degree ledger gives

\[
\sum_{t<T}\Delta_t\le |S_1|.
\]

Therefore

\[
T k_X(d)
 \le \sum_{t<T}\Delta_t
 \le |S_1|,
\]

which proves (2). Since \(T\ge cn\) and \(|S_1|=n/4+O(1)\), (3) follows. \(\square\)

Now choose, for every \(x\in X\), a divisibility-minimal legal divisor at the final position:

\[
\rho(x)\in\mathcal M(C),\qquad \rho(x)\mid x.
\]

Because \(\rho(x)\) is legal at \(C\), it was legal at every earlier time, including \(B\). Thus Lemma 2 applies to every distinct value of \(\rho(x)\).

### Corollary 3: a linear persistent root family

There is a set

\[
\mathcal R\subseteq\mathcal M(C)
\]

such that every \(r\in\mathcal R\) was legal throughout the entire tail and

\[
|\mathcal R|
 \ge
 \frac{|X|}{\,1/(4c)+o(1)}
 =
(\eta c-o(1))n.
\tag{4}
\]

### Proof

The fibers of \(x\mapsto\rho(x)\) have size at most \(1/(4c)+o(1)\) by Lemma 2. Combine this with (1). \(\square\)

This is stronger than the charged-root result in Attachment E. There are two different linear root populations in a counterexample:

1. at least \(cn\) roots that are minimal immediately before their respective Shortener turns and are then killed;
2. at least \((\eta c-o(1))n\) **final roots** that survive and were legal already at the sparse entry position.

The second family cannot be dismissed as roots generated only after the position has become dense.

## 3. Why the persistent family does not contradict static completion

At the sparse position \(B\),

\[
|B|=o(n),
\qquad
|\mathcal M(B)|=o(n).
\]

Each \(r\in\mathcal R\) has some minimal legal ancestor at \(B\):

\[
\sigma_B(r)\in\mathcal M(B),
\qquad
\sigma_B(r)\mid r.
\]

Likewise, each \(x\in X\) has a minimal legal ancestor in \(\mathcal M(B)\). Since the entry degree is at most \(H\), any one such ancestor divides at most \(H\) members of \(X\). Therefore only

\[
|\mathcal M(B)|
 \ge \frac{|X|}{H}
 \ge
 \left(\frac{\eta}{4}+o(1)\right)\frac nH
\tag{5}
\]

is forced.

That is compatible with static completion. The theorem gives merely

\[
|\mathcal M(B)|=o(n),
\]

and \(n/H=o(n)\) because \(H\to\infty\). A contradiction would require

\[
|\mathcal M(B)|=o(n/H),
\]

which is precisely the unavailable rate. Thus the linear family \(\mathcal R\) may begin as descendants of only \(n/H\) initial roots and be separated chronologically as those roots are blocked.

The persistent-root refinement therefore does not repair the rate mismatch identified in Attachment F.

## 4. The exact time-ordered coatom-cover condition

The persistent roots produce a particularly clean version of the blocker-scheduling problem.

Fix \(r\in\mathcal R\). Since \(r\) is minimal legal at \(C\), every proper divisor of \(r\) is illegal at \(C\). In particular, for every prime \(p\mid r\), put

\[
d_{r,p}=\frac rp.
\]

If \(d_{r,p}\) was legal at \(B\), let \(\tau(r,p)\) be the first move during the tail that makes it illegal. Let that selected move be \(a_{r,p}\).

Because \(r\) survives legally to \(C\), the blocking orientation must be

\[
d_{r,p}\mid a_{r,p},
\qquad
r\nmid a_{r,p}.
\tag{6}
\]

The opposite orientation \(a_{r,p}\mid d_{r,p}\) would imply \(a_{r,p}\mid r\), making \(r\) illegal.

Moreover, immediately before \(a_{r,p}\) is played, \(d_{r,p}\) is legal. Consequently every final survivor divisible by \(d_{r,p}\) contributes to the current greedy degree until that deadline.

### Lemma 4: exact survivor deadline

If \(d\) is legal at \(B\) and divides \(k_X(d)\) final survivors, then it must be blocked by the first

\[
\frac{|S_1|}{k_X(d)}
\tag{7}
\]

Shortener positions of the interval.

Equivalently, after the first \(s\) Shortener turns, every initially legal divisor satisfying

\[
k_X(d)>\frac{|S_1|}{s}
\tag{8}
\]

must divide one of the moves selected during those first \(s\) turns.

### Proof

If \(d\) remained legal for \(s\) Shortener positions, then

\[
\Delta_t\ge k_X(d)
\]

at each of them. Hence

\[
s\,k_X(d)
 \le \sum_{t<s}\Delta_t
 \le |S_1|.
\]

This proves (7) and (8). \(\square\)

Thus a counterexample is equivalent to a time-ordered primitive multiple-cover schedule satisfying, simultaneously,

\[
\left\{
d:k_X(d)>\frac{|S_1|}{s}
\right\}
\cap\mathcal L(B)
\subseteq
\bigcup_{\substack{a\text{ selected}\\\text{by time }s}}
\{d:d\mid a\}
\tag{9}
\]

for every \(1\le s\le T\), while every \(x\in X\) remains incomparable with every selected \(a\).

This is stronger than checking the final frozen cover: it records every prefix deadline.

## 5. The direct-ancestor obstruction survives the deadline formulation

The hoped-for next step would be a lower bound on how many selected moves are required to satisfy (9). The obvious estimate is false.

One selected \(a\) can be divisible by many currently legal divisors

\[
d_1,d_2,\ldots,d_m,
\]

and hence can meet many deadlines simultaneously. The cap only gives

\[
k_X(d_i)\le D
\]

during a constant-cap suffix. It does not bound \(m\): the \(d_i\) may be distinct divisors of \(a\), each incident with a disjoint bounded set of final survivors.

The coatom-ownership theorem also does not close this. Each fixed root \(r\) requires distinct blockers for its different coatoms, but a single blocker may serve one coatom for each of many different roots. In the direct-ancestor orientation,

\[
r=d p,\qquad a=d q,
\]

one fixed divisor \(d\mid a\) can be extended by many prime tags \(p\). More generally, different divisors of the same \(a\) can support different root families.

Consequently, neither of the following is valid:

\[
\#\{r:a\text{ blocks a coatom of }r\}=O(1),
\]

or

\[
\#\{r:a\text{ blocks a coatom of }r\}
 \le C\tau(a)
\]

with a lifetime sum small enough to contradict a linear tail. The accepted direct-ancestor examples were designed precisely to violate such bounds.

## 6. Why the tempting class-splitting counterexample is not yet a disproof

There is a compelling abstract counterstrategy.

Start with \(N=n/H\) root classes, each containing \(H\) targets. Shortener deletes one whole \(H\)-class; Prolonger uses one direct ancestor to split a different class into \(H\) private singleton roots. After approximately \(N/2=o(n)\) rounds, half the targets would remain as singleton classes, yielding a linear degree-one tail.

This abstract process would disprove the repaired statement.

It cannot, however, be realized literally at a sparse position. After the \(o(n)\) splitting moves, the surviving singleton targets would require linearly many distinct minimal legal roots. But the position would still contain only \(o(n)\) selected integers, contradicting static completion:

\[
|A|=o(n)
\quad\Longrightarrow\quad
|\mathcal M(A)|=o(n).
\]

The same obstruction kills every finite-depth amplification in which \(H^{\Omega(1)}\) latent children become genuine bounded-degree roots after only \(o(n)\) moves.

This explains the exact distinction between the accepted direct-ancestor examples and a true disproof:

\[
\boxed{
\text{destroying or refining }H^{\Omega(1)}\text{ latent faces}
\neq
\text{creating }H^{\Omega(1)}\text{ actual minimal legal roots}.
}
\]

A real counterexample must postpone the last refinement of linearly many roots until after a positive linear number of moves. At that point static completion no longer applies. No explicit Prolonger strategy in the supplied record performs that scheduling while keeping \(Q_1\) above its fixed threshold.

## 7. What a positive proof would now have to establish

Combining the accepted results with Lemmas 2–4 reduces the repaired statement to the following chronological assertion.

> **Persistent-root deadline theorem needed.**  
> Let \(B\) be a sparse post-top position and let \(X\subseteq Q_1(B)\) have positive density. There is no sequence of \(cn\) alternating legal moves such that:
> 
> \[
> X\subseteq Q_1(A_t)
> \quad\text{for every }t,
> \]
> 
> \(X\) has a final legal divisor cover of bounded incidence, and every initially legal high-incidence divisor is blocked by a selected multiple before the deadline (7).

A frozen covering theorem is insufficient. The proof must remain valid when a new selected multiple simultaneously satisfies deadlines belonging to many already partially refined roots. This is exactly the missing chronological Lipschitz property, now expressed using final survivors rather than latent repair faces.

None of the accepted statements implies this theorem:

- Static completion controls only the initial minimal layer and supplies no \(o(n/H)\) rate.
- Cumulative fixed-shell sparsity applies only while the entire prefix is \(o(n)\).
- The exact-only bank permits \(o(n)+t\) exceptional targets, which is linear once \(t=\Theta(n)\).
- Coatom ownership gives many blocker incidences but not bounded cross-root capacity.
- The all-orders witness inequalities are frozen and allow a later direct ancestor to satisfy many low-lcm obligations at once.
- The \(\log\log(n/t)\) degree theorem is integrable and does not control the deadline cover.
- The constant-cap suffix starts only after a fixed positive-density prefix, where sparse-position theorems are unavailable.

## 8. Scope for deeper shells

The persistent-root and deadline lemmas iterate unchanged to every fixed deeper shell. For a final survivor set \(X\) in any shell, a divisor legal throughout a \(T\)-turn interval satisfies

\[
T\,k_X(d)\le |S_j|.
\]

Final minimal roots therefore again form a linear persistent family in any linear counterexample.

This does not furnish a finite-shell induction. In shell \(S_j\), a coatom may be blocked by a selected multiple from any of

\[
S_0,S_1,\ldots,S_{j-1}
\]

or from a lower shell. Hence the set of available direct-ancestor channels grows with \(j\). The localization iterates; the required lifetime-capacity estimate does not.

# Overall ruling

\[
\boxed{
\begin{array}{c}
\text{The repaired formulation has no remaining activation or parameter collapse.}\\[1mm]
\text{It is exactly equivalent to }\mathrm{FSC}(2,\eta).\\[1mm]
\text{A failure would force a linear family of final roots that are legal}\\
\text{already at sparse cap entry and a prefix-by-prefix blocker schedule}\\
\text{satisfying the survivor deadlines above.}\\[1mm]
\text{The supplied results neither rule out that schedule nor realize it.}
\end{array}}
\]

Accordingly, I cannot honestly label the repaired statement proved or disproved. A purported proof must add the persistent-root deadline theorem or an equivalent chronological multiple-cover bound. A purported disproof must give an arithmetic realization in which the final refinements occur only after linear time; the usual direct-ancestor class-splitting construction becomes impossible if it creates the bounded-degree roots during an \(o(n)\)-move prefix.
## Attachment H (verbatim): the root-quotient hazard policy, the conditional shallow-cone theorem, and the moving-scale counter-profile

# Verdict

I did **not** obtain a valid unconditional proof or disproof of

\[
L(n)=o(n).
\]

After treating every item in the prompt as established and attempting both directions, a complete argument still stops at the chronology-sensitive direct-ancestor problem. In particular, neither of the following has been proved:

\[
\text{a Shortener strategy forcing }o(n)\text{ moves},
\]

or

\[
\exists c>0,\ \exists n_k\to\infty,\qquad L(n_k)\ge c n_k.
\]

Thus the strongest unconditional bounds remain

\[
c_\delta\frac{n(\log\log n)^2}{\log n}
\le L(n)
\le(0.1897123371+o(1))n.
\]

Both are compatible with either answer. The most recent uploaded audit reaches the same endpoint: a linear capped tail is neither excluded nor realized by the established machinery. 

What follows is the strongest additional reduction I can prove. It gives a new probabilistic Shortener policy and identifies, in a particularly explicit form, why cumulative minimal-root sparsity still does not close the problem.

---

# 1. Cumulative minimal roots are globally sparse

Consider any play prefix containing \(t=o(n)\) actual moves. Let

\[
\mathscr M_t
=
\bigcup_{0\le i\le t}\mathcal M(A_i)
\]

be the set of all integers which are minimal legal at some time during that prefix.

## Lemma 1

Uniformly over all such prefixes,

\[
|\mathscr M_t|=o(n).
\]

## Proof

Fix \(\varepsilon>0\). The number of members of \(\mathscr M_t\) below \(\varepsilon n\) is trivially at most \(\varepsilon n\).

By the accepted cumulative fixed-interval sparsity theorem, only \(o(n)\) integers in the fixed interval

\[
(\varepsilon n,n]
\]

ever become minimal legal during an \(o(n)\)-move prefix. Hence

\[
|\mathscr M_t|
\le \varepsilon n+o_\varepsilon(n).
\]

First let \(n\to\infty\), then let \(\varepsilon\downarrow0\). This gives

\[
|\mathscr M_t|=o(n).
\qquad\square
\]

This strengthens the pointwise static-completion statement: not merely the current minimal layer, but the union of all minimal layers encountered during a sparse prefix is sublinear.

It is nevertheless insufficient, because one minimal root may support a growing quotient cone.

---

# 2. A root–quotient hazard strategy

Fix a constant

\[
0<s<1.
\]

At each Shortener turn, at the current position \(A\), choose a legal integer \(d\) randomly with probability

\[
\Pr_A(d)
=
\frac{d^{-s}}{Z(A)},
\qquad
Z(A)=\sum_{z\in\mathcal L(A)}z^{-s}.
\tag{1}
\]

Since

\[
Z(A)
\le \sum_{z=2}^{n}z^{-s}
\le C_s n^{1-s},
\tag{2}
\]

where \(C_s\) depends only on \(s\), small legal roots receive appreciable probability.

For a prefix containing \(T\) Shortener turns, let \(\mathscr M_T\) include all minimal roots appearing at any position of that prefix, including positions immediately after Prolonger moves. For \(H\ge2\), define its **shallow quotient cone**

\[
\mathscr C_T(H)
=
\left\{
x\le n:
x=mq,\quad
m\in\mathscr M_T,\quad
1\le q\le H
\right\}.
\tag{3}
\]

## Lemma 2: root–quotient hazard

Suppose \(x\) is currently legal and nonminimal, and it has a minimal legal divisor \(m\) satisfying

\[
\frac{x}{m}>H.
\]

Then under policy (1), the conditional probability that Shortener’s next move makes \(x\) illegal is at least

\[
c_s\frac{H^s}{n},
\tag{4}
\]

for some \(c_s>0\) depending only on \(s\).

## Proof

Put \(q=x/m>H\). Choosing \(m\) makes \(x\) illegal. By (1) and (2),

\[
\Pr_A(m)
\ge
\frac{m^{-s}}{C_s n^{1-s}}
=
\frac{q^s x^{-s}}{C_s n^{1-s}}.
\]

Since \(x\le n\),

\[
x^{-s}\ge n^{-s},
\]

and therefore

\[
\Pr_A(m)
\ge
\frac{q^s}{C_s n}
\ge
\frac{H^s}{C_s n}.
\]

Take \(c_s=C_s^{-1}\). \(\square\)

The estimate is conditional on the entire realized history. It therefore remains valid against an adaptive Prolonger.

---

# 3. A precise conditional upper theorem

## Proposition 3

Suppose there are functions \(T=T(n)\), \(H=H(n)\) such that

\[
T=o(n),\qquad H\to\infty,\qquad
\frac{T H^s}{n}\longrightarrow\infty,
\tag{5}
\]

and, uniformly over all play prefixes of at most \(2T+1\) actual moves,

\[
|\mathscr C_T(H)|=o(n).
\tag{6}
\]

Then

\[
L(n)=o(n).
\]

## Proof

Run policy (1) for \(T\) Shortener turns, unless the game terminates earlier.

Fix an integer \(x\). Consider the event that at the end of these turns:

1. \(x\) is still legal; and
2. \(x\notin\mathscr C_T(H)\).

At every earlier Shortener turn at which this event remains possible, \(x\) cannot be minimal: if it were minimal, then \(x\in\mathscr M_T\), and the representation \(x=x\cdot1\) would put it in \(\mathscr C_T(H)\).

Choose any current minimal legal divisor \(m\mid x\). If \(x/m\le H\), then again \(x\in\mathscr C_T(H)\). Consequently, as long as \(x\) remains legal without entering the shallow cone, every current minimal root satisfies

\[
\frac{x}{m}>H.
\]

Lemma 2 gives a conditional deletion probability at least \(c_sH^s/n\) on each Shortener turn. Hence

\[
\Pr\left(
x\text{ survives and }x\notin\mathscr C_T(H)
\right)
\le
\left(1-c_s\frac{H^s}{n}\right)^T
\le
\exp\left(-c_s\frac{T H^s}{n}\right).
\tag{7}
\]

Summing over \(x\le n\),

\[
\mathbb E|\mathcal L(A_T)|
\le
\sup|\mathscr C_T(H)|
+
n\exp\left(-c_s\frac{T H^s}{n}\right).
\tag{8}
\]

By (5) and (6), the right-hand side is \(o(n)\).

The finite horizon game is a finite perfect-information zero-sum game with payoff \(|\mathcal L(A_T)|\). Pure optimal strategies exist by backward induction. Thus the randomized guarantee can be derandomized: there is a deterministic Shortener strategy leaving only \(o(n)\) legal integers after \(T=o(n)\) Shortener turns.

Every subsequent actual move consumes one currently legal integer, and legal sets only shrink. The continuation therefore has length at most \(o(n)\). Including the initial \(O(T)=o(n)\) moves gives

\[
L(n)=o(n).
\qquad\square
\]

So the entire problem would follow from the weighted shallow-cone estimate (6).

---

# 4. Why cumulative root sparsity does not prove (6)

Lemma 1 only says

\[
|\mathscr M_T|=o(n).
\]

The immediate estimate

\[
|\mathscr C_T(H)|
\le H|\mathscr M_T|
\tag{9}
\]

is useless without a coupled rate. More fundamentally, this is not merely a defect of the crude inequality.

Write

\[
T=\frac nG,
\qquad G\to\infty.
\]

The hazard requirement in (5) becomes

\[
\frac{H^s}{G}\longrightarrow\infty.
\tag{10}
\]

Since \(s<1\), this forces

\[
H\gg G^{1/s}\gg G.
\tag{11}
\]

Now consider the moving root scale

\[
m\asymp\frac nG.
\]

There can be \(\Theta(n/G)=\Theta(T)=o(n)\) roots on that scale without contradicting cumulative global sparsity. Each such root has room for \(\Theta(G)\) quotients before reaching \(n\). Since \(G<H\), all those targets lie in the shallow quotient cone.

Thus the profile

\[
\#\{\text{roots}\}\asymp\frac nG,
\qquad
\#\{\text{targets per root}\}\asymp G
\tag{12}
\]

has

\[
|\mathscr M_T|=o(n)
\]

but potentially

\[
|\mathscr C_T(H)|\asymp n.
\tag{13}
\]

This is exactly the \(\Theta(n/H)\)-root times \(\Theta(H)\)-target phenomenon already visible in the cone-weighted continuation obstruction.

There is also a clean shell formulation of the quantifier gap. Let

\[
I_j=\left(\frac{n}{2^{j+1}},\frac{n}{2^j}\right].
\]

Fixed-shell cumulative sparsity controls the number \(U_j(T)\) of roots ever appearing in \(I_j\) for every fixed \(j\). But it is compatible with the moving-scale profile

\[
U_j(T)
\asymp
\min\left\{T,\frac{n}{2^j}\right\}.
\tag{14}
\]

At the boundary

\[
2^j\asymp\frac nT=G,
\]

one has

\[
2^j U_j(T)\asymp n.
\tag{15}
\]

For every fixed \(j\), the right side of (14) is eventually \(T=o(n)\), so no fixed-shell theorem is violated. The linear contribution travels to a deeper shell as \(n\) grows. This is why choosing the shell cutoff “sufficiently slowly” does not solve the problem.

The arithmetic question is precisely whether the actual on-policy chronology forbids this moving linear cone profile. None of the stipulated facts does so.

---

# 5. Relation to the direct-ancestor obstruction

In the second shell, a legal target \(x=dm\), with \(m\) odd, may have its canonical lift \(2x\) blocked by the selected move

\[
a=2d,
\]

even though \(x\) itself remains legal. One such \(a\) simultaneously certifies every target in the fiber

\[
\{dm:m\text{ odd}\}.
\]

Thus a root \(d\) supporting a large cone can be removed without any of those targets being directly deleted or transferred to minimality. They may then acquire new roots farther down the divisor lattice.

This creates exactly the moving-scale profile that defeats (6):

\[
\text{few direct deletions}
\;+\;
\text{few minimal targets}
\;+\;
\text{many successive root refinements}.
\]

A shared-core blocker may drive these refinements for many targets simultaneously, and the existing atomic ledger controls the opposite divisibility orientation. 

Consequently, proving (6) would require a genuinely chronological theorem such as:

\[
\boxed{
\begin{minipage}{0.86\linewidth}
During every \(o(n)\)-move on-policy interval, targets whose currently
minimal roots move through quotient cones of total weighted size
\(\Theta(n)\) must undergo \(\Theta(n)\) direct deletion, exact play, or
irreversible transfer to the minimal bank.
\end{minipage}}
\]

That is another formulation of the direct-ancestor bounded-lifetime or aggregate-excess-halving problem. It is not supplied by static completion, cumulative fixed-shell sparsity, pointwise degree growth, or all-orders frozen witnesses.

---

# 6. Why the lower-bound direction also remains incomplete

A disproof of \(L(n)=o(n)\) requires a fixed \(c>0\) and a Prolonger strategy such that, along some \(n_k\to\infty\),

\[
L(n_k)\ge c n_k
\]

against **every** Shortener strategy.

None of the accepted lower mechanisms has those quantifiers:

- A growing-cap fortress gives only

  \[
  \Omega\left(\frac n{H(n)}\right)=o(n).
  \]

- A fixed cap would turn that into a linear lower bound, but robust fixed-cap entry into a positive-density upper reservoir is ruled out.

- The rank-\(k\) hierarchy gives

  \[
  c_k\frac{n(\log\log n)^{k-1}}{\log n}
  \]

  for every fixed \(k\), while \(c_k\) decays doubly exponentially. The accepted multiplier-lock analysis prevents choosing \(k=k(n)\) to obtain positive density.

- A history defeating maximum-degree, smallest-root, or another named policy does not lower-bound the minimax value. An arbitrary-policy strategy is required.

- A linear raw or even legal shadow is not enough: quotient cones may expose only \(o(n)\) new minimal elements.

Therefore a negative resolution would require either a new non-reservoir positive-density mechanism or an amplification converting a forceable \(n/H(n)\) bank into \(cn\). No such amplification follows from the established results.

---

# Conclusion

The attempted weighted strategy proves the following genuine reduction:

\[
\boxed{
\begin{aligned}
&\text{Cumulative minimal roots in every sparse prefix are }o(n);\\
&\text{large root quotients can be eliminated in }o(n)\text{ turns};\\
&\text{the only remaining population is the weighted shallow-cone mass.}
\end{aligned}}
\]

But that shallow-cone mass can remain linear at a moving root scale while every fixed-shell and unweighted root count remains sublinear. Excluding this requires exactly the chronology-sensitive direct-ancestor theorem that is still missing.

Accordingly, the honest mathematical ruling is

\[
\boxed{\text{No valid unconditional proof or disproof of }L(n)=o(n)
\text{ is presently obtained from the stipulated record.}}
\]

Presenting either binary conclusion as established would hide the unproved passage from cumulative root sparsity to weighted, moving-scale cone sparsity.
REMEMBER - this argument may require non-trivial, creative and novel elements; both directions are valuable, and the proof must handle arbitrary replies.
