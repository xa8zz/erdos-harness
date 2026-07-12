---
id: R109a-ordered-shadow-refutation-valid
type: verification
date: 2026-07-12
intent: >
  Independent adversarial audit of the refutation of the first-sweep
  ordered-shadow statement (OS), with Phase-0 obtainability of the bad
  position as the primary check.
predecessors: [R105-ordered-shadow-refuted]
action:
  kind: confirms
  target: R105-ordered-shadow-refuted
claim: >
  Verdict VALID: the refutation of the literal (OS) is correct. The
  constructed post-Phase-0 position is genuinely obtainable under the
  fixed Phase-0 policy; the claimed roots are first-layer minimal; the
  private carriers are legal and private; the drafting lemma's
  alternation accounting holds against every ordering; the rough-number
  and prime-regime estimates check out. Remaining issues are exposition
  repairs only. The scope claim also holds: the cumulative-layer
  (growing-depth uniformity) statement remains open.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R109-ordered-shadow-refutation.md
---

# Verdict: **VALID**

Document B correctly refutes the literal first-sweep ordered-shadow statement \((\mathrm{OS})\). The likeliest failure point—post-Phase-0 obtainability—survives scrutiny. Phase 0 permits Shortener to play **any** currently legal \(d\le n/H\); alternating through \(S_Y\) is therefore a legal, policy-consistent history. It is cooperative, but \((\mathrm{OS})\) quantifies over **every obtainable** post-Phase-0 position, so one such history is enough to refute it. The private-carrier lemma, the rough and prime constructions, and the final quantifier reversal are also sound. 

The minor imprecisions concerning the exact phase-boundary parity and the wording of the \(Y<4\) case are editorial, not mathematical gaps.

## 1. Obtainability: **passes**

The supplied Phase 0 rule is:

\[
\text{Shortener repeatedly plays any currently legal }d\le \frac nH.
\]

Thus, writing \(Y=\lfloor n/H\rfloor\), every Shortener move from \(S_Y\subseteq[2,Y]\) is an allowed Phase 0 move. 

The claimed history is genuinely legal:

\[
S_Y=\{\lfloor Y/2\rfloor+1,\ldots,Y\}
\]

is an antichain. More importantly, Phase 0 cannot terminate prematurely while an element of \(S_Y\) remains unselected: every unselected \(s\in S_Y\) is incomparable with all previously selected members of \(S_Y\), hence remains a legal integer at most \(Y\).

After all of \(S_Y\) is selected, every \(d\le Y\) is illegal. For \(d\le Y/2\), setting \(q=\lfloor Y/d\rfloor\) gives

\[
\frac Y2<qd\le Y,
\]

so \(qd\in S_Y\) and \(d\mid qd\). The elements already in \(S_Y\) are of course selected. Thus the Phase 0 stopping condition holds exactly then. Document B’s post-peel construction is stated in the attachment. 

There is a harmless boundary-convention wrinkle:

- If Prolonger selects the last member of \(S_Y\), Shortener’s next turn begins the sweep, with \(A_0=S_Y\).
- If Shortener selects the last member, Prolonger gets the intervening turn. He may play the upper-half prime \(q_n\), or one may define \(A_0=S_Y\) immediately after Shortener’s move and regard \(q_n\) as the first continuation move.

Either convention yields the same lower legal set, and \(q_n\) is incomparable with every root and carrier subsequently used.

The construction does require Shortener to make favorable choices within her Phase 0 freedom. That does **not** invalidate the refutation. The statement being refuted says

\[
\forall A_0\text{ obtainable after Phase 0},
\]

not “for every \(A_0\) Prolonger can force against every Phase 0 tie-breaking rule.” A cooperative but legal and policy-consistent history is still an obtainable history.

## 2. First-layer membership: **passes**

### Rough regime

Here

\[
Y<m\le \frac n5,\qquad P^{-}(m)>h,
\]

