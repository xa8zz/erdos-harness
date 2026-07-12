---
id: R107a-fixed-cap-refutation-valid
type: verification
date: 2026-07-12
intent: >
  Independent adversarial audit of the refutation of fixed-cap
  absorbing-fortress entry (statement (F)) in the divisibility antichain
  game, with six targeted checks.
predecessors: [R104-fixed-cap-entry-refuted]
action:
  kind: confirms
  target: R104-fixed-cap-entry-refuted
claim: >
  Verdict VALID: the refutation of (F) is correct as formulated, with
  the trapped reservoir read as Q(A) contained in the live upper set
  R(A) (as the fortress definition specifies). No substantive gap in
  the uniformity argument for degree availability, the sweep move
  accounting, the erosion charging (upper moves remove only themselves;
  an entry-legal lower move divides at most H reservoir members), the
  timing case split, or the strategic quantifiers. The extension to
  caps H(n) = o(r(n)) at fixed positive reservoir density stands.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R107-fixed-cap-refutation.md
---

# VALID

The refutation is correct for statement (F) as formulated, where the trapped reservoir is the set \(Q(A)\subseteq R(A)\subseteq U_n\). No substantive gap appears in the sweep, charging, timing, or player quantifiers. 

The decisive argument is sound. For any proposed constants \(H_0,c>0\), Shortener sets \(\eta=c/4\) and reduces the entire live upper set below \(\eta n\) within

\[
N_\eta(n)=O_c\!\left(\frac{n}{r(n)}\right)=o(n)
\]

moves. If an \(H_0\)-capped reservoir \(Q_\tau\) of size at least \(cn\) had appeared before that time, then every subsequent move could eliminate at most \(h=\max\{1,\lceil H_0\rceil\}\) members of that fixed entry reservoir. Consequently, at sweep completion,

\[
|Q_\tau\cap R(A_\sigma)|
\ge cn-hN_\eta(n)
=(c-o(1))n>\frac c2n,
\]

contradicting \(|R(A_\sigma)|<cn/4\). If the reservoir appeared at or after \(\sigma\), it would be contained in an upper live set of size less than \(cn/4\), an immediate contradiction. This produces, for every candidate pair \((H_0,c)\), a single Shortener strategy defeating every Prolonger strategy, which is more than enough to negate (F).

## 1. Uniformity in Lemma 1

**Correct.**

The subsequence argument legitimately converts the apparently non-uniform \(o(1)\) into the uniform lower bound needed on the envelope

\[
|A|\le M_n:=\left\lfloor\frac{n}{\sqrt{r_n}}\right\rfloor,
\qquad |R(A)|\ge\eta n.
\]

If uniformity failed, there would be a sequence \(n_j\to\infty\) and positions \(A_j\) such that

\[
\frac{|A_j|}{n_j}\le \frac1{\sqrt{r(n_j)}}\longrightarrow0,
\qquad |R(A_j)|\ge\eta n_j,
\qquad \Delta(A_j)<\eta r(n_j).
\]

The supplied degree theorem applies along this sequence or subsequence and gives

\[
\Delta(A_j)\ge \bigl(2\eta-o(1)\bigr)r(n_j).
\]

Because \(\eta>0\) is fixed, eventually \(2\eta-o(1)>\eta\), contradicting the chosen bad positions. The fact that the theorem’s error may depend on the sequence does not obstruct this argument: the hypothetical bad sequence is itself one sequence to which the theorem applies.

There is only a harmless presentation point: Lemma 1 is stated for every \(\eta>0\), while its displayed formula for \(K_n\) is intended for \(\eta<1/2\). For \(\eta>1/2\), the conclusion is already true at the initial position for all large \(n\), since \(|U_n|\le n/2+1<\eta n\). In the actual application, \(\eta=c/4\le1/8\), so this does not affect the proof.

## 2. Sweep accounting and Prolonger’s interleaved moves

**Correct.**

Before Shortener has completed \(K_n\) turns, the number of actual moves is at most \(2K_n+1\). Moreover,

\[
K_n=O_\eta\!\left(\frac n{r_n}\right),
\]

and therefore

\[
\frac{2K_n+1}{M_n}
=
O_\eta\!\left(
\frac{n/r_n}{n/\sqrt{r_n}}
\right)
=
O_\eta\!\left(\frac1{\sqrt{r_n}}\right)
\longrightarrow0.
\]

Thus throughout every relevant Shortener turn,

\[
|A|\le 2K_n+1\le M_n,
\]

so the uniform degree lower bound remains applicable.

At each such turn, provided \(|R(A)|\ge\eta n\), Shortener chooses a legal lower move killing at least \(\eta r_n\) members of the **current** live upper set. Those killed sets are automatically disjoint across Shortener’s turns: once an upper target becomes illegal or is selected, monotonicity prevents it from returning to \(R\). Prolonger’s moves cannot replenish \(R\); they can only leave it unchanged or remove further elements. Hence Prolonger’s interleaving helps rather than harms the counting.

