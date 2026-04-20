---
id: R13-simplex-audit-1
type: verification
date: 2026-04-18
intent: >
  First of three adversarial audits of Pro Channel A simplex obstruction
  theorem (legal circuit + bounded-order repair impossibility).
predecessors: [R13-pro-A-obstruction]
action:
  kind: confirms
  target: R13-pro-A-obstruction
claim: >
  Core support-theoretic lemma and simplex construction basically correct.
  Obstruction genuinely kills bounded-order local repair for arbitrary
  overlapping squarefree families. Weakest link: claim that one move Q_t
  clears the circuit is false in game-theoretic sense. Scope overstated.
siblings: [R13-simplex-audit-3, R13-simplex-audit-5]
---
# Audit of Package B — simplex obstruction (first of three)

Here is the adversarial audit.

The short verdict is: **the core support-theoretic lemma and the simplex construction are basically correct, but the response overstates what they imply.** The obstruction genuinely kills any **uniform bounded-order local repair lemma for arbitrary overlapping squarefree carrier families**. But it does **not** yet justify the stronger claim that *any* full overlap-extension of the Resolution Theorem must literally deploy rank-(\Omega(\log n/\log\log n)) moves in actual play. And its reassurance that “one move (Q_t) clears the circuit” is **false in the prime-resolution sense** relevant to the game.

The weakest link is point **5**: the statement that a single high-order move (Q_t) “kills the circuit immediately,” used to argue compatibility with (O(n/\log n)), is too strong and in the natural game-theoretic reading is simply wrong.

1. The legal-circuit lemma

This is the strongest part, but it needs a wording repair.

For squarefree numbers, divisibility is exactly support inclusion:
[
a\mid b \quad\Longleftrightarrow\quad \operatorname{supp}(a)\subseteq \operatorname{supp}(b).
]

So if (m_T=\prod_{p\in T}p) is squarefree and (x\mid m_T), then (x) is also squarefree, with
[
\operatorname{supp}(x)\subseteq T.
]
That is the missing reason the “squarefree” hypothesis actually matters.

The proof step

> if (x\mid m_T) and (x\neq m_T), then (\operatorname{supp}(x)\subsetneq T), so by (2) some carrier has support containing (\operatorname{supp}(x)), which since everything is squarefree means that carrier divides (x)

has the divisibility direction reversed in prose. What is true is:

* (\operatorname{supp}(x)\subseteq S) for some carrier support (S),
* both (x) and the carrier are squarefree,
* therefore **(x) divides the carrier**, not the other way around.

That is exactly what makes (x) illegal.

So the corrected lemma is:

* (m_T) is legal against the carrier family by condition (1).
* Any **legal** move comparable with (m_T) must be a multiple of (m_T).

That “legal” qualifier matters. As written, “any move comparable with (m_T) must be divisible by (m_T)” is too strong. There may be plenty of improper divisors (x) of (m_T); they are merely **illegal**, not nonexistent.

So point 1 is basically sound, with these fixes:

* say “(x) divides the carrier,” not “carrier divides (x)”;
* say “any **legal** comparable move,” not “any comparable move.”

2. The simplex construction

This part is mostly correct.

(a) The (C_i) form an antichain

You define
[
C_i=\frac{2Q_t}{q_i},\qquad Q_t=\prod_{i=1}^t q_i,
]
with supports
[
S_i={2}\cup(T\setminus{q_i}).
]

Each (C_i) is squarefree, and every support (S_i) has size (t). Since the supports are distinct but all have the same size, no one contains another. For squarefree integers, that means no (C_i) divides another. So yes: they form an antichain.

(b) (T) satisfies the legal-circuit conditions

Also correct.

* (S_i\nsubseteq T) because (2\in S_i) but (2\notin T).
* (T\nsubseteq S_i) because (q_i\notin S_i).
* If (U\subsetneq T), choose (j) with (q_j\notin U). Then
  [
  U\subseteq T\setminus{q_j}\subseteq S_j.
  ]

So (T) is a legal circuit for ({S_1,\dots,S_t}).

(c) (Q_t) is legal

Against the carrier family alone, yes.

* (Q_t\nmid C_i), because (q_i) is missing from (C_i).
* (C_i\nmid Q_t), because (2\mid C_i) but (2\nmid Q_t).

So (Q_t) is incomparable with every (C_i). It is also incomparable with (2), since (Q_t) is odd.

But there is an important historical caveat the response suppresses: **if (2) or any (q_i) had already been played earlier as a separate move, then this full simplex position could not later be completed.** For example, if (q_i) had been played, then every (C_j) with (j\neq i) would be illegal, since (q_i\mid C_j). Likewise if (2) had been played, every (C_i) would be illegal.

