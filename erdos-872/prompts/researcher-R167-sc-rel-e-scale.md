Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Prove or refute the RELATIVE shadow-closed capacity inequality (SC^rel) stated below — the provably non-circular residue of the capacity program: second-shell clearing alone does NOT imply it, and no ambient-normalized or additive route can decide it.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Attachment A defines, for fixed \(J\ge1\) and \(0<\eta<1\), the finite-shell clearing statement \(\mathrm{FSC}(J,\eta)\) (process dyadic shells \(S_j=(n/2^{j+1},n/2^j]\) in order after an \(o(n)\)-move prelude; while \(|Q_j(A)|>\eta|S_j|\), where \(Q_j\) is the live nonminimal shell population, play a currently legal lower element maximizing deletions from \(Q_j\); every turn counted; a fixed prefix-measurable tie-break) and proves: if \(\mathrm{FSC}(J,\eta)\) holds for every fixed \(J\) and \(\eta\), then \(L(n)=o(n)\) — deep shells are controlled by total size, so no growing-depth estimate is needed. Attachment B PROVES \(\mathrm{FSC}(1,\eta)\) for every fixed \(0<\eta<1\) (degree availability plus a disjointness bootstrap), and localizes the obstruction to the second shell: a previously chosen \(a\in(n/2,n]\) can satisfy \(d\mid a\) with \(a\) incomparable to a target \(x\in S_1\), killing the lower move \(d\) without killing \(x\) — external blockers absent from any rescaled smaller board.

The target (Attachment P derives it and proves the surrounding characterizations). Same setting: linear active second-shell greedy interval under the prescribed minimal-maximum-degree policy; greedy service roots g_t >= alpha*n with small-prime counts omega_Z(g) (primes <= Z dividing g, excluding the release prime); realized degree ledger E(I) = sum_t Delta_t; frozen entry size a_n = o(n); mu_n(alpha) = sup over entry positions of initially-available roots in [alpha*n, n/4]; deterministic Z_n -> infinity, Z_n <= n/4, with mu_n(alpha)*pi(Z_n) = o(n*Lambda_n); Lambda_n = sum_{p <= Z_n} 1/p; frozen baseline budget B_{alpha,n} = Z_n^2*a_n + mu_n(alpha)*pi(Z_n) + 1; realized demand S_{alpha,Z_n}(I) = sum over service roots g_t >= alpha*n in the interval of omega_{Z_n}(g_t).

(SC^rel): for every fixed alpha in (0, 1/4) there exist C_alpha, K_alpha and admissible deterministic Z_n such that sup over realized intervals I (activation data and tie-break frozen in advance) of [S_{alpha,Z_n}(I) - C_alpha*E(I) - K_alpha*B_{alpha,n}]_+ / [(E(I)+1)*Lambda_n + B_{alpha,n}] tends to 0.

Established (Attachment P): ambient-normalized capacity statements are DEAD — (SC*) over n*Lambda_n is exactly equivalent to second-shell clearing itself (sublinear cohorts are absorbed by Turán–Kubilius + Cauchy–Schwarz automatically; positive-density cohorts violate it automatically), so (SC^rel) at the E(I)*Lambda_n scale is the only remaining capacity formulation with independent content: a cohort of M = o(n) typical service roots with E comparable to M has demand of full order E*Lambda_Z — invisible at ambient scale, decisive at relative scale. A proof of (SC^rel) must be the chronological cross-reply correlation argument at E-scale (exploiting the four-layer causal chronology, the downward-shadow dichotomy, packet lcm containments, and the first-death ledgers — all proven, in Attachments K/L/M/N); a refutation must construct realized intervals (on-trajectory against the prescribed policy) where typical-omega service cohorts force S >> E*Lambda — e.g. rough-root-avoiding cohorts are impossible at relative scale, quantify why or exploit it. State exactly what (SC^rel) implies and does not imply for second-shell clearing and for L(n)=o(n) (it is NOT claimed that (SC^rel) alone suffices; derive its exact consequences). Formulation caution: twenty-six degenerate-collapse families are catalogued; if (SC^rel) as stated hides another, proving THAT with the exact repair is a valuable resolution.

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
## Audit-established second-shell machinery (adversarially verified; take as given with the stated scopes)

- Legal-divisor upset: the legal divisors of a fixed legal element form an upper ideal in its divisor poset.
- Deletion-set root equality (NARROW scope): a maximum-degree lower candidate \(d\le n/4\) and its divisibility-minimal legal divisor \(r\) satisfy \(N_Q(r)=N_Q(d)\) for the current second-shell target set — but \(r\) is NOT substitutable for \(d\) as a game move (at \(n=48\), \(A=\{5,7,11,16\}\): \(d=6\) and \(r=3\) both delete \(\{18,24\}\) from the shell, yet \(r\) additionally kills \(9\)). Use only as a counting device.
- Linear tail forces fresh minimal roots: a \(T\)-turn second-shell greedy phase yields \(T\) distinct charged roots of which \(T-o(n)\) first become minimal legal after the sparse entry position; for \(T\ge cn\), at least \((c/2)n-o(n)\) of them lie in the fixed interval \(((c/2)n, n/4]\).
- Constant-cap suffix: every \(T\ge cn\)-turn tail contains a suffix of length \(\ge(c/2)n-O(1)\) on which the greedy degree is bounded by a fixed constant \(D(c)\).
- Deadline inequality: for the surviving target set after a \(cn\)-turn interval, any divisor legal throughout the interval has degree at most \(1/(4c)+o(1)\) against that set (legality-throughout is an explicit hypothesis).
- Equivalence with four conditions: the "no linear capped tail" exclusion is equivalent to second-shell \(o(n)\)-clearing only when the statement carries: \(0<\eta_0<\eta/2\); a uniform activation bound (sup over Prolonger strategies of the activation time \(=o(n)\)); adversarial quantification of the tail witness (no \(c>0\), \(n_k\to\infty\), strategies \(\sigma_k\), caps \(H_k\to\infty\), sparse active times followed by \(\ge cn_k\) capped active turns); and top/second-shell threshold alignment.
- The isolated open mechanism (all routes converge here): whether one blocker move, divisible by many currently-legal roots at once, can satisfy many final-survivor deadlines simultaneously — equivalently, a chronological trichotomy (within an o(n)-move window a fixed positive fraction of targets is directly deleted, or played, or irreversibly banked) of aggregate-excess-halving strength. Ruled out as substitutes: widening prime coatoms to all divisors \(\le K\) (one move \(a=dk\) invalidates many high-degree roots without comparability), and every integrable-rate degree estimate.


