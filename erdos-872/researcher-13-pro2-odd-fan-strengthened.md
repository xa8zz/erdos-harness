---
id: R13-pro2-odd-fan-strengthened
type: verification
date: 2026-04-18
intent: >
  Pro #2 cross-verification of Pro #2's upper-half fan; strengthen to odd
  fan without factor of 2, derive explicit constant 1/8.
predecessors: [R13-pro-upper-half-fan-lower-bound]
action:
  kind: confirms
  target: R13-pro-upper-half-fan-lower-bound
claim: >
  Upper-half fan rigorous. Odd fan ab in (n/2,n] (without factor 2) cleaner
  and gives explicit constant: liminf L(n) log n / (n log log n) >= 1/8.
  Contains standalone Max-degree capture lemma for bipartite Maker-Breaker.
  Matching upper bound remains open.
siblings: [R13-pro1-upper-half-audit]
---
# Pro #2 audit of upper-half fan lower bound — strengthens to odd fan with explicit constant (2026-04-18)

**Verdict.** The upper-half fan argument is rigorous. Presents a STRENGTHENED version: the odd upper-half fan $ab \in (n/2, n]$ (without the factor of 2) is cleaner, has fewer Shortener attacks, and gives explicit constant:

$$\liminf_{n \to \infty} \frac{L(n) \log n}{n \log\log n} \ge \frac{1}{8}.$$

The original $2ab$ fan gives $1/16$ (factor-2 loss from the extra divisor in proper-divisor enumeration). Both forms rigorous; odd fan preferred.

Contains a formal **Max-degree capture lemma** (standalone Maker-Breaker result on bipartite graphs): Maker captures right vertices of max current degree; Breaker deletes one right vertex or one edge per turn; $D \le C$ and $C + X \ge |E|/2$.

Cross-family verification: independently derived the same rigorous structure as Pro #1 and both DeepThink verifications, with the additional strengthening to the odd fan. Matching upper bound remains open.

---

The online-preachability side goes Prolonger’s way. I will state it in a slightly stronger form than the earlier (2ab)-fan: the unnecessary factor (2) can be removed. The odd upper-half fan (ab\in(n/2,n]) is cleaner, has fewer Shortener attacks, and gives twice the leading constant. The original (2ab) version follows afterward with the constants halved.

All logarithms below are natural.

**Theorem.** For every fixed (\delta\in(0,1/2)),

[
L(n)\ge \left(\frac18-o(1)\right)\frac{n\log\log n}{\log n}.
]

In particular, for every fixed (\delta\in(0,1/2)), all sufficiently large (n) satisfy the explicit bound

[
L(n)\ge \frac1{16}\frac{n\log\log n}{\log n}.
]

Thus Shortener cannot keep this regime at (O(n/\log n)).

Fix

[
Y=n^\delta,\qquad
\mathcal A:={a:3\le a\le Y,\ a\text{ prime}}.
]

For (a\in\mathcal A), define

[
J_a:=\left(\frac{n}{2a},\frac na\right].
]

For (b\in J_a) prime, the target

[
t_{a,b}:=ab
]

lies in (U=(n/2,n]). Also (b>n/(2Y)=\frac12 n^{1-\delta}), so for fixed (\delta<1/2) and large (n), every such (b) is larger than every (a\in\mathcal A). Thus (a) and (b) are distinct primes.

Prolonger’s strategy has two phases.

First, the **activation phase**. A small prime (a\in\mathcal A) is called **live** if the singleton move (a) is still legal. On each Prolonger turn during this phase, if any (a\in\mathcal A) is live, Prolonger chooses the smallest live (a) and plays some legal target (ab) with (b\in J_a) prime.

Such a legal (b) always exists. Indeed, uniformly for (a\le n^\delta),

[
#{b\in J_a:b\text{ prime}}
==========================

(1+o(1))\frac{n}{2a\log(n/a)}
\gg_\delta \frac{n}{a\log n}
\ge c_\delta\frac{n^{1-\delta}}{\log n}.
]

Before the activation phase ends, there have been at most (2|\mathcal A|+O(1)) previous moves, and

[
|\mathcal A|=O_\delta!\left(\frac{n^\delta}{\log n}\right).
]

Since (\delta<1/2),

[
\frac{n^{1-\delta}}{\log n}\gg \frac{n^\delta}{\log n}.
]

Now fix a live (a). Since (a) is live, no previous move is divisible by (a). A previous move (s) can be comparable with (ab\in(n/2,n]) only if (s\mid ab) or (ab\mid s). Since (ab>n/2), the second case forces (s=ab), which is impossible because then (a) would already be illegal. In the first case, the only nontrivial divisors of (ab) are (a), (b), and (ab). The divisor (a) is impossible because (a) is live, and (ab) is again impossible. Thus each previous move can forbid at most one choice of (b), namely (s=b). There are many more candidate (b)’s than previous moves, so Prolonger can always activate the chosen (a).

