---
id: R159-tri-causal-coatom-preparation
type: research
date: 2026-07-15
intent: >
  Determine whether the previously-established bi-causal reply system (survivor-deadline
  containment plus last-ancestor lcm containment) suffices to characterize an on-trajectory
  second-shell greedy interval for the primitive-set divisibility game, or whether the joint
  packet-capacity question as posed conceals a further degenerate collapse requiring repair.
predecessors: [R157-postponed-service-laundering]
prompt: erdos-872/prompts/researcher-R159-joint-packet-capacity.md
action:
  kind: extends
  target: R157-postponed-service-laundering
claim: >
  The bi-causal reply system is necessary but not sufficient to characterize an on-trajectory
  second-shell greedy interval under the minimal-maximum-degree Shortener policy; a third,
  strictly earlier causal layer of coatom-preparation obligations is required, and omitting it
  (ancestor-preparation laundering) admits a linear reply table satisfying every previously
  recorded Hall, deadline, and joint-lcm condition that is nonetheless not a realizable
  trajectory. Precisely: for a reply p_j that first makes a future greedy root r minimal, let
  L_j(r) be the set of divisors d of r with 2<=d<r legal immediately before p_j, and
  lambda_j(r)=lcm(L_j(r)); this is legal, divides p_j, and lambda_j(r)<r.
  Lemma 1 (prime-quotient lemma): for every root r released this way, r/lambda_j(r) is prime,
  i.e. r=lambda_j(r)*q for a prime q, so every last-ancestor packet is a prime lift of its
  ancestor rather than an arbitrary refinement.
  Lemma 2 (off-branch coatoms already illegal): writing r=lambda*q with q prime, for every
  prime divisor pi of r with pi != q, the coatom r/pi is illegal immediately before p_j, because
  every legal proper divisor of r divides lambda while r/pi retains the full q-exponent of r and
  so does not divide lambda.
  Lemma 3 (coatom blockers are earlier Prolonger replies): if a coatom c_pi(r)=r/pi is legal at
  some Shortener turn and later becomes illegal while r remains legal, its first blocking move
  is necessarily a Prolonger reply p_i (by the noncreation property that a divisibility-minimal
  Shortener move cannot destroy a proper legal divisor of a surviving legal integer);
  c_pi(r) divides p_i; and if r is released at reply p_j then i<j.
  Lemma 4 (distinct coatoms require distinct blockers): for distinct prime divisors pi, rho of
  r, the first blocking replies of r/pi and r/rho cannot coincide, since a single move divisible
  by both would be divisible by their lcm, which equals r, illegalizing r itself.
  Consequently a released root r with omega(r) distinct prime factors carries at least
  omega(r)-1 distinct, pairwise-time-ordered earlier coatom-blocking replies (excepting coatoms
  already blocked before the active interval), giving the strict chronology
  beta(c) < gamma(r) < t (preparation < release < service). The correct object is a tri-causal
  reply system: at each reply p_j, the lcm of (i) discharged survivor-divisor obligations,
  (ii) last-ancestor obligations lambda_j(r) for roots released at j, and (iii)
  coatom-preparation obligations first served at j must divide p_j<=n; the third term is not
  reconstructible from the first two. An explicit linear construction (m=floor(c_0 n) roots
  g_t=10*b_t with distinct b_t clustered near n/170, replies p_{t-1}=15*b_t, lambda_t=5*b_t,
  an initial high-degree root g_1=13, and a size-m survivor set sharing one divisor equal to 3)
  satisfies every previously displayed prefix-Hall equality, nonvacuous survivor deadline, joint
  blocker/last-ancestor lcm containment, primitivity, and future-service-pressure condition, yet
  fails: for each t>=2 the coatom c_t=g_t/5=2*b_t is even while every reply p_j=15*b_{j+1} is
  odd, so no reply blocks it, and no earlier service move g_s can divide it either without
  forcing b_s=b_t; hence at most o(n) of the m=Theta(n) claimed roots ever actually become
  minimal, so the claimed release events do not occur. Proposition 5 (fixed-prime preparation
  capacity): for fixed alpha>0 and fixed Y, summing over service roots g_t>=alpha*n the count
  nu_Y(g_t) of preparation coatoms with prime index pi<=Y, pi != the release prime q_t, gives
  sum nu_Y(g_t) <= (Y/alpha)*E + O_alpha(Y^2*|A_1|), where E is the degree-ledger bound and A_1
  the o(n)-size entry set; this holds unconditionally for every actual interval, but for fixed Y
  both sides can remain linear in n with compatible constants, so it does not by itself exclude
  every positive-density threshold — a multiscale (growing-Y) version would be needed for a full
  exclusion. Open: whether no tri-causal system (satisfying beta<gamma<t together with the
  packet-capacity containment on all three components) can be realized under the
  minimal-maximum-degree greedy policy remains unproved; realizing such exclusion would
  establish the second-shell finite-shell-clearing statement for that policy. The chronology and
  coatom-preparation obligations are stated to iterate verbatim to every fixed deeper shell
  under the same policy, but replies discharged in earlier-processed shells enlarge the pool of
  available upward channels in deeper shells, so cumulative capacity becomes harder to bound and
  no finite-shell induction follows from this argument alone. No conclusion about whether the
  overall game length is sublinear, or its negation, follows.
