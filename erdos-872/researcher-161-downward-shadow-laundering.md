---
id: R161-downward-shadow-laundering
type: research
date: 2026-07-15
intent: >
  Determine whether the tri-causal (preparation < release < service) capacity
  accounting for a linear active second-shell greedy interval, combined with
  growing-scale small-prime coatom counts, excludes every linear tri-causal
  reply system, or whether an on-trajectory strategy realizes one.
predecessors: [R159-tri-causal-coatom-preparation]
prompt: erdos-872/prompts/researcher-R161-multiscale-preparation-capacity.md
action:
  kind: extends
  target: R159-tri-causal-coatom-preparation
claim: >
  The tri-causal record (preparation-coatom illegality < root release < root
  service) omits a fourth causal layer, exhibited by two equivalent framings.
  Downward-shadow laundering: a reply's preparation packet contains coatoms
  c_e from distinct future roots that appear individually multiplicity-one
  against their designated targets, but their common divisor (a downward
  shadow) can itself have large degree against those same targets; this gcd
  degree is untracked by the tri-causal record. Face-pressure laundering: the
  packet records only its maximal faces (individual coatoms), so the same
  formal packet is compatible with either unit cost or hidden common-shadow
  cost, and no scalar bound of the form sum_j Delta_j <= E distinguishes the
  two cases. Theorem 3 (downward-shadow dichotomy) resolves this: for a reply
  p_j discharging preparation obligations O_j, and any nonempty U subset O_j
  with d_U = gcd{c_e : e in U} >= 2, exactly one holds: either d_U is legal
  at Shortener position j, forcing |U| <= Delta_j (the current maximum
  degree); or d_U is illegal at j, and its first Prolonger blocker p_i
  satisfies d_U | p_i with i < j. The repair for downward-shadow laundering
  is the shadow-closure condition: for every reply and every nonempty
  coatom-packet subfamily, record either the legal-degree bound or the
  earlier first-blocker index and divisibility relation. The repair for
  face-pressure laundering is the full face-pressure condition (FP): for
  every currently legal d and Z_j the set of surviving future representative
  targets at position j, k_{Z_j}(d) = |{z in Z_j : d | z}| <= Delta_j. The
  resulting chronology is shadow blocking < coatom blocking < root release <
  root service, i.e. sigma < beta < gamma < t.
  Section 1: for T Shortener turns in an active interval with degree ledger
  E, T <= E, and for any Y >= 2, sum_{t: g_t >= alpha n} nu_Y(g_t) <= pi(Y) T
  <= pi(Y) E <= (Y/alpha) E, so the fixed-prime bound (Y/alpha) E +
  O_alpha(Y^2 |A_1|) is weaker than the trivial degree-ledger bound.
  Proposition 1: for arbitrary scales Y_k >= 2 and weights w_k >= 0, sum_k
  w_k sum_{t: g_t >= alpha n} nu_{Y_k}(g_t) <= (E/alpha) sum_k w_k Y_k, which
  is already dominated by the sum of the fixed-Y principal terms; hence no
  nonnegative multiscale summation, integration, or diagonal choice of Y(n)
  applied to the fixed-Y estimate can extract new capacity information.
  Section 2: for any family G contained in (alpha n, beta n] with |G| >=
  delta n (0 < alpha < beta < 1), the Turán-Kubilius estimate gives sum_{g in
  G} nu_Y(g) >= (delta/3 - o(1)) n log log Y as Y -> infinity; a
  positive-density linear root family genuinely carries n log log Y
  small-prime preparation obligations, and the gap between this divergent
  lower bound and the linear-in-Y upper bound Y E is a real tension, not a
  proof artifact.
  Section 3, Proposition 2: for Y = Y(n) -> infinity with Y <= (1/100) log
  n, there exists one integer p <= n, a prime rho <= Y, and a family of
  roots g_h in (n/8, n/4) with targets y_h = 2 g_h in S_1 and coatoms c_h =
  g_h / rho, indexed by a set of primes H with |H| = Theta(Y / log Y), such
  that c_h | p for every h in H, the roots and p are pairwise incomparable,
  and c_h | y_{h'} if and only if h = h'; so a single reply can prepare
  Theta(Y / log Y) target-private small-prime coatoms, each of individual
  multiplicity one, showing the factor Y in the fixed-prime bound is locally
  sharp up to a logarithm.
  Section 4: the packet of Section 3 has hidden common lower face d =
  gcd{c_h : h in H} = p / prod_{h in H} h, an integer with d >= M > 1, and
  every designated target satisfies d | c_h | y_h; immediately before p is
  played, either d is legal (degree against designated future targets at
  least |H| = Theta(Y / log Y)) or d is already illegal with an earlier
  first-blocker — a dichotomy invisible to individual-coatom multiplicity
  counts.
  The final open statement: the sufficient target replacing the fixed-Y
  estimate is the Y-independent shadow-closed uniform preparation capacity
  inequality (SC) — for every fixed alpha > 0 there exists C_alpha such that,
  for some uniformly chosen Y_n -> infinity, sum_{t: g_t >= alpha n}
  nu_{Y_n}(g_t) <= C_alpha E + o(n log log Y_n) for every realized
  shadow-closed bad interval. Proposition 4 shows (SC) excludes every linear
  active interval (T >= c n): a linear tail supplies at least (delta -
  o(1)) n roots in [alpha n, n/4], giving sum nu_{Y_n}(g_t) >= (delta/3 -
  o(1)) n log log Y_n by Section 2, which contradicts the C_alpha E +
  o(n log log Y_n) bound from (SC) since log log Y_n -> infinity. Neither
  (SC) nor its negation is proved. Proposition 2's packet construction is
  not an on-trajectory Prolonger strategy and does not by itself resolve the
  second-shell finite-shell-clearing statement in either direction. The
  downward-shadow dichotomy (Theorem 3) is stated to hold verbatim at every
  fixed shell depth, but a depth-J theorem would require a bound uniform
  over shadow blockers arising from any of the earlier-processed shells
  S_0, ..., S_{j-1} as well as off-shell replies, and no such uniform bound
  is supplied.
implications:
  - Any capacity theorem for the second-shell tri-causal system must be
    shadow-closed (track gcds of coatom subfamilies within a reply's
    preparation packet, not merely individual coatom multiplicities) or it
    is false locally, per Proposition 2's Theta(Y/log Y) individual-vs-common
    degree gap.
  - Growing-Y summation, integration, or diagonalization applied to the
    existing fixed-prime estimate is a provably dead end (Proposition 1);
    future dispatches should target the Y-independent inequality (SC)
    directly rather than any multiscale aggregation of the current bound.
  - The open question is now reduced to proving or refuting (SC); by
    Proposition 4, (SC) alone suffices to exclude every linear active
    interval and hence to establish the second-shell finite-shell-clearing
    statement for the prescribed policy.
  - Extending any resolution of (SC) beyond the second shell requires a
    depth-J-uniform bound tracking shadow blockers across all
    earlier-processed shells, which is explicitly unaddressed here.
confidence_at_time: medium
strategy_dependence: prescribed-policy-specific
---

# Verdict

\[
\boxed{\text{The multiscale preparation-capacity question is REPAIRABLE as stated.}}
\]

It contains a further causal collapse, distinct from postponed-service laundering and ancestor-preparation laundering:

\[
\boxed{\textbf{downward-shadow laundering}}
\]

or, equivalently,

\[
\boxed{\textbf{face-pressure laundering}.}
\]

The tri-causal record tracks

\[
\text{coatom preparation}<\text{root release}<\text{root service},
\]

but it does not track the common lower faces of many coatom channels assigned to the same reply. Those common faces create the following unavoidable dichotomy:

* if a common lower face is still legal, it forces a large current greedy degree;
* if it is already illegal, its own earlier first-blocker is a fourth causal obligation.

Thus the correct chronology is not merely

\[
\beta<\gamma<t,
\]

but, for packet shadows that were killed earlier,

\[
\boxed{\sigma<\beta<\gamma<t.}
\]

This defect is substantive. The fixed-\(Y\) capacity estimate in Attachment L is in fact weaker than a trivial consequence of the degree ledger, and its \(Y\)-loss is locally sharp even when every recorded coatom has multiplicity one. Therefore no summation, integration, or diagonal choice of \(Y\) applied only to that estimate can prove the desired exclusion.

I prove all of this below and give the exact repaired capacity theorem which would suffice for \(\mathrm{FSC}(2,\eta)\). I do not construct an on-policy linear Prolonger trajectory; the packet construction below is precisely prevented from being one by the missing shadow pressure.

---

## 1. The fixed-prime capacity estimate is dominated by the trivial ledger

Let the active interval have \(T\) Shortener turns. Because the phase is active, \(Q_t\neq\varnothing\), and some legal proper divisor of a current target has positive degree. Hence

\[
\Delta_t\ge 1
\qquad(1\le t\le T).
\]

The deletion sets of the greedy moves are disjoint and contained in the nonsurvivor set of size \(E\). Consequently,

\[
T\le \sum_{t=1}^T\Delta_t\le E.
\tag{1}
\]

For any \(Y\ge2\),

\[
\nu_Y(g_t)
\le \pi(Y),
\]

since \(\nu_Y(g_t)\) counts a subset of the primes at most \(Y\). Therefore

\[
\boxed{
\sum_{t:g_t\ge\alpha n}\nu_Y(g_t)
\le \pi(Y)T
\le \pi(Y)E.
}
\tag{2}
\]

But \(\alpha\le1/4\) in the macroscopic-root interval, and hence

\[
\pi(Y)E
\le YE
\le \frac{Y}{\alpha}E.
\tag{3}
\]

Thus the main term in Attachment L’s estimate

\[
\sum_{t:g_t\ge\alpha n}\nu_Y(g_t)
\le
\frac{Y}{\alpha}E
+
O_\alpha(Y^2|A_1|)
\tag{4}
\]

is weaker than the completely trivial bound (2).

This remains true under every nonnegative multiscale aggregation.

### Proposition 1: no positive summation of the fixed-\(Y\) bounds can help

For arbitrary scales \(Y_k\ge2\) and weights \(w_k\ge0\),

\[
\begin{aligned}
\sum_k w_k
\sum_{t:g_t\ge\alpha n}\nu_{Y_k}(g_t)
&\le
T\sum_k w_k\pi(Y_k)\\
&\le
E\sum_k w_k\pi(Y_k)\\
&\le
\frac E\alpha\sum_k w_kY_k.
\end{aligned}
\tag{5}
\]

The final expression is already at most the sum of the principal terms in (4). Hence integrating, summing dyadic scales, or choosing one slowly growing \(Y(n)\) does not extract any new capacity information from Proposition 5.

A valid multiscale theorem must therefore be a genuinely new **correlation inequality across scales and across replies**. It cannot be obtained by diagonalizing the fixed-\(Y\) estimates.

---

## 2. A linear root family really does carry \(n\log\log Y\) obligations

The preceding observation is not saying that the small-prime count is too weak. On the contrary, it has exactly the desired divergent lower bound.

Let \(\mathcal G\subseteq[\alpha n,\beta n]\) be any family with

\[
|\mathcal G|\ge\delta n,
\qquad
0<\alpha<\beta<1.
\]

Put

\[
\omega_Y(m)=\#\{p\le Y:p\mid m\}.
\]

For \(Y\to\infty\), the Turán–Kubilius estimate on a fixed macroscopic interval gives

\[
\sum_{\alpha n<m\le\beta n}
\left(
\omega_Y(m)-\sum_{p\le Y}\frac1p
\right)^2
=
O\!\left(n\log\log Y\right).
\tag{6}
\]

Since

\[
\sum_{p\le Y}\frac1p
=
\log\log Y+O(1),
\]

Chebyshev’s inequality implies

\[
\#\left\{
m\in[\alpha n,\beta n]:
\omega_Y(m)<\frac12\log\log Y
\right\}
=
O\!\left(\frac n{\log\log Y}\right)
=
o(n).
\tag{7}
\]

