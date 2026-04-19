# Round 22 Pro — dyadic-fiber positive-density theorem is equivalent to the linear conjecture

## Context

One of the three Round-22 Pro dispatches (contrarian framing: "assume $L(n) = \Theta(n)$, find the mechanism") pursued a dyadic-fiber positive-density theorem as a candidate route to prove $L(n) = \Omega(n)$. Pro's continuation of that attempt exposed a structural collapse: the positive-density dyadic theorem is not an independent auxiliary lemma — in its single-fiber form it is equivalent in strength to the original linear conjecture, rescaled. Pro retracted the earlier framing and isolated the exact point where the proof attempt fails.

## Pro's response

I pushed the dyadic-fiber route further, and the obstruction is sharper than I first stated: the desired positive-density fiber theorem is not a new auxiliary lemma. In its single-fiber form it is essentially the original linear lower-bound problem, rescaled.

So I should retract the earlier framing as if this were a clean independent route. A valid proof of the dyadic-core/fiber theorem would indeed solve (L(n)=\Omega(n)), but only because it already contains the hard part.

Here is the structural reduction.

Fix a large prime (b>\sqrt n), and put
[
K=\left\lfloor \frac nb\right\rfloor .
]
Consider only targets in the single fiber
[
\mathcal T_b={bc:K/2<c\le K}.
]
For this fiber, the relevant lateral Shortener moves are
[
bd,\qquad 2\le d\le K/2.
]
Divisibility inside the fiber is exactly divisibility at scale (K):
[
bd_1\mid bd_2 \quad\Longleftrightarrow\quad d_1\mid d_2,
]
and
[
bd\mid bc \quad\Longleftrightarrow\quad d\mid c.
]
Also, because (b>\sqrt n), if (b'\ne b) is another large prime in the dyadic construction, then a lateral move (bd) is incomparable with every target (b'c'). Indeed (b\nmid c'), since (c'<n/b'<\sqrt n<b).

Therefore the lateral-only game inside one (b)-fiber is an exact scaled copy of the original divisibility-antichain game on ({2,\dots,K}), with Prolonger restricted to upper-half moves (c\in(K/2,K]). A positive-density theorem saying that Prolonger can capture
[
\eta |\mathcal T_b|\asymp \eta K
]
inside one fiber would immediately imply
[
L(K)\ge \eta'K
]
for the original game at scale (K).

That is already the linear conjecture.

The same obstruction survives in the multi-fiber board. Suppose the dyadic board uses primes
[
b\in(n^\beta,n^\gamma),\qquad \beta>1/2,
]
with fiber sizes (K_b=\lfloor n/b\rfloor). Shortener can ignore all pure divisor moves and all cross-fiber structure, and instead run an independent optimal lateral strategy in each fiber. When Prolonger plays in fiber (b), Shortener responds with the corresponding scaled move (bd) prescribed by the optimal Shortener strategy for the game at scale (K_b).

Because different large-prime fibers are lateral-incomparable, these component strategies do not interfere. Thus the value of the dyadic fiber game is bounded above by
[
\sum_{b\in(n^\beta,n^\gamma)} L_{\mathrm{upper}}(K_b),
]
where (L_{\mathrm{upper}}(K)) is the value of the original game at scale (K) with Prolonger restricted to upper-half targets. In particular,
[
L_{\mathrm{upper}}(K)\le L(K).
]

So a positive-density dyadic theorem of the form
[
\text{value}(\mathcal T)\ge \eta|\mathcal T|
]
would force
[
\sum_b L_{\mathrm{upper}}(K_b)
\ge
\eta\sum_b K_b.
]
Equivalently, it would force a positive weighted average of
[
\frac{L_{\mathrm{upper}}(K_b)}{K_b}.
]
That is not a consequence of the fan machinery; it is the missing linear lower bound, appearing inside the fibers.

This also identifies the exact point where the attempted proof breaks. The pure divisor coordinates (d) are shared across all fibers, so they look promising: one Prolonger play (bc) shields every pure divisor (d\mid c) globally. But Shortener does not need pure coordinates to defeat the theorem. Shortener can use only the lateral coordinates (bd), which are private to each fiber and reproduce the original game at scale (K_b). Thus cross-fiber pure shielding cannot by itself prove positive density.

The correct conclusion is:

[
\boxed{
\text{A positive-density dyadic-core/fiber theorem is equivalent in strength to proving }L(n)=\Omega(n).
}
]

It is not ruled out, but it is not a lower-bound “machinery” that bypasses the known obstructions. To prove it one must prove a genuinely new single-fiber theorem:

[
\boxed{
\exists \eta>0\text{ such that Prolonger can force }\eta K
\text{ moves in the upper-half divisibility game on }[2,K].
}
]

That is just the original problem at scale (K). So I cannot honestly present the dyadic theorem as proven: the continuation exposes it as a restatement of the central conjecture, not an independent route to it.
