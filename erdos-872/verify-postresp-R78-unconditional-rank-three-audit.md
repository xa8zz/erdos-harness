---
id: R78-unconditional-rank-three-adversarial-audit
type: verification
date: 2026-07-11
intent: >
  Adversarial pre-publication audit of the unconditional rank-three lower
  bound L(n) >= c_delta n(log log n)^2/log n, testing the exact-move
  accounting repair, the two selector calculations, the asymptotic
  estimates, move legality, and cross-fiber disjointness against the
  deferred-proofs appendix.
predecessors: [R75-unconditional-rank-three-paper-integration]
action:
  kind: confirms
  target: R75-unconditional-rank-three-paper-integration
claim: >
  The unconditional bound L(n) >= c_delta n(log log n)^2/log n for every
  fixed 0<delta<1/4 holds as proved: no lemma, selector case, legality
  assertion, or asymptotic estimate in the deferred-proofs appendix fails
  under adversarial audit. The finite-fiber obstruction refutes only the
  stronger auxiliary game with unscored exact-target deletion; in the
  actual game every exact-target deletion is a scored move with net bank
  change 1-lambda >= 0.
implications:
  - Four editorial fixes recommended before public posting; none repairs a logical failure. State the phase-boundary freeze explicitly; define "live target" in one sentence; record M equals the count of surviving residual tokens via large-prime separation and unique factorization; normalize K4-side-fiber vs K5-with-common-slot terminology.
  - Independent finite re-enumeration passed with no potential decrease, 1889536 activation states with 3557160 selector choices, and 33759 residual states with 71510 selector choices and 389790 direct replies.
  - Literature search found no published result stating or subsuming the bound; nearest anchors are the Hajnal-game saturation-game literature and the Erdos-Selfridge potential method. The weakest link named is the residual divisibility embedding plus phase handoff, which survives all attempted attacks.
verifiers_at_time:
  - [web-enabled adversarial audit thread, agrees]
confidence_at_time: high
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R78-unconditional-rank-three-adversarial.md
---

According to a document from July 12, 2026, **my audit verdict is that the new rank-three lower bound is sound**. I found no failing lemma, uncovered Shortener reply, illegal prescribed move, double counting, or incorrect asymptotic estimate in Appendix A. In particular, crediting an exact target played by Shortener genuinely removes the finite-fiber obstruction that killed the earlier auxiliary game.

The proof can be summarized without circularity as

[
T_{\rm act}+M\ge \frac{W_0}{8}-E,
\qquad
T_{\rm act}=o(W_0),\quad E=o(W_0),
]

so (M\gg W_0), followed by

[
\Psi_{\rm res,0}=\frac M8
\le \Psi_{\rm res,fin}=T_{\rm res}.
]

Since every unit counted by (T_{\rm res}) is an actual game move,

[
L(n)\ge T_{\rm res}\ge \frac M8
\gg_\delta \frac{n(\log\log n)^2}{\log n}.
]

That is an unconditional argument; the false safe-edge hypothesis is no longer invoked.   

## 1. The exact-target repair really does evade the finite-fiber obstruction

This is the most important point, and the repair is valid.

In the old auxiliary game, an edge of coefficient (\lambda) could simply be deleted. The bank therefore changed by

[
\Delta\Psi=-\lambda.
]

That is exactly what the finite-fiber counterexample exploits: after every possible first activation, there is an unscored deletion whose potential loss exceeds the activation gain.

In the actual divisibility game, however, “deleting the exact edge” means choosing the target integer itself. That is an actual move, so the corresponding change is

[
\Delta\Psi_{\rm res}=1-\lambda.
]

The coefficients are

[
\lambda=\frac18
]

in an unactivated fiber, and

[
\lambda\in\left{\frac14,\frac12,1\right}
]

in an activated fiber. Hence (1-\lambda\ge0) in every case. At the worst state, where (\lambda=1), the move is exactly bank-neutral, not bank-negative.

There is no hidden collateral damage: every target lies in ((n/2,n]), so two distinct exact targets cannot divide one another. Thus Shortener’s exact-target play removes precisely that target from the residual family and scores precisely one actual move. This is established in the residual divisibility embedding, not merely assumed by the potential argument.  

### Alternating exact moves and slot deletions

