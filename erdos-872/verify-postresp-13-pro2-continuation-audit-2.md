# Audit #2 of Pro-2 continuation theorem (static post-hoc obstruction on case (b))

My verdict: the **circuit/maximality mechanism is basically sound**, but the **counting proof as written is not rigorous**, and the **game-theoretic conclusion is overstated**. The weakest mathematical link is the passage from the double sum to a lower bound on **distinct** (m)’s. The weakest conceptual link is the budget issue: the theorem is a valid **static** statement about a huge completed prefix, but it does **not** yet show Prolonger can realize that obstruction inside an (O(n/\log n))-scale game.

Here is the point-by-point audit.

1. Circuit-Lemma application

This part is mostly fine, but it reveals an important redundancy.

As written,
[
\mathcal E_Q
============

{2ab:\ a,b\text{ odd distinct primes},\ 2ab\le n}
;\cup;
{2qa:\ q\in Q,\ a\text{ odd prime},\ a\ne q,\ 2qa\le n}.
]
The second subfamily is completely redundant, because every (2qa) is already in the first subfamily. So (\mathcal E_Q) is actually independent of (Q). That does not break the circuit argument, but it weakens the “fiber/spoke” interpretation.

For (m=qab) with (T={q,a,b}):

* Every carrier support in (\mathcal E_Q) has the form ({2,u,v}).
* Since (2\notin T), no carrier support is a subset of (T).
* Since carrier supports have only two odd primes, (T) cannot be a subset of any carrier support.

So incomparability is airtight.

The “what if (q) appears as the (b) in a (2ab)-carrier?” concern is actually answered by the redundancy above: yes, (2qb) is in the first subfamily already.

For proper subsets of (T), the needed carriers are (2qa), (2qb), (2ab). These really are in (\mathcal E_Q), and the size bound is automatic:
[
2qa \le \frac{2qab}{b} \le \frac{2n}{3} < n,
]
since (b\ge 3), and similarly for (2qb) and (2ab). So the Circuit Lemma applies.

So on item 1, I do **not** see a fatal flaw. The only issue is that the family is broader than advertised.

2. Proper-multiples argument

This is also sound.

Because (m>n/3), any integer multiple (km) with (k\ge 3) is (>n). So the only proper multiple (\le n) is (2m=2qab).

And (2m) is divisible by (2qa), (2qb), and (2ab), any one of which is already in (\mathcal E_Q). Hence (2m) is illegal.

The boundary case (3m=n) does not occur because the interval is strict: (m\in(n/3,n]), not ([n/3,n]).

So item 2 checks out.

3. Counting (|\mathcal M_Q|)

This is where the proof, as written, has real gaps.

3a. The (q)-harmonic sum

For
[
Q={q\text{ prime}: n^\beta\le q\le n^\gamma},
]
with fixed (0<\beta<\gamma<1/2),
[
\sum_{q\in Q}\frac1q
====================

# \log\log(n^\gamma)-\log\log(n^\beta)+o(1)

\log(\gamma/\beta)+o(1).
]
So this is indeed (\asymp 1), with a positive constant for each fixed (\beta<\gamma).

But it is **not uniform** as (\gamma/\beta\to 1): the constant tends to (0).

3b. The (a)-sum

The proof writes
[
\sum_{a\le n^\delta}\frac1a \sim \log\log n.
]
That is only true if (a) runs over **primes**. Over all integers it would be (\sim \delta\log n), which is different by a factor of (\log n/\log\log n).

Context strongly suggests “(a) prime,” so this is repairable, but as written it is sloppy.

3c. The interval for (b)

With (X=n/(qa)), PNT does give
[
\pi(X)-\pi(X/3)\gg \frac{X}{\log X}\gg \frac{X}{\log n}
]
uniformly for fixed (\beta,\gamma,\delta) as long as (X\ge n^{1-\gamma-\delta}\to\infty). That part is fine.

But the proof then says:

> Since (X/3\gg n^\delta), these (b)'s are (>a).

This is **not** implied by the stated hypothesis (\delta<1-\gamma). To guarantee (X/3\gg n^\delta), you need
[
1-\gamma-\delta>\delta,
\quad\text{i.e.}\quad
\delta<\frac{1-\gamma}{2}.
]
So that step is wrong as stated.

3d. Double-counting / injectivity

This is the biggest concrete bug.

The proof claims that distinct ((q,{a,b})) yield distinct (m=qab) by unique factorization. That is false. Unique factorization identifies the **unordered set of prime factors**, not the distinguished role of (q).

Concrete counterexample at (n=10^6), (Q=[200,500]):
[
m=7\cdot 211\cdot 227=335{,}279 > 10^6/3.
]
This same (m) is counted once as
[
(q,a,b)=(211,7,227)
]
and again as
[
(q,a,b)=(227,7,211).
]

So the lower bound from the double sum does **not** directly give a lower bound on the number of distinct (m)’s.

This can likely be repaired, but it needs extra work. For example:

* If you choose (\delta<\beta), then (a\notin Q).
* If you also choose (\delta<(1-\gamma)/2), then there is at most one “small” factor, avoiding (a\leftrightarrow b) duplication.
* Then each (m) has multiplicity at most (2), coming from the possibility that both larger factors lie in (Q).

So the asymptotic lower bound probably survives after dividing by a constant. But the proof as written does **not** justify that.