where \(h=H(n)\). Since \(m\) is an integer strictly larger than \(Y=\lfloor n/h\rfloor\), in fact \(m>n/h\).

Every proper divisor \(d\mid m\) satisfies

\[
d\le \frac{m}{P^{-}(m)}
 <\frac mh
 \le \frac{n}{5h}
 <\frac Y2
\]

for sufficiently large \(n\). Such \(d\) is therefore already illegal after the peel. No member of \(S_Y\) divides \(m\), because such a member would be a proper divisor exceeding \(Y/2\); and \(m>Y\) cannot divide a member of \(S_Y\).

Thus \(m\) is legal and has no legal proper divisor, so \(m\in M_0\). 

### Prime regime

When \(Y\ge4\), each prime

\[
2n^{3/4}<p\le \frac n4
\]

exceeds \(Y\), is incomparable with the peel position, and has no nontrivial proper divisor. Hence \(p\in M_0\).

When \(Y<4\), the primes

\[
n^{1/4}<p\le n^{1/3}
\]

are likewise legal and minimal. If \(Y=2\) or \(3\), the selected small elements are among \(\{2,3\}\), and these large primes are divisible by neither. The optional upper-half prime is also incomparable. 

## 3. Private carriers and their continued legality: **passes**

### Rough carriers \(c_m=2m\)

Because \(h>2\), every \(h\)-rough \(m\) is odd. Every divisor of \(2m\) is \(d\) or \(2d\) for some \(d\mid m\). Other than \(m\) and \(2m\), such a divisor is at most

\[
\frac{2m}{P^{-}(m)}
 <\frac{2n}{5h}
 <\frac Y2.
\]

It is therefore already illegal. Consequently:

- no selected member of \(S_Y\) divides \(2m\);
- \(2m\) is legal at \(A_0\);
- among \(M_0\), its only divisor is \(m\);
- \(2m\notin M_0\), since its legal proper divisor \(m\) exists.

The carriers are pairwise incomparable. If \(2m\mid2m'\), then \(m\mid m'\). A nontrivial quotient \(m'/m\) has every prime factor greater than \(h\), hence \(m'/m>h\). But the range of \(K\) gives

