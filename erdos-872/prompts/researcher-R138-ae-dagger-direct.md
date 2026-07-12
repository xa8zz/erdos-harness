Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the single statement (AE†) in the Problem section.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Prove or disprove the repaired aggregate-excess halving statement (AE\u2020), which is (AE) below with two additional requirements made explicit (they were implicit in the construction's pipeline-sufficiency and their omission admits a vacuous witness — see Attachment 0): the scale parameter satisfies \(H^6=o(n)\) (so the eligible-shell range is nonempty for large \(n\); e.g. \(H\le n^{1/12}\)), and all outer quantifiers are closed uniformly (one policy, one \(C\), one \(K\) for the \(O(\log n)\) term, working for all large \(n\) and all Prolonger strategies). Attachment 0 also proves (AE\u2020) implies \(L(n)=o(n)\) and that (AE\u2020) is NOT a rewriting of the full problem (a strictly stronger local rate assertion). The original statement (AE), for reference: with \(h=H(n)\to\infty\) and the aggregate excess potential \(R(t)=\sum_{X\ge H^6}\bigl(q_X(t)-\lceil 4X/h^2\rceil\bigr)_+\) over dyadic shells (populations \(q_X\) of live nonminimal shell targets after the standard trapping prelude), there is a fully specified legal online Shortener policy under which, whenever \(R(t)=M>0\), the policy reduces the aggregate excess to at most \(M/2\) within \(C\,M\log h/h+O(\log n)\) of its turns, against every Prolonger strategy, with mandatory immediate succession while \(R>0\).

Status of this statement: it is the terminus of a completed formulation program. Attachment A proves it is nondegenerate and not a rewriting of the full problem, reduces it to an accumulated-area interval-exclusion, and identifies what any proof or disproof must supply. Attachment B proves that every certificate-form weakening collapses: debt-ledger reductions are degenerate (clock-debt, owner-time laundering), and with interval-local ownership imposed they are exactly this statement. So there is no intermediate left below (AE†): attack it directly. A proof gives \(L(n)=o(n)\), resolving a long-open dichotomy; a disproof must force, against EVERY complete legal online Shortener policy, a reachable interval where the aggregate excess resists halving within the service budget while the protected targets neither die nor transfer to the minimal bank (Attachment B's monotone unitization lemma — the excess potential is nonincreasing and its unit slots retire once and never return — constrains what Prolonger can regenerate: he cannot restore R, only slow its decay). Formulation caution: if (AE†) still admits a degenerate witness or hidden collapse (eighteen collapse families are catalogued across the attachments and facts), proving THAT with the exact repair is a valuable resolution.

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

## Attachment A (verbatim): the reduction analysis — nondegeneracy, baseline lemma, accumulated-area interval-exclusion form, and the precise missing ingredients in both directions

## Verdict

\[
\boxed{\text{I do not obtain a valid unconditional proof or disproof of }(\mathrm{AE}^{\dagger}).}
\]

After imposing \(H(n)^6=o(n)\) and closing the quantifiers uniformly, the empty-shell witness is gone, the ticket process is nonvacuous, and the resulting assertion is a genuine trajectory-level rate theorem. The supplied results identify several necessary mechanisms, but none proves the required rate, and none supplies an arbitrary-policy Prolonger counterstrategy. Claiming either truth value would require inserting precisely the global chronological lemma that remains unproved in the record. 

What follows is the exact reduction showing where a proof or disproof must occur.

## 1. The closed statement and its negation

The repaired statement has the quantifier form

\[
\exists H,\sigma,C,K,N\quad
\forall n\ge N\quad
\forall\Pi\quad
\forall t\ge b,
\]

where

\[
H(n)\longrightarrow\infty,
\qquad
H(n)^6=o(n),
\]

\(\sigma\) is one completely specified Shortener policy, \(\Pi\) is an arbitrary Prolonger strategy, \(b\) is the prescribed post-trapping baseline, and

\[
R(t)=M>0
\]

must imply that, after at most

\[
T(M,n)
=
C M\frac{\log H}{H}+K\log n
\tag{1}
\]

further Shortener turns,

\[
R\le \frac M2.
\tag{2}
\]

Its exact negation is therefore:

> For every candidate \(H,\sigma,C,K\) satisfying the parameter conditions, there are arbitrarily large \(n\), a Prolonger strategy \(\Pi\), and an on-policy reachable ticket time \(t\) such that \(R(t)=M>0\) and
> \[
> R(t+s)>\frac M2
> \]
> throughout the first \(T(M,n)\) subsequent Shortener turns.

This quantifier order explains why an obtainable fortress, a bad frozen configuration, or a history defeating one familiar policy is not a disproof. The bad ticket state must be forced against the particular complete policy \(\sigma\) being tested.

## 2. An unconditional baseline bound

There is one elementary rate bound that always holds.

### Lemma

From any state with \(R=M>0\), Shortener can reduce \(R\) to at most \(M/2\) in at most \(\lceil M/2\rceil\) of her turns.

### Proof

Because \(R>0\), some shell \(X\) satisfies

\[
q_X>\left\lceil\frac{4X}{H^2}\right\rceil.
\]

Choose a target \(u\in Q_X\). By definition, \(u\) is nonminimal and legal, so it has a legal proper divisor \(d\). Shortener may play \(d\). This makes \(u\) illegal, and hence decreases \(q_X\), and therefore \(R\), by at least one.

Repeating gives one unit of aggregate-excess deletion per Shortener turn until \(R\le M/2\). ∎

Thus the \(K\log n\) term automatically handles \(M=O(\log n)\). The substantive demand in \((\mathrm{AE}^{\dagger})\) is the factor

\[
\frac{\log H}{H}=o(1):
\]

for larger tickets, Shortener must average approximately

\[
\Omega\!\left(\frac{H}{\log H}\right)
\tag{3}
\]

units of aggregate-excess deletion per turn, rather than merely one.

## 3. The exact accumulated-area formulation

Index the post-baseline Shortener turns during a ticket by \(i=0,1,\ldots\), and let \(A_i\) be the position immediately before Shortener’s \(i\)-th move. Define the best current aggregate deletion

\[
\Delta_i^\star
=
\max_{x\text{ legal at }A_i}
\bigl(R(A_i)-R(A_i\cup\{x\})\bigr).
\tag{4}
\]

Suppose Shortener uses a policy that chooses a maximizer in (4), with fixed tie-breaking and the necessary batch guards. Prolonger’s moves can only decrease \(R\), so they are helpful for this calculation.

If a ticket of mass \(M\) has not halved after \(T\) Shortener turns, then necessarily

\[
\sum_{i<T}\Delta_i^\star<\frac M2.
\tag{5}
\]

For

\[
M\gg \log n
\]

and \(T\) as in (1), this says that the average available aggregate deletion was at most

\[
\frac1T\sum_{i<T}\Delta_i^\star
<
\left(\frac{1}{2C}+o(1)\right)\frac{H}{\log H}.
\tag{6}
\]

Consequently, a proof of \((\mathrm{AE}^{\dagger})\) is exactly a theorem excluding every reachable interval of length

\[
\asymp M\frac{\log H}{H}
\]

during which \(R\) stays above \(M/2\) while the accumulated global maximum-degree area remains below \(M/2\).

Conversely, a disproof must force such a low-area interval against every complete Shortener policy.

That is the precise unresolved separator. It is not an endpoint-degree statement.

## 4. Why the positive facts do not prove the accumulated-area bound

### Static completion and static covering have the wrong normalization

The accepted theorems provide a cover or maximal completion of size \(o(n)\). A ticket may have

\[
\log n\ll M\ll n.
\]

For such a ticket, \((\mathrm{AE}^{\dagger})\) needs a relative bound of order

\[
O\!\left(M\frac{\log H}{H}\right),
\tag{7}
\]

not merely an absolute \(o(n)\) bound.

Moreover, even a small static cover is not automatically executable. Prolonger may play one carrier that is comparable with many members of the cover while remaining incomparable with the targets those members covered. Recomputing the cover can then generate new covers. This is the quadratic-regeneration and direct-ancestor obstruction.

### Positive-density degree availability does not control sublinear excess

Degree availability applies when a positive fraction of the whole upper half remains live. Aggregate excess may instead be concentrated in one or more sublinear shells, or may exceed the shell floors by only a sublinear amount.

Thus a move deleting \(r(n)\to\infty\) targets at positive density does not imply the scale-sensitive deletion rate \(H/\log H\) throughout every ticket.

### Frozen witness estimates are not chronological capacity estimates

The all-orders witness inequality controls a fixed depleted family. It does not imply that every later insertion changes the optimal repair potential by only \(O(1)\), or even \(O(\tau(c))\).

A direct-ancestor move can invalidate many latent faces simultaneously. The same move can also reappear through successive refinements. This is exactly why an instantaneous incidence bound cannot be promoted to a lifetime bound.

The missing positive theorem is therefore a **global historical no-reuse or Lipschitz principle**: one needs a normalized debt potential for which each actual Prolonger move can save only bounded total aggregate mass over its entire future refinement history. No such potential is supplied.

### “Choose \(H\) slowly” does not repair the gap

For every fixed number of regeneration layers, repeated static completion does give \(o(n)\). But its modulus can depend arbitrarily badly on the number of layers. At the same time, the number and resolution of the structures that must be controlled grows with \(H\).

There is no supplied quantitative relation ensuring that the modulus required to control the first \(j\) layers is compatible with a choice of \(H\) for which \(j\) is at least the depth demanded by that same \(H\). This is the familiar coupled-modulus obstruction: two separate little-\(o\) assertions cannot simply be composed by declaring that \(H\) grows slowly.

## 5. Why the negative constructions do not disprove the statement

### An off-policy fortress has the wrong quantifiers

A capped primorial fortress would resist rapid deletion once reached. But \((\mathrm{AE}^{\dagger})\) quantifies existentially over Shortener policies and only over states reachable against that policy.

The fixed-density clearing sweep prevents entry into a positive-density bounded-cap fortress at sufficiently low cap. Thus an off-path fortress does not supply the required

\[
\forall\sigma\ \exists\Pi
\]

forcing theorem.

### Fan and matching lower bounds can occur before the baseline

A blocked-root fan such as

\[
\{qp:p\in\mathcal P\}
\]

may indeed require essentially one move per target once \(q\) has been preempted and each \(p\) is private. This explains known sublinear lower bounds.

But the trapping prelude is itself permitted \(o(n)\) moves. A sublinear fan can be consumed, transferred to the minimal bank, or played during that prelude. To refute \((\mathrm{AE}^{\dagger})\), one must force a comparable private reservoir after the prescribed baseline and keep it globally significant until a ticket begins. The known fan constructions do not have that quantifier strength.

### Private-carrier drafting controls raw or surviving shadow, not \(R\)

Private carriers can force a linear proper-multiple shadow, and even a linear legal surviving shadow, against every first-layer ordering. But blocking a root can make many descendants minimal legal. Such a transfer decreases \(q_X\) and therefore decreases \(R\), even though it may preserve many future legal moves.

Hence

\[
\text{large legal shadow}
\not\Longrightarrow
\text{large surviving aggregate excess}.
\]

The supplied construction exposes only a sublinear next minimal layer because of its cone quotient structure.

### Fresh-batch persistence starts after activation

Once a sufficiently fresh batch is activated, Prolonger’s persistence theorem is robust. It does not show that some such batch must remain fresh against the candidate Shortener policy before first activation.

Advance depletion is the entire unresolved entry problem. Using persistence as though it supplied entry would reverse the player quantifiers.

## 6. The precise missing lemma

A positive resolution would follow from a global chronological statement of the following form.

> **Global no-reuse lemma.** There is a fixed Shortener policy and a normalized historical debt \(\Phi\) such that, on every reachable interval with initial excess \(M\) and \(R>M/2\):
>
> 1. failure of the currently available high-degree moves to delete \(M/2\) creates \(\Omega(M)\) units of permanent debt;
> 2. each Prolonger move creates only \(O(1)\) net new debt over its full future refinement history;
> 3. debt resolved by actual deletion or transfer is charged only once;
> 4. the total baseline and boundary error is \(o(M)+O(\log n)\).

Since a ticket contains only

\[
O\!\left(M\frac{\log H}{H}\right)+O(\log n)
=o(M)+O(\log n)
\]

Prolonger moves, such a lemma would make it impossible for Prolonger to protect \(\Omega(M)\) excess targets, and the ticket would halve.

The frozen repair theorems do not establish item 2. Direct-ancestor insertion is exactly the operation under which the known repair potentials can jump by the mass of many previously unrelated structures.

A negative resolution requires the converse construction:

> For every complete Shortener policy, force an on-trajectory interval in which only \(o(M)\) aggregate excess is deleted during \(O(M\log H/H+\log n)\) turns, while each adversarial move repeatedly protects \(\Omega(H/\log H)\) fresh excess targets and the protected targets neither die nor transfer to the minimal/exact-only bank.

No supplied construction currently does this globally.

## Conclusion

The repaired proposition is not vacuous, and the previous empty-shell counterexample no longer applies. It is also not a formal restatement of \(L(n)=o(n)\). But the accepted facts stop exactly before the accumulated global-area/no-reuse estimate needed to settle it.

Thus the mathematically defensible resolution is

\[
\boxed{
\begin{array}{c}
\text{Literal (AE): true vacuously, as shown in Attachment 0;}\\[2mm]
\text{repaired }(\mathrm{AE}^{\dagger}):
\text{ neither proved nor disproved by a valid argument here.}
\end{array}}
\]

Any purported full proof would be assuming a chronological Lipschitz/no-reuse theorem; any purported full disproof would be assuming a robust arbitrary-policy entry theorem. Neither assumption is among the established facts.

## Attachment B (verbatim): the certificate-route terminus — clock-debt and owner-time laundering degeneracies, the monotone unitization lemma, and the equivalence of interval-local ledgers with (AE†) itself

# Verdict

\[
\boxed{\text{(GNR′) is still not a closed, nondegenerate no-reuse statement.}}
\]

The load-bearing defect is that item 1 permits the owner to be **any earlier Prolonger move in the realized play**, whereas the advertised contradiction counts only Prolonger moves **made during the failed interval**. The words “fresh-debt conservation / source exhaustivity” are only a label; the formal clause never imposes interval-local ownership. Likewise, item 4 does not formally declare debt assigned during the interval to an old owner to be carry-in. 

Consequently:

\[
\text{items 1+2 do not yield }
\frac M2-o(M)
\le O\bigl(\#\{\text{Prolonger moves in the interval}\}\bigr).
\]

There is an explicit prefix-measurable **ancestral-owner warehouse** satisfying the literal ownership, lifetime, immutability, and settlement requirements on a failed interval while assigning zero debt to moves made in that interval.

Under the stronger interpretation that every non-boundary owner must have been played during the interval, (GNR′) becomes exactly the aggregate-halving assertion itself: the forward direction follows by counting, while the reverse direction holds vacuously with an empty ledger. Thus the present wording has two materially different formalizations rather than one proposition.

This is a disproof of (GNR′) as the claimed repaired no-reuse lemma. It is not a disproof of aggregate-excess halving or of \(L(n)=o(n)\).

---

# 1. Aggregate excess has a canonical monotone unitization

Put

\[
d_X=\left\lceil\frac{4X}{H^2}\right\rceil,
\qquad
e_X(t)=(q_X(t)-d_X)_+,
\]

so that

\[
R(t)=\sum_X e_X(t).
\]

## Lemma 1

For every shell \(X\), \(q_X(t)\), \(e_X(t)\), and \(R(t)\) are nonincreasing along every legal play.

### Proof

As the played primitive set grows, the legal set only shrinks.

Moreover, a legal target cannot change from minimal to nonminimal: if \(u\) is nonminimal at a later position, it has a legal proper divisor \(d\mid u\) at that later position, and therefore both \(d\) and \(u\) were legal earlier as well. Thus \(u\) was already nonminimal earlier.

Hence the family of live nonminimal targets in each shell only loses elements. Therefore \(q_X\), \(e_X\), and their sum \(R\) are nonincreasing. ∎

For every shell introduce formal unit slots

\[
\alpha_{X,1},\alpha_{X,2},\ldots .
\]

Declare \(\alpha_{X,j}\) to be active at time \(t\) exactly when

\[
j\le e_X(t).
\]

Then the active slots are a genuine unit-mass representation of the current aggregate excess:

\[
\mathcal U(t)
=
\{\alpha_{X,j}:1\le j\le e_X(t)\},
\qquad
|\mathcal U(t)|=R(t).
\]

By Lemma 1,

\[
t'\ge t\quad\Longrightarrow\quad
\mathcal U(t')\subseteq\mathcal U(t).
\tag{1}
\]

Thus slots can be retired once and never reappear. No target replication, floor chattering, or clock atoms are involved.

---

# 2. The ancestral-owner warehouse

Let \(s\) be the beginning of a proposed ticket, with

\[
R(s)=M.
\]

Let

\[
\mathcal P_{<s}
\]

denote the actual Prolonger moves made before \(s\). Suppose merely that

\[
|\mathcal P_{<s}|\ge M.
\tag{2}
\]

Choose \(M\) distinct moves

\[
p_1,\ldots,p_M\in\mathcal P_{<s}.
\]

At the ticket-start prefix, enumerate the \(M\) active slots in any fixed deterministic order and assign them injectively:

\[
\operatorname{owner}(\alpha_i)=p_i,
\qquad 1\le i\le M.
\tag{3}
\]

The assignment is prefix-measurable: at time \(s\), all slots and all owners in (3) have already been realized.

When a slot ceases to be active, retire it. Never reuse its owner capacity.

## Verification

Suppose the prescribed interval \(I=[s,e]\) fails:

\[
R(t)>\frac M2
\qquad\text{throughout }I.
\]

At its end,

\[
|\mathcal U(e)|=R(e)>\frac M2.
\tag{4}
\]

By (1), every slot active at \(e\) was present at \(s\), and hence has the immutable actual-move owner assigned in (3).

Therefore:

### Item 1

Every unresolved end-of-ticket excess unit has an actual Prolonger move as owner, and

\[
\#\{\text{owned unresolved units at }e\}
=
R(e)>\frac M2.
\tag{5}
\]

This is stronger than \(M/2-o(M)\).

The assignment can be made immediately after the ticket starts. Thus even a convention under which “carry-in” means “debt already assigned before the ticket” does not stop the construction: the debt assignment is fresh, while its owners are old.

### Item 2

Every Prolonger move owns at most one unit over its entire future:

\[
\sup_p
\#\{\alpha:\operatorname{owner}(\alpha)=p\}
\le1.
\tag{6}
\]

Later refinements do not create descendants. Each slot is fixed once and for all.

### Item 3

Owners never change. A slot is retired exactly when it leaves \(\mathcal U(t)\), and monotonicity ensures that it never returns. No settled unit is recharged.

### Item 4

There is no unowned, approximate, or exceptional mass. The numerical bookkeeping error is zero.

Yet none of the owners in (3) needs to belong to the interval \(I\).

In particular, one may have

\[
\sum_{p\in\mathcal P(I)}
\#\{\alpha:\operatorname{owner}(\alpha)=p\}
=0,
\tag{7}
\]

even though the left side of item 1 is \(>M/2\).

This is the promised owner-time laundering.

---

# 3. The claimed counting contradiction is invalid

Let \(D_I\) be the certificate mass at the end of the ticket, and let \(D(p)\) be the lifetime mass owned by move \(p\).

Items 1 and 2 give only

\[
D_I\ge \frac M2-o(M)
\tag{8}
\]

and

\[
D(p)\le B
\tag{9}
\]

for some fixed \(B\).

They imply at most

\[
D_I
\le
B\bigl(
|\mathcal P_{<s}|+|\mathcal P(I)|
\bigr)
+\text{exceptional mass}.
\tag{10}
\]

The desired proof instead needs

\[
D_I
\le
B|\mathcal P(I)|
+\text{boundary/carry-in mass}.
\tag{11}
\]

But (11) does not follow from the current clauses. The warehouse has

\[
D_I>\frac M2,
\qquad
\sum_{p\in\mathcal P(I)}D(p)=0,
\tag{12}
\]

with all mass stored in earlier owners.

The fact that

\[
|\mathcal P(I)|
=
O\!\left(M\frac{\log H}{H}\right)
=o(M)
\tag{13}
\]

is therefore irrelevant. The set whose cardinality is bounded in (13) is not the set from which item 1 currently requires owners to be drawn.

This is not the original unowned-clock defect. Every atom is owned by an actual Prolonger move, each owner has lifetime load one, and all ownership is immutable. The missing restriction is specifically **owner locality in time**.

---

# 4. A second ambiguity: the activation baseline

The same defect combines with prelude delay if “baseline” is not fixed formally.

Let \(b_0\) be the time when the trapping property is first established, and let \(P(t)\) be the number of actual Prolonger moves by time \(t\). Define the prefix-measurable stopping time

\[
b
=
\min\{t\ge b_0:P(t)\ge R(t)\}.
\tag{14}
\]

This stopping time always exists: at a terminal position \(R=0\).

A completely specified policy can:

1. execute the fixed trapping procedure;
2. make the least legal move while \(P(t)<R(t)\);
3. activate the warehouse ledger at \(b\);
4. thereafter use any deterministic legal rule.

At \(b\), assign all \(R(b)\) active slots injectively to earlier Prolonger moves. Every later failed interval is then certified by the warehouse construction.

If \(b\) is terminal, all obligations are vacuous. If \(b\) is nonterminal, all later excess is already owned.

This policy may spend a linear number of turns before \(b\), so it gives no sublinear-game conclusion. It is precisely the prelude-delay/activation-delay collapse.

The phrase “after the standard trapping prelude” may have been intended to prohibit (14), but the formal statement must then specify:

\[
b=b_{\mathrm{trap}}
\quad\text{and}\quad
b_{\mathrm{trap}}=o(n)
\]

uniformly, and must require every ticket obligation to begin immediately from that prescribed stopping rule. Merely mentioning a “baseline error” does not specify this.

---

# 5. What happens under the intended stronger reading

Suppose we strengthen (GNR′) as follows.

For every failed ticket \(I=[s,e]\), there is a certificate \(\mathcal C_I\) such that

\[
|\mathcal C_I|
\ge
\frac M2-\varepsilon_nM-A\log n,
\qquad
\varepsilon_n\to0,
\tag{15}
\]

and a partition

\[
\mathcal C_I
=
\mathcal C_I^{\mathrm{int}}
\sqcup
\mathcal C_I^{\mathrm{bd}}
\tag{16}
\]

satisfying

\[
\operatorname{owner}(\alpha)\in\mathcal P(I)
\quad
\text{for every }\alpha\in\mathcal C_I^{\mathrm{int}},
\tag{17}
\]

and

\[
|\mathcal C_I^{\mathrm{bd}}|
\le
\varepsilon_nM+A\log n.
\tag{18}
\]

Crucially, any atom whose owner predates \(s\) is, by definition, in \(\mathcal C_I^{\mathrm{bd}}\), even if the atom was first assigned during \(I\).

Assume also that every move owns at most \(B\) lifetime units.

Let

\[
T=\left\lceil CM\frac{\log H}{H}\right\rceil .
\]

Alternation gives

\[
|\mathcal P(I)|\le T+1.
\tag{19}
\]

From (15)–(18),

\[
\frac M2-2\varepsilon_nM-2A\log n
\le
|\mathcal C_I^{\mathrm{int}}|
\le
B(T+1).
\tag{20}
\]

Hence

\[
\frac12
\le
BC\frac{\log H}{H}
+
2\varepsilon_n
+
\frac{2A\log n}{M}
+
\frac{2B}{M}.
\tag{21}
\]

For \(M\ge K\log n\),

\[
\frac12
\le
BC\frac{\log H}{H}
+
2\varepsilon_n
+
\frac{2A}{K}
+
o(1).
\tag{22}
\]

Choose \(K\) larger than the explicit boundary constant, for example \(K>16A\). Since

\[
\frac{\log H}{H}\to0
\quad\text{and}\quad
\varepsilon_n\to0,
\]

the right side of (22) is eventually smaller than \(1/2\), a contradiction.

Thus the strengthened formulation implies that no failed ticket exists.

## Conversely

If a policy already has aggregate-excess halving within the prescribed budget, take the ledger to be empty. There are no failed intervals, so every conditional certificate requirement is vacuously satisfied.

Therefore the properly interval-local version obeys

\[
\boxed{
\text{strong (GNR′)}
\iff
\text{aggregate-excess halving}.
}
\tag{23}
\]

The ledger is a possible proof method, but it contributes no extra logical content to the existential statement. Once failure has been excluded, the ledger is never tested.

---

# 6. Exact repair

The missing formal clause should be stated as follows.

> For every failed ticket \(I=[s,e]\), the end certificate consists of actual active aggregate-excess slots. Apart from at most \(\varepsilon_nM+A\log n\) boundary slots, every certificate slot:
>
> 1. was uncharged at the start \(s\);
> 2. was first charged during \(I\);
> 3. is owned by a Prolonger move whose timestamp lies in \(I\).
>
> Any slot whose owner predates \(s\), regardless of when the assignment was made, is carry-in and is charged to the boundary allowance.

One must additionally fix:

\[
\exists H,\sigma,B,C,K,A,N,\varepsilon_n
\quad
\forall n\ge N
\quad
\forall\Pi
\quad
\forall s\ge b_{\mathrm{trap}},
\]

with:

\[
H\to\infty,\qquad H^6=o(n),\qquad \varepsilon_n\to0,
\]

and with \(b_{\mathrm{trap}}=o(n)\) prescribed in advance and not extendible by an owner-capitalization phase.

If the phrase “direct-ancestor owner” is intended causally rather than merely as accounting, one more condition is needed:

\[
\operatorname{owner}(\alpha)
\in
\Gamma(\alpha),
\tag{24}
\]

where \(\Gamma(\alpha)\) is a prefix-defined set of moves that actually blocked, depleted, or invalidated the certificate represented by \(\alpha\). Otherwise a ledger may assign direct-ancestor debt to completely unrelated interval moves merely to balance capacities.

---

# Conclusion

The four repaired-looking clauses do not yet prove the claimed contradiction. They permit:

\[
\text{fresh debt}
\longrightarrow
\text{old actual owner},
\]

and they never formally charge such ownership to the carry-in allowance.

Hence the rigorous resolution is

\[
\boxed{
\begin{array}{c}
\text{Literal (GNR′) is underconstrained by owner-time laundering;}\\[1mm]
\text{the number of Prolonger moves inside the ticket does not bound its debt;}\\[1mm]
\text{after adding interval-local ownership, the statement collapses exactly}\\
\text{to aggregate-excess halving itself.}
\end{array}}
\]

No direct-ancestor construction against every policy is required to expose this defect. Conversely, this defect says nothing about whether the genuinely fixed-baseline, interval-local aggregate-halving theorem is true.

REMEMBER - this argument may require non-trivial, creative and novel elements; both directions are valuable.