So item 3: the claimed asymptotic shape is plausible, but the proof is not currently rigorous.

4. Post-hoc scope claim

Here the response overstates what has been shown.

Yes: the theorem genuinely kills a **strict post-prefix cleanup theorem** of the form

“after Prolonger finishes building an arbitrary overlapping carrier prefix, Shortener can always resolve the residual in (O(n/\log n)) more moves.”

That proof architecture is dead if this obstruction is correct.

But no: it does **not** refute the interleaved Resolution-Theorem style. The earlier disjoint/rank-(\le 3) arguments are online. Shortener spends moves while the structure is being built. This obstruction says nothing against the possibility that those online moves prevent enough of (\mathcal E_Q) from ever forming.

So the right conclusion is narrower:

* It rules out **post-hoc repair after full installation**.
* It does **not** rule out online repair/prevention.
* It also does **not** rule out non-repair global arguments (density, LP, entropy, amortized charging, etc.).

The sentence “the only remaining route to (O(n/\log n)) is genuinely online” is too strong unless you explicitly add “within this repair-after-prefix proof template.”

5. Budget / self-reference

This is the main conceptual problem.

As written, (\mathcal E_Q) is just the full family
[
{2ab:\ a,b\text{ odd distinct primes},\ 2ab\le n},
]
because the (2qa)-part is redundant.

That family already has size (\asymp n\log\log n/\log n). At (n=10^6), I count
[
|\mathcal E_Q| = 86{,}157,
]
while
[
\frac{n}{\log n}\approx 72{,}382.
]
So even the carrier prefix alone already exceeds the entire target (O(n/\log n)) scale at this (n).

That means the theorem, as stated, is **not yet a game-length contradiction**. It is a statement of the form:

“If Prolonger somehow manages to install this very large carrier family, then the residual is also very large.”

That is a valid static implication, but it does not show Prolonger can afford to do this in the regime under debate.

Your subset question is exactly the right pressure point. For a single isolated (m=qab), only the three carriers (2qa,2qb,2ab) are needed. There is heavy sharing across different (m)’s. So the real issue is:

How many carriers are needed to certify (R) distinct isolated (m)’s?

The response does not answer that.

A useful reformulation is graph-theoretic:

* each installed carrier (2uv) is an edge (uv) on odd primes;
* each isolated (m=qab) is a triangle ({q,a,b}) with one vertex in (Q).

With (M) carriers, the number of such triangles is at most (O(M^{3/2})) by the standard triangle extremal bound. So one could in principle get many isolated (m)’s from **far fewer** than (|\mathcal E_Q|) carriers. In particular, the full-family budget objection does **not** by itself kill the mechanism.

But it does mean the current theorem has not done the crucial dynamic work. The response has proved a large-prefix static obstruction, not a realizable minimax obstruction.

So item 5: your criticism is valid. The theorem is not tautological, but its game-theoretic force is incomplete.

6. Numerical sanity

I checked the two claimed (n=10^6) counts directly.

The unrestricted 4-prime cone count **does** match:

* number of odd squarefree (m=pqrs\in(10^6/3,10^6]): **25,070**.

So that number is correct.

The fiber count does **not** match under the natural reading of the theorem:

* for (Q={q\text{ prime}: 200\le q\le 500}),
* count distinct (m=qab) with (q\in Q), (a,b) odd distinct primes, (10^6/3<m\le 10^6),

I get:

* **16,346** distinct (m)’s;
* **38,616** if you count ((q,a,b)) with (q) distinguished.

I do **not** reproduce **7,209** from the stated definition. That numerical claim appears to be using some unstated extra restriction.

As for scale, at (n=10^6),
[
\frac{n\log\log n}{\log n}\approx 190{,}061.
]
So (25{,}070) and (16{,}346) are both consistent with a (\Theta(n\log\log n/\log n)) phenomenon at this size, just with modest constants. But the quoted 7,209 is not reliable unless the counting rule is clarified.

7. Literature

Because you explicitly told me not to search online, I am not going to bluff citations here.

From memory only:

* the counting side is in the orbit of classical semiprime/almost-prime counting, i.e. Landau/Mertens-type estimates;
* the primitive-set literature around Erdős and later Pollack/Barbatsoulis is conceptually adjacent on divisor-antichain structure;
* the Circuit Lemma itself feels more like a clutter/hypergraph “circuit/minimal nonface” argument than a standard named theorem from divisibility-game papers.

But I cannot responsibly claim a specific published paper that already contains this exact obstruction without checking.

Bottom line

I would grade the response like this:

* **Circuit/maximality core:** basically correct.
* **Asymptotic counting claim:** plausible, but the written proof is not rigorous.
* **Static/post-hoc obstruction claim:** essentially correct, with narrower scope than claimed.
* **Dynamic/minimax relevance:** unproved and overstated.
* **Numerical sanity:** one count checks exactly; the 7,209 count does not match the stated definition.

If I had to name the single weakest link, it is this:

**The proof does not validly pass from the double sum over ((q,a)) to a lower bound on the number of distinct isolated (m)’s, and the accompanying numerical example for the (Q=[200,500]) fiber does not reproduce.**

Right behind it is the budget issue:

**even if the static theorem is repaired, it still does not show Prolonger can install enough of the carrier graph online to force the claimed residual.**