implications:
  - The second-shell finite-shell-clearing statement for the minimal-maximum-degree policy
    cannot yet be concluded from the previously-recorded bi-causal packet conditions alone; any
    future capacity proof or trajectory construction must incorporate the coatom-preparation
    term.
  - Any future construction claiming to realize or exclude a second-shell interval must
    additionally verify that every off-branch coatom of every released root has an identified
    earlier blocking reply or pre-entry blocker.
  - The fixed-prime preparation-capacity bound is available as a genuine unconditional tool for
    bounding cumulative coatom obligations but requires a multiscale (growing-Y) strengthening
    to close the exclusion.
  - The causal-orientation lemmas rely specifically on Shortener's divisibility-minimal
    maximum-degree policy; a batch-aware or otherwise non-minimal policy would require
    re-deriving the coatom-blocker orientation from scratch.
confidence_at_time: medium
strategy_dependence: minimal-max-degree-policy-specific
---

# Verdict

\[
\boxed{\text{The joint packet-capacity question, as stated, has another causal collapse.}}
\]

The two recorded causal systems are still not sufficient to characterize an on-trajectory interval. There is a third, strictly earlier causal layer:

\[
\boxed{\textbf{coatom preparation before root release}.}
\]

A reply \(p_j\) cannot be credited with releasing a future greedy root merely because it contains the root’s last legal ancestor. Before that last ancestor can exist, all divisor branches outside it must already have been killed, and those deaths have their own earlier Prolonger blockers.

This gives a twenty-second collapse family:

\[
\boxed{\textbf{ancestor-preparation laundering}.}
\]

I prove below:

1. every released root is a **prime lift** of its last legal ancestor;
2. it carries a family of earlier, pairwise-time-distinct coatom-blocking obligations;
3. those obligations must be inserted into the same reply packets;
4. the numerical Hall/deadline/lcm conditions stated in Attachment K admit a linear packet table which nevertheless cannot be an actual trajectory, precisely because these coatom obligations were omitted.

Thus the advertised dichotomy is not valid:

- excluding the displayed bi-causal tables is stronger than necessary and in fact false at the purely recorded-data level;
- constructing such a table does not produce an on-trajectory Prolonger strategy.

The exact repaired object is a **tri-causal reply system**. The argument does not prove or disprove the repaired second-shell exclusion.

---

# 1. The missing prime-lift theorem

Consider one actual reply \(p_j\), and suppose it first makes a future greedy root \(r\) minimal. Immediately before \(p_j\), let

\[
L_j(r)=
\{d:2\le d<r,\ d\mid r,\ d\text{ legal}\}.
\]

This set is nonempty because \(r\) is not yet minimal. Put

\[
\lambda_j(r)=\operatorname{lcm}L_j(r).
\]

Attachment K proves that

\[
\lambda_j(r)\mid p_j,\qquad
\lambda_j(r)<r,
\]

and that \(\lambda_j(r)\) is legal.

There is a further consequence.

## Lemma 1: prime-quotient lemma

For every genuinely released root \(r\),

\[
\boxed{\frac{r}{\lambda_j(r)}\text{ is prime}.}
\]

### Proof

Write

\[
\lambda=\lambda_j(r).
\]

Suppose \(r/\lambda\) were composite. Then there exists an integer \(a\) with