## Attachment K (verbatim): unique release times, the exact prefix Hall equality, future-service pressure

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
## Attachment L (verbatim): the tri-causal repair — prime-quotient lemma, coatom-preparation obligations, distinct-blocker lemma

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
## Attachment M (verbatim): the fourth causal layer — downward-shadow dichotomy, death of multiscale aggregation, the Turán–Kubilius demand bound, the sharp packet

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
## Attachment N (verbatim): the summable-weight barrier and the three-role packet obstruction

## Verdict

I do **not** have a valid unconditional proof or disproof of  
\[
L(n)=o(n).
\]

After attempting to combine the strongest supplied ingredients—first-failure localization, the second-shell normal form, causal deadlines, prefix Hall accounting, tri-causal preparation, and the chronology-safe \(L^{s}\) ledger—the argument still stops at the preparation-sensitive packet-capacity problem identified in the prompt.

Claiming a resolution from the stated results would require inserting an unproved assertion. Below is the precise obstruction, including a clean reason that the most natural remaining weighted-ledger argument cannot close the gap.

---

# 1. Where an upper-bound proof must close

Suppose the second-shell greedy phase has a linear tail of \(T\ge cn\) active Shortener turns from a sparse position \(B\), and let \(X\) be its final surviving target set.

After passing to the minimal-maximum-degree version of the policy, the established results give the following structure.

For all but \(o(n)\) service times \(t\), the greedy root \(g_t\) was not minimal at \(B\). It therefore has a unique release reply \(p_{\gamma(t)}\), with
\[
\gamma(t)<t.
\]
Moreover, for every prefix \(s\le T\),
\[
s
=
\#\{t\le s:g_t\text{ was minimal at }B\}
+
\sum_{j<s}|C_j(s)|,
\]
where \(C_j(s)\) consists of roots serviced by time \(s\) and released by reply \(p_j\). Hence
\[
\sum_{j<s}|C_j(s)|\ge s-o(n)
\tag{1}
\]
on every linear prefix.

There is also a linear family of persistent final roots. These roots remain legal through the interval, eventually support \(X\), and are never serviced during the tail. Thus the replies must create both:

1. essentially one future service root per turn, by (1);
2. a further linear persistent-root population.

For every released root \(r\), tri-causal preparation says that there is a prime \(q\mid r\) such that

- the release reply is divisible by the last legal coatom
  \[
  \lambda=\frac rq;
  \]
- for every other distinct prime \(\pi\mid r\), the coatom
  \[
  \frac r\pi
  \]
  was first blocked by a distinct, strictly earlier Prolonger reply.

Thus every noninitial root carries a causal structure
\[
\text{preparation}<\text{release}<\text{service}.
\tag{2}
\]

An upper proof therefore needs a theorem saying that a sequence of only \(T\) Prolonger replies cannot simultaneously satisfy:

- the prefix Hall demand (1);
- the persistent-root demand;
- all survivor deadlines;
- all the preparations in (2);
- the greedy degree ledger;
- primitiveness of the complete alternating history.

That theorem is not supplied by any of the current ledgers.

---

# 2. Why the \(L^{s}\) first-death ledger does not finish the proof

For \(s>2\), define the coatom weight of a root by
\[
W_s(r)=\sum_{\pi\mid r}\frac1{\pi^s},
\]
where the sum is over distinct prime divisors.

The chronology-safe first-death theorem gives a constant \(C_s\) such that, over any interval of \(m\) moves, the total charge
\[
\sum \left(\frac d x\right)^s
\]
assigned to first deaths of divisors \(d\mid x\), for targets \(x\in(n/4,n/2]\) surviving the interval, is at most
\[
C_s m.
\tag{3}
\]

For a coatom \(d=r/\pi\), its weight is precisely \(\pi^{-s}\). It is therefore tempting to sum the preparation demand of all released and persistent roots and contradict (3).

That fails for an unavoidable reason.

## Summable-weight barrier

Fix \(s>2\) and \(\varepsilon>0\). Choose \(Y\) so large that
\[
\sum_{\substack{\pi\ \mathrm{prime}\\ \pi>Y}}\frac1{\pi^s}<\varepsilon.
\tag{4}
\]

Every \(Y\)-rough integer \(r\)—one having no prime factor at most \(Y\)—then satisfies
\[
W_s(r)<\varepsilon.
\tag{5}
\]

For fixed \(Y\), the \(Y\)-rough integers have positive density in every fixed macroscopic interval \((\alpha n,\beta n]\). In particular, there is a constant \(\rho_Y>0\) such that
\[
\#\{r\in(\alpha n,\beta n]:r\text{ is }Y\text{-rough}\}
=
(\rho_Y+o(1))n.
\tag{6}
\]

Consequently, there are linear root families \(R\) for which
\[
\sum_{r\in R}W_s(r)
\le
\varepsilon |R|.
\tag{7}
\]