Consequently, every positive-density family \(\mathcal G\) satisfies

\[
\sum_{g\in\mathcal G}\omega_Y(g)
\ge
\left(\frac{\delta}{2}-o(1)\right)n\log\log Y.
\tag{8}
\]

Excluding the one release prime loses at most one count per root, so

\[
\boxed{
\sum_{g\in\mathcal G}\nu_Y(g)
\ge
\left(\frac{\delta}{3}-o(1)\right)n\log\log Y.
}
\tag{9}
\]

Thus the desired lower side genuinely diverges. The problem is that the fixed-prime upper side grows like \(Yn\), and

\[
Y\gg\log\log Y.
\]

The loss is not merely an inefficient proof artifact; a single reply can genuinely possess almost \(Y\) distinct large-coatom channels.

---

## 3. A sharp one-reply coatom packet

The next construction handles an arbitrary-shaped reply and shows where its hidden degree cost resides.

### Proposition 2: one reply can prepare \(\Theta(Y/\log Y)\) target-private small-prime coatoms

Let

\[
Y=Y(n)\longrightarrow\infty,
\qquad
Y\le\frac1{100}\log n.
\]

There exist

* one integer \(p\le n\);
* a prime \(\rho\le Y\);
* a family of roots \(g_h\in(n/8,n/4)\);
* targets \(y_h=2g_h\in S_1\);
* legal coatom candidates \(c_h=g_h/\rho\);