\[
1<a<\frac r\lambda
\]

such that

\[
e=\lambda a\mid r.
\]

Hence

\[
\lambda<e<r.
\]

Because \(\lambda\) is legal and

\[
\lambda\mid e\mid r,
\]

the legal-divisor upset theorem implies that \(e\) is legal. Thus \(e\in L_j(r)\).

But \(\lambda\) is the lcm of every member of \(L_j(r)\), so \(e\mid\lambda\), contradicting \(e>\lambda\).

Therefore \(r/\lambda\) is prime. \(\square\)

Consequently every release has the exact form

\[
\boxed{r=\lambda q,\qquad q\ \text{prime}.}
\tag{1}
\]

So the last-ancestor packet is not an arbitrary refinement packet. It is a prime-lift packet.

---

# 2. Every prime lift has earlier coatom obligations

Let

\[
r=\lambda q
\]

be as in (1). For each distinct prime \(\pi\mid r\), define the corresponding coatom

\[
c_\pi(r)=\frac r\pi.
\]

The coatom corresponding to \(q\) is

\[
c_q(r)=\frac rq=\lambda.
\]

All other coatoms lie outside the \(\lambda\)-branch.

## Lemma 2: off-branch coatoms are already illegal

For every distinct prime divisor \(\pi\mid r\) with \(\pi\ne q\),

\[
\boxed{c_\pi(r)=\frac r\pi
\text{ is illegal immediately before }p_j.}
\tag{2}
\]

### Proof

At the prime \(q\), the exponent of \(r\) is one greater than the exponent of \(\lambda\). If \(\pi\ne q\), then \(r/\pi\) retains the full \(q\)-exponent of \(r\). Therefore

\[
\frac r\pi\nmid\lambda.
\]

Every legal proper divisor of \(r\) divides \(\lambda\), by the definition of \(\lambda\). Hence \(r/\pi\) cannot be legal. \(\square\)

Thus the reply \(p_j\) does not create the entire minimality of \(r\) in one step. It only kills the final branch \(\lambda\). Every other coatom branch was killed earlier.

Under the minimal-maximum-degree policy, those earlier deaths are also causally oriented.

## Lemma 3: coatom blockers are earlier Prolonger replies

Suppose \(c_\pi(r)\) is legal at some Shortener position and later becomes illegal while \(r\) remains legal. Its first blocker is a Prolonger reply \(p_i\), and

\[
\boxed{c_\pi(r)\mid p_i.}
\tag{3}
\]

Moreover, if \(r\) is released by \(p_j\), then

\[
i<j.
\]

### Proof

A divisibility-minimal Shortener move cannot destroy a proper legal divisor of a surviving legal integer; this is exactly the noncreation lemma.

Hence the first move destroying \(c_\pi(r)\) is a Prolonger reply \(p_i\).

Since \(r\) survives and \(c_\pi(r)\mid r\), the orientation

\[
p_i\mid c_\pi(r)
\]

would imply \(p_i\mid r\), killing \(r\). Therefore

\[
c_\pi(r)\mid p_i.
\]

Finally, (2) says the coatom is already illegal immediately before \(p_j\), so its first blocker precedes \(p_j\). \(\square\)

There is also a within-root injectivity law.

## Lemma 4: distinct coatoms of one root require distinct replies

If \(\pi,\rho\) are distinct prime divisors of \(r\), then the first blockers of

\[
\frac r\pi
\quad\text{and}\quad
\frac r\rho
\]

cannot be the same selected move.

### Proof

If one move \(a\) were divisible by both coatoms, then

\[
\operatorname{lcm}\left(\frac r\pi,\frac r\rho\right)=r
\]

would divide \(a\). That would make \(r\) illegal. \(\square\)

Therefore a released root \(r=\lambda q\) has at least

\[
\boxed{\omega(r)-1}
\tag{4}
\]

distinct earlier coatom-blocking replies, except for coatoms already blocked before the active interval.

The true chronology is therefore

\[
\boxed{
\text{coatom preparation}
\quad<\quad
\text{last-ancestor release}
\quad<\quad
\text{greedy service}.
}
\tag{5}
\]

Attachment K records only the last two arrows.

---

# 3. The actual packet has three components

For a service root \(r=g_t\), write

\[
\gamma(t)=j
\]

for its release time and