That does not restore the obstruction. The invariant is checked one full round at a time:

1. Prolonger’s selected target raises the bank by an amount (G).
2. A slot deletion can lower it by at most the largest post-move threat, which is at most (G).
3. An exact-target reply lowers the fractional part by at most (1), while adding (1) to (T_{\rm res}).
4. The selector is recomputed from the new state.

There is therefore no accumulated “potential debt” from alternating exact-target and slot replies.

### Phase-boundary reset

The reset to unactivated shadow fibers also does not over-credit anything. It does the opposite:

* previously captured side or common slots are deliberately forgotten;
* each surviving edge is assigned only (1/8), rather than a possible (1/4,1/2,) or (1);
* Shortener is modeled as retaining slot-deletion options that may already be illegal in the actual game.

So the reset decreases the represented protection and gives the modeled opponent additional powers. It is a conservative lower-bound reduction.

One presentation discrepancy should be fixed: the appendix’s explicit witness is described as a (K_4) **side graph over one common slot**. Calling it a “(K_5)-fiber” is reasonable only if the common slot is counted as the fifth vertex. The note and appendix should use one convention consistently. This is terminology, not a mathematical defect. 

## 2. The weighted activation selector calculations are correct

Let

[
\phi(e)=2^{|e\cap C|-3}w_e,
]

let (H) be the largest uncaptured-vertex star weight, and let (K) be the largest individual live-edge coefficient.

I independently reconstructed all three cases.

### Case A: (H\ge K), both endpoints initially uncaptured

Let (v) attain (H), and let (f=uv) be a maximum-coefficient incident edge. Write (w=w_f). Then

[
\phi(f)=\frac w8.
]

Claiming (f) replaces its coefficient (w/8) by total bank contribution (w), while every other live edge incident to (u) or (v) doubles. The exact gain is

[
G
=

H+h(u)+\frac{5w}{8}.
]

For another uncaptured vertex (z), its post-move star is at most

[
h(z)+\phi(zv)+\phi(zu)
\le
H+\phi(f)+h(u)
\le G.
]

An individual remaining edge through (v) has coefficient at most (2\phi(f)=w/4); one through (u) has coefficient at most (2h(u)\le H+h(u)); and an unaffected edge has coefficient at most (K\le H). All are at most (G).

### Case B: (H\ge K), the other endpoint already captured

Now (\phi(f)=w/4), and the exact gain is

[
G=H+\frac w2.
]

Any other uncaptured star rises by at most (\phi(f)=w/4), while a remaining edge through the newly captured endpoint has coefficient at most (w/2). Again every modeled reply costs at most (G).

### Case C: (H<K)

Any edge attaining (K) must have both endpoints already captured. Otherwise an uncaptured endpoint would have star weight at least (K), contradicting (H<K). Such an edge has coefficient (w/2), and claiming it replaces (w/2) by (w), a gain exactly equal to (K). No other coefficient changes. Every vertex deletion costs at most (H<K), and every edge deletion costs at most (K).

Thus the selector proposition is correct for arbitrary current token weights, including dynamically depleted weights. 

### Are the modeled replies exhaustive?

For a target (t=acb), the divisors are exactly

[
1,\ a,\ c,\ ac,\ b,\ ab,\ cb,\ acb.
]

The target lies above (n/2), so it has no distinct multiple on the board. The replies are therefore exhausted by:

* (a) or (c): graph vertex deletion;
* (ac): graph pair-edge deletion;
* (b): off-model large-prime deletion;
* (ab) or (cb): off-model lateral deletion;
* (acb): off-model exact-target deletion.

There is no missing composite or multiple case. The off-model classes are exactly what the budget (E) counts.  

A subtle point that is handled correctly is that the shadow capture set (C) records only endpoints captured by Prolonger. Shortener may make additional small primes unavailable by other means, but ignoring that only gives the modeled Shortener more future vertex-deletion options. It cannot make the lower bound too optimistic.

## 3. The arithmetic estimates check out

Put (Y=n^\delta), with (0<\delta<1/4), and

[
B_{a,c}
=======

\left(\frac{n}{2ac},\frac{n}{ac}\right]\cap\mathbb P.
]

For (a,c\le Y),

[
X_{a,c}:=\frac n{ac}\ge n^{1-2\delta}\longrightarrow\infty.
]

