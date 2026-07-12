---
id: R143-thinness-capture-confirmed
type: verification
date: 2026-07-12
intent: >
  Adversarial referee audit of the fixed-depth thinness lemma and the
  d^{-1/2} randomized capture strategy before load-bearing use.
predecessors: [R137-legal-divisor-depth-capture]
action:
  kind: confirms
  target: R137-legal-divisor-depth-capture
claim: >
  Verdicts: A VALID (the thinness lemma is airtight — lambda counts x
  itself, making T_1 exactly the minimal layer and the induction
  inequality lambda(d) <= lambda(x) - 1 exact via S(d) contained in
  S(x) minus {x}; height bound and Mirsky decomposition correct; the
  counting contradiction completes uniformly). B VALID with an
  interpretation repair: the backward-induction derandomization
  controls the AGGREGATE survivor count (the expectation bound), not
  each target's individual hazard bound; with that reading the
  denominator bound, the q_i >= i divisor ordering, the (2/3)K^{3/2}
  partial sum, the adaptive conditional-hazard argument, and the
  n exp(-sqrt(K)/3) expectation bound are all correct. C REPAIRABLE:
  the composition to L(n) = o(n) needs an explicit
  expectation-to-minimax step (currently skipped) but is correct after
  it; the non-diagonalization warning is right in the coupled
  K-versus-position-density setting — an admissible modulus family
  makes b_K(1/K) = 1 for all large K, so no slowly growing K(n)
  repairs the coupled estimate, although diagonalization DOES work for
  a single independently given sublinear position sequence. Bottom
  line: both ingredients survive scrutiny; a suitable
  trajectory-restricted growing-depth bound would complete the
  upper-bound proof after the stated repairs.
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R143-thinness-capture.md
---

## Three verdicts

**A. VALID.**  
**B. VALID, provided derandomization is understood as controlling the aggregate survivor count, not preserving every target’s individual hazard bound.**  
**C. REPAIRABLE.** The proposed implication to \(L(n)=o(n)\) is correct after an expectation-to-minimax step that the document currently skips. The non-diagonalization warning is correct in the coupled \(K\)-versus-position-density setting. 

---

## A. Fixed-depth thinness lemma — **VALID**

### 1. Height and Mirsky decomposition

For legal \(x\),

\[
\lambda_A(x)=\#\{d\in\mathcal L(A):d\mid x\}
\]

**does count \(x\) itself**, because \(x\in\mathcal L(A)\) and \(x\mid x\). Consequently,

\[
\lambda_A(x)=1
\]

is exactly the assertion that \(x\) has no legal proper divisor, so \(T_1(A)=\mathcal M(A)\).

If

\[
x_1\mid x_2\mid\cdots\mid x_r
\]

is a chain of distinct elements of \(T_k(A)\), all \(x_i\) are distinct legal divisors of \(x_r\). Therefore

\[
r\leq \lambda_A(x_r)\leq k.
\]

Thus the height is at most \(k\), and Mirsky gives a partition into at most \(k\) antichains. This step is correct.

### 2. The induction inequality is correct

After removing \(C\cap T_{k-1}(A)\), every remaining \(x\in C\) satisfies

\[
\lambda_A(x)=k.
\]

In particular \(D_x\neq\varnothing\). For \(d\in D_x\), define

\[
S_A(y):=\{e\in\mathcal L(A):e\mid y\}.
\]

Since \(d\mid x\),

\[
S_A(d)\subseteq S_A(x).
\]

Moreover, \(x\in S_A(x)\) but \(x\notin S_A(d)\), because \(d<x\). Hence, more precisely,

\[
S_A(d)\subseteq S_A(x)\setminus\{x\},
\]

and therefore

\[
\lambda_A(d)\leq \lambda_A(x)-1\leq k-1.
\]

So

\[
D_x\subseteq T_{k-1}(A)
\]

is fully justified. There is no off-by-one error; counting \(x\) itself is exactly what makes the inequality work.