Let (\mathcal A_0\subseteq\mathcal A) be the set of small primes that become illegal through a proper multiple, not by being played as the singleton (a). Every Prolonger activation puts its chosen (a) into (\mathcal A_0).

We need the harmonic mass of (\mathcal A_0). Let (D\subseteq\mathcal A) be the set of small primes that Shortener kills by playing the singleton (a). At the end of activation, every (a\in\mathcal A) is either in (\mathcal A_0) or in (D).

Pair every Shortener singleton kill (a'\in D) with the immediately preceding Prolonger activation. Suppose that preceding activation chose (a). Since Prolonger always chose the smallest live prime, and since (a') was still live before Shortener played it, we have

[
a\le a'.
]

The paired Prolonger activations are distinct, so

[
\sum_{a'\in D}\frac1{a'}
\le
\sum_{\text{paired activations }a}\frac1a
\le
\sum_{a\in\mathcal A_0}\frac1a.
]

Therefore

[
\sum_{a\in\mathcal A_0}\frac1a
\ge
\frac12\sum_{a\in\mathcal A}\frac1a.
]

By Mertens,

[
\sum_{a\in\mathcal A}\frac1a
============================

# \log\log Y+O(1)

\log\log n+O_\delta(1),
]

so

[
\sum_{a\in\mathcal A_0}\frac1a
\ge
\left(\frac12-o(1)\right)\log\log n.
]

Now consider the fan graph after activation. Its left vertices are (\mathcal A_0), its right vertices are primes (b), and its edges are

[
(a,b)\quad\Longleftrightarrow\quad b\in J_a.
]

Each edge corresponds to the target (ab\in(n/2,n]).

The raw number of fan edges is

[
E^*
===

\sum_{a\in\mathcal A_0}#{b\in J_a:b\text{ prime}}.
]

Uniformly for (a\le n^\delta),

[
#{b\in J_a:b\text{ prime}}
==========================

(1+o(1))\frac{n}{2a\log(n/a)}.
]

Since

[
\frac1{\log(n/a)}
=================

\frac1{\log n}
+
O_\delta!\left(\frac{\log a}{(\log n)^2}\right),
]

and

[
\sum_{a\le n^\delta}\frac{\log a}{a}=O_\delta(\log n),
]

we get

[
E^*
===

\left(\frac12+o(1)\right)
\frac n{\log n}
\sum_{a\in\mathcal A_0}\frac1a.
]

Hence

[
E^*
\ge
\left(\frac14-o(1)\right)
\frac{n\log\log n}{\log n}.
]

Let (E_0) be the number of these fan edges whose targets (ab) are still legal at the end of activation. We claim

[
E_0=E^*-o!\left(\frac{n\log\log n}{\log n}\right).
]

Indeed, the only multi-edge activation damage comes from Shortener playing a right prime (b). Such a move deletes all fan edges incident to (b). For any fixed (b), its degree is at most

[
\Delta_R\le |\mathcal A|=O_\delta!\left(\frac{n^\delta}{\log n}\right).
]

There are only (O_\delta(n^\delta/\log n)) Shortener moves during activation, so right-prime damage is at most

[
O_\delta!\left(\frac{n^{2\delta}}{(\log n)^2}\right)
====================================================

o!\left(\frac n{\log n}\right),
]

because (\delta<1/2). All other activation moves damage at most one fan edge: for (ab\in(n/2,n]), any comparable move must be one of (a), (b), or (ab); the left-prime case (a) removes (a) from (\mathcal A_0), the right-prime case was just handled, and (ab) is a single edge. Prolonger’s activation moves themselves also occupy only (O_\delta(n^\delta/\log n)=o(n/\log n)) fan edges.

Therefore

[
E_0
\ge
\left(\frac14-o(1)\right)
\frac{n\log\log n}{\log n}.
]

It remains to show that, starting from any such fan graph with (E_0) live targets and all left primes (a\in\mathcal A_0) already illegal, Prolonger can force at least (E_0/2) further moves.

Here is the precise Maker-Breaker lemma.

**Max-degree capture lemma.** Let (G=(L\sqcup R,E)) be a finite bipartite graph. A round consists of Maker choosing a right vertex (r\in R) of maximum current positive degree and “capturing” all currently live edges incident to (r). Then Breaker may either delete all currently live edges incident to one right vertex, or delete at most one live edge, or do nothing. Let

