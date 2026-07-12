---
id: R107b-fixed-cap-refutation-valid
type: verification
date: 2026-07-12
intent: >
  Second independent adversarial audit (same brief, separate thread) of
  the refutation of fixed-cap absorbing-fortress entry (statement (F)).
predecessors: [R104-fixed-cap-entry-refuted]
action:
  kind: confirms
  target: R104-fixed-cap-entry-refuted
claim: >
  Verdict VALID: the refutation correctly negates (F). Both ingredients
  check out — the fixed-density clearing sweep from degree availability
  and the bounded per-move erosion of a capped reservoir — and there is
  no use of a Shortener guarantee as a Prolonger guarantee nor any
  reversal of the strategic quantifiers.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R107-fixed-cap-refutation.md
---

# Verdict: **VALID**

The refutation correctly negates (F). Its two ingredients are compatible and jointly decisive:

1. Shortener can force the entire live upper set \(R(A)\) below any fixed positive density in \(O(n/r(n))=o(n)\) moves.
2. From an entry position whose upper reservoir \(Q_0\) has fixed degree cap \(H_0\), that particular reservoir can lose at most \(\max\{H_0,1\}\) members per subsequent move.

Therefore a linear \(Q_0\) cannot appear before the sweep, because most of it would still be present when the sweep finishes; and it cannot appear afterward, because \(R(A)\) is already too small and can never grow. The submitted proof implements this argument correctly. 

There are a few harmless presentational qualifications noted below, but no gap requiring repair.

## Decisive argument

Fix the purported constants \(H_0,c>0\), and let \(\eta=c/4\).

The sweep takes

\[
N_\eta(n)=O_\eta\!\left(\frac{n}{r(n)}\right)=o(n)
\]

moves. If an \(H_0\)-capped reservoir \(Q_\tau\subseteq R(A_\tau)\) of size at least \(cn\) appeared before completion, then every later lower move could eliminate at most \(H_0\) elements of this fixed entry reservoir, and every upper move could eliminate at most one. Consequently, at sweep completion,

\[
|Q_\tau\cap R(A_\sigma)|
\ge cn-\max\{H_0,1\}N_\eta(n)
=(c-o(1))n.
\]

This is eventually larger than \(cn/2\), contradicting

\[
|R(A_\sigma)|<cn/4.
\]

If the reservoir appeared at or after completion, monotonicity would instead give

\[
|Q_\tau|\le |R(A_\tau)|
\le |R(A_\sigma)|
<cn/4,
\]

again impossible.

That establishes a Shortener counterstrategy for every proposed pair \((H_0,c)\), which is more than enough to refute the existential statement (F).

---

## Assessment of the numbered checks

### 1. Lemma 1 uniformity: **valid**

The subsequence argument is legitimate.

Suppose the claimed uniform bound failed for infinitely many \(n\). Choose, for each such \(n\), a violating position \(A_n\) with

\[
|A_n|\le \frac{n}{\sqrt{r_n}},
\qquad
|R(A_n)|\ge\eta n,
\qquad
\Delta(A_n)<\eta r_n.
\]

Fill in the remaining indices with any admissible positions, for example the empty position when \(\eta\le 1/2\). Then

\[
\frac{|A_n|}{n}\le \frac1{\sqrt{r_n}}\longrightarrow 0,
\]

so this adversarially chosen sequence itself satisfies \(|A_n|=o(n)\). Applying the supplied availability theorem to that sequence yields

\[
\Delta(A_n)\ge(2\eta-o(1))r_n>\eta r_n
\]

eventually, including along the allegedly bad subsequence. Contradiction.

Thus even though the theorem’s error term may depend on the chosen sequence of positions, failure of uniformity on this shrinking family would manufacture a sequence contradicting the theorem.

Minor edge case: Lemma 1 is worded for every \(\eta>0\). For \(\eta>1/2\), its conclusion already holds at the initial position for large \(n\), while the displayed definition of \(K_n\) can become awkward because its numerator is negative. This is immaterial here, since the proof uses \(\eta=c/4\le1/8\) after disposing of \(c>1/2\).

### 2. Lemma 1 move accounting: **valid**

As long as the threshold has not yet been crossed, every Shortener turn occurs at a position satisfying

\[
|R(A)|\ge\eta n.
\]

During the first \(K_n\) Shortener turns, the total number of chosen integers is at most \(2K_n+1\), and

\[
2K_n+1
=O_\eta\!\left(\frac n{r_n}\right)
=o\!\left(\frac n{\sqrt{r_n}}\right).
\]