The linear-tail constant \(c\) in a hypothetical countertrajectory is not bounded below universally; a failure of sublinearity could occur with an arbitrarily small fixed \(c>0\). Taking \(Y\) sufficiently large relative to that density leaves enough \(Y\)-rough integers to supply all required roots, while making the total \(L^s\) demand in (7) arbitrarily small.

Meanwhile the ledger capacity in (3) is
\[
C_sT=C_scn.
\]
Thus no contradiction follows.

This is not merely a bad choice of exponent. It is a general obstruction to any additive coatom ledger with summable prime weights: a sufficiently rough positive-density family makes the total demand per root arbitrarily small.

---

# 3. Why replacing the weights by unweighted coatom counts also fails

One might instead count every distinct prime coatom with weight \(1\). Then a positive-density family has average coatom demand on the \(\log\log n\) scale.

But there is no bounded per-reply capacity for this unweighted demand.

Let
\[
k=\lfloor \rho n\rfloor,\qquad
N=\lfloor n/2\rfloor,
\]
where \(\rho>0\) is sufficiently small, and take the primitive interval blocker
\[
P=\{N+1,N+2,\dots,N+k\}.
\tag{8}
\]

Every \(d\le k\) divides at least one member of \(P\), because every block of \(k\) consecutive integers contains a multiple of \(d\).

Put
\[
Y=\frac{2n}{5k}.
\]
For a \(Y\)-rough integer
\[
r\in(n/3,2n/5],
\]
every proper divisor \(d<r\) satisfies
\[
d\le \frac r{p_{\min}(r)}
<
\frac{2n/5}{Y}
=
k.
\tag{9}
\]

Hence every proper divisor of \(r\), and in particular every prime coatom \(r/\pi\), divides some blocker in \(P\).

For \(\rho\) small enough, every \(a\in P\) lies strictly between \(r\) and \(2r\). Thus \(a\) is incomparable with \(r\). The roots themselves remain legal while all their proper divisors are blocked.

The resulting root family has size
\[
\gg \frac{n}{\log Y}
\asymp
\frac{n}{\log(1/\rho)},
\tag{10}
\]
while the blocker family has only
\[
|P|=\rho n
\tag{11}
\]
members.

For small \(\rho\),
\[
\frac{1}{\log(1/\rho)}\gg \rho.
\]
Thus a linear reply family can prepare a much larger linear root family, and each reply can own many coatom obligations.

This is exactly why an unweighted “one preparation, one unit of reply capacity” argument is false. The static linear-scale construction supplied in the record strengthens this obstruction further: primitiveness, survivor avoidance, all prefix deadlines, and postponed final minimality can all coexist.

What the interval construction does **not** supply is the greedy on-trajectory timing. That is the remaining load-bearing condition.

---

# 4. The packet obstruction is genuinely simultaneous

The obstruction cannot be removed by separately charging the three causal roles.

A reply can simultaneously:

- discharge a survivor deadline;
- release a future service root;
- release or prepare a persistent root.

The example in the record,
\[
p=3m,\qquad (m,30)=1,
\]
already realizes these roles in one packet. Therefore an inequality such as
\[
\#\text{deadline services}
+
\#\text{future releases}
+
\#\text{persistent releases}
\le
C\,\#\text{replies}
\]
is useless unless \(C\) is strictly smaller than the demand ratio forced by every possible tail.

No such strict constant exists pointwise. Large common-core packets and interval blockers show that the relevant statement would have to be:

- chronological rather than pointwise;
- sensitive to the entire preparation history;
- sensitive to the greedy degree evolution;
- trajectory-restricted;
- nonadditive, because additive first-death weights are defeated by rough roots.

That is precisely the preparation-sensitive packet-capacity theorem currently missing.

---

# 5. Why the same material does not give a disproof

The static and chronological packet constructions do not establish
\[
L(n)\ge cn.
\]

A lower bound for the game must give one Prolonger strategy that survives **every** Shortener strategy. In particular, it must survive:

- fixed-density clearing sweeps;
- anticipatory batch blockers;
- prime-product guards;
- policies that do not follow maximum degree;
- policies that attack the preparation infrastructure rather than the current reservoir.

A history defeating the literal maximum-degree policy establishes only policy sensitivity. The fixed-cap entry theorem already rules out the simplest attempt to turn a capped reservoir into a universal lower-bound strategy.

Likewise, an off-policy primitive schedule satisfying all deadlines does not show that Prolonger can force the schedule on the realized game tree.

Thus the lower route still lacks an arbitrary-reply-robust on-trajectory construction.

---

# 6. Exact logical status

The supplied facts establish the following implications:

\[
\mathrm{AE}^{\dagger}
\Longrightarrow
L(n)=o(n),
\]
and
\[
\bigl[\mathrm{FSC}(J,\eta)
\text{ for every fixed }J,\eta\bigr]
\Longrightarrow
L(n)=o(n).
\]

The first unresolved dyadic case is \(\mathrm{FSC}(2,\eta)\), and that statement is exactly equivalent to excluding the time-ordered primitive multiple-cover schedule with its causal deadlines.

The tri-causal refinement shows what any attempted exclusion must additionally control, but it does not itself exclude the schedule.

Conversely, failure of \(\mathrm{FSC}(2,\eta)\) for the greedy policy would not disprove \(L(n)=o(n)\), because Shortener may have a different sublinear strategy.

Therefore neither conclusion follows:

\[
\boxed{\text{No unconditional proof of }L(n)=o(n)\text{ has been obtained here.}}
\]

\[
\boxed{\text{No Prolonger strategy forcing }L(n)\ge cn\text{ has been obtained either.}}
\]