\[
q_t=\frac{g_t}{\lambda_j(g_t)}.
\]

By Lemma 1, \(q_t\) is prime.

Define its off-branch coatom family

\[
\mathcal K(t)
=
\left\{
\frac{g_t}{\pi}:
\pi\mid g_t,\ \pi\text{ prime},\ \pi\ne q_t
\right\}.
\tag{6}
\]

For each \(c\in\mathcal K(t)\), let

\[
\beta_t(c)
\]

be its true first-blocker index, with \(\beta_t(c)=0\) when the blocker lies in the sparse entry history.

Then every actual trajectory satisfies

\[
\boxed{
\beta_t(c)<\gamma(t)<t.
}
\tag{7}
\]

For a reply \(p_j\), define the multiset of coatom obligations first served at \(j\):

\[
\mathcal P_j
=
\left\{
c\in\mathcal K(t):
\beta_t(c)=j
\right\},
\]

with the root label \(t\) retained as multiplicity data.

The genuine reply packet is therefore

\[
\boxed{
\operatorname{lcm}\left(
\mathcal B_j
\cup
\{\lambda_j(r):r\in\mathcal C_j\}
\cup
\mathcal P_j
\right)
\mid p_j\le n.
}
\tag{8}
\]

Here:

- \(\mathcal B_j\) contains survivor-divisor obligations;
- \(\lambda_j(r)\) contains last-ancestor release obligations;
- \(\mathcal P_j\) contains preparation obligations for future releases.

The third term cannot be reconstructed from the first two.

This is the exact missing repair.

---

# 4. A linear table satisfying all the recorded K-conditions

I now construct a linear numerical/arithmetic packet table satisfying:

- the degree ledger;
- the exact prefix Hall equality;
- a genuinely nonvacuous survivor deadline;
- the joint blocker/last-ancestor lcm containment;
- the constant-cap suffix;
- the future-service pressure;
- primitiveness of all declared selected moves.

Nevertheless, almost every declared root release is impossible because its omitted coatom remains legal.

This proves that the recorded K-data are not sufficient to define an on-trajectory system.

Choose

\[
c_0=10^{-7},
\qquad
m=\lfloor c_0n\rfloor.
\]

For sufficiently large \(n\), choose distinct odd integers

\[
b_2,\ldots,b_m\in
\left(\frac n{171},\frac n{170}\right]
\]

coprime to \(3\cdot5\cdot13\).

For \(2\le t\le m\), set

\[
\lambda_t=5b_t,
\qquad
g_t=10b_t,
\qquad
p_{t-1}=15b_t.
\tag{9}
\]

Give \(g_t\) two designated shell targets

\[
y_t=50b_t,
\qquad
z_t=70b_t.
\tag{10}
\]

Both lie in \(S_1\), since

\[
\frac{50}{171}n>\frac n4,
\qquad
\frac{70}{170}n<\frac n2.
\]

The declared service degree is

\[
\Delta_t=2
\qquad(2\le t\le m).
\tag{11}
\]

Take \(g_1=13\) as an initially minimal root, with

\[
\Delta_1=m+1.
\tag{12}
\]

The \(m+1\) designated targets for \(g_1\) can be chosen among multiples of \(13\) in \(S_1\), avoiding the finitely many forbidden multiples coming from (9)–(10).

## 4.1 The selected moves are primitive

All \(g_t\) lie in the narrow interval

\[
\left(\frac{10n}{171},\frac n{17}\right],
\]

and all \(p_t\) lie in

\[
\left(\frac{5n}{57},\frac{3n}{34}\right].
\]

Thus moves of the same type are pairwise incomparable.

For cross-comparability,

\[
\frac{p_i}{g_t}
=
\frac32\,\frac{b_{i+1}}{b_t}
\in
\left(
\frac32\frac{170}{171},
\frac32\frac{171}{170}
\right)
\subset(1,2).
\]

Hence no \(g_t\) divides a \(p_i\), and no \(p_i\) divides a \(g_t\).

Excluding multiples of \(13\) ensures compatibility with \(g_1\). Therefore the declared move sequence itself is primitive.

## 4.2 The intended service targets are preserved

For the matching index,

\[
g_t\mid y_t,\qquad g_t\mid z_t,
\]

while

