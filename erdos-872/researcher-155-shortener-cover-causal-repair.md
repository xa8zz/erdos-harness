---
id: R155-shortener-cover-causal-repair
type: research
date: 2026-07-13
intent: >
  Determine whether the time-ordered primitive multiple-cover schedule
  characterizing the repaired second-shell clearing statement is correctly
  posed by fusing the scheduling-face reduction with the cone-face
  reduction, or whether the stated equivalence hides a formulation defect.
predecessors: [R152-fsc2-equivalence-persistent-root-deadline-open, R154-shallow-cone-hazard-conditional]
action:
  kind: extends
  target: R152-fsc2-equivalence-persistent-root-deadline-open
claim: >
  Setup: fix a position B immediately before a Shortener move in a
  second-shell active greedy interval; let Q_t denote the second-shell
  target set at time t, g_t Shortener's prescribed maximum-deletion move
  (degree Delta_t = |{y in Q_t : g_t | y}|), p_t the following Prolonger
  reply, C the position after T rounds, X the final survivor set
  (X subset Q_t for all t), and for a lower integer d, k_X(d) = |{x in X :
  d | x}|. Let E = |Q_1(B) \ X|.
  Non-equivalence: the claimed scheduling-face equivalence, read as
  requiring every d legal at B with k_X(d) exceeding a stated threshold
  to divide "one of the Shortener-selected moves" among the first s
  turns, is ill-posed because it admits two readings, both defective.
  Causal reading (the Shortener move that first makes d illegal must
  itself be a multiple of d): impossible for any d legal at B with
  k_X(d) > 0, since a first blocker of such a d can never be a
  maximum-degree Shortener move. Noncausal reading (some later
  Shortener move happens to be a multiple of d, regardless of whether
  it caused d's illegality): satisfiable but causally vacuous, since an
  obligation already discharged by an earlier Prolonger move can be
  laundered against an unrelated later Shortener move.
  Lemma 1: if d is legal at A_t and k_X(d) > 0, then d and g_t are
  incomparable under divisibility. (If g_t | d then g_t | x for the
  witness x in X, contradicting x's survival; if d | g_t then
  N_{Q_t}(g_t) is a strict subset of N_{Q_t}(d) since x lies in
  N_{Q_t}(d) but not N_{Q_t}(g_t), contradicting maximality of g_t's
  degree.)
  Corollary 2: if d is legal immediately before Shortener's t-th move,
  k_X(d) > 0, and d becomes illegal at the next Shortener position,
  then the Prolonger reply p_t satisfies d | p_t (p_t | d is impossible
  by the same witness argument, and g_t cannot block d by Lemma 1).
  Theorem 3 (causal Prolonger deadline): for 1 <= s <= T, if d is legal
  at B and k_X(d) > E/s, then there exists j < s with d | p_j (p_j is
  the first blocker of d). Equivalently {d in L(B) : k_X(d) > E/s} is
  contained in the union over j < s of Div(p_j).
  Section 4 (strengthened persistent-root bound): for a family R of
  final minimal roots covering X (rho(x) in M(C), rho(x) | x, each r in
  R legal throughout the interval), Theorem 3 with s=T gives
  T*k_X(r) <= E for every r in R, hence |R| >= |X|T/E. If |X| >
  (eta/4+o(1))n and T >= cn, then E <= ((1-eta)/4+o(1))n and |R| >=
  (eta*c/(1-eta) - o(1))n, improving the previously available
  |R| >= (eta*c-o(1))n. This remains consistent (no contradiction),
  since T <= E always.
  Section 5 (the two defective readings, exact): (5.1) the causal
  reading is provably empty — no first blocker of a divisor incident
  to a final survivor can be a maximum-degree Shortener move (direct
  consequence of Lemma 1). (5.2) the noncausal reading is exhibited to
  be satisfiable-but-vacuous by an explicit n=30 construction: B={7},
  S_1=(7.5,15], Q_1(B)={8,9,10,12,15}; Shortener plays g_1=3 (tied with
  d=2 at degree 3), Prolonger replies p_1=22, which blocks d=2 via
  d | p_1 while preserving 8,10; the second-shell set becomes
  Q_2={8,10}; Shortener then plays g_2=4, deleting 8, leaving X={10}.
  Here d=2 divides both p_1=22 (causal blocker) and the later g_2=4,
  but g_2 played no causal role — d was already illegal.
  Section 6 (exact repair): define tau(d) = min{j : d | p_j}. The
  correct chronological obligation is k_X(d) > E/s implies tau(d) < s,
  i.e. {d in L(B) : k_X(d) > E/s} is contained in the union over j < s
  of Div(p_j), with each d charged to its earliest Prolonger blocker.
  Section 7: an explicit construction (n=96N, S_1=(24N,48N],
  X={2r : r odd, 12N<r<=24N}, |X|=n/16=|S_1|/4) realizes the repaired
  primitive-cover deadlines together with survivor avoidance
  and a linear persistent-root family whose final minimality is
  postponed until after T=4N=n/24 blocker moves, all simultaneously,
  at linear scale — but the moves are not embedded as genuine
  Prolonger replies against the prescribed greedy-Shortener trajectory,
  so this is not a counterexample to FSC(2,eta); it shows only that no
  theorem relying purely on primitiveness, survivor avoidance, final
  minimal roots, and prefix deadlines (without the maximum-degree
  dynamics) can succeed.
  Scope: the causal-orientation theorem (Lemma 1, Corollary 2,
  Theorem 3) iterates verbatim to every fixed shell Q_j. The exclusion
  of the repaired schedule does not iterate: in deeper shells,
  Prolonger replies from earlier shells can serve as upward blockers.
  Open: whether a linear active greedy interval can realize the
  repaired obligations via genuine Prolonger replies against
  the prescribed maximum-degree Shortener policy while every member of
  X stays legal and nonminimal is neither proved nor refuted; FSC(2,eta)
  is not settled by this round, and neither L(n)=o(n) nor L(n)=Omega(n)
  is established.
implications:
  - Any future proof or disproof of the scheduling face must use the
    corrected chronological obligation charged to earliest Prolonger
    replies, not to "any Shortener-selected move" — the literal equivalence
    in the prior scheduling-face reduction is invalidated in its stated
    form.
  - The persistent-root lower bound tightens from (eta*c-o(1))n to
    (eta*c/(1-eta)-o(1))n, strengthening the numerical evidence available
    for subsequent dispatches without producing a contradiction.
  - The remaining exclusion problem is explicitly a many-to-one batch
    coverage question (one Prolonger reply can discharge many causal
    deadlines simultaneously via Div(p_j)), not a single-divisor cover —
    narrows the shape any future proof or disproof attempt must take.
  - A twentieth degenerate-collapse family is identified and named
    (post-blocker player laundering), to be checked against future repaired
    statements alongside the previously catalogued nineteen.
confidence_at_time: medium
strategy_dependence: greedy-policy-dependent
prompt: erdos-872/prompts/researcher-R155-deadline-schedule-fusion.md
---

# Verdict

\[
\boxed{\text{The two stated “faces” are not actually equivalent.}}
\]

The scheduling face in the question contains a **player-role and causality collapse**. A divisor of a final survivor cannot be first blocked by a maximum-degree Shortener move. Its first blocker is necessarily a **Prolonger reply**. If “divides a Shortener-selected move” is allowed to mean a later Shortener move, after the divisor was already blocked, the condition becomes post-hoc bookkeeping and no longer expresses the deadline.

Thus there are two readings:

\[
\begin{array}{ll}
\textbf{Causal Shortener-cover reading:}
&\text{impossible, by a strict-containment argument};\\[1mm]
\textbf{Noncausal Shortener-cover reading:}
&\text{too weak, because obligations can be laundered through later moves}.
\end{array}
\]

Attachment G itself used “one of the moves selected,” not “one of the Shortener-selected moves.” That distinction is essential.

I give below:

1. the exact causal-orientation theorem;
2. a stronger survivor deadline than the one in Attachment G;
3. an explicit legal greedy example exhibiting post-blocker laundering;
4. the exact repaired chronological object;
5. a linear primitive cover skeleton showing that the corrected cover constraints alone are arithmetically realizable.

The result resolves a hidden formulation collapse. It does **not** prove or disprove the correctly repaired \(\mathrm{FSC}(2,\eta)\).

---

# 1. Setup for one tail

Let \(B=A_1\) be the position immediately before the first Shortener move in a \(T\)-turn active second-shell interval. Write

\[
Q_t=Q_1(A_t).
\]

Let \(g_t\) be Shortener’s prescribed maximum-deletion move at \(A_t\), and let \(p_t\) denote the following Prolonger reply. Put

\[
D_t=N_{Q_t}(g_t)
=\{y\in Q_t:g_t\mid y\},
\qquad
\Delta_t=|D_t|.
\]

Let \(C\) be the position after these \(T\) rounds, and define

\[
X=Q_1(C).
\]

Because legality never regenerates, and because a target that is nonminimal at the final position has a final legal proper divisor which was legal at every earlier time,

\[
X\subseteq Q_t
\qquad(1\le t\le T).
\tag{1}
\]

For any lower integer \(d\), put

\[
k_X(d)=|\{x\in X:d\mid x\}|.
\]

---

# 2. Causal-orientation theorem

## Lemma 1: a greedy Shortener move is incomparable with every currently legal survivor divisor

Fix a Shortener position \(A_t\). Suppose \(d\) is legal at \(A_t\) and

\[
k_X(d)>0.
\]

Then \(d\) and \(g_t\) are incomparable.

### Proof

Choose \(x\in X\) with \(d\mid x\).

First suppose

\[
g_t\mid d.
\]

Then

\[
g_t\mid d\mid x.
\]

Selecting \(g_t\) would make \(x\) illegal, contrary to \(x\in X\).

Now suppose

\[
d\mid g_t.
\]

Every target deleted by \(g_t\) is also divisible by \(d\), so

\[
D_t=N_{Q_t}(g_t)\subseteq N_{Q_t}(d).
\]

But \(x\in N_{Q_t}(d)\), while \(x\notin D_t\), since \(x\) survives the selection of \(g_t\). Hence the inclusion is strict:

\[
N_{Q_t}(g_t)\subsetneq N_{Q_t}(d).
\]

Therefore

\[
|N_{Q_t}(d)|>\Delta_t,
\]

contradicting the fact that \(g_t\) has maximum current deletion degree.

Both divisibility orientations are impossible. Thus \(d\) and \(g_t\) are incomparable. \(\square\)

This conclusion is independent of the tie-break and uniform over every Prolonger strategy.

## Corollary 2: every first blocker of a survivor divisor is a Prolonger reply

Suppose \(d\) is legal immediately before Shortener’s \(t\)-th move, \(k_X(d)>0\), and \(d\) is illegal at the next Shortener position.

Then the Prolonger reply \(p_t\) satisfies

\[
d\mid p_t.
\tag{2}
\]

### Proof

Lemma 1 says \(g_t\) is incomparable with \(d\), so Shortener’s move does not block \(d\). Thus \(p_t\) must be comparable with \(d\).

The orientation

\[
p_t\mid d
\]

is impossible, because then \(p_t\mid d\mid x\) for every \(x\in X\) divisible by \(d\), killing such an \(x\). Therefore \(d\mid p_t\). \(\square\)

So the blocker edges in the actual deadline schedule have a forced orientation:

\[
\boxed{
\text{currently legal divisor of }X
\longrightarrow
\text{Prolonger reply}.
}
\tag{3}
\]

They never point to the contemporaneous greedy Shortener move.

---

# 3. A stronger exact deadline

Define the number of initial shell targets that do not survive:

\[
E=|Q_1(B)\setminus X|.
\]

The Shortener deletion sets \(D_t\) are pairwise disjoint, and every \(D_t\) is disjoint from \(X\). Hence

\[
\sum_{t=1}^{T}\Delta_t
\le E
\le |S_1|-|X|.
\tag{4}
\]

This improves the ledger bound \(\sum\Delta_t\le |S_1|\) used in the attachments.

## Theorem 3: causal Prolonger deadline

For \(1\le s\le T\), suppose \(d\) is legal at \(B\) and

\[
k_X(d)>\frac{E}{s}.
\tag{5}
\]

Then there exists \(j<s\) such that the Prolonger reply \(p_j\) is the first blocker of \(d\), and

\[
d\mid p_j.
\tag{6}
\]

### Proof

Suppose no Prolonger reply \(p_j\), \(j<s\), blocks \(d\).

By Lemma 1, none of the first \(s\) Shortener moves can block \(d\) while \(d\) remains legal and incident with \(X\). Therefore \(d\) is legal at each of the first \(s\) Shortener positions.

At every such position,

\[
\Delta_t\ge k_X(d),
\]

because all members of \(X\) divisible by \(d\) are still current targets. Consequently,

\[
s\,k_X(d)
\le \sum_{t=1}^{s}\Delta_t
\le E,
\]

contrary to (5).

Thus \(d\) is first blocked by some reply \(p_j\) with \(j<s\), and Corollary 2 supplies \(d\mid p_j\). \(\square\)

Equivalently, if

\[
\operatorname{Div}(p)=\{d:d\mid p\},
\]

then every realized bad interval satisfies

\[
\boxed{
\left\{
d\in\mathcal L(B):
k_X(d)>\frac{E}{s}
\right\}
\subseteq
\bigcup_{j<s}\operatorname{Div}(p_j).
}
\tag{7}
\]

Since \(E\le |S_1|\), this implies the weaker Attachment G deadline with \(|S_1|/s\).

The index \(j<s\), rather than \(j\le s\), is also important: a reply after Shortener’s \(s\)-th position is too late to prevent \(d\) from contributing to all of the first \(s\) greedy degrees.

---

# 4. Strengthening the persistent-root bound

Let \(\mathcal R\) be a family of final minimal roots covering \(X\), choosing one

\[
\rho(x)\in\mathcal M(C),
\qquad
\rho(x)\mid x
\]

for every \(x\in X\).

Each \(r\in\mathcal R\) is legal throughout the interval. Hence Theorem 3’s proof, with \(s=T\), gives

\[
T\,k_X(r)\le E.
\tag{8}
\]

Therefore every root fiber has size at most \(E/T\), and

\[
|\mathcal R|
\ge
\frac{|X|T}{E}.
\tag{9}
\]

If

\[
|X|>\left(\frac{\eta}{4}+o(1)\right)n,
\qquad
T\ge cn,
\]

then

\[
E\le
\left(\frac{1-\eta}{4}+o(1)\right)n,
\]

so

\[
\boxed{
|\mathcal R|
\ge
\left(
\frac{\eta c}{1-\eta}-o(1)
\right)n.
}
\tag{10}
\]

This improves the previously quoted lower bound

\[
|\mathcal R|\ge(\eta c-o(1))n.
\]

It still gives no contradiction: every Shortener turn removes at least one member of \(Q_1(B)\setminus X\), so \(T\le E\), and (9) is compatible with the available population.

---

# 5. Why “Shortener-selected multiple” has two defective readings

## 5.1 Causal reading

Suppose the statement means:

> The Shortener move \(g_j\) which contains \(d\) is the move that first makes \(d\) illegal.

This is impossible by Lemma 1. While \(d\) is legal and incident with a final survivor, no maximum-degree Shortener move is comparable with \(d\).

Thus a causal Shortener-cover schedule is empty:

\[
\boxed{
\text{No first blocker of a final-survivor divisor can be a greedy Shortener move.}
}
\tag{11}
\]

If the claimed equivalence in the question truly required such a schedule, the equivalence would immediately prove \(\mathrm{FSC}(2,\eta)\), but only because its counterexample object had been defined out of existence.

That is not what Attachment G proved.

## 5.2 Noncausal reading

Suppose instead the statement merely requires that, by time \(s\), some Shortener move happens to be a multiple of \(d\), even though \(d\) may already have been blocked by Prolonger.

Then the condition is causally meaningless. The later Shortener move did not meet the deadline; it only contains the already-illegal divisor.

Here is a complete legal greedy example.

### Example: \(n=30\)

Let

\[
B=\{7\},
\qquad
S_1=(7.5,15].
\]

At \(B\),

\[
Q_1(B)=\{8,9,10,12,15\}.
\]

The legal lower moves \(2\) and \(3\) both have degree \(3\):

\[
N_{Q_1(B)}(2)=\{8,10,12\},
\]

\[
N_{Q_1(B)}(3)=\{9,12,15\}.
\]

Fix the prefix-measurable tie-break to choose

\[
g_1=3.
\]

Prolonger now plays

\[
p_1=22.
\]

The move \(22\) is legal relative to \(\{7,3\}\). It blocks

\[
d=2
\]

because \(2\mid22\), while preserving both \(8\) and \(10\).

The next second-shell target set is

\[
Q_2=\{8,10\}.
\]

The legal moves \(4\) and \(5\) both have degree \(1\). Fix the tie-break to choose

\[
g_2=4.
\]

Then \(8\) is deleted and the final survivor set is

\[
X=Q_1(\{7,3,22,4\})=\{10\}.
\]

Now observe:

\[
d=2\text{ was legal at }B,
\qquad
d\mid10,
\]

\[
d\mid p_1=22,
\]

and later

\[
d\mid g_2=4.
\]

But \(g_2\) did not block \(d\). The divisor \(d\) was already illegal because of \(p_1=22\).

Thus recording \(d\) against the later Shortener move \(4\) is pure post-hoc laundering.

This is a distinct collapse mechanism:

\[
\boxed{\text{post-blocker player laundering}.}
\]

An obligation generated while \(d\) is legal is discharged in the ledger by a later move which had no causal role in making \(d\) illegal.

---

# 6. Exact repair of the scheduling face

Fix in advance all the required activation data:

\[
0<\eta_0<\eta/2,
\]

the prelude, both stopping rules, and the prefix-measurable tie-break.

A bad interval must be written as

\[
B=A_1
\xrightarrow{\,g_1\,}
\xrightarrow{\,p_1\,}
A_2
\xrightarrow{\,g_2\,}
\xrightarrow{\,p_2\,}
\cdots
\xrightarrow{\,g_T\,}
\xrightarrow{\,p_T\,}
C,
\]

where every \(g_t\) is the prescribed maximum-deletion move.

For every initially legal divisor \(d\) incident with \(X\), define its causal blocker time

\[
\tau(d)=
\min\{j:d\mid p_j\}.
\tag{12}
\]

The definition is meaningful whenever \(d\) becomes illegal; Corollary 2 proves that the first blocker must have this form.

The correct chronological obligation is

\[
\boxed{
k_X(d)>\frac{E}{s}
\quad\Longrightarrow\quad
\tau(d)<s,
}
\tag{13}
\]

where

\[
E=|Q_1(B)\setminus X|.
\]

Equivalently,

\[
\boxed{
\left\{
d\in\mathcal L(B):
k_X(d)>\frac{E}{s}
\right\}
\subseteq
\bigcup_{j<s}\operatorname{Div}(p_j),
}
\tag{14}
\]

with each \(d\) charged to its **earliest** such reply.

This repair simultaneously fixes:

- the player role;
- the off-by-one issue;
- the causal-first-blocker requirement;
- the post-hoc laundering loophole;
- the unnecessarily weak numerator \(|S_1|\).

The genuine exclusion theorem would say that no linear active greedy interval can realize (12)–(14) while keeping \(X\) legal and nonminimal.

That is the direct-ancestor batch problem. One reply \(p_j\) may contain many currently legal divisors of \(X\), each of incidence at most \(\Delta_j\), and can satisfy many causal deadlines simultaneously.

---

# 7. The repaired primitive cover is arithmetically nonvacuous

The following construction shows that no theorem based only on primitiveness, survivor avoidance, final minimal roots, and the prefix deadlines can work. The maximum-degree dynamics must be used.

Take

\[
n=96N,
\qquad
S_1=(24N,48N].
\]

Let

\[
R=\{r:12N<r\le24N,\ r\text{ odd}\},
\]

and

\[
X=\{2r:r\in R\}.
\]

Then

\[
|R|=|X|=6N=\frac n{16}
=\frac14|S_1|.
\tag{15}
\]

For each odd integer

\[
1\le e\le8N,
\]

let \(k(e)\) be the unique nonnegative integer satisfying

\[
6N<2^{k(e)}e\le12N.
\]

Define

\[
a_e=4\cdot2^{k(e)}e.
\tag{16}
\]

Then

\[
24N<a_e\le48N,
\]

so every \(a_e\) lies in \(S_1\). Order these moves by increasing \(e\).

There are exactly

\[
T=4N=\frac n{24}
\]

such odd \(e\).

## 7.1 Primitiveness and survivor avoidance

The \(a_e\) are distinct and all lie in the same open ratio-\(2\) interval \(S_1\). Hence they are pairwise incomparable.

Every \(a_e\) has \(2\)-adic valuation at least \(2\), while every \(x=2r\in X\) has \(2\)-adic valuation exactly \(1\). Thus

\[
a_e\nmid x.
\]

If \(x\mid a_e\), then, comparing odd parts,

\[
r\mid e.
\]

But

\[
e\le8N<r,
\]

which is impossible. Therefore every \(x\in X\) remains incomparable with every \(a_e\).

The same argument shows every \(r\in R\) remains legal.

## 7.2 All final roots become minimal

Let \(d\ge2\) be a proper divisor of \(r\in R\). Since \(r\) is odd, \(d\) is odd. Moreover, the least prime divisor of \(r\) is at least \(3\), so

\[
d\le\frac r3\le8N.
\]

Thus \(d\) is one of the indices in the construction, and

\[
d\mid a_d.
\]

After all \(a_e\) have been selected, every proper divisor \(d\ge2\) of \(r\) is illegal. Since \(r\) itself remains legal,

\[
r\in\mathcal M
\]

at the end. Consequently every \(x=2r\in X\) is still nonminimal.

Thus a linear family of roots is made genuinely minimal only after a linear number of primitive blocker moves.

## 7.3 Prefix deadlines

If \(k_X(d)>0\), then \(d\) has \(2\)-adic valuation at most \(1\), so

\[
d=2^\nu e,
\qquad
\nu\in\{0,1\},
\qquad
e\text{ odd}.
\]

The incidence is the number of odd multiples \(r\) of \(e\) in \((12N,24N]\), so

\[
k_X(d)\le\frac{6N}{e}+1.
\tag{17}
\]

Suppose

\[
k_X(d)>\frac{|S_1|}{s}
=\frac{24N}{s},
\qquad
1\le s\le T.
\]

For \(s\le4\), this is impossible because \(k_X(d)\le|X|=6N\).

For \(s\ge5\), since \(24N/s\ge6\), (17) gives

\[
\frac{6N}{e}
>
\frac{24N}{s}-1
\ge
\frac{20N}{s},
\]

and hence

\[
e<\frac{3s}{10}.
\tag{18}
\]

The move \(a_e\) occurs at position

\[
\frac{e+1}{2}<s.
\]

Also \(d\mid a_e\), because \(a_e\) contains at least two factors of \(2\).

Therefore

\[
\boxed{
k_X(d)>\frac{|S_1|}{s}
\quad\Longrightarrow\quad
d\mid a_e
\text{ for a blocker among the first }s-1.
}
\tag{19}
\]

So the primitive multiple-cover deadlines, survivor avoidance, linear persistent roots, and postponed final refinement are all simultaneously realizable.

What is missing is exactly what must be missing: these \(a_e\) have not been embedded as Prolonger replies against the prescribed maximum-degree Shortener trajectory, with \(X\) equal to the entire final \(Q_1\). Therefore this is not a counterexample to \(\mathrm{FSC}(2,\eta)\). It proves that a frozen or purely arithmetic “no primitive deadline cover” theorem is false.

---

# 8. Relation to the cone face

The construction above has

\[
x=2r,
\]

so the final roots carry quotient \(2\). The shallow quotient cone is therefore linear for every \(H\ge2\).

But those linear minimal roots are produced only after

\[
T=\Theta(n)
\]

blocker moves. Hence the construction does not violate Attachment H’s \(T=o(n)\) hypothesis. It is precisely a model of the postponed-refinement phenomenon:

\[
\text{linear shallow cone mass appears only after linear chronological work.}
\]

The unresolved question is whether the greedy game can force that chronological work to consume too many shell targets before the refinement is complete.

---

# 9. Scope and deeper shells

The causal-orientation theorem and the strengthened deadline iterate verbatim to every fixed shell:

\[
Q_1,S_1
\quad\rightsquigarrow\quad
Q_j,S_j.
\]

For any final survivor set \(X\subseteq Q_j\),

\[
\text{a currently legal divisor incident with }X
\]

is incomparable with the contemporaneous maximum-degree Shortener move, and its first blocker must be an upward Prolonger reply.

Likewise,

\[
s\,k_X(d)\le |Q_j(B)\setminus X|
\]

for a divisor legal through the first \(s\) Shortener positions.

What does **not** iterate is an exclusion of the repaired Prolonger-reply schedule. In deeper shells, replies from every previously processed shell can serve as upward blockers.

Therefore:

\[
\boxed{
\begin{array}{l}
\textbf{The Shortener-cover formulation is invalid.}\\[1mm]
\textbf{Its causal reading is impossible; its noncausal reading permits laundering.}\\[1mm]
\textbf{The exact repair uses earliest Prolonger replies and the bound }E/s.\\[1mm]
\textbf{Pure primitive deadline covers are realizable at linear scale.}\\[1mm]
\textbf{The remaining problem is the greedy-area coupling, not the cover alone.}
\end{array}}
\]

Accordingly, this does not prove \(\mathrm{FSC}(2,\eta)\), does not refute another Shortener policy, and does not imply either \(L(n)=o(n)\) or \(L(n)=\Omega(n)\). It isolates and repairs a hidden twentieth collapse family: **post-blocker player laundering**.