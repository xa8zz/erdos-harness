# Fresh Pro thread — rigorous second-order lower bound $\Omega(n(\log\log n)^2/\log n)$ (2026-04-18)

Three-prime upper-half fan $acb \in (n/2, n]$ with $a < c \le n^\delta$ primes ($\delta < 1/4$), $b \in J_{a,c} = (n/(2ac), n/(ac)]$ large prime. Raw target count $\gg n(\log\log n)^2/\log n$ via double Mertens. Two-lemma proof: (1) weighted pair-graph capture on $\mathcal{A}$ via potential argument giving Prolonger $1/8$ of weighted pair mass; (2) two-layer fiber capture giving $1/8$ of remaining targets forced via layered potential $\phi(acb)$ varying with how many of $\{b, ab, cb\}$ are captured. Key insight refuting rank-4 collapse: lateral divisor $ab$ is killed (becomes illegal) once Prolonger plays any target $acb$, so lateral moves must attack BEFORE being auto-shielded. 2-vs-1 protection economy sustains second-order fan.

Rules out $L(n) = \Theta(n\log\log n/\log n)$ as sharp rate. Matches Pro-follow-up #1 (triangle-rich obstruction), Pro-follow-up #2 (triple-fan + star example), DeepThink-follow-up #4 (hierarchical rank ladder).

---

I think the proposed matching upper bound is false. The upper-half fan can be iterated one more level, and the lateral-divisor “rank-4 collapse” does **not** stop it; it only introduces a second capture layer. The resulting lower bound is

[
L(n)\ \ge\ c_\delta,\frac{n(\log\log n)^2}{\log n}
]

for every fixed (0<\delta<1/4), with some (c_\delta>0). In particular,

[
L(n)\ne O!\left(\frac{n\log\log n}{\log n}\right).
]

So the answer to the concrete primary question is **no**.

Here is the argument.

Consider odd targets of the form

[
t_{a,c,b}=acb\in(n/2,n],
]

where (a,c) are small odd primes and (b) is a large prime. Let

[
Y=n^\delta,\qquad 0<\delta<1/4,\qquad
\mathcal A={a\le Y: a\text{ odd prime}}.
]

For (a<c\in\mathcal A), define

[
J_{a,c}=\left(\frac{n}{2ac},\frac{n}{ac}\right],
]

and let the target family be

[
\mathcal T={acb:\ a<c\in\mathcal A,\ b\in J_{a,c}\cap\mathbb P}.
]

Every target lies in the upper half, so targets have no proper multiple (\le n). Since (\delta<1/4<1/3), we also have (b\gg n^{1-2\delta}>Y), so (a,c,b) are distinct.

The raw count is

[
|\mathcal T|
============

\sum_{a<c\le Y}\left(\pi!\left(\frac{n}{ac}\right)-\pi!\left(\frac{n}{2ac}\right)\right)
\gg_\delta
\frac{n}{\log n}\sum_{a<c\le Y}\frac1{ac}.
]

By Mertens,

[
\sum_{a\le Y}\frac1a=(\delta+o(1))\log\log n,
]

so

[
|\mathcal T|\gg_\delta \frac{n(\log\log n)^2}{\log n}.
]

The only real issue is whether Shortener can batch-destroy these targets. The answer is: not enough.

For a target (acb), the proper divisors relevant to Shortener are

[
a,\quad c,\quad ac,\quad b,\quad ab,\quad cb.
]

The one-level fan lower bound handled (a) and (b). Here there are two small left vertices (a,c), a small pair (ac), a large right prime (b), and two lateral divisors (ab,cb). The crucial point is that a Shortener move kills a target family only when she plays the exact common divisor. Playing a multiple of a divisor usually helps Prolonger, because it makes that divisor unavailable without necessarily being comparable with the target.

For example, playing (abd) with (d\ne c) does not divide (acb) and is not divided by (acb). It may make (ab) illegal, but that is a capture for Prolonger, not a kill.

The proof uses two small capture lemmas.

**Lemma 1: weighted graph capture.**
Let (G) be a finite weighted graph. In one round, Maker selects an undeleted edge (uv); this captures (u), captures (v), and claims the edge (uv). Breaker may delete one uncaptured vertex or delete one unclaimed edge. Then Maker can claim edge-weight at least (1/8) of the initial total edge-weight.

Proof sketch. Give each unclaimed edge (e=uv) potential

[
\phi(e)=
\begin{cases}
\frac18 w(e),&0\text{ endpoints captured},\
\frac14 w(e),&1\text{ endpoint captured},\
\frac12 w(e),&2\text{ endpoints captured},
\end{cases}
]

and give a claimed edge potential (w(e)). Initially the potential is total weight divided by (8). Finally, all remaining potential is claimed weight.