### 3. The low-degree and random-coverage estimates work

Writing \(s=|T_{k-1}(A)|=o(n)\) and

\[
\eta=\max\{s/n,1/n\},\qquad p=\eta^{1/3},\qquad R=\eta^{-2/3},
\]

one has

\[
\frac{Rs}{n}\leq \eta^{1/3}\longrightarrow0
\]

and

\[
p(R-1)=\eta^{-1/3}-\eta^{1/3}\longrightarrow\infty.
\]

Thus the low-degree population is \(o(n)\), and for every non-low-degree \(x\),

\[
\Pr(x\text{ fails to become minimal}\mid x\notin Z)
\leq (k-1)e^{-p(R-1)}=o(1),
\]

uniformly because \(k\) is fixed.

The minimality argument is also correct. If every \(d\in D_x\) divides a selected \(z\in Z\), then:

- \(x\) remains legal because \(C\) is an antichain and \(x\notin Z\);
- every formerly legal proper divisor of \(x\) becomes illegal;
- previously illegal divisors cannot become legal when the chosen set is enlarged.

Hence \(x\in\mathcal M(A\cup Z)\).

### 4. The omitted simultaneous-realization step really does follow

Let \(Y\) be the number of elements of \(C\) that become minimal. Under the contradictory assumption \(|C|\geq\varepsilon n\),

\[
\mathbb EY=(1-o(1))|C|.
\]

Since \(0\leq Y\leq |C|\),

\[
\mathbb E(|C|-Y)=o(|C|).
\]

Therefore, by Markov,

\[
\Pr\left(Y<\frac{|C|}{2}\right)
=
\Pr\left(|C|-Y>\frac{|C|}{2}\right)
=o(1).
\]

Also,

\[
\mathbb E|Z|=p|C|\leq pn=o(n),
\]

and Markov gives, for example,

\[
\Pr\bigl(|Z|>2pn\bigr)\leq \frac12.
\]

For sufficiently large \(n\), the event \(Y\geq |C|/2\) has probability greater than \(1/2\), while \(|Z|\leq2pn=o(n)\) has probability at least \(1/2\). Their intersection therefore has positive probability. Thus there is a realization with both

\[
|Z|=o(n)
\quad\text{and}\quad
|\mathcal M(A\cup Z)|\geq |C|/2.
\]

So the contradiction with static completion genuinely completes. No concentration theorem or independence between these two statistics is needed.

### 5. Uniformity is established in the proper sequential sense

If uniformity failed, there would be an \(\varepsilon>0\), a subsequence, and primitive \(A_n\) with

\[
|A_n|=o(n),\qquad |T_k(A_n)|\geq\varepsilon n.
\]

Mirsky would provide an antichain of size at least \(\varepsilon n/k\), and the preceding construction would produce primitive \(P_n=A_n\cup Z_n\) with

\[
|P_n|=o(n),\qquad |\mathcal M(P_n)|=\Omega(n),
\]

contradicting the supplied theorem.

Thus the claimed uniform \(o(n)\) over all sublinear position families is valid.

---

## B. Randomized capture strategy — **VALID, with aggregate-only derandomization**

### 1. Denominator bound

Because \(t^{-1/2}\) is decreasing,

\[
\sum_{z=2}^{n}z^{-1/2}
\leq\int_1^n t^{-1/2}\,dt
=2(\sqrt n-1)
<2\sqrt n.
\]

So (8) is correct.

### 2. Divisor-sum lower bound

Take \(K\) distinct legal divisors \(d_i\mid x\) and write

\[
q_i=\frac{x}{d_i}.
\]

Distinct \(d_i\) give distinct positive integers \(q_i\). After sorting,

\[
1\leq q_1<q_2<\cdots<q_K,
\]

so necessarily \(q_i\geq i\). Hence

