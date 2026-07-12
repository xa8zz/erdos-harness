---
id: R136-owner-time-laundering
type: research
date: 2026-07-12
intent: >
  Prove or disprove the conservation-ledger no-reuse statement (GNR'):
  a policy, scale, and prefix-measurable ledger of owned unit debts
  such that failed aggregate-excess halving intervals charge M/2 - o(M)
  units to actual Prolonger moves, each move owning O(1) units over its
  entire future including the direct-ancestor channel, with immutable
  ownership, one-use settlement, and o(M) + O(log n) boundary error.
predecessors: [R132-clock-debt-degeneracy]
action:
  kind: refutes
  target: R132-clock-debt-degeneracy
failure_mechanism: >
  Seventeenth collapse — owner-time laundering / ancestral-owner
  warehouse: the conservation clause requires owners to be actual
  Prolonger moves of the realized play but never requires them to lie
  INSIDE the failed interval. Canonical monotone unitization (q_X, e_X,
  R are nonincreasing along every legal play, since legal sets shrink
  and a minimal target can never become nonminimal; so excess unit
  slots retire once and never return) lets one assign, at ticket start,
  the M active slots injectively to M distinct PRE-INTERVAL Prolonger
  moves. All four clauses then hold — more than M/2 owned unresolved
  units at the failed end, each owner owning exactly one unit forever,
  immutable, zero bookkeeping error — while every move made during the
  interval owns nothing, so the advertised counting contradiction
  (M/2 <= O(number of interval Prolonger moves)) never forms. Under the
  strengthened reading (owners must be interval moves), the statement
  becomes exactly aggregate-excess halving itself: forward by counting,
  reverse vacuously with an empty ledger. Hence the target's claim that
  the repaired conservation ledger was a well-posed strictly-weaker
  canonical statement is wrong: no certificate-form intermediate below
  interval-local halving exists in this family.
claim: >
  Literal (GNR') is underconstrained by owner-time laundering and is
  not a valid reduction target; with interval-local ownership imposed
  it collapses to aggregate-excess halving itself. The ledger/
  certificate route therefore terminates: the canonical upper-route
  target is the interval-local aggregate-excess halving statement
  directly. A genuine repair must also constrain owners causally
  (owner(alpha) must belong to a prefix-defined set of moves that
  actually blocked, depleted, or invalidated the certificate alpha),
  not merely by capacity balancing. This resolution does not disprove
  aggregate-excess halving or L(n) = o(n). Useful byproduct: the
  canonical monotone unitization lemma (nonincreasing q_X, e_X, R;
  once-retired excess slots) holds unconditionally.
implications:
  - Seventeenth collapse family for the catalogue - owner-time
    laundering; ledger obligations must be interval-local AND causally
    constrained, at which point they are the halving statement itself.
  - The formulation war is over on the upper route. Dispatch targets
    are the halving statement (AE-dagger) directly, bounded-depth
    compression, or genuinely new invariants - not certificate forms.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R136-gnr-prime-conservation-ledger.md
---

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