\[
\frac{p_{t-1}}{g_t}=\frac32,
\qquad
\frac{y_t}{p_{t-1}}=\frac{10}{3},
\qquad
\frac{z_t}{p_{t-1}}=\frac{14}{3}.
\]

Hence the reply preserves \(g_t,y_t,z_t\).

For \(i\ne t\),

\[
\frac{y_i}{g_t}
=
5\frac{b_i}{b_t}
\in
\left(
5\frac{170}{171},
5\frac{171}{170}
\right).
\]

The only integer in this interval is \(5\), which would force \(b_i=b_t\). Thus \(g_t\) divides only its two designated targets. The same argument with \(7b_i/b_t\) applies to \(z_i\).

So the declared deletion sets are pairwise disjoint and have the stated sizes.

---

# 5. A nonvacuous survivor deadline

Take a formal survivor set \(X\) of size \(m\). Its initially legal incidence data contain:

- one common divisor \(d_\ast=3\) with
  \[
  k_X(3)=m;
  \]
- private persistent roots, each of incidence \(1\).

The survivor values themselves may, for example, be chosen as

\[
x_i=3c_i,
\qquad
c_i\in
\left(\frac{10n}{111},\frac n{11}\right],
\]

with the \(c_i\) distinct and avoiding the finitely many selected-move divisibilities. Then \(x_i\in S_1\), while \(c_i\) is a proper divisor of \(x_i\).

Declare \(p_1=15b_2\) to be the first blocker of \(3\). Since \(3\nmid b_2\),

\[
\operatorname{lcm}(3,\lambda_2)
=
\operatorname{lcm}(3,5b_2)
=
15b_2=p_1.
\tag{13}
\]

Set

\[
T=m,
\qquad
E=3m-1.
\]

Indeed,

\[
\sum_{t=1}^{m}\Delta_t
=
(m+1)+2(m-1)
=
3m-1
=
E.
\tag{14}
\]

The deadline for \(d_\ast=3\) is genuinely active. For \(s=1,2\),

\[
m\le\frac{3m-1}{s},
\]

but at \(s=3\),

\[
m>\frac{3m-1}{3}=m-\frac13.
\]

Thus the deadline demands a blocker with index \(<3\), and \(p_1\) supplies it.

All incidence-one persistent divisors have no deadline, because for every \(s\le m\),

\[
\frac Es
\ge
\frac{3m-1}{m}
>
1.
\]

So the recorded survivor deadline system is satisfied, nonvacuously.

---

# 6. Exact prefix Hall and packet containment

Declare

\[
g_1\in\mathcal M(A_1)
\]

and, for \(t\ge2\),

\[
\gamma(t)=t-1.
\]

Then for every prefix \(s\),

\[
|I(s)|=1
\]

and

\[
\sum_{j<s}|C_j(s)|=s-1.
\]

Hence

\[
\boxed{
s
=
|I(s)|
+
\sum_{j<s}|C_j(s)|
}
\]

holds exactly.

The multiscale Hall equalities also hold:

- \(g_1\) accounts for the only degree \(>2\) service;
- each later reply supplies exactly one degree-\(2\) root before its service.

For the packets:

- \(p_1\) contains both \(3\) and \(\lambda_2\);
- for \(j\ge2\),
  \[
  \lambda_{j+1}\mid p_j.
  \]

Thus every displayed joint blocker/release containment in Attachment K holds.

The final population size is

\[
|X|=m>\eta |S_1|
\]

for any fixed \(\eta<4c_0\).

Finally, for \(t\ge2\),

\[
\frac{|X|+T-t+1}{n/8-t+O(1)+o(n)}
\le
\frac{2m}{n/9}
=
18c_0+o(1)
<2=\Delta_t.
\]

So the future-service pressure is satisfied. There is a constant-cap suffix of length \(m-1\).

We have therefore produced a linear table satisfying every displayed numerical and packet condition used in the proposed capacity question.

---

# 7. Why the table cannot be an actual trajectory

For \(t\ge2\),

\[
g_t=10b_t,
\qquad
\lambda_t=5b_t,
\qquad
\frac{g_t}{\lambda_t}=2.
\]

The prime quotient is \(q_t=2\). Consider the coatom associated with the distinct prime \(5\):

\[
c_t=\frac{g_t}{5}=2b_t.
\tag{15}
\]

It does not divide \(\lambda_t=5b_t\). Consequently Lemma 2 says that \(c_t\) must already be illegal before the alleged release of \(g_t\).