The exact unresolved assertion is not another static incidence estimate. It is a nonadditive, preparation-sensitive, chronological capacity theorem for packets on the realized trajectory—or an arbitrary-Shortener Prolonger construction showing that such packets can be maintained at linear scale.
## Attachment O (verbatim): the oversized-cutoff vacuity of the unnormalized statement, the exact repairs, and the (SC*) formulation

# Verdict

\[
\boxed{\text{The displayed statement (SC) is true, but for a parameter-level vacuity.}}
\]

More precisely, the unrestricted existential choice of \(Y_n\to\infty\) allows the normalizing quantity \(\log\log Y_n\) to grow long after the statistic \(\nu_{Y_n}(g)\) has saturated. With an oversized deterministic cutoff, (SC) holds uniformly with

\[
C_\alpha=0
\]

for every \(\alpha>0\), without using shadow closure, chronology, the degree ledger, or even the fact that the interval is realized.

Consequently, the assertion that the displayed (SC) implies second-shell clearing is not valid under the literal quantifiers. The Turán–Kubilius demand calculation in Attachment M implicitly requires an effective cutoff such as \(Y_n\le n/4\), or an equivalent normalization by \(\min\{Y_n,n/4\}\).

This is an unclosed instance of the catalogued **parameter-level vacuity**: an oversized-\(Y\) normalization escape.

---

## 1. Uniform proof of the literal inequality

For an integer \(m\), let \(\omega(m)\) denote its number of distinct prime divisors. For every \(m\le n\),

\[
2^{\omega(m)}
\le
\prod_{p\mid m}p
\le m\le n,
\]

and therefore

\[
\omega(m)\le \log_2 n.
\tag{1}
\]

For every cutoff \(Y\),

\[
\nu_Y(m)\le \omega(m),
\tag{2}
\]

because \(\nu_Y\) counts only some of the distinct prime divisors of \(m\), and then possibly removes the release prime.

Now consider any realized interval whatsoever. Its greedy roots \(g_t\) are distinct integers in \(\{2,\ldots,n\}\). Hence, uniformly over every Prolonger strategy, every tie-break, every reply shape, and every shadow history,

\[
\begin{aligned}
\sum_{t:g_t\ge\alpha n}\nu_Y(g_t)
&\le
\sum_{t:g_t\ge\alpha n}\omega(g_t)\\
&\le
n\log_2 n.
\end{aligned}
\tag{3}
\]

Choose, before Prolonger is quantified,

\[
Y_n
=
\exp\!\left(\exp\!\left((\log n)^2\right)\right).
\tag{4}
\]

This is deterministic, strategy-independent, and satisfies \(Y_n\to\infty\). Moreover,

\[
\log\log Y_n=(\log n)^2.
\tag{5}
\]

Consequently,

\[
\frac{n\log_2 n}
     {n\log\log Y_n}
=
\frac{\log n/\log 2}{(\log n)^2}
=
\frac{1}{(\log 2)\log n}
\longrightarrow0.
\tag{6}
\]

Thus (3) gives, uniformly over every realized interval,

\[
\sum_{t:g_t\ge\alpha n}\nu_{Y_n}(g_t)
=
o\!\left(n\log\log Y_n\right).
\tag{7}
\]

Taking

\[
C_\alpha=0
\]

proves exactly the displayed inequality:

\[
\boxed{
\sum_{t:g_t\ge\alpha n}\nu_{Y_n}(g_t)
\le
C_\alpha E
+
o\!\left(n\log\log Y_n\right).
}
\]

The remainder can be made completely explicit and uniform:

\[
R_n=n\log_2 n,
\qquad
\sup_{\mathcal I}
\frac{R_n}{n\log\log Y_n}\longrightarrow0,
\]

where the supremum ranges over all possible realized intervals \(\mathcal I\).

No trajectory construction is needed, because this is a proof rather than a refutation.

---

## 2. Why this does not prove second-shell clearing

The defect is that \(\nu_Y(g)\) stops changing once \(Y\) exceeds \(g\), whereas the displayed normalization \(\log\log Y\) continues growing without bound.

For all roots under consideration,

\[
g_t\le \frac n4.
\]

Hence whenever \(Y\ge n/4\),

\[
\nu_Y(g_t)=\nu_{n/4}(g_t).
\tag{8}
\]

The left side of (SC) has therefore saturated. Its denominator has not.

The same defect appears exactly in the Turán–Kubilius step used in Attachment M. The relevant first moment is not

\[
\sum_{p\le Y}\frac1p
\]

when \(Y\gg n\). For integers \(m\le n\),

\[
\sum_{m\le n}\omega_Y(m)
=
\sum_{p\le \min\{Y,n\}}
\left\lfloor\frac np\right\rfloor.
\tag{9}
\]

Primes \(p>n\) divide no integer being counted. Thus the effective mean is controlled by

\[
\sum_{p\le\min\{Y,n\}}\frac1p,
\tag{10}
\]

not by \(\log\log Y\) when \(Y>n\).

For the choice (4),

\[
\log\log Y_n=(\log n)^2,
\]

but every root family, even the entire interval \([\alpha n,n/4]\), satisfies

\[
\sum_g\nu_{Y_n}(g)
\le n\log_2 n
=
o\!\left(n(\log n)^2\right).
\tag{11}
\]

Therefore the claimed demand estimate

\[
\sum_g\nu_{Y_n}(g)
\gg n\log\log Y_n
\]

is impossible for this \(Y_n\). The failure occurs before any shadow-capacity reasoning is reached.

In particular, the variance assertion centered at

\[
\lambda_Y=\sum_{p\le Y}\frac1p
\]

cannot be used unchanged once \(Y\) is larger than the integers in the interval. The correct center must use the effective cutoff.

---

## 3. Exact repair

There are two equivalent clean repairs.

### Repair A: impose an effective-cutoff range

