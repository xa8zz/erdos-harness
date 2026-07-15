---
id: R157-postponed-service-laundering
type: research
date: 2026-07-14
intent: >
  Determine whether a linear active second-shell greedy interval can realize
  the causal obligations placed on Prolonger's replies, given that every
  final-survivor divisor's first blocker and every surviving target's
  transition to minimality are both provably Prolonger-caused.
predecessors: [R155-shortener-cover-causal-repair, R156-prolonger-common-core-mass-release]
prompt: erdos-872/prompts/researcher-R157-prolonger-reply-coverage.md
action:
  kind: extends
  target: R155-shortener-cover-causal-repair
claim: >
  A second causal collapse, postponed-service laundering, is distinct from
  post-blocker player laundering: crediting a reply's total end-of-interval
  release of newly-minimal greedy roots toward supplying the game's earlier
  greedy turns, when those roots did not yet exist at those earlier turns.
  The repair requires per-prefix accounting of release times, not an endpoint
  total. Lemma 1 (future-target persistence): fixing a representative
  y_i in D_i for each greedy move g_i (i = 1..T), for every t <= i, y_i lies
  in Q_t and g_i is legal at position A_t; consequently X union {y_i : i >= t}
  are pairwise-distinct elements of Q_t. Corollary 2 (future-service
  pressure): for any family R_t of current minimal legal roots covering that
  set, Delta_t >= (|X| + T - t + 1)/|R_t|; since {g_1,...,g_{t-1}} union R_t
  is primitive inside [2, n/4], |R_t| <= n/8 - t + O(1) + o(n), giving
  Delta_t >= (|X| + T - t + 1)/(n/8 - t + O(1) + o(n)) whenever the
  denominator is positive. Theorem 3 (unique Prolonger release time): for
  every t, exactly one holds — either g_t is in M(A_1), or there is a unique
  index gamma(t) < t such that g_t first becomes minimal legal immediately
  after the reply p_{gamma(t)} (uniqueness follows because once a legal
  integer is minimal it stays minimal as long as it remains legal). Theorem 4
  (exact prefix Hall equality): defining I(s) = {t <= s : g_t in M(A_1)} and
  C_j(s) = {t <= s : gamma(t) = j}, for every 1 <= s <= T, s = |I(s)| +
  sum_{j<s} |C_j(s)|; since |M(A_1)| = o(n) at a sparse entry position, for
  every linear prefix s asymp n, sum_{j<s} |C_j(s)| >= s - o(n). This prefix
  condition is strictly stronger than the endpoint inequality
  sum_{j<T} |C_j(T)| >= T - o(n), which a terminal release burst can satisfy
  while supplying none of the early greedy turns. The repaired chronological
  object (the bi-causal reply system) requires each reply p_j to jointly
  satisfy its survivor deadlines (tau(d) < s whenever k_X(d) > E/s), the
  multiscale prefix Hall equality at every degree threshold h, and the joint
  packet containment lcm(B_j union {lambda_j(r) : r in C_j}) divides p_j and
  is at most n, where lambda_j(r) is the lcm of r's currently-legal proper
  divisors immediately before p_j. Neither an unconditional proof that no
  such bi-causal system can be realized on a linear interval, nor an
  on-policy Prolonger construction realizing one, is established; the
  missing object is a joint packet-capacity bound coupling the two systems,
  which the supplied theorem stack (causal orientation, noncreation,
  common-core construction) does not supply.
implications:
  - Endpoint release totals are insufficient accounting; any future ledger
    must verify the prefix Hall equality at every prefix s, closing the
    twenty-first catalogued collapse (postponed-service laundering).
  - The coverage question is reduced to one named open object, a joint
    packet-capacity theorem - bound the cumulative target mass released by
    distinct-last-ancestor packets across replies, each packet's lcm
    dividing its reply and at most n, under sum Delta_t <= E and the
    survivor deadlines.
  - The repair is a localization theorem only; deeper shells inherit upward
    channels from earlier-shell replies, so second-shell resolution would
    establish FSC(2,eta) for this exact policy and tie-break, not L(n)=o(n)
    directly.
  - Prefix Hall, unique release times, noncreation, and causal orientation
    are settled inputs; the next attack should target the joint
    packet-capacity problem directly rather than re-deriving them.
confidence_at_time: medium
strategy_dependence: minimal-max-degree-policy-dependent
---

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