# Round 13 Pro response — Channel A (continuation / extend Theorem 5)

**Result:** no full extension; instead proves a structural **obstruction**. Any overlap-extension of Theorem 5 cannot be a bounded-order pair/triple/k-tuple repair theory — the worst-case circuit order reaches Θ(log n / log log n). Introduces the "legal circuit" concept and the "simplex obstruction."

---

I could not extend Theorem 5 to all overlaps.

What I can prove is a sharp structural obstruction to the *method*: any overlap-extension cannot be a bounded-order “pair / triple / (k)-tuple repair” theory. In fact, the repair order must sometimes grow like (\log n/\log\log n).

The clean way to state it is in support language, and the right object is a **legal circuit**.

Let me work in the squarefree overlapping subclass. That is already enough to get a rigorous barrier.

For a squarefree chosen number (x), write (\operatorname{supp}(x)) for its prime support.

Suppose the current Prolonger carriers have support family (\mathcal C\subseteq 2^{\mathcal P}), where (\mathcal P) is the set of blocked small primes.

Call (T\subseteq \mathcal P) a **legal circuit** if:

1. for every (S\in\mathcal C), neither (S\subseteq T) nor (T\subseteq S);
2. for every proper subset (U\subsetneq T), there is some (S\in\mathcal C) with (U\subseteq S).

Then:

[
m_T:=\prod_{p\in T} p
]

is a legal move, and any move comparable with (m_T) must be divisible by (m_T).

Proof: condition 1 says (m_T) is incomparable with every carrier, so it is legal. If (x\mid m_T) and (x\neq m_T), then (\operatorname{supp}(x)\subsetneq T), so by condition 2 there is a carrier whose support contains (\operatorname{supp}(x)); since everything here is squarefree, that carrier is divisible by (x), so (x) would be illegal. Therefore any legal comparable (x) cannot be a proper divisor of (m_T). Hence any legal comparable (x) must satisfy (m_T\mid x). So (x) must contain every prime of (T). ∎

This already gives the obstruction.

Take odd primes (q_1<\cdots<q_t), set
[
Q_t:=\prod_{i=1}^t q_i,
]
and assume (Q_t\le n).

Now consider the squarefree carrier family
[
C_i:=\frac{2Q_t}{q_i},\qquad i=1,\dots,t.
]

Their supports are
[
S_i={2}\cup \bigl({q_1,\dots,q_t}\setminus{q_i}\bigr).
]

These (C_i) form an antichain under divisibility: they are squarefree, all have the same number of prime factors, and their supports are distinct.

Let
[
T={q_1,\dots,q_t}.
]

Then (T) is a legal circuit for (\mathcal C={S_1,\dots,S_t}):

* no (S_i) is contained in (T), because each (S_i) contains (2);
* (T) is not contained in any (S_i), because (S_i) omits (q_i);
* every proper subset (U\subsetneq T) is contained in (S_j) for any (j) with (q_j\notin U).

So the circuit lemma applies, and (Q_t) is legal. Moreover, any move that kills (Q_t) must be divisible by (Q_t), hence must involve **all** (q_1,\dots,q_t).

Therefore:

**Simplex obstruction.** At the position
[
\left{\frac{2Q_t}{q_1},\dots,\frac{2Q_t}{q_t}\right},
]
no Shortener strategy that never plays a move containing all (q_1,\dots,q_t) can resolve any of those (q_i), because (Q_t) remains a legal move divisible by each (q_i).

This generalizes your (30,42,70) example exactly: that is the case (t=3), (q_1,q_2,q_3=3,5,7), and the circuit move is (105).

Now choose (q_1,\dots,q_t) to be the first (t) odd primes, and let (t=t(n)) be maximal with (Q_t\le n). By (\vartheta(x)\sim x) and (p_t\sim t\log t),
[
\log Q_t \sim t\log t,
]
so
[
t(n)=(1+o(1))\frac{\log n}{\log\log n}.
]

Also (q_t\sim t\log t\sim \log n), so all these primes are far below (n^{1/3+\varepsilon}) for any fixed (\varepsilon>0). So the obstruction lies entirely inside the small-prime regime.

That gives the key corollary.

For every function (s(n)=o(\log n/\log\log n)), there is a squarefree overlapping-carrier position on primes (\le n^{1/3+\varepsilon}) such that any Shortener method whose repair moves use at most (s(n)) blocked primes fails.

Equivalently:

[
\boxed{\text{Any full overlap-extension must allow repair order }
\Omega!\left(\frac{\log n}{\log\log n}\right).}
]

So pair-repair fails. Triple-repair fails. Any fixed-(k) repair fails. Even (o(\log n/\log\log n))-order local repair fails.

This also answers the move-count-differential idea in a precise way.

Overlap may be inefficient for Prolonger if you measure “how many primes get touched per move.” But that is the wrong resource. The simplex family shows that with only
[
t(n)\asymp \frac{\log n}{\log\log n}
]
overlapping carriers, Prolonger can force a legal circuit of order (t(n)). So overlap is cheap for Prolonger in terms of **circuit order**. A proof that only exploits “few primes per move” cannot handle this.

At the same time, this is **not** a refutation of (O(n/\log n)). In this simplex position, one high-order move (Q_t) kills the circuit immediately. So the obstruction is about the kind of move Shortener must be able to make, not about needing too many moves. The problem is order, not count.

That is the precise technique requirement I can now isolate:

A successful extension of the Resolution Theorem to overlapping carriers cannot be a finite-order local repair theory. It has to be an online **circuit-capture** theorem for the current carrier support clutter: detect large legal circuits and play a comparable high-order move before they proliferate.

So my present conclusion is:

* I do **not** have a proof that all overlaps can be resolved in (O(n/\log n)).
* I do have a rigorous obstruction showing what sort of proof cannot work.
* Theorem 5 is really the “all legal circuits have size (2)” case.
* The general overlap problem is a high-order circuit problem, and the worst-case circuit order can already be (\Theta(\log n/\log\log n)).

That, to me, is the right sharpening of the open target.

If you want, I can next turn this into a polished note with formal definitions of “legal circuit,” “circuit order,” and the simplex obstruction theorem as a standalone lemma package.