But none of the recorded moves blocks it.

Every reply \(p_j=15b_{j+1}\) is odd, while \(c_t\) is even, so

\[
c_t\nmid p_j.
\]

For an earlier service move \(g_s=10b_s\),

\[
c_t\mid g_s
\quad\Longrightarrow\quad
2b_t\mid10b_s
\quad\Longrightarrow\quad
b_t\mid5b_s.
\]

Yet

\[
5\frac{b_s}{b_t}
\in
\left(
5\frac{170}{171},
5\frac{171}{170}
\right),
\]

whose only integer is \(5\). This would force \(b_s=b_t\), impossible for \(s\ne t\).

So no earlier listed move blocks \(c_t\).

Could the sparse entry history block all the \(c_t\)? No. Since

\[
c_t>\frac{2n}{171},
\]

one integer \(a\le n\) can be divisible by at most \(85\) distinct \(c_t\): if \(c_t\mid a\), then

\[
1\le\frac a{c_t}<\frac{171}{2},
\]

and each integer quotient determines at most one \(c_t\).

An entry position of size \(o(n)\) therefore blocks at most

\[
85\,o(n)=o(n)
\]

of the \(m=\Theta(n)\) coatoms.

For all but \(o(n)\) indices \(t\), the divisor \(c_t\) remains legal immediately after \(p_{t-1}\). Since

\[
c_t\mid g_t,
\]

the declared root \(g_t\) is not minimal.

Thus the claimed release events do not exist.

\[
\boxed{
\text{The linear table satisfies the recorded bi-causal data,
but violates the omitted coatom-preparation causality.}
}
\]

This is not a Prolonger strategy. It is a counterexample to the claim that the displayed bi-causal packet data are sufficient to characterize one.

---

# 8. Exact repaired abstraction

A schedule abstraction equivalent to an actual minimal-greedy interval must contain three first-event maps.

## Survivor side

For every initially legal divisor \(d\) incident with \(X\),

\[
\tau(d)=\min\{j:d\mid p_j\},
\]

with

\[
k_X(d)>\frac Es
\quad\Longrightarrow\quad
\tau(d)<s.
\]

## Release side

For every service root \(g_t\),

\[
\gamma(t)=0
\quad\text{or}\quad
\gamma(t)<t,
\]

and when \(\gamma(t)=j>0\),

\[
g_t=\lambda_j(g_t)q_t,
\qquad q_t\text{ prime}.
\]

## Preparation side

For every

\[
c=\frac{g_t}{\pi},
\qquad
\pi\mid g_t,\quad \pi\ne q_t,
\]

one must record a true first-blocker time

\[
\beta_t(c)<\gamma(t),
\]

or an identified pre-entry blocker.

For fixed \(t\), the blocker times of its distinct coatoms are distinct.

At every reply,

\[
\operatorname{lcm}\left(
\mathcal B_j
\cup
\{\lambda_j(r):\gamma(r)=j\}
\cup
\mathcal P_j
\right)
\mid p_j\le n.
\]

This is the correct **tri-causal reply system**.

The three chronological arrows are

\[
\boxed{
\beta
\;<\;
\gamma
\;<\;
t
}
\]

for preparation, release and service.

Dropping \(\beta<\gamma\) is ancestor-preparation laundering.

---

# 9. A genuine capacity inequality for the repaired system

The repair is not merely semantic. It yields an unconditional packet-capacity bound that handles arbitrary replies.

Fix \(\alpha>0\) and a constant \(Y\). Consider service roots

\[
g_t\ge\alpha n.
\]

For each such root, count the preparation coatoms corresponding to primes \(\pi\le Y\), excluding its release prime \(q_t\):

\[
\nu_Y(g_t)
=
\#\{\pi\le Y:\pi\mid g_t,\ \pi\ne q_t\}.
\]

## Proposition 5: fixed-prime preparation capacity

Every actual interval satisfies

\[
\boxed{
\sum_{t:g_t\ge\alpha n}\nu_Y(g_t)
\le
\frac{Y}{\alpha}\,E
+
O_\alpha\!\left(Y^2|A_1|\right).
}
\tag{16}
\]

Since \(|A_1|=o(n)\), the second term is \(o(n)\) for fixed \(Y\).

### Proof

