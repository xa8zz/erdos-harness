Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full proof or disproof of the "second-shell capped-tail exclusion" statement defined below.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Attachment A defines, for fixed \(J\ge1\) and \(0<\eta<1\), the finite-shell clearing statement \(\mathrm{FSC}(J,\eta)\) (process dyadic shells \(S_j=(n/2^{j+1},n/2^j]\) in order after an \(o(n)\)-move prelude; while \(|Q_j(A)|>\eta|S_j|\), where \(Q_j\) is the live nonminimal shell population, play a currently legal lower element maximizing deletions from \(Q_j\); every turn counted; a fixed prefix-measurable tie-break) and proves: if \(\mathrm{FSC}(J,\eta)\) holds for every fixed \(J\) and \(\eta\), then \(L(n)=o(n)\) — deep shells are controlled by total size, so no growing-depth estimate is needed. Attachment B PROVES \(\mathrm{FSC}(1,\eta)\) for every fixed \(0<\eta<1\) (degree availability plus a disjointness bootstrap), and localizes the obstruction to the second shell: a previously chosen \(a\in(n/2,n]\) can satisfy \(d\mid a\) with \(a\) incomparable to a target \(x\in S_1\), killing the lower move \(d\) without killing \(x\) — external blockers absent from any rescaled smaller board.

The target statement, proved in Attachment C to be exactly equivalent (via the sparse cap-entry theorem) to \(\mathrm{FSC}(2,\eta)\), is:

> **Second-shell capped-tail exclusion.**
> For each fixed \(0<\eta<1\), after the fixed prelude and a top phase run at some fixed \(\eta_0<\eta/2\), there is no Prolonger strategy producing a sequence \(H(n)\to\infty\) and an active sparse position \(B_n\) such that
> \[
> |Q_1(B_n)|>\eta|S_1|,
> \qquad
> \Delta_{Q_1}(B_n)\le H(n),
> \]
> followed by \(\Omega(n)\) further active turns while the degree remains at most \(H(n)\).

Prove or disprove it. A proof proves \(\mathrm{FSC}(2,\eta)\), the first extension of shell clearing past the top shell (state explicitly whether your method iterates to deeper shells, which inherit blockers from every previously processed shell). A disproof — an explicit Prolonger strategy realizing the capped tail on the required trajectory — closes the weakest known sufficient route (state precisely what it does and does not show about other Shortener policies and about \(L(n)\) itself). Formulation caution: if the statement admits a degenerate witness or hidden collapse (eighteen families are catalogued in the record), proving THAT with the exact repair is a valuable resolution. The quantifier data \(\mathcal T_n\) (prelude and stopping rule) and \(\prec_n\) (prefix-measurable tie-break) are fixed before Prolonger is quantified, as in Attachment C section 8.

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
- Second-shell monotone cap-entry normal form: along the second-shell greedy phase the maximum deletion degree is nonincreasing and its sum over turns is at most \(|S_1|\); every failure of \(\mathrm{FSC}(2,\eta)\) therefore reaches, within \(o(n)\) turns, an active sparse capped-degree position and then sustains a linear capped tail — exact statements and proofs in Attachment C (Lemma 1, Theorem 2).
- Doubling/direct-ancestor lemma: after the top shell is processed to \(|Q_0|\le\eta_0|S_0|\) with \(\eta_0=\eta/4\) (an \(o(n)\)-turn cost), while \(|Q_1|>\eta|S_1|\) at least \((\eta/8+o(1))n\) elements \(x\in Q_1\) have \(2x\) illegal, each with an explicit blocker \(a_x=2d_x\), \(d_x\mid x\), \(x/d_x\) odd; but a single blocker \(a=2d\) can certify \(\Theta(n/d)\) targets at once (e.g. \(a=4\) blocks \(2x\) for every \(x=2m\), \(m\) odd), so no per-blocker capacity bound of the form \(C\cdot\tau(a)\) exists — Attachment C (Lemma 3, section 6) and Attachment D (Lemma 1).
- Coatom ownership / cumulative sparsity: if \(x\) is minimal legal then each \(x/p\) (over distinct primes \(p\mid x\)) is blocked by a distinct chosen move; consequently along any game prefix of \(t=o(n)\) actual moves, only \(o(n)\) integers of any fixed interval \((\alpha n,\beta n]\) EVER become minimal legal during the prefix — a cumulative-in-time strengthening of static completion; Attachment D (Lemma 2, Corollary 3).
- Known insufficiency map for the exclusion itself: static completion permits an \(n/H\) minimal layer; the exact-only bank does not control moves deleting many legal divisors at once; frozen repairs lack chronological Lipschitz control; the atomic ledger controls the opposite divisibility orientation; all-orders witnesses allow the common trace \(d_x=1\); fixed-cap fortress exclusion does not apply after rescaling because the blockers \(a_x\) are exactly the external elements omitted by the rescaled board; known lower constructions supply capped reservoirs of only \(n/H=o(n)\) moves or produce them off the required trajectory — Attachment C section 7.

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


REMEMBER - this argument may require non-trivial, creative and novel elements; both directions are valuable, and the proof must handle arbitrary replies.