Require the uniformly chosen cutoff to satisfy

\[
Y_n\to\infty,
\qquad
Y_n\le\frac n4
\tag{12}
\]

for all sufficiently large \(n\). In practice the intended argument wants a much slower cutoff, such as

\[
Y_n\le \exp\sqrt{\log\log n}.
\]

The activation term should also be required uniformly. If

\[
a_n=\sup_\sigma |A_1(\sigma)|=o(n)
\]

is the frozen entry-size bound, a suitable explicit condition is

\[
Y_n^2a_n
=
o\!\left(n\log\log Y_n\right).
\tag{13}
\]

The stronger condition \(Y_n^2a_n=o(n)\), used in Attachment M, also suffices.

### Repair B: normalize by the effective cutoff

Define

\[
Z_n=\min\left\{Y_n,\frac n4\right\}
\]

and formulate the inequality as

\[
\sum_{t:g_t\ge\alpha n}\nu_{Z_n}(g_t)
\le
C_\alpha E
+
o\!\left(n\log\log Z_n\right),
\qquad
Z_n\to\infty.
\tag{14}
\]

Since no root \(g_t\le n/4\) has a prime divisor larger than \(n/4\),

\[
\nu_{Y_n}(g_t)=\nu_{Z_n}(g_t),
\]

so this changes only the defective normalization.

An even more canonical version replaces \(\log\log Z_n\) by the prime-harmonic parameter

\[
\Lambda_n
=
\sum_{p\le Z_n}\frac1p.
\tag{15}
\]

Then the repaired statement is

\[
\sum_{t:g_t\ge\alpha n}\nu_{Z_n}(g_t)
\le
C_\alpha E+o(n\Lambda_n).
\tag{SC\(^\ast\)}
\]

Here \(\Lambda_n\to\infty\), and the Turán–Kubilius lower-demand calculation is calibrated to exactly the same effective prime range as the left side.

---

## 4. The uniform remainder must be stated explicitly

To exclude strategy-dependent or cohort-dependent \(o\)-terms, the repaired assertion should say

\[
\boxed{
\sup_{\mathcal I\in\mathfrak B_n(\alpha)}
\frac{
\left(
\sum_{t:g_t\ge\alpha n}\nu_{Z_n}(g_t)
-
C_\alpha E(\mathcal I)
\right)_+
}{
n\log\log Z_n
}
\longrightarrow0,
}
\tag{16}
\]

where \(\mathfrak B_n(\alpha)\) is the set of all realized bad intervals for the activation data and tie-break fixed in advance.

This makes the order of quantifiers unambiguous:

1. fix \(\alpha\);
2. choose \(C_\alpha\) and the deterministic sequence \(Z_n\);
3. quantify over all realized Prolonger trajectories;
4. take one uniform asymptotic remainder.

With (12) or (14), (13), and (16), the Turán–Kubilius contradiction in Attachment M is valid.

---

## 5. Scope of the result

The literal proof is shell-independent only in a vacuous sense: it uses the universal bound \(\omega(g)\le\log_2 n\) and an oversized normalization. It therefore gives neither meaningful second-shell clearing nor depth-\(J\) uniformity.

The substantive status is:

\[
\boxed{
\begin{array}{l}
\textbf{Literal displayed (SC): true with }C_\alpha=0\textbf{ by oversized-}Y
\textbf{ normalization escape}.\\[1mm]
\textbf{Claimed implication to second-shell clearing: invalid under those literal quantifiers}.\\[1mm]
\textbf{Exact repair: cap the effective cutoff, normalize by }Z_n=\min(Y_n,n/4),\\
\textbf{control the frozen-entry term uniformly, and require a uniform }o\textbf{-remainder}.\\[1mm]
\textbf{The repaired shadow-capacity assertion }(\mathrm{SC}^\ast)\textbf{ is the substantive}\\
\textbf{cross-reply problem; the argument above proves no depth-}J\textbf{ version of it.}
\end{array}}
\]

Thus the exact statement posed is resolved, but not in the intended way: it contains a cutoff-normalization mismatch that makes its capacity content disappear.


## Attachment P (verbatim): the ambient-denominator collapse, the cohort equivalence theorem, and the derivation of (SC^rel)

# Verdict

\[
\boxed{\text{\((\mathrm{SC}^\ast)\) has another quantifier-level collapse.}}
\]

It is not an independent shadow-capacity theorem. With the stated ambient normalization \(n\Lambda_n\) and quantification only over realized trajectories, it is equivalent to the absence of a positive-density family of macroscopic service roots. By the accepted fresh-root theorem, that is equivalent to the repaired second-shell no-linear-tail assertion.

The new collapse is:

\[
\boxed{\textbf{ambient-denominator laundering}}
\]

or, more descriptively,

\[
\boxed{\textbf{sublinear-cohort absorption}.}
\]

If the macroscopic service-root cohort has size \(o(n)\), then its entire small-prime preparation demand is automatically \(o(n\Lambda_n)\), by Turán–Kubilius and Cauchy–Schwarz. No chronology, shadow closure, reply packet, degree ledger, or four-layer causal argument is needed.

Conversely, any positive-density macroscopic service-root cohort automatically violates \((\mathrm{SC}^\ast)\), for every admissible deterministic cutoff and every fixed \(C_\alpha\).

Thus, under the accepted second-shell machinery,

\[
\boxed{
\bigl[(\mathrm{SC}^\ast)(\alpha)\text{ for every }\alpha>0\bigr]
\iff
\text{no admissible linear second-shell tail}.
}
\tag{A}
\]

Consequently, the bare truth value of \((\mathrm{SC}^\ast)\) is exactly the truth value of the repaired second-shell clearing statement. The formulation does not isolate the promised cross-reply correlation theorem.