indexed by a set \(\mathcal H\) of

\[
|\mathcal H|=\Theta\!\left(\frac Y{\log Y}\right)
\]

primes, such that

\[
c_h\mid p
\qquad(h\in\mathcal H),
\tag{10}
\]

the roots and \(p\) are pairwise incomparable, and

\[
c_h\mid y_{h'}
\quad\Longleftrightarrow\quad
h=h'.
\tag{11}
\]

Thus every \(c_h\) has multiplicity one against the designated future targets, although one reply \(p\) blocks all of them simultaneously.

### Proof

Let

\[
L_Y=\operatorname{lcm}(1,2,\ldots,\lfloor Y\rfloor).
\]

Chebyshev’s estimate gives

\[
\log L_Y=(1+o(1))Y,
\]

so \(L_Y=n^{o(1)}\).

Choose a prime \(M\) in the interval

\[
\left(\frac{0.23n}{L_Y},\frac{0.24n}{L_Y}\right).
\]

Such a prime exists for all sufficiently large \(n\), since the interval has fixed positive relative width and \(n/L_Y\to\infty\). Put

\[
p=ML_Y.
\]

Then

\[
0.23n<p<0.24n.
\tag{12}
\]

Choose a prime

\[
0.44Y<\rho<0.46Y
\]

and let

\[
\mathcal H
=
\{h\text{ prime}:0.52Y<h<0.78Y\}.
\]

The prime number theorem gives

\[
|\mathcal H|
=
\Theta\!\left(\frac Y{\log Y}\right).
\tag{13}
\]

Every \(h\in\mathcal H\) divides \(L_Y\), so define

\[
c_h=\frac ph,
\qquad
g_h=c_h\rho=\frac{p\rho}{h},
\qquad
y_h=2g_h.
\tag{14}
\]

Since

\[
\frac{0.44}{0.78}
<
\frac{\rho}{h}
<
\frac{0.46}{0.52},
\]

we obtain

\[
0.129n<g_h<0.213n.
\]

Hence

\[
g_h\in(n/8,n/4)
\]

and

\[
y_h=2g_h\in(n/4,n/2)=S_1.
\]

Equation (10) is immediate.

The ratio

\[
\frac p{g_h}=\frac h\rho
\]

is a ratio of two distinct primes lying strictly between \(1\) and \(2\); it is therefore not an integer. Thus \(p\) and \(g_h\) are incomparable.

For distinct \(h,h'\),

\[
\frac{g_h}{g_{h'}}=\frac{h'}h,
\]

again a nonintegral ratio strictly between \(1/2\) and \(2\). The roots are pairwise incomparable.

Finally,

\[
\frac{y_{h'}}{c_h}
=
\frac{2p\rho/h'}{p/h}
=
\frac{2h\rho}{h'}.
\]

If \(c_h\mid y_{h'}\), the prime \(h'\) divides \(2h\rho\). But \(h'\) is distinct from \(2,h,\rho\), because

\[
h,h'>0.52Y,
\qquad
\rho<0.46Y.
\]

Therefore \(h'=h\). The converse is obvious. This proves (11). ∎

So a single reply has

\[
\Theta(Y/\log Y)
\]

different small-prime preparation channels even when every channel has target multiplicity one.

The factor \(Y\) in the fixed-prime proof is therefore locally sharp up to a logarithm.

---

## 4. The packet has a hidden common lower face

The preceding packet appears cheap only if one records the coatoms individually.

Let

\[
d
=
\gcd\{c_h:h\in\mathcal H\}.
\tag{15}
\]

Since the \(h\)’s are distinct primes dividing \(L_Y\),

\[
d
=
\frac{p}{\prod_{h\in\mathcal H}h}.
\tag{16}
\]

The denominator divides \(L_Y\), so \(d\) is an integer. Moreover,

\[
d\ge M>1.
\]

Every designated target satisfies

\[
d\mid c_h\mid y_h.
\]

Therefore, immediately before \(p\) is played, exactly one of the following must hold:

1. \(d\) is legal, in which case its degree against the designated future targets is at least
   \[
   |\mathcal H|
   =
   \Theta(Y/\log Y);
   \tag{17}
   \]
2. \(d\) is already illegal, in which case it has an earlier first-blocker.

The individual coatom multiplicities in (11) do not see this dichotomy.

This is the missing causal layer.

---

## 5. The fourth causal theorem

Consider an actual minimal-maximum-degree interval. Let \(p_j\) be a Prolonger reply. Let

\[
\mathcal O_j
\]

be the collection of preparation obligations first discharged by \(p_j\). An obligation \(e\in\mathcal O_j\) consists of

* a future service root \(g_e\);
* a prime \(\pi_e\mid g_e\);
* the coatom
  \[
  c_e=\frac{g_e}{\pi_e};
  \]
* a future representative target \(y_e\), with
  \[
  g_e\mid y_e.
  \]

The coatom \(c_e\) is legal immediately before \(p_j\), and

\[
c_e\mid p_j.
\]

The representatives \(y_e\) are distinct.

### Theorem 3: downward-shadow dichotomy

Let \(\mathcal U\subseteq\mathcal O_j\) be nonempty and put

\[
d_{\mathcal U}
=
\gcd\{c_e:e\in\mathcal U\}.
\]

Assume \(d_{\mathcal U}\ge2\). Then exactly one of the following holds:

\[
\boxed{
d_{\mathcal U}\text{ is legal at Shortener position }j
\quad\Longrightarrow\quad
|\mathcal U|\le\Delta_j;
}
\tag{18}
\]

or

\[
\boxed{
d_{\mathcal U}\text{ has a first Prolonger blocker strictly before }p_j.
}
\tag{19}
\]

In the second case, if \(\sigma(d_{\mathcal U})\) is the first-blocker index, then

\[
d_{\mathcal U}\mid p_{\sigma(d_{\mathcal U})}
\qquad\text{and}\qquad
\sigma(d_{\mathcal U})<j.
\tag{20}
\]

### Proof

Every future representative \(y_e\) is still a current target at Shortener position \(j\). Indeed, it survives until the later service of \(g_e\), and \(g_e\) is already a proper legal divisor at position \(j\).

If \(d_{\mathcal U}\) is legal at position \(j\), then

\[
d_{\mathcal U}\mid c_e\mid g_e\mid y_e
\qquad(e\in\mathcal U).
\]

Hence

\[
\deg_{Q_j}(d_{\mathcal U})\ge|\mathcal U|.
\]

Because \(g_j\) has maximum current degree,

\[
\Delta_j\ge|\mathcal U|,
\]

which proves (18).

Now suppose \(d_{\mathcal U}\) is illegal immediately before \(p_j\). It cannot have been first killed by the contemporaneous minimal Shortener move \(g_j\). The integer \(d_{\mathcal U}\) is a proper divisor of every surviving future root \(g_e\), and the noncreation lemma says that a minimal Shortener move cannot destroy such a divisor while the root survives.

Therefore its first blocker is either in the entry history or is a strictly earlier Prolonger reply.

If the first blocker is \(p_i\), then the orientation

\[
p_i\mid d_{\mathcal U}
\]

would imply \(p_i\mid g_e\), killing every relevant future root. Thus

\[
d_{\mathcal U}\mid p_i.
\]

Necessarily \(i<j\), proving (19)–(20). ∎

The resulting chronology is

\[
\boxed{
\text{shadow blocking}
\;<\;
\text{coatom blocking}
\;<\;
\text{root release}
\;<\;
\text{root service}.
}
\tag{21}
\]

In the notation of the attachments,

\[
\boxed{\sigma<\beta<\gamma<t.}
\]

Ancestor-preparation laundering concerned different coatoms of one root. Downward-shadow laundering concerns common divisors of coatoms belonging to many different roots in one reply packet. They are distinct defects.

---

## 6. Why the stated tri-causal record is not shadow-closed

The tri-causal data record, for every service root,

\[
\beta_t(c)<\gamma(t)<t
\]

for its off-branch coatoms \(c\).

But it does not record, for a packet such as \(\mathcal O_j\),

\[
\gcd(c_{e_1},c_{e_2}),
\quad
\gcd(c_{e_1},c_{e_2},c_{e_3}),
\quad\ldots
\]

or the first-blocker times of those lower shadows.

Consequently, the same formal packet can be interpreted in two incompatible ways:

* every coatom has individual multiplicity one, suggesting unit cost;
* their common legal shadow has degree \(K\), forcing
  \[
  \Delta_j\ge K.
  \]

Alternatively, if the common shadow was killed earlier, that earlier reply must be entered into the causal ledger.

A scalar condition

\[
\sum_j\Delta_j\le E
\]

does not identify which of these two cases occurred at any packet. Nor do the coatom first-blocker maps.

This is **face-pressure laundering**: the packet records only its maximal faces, while the degree cost is hidden in their downward intersection structure.

The local packet in Proposition 2 shows that this gap can be arbitrarily large:

\[
\text{individual coatom degree}=1,
\qquad
\text{common-shadow degree}
=
\Theta(Y/\log Y).
\]

Thus a claimed capacity theorem that assigns cost only through the coatom fibers is false locally. A valid global theorem must either charge the common legal shadows to \(\Delta_j\) or recursively charge their earlier blockers.

---

## 7. Exact repair: shadow-closed tri-causal systems

For each Shortener position \(j\), choose one representative

\[
y_t\in D_t
\]

for every future service turn \(t\ge j\), and put

\[
Z_j
=
X\cup\{y_t:t\ge j\}.
\tag{22}
\]

Every member of \(Z_j\) lies in \(Q_j\).

A repaired abstraction must include the following condition.

### Full face-pressure condition

For every currently legal \(d\),

\[
\boxed{
k_{Z_j}(d)
:=
|\{z\in Z_j:d\mid z\}|
\le\Delta_j.
}
\tag{FP}
\]

This is an immediate consequence of true maximum-degree play, but it is not a consequence of the terminal survivor deadlines or of the coatom capacities.

The causal version is stronger.

### Shadow-closure condition

For every reply \(p_j\), every nonempty subfamily \(\mathcal U\) of its coatom-preparation packet, and

\[
d_{\mathcal U}=\gcd\{c_e:e\in\mathcal U\}\ge2,
\]

one must record exactly one of:

\[
d_{\mathcal U}\text{ legal at }j,
\qquad
|\mathcal U|\le\Delta_j;
\tag{23}
\]

or

\[
\sigma(d_{\mathcal U})<j,
\qquad
d_{\mathcal U}\mid p_{\sigma(d_{\mathcal U})}.
\tag{24}
\]

If the blocker is pre-entry, it is charged to the frozen entry ledger.

Condition (24) must itself be subjected to the same analysis when one earlier reply is used to kill many such shadows. Hence the data form a finite causal directed acyclic graph, descending in divisibility and in time.

An equivalent local description is obtained by choosing, for every coatom \(c_e\), a divisibility-minimal legal support

\[
r_e\mid c_e
\]

immediately before \(p_j\). Then

\[
r_e\mid p_j,
\qquad
r_e\mid y_e,
\]

and every support fiber satisfies

\[
\boxed{
|\{e:r_e=r\}|\le\Delta_j.
}
\tag{25}
\]

The distinct supports form an antichain. Their own first-minimal histories must then be included. These “channel roots” need not ever be selected by Shortener; that is why the service-root Hall ledger alone does not count them.

Call the resulting object a **shadow-closed tri-causal reply system**.

---

## 8. The genuinely sufficient growing-\(Y\) theorem

The correct capacity target is not a \(Y E\) estimate. It must remove the \(Y\)-loss after all live-shadow degree charges and earlier-shadow blockers have been accounted for.

A clean sufficient formulation is the following.

### Shadow-closed uniform preparation capacity

For every fixed \(\alpha>0\), there exists a constant \(C_\alpha\) such that, for some uniformly chosen \(Y_n\to\infty\),

\[
\boxed{
\sum_{t:g_t\ge\alpha n}\nu_{Y_n}(g_t)
\le
C_\alpha E
+
o\!\left(n\log\log Y_n\right)
}
\tag{SC}
\]

for every realized shadow-closed bad interval.

The entry contribution must satisfy

\[
o\!\left(n\log\log Y_n\right).
\]

The accepted uniform \(o(n)\) activation allows \(Y_n\) to be fixed before Prolonger is quantified. If

\[
a_n
=
\sup_\sigma |A_1(\sigma)|=o(n),
\]

one may, for example, take

\[
Y_n
=
\min\left\{
\left(\frac{n}{a_n+1}\right)^{1/5},
\exp\!\sqrt{\log\log n}
\right\}.
\tag{26}
\]

Then

\[
Y_n\to\infty
\]

and

\[
Y_n^2a_n=o(n).
\tag{27}
\]

Thus the known pre-entry term \(O_\alpha(Y_n^2a_n)\) would be negligible.

### Proposition 4: (SC) excludes every linear tail

Assume (SC). Then no active interval with \(T\ge cn\) exists.

### Proof

A linear tail supplies constants \(\alpha,\delta>0\) and at least

\[
\delta n-o(n)
\]

distinct service roots in

\[
[\alpha n,n/4].
\]

By (9),

\[
\sum_{t:g_t\ge\alpha n}\nu_{Y_n}(g_t)
\ge
\left(\frac{\delta}{3}-o(1)\right)
n\log\log Y_n.
\tag{28}
\]

On the other hand, (SC) and \(E\le n/4\) give

\[
\sum_{t:g_t\ge\alpha n}\nu_{Y_n}(g_t)
\le
\frac{C_\alpha}{4}n
+
o\!\left(n\log\log Y_n\right).
\tag{29}
\]

Since

\[
\log\log Y_n\to\infty,
\]

the \(O(n)\) term in (29) is

\[
o\!\left(n\log\log Y_n\right),
\]

contradicting (28). ∎

So (SC) is precisely of the right scale: a \(Y\)-independent multiple of the degree ledger suffices, while the current \(YE\) estimate is tautological.

---

## 9. Why Proposition 2 does not give a Prolonger strategy

The one-reply packet is a genuine legal arithmetic packet, and it handles arbitrary replies. But it is not a greedy-game counterexample.

Its common shadow \(d\) forces the exact dichotomy:

\[
d\text{ legal}
\quad\Longrightarrow\quad
\Delta_j\ge\Theta(Y/\log Y);
\]

or

\[
d\text{ illegal}
\quad\Longrightarrow\quad
\text{an earlier reply paid for }d.
\]

Therefore the packet cannot simply be repeated while assigning unit degree to every turn. Doing so would be precisely the newly identified laundering.

The construction proves that:

* no per-reply bound based only on the number of large coatom divisors can have a constant independent of \(Y\);
* no summation of the fixed-\(Y\) capacities can prove exclusion;
* the missing theorem must recursively use lower-shadow legality and first-blocker chronology.

It does **not** produce a trajectory on which the prescribed greedy move is the intended private root.

---

## 10. Deeper shells

The downward-shadow theorem itself iterates verbatim.

For a fixed deeper shell \(S_j\), every preparation coatom still divides a future representative, and every common legal shadow still forces current maximum degree. If the shadow is illegal, its first upward blocker is earlier.

Thus the four-level chronology

\[
\sigma<\beta<\gamma<t
\]

is valid at every fixed depth.

What does not automatically iterate is the uniform capacity inequality (SC). In \(S_j\), a shadow may have been blocked by a reply lying in any of

\[
S_0,S_1,\ldots,S_{j-1},
\]

as well as by a lower off-shell reply. The repaired ledger must therefore retain the source-shell label of every shadow blocker. A depth-\(J\) theorem would need a bound of the form

\[
\sum\nu_Y(g_t)
\le
C_{\alpha,J}E
+
o(n\log\log Y),
\]

uniform over all those upward channels.

Nothing proved here supplies that bound. Earlier processed shells enlarge the packet space, so the second-shell argument would not by itself constitute a finite-shell induction.

---

# Final ruling

\[
\boxed{
\begin{array}{l}
\textbf{The fixed-prime capacity estimate is wholly dominated by }T\le E.\\[1mm]
\textbf{No nonnegative multiscale summation of it can yield a contradiction.}\\[1mm]
\textbf{A single reply can carry }\Theta(Y/\log Y)\textbf{ target-private}\\
\textbf{small-prime coatom channels.}\\[1mm]
\textbf{Those channels possess common lower shadows which either force}\\
\textbf{large current degree or require still earlier blockers.}\\[1mm]
\textbf{The omitted fourth layer is downward-shadow/face-pressure causality.}\\[1mm]
\textbf{The exact repair is a shadow-closed tri-causal system satisfying (FP).}\\[1mm]
\textbf{A uniform shadow-closed bound (SC) would immediately prove}\\
\textbf{the second-shell capped-tail exclusion.}
\end{array}}
\]

Accordingly, the proposed multiscale theorem has not been proved, and the packet construction is not an on-trajectory Prolonger strategy. The rigorous resolution is that the advertised tri-causal capacity object is still incomplete: it permits **downward-shadow laundering**, a twenty-third collapse family. After repairing that defect, the remaining substantive problem is exactly the \(Y\)-independent shadow-closed capacity inequality (SC), not a growing-\(Y\) summation of the fixed-prime estimate.