So the construction is a valid **static legal position**, but the response does not address whether Prolonger can actually force it online against an adversarial Shortener. That matters later.

3. The asymptotic (t(n)\sim \log n/\log\log n)

This is fine.

Because the (q_i) are the first (t) odd primes, (q_t=p_{t+1}), and
[
\log Q_t=\sum_{i=1}^t \log q_i=\vartheta(q_t)-\log 2\sim q_t.
]
Using the prime number theorem in the form
[
q_t\sim t\log t,
]
you get
[
\log Q_t\sim t\log t.
]

If (t=t(n)) is maximal with (Q_t\le n), then
[
t\log t\sim \log n.
]
Standard inversion gives
[
t(n)=(1+o(1))\frac{\log n}{\log\log n}.
]

The constant is indeed (1). No hidden factor of (2) or similar is lurking.

4. What the obstruction really proves, and what it does not

This is where the response overreaches.

What the simplex argument **does** prove:

* There are squarefree overlapping carrier families for which the specific witness
  [
  m_T=\prod_{p\in T}p
  ]
  is legal.
* Any **legal move comparable with that witness** must contain all primes of (T).
* Therefore, any theorem of the form “from every overlapping carrier configuration there is always a legal repair move involving at most (k) blocked primes” is false for every fixed (k), and in fact false for (k=o(\log n/\log\log n)).

That is a genuine obstruction to a bounded-order **local repair lemma**.

What it does **not** prove:

* It does not prove that every future (O(n/\log n)) proof must literally play rank-(\Omega(\log n/\log\log n)) moves somewhere in actual game play.
* It does not prove Prolonger can force this simplex online against optimal Shortener.
* It does not rule out a proof that preempts these clutters before they form, or handles them indirectly by global counting, economics, or some non-resolution argument.

So the logical leap
[
\text{“there exists a legal position needing a rank-}t\text{ comparable move”}
\Longrightarrow
\text{“any full overlap-extension must allow rank-}t\text{ repairs”}
]
is too fast.

The correct conclusion is narrower:

* **No bounded-order offline/local repair theory can handle all legal overlapping squarefree carrier families.**

That is a good theorem. It is not yet the same as:

* **Any actual-game (O(n/\log n)) theorem must use high-order repair moves.**

Those are different claims.

5. Compatibility with (O(n/\log n))

This is the serious flaw.

The response says:

> In this simplex position, one high-order move (Q_t) kills the circuit immediately. So the obstruction is about the kind of move Shortener must be able to make, not about needing too many moves.

That is misleading at best, and false in the natural meaning relevant to the Resolution Theorem.

Playing (Q_t) does **not** dominate the carriers:
[
C_i=\frac{2Q_t}{q_i}
]
is incomparable with (Q_t), not a divisor of it.

More importantly, playing (Q_t) does **not** resolve the primes (q_i).

The smallest example already breaks this. With carriers
[
30,\ 42,\ 70
]
and Shortener playing
[
105,
]
the move
[
33=3\cdot 11
]
is still legal:

* (33) is incomparable with (30,42,70),
* (33) is incomparable with (105).

So prime (3) remains unresolved. The same phenomenon is completely general: after playing (Q_t), a number of the form (q_i r) with a new prime (r\notin T\cup{2}) is typically still legal whenever (q_i r\le n).

So “one move (Q_t) clears the circuit” is only true in the very weak sense that it captures the single witness (m_T). It is **not** true in the stronger sense needed for the disjoint-case resolution program, namely that it resolves the associated primes.

That breaks the compatibility argument as stated. The simplex obstruction may still be compatible with (O(n/\log n)), but not for the reason given.

About accumulation: disjoint simplex families do not obviously force super-(n/\log n) many captures, because a family of order (t) costs Prolonger (t) carrier moves to build and might only demand (O(1)) special responses. So there is no immediate count explosion from the simplex alone. But because (Q_t) does not actually resolve the primes, the “one capture per simplex” story is unfinished.

Bottom line

What survives:

* The legal-circuit lemma is basically correct after wording fixes.
* The simplex family is a real squarefree overlapping antichain with circuit order
  [
  \Theta(\log n/\log\log n).
  ]
* Therefore bounded-order pair/triple/(k)-tuple local repair cannot be a universal overlap theory.

What does not survive unchanged:

* The jump to “any full overlap-extension must allow repair order (\Omega(\log n/\log\log n))” is too broad unless you mean only **offline/local repair theories on arbitrary legal clutters**.
* The claim that one move (Q_t) “kills the circuit immediately” in a way compatible with the Resolution Theorem’s notion of resolving primes is false.

So my audit verdict is:

**Core obstruction: sound in a restricted, method-theoretic sense.
Stated meta-conclusion: overstated.
Compatibility argument with (O(n/\log n)): broken as written.**