I prove this equivalence below and give a relative normalization that repairs the collapse.

---

# 1. Notation

Fix the activation data and the prefix-measurable tie-break. For a realized interval \(I\), put

\[
G_\alpha(I)
=
\{g_t:g_t\ge \alpha n\},
\qquad
M_\alpha(I)=|G_\alpha(I)|,
\]

and

\[
S_{\alpha,Z}(I)
=
\sum_{g_t\in G_\alpha(I)}\nu_Z(g_t).
\]

The roots \(g_t\) are distinct.

For released roots,

\[
\nu_Z(g)
=
\#\{p\le Z:p\mid g,\ p\ne q(g)\},
\]

where \(q(g)\) is the release prime. For an initially minimal root, it is enough to use the universal inequality

\[
\nu_Z(g)\le \omega_Z(g),
\]

where

\[
\omega_Z(m)=\#\{p\le Z:p\mid m\}.
\]

Let

\[
\Lambda_Z=\sum_{p\le Z}\frac1p.
\]

We always have \(\Lambda_Z\to\infty\) when \(Z\to\infty\).

---

# 2. A uniform Turán–Kubilius upper bound for arbitrary cohorts

The same Turán–Kubilius estimate used for the lower-demand argument also gives an upper bound for every subset of a fixed macroscopic interval.

## Lemma 1: subset upper bound

Fix \(0<\alpha<1/4\). Uniformly for \(2\le Z\le n/4\) and every set of distinct integers

\[
G\subseteq[\alpha n,n/4],
\]

of size \(M\),

\[
\boxed{
\sum_{g\in G}\omega_Z(g)
\le
M\Lambda_Z
+
O_\alpha(M)
+
O_\alpha\!\left(\sqrt{Mn\Lambda_Z}\right).
}
\tag{1}
\]

### Proof

On the fixed macroscopic interval \([\alpha n,n/4]\), Turán–Kubilius gives

\[
\sum_{\alpha n\le m\le n/4}
\left(\omega_Z(m)-\Lambda_Z\right)^2
=
O_\alpha(n\Lambda_Z).
\tag{2}
\]

A harmless \(O_\alpha(1)\) change in the center can be absorbed into the \(O_\alpha(M)\) term.

By Cauchy–Schwarz,

\[
\begin{aligned}
\sum_{g\in G}\omega_Z(g)
&=
M\Lambda_Z+
\sum_{g\in G}\bigl(\omega_Z(g)-\Lambda_Z\bigr)\\
&\le
M\Lambda_Z
+
\sqrt{M}
\left(
\sum_{\alpha n\le m\le n/4}
(\omega_Z(m)-\Lambda_Z)^2
\right)^{1/2}
+
O_\alpha(M),
\end{aligned}
\]

which is (1). ∎

Since \(\nu_Z(g)\le\omega_Z(g)\), the same upper bound holds for \(S_{\alpha,Z}\).

---

# 3. Every sublinear service cohort is absorbed by the global remainder

Suppose

\[
\theta_n(\alpha)
=
\sup_I\frac{M_\alpha(I)}n
\longrightarrow0,
\tag{3}
\]

where the supremum is over all realized intervals in the fixed admissible class.

Applying Lemma 1 with \(M=M_\alpha(I)\) gives

\[
S_{\alpha,Z_n}(I)
\le
M_\alpha(I)\Lambda_n
+
O_\alpha(M_\alpha(I))
+
O_\alpha\!\left(\sqrt{M_\alpha(I)n\Lambda_n}\right).
\]

After division by \(n\Lambda_n\),

\[
\frac{S_{\alpha,Z_n}(I)}{n\Lambda_n}
\le
\frac{M_\alpha(I)}n
+
O_\alpha\!\left(\frac{M_\alpha(I)}{n\Lambda_n}\right)
+
O_\alpha\!\left(
\sqrt{\frac{M_\alpha(I)}{n\Lambda_n}}
\right).
\]

Taking the supremum over \(I\),

\[
\boxed{
\sup_I
\frac{S_{\alpha,Z_n}(I)}{n\Lambda_n}
\le
\theta_n(\alpha)
+
O_\alpha\!\left(\frac{\theta_n(\alpha)}{\Lambda_n}\right)
+
O_\alpha\!\left(
\sqrt{\frac{\theta_n(\alpha)}{\Lambda_n}}
\right)
=o(1).
}
\tag{4}
\]

Therefore:

## Proposition 2

If the number of macroscopic service roots is uniformly \(o(n)\), then \((\mathrm{SC}^\ast)(\alpha)\) holds with

\[
\boxed{C_\alpha=0}
\]

for every admissible deterministic \(Z_n\to\infty\).

No use has been made of:

- the degree ledger;
- first blockers;
- release times;
- coatom preparation;
- downward-shadow closure;
- reply packet lcms;
- primitiveness of the replies;
- the four-layer causal chronology.

The whole demand is placed in the permitted \(o(n\Lambda_n)\) remainder.

This is ambient-denominator laundering.

---

# 4. A positive-density cohort always violates \((\mathrm{SC}^\ast)\)

The converse is equally automatic.

## Lemma 3: subset lower bound

Fix \(\delta>0\). Suppose

\[
G\subseteq[\alpha n,n/4],
\qquad
|G|\ge\delta n.
\]

Then, uniformly for every deterministic \(Z_n\to\infty\) with \(Z_n\le n/4\),

\[
\boxed{
\sum_{g\in G}\omega_{Z_n}(g)
\ge
\left(\frac{\delta}{2}-o(1)\right)n\Lambda_n.
}
\tag{5}
\]

### Proof

From (2), Chebyshev gives

\[
\#\left\{
m\in[\alpha n,n/4]:
\omega_{Z_n}(m)<\frac12\Lambda_n
\right\}
=
O_\alpha\!\left(\frac n{\Lambda_n}\right)
=
o(n).
\]