A coatom corresponding to \(\pi\le Y\) has size

\[
c=\frac{g_t}{\pi}
\ge
\frac{\alpha n}{Y}.
\]

Consider a reply \(p_j\). The number of distinct divisors \(c\mid p_j\) satisfying \(c\ge\alpha n/Y\) is at most \(Y/\alpha\), because

\[
\frac{p_j}{c}\le\frac{Y}{\alpha}
\]

and each integer quotient determines at most one \(c\).

For a fixed such coatom \(c\), every future root assigned to \(c\) has a distinct future representative \(y_t\in Q_j\) divisible by \(c\). Therefore its multiplicity is at most

\[
\deg_{Q_j}(c)\le\Delta_j.
\]

Thus reply \(p_j\) serves at most

\[
\frac{Y}{\alpha}\Delta_j
\]

such preparation obligations.

Summing over replies gives

\[
\frac{Y}{\alpha}\sum_j\Delta_j
\le
\frac{Y}{\alpha}E.
\]

For a pre-entry move \(a\), there are at most \(Y/\alpha\) relevant large coatom divisors \(c\mid a\). For fixed \(c\), a root with coatom \(c\) has the form

\[
g=c\pi,\qquad \pi\le Y\text{ prime},
\]

so at most \(Y\) roots use that \(c\). Hence one entry move serves \(O_\alpha(Y^2)\) obligations. Summing over \(A_1\) proves (16). \(\square\)

This is a real cumulative reply-capacity theorem, and it makes no assumption about the shape of Prolonger’s replies beyond legality and \(p_j\le n\).

It does not alone exclude every \(c>0\): for fixed \(Y\), both sides of (16) can be linear with compatible constants. A full exclusion would need a multiscale version that remains effective when \(Y\) grows, together with control of low-coatom packets. That is a stronger problem than Attachment K’s bi-causal formulation.

---

# 10. Consequences

## Second shell

The packet-capacity target in the question is not yet equivalent to \(\mathrm{FSC}(2,\eta)\). The exact conclusion is

\[
\boxed{
\begin{array}{c}
\text{The displayed Hall, deadline and joint-lcm conditions are necessary}\\
\text{but not sufficient for an on-trajectory interval.}\\[1mm]
\text{A third, earlier coatom-preparation system is mandatory.}
\end{array}}
\]

The linear construction above is not a disproof of the greedy policy. It explicitly fails the repaired preparation requirements.

Conversely, proving that no **tri-causal** system is realizable would prove the desired second-shell exclusion for the fixed minimal-maximum-degree policy and its fixed activation data.

## Other Shortener policies

Nothing here proves failure of a batch-aware policy, nor even failure of the prescribed greedy policy. The coatom-first-blocker orientation uses the fact that Shortener plays divisibility-minimal maximum-degree moves. For a nonminimal maximum-degree policy, Shortener herself may participate in ancestor destruction, and the causal system must be changed.

## Deeper shells

The prime-quotient lemma, the coatom preparation obligations and the strict chronology

\[
\beta<\gamma<t
\]

iterate verbatim to every fixed deeper shell under the minimal policy.

They do not produce a finite-shell induction. In deeper shells, replies from every earlier processed shell may discharge coatom obligations, so the set of available upward channels is larger. The repaired packet theorem remains necessary, but its cumulative capacity becomes harder to bound.

## The game value \(L(n)\)

No conclusion about

\[
L(n)=o(n)
\]

or its negation follows. The result establishes a formulation failure and its exact repair, not a linear Prolonger strategy and not a second-shell clearing theorem.

---

# Final ruling

\[
\boxed{
\begin{array}{l}
\textbf{The joint packet-capacity question in Attachment K is REPAIRABLE.}\\[1mm]
\textbf{Its missing condition is pre-release coatom preparation.}\\[1mm]
\textbf{Every released root is a prime lift of its last ancestor.}\\[1mm]
\textbf{All other prime coatoms require distinct earlier Prolonger blockers.}\\[1mm]
\textbf{The correct object is tri-causal, with }\beta<\gamma<t.\\[1mm]
\textbf{The recorded bi-causal inequalities admit linear nontrajectory tables,}\\
\textbf{so they cannot by themselves prove the desired capacity bound.}
\end{array}}
\]

This is the twenty-second collapse: **ancestor-preparation laundering**.