\[
1<\frac{m'}m
 <\frac{n/5}{n/h}
 =\frac h5,
\]

a contradiction. 

The dynamic legality argument is also complete. Suppose \(v\) remains legal when Prolonger wants to play \(c_v\).

- An earlier carrier is incomparable with \(c_v\) by construction.
- If a Shortener-selected \(r\in M_0\) divided \(c_v\), privateness would force \(r=v\), contrary to \(v\) still being legal.
- If \(c_v\mid r\), then \(v\mid r\), contradicting the incomparability of distinct elements of \(M_0\).

Thus a surviving root’s carrier remains legal at the relevant moment.

### Prime carriers

For \(c_p=2p\), the only nontrivial proper divisors are \(2\) and \(p\). The number \(2\) is already illegal after the peel, while \(p\) is the unique first-layer divisor. Distinct \(2p\)’s are incomparable.

For \(c_p=p^2\), the only nontrivial proper divisor is \(p\), so privateness and pairwise incomparability are immediate.

## 4. The drafting lemma: **passes**

The alternation bookkeeping is correct.

Let \(B\) be the roots whose private carriers Prolonger plays, and let \(T\) be the roots of \(K\) selected exactly by Shortener. Since private carriers kill only their own roots and Shortener’s fixed-layer moves cannot kill a distinct member of \(M_0\), at the end of the sweep

\[
K=B\sqcup T.
\]

Except possibly for the first Shortener selection when Shortener moves first, every \(t\in T\) has an immediately preceding Prolonger turn. At that preceding turn, \(t\) was still legal, so it was among the candidates considered by the greedy rule. Pair \(t\) with the root \(v(t)\in B\) whose carrier Prolonger played then. These paired \(v(t)\)’s are distinct.

If \(B_t\) is the set Prolonger had already taken before choosing \(v(t)\), greedy choice gives

\[
\Delta(v(t)\mid B_t)\ge \Delta(t\mid B_t).
\]

When the elements of \(T\) are subsequently added to the final \(B\) in chronological order, submodularity only decreases each marginal:

\[
\Delta(t\mid B\cup T_{\mathrm{earlier}})
 \le \Delta(t\mid B_t).
\]

The paired contributions are therefore bounded by the corresponding, distinct increments by which elements entered \(B\), whose sum is at most \(F(B)\). The one possible initial unpaired element contributes at most

\[
b=\max_{v\in K}F(\{v\}).
\]

Hence

\[
F(K)-F(B)\le F(B)+b,
\]

and so

\[
F(B)\ge\frac{F(K)-b}{2}.
\]

Shortener cannot burn carriers faster than Prolonger can use them: a selected root invalidates only its own private carrier, and alternation permits at most one such loss between consecutive Prolonger turns. The lemma in the attachment states exactly this mechanism. 

Nor must the lemma track whether Shortener destroys points in the shadow. Its objective \(F\) is the **raw coverage function appearing in \((\mathrm{OS})\)**, not the number of shadow points still legal after the sweep.

## 5. Rough-number and prime estimates: **pass**

### Rough numbers

The linear-sieve estimate is applicable because each selected dyadic interval has

\[
X_j\ge2Y\ge h^3
\]

for sufficiently large \(n\), using \(h<n^{1/4}\). At level

\[
D=\frac{X}{(\log X)^4},
\]

one has

\[
\frac{\log D}{\log h}\ge3-o(1)>2,
\]

so the lower linear-sieve function is bounded positively, and the accumulated \(O(1)\) remainder over \(d<D\) is

\[
O(D)=o\!\left(\frac X{\log h}\right).
\]

There are \(\Theta(\log h)\) disjoint dyadic intervals between a constant multiple of \(Y\) and \(n/5\). Each contributes at least a constant multiple of \(1/\log h\) to the reciprocal sum. Therefore

\[
\sum_{m\in K}\frac1m\ge\eta
\]

for an absolute \(\eta>0\).

The upper sieve estimate and the geometric sum of the interval lengths give

\[
|K|=O\!\left(\frac n{\log h}\right)=o(n).
\]

Consequently

\[
F(K)
\ge
\frac n2\sum_{m\in K}\frac1m-2|K|
\ge c_1n,
\]

while

\[
\max_{m\in K}F(\{m\})<\frac h2=o(n).
\]

This part is quantitatively sound. 

### Prime reciprocal mass

Both prime intervals have the asserted limiting reciprocal mass:

\[
\sum_{2n^{3/4}<p\le n/4}\frac1p
=
\log\!\left(\frac43\right)+o(1),
\]

because the ratio of the logarithms of the endpoints tends to \(4/3\), and similarly

\[
\sum_{n^{1/4}<p\le n^{1/3}}\frac1p
=
\log\!\left(\frac43\right)+o(1).
\]

Since \(\log(4/3)>1/10\), a subfamily with

\[
s=\sum_{p\in K}\frac1p=\frac1{10}+o(1)
\]

exists. Individual reciprocals tend to zero, so the overshoot is \(o(1)\). Also \(|K|=o(n)\), trivially in the second interval and by the standard prime-count estimate in the first.

For

\[
U_p=\{p,2p,\ldots,\lfloor N/p\rfloor p\},
\qquad N=\lfloor n/2\rfloor,
\]

second-order Bonferroni gives

\[
\begin{aligned}
\left|\bigcup_{p\in K}U_p\right|
&\ge Ns-|K|-N\sum_{p<q}\frac1{pq}\\
&\ge Ns-|K|-\frac N2s^2.
\end{aligned}
\]

Removing the distinct roots \(p\) costs another \(|K|\), hence

\[
F(K)\ge N\left(s-\frac{s^2}{2}\right)-2|K|
      \ge c_2n.
\]

The largest single shadow is \(O(n^{1/4})\) in the \(2p\) case and \(O(n^{3/4})\) in the \(p^2\) case, so again \(b=o(n)\). 

## 6. Shadow accounting and quantifiers: **pass**

In the rough construction, suppose

\[
km=k'm'
\]

with \(m,m'\) \(h\)-rough and \(k,k'<h/2\). Every prime factor of \(k,k'\) is below \(h\), while every prime factor of \(m,m'\) is above \(h\). Unique factorization therefore separates the two parts and forces

\[
k=k',\qquad m=m'.
\]

Thus distinct rough roots have disjoint proper shadows.

In the prime construction, overlaps are not claimed to be absent; they are correctly handled by the pairwise Bonferroni subtraction.

Once the drafting lemma produces \(B\subseteq K\), every root in \(B\) was advance-killed, so \(B\subseteq K_0\). Therefore

\[
F(B)\le \left|\operatorname{Sh}^{-}(K_0)\right|.
\]

Choosing

\[
\varepsilon=\frac13\min\{c_1,c_2\}>0
\]

gives the claimed uniform linear lower bound.

The quantifier order is exactly right. Schematically, \((\mathrm{OS})\) says

\[
\exists H\to\infty\ 
\forall A_0\text{ obtainable}\ 
\exists\text{ ordering}\ 
\forall\text{ continuations}:
\quad |\operatorname{Sh}^{-}(K_0)|=o(n).
\]

Document B proves the stronger negation

\[
\forall H\to\infty\
\exists A_0\text{ obtainable}\
\forall\text{ orderings}\
\exists\text{ continuation}:
\quad |\operatorname{Sh}^{-}(K_0)|\ge\varepsilon n
\]

for all sufficiently large \(n\). 

Since the weighted sum dominates the union,

\[
\sum_{m\in K_0}
\left(\left\lfloor\frac{n}{2m}\right\rfloor-1\right)
\ge
|\operatorname{Sh}^{-}(K_0)|,
\]

the same example also refutes \((\mathrm{WOS})\).

## 7. Scope of the result: **Document B is correct**

The construction does **not** disprove the cumulative minimal-layer statement.

The containment from Document A is only

\[
\bigcup_{\ell\ge1}M_\ell
\subseteq
\operatorname{Sh}^{-}(K_0).
\]

There is no reverse containment. A large raw shadow may contain mostly integers rendered illegal by the moves that created it. Document A itself distinguishes the raw-shadow condition from the additional requirement that a linear part be chronologically exposed as later legal minima. 

The present examples make that distinction concrete:

- playing \(2m\) immediately kills every even multiple of \(m\);
- playing \(2p\) does the same for even multiples of \(p\);
- Shortener’s selected first-layer roots may kill further odd shadow elements.

Thus

\[
|\operatorname{Sh}^{-}(K_0)|\gg n
\]

alone yields no linear lower bound on

\[
\sum_{\ell\ge1}|M_\ell|.
\]

Document B proves that \((\mathrm{OS})\) and \((\mathrm{WOS})\) are excessively strong sufficient conditions. It correctly leaves the genuine growing-depth uniformity problem open.

### Nonfatal wording defects

Three statements should be edited in a polished version, but none warrants downgrading the verdict:

1. The optional \(q_n\) depends on the exact phase-boundary timing, not merely a “parity convention.” It can instead be treated as the first continuation move.
2. The sentence saying the prime construction divides according to whether \(2\) was selected is inaccurate: the written split is \(Y\ge4\) versus \(Y<4\), and for \(Y=2,3\), \(2\) is selected. The \(p^2\) construction nevertheless remains valid.
3. In the \(Y<4\) case, the large primes do not exceed the optional upper-half prime \(q_n\); they exceed every **lower peel member**. The following sentence separately proves incomparability with \(q_n\), so the argument is unaffected.

These are exposition repairs only. The claimed refutation of the literal \((\mathrm{OS})\) is correct.