Hence all such positions satisfy \(|A|\le M_n\) for sufficiently large \(n\), so the uniform degree bound remains applicable at every Shortener turn.

Each Shortener move eliminates at least \(\eta r_n\) integers that are live at that moment. These eliminations are automatically distinct across turns: once an upper integer is removed from \(R\), it never returns. Prolonger’s interleaved moves can only remove additional elements of \(R\), never restore any. Thus the cumulative-count argument is sound.

The bound \(2K_n+1\) is slightly loose—depending on the precise time convention, \(2K_n\) suffices—but that only strengthens the argument.

### 3. Lemma 2 charging: **valid for the relevant upper reservoir \(Q_0\)**

The crucial inference is airtight:

> If \(x\) is legal when played after \(A_0\), then \(x\) was legal at \(A_0\).

Indeed, the later chosen set contains \(A_0\), and legality only decreases as more integers are selected. Also, because \(x\) has not yet been selected at \(A_0\), there is no issue with the “previously unchosen” part of legality. Therefore, when \(x\in L_n\),

\[
x\in D(A_0).
\]

If such an \(x\) removes \(q\in Q_0\subseteq U_n\), necessarily \(x\mid q\), since \(q>x\). The entry cap therefore gives

\[
\#\{q\in Q_0:x\mid q\}\le H.
\]

For \(x\in U_n\), distinct upper integers are incomparable: if \(u<v\) and \(u\mid v\), then \(v\ge2u>n\). Hence an upper move can remove from \(Q_0\) only itself, and so at most one member.

Thus every subsequent move removes at most

\[
\max\{H,1\}
\]

members of the fixed entry set \(Q_0\).

The optional paragraph concerning \(E_0\) is not needed to refute (F), because the supplied statement explicitly identifies the trapped reservoir \(Q(A)\) as a set of live upper targets. If “exact-only bank” has its standard literal meaning that no legal move other than selecting \(e\) itself can eliminate \(e\), then that paragraph is also correct. Were “exact-only” intended to mean something weaker, one should simply omit the \(E_0\) extension; the direct \(Q_0\) argument remains complete.

### 4. Case split completeness: **complete**

All possibilities are covered:

- Entry strictly before sweep completion: \(\tau<\sigma\), handled by Lemma 2.
- Entry during the sweep: also \(\tau<\sigma\).
- Entry exactly at completion: \(\tau=\sigma\), included in \(\tau\ge\sigma\).
- Entry afterward: \(\tau>\sigma\), included in \(\tau\ge\sigma\).
- Game ends before the density threshold is separately reached: at a terminal position there is no legal unchosen upper integer, so \(R(A_\sigma)=\varnothing\). Thus the same inequality \(|R(A_\sigma)|<cn/4\) holds. Moreover, an earlier linear reservoir would contradict terminality by the same persistence estimate.

No timing scenario is omitted.

### 5. Extension to \(H(n)=o(r(n))\): **valid**

The relevant number of subsequent moves is

\[
O_\eta\!\left(\frac n{r(n)}\right).
\]

An \(H(n)\)-capped entry reservoir can therefore lose at most

\[
O_\eta\!\left(
\max\{H(n),1\}\frac n{r(n)}
\right).
\]

Since \(r(n)\to\infty\) and \(H(n)=o(r(n))\),

\[
\frac{\max\{H(n),1\}}{r(n)}\longrightarrow0.
\]

Hence the total loss is \(o(n)\), exactly as claimed. For every fixed reservoir density \(c>0\), the same choice \(\eta=c/4\) produces the contradiction.

The phrase “linear reservoir” must retain its usual meaning \(|Q|\ge cn\) for a fixed \(c>0\); the argument does not claim uniformity for \(c=c(n)\to0\).

### 6. Player quantifiers: **no reversal**

The supplied theorem says that at each qualifying position there exists a legal lower move of large degree. On Shortener’s own turns, she is entitled to choose that move. Reapplying the theorem after every Prolonger response therefore defines a valid adaptive Shortener strategy.

The quantifiers for (F) are

\[
\exists H_0,c\ \exists\text{ Prolonger strategy}\ 
\forall\text{ Shortener strategies}.
\]

To refute this, it suffices to show that for every proposed \(H_0,c\), Shortener has one counterstrategy preventing entry. The counterstrategy may depend on the proposed constant \(c\), through \(\eta=c/4\); that is entirely consistent with the negation of (F).

There is therefore no hidden use of a Shortener guarantee as though it were a Prolonger guarantee, nor any reversal of the strategic quantifiers.