Thus all but \(o(n)\) members of \(G\) have at least \(\Lambda_n/2\) small prime divisors. ∎

At a sparse entry position, only \(o(n)\) of the service roots can be initially minimal. Remove them. Every remaining root has a release prime, and excluding that one prime loses at most one unit per root. Hence

\[
\begin{aligned}
S_{\alpha,Z_n}(I)
&\ge
\sum_{g\in G}\omega_{Z_n}(g)-|G|-o(n)\pi(Z_n)\\
&\ge
\left(\frac{\delta}{3}-o(1)\right)n\Lambda_n,
\end{aligned}
\tag{6}
\]

where the last form is also precisely the accepted demand estimate from Attachment M. The initially minimal contribution can alternatively be removed before applying the lower bound; only \(o(n)\) roots are lost.

Since

\[
E(I)\le \frac n4,
\]

for every fixed \(C_\alpha\),

\[
\frac{C_\alpha E(I)}{n\Lambda_n}
\le
\frac{C_\alpha}{4\Lambda_n}
=o(1).
\]

Consequently,

\[
\boxed{
\frac{
\bigl(
S_{\alpha,Z_n}(I)-C_\alpha E(I)
\bigr)_+
}{
n\Lambda_n
}
\ge
\frac{\delta}{3}-o(1).
}
\tag{7}
\]

Therefore no deterministic admissible choice of \(Z_n\) and no finite \(C_\alpha\) can make the uniform remainder tend to zero.

---

# 5. Exact characterization of \((\mathrm{SC}^\ast)(\alpha)\)

Combining (4) and (7) gives the exact statement.

## Theorem 4: cohort equivalence

For each fixed \(0<\alpha<1/4\),

\[
\boxed{
(\mathrm{SC}^\ast)(\alpha)
\iff
\sup_I
\frac{M_\alpha(I)}n
\longrightarrow0.
}
\tag{8}
\]

Here the intervals and the supremum use the activation data and tie-break frozen in advance.

### Proof

The implication from right to left is Proposition 2.

If the right side fails, there are \(\delta>0\), a subsequence \(n_k\), and realized intervals \(I_k\) such that

\[
M_\alpha(I_k)\ge\delta n_k.
\]

Equation (7) contradicts \((\mathrm{SC}^\ast)(\alpha)\) for every proposed \(C_\alpha,Z_n\). ∎

This is stronger than the already stated implication from \((\mathrm{SC}^\ast)\) to clearing: it identifies exactly what the inequality says.

---

# 6. Equivalence with the repaired second-shell no-tail statement

The accepted fresh-root theorem says that a \(T\ge cn\) tail produces, for

\[
\alpha=\frac c2,
\]

at least

\[
\frac c2n-o(n)
\]

distinct service roots in

\[
\left[\frac c2n,\frac n4\right].
\]

Thus failure of the repaired second-shell exclusion implies failure of \((\mathrm{SC}^\ast)(c/2)\).

Conversely, second-shell clearing gives a uniform \(o(n)\) bound on the total number of active turns, hence certainly on every \(M_\alpha(I)\). Theorem 4 then gives \((\mathrm{SC}^\ast)(\alpha)\) with \(C_\alpha=0\).

Therefore, under the four accepted equivalence conditions for the repaired second-shell statement,

\[
\boxed{
\begin{aligned}
&(\mathrm{SC}^\ast)(\alpha)
\text{ for every fixed }\alpha>0\\
&\qquad\Longleftrightarrow
\text{no linear capped second-shell tail}\\
&\qquad\Longleftrightarrow
\mathrm{FSC}(2,\eta)
\text{ in its repaired, uniformly activated form}.
\end{aligned}}
\tag{9}
\]

If “bad interval” is interpreted more narrowly as an interval already satisfying \(T\ge cn\) for a fixed \(c\), the collapse is even more direct:

- when no such interval exists, the supremum is eventually over the empty class;
- when such intervals exist, (7) forces failure.

---

# 7. Why this is a genuine additional collapse

The oversized-cutoff escape from Attachment O was caused by a mismatch between the saturated statistic and an unsaturated normalization. That defect has been repaired by \(Z_n\le n/4\) and the prime-harmonic normalization.

The present defect is different.

Even with a perfectly calibrated cutoff,

\[
\boxed{
M_\alpha(I)=o(n)
\quad\Longrightarrow\quad
S_{\alpha,Z_n}(I)=o(n\Lambda_n)
}
\]

for purely arithmetic reasons.

Hence the unspecified global uniform remainder may absorb the entire preparation demand of every sublinear cohort. The capacity assertion becomes true as soon as the desired conclusion is true, without proving any reply-capacity statement.

Equally, every linear cohort defeats the inequality before packet chronology is considered.

Thus the following apparently substantive objects are irrelevant to the truth of the displayed formula:

\[
\sigma<\beta<\gamma<t,
\]

the downward-shadow recursion, direct-ancestor reuse, the degree ledger, and the common reply packet. They matter only to an attempted proof of the equivalent no-tail statement, not to the logical content of \((\mathrm{SC}^\ast)\) itself.

This is the twenty-sixth collapse:

\[
\boxed{\textbf{ambient-denominator laundering}.}
\]

---

# 8. Exact repair: normalize the remainder by the realized ledger scale

To state a genuinely stronger trajectory-capacity theorem, the error cannot be allowed to scale with the ambient \(n\) alone. It must be small relative to the realized ledger scale \(E(I)\Lambda_n\).

There are two unavoidable frozen-baseline contributions.

Let

\[
\mu_n(\alpha)
=
\sup_{\text{entry positions}}
\#\left(
\mathcal M(A_1)\cap[\alpha n,n/4]
\right)
=o(n).
\]