\[
\sum_{\substack{d\mid x\\d\text{ legal}}}d^{-1/2}
\geq x^{-1/2}\sum_{i=1}^{K}\sqrt{q_i}
\geq n^{-1/2}\sum_{i=1}^{K}\sqrt{i}.
\]

Finally,

\[
\sum_{i=1}^{K}\sqrt{i}
\geq \int_0^K\sqrt t\,dt
=\frac23K^{3/2}.
\]

Therefore

\[
\sum_{\substack{d\mid x\\d\text{ legal}}}d^{-1/2}
\geq \frac23\,\frac{K^{3/2}}{\sqrt n},
\]

and division by the denominator gives

\[
h:=\Pr(\text{select a divisor of }x)
\geq\frac{K^{3/2}}{3n}.
\]

The constant \(1/3\) is correct.

### 3. Adaptive Prolonger causes no filtration problem

Legal sets shrink monotonically as the position grows. Therefore \(\lambda_A(x)\) cannot increase, and an illegal \(x\) cannot become legal again.

Let \(E_t(x)\) be the event that, after \(t\) Shortener turns, \(x\) is legal and has at least \(K\) legal divisors. If \(E_T(x)\) occurs, then \(x\) must have remained in the high-divisor regime at every earlier Shortener decision.

Condition on the full realized history before a Shortener turn. Either Prolonger’s preceding move has already killed \(x\) or reduced \(\lambda(x)\) below \(K\), in which case the next \(E_t(x)\) event is impossible; or \(x\) is still high-depth, in which case the conditional killing probability is at least \(h\). Thus

\[
\Pr(E_t(x)\mid\mathcal F_{t-1})
\leq (1-h)\mathbf 1_{E_{t-1}(x)}.
\]

Iterating by the tower property gives

\[
\Pr(E_T(x))
\leq(1-h)^T
\leq e^{-hT}.
\]

There is no optional-stopping issue: the horizon is fixed. If the game terminates early, one may regard the terminal state as absorbing, and \(E_T(x)\) is then false.

### 4. Expected count

Let

\[
H_T=\#\{x\in\mathcal L(A_T):\lambda_{A_T}(x)\geq K\}.
\]

Linearity of expectation gives

\[
\mathbb EH_T
=\sum_{x=2}^n\Pr(E_T(x))
\leq n\exp\left(-\frac{TK^{3/2}}{3n}\right).
\]

For \(T=\lceil n/K\rceil\),

\[
\frac{TK^{3/2}}{3n}\geq\frac{\sqrt K}{3},
\]

so

\[
\mathbb EH_T\leq ne^{-\sqrt K/3}=o(n)
\]

whenever \(K\to\infty\). Equation (12) is correct.

### 5. What derandomization does and does not preserve

Backward induction can derandomize the **aggregate payoff \(H_T\)**.

Treat \(H_T\) as the terminal payoff in a finite-horizon perfect-information zero-sum game. The weighted behavioral strategy guarantees

\[
\sup_{\text{adaptive Prolonger}}\mathbb EH_T
\leq ne^{-\sqrt K/3}.
\]

At a Shortener node, the minimum child continuation value is no greater than the weighted average of the child values; at a Prolonger node, take the maximum. Backward induction therefore yields a deterministic Shortener policy with

\[
H_T\leq ne^{-\sqrt K/3}
\]

against every Prolonger play.

What is **not** preserved is the individual statement

\[
\Pr(E_T(x))\leq e^{-\sqrt K/3}
\]

simultaneously for each \(x\). Under a deterministic policy, those targetwise events are simply true or false. The deterministic conclusion is only that the **total number** of surviving high-depth targets is small.

Because the derandomization sentence follows (12), that aggregate interpretation is the natural one. Under that interpretation, B is valid.

---

## C. Composition with growing-depth thinness — **REPAIRABLE**

The central combinatorial composition is right, but the document improperly shifts from an expectation bound to a pathwise statement.

Let

\[
G_T=
\#\{x\in\mathcal L(A_T):\lambda_{A_T}(x)\leq K\}
\]