If Breaker deletes an uncaptured vertex (v), the potential loss is the sum of current potentials of unclaimed edges incident to (v). If Maker captures (v) by selecting some incident edge, every such incident edge doubles its coefficient, so Maker gains at least exactly that amount, plus the gain from claiming the selected edge.

If Breaker deletes an unclaimed edge (e), its current potential is at most (w(e)/2), while Maker can claim an edge of maximum available deletion-potential and gain at least the same amount. Thus Maker chooses a move of maximum possible potential gain each round, and the potential never decreases.

Apply this lemma to the small-prime graph on (\mathcal A), with edge weight

[
w(a,c)=|J_{a,c}\cap\mathbb P|.
]

When Prolonger selects the edge (ac), he plays one fresh upper-half target (acb_0) with (b_0\in J_{a,c}). That makes (a,c,ac) unavailable to Shortener for the future. Exact Shortener moves (a), (c), or (ac) correspond to deleting vertices or the edge. Multiples of these divisors are not harmful; they only make those divisors unavailable.

The availability of a fresh (b_0) is harmless: the number of activation moves is (O(|\mathcal A|^2)=O(Y^2/\log^2Y)), while for every (a,c\le Y),

[
|J_{a,c}\cap\mathbb P|\gg_\delta \frac{n}{ac\log n}\ge \frac{n^{1-2\delta}}{\log n},
]

and (1-2\delta>2\delta) because (\delta<1/4).

Thus Prolonger can secure small pairs ((a,c)) carrying total remaining target weight

[
\gg_\delta \frac{n(\log\log n)^2}{\log n}.
]

External damage during this activation stage is negligible. A Shortener move equal to a large prime (b) kills at most (O(Y^2/\log^2Y)) targets; a lateral move (ab) kills at most (O(Y/\log Y)); an exact target kills one. Across (O(Y^2/\log^2Y)) activation rounds, this is

[
O!\left(\frac{Y^4}{\log^4Y}\right)=o!\left(\frac{n(\log\log n)^2}{\log n}\right)
]

because (4\delta<1).

Now restrict to the secured pairs ((a,c)), and consider the surviving targets (acb).

**Lemma 2: two-layer target capture.**
Suppose the small divisors (a,c,ac) have already been made unavailable for every remaining target (acb). Then in the target game where Shortener can kill by exact moves (b), (ab), (cb), or (acb), Prolonger can force at least (1/8) of the remaining targets to appear eventually.

The potential proof is the same layered idea. For a target (acb):

[
\phi(acb)=
\begin{cases}
\frac18,& b\text{ is still open},\
\frac14,& b\text{ captured, neither }ab\text{ nor }cb\text{ captured},\
\frac12,& b\text{ captured, exactly one of }ab,cb\text{ captured},\
1,& b,ab,cb\text{ all captured}.
\end{cases}
]

A target with value (1) is forced: all its proper divisors are unavailable, and it has no proper multiple (\le n).

If Shortener deletes an open (b), the loss is the sum of (1/8) over its fiber. Prolonger can capture a maximum-potential (b)-fiber by playing one target using that (b), which raises every edge in the fiber from (1/8) to at least (1/4), gaining at least the same amount.

If Shortener deletes a lateral divisor (ab) in a captured (b)-fiber, the loss is the sum of current potentials of incident targets. Prolonger can capture a maximum-potential lateral by playing an incident target, doubling those coefficients, again gaining at least the same amount.

If Shortener plays the exact target (acb), that move itself counts toward the final length, so it can be charged as a forced target move.

Therefore the potential never decreases. Initially it is one eighth of the surviving target count; finally it is bounded above by the number of forced target moves. So at least one eighth survive as forced moves.

Combining the two (1/8) capture losses and the raw count gives

[
L(n)
\ge
c_\delta,\frac{n(\log\log n)^2}{\log n}
]

for some (c_\delta>0). The constant is not optimized; taking any fixed (\delta<1/4) suffices.

The conceptual failure in the proposed rank-4 collapse is this: the lateral divisor (ab) is indeed a powerful Shortener move **if it is still legal**, but Prolonger can capture (ab) by playing a single target (acb). After that, Shortener must attack through the opposite lateral (cb), one leaf at a time. The lateral move lowers the dimension of the fan; it does not collapse the whole fan.

So the updated rigorous picture should include

[
L(n)=\Omega!\left(\frac{n(\log\log n)^2}{\log n}\right),
]

which rules out the proposed sharp rate

[
\Theta!\left(\frac{n\log\log n}{\log n}\right).
]

I would now regard the natural next question as whether this fan hierarchy can be iterated further, rather than whether the one-loglog upper bound exists.