If the game ends before Shortener obtains \(K_n\) turns, Lemma 1’s alternative is already satisfied.

## 3. Charging in Lemma 2

**Correct for \(Q_0\), which is all that (F) requires.**

Let \(x\) be a move played after the entry position \(A_0\).

Because legality is monotone decreasing, \(x\) being legal immediately before it is played implies that it was legal at \(A_0\). It was also unchosen at \(A_0\), since it is played later. Hence, when \(x\in L_n\),

\[
x\in D(A_0).
\]

That implication is airtight.

For an upper move \(x\in U_n\), two distinct numbers of \(U_n=(n/2,n]\) cannot divide one another: if \(u<v\) and \(u\mid v\), then \(v\ge2u>n\). Therefore \(x\) can eliminate from \(Q_0\subseteq U_n\) only \(x\) itself, if \(x\in Q_0\).

For a lower move \(x\in L_n\), any \(q\in Q_0\) made illegal by \(x\) must satisfy \(x\mid q\), since \(x<q\). As \(x\in D(A_0)\), the entry cap gives

\[
\#\{q\in Q_0:x\mid q\}\le H.
\]

Assigning every lost \(q\) to the first subsequently played comparable integer therefore charges at most one \(Q_0\)-member to an upper move and at most \(H\) to a lower move. Thus after \(m\) moves,

\[
|Q_0\cap R(A_m)|\ge |Q_0|-\max\{1,H\}m.
\]

Notably, the argument does **not** need the cap to be reproved at later positions; the entry-position cap suffices because every later legal lower move already belonged to \(D(A_0)\).

The text’s optional extension to \(E_0\sqcup Q_0\) is unnecessary for (F). It is valid if “exact-only” has its literal fortress meaning that no distinct legal comparable move can eliminate an \(e\in E_0\), or if \(E_0\subseteq U_n\). If one knew only that \(e\) had no legal proper divisor, with no restriction on legal multiples, the sentence “it can disappear only by being selected itself” would need additional justification. Deleting the entire \(E_0\) aside leaves the refutation of the stated \(Q\)-reservoir claim unchanged.

## 4. Completeness of the timing split

**Complete.**

Every possible entry time \(\tau\) satisfies exactly one of

\[
\tau<\sigma
\quad\text{or}\quad
\tau\ge\sigma.
\]

An entry “during the sweep” is precisely the first case. An entry on the move that crosses the threshold is in the second case and is impossible because the resulting reservoir is a subset of \(R(A_\sigma)\), whose size is already below \(cn/4\).

If the game ends before an explicit density-crossing move, then maximality means no unchosen legal integer remains, so

\[
R(A_\sigma)=\varnothing.
\]

Thus the same post-\(\sigma\) argument applies. Moreover, if a reservoir had appeared earlier, Lemma 2 would leave \(\gg n\) members of it legal at time \(\sigma\), directly preventing the game from being terminal. No terminal-time scenario is missed.

## 5. Extension to \(H(n)=o(r(n))\)

**Correct.**

The relevant loss bound is

\[
\max\{1,H(n)\}N_\eta(n)
=
O_\eta\!\left(
\frac{(H(n)+1)n}{r(n)}
\right).
\]

Since \(r(n)\to\infty\) and \(H(n)=o(r(n))\),

\[
\frac{H(n)+1}{r(n)}\longrightarrow0,
\]

so the reservoir loses only \(o(n)\) members during the fixed-density sweep. For any fixed \(c>0\), this is eventually less than, for example, \(cn/2\), producing the same contradiction.

The word “linear” must retain its standard meaning here: size at least \(cn\) for a fixed \(c>0\). The proof does not give a uniform assertion for densities \(c=c(n)\to0\), nor does it claim to.

## 6. Player quantifiers

**No reversal.**

The degree-availability result is a position-wise existence theorem for a legal lower move. Shortener invokes it only at Shortener’s own turns. The maximum-degree rule therefore defines one history-dependent Shortener strategy that works against every possible sequence of Prolonger moves.

The quantifiers proved are essentially

\[
\forall H_0<\infty\;\forall c>0\;
\forall\text{ sufficiently large }n\;
\exists S_n\;
\forall P_n:
\text{ no such entry occurs}.
\]

This is stronger than the negation required against

\[
\exists H_0,c\;
\forall\text{ sufficiently large }n\;
\exists P_n\;
\forall S_n:
\text{ entry occurs}.
\]

Shortener’s strategy may depend on the candidate constant \(c\); that is entirely legitimate when disproving the existence of a pair \((H_0,c)\).

The minor phrases “\(c>1/2+o(1)\)” and the all-\(\eta\) formulation of Lemma 1 could be written more cleanly, but neither conceals a mathematical gap. The fixed-cap refutation, including the \(H(n)=o(r(n))\) extension for fixed positive reservoir density, stands.