The prime number theorem, uniformly over this range, gives

[
|B_{a,c}|
\gg_\delta
\frac{n}{ac\log n}.
]

Also, every such large prime satisfies, eventually,

[
b>\frac{n}{2Y^2}>Y,
]

because (\delta<1/4). This separation is important: it ensures that (b) cannot be confused with either small prime and makes each target’s factorization into “two small primes plus one large prime” unique.

Consequently,

[
\begin{aligned}
W_0
&=\sum_{a<c}|B_{a,c}|\
&\gg_\delta
\frac n{\log n}
\sum_{\substack{a<c\a,c\le Y\a,c\ {\rm prime}}}
\frac1{ac}.
\end{aligned}
]

Mertens’ theorem for primes yields

[
\sum_{p\le Y}\frac1p
====================

# \log\log Y+O(1)

\log\log n+O_\delta(1),
]

and hence

[
\sum_{a<c}\frac1{ac}
====================

\frac12
\left[
\left(\sum_{p\le Y}\frac1p\right)^2
-----------------------------------

\sum_{p\le Y}\frac1{p^2}
\right]
=======

\left(\frac12+o(1)\right)(\log\log n)^2.
]

Therefore

[
W_0\gg_\delta
\frac{n(\log\log n)^2}{\log n}.
]

No multiplicity correction is missing because the large prime exceeds (Y), and (a<c) fixes the unordered small-prime pair. 

### Activation move count

There is at most one activation round per small-prime pair, so

[
R\le \binom{\pi(Y)}2
\ll\frac{Y^2}{\log^2Y}.
]

Each round contains one Prolonger move and at most one Shortener reply. Thus

[
T_{\rm act}\le2R
\ll\frac{Y^2}{\log^2Y}.
]

Relative to the target scale,

[
\frac{Y^2/\log^2Y}
{n(\log\log n)^2/\log n}
\ll_\delta
\frac{n^{2\delta-1}}
{\log n,(\log\log n)^2}
\longrightarrow0.
]

This only requires (2\delta<1), which is weaker than the stated restriction.

### Off-model deletion budget

A single off-model reply kills at most:

* (O(Y^2/\log^2Y)) tokens if it is a large prime (b), one for each small-prime pair;
* (O(Y/\log Y)) tokens if it is a lateral (pb);
* one token if it is an exact target.

Therefore

[
E
\ll
R\frac{Y^2}{\log^2Y}
\ll
\frac{Y^4}{\log^4Y}.
]

And

[
\frac{Y^4/\log^4Y}
{n(\log\log n)^2/\log n}
\ll_\delta
\frac{n^{4\delta-1}}
{(\log n)^3(\log\log n)^2}
\longrightarrow0
]

precisely because (\delta<1/4). This is the estimate that determines the stated range of (\delta). 

It follows correctly that

[
M\ge \frac{W_0}{8}-E-T_{\rm act}
\gg_\delta
\frac{n(\log\log n)^2}{\log n}.
]

## 4. Turn order, parity, and accounting

I found no parity or double-counting error.

### Activation versus residual score

During activation,

[
T_{\rm act}
]

counts every actual move by either player. It appears in the bank only to prove the dichotomy

[
T_{\rm act}+M\ge W_0/8-E.
]

The argument then uses the independent upper bound (T_{\rm act}=o(W_0)) to extract a large (M). Activation moves are not subsequently counted again toward (T_{\rm res}).

At the phase boundary:

* activation targets already played are absent from the residual family;
* targets killed during activation are absent;
* (\mathcal T_*) contains only targets still live after the final activation reply;
* (T_{\rm res}) starts from zero and counts only later exact-target plays from (\mathcal T_*).

Thus there is no overlap between (T_{\rm act}) and (T_{\rm res}).

Nor is (M) a set of already scored moves. It is the number of live residual target tokens placed into the initial fractional bank (M/8). At exhaustion, every such fractional term has vanished; the only remaining term is the count of actual exact-target moves.

### Final reply and phase handoff

The appendix explicitly includes Shortener’s response to the final activation move before freezing the residual family. Therefore the residual phase begins at a genuine Prolonger decision point.