and retain \(H_T\) as above. The sets overlap when \(\lambda=K\), but this is harmless:

\[
|\mathcal L(A_T)|\leq G_T+H_T.
\]

Suppose (GD) gives, uniformly over all trajectories of the weighted policy,

\[
G_T\leq\varepsilon_n n,\qquad \varepsilon_n\to0.
\]

Equation (12) gives only

\[
\mathbb EH_T=o(n),
\]

not \(H_T=o(n)\) on every trajectory. Therefore the sentence

> “by (12) the complementary high-divisor population is \(o(n)\). Hence the entire legal set … is \(o(n)\)”

is not literally justified pathwise.

### The repair

Keep the weighted policy randomized through the entire argument. Legal sets are monotone, so every move after time \(T\) must select a distinct member of \(\mathcal L(A_T)\). Hence the continuation length \(R_T\) satisfies deterministically

\[
R_T\leq|\mathcal L(A_T)|
\leq G_T+H_T.
\]

The prefix through \(T\) Shortener turns has at most \(2T+O(1)\) total moves. Consequently, against every adaptive Prolonger,

\[
\begin{aligned}
\mathbb E[\text{total game length}]
&\leq 2T+O(1)+\mathbb EG_T+\mathbb EH_T\\
&\leq O(n/K)+\varepsilon_n n+ne^{-\sqrt K/3}\\
&=o(n).
\end{aligned}
\]

Now apply backward induction **once, to the total game-length payoff**. This produces a deterministic Shortener strategy with worst-case total length \(o(n)\).

This joint derandomization is important. One cannot first derandomize only the capture payoff \(H_T\) and then automatically invoke (GD), because the resulting deterministic capture policy need not follow the weighted-policy trajectories to which (GD) applies.

Thus no additional combinatorial endgame lemma is needed. The missing step is probabilistic/minimax bookkeeping:

1. obtain an expected \(o(n)\) legal set under the weighted policy;
2. bound the continuation by that legal set;
3. derandomize the total payoff.

An expected version of (GD),

\[
\sup_{\text{Prolonger}}
\mathbb E G_T=o(n),
\]

would already suffice. Therefore the displayed pathwise-uniform (GD) is stronger than strictly necessary, so calling it the uniquely “exact” missing statement is slightly overstated. It is, however, a valid sufficient missing statement for this route.

### The fixed-\(k\) diagonalization warning is correct

For each fixed \(k\),

\[
b_k(\alpha)=\min\left\{1,\frac{k}{\log(1/\alpha)}\right\}
\longrightarrow0
\quad(\alpha\downarrow0).
\]

But

\[
b_k(1/k)
=
\min\left\{1,\frac{k}{\log k}\right\}
=1
\]

for all sufficiently large \(k\). Hence for every \(K(n)\to\infty\),

\[
b_{K(n)}(1/K(n))=1.
\]

So no choice of “sufficiently slow” \(K(n)\) repairs the coupled estimate using only fixed-\(k\) convergence.

There is an important qualification: for one **fixed, independently given** sublinear sequence of positions \(A_n\), ordinary diagonalization can choose \(K(n)\to\infty\) slowly enough that \(T_{K(n)}(A_n)=o(n)\). What fails here is the coupled situation in which \(K\) also determines the observation time and hence the position density, approximately \(1/K\). That is precisely the modulus coupling represented by the example and by the cited refinement/regeneration obstructions.

---

## Bottom line

The two new unconditional ingredients survive scrutiny:

\[
\boxed{\text{Fixed-depth thinness is valid.}}
\]

\[
\boxed{\text{Weighted capture and its aggregate derandomization are valid.}}
\]

The document still does **not** prove \(L(n)=o(n)\). Its growing-depth obstruction is real. Section 3 needs the expectation/full-game derandomization repair above, but after that repair, a suitable trajectory-restricted growing-depth bound would indeed complete the upper-bound proof.