A crude uniform initial-root bound is

\[
\mu_n(\alpha)\pi(Z_n).
\]

The direct pre-entry coatom contribution is

\[
O_\alpha(Z_n^2a_n).
\]

Choose \(Z_n\to\infty\) sufficiently slowly that, in addition to the stated frozen-entry condition,

\[
\mu_n(\alpha)\pi(Z_n)
=
o(n\Lambda_n).
\tag{10}
\]

This is always possible by a deterministic diagonal choice because both \(a_n/n\) and \(\mu_n(\alpha)/n\) tend to zero.

Define the frozen baseline budget

\[
B_{\alpha,n}
=
Z_n^2a_n+\mu_n(\alpha)\pi(Z_n)+1.
\tag{11}
\]

A genuine relative shadow-capacity assertion is:

\[
\boxed{
\sup_I
\frac{
\left(
S_{\alpha,Z_n}(I)
-
C_\alpha E(I)
-
K_\alpha B_{\alpha,n}
\right)_+
}{
(E(I)+1)\Lambda_n+B_{\alpha,n}
}
\longrightarrow0.
}
\tag{\(\mathrm{SC}^{\mathrm{rel}}\)}
\]

Equivalently, there must be a deterministic \(\rho_{\alpha,n}\to0\), chosen before Prolonger, such that every realized interval satisfies

\[
\boxed{
S_{\alpha,Z_n}(I)
\le
C_\alpha E(I)
+
K_\alpha B_{\alpha,n}
+
\rho_{\alpha,n}(E(I)+1)\Lambda_n.
}
\tag{12}
\]

This version retains all the intended consequences:

- On a linear bad interval,
  \[
  E(I)\le n/4,
  \qquad
  B_{\alpha,n}=o(n\Lambda_n),
  \]
  so the right side of (12) is \(o(n\Lambda_n)\), apart from the \(O(n)\) term \(C_\alpha E\).
- The Turán–Kubilius demand is \(\Omega(n\Lambda_n)\), giving a contradiction.

But second-shell clearing alone no longer proves (12). From \(M_\alpha=o(n)\), Lemma 1 gives only

\[
S_{\alpha,Z_n}=o(n\Lambda_n).
\]

It does not give

\[
S_{\alpha,Z_n}
=
o(E(I)\Lambda_n).
\]

For example, an arithmetic cohort of \(M=o(n)\) typical integers has

\[
\sum_{g\in G}\omega_Z(g)
\sim M\Lambda_Z.
\]

If \(E\asymp M\), its demand is of full order \(E\Lambda_Z\), even though it is invisible after division by \(n\Lambda_Z\). Thus the relative formulation still requires the promised chronological correlation theorem.

It also closes the familiar baseline defects:

- activation and tie-break are fixed before trajectories;
- all turns from the common baseline are counted;
- initially available roots are charged through \(\mu_n\);
- pre-entry direct preparation is charged through \(Z_n^2a_n\);
- no post-hoc suffix or cohort can redefine the denominator;
- \(Z_n\le n/4\) closes the oversized-cutoff escape;
- no threshold \(E\ge b_n\) is imposed, avoiding registration starvation.

---

# 9. Earlier-processed shells and depth \(J\)

The equivalence collapse is uniform over the source of shadow blockers because it never examines those blockers. At every fixed shell depth, the same Turán–Kubilius argument gives:

\[
\text{sublinear macroscopic service cohort}
\Longrightarrow
o(n\Lambda_n)\text{ total demand}.
\]

So the ambient-denominator defect persists verbatim at every fixed depth.

That does **not** provide a depth-\(J\) packet-capacity proof. A relative statement at shell \(j\) must carry:

- the source-shell label of each shadow blocker;
- a frozen baseline budget including all previously processed shells;
- constants \(C_{\alpha,j}\) or \(C_{\alpha,J}\);
- a relative remainder normalized by that shell’s realized \(E_j\Lambda_n\).

Nothing in the argument above bounds reuse by blockers from earlier shells. Therefore:

\[
\boxed{
\text{The logical collapse is depth-uniform, but no substantive
depth-\(J\) capacity estimate has been proved.}
}
\]

---

# Final ruling

\[
\boxed{
\begin{array}{l}
\textbf{\((\mathrm{SC}^\ast)\) is REPAIRABLE as a purported intermediate theorem.}\\[1mm]
\textbf{Its new collapse is ambient-denominator laundering.}\\[1mm]
\textbf{Every uniformly \(o(n)\) macroscopic root cohort automatically has}\\
\textbf{\(o(n\Lambda_n)\) demand by Turán–Kubilius and Cauchy–Schwarz.}\\[1mm]
\textbf{Every positive-density macroscopic cohort automatically violates}\\
\textbf{\((\mathrm{SC}^\ast)\), for every admissible cutoff and every fixed \(C_\alpha\).}\\[1mm]
\textbf{Hence \((\mathrm{SC}^\ast)\), for all \(\alpha\), is equivalent to the repaired}\\
\textbf{second-shell no-linear-tail statement; it is not an independent}\\
\textbf{cross-scale, cross-reply capacity inequality.}\\[1mm]
\textbf{The exact structural repair is a relative remainder on the scale}\\
\textbf{\(E(I)\Lambda_n\), with frozen entry and initial-root budgets separated.}
\end{array}}
\]

Accordingly, the bare proposition has not been independently proved or refuted: its truth value is exactly the truth value of repaired second-shell clearing. What has been refuted is the claim that its exact displayed quantifiers isolate the missing nonadditive shadow-capacity mechanism.
REMEMBER - this argument may require non-trivial, creative and novel elements; both directions are valuable, and the proof must handle arbitrary replies.
