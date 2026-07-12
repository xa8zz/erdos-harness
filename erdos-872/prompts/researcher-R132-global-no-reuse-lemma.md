Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full proof or disproof of the single statement (GNR) in the Problem section.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. The Attachment below reduces a decisive intermediate statement — the aggregate-excess halving statement \((\mathrm{AE}^\dagger)\), whose truth implies \(L(n)=o(n)\) and which is provably NOT a rewriting of the full problem — to one missing chronological lemma. Prove or disprove that lemma, stated as (GNR):

(GNR) There exist a fully specified legal online Shortener policy \(\sigma\), a scale function \(H(n)\to\infty\) with \(H^6=o(n)\), and a normalized historical debt potential \(\Phi\) (a nonnegative functional of the realized history, which you must define) such that, on every interval of play reachable against \(\sigma\) that begins with aggregate excess \(R=M>0\) and on which \(R>M/2\) throughout:
1. failure of the currently available maximum-aggregate-deletion moves to remove \(M/2\) excess within the interval creates \(\Omega(M)\) units of permanent debt in \(\Phi\);
2. each Prolonger move creates only \(O(1)\) net new debt over its entire future refinement history (a single later move may never acquire unbounded new ownership of protected excess, including through the direct-ancestor channel);
3. debt resolved by actual deletion or by transfer into the minimal/exact-only bank is charged only once;
4. the total baseline and boundary error is \(o(M)+O(\log n)\).

Here the aggregate excess is \(R(t)=\sum_{X\ge H^6}\bigl(q_X(t)-\lceil4X/H^2\rceil\bigr)_+\) over dyadic shells \(S_X=(X/2,X]\), with \(q_X\) the population of live nonminimal legal targets in \(S_X\) after the standard trapping prelude (defined in the Attachment's cited facts below).

Why (GNR) is decisive. As the Attachment proves, a ticket of mass \(M\) contains only \(O(M\log H/H)+O(\log n)=o(M)+O(\log n)\) Prolonger moves, so (GNR) makes it impossible for Prolonger to protect \(\Omega(M)\) excess targets and \((\mathrm{AE}^\dagger)\) follows, hence \(L(n)=o(n)\) — resolving a long-open dichotomy whose current unconditional bounds are \(c_\delta n(\log\log n)^2/\log n\le L(n)\le(0.1897123371+o(1))n\). A disproof of (GNR) — a Prolonger mechanism defeating EVERY debt potential of this shape, e.g. by showing the direct-ancestor debt jump is unavoidable for any prefix-measurable \(\Phi\) — would close this route decisively (note it would not by itself disprove \((\mathrm{AE}^\dagger)\); say so precisely if that is your conclusion). Formulation caution: if (GNR) as stated admits a degenerate witness (e.g. a vacuous \(\Phi\)), an ill-posed obligation, or a collapse to a known statement, proving THAT explicitly with the exact repair is a valuable resolution.

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

## Attachment (verbatim): the analysis that confirmed the aggregate-excess statement's nondegeneracy and reduced it to (GNR)

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

REMEMBER - this argument may require non-trivial, creative and novel elements; the potential function design in (GNR) is yours to choose, and both directions are valuable.