If no reply exists after a Prolonger move, either the actual game has ended or the residual target set is empty. A live residual target would itself be a legal reply, so a terminal state cannot coexist with (M>0). No parity correction is needed. 

## 5. Legality is proved, and the proof is complete

This is the proof’s most delicate bridge, but it holds.

### Activation moves

A selected pair has positive current token weight. By definition, a token remains in that weight only if its corresponding target has not been made illegal by an earlier move. The selected (acb) is therefore an actual legal target when played.

Furthermore, distinct targets lie in ((n/2,n]), so Prolonger’s activation play cannot inadvertently kill another distinct target by divisibility.

### Residual moves

For a residual target (t=acb), a securing target

[
t_0=acb_0,\qquad b_0\ne b,
]

has already been played. This makes (a,c,) and (ac) unavailable. The only remaining possible harmful divisors are

[
b,\quad ab,\quad cb,
]

and the exact target (t) itself. There is no proper multiple of (t) on the board.

If the residual hyperedge is live, none of those four possibilities has been played. By construction, no other earlier move is comparable with (t). Therefore (t) is legal. This is precisely what the “Residual divisibility embedding” proposition establishes. 

The proof also correctly handles the (H=0) residual case. Then every live fiber is activated and both endpoints of every live side edge are shadow-captured. Prolonger may play any live target: its coefficient (1) is replaced by the (+1) exact-move score, leaving the bank unchanged. Its common and side slots are already unavailable as divisors of earlier Prolonger targets. 

## 6. Unique factorization and side-slot disjointness are used correctly

Suppose two side slots from distinct large-prime fibers coincide:

[
aq=a'q',
\qquad a,a'\le Y,\quad q,q'>Y,
]

with all four quantities prime as appropriate. Unique factorization forces

[
q=q'
\quad\text{and}\quad
a=a'.
]

Thus side-slot vertices from genuinely distinct (q)-fibers are disjoint.

Likewise:

* a common slot (q) cannot equal a side slot (a'q'), since the former is prime and the latter composite;
* (q\mid a'c'q') forces (q=q');
* (aq\mid a'c'q') forces (q=q') and (a\in{a',c'}).

Therefore a side-slot deletion acts exactly on the claimed star in one (q)-fiber, with no unmodeled cross-fiber loss. This disjointness is not merely cosmetic; it is what allows the residual potential to be summed fiberwise. 

## 7. Independent finite checks

I also exhaustively checked the two finite selector mechanisms.

For the activation selector, I enumerated every simple graph on five vertices with each possible edge absent or of weight (1) or (2), every captured-vertex subset, and every selector tie. This covered:

* 1,889,536 nonempty states;
* 3,557,160 permitted selector choices.

For every choice, the exact activation gain dominated every post-move vertex-star and individual-edge threat.

For the residual selector, I enumerated all simple side graphs on five vertices, all activated shadow-capture states, all permitted tie choices, and every direct side-slot or exact-target reply. This covered:

* 33,759 states;
* 71,510 selector choices;
* 389,790 direct replies.

No potential decrease was found.

These computations are checks of the finite case structure, not substitutes for the symbolic proof. The theorem itself does **not** depend on Rosero’s computation: Appendix A contains an explicit finite obstruction to the old auxiliary potential and a symbolic proof of the new selectors. For public reproducibility, however, the researcher should archive the finite-check script and the explicit obstruction certificate.

## Weakest link

The weakest link is the **Residual divisibility embedding plus phase handoff**, not the selector algebra.

One omitted divisor, one residual target already comparable with an activation move, or one cross-fiber side-slot collision would invalidate the conversion from the potential game back to the original divisibility game. I tried each of those attacks. The upper-half condition, complete divisor list, definition of the live residual subfamily, and large-prime separation close them.

I recommend four editorial changes before posting:

1. State explicitly that the residual family is frozen **after Shortener’s final activation reply**, so the next strategic turn belongs to Prolonger.
2. State in one sentence that “live target” means no previously played integer is comparable with it.
3. Record explicitly that (M=|\mathcal T_*|), using (b>Y) and unique factorization to rule out duplicate token representations.
4. Normalize “(K_4) side fiber” versus “(K_5) including the common slot.”

Those changes would make the proof harder to misread, but none repairs a logical failure.

## Relation to the literature