[
C=\text{total number of edges captured by Maker},
]

[
D=\text{total number of edges deleted by Breaker through right-vertex deletions},
]

[
X=\text{total number of edges deleted individually by Breaker}.
]

Then

[
D\le C,
]

and, if the process continues until no live edge remains,

[
C+X\ge \frac{|E|}{2}.
]

Proof: In a given round, Maker captures a right vertex (r) of maximum current degree (c). If Breaker then deletes a right vertex (r'), its current degree (d) is at most (c), because (r) had maximum degree before Maker’s move and removing (r)’s incident edges does not increase any other right degree. Thus each right-vertex deletion by Breaker can be charged to the immediately preceding Maker capture, with charge at most the captured degree. Summing over all rounds gives (D\le C).

Every original edge is eventually either captured by Maker, deleted through a right-vertex deletion, or deleted individually. Hence

[
|E|=C+D+X\le 2C+X.
]

Therefore

[
C+X\ge \frac{|E|}{2}.
]

Now apply this lemma to the live fan graph after activation.

In the game, Prolonger captures a right vertex (b) by playing one live target (ab) incident to (b), choosing (b) of maximum current live degree. This move is legal because the edge is live. Once Prolonger has played one such (ab), the prime (b) becomes illegal forever.

Shortener’s destructive options are exactly those allowed in the lemma. For a live fan target (ab\in(n/2,n]), any comparable move (s) must satisfy (s\mid ab) or (ab\mid s). Since (ab>n/2), the latter forces (s=ab). The proper divisors are only (a) and (b). But (a) is already illegal for every (a\in\mathcal A_0). Thus Shortener can either play the right prime (b), deleting all current edges incident to (b), or play the target (ab) itself, deleting one edge. No move with larger support, such as (a_1a_2b), (ab_1b_2), (2ab), or (a_1a_2b_1b_2), can be comparable with (ab): it cannot divide (ab), and if it is a proper multiple of (ab), then it exceeds (n).

Finally, each edge captured by Prolonger forces one eventual move. Suppose edge (ab) is captured when Prolonger plays some target (a_0b). At that moment (ab) is legal, (a) is already illegal from activation, and (b) is now illegal because (b\mid a_0b). Since (ab>n/2), the only possible later comparable move is (ab) itself. If (ab) is never played, it remains legal forever, contradicting terminal maximality. Distinct captured edges require distinct moves.

Therefore the capture phase and subsequent forced cleanup contribute at least

[
\frac{E_0}{2}
\ge
\left(\frac18-o(1)\right)
\frac{n\log\log n}{\log n}
]

moves. This proves the theorem.

For the original (2ab)-fan, the same proof gives the following slightly weaker but fully parallel statement. Use

[
I_a=\left(\frac{n}{4a},\frac{n}{2a}\right],
\qquad t_{a,b}=2ab\in(n/2,n].
]

After Prolonger’s first move, the divisor (2) is illegal forever. A move comparable with (2ab) is then one of

[
a,\quad 2a,\quad b,\quad 2b,\quad ab,\quad 2ab.
]

The moves (a,2a) are left-prime kills; (b,2b) are right-vertex kills; (ab) and (2ab) kill only one target. Any move with larger support would have to be a proper multiple of (2ab>n/2), hence would exceed (n), or else would fail to divide (2ab). The interval (I_a) has half as many primes as (J_a), so the leading constant becomes

[
\frac1{16}
]

instead of (\frac18). Thus the earlier (2ab) argument is valid with, for example, the explicit safe bound

[
L(n)\ge \frac1{32}\frac{n\log\log n}{\log n}
]

for all sufficiently large (n).

The optimized lower-bound constant from the cleaner odd fan is therefore

[
\boxed{\frac18}
]

in the sense that

[
\liminf_{n\to\infty}
\frac{L(n)\log n}{n\log\log n}
\ge \frac18.
]

There is no nontrivial optimization over (\delta) at the leading-order level: every fixed (\delta\in(0,1/2)) gives the same leading constant. The parameter (\delta) only affects lower-order terms and the threshold beyond which the asymptotic estimates dominate.

The matching upper bound

[
L(n)=O!\left(\frac{n\log\log n}{\log n}\right)
]

is still not supplied by this argument. The lower bound rules out (L(n)=\Theta(n/\log n)), but a full (\Theta(n\log\log n/\log n)) theorem still needs a Shortener strategy that caps all Prolonger behavior at this scale. The natural shape would be an amortized prime-sieve or weighted capture strategy, but the brief’s ruled-out one-step cover and multiplicative-decay lemmas show that such an upper bound cannot be a naive local-greedy argument.