The underlying problem comes from Paul Erdős’s *Some of my forgotten problems in number theory*, Hardy–Ramanujan Journal 15 (1992), 34–50. ([Hardy-Ramanujan Journal][1])

The game is a number-theoretic instance of a saturation game. The graph analogue traces back to Füredi, Reimer, and Seress, *Hajnal’s Triangle-Free Game and Extremal Graph Problems*, Congressus Numerantium 82 (1991), 123–128. Modern saturation-game terminology and the general formulation for hereditary families appear in Carraher, Kinnersley, Reiniger, and West, *The Game Saturation Number of a Graph*, Journal of Graph Theory 85 (2017), 481–495. ([Douglas West's Home Page][2])

Biró, Horn, and Wildstrom’s *An upper bound on the extremal version of Hajnal’s triangle-free game*, Discrete Applied Mathematics 198 (2016), 20–28, concerns the graph analogue’s upper bound. It neither proves nor conflicts with this arithmetic rank-three lower bound. ([University of Denver][3])

The proof’s exponential weighting is conceptually related to the potential method in Erdős and Selfridge, *On a Combinatorial Game*, Journal of Combinatorial Theory, Series A 14 (1973), 298–301. The present bank is not a direct application of their theorem, however: the scored exact-target term and the activation/residual handoff are specific to this game. ([ScienceDirect][4])

Nathan McNew’s *Counting primitive subsets and other statistics of the divisor graph of ({1,\ldots,n})*, European Journal of Combinatorics 92 (2021), 103237, studies static primitive subsets and the divisor graph. It supplies relevant structural context but not this adversarial saturation-game bound. ([arXiv][5])

The current Erdős Problems page still treats the original linear-versus-sublinear question as open and identifies the problem as the number-theoretic analogue of Hajnal’s game. ([Erdős Problems][6]) A subsequent public discussion by Thomas Bloom anticipated that higher-rank hypergraph potential arguments might produce additional (\log\log n) factors, while explicitly warning that the game logic and codegrees were subtle and worth formalizing. The attached proof can reasonably be viewed as carrying out the rank-three instance of that program, rather than contradicting an existing theorem. ([Erdős Problems][7])

I found **no published paper that already states or subsumes**

[
L(n)\gg_\delta
\frac{n(\log\log n)^2}{\log n}.
]

That is necessarily a literature-search conclusion rather than a proof of absence, but the relevant saturation-game and primitive-set sources I found do not contain this result.

## Final conclusion

**The claim should be treated as an unconditional theorem.** No exact lemma, selector case, legality assertion, or asymptotic estimate in Appendix A fails under audit.

The finite-fiber obstruction remains a valid refutation of the stronger unscored auxiliary game. It does **not** refute the actual-game bank, because every exact-target deletion is an actual scored move and has net bank change (1-\lambda\ge0).

Thus, for every fixed (0<\delta<1/4),

[
\boxed{
L(n)\ge
c_\delta\frac{n(\log\log n)^2}{\log n}
}
]

for all sufficiently large (n). Taking (\delta=1/8) indeed gives an absolute constant (c>0). Since

[
\frac{(\log\log n)^2}{\log n}\to0,
]

the result remains compatible with either (L(n)=o(n)) or (L(n)=\Theta(n)), exactly as the researcher states.

[1]: https://hrj.episciences.org/125?utm_source=chatgpt.com "#125 - Some of my forgotten problems in number theory."
[2]: https://dwest.web.illinois.edu/pubs/gamesat.pdf?utm_source=chatgpt.com "The Game Saturation Number of a Graph - Douglas West"
[3]: https://cs.du.edu/~paulhorn/pap/hajnal.pdf?utm_source=chatgpt.com "An upper bound on the extremal version of Hajnal's triangle-free ..."
[4]: https://www.sciencedirect.com/science/article/pii/0097316573900058?utm_source=chatgpt.com "On a combinatorial game"
[5]: https://arxiv.org/abs/1808.04923?utm_source=chatgpt.com "Counting primitive subsets and other statistics of the divisor graph of $\\{1,2, \ldots n\\}$"
[6]: https://www.erdosproblems.com/872?utm_source=chatgpt.com "872 | Erdős Problems"
[7]: https://www.erdosproblems.com/forum/thread/872?utm_source=chatgpt.com "872 Discussion Thread"
