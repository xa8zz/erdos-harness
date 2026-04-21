The current universal Case B target is too strong as stated.

There is a new obstruction, distinct from the R50 forbidden-core star, parity cube, and relative cone:

\[
\boxed{
\text{a forbidden Johnson shell generated entirely by prior Shortener blockers.}
}
\]

It does not refute the overall blocker-duality program, but it does refute the current universal formulation

\[
\text{(no large legal separator)} \implies |\mathcal R_{\mathrm{live}}| \le \kappa(h,L)\,|\mathcal C|
\]

for arbitrary prior blocker families \(\mathcal D\).

## Construction

Let

\[
P=A\sqcup Z,\qquad |A|=L,\quad |Z|=h,\quad K=h+L.
\]

Take the already-played Prolonger complement family

\[
\mathcal C=\{A\}.
\]

Equivalently, Prolonger has played the unique rank-\(h\) packet move

\[
B=P\setminus A=Z.
\]

Let the prior Shortener blocker family be

\[
\mathcal D=\binom{A}{2}.
\]

So every 2-subset of \(A\) has already been claimed by Shortener.

## Game-legality and reachability

This state is fully game-legal.

- The members of \(\mathcal D\) are pairwise incomparable because they all have size 2.
- Each \(D\in\mathcal D\) is incomparable with \(B=Z\): \(D\not\subseteq Z\) because \(D\subseteq A\), and \(Z\not\subseteq D\) because \(|Z|=h>2\) in the central regime.

It is also reachable in the packet quotient: Prolonger can spend outside-packet turns on fresh primes while Shortener claims the \(\binom{L}{2}\) pairs in \(\binom{A}{2}\), after which Prolonger plays \(B=Z\).

## Live residual packet

A packet complement \(Y\in\binom{P}{L}\) remains live exactly when

1. \(Y\neq A\) (it has not already been played by Prolonger), and
2. \(Y\cap D\neq\varnothing\) for every \(D\in\binom{A}{2}\) (equivalently, the corresponding rank-\(h\) facet avoids every prior Shortener blocker).

Condition (2) is equivalent to \(|A\setminus Y|\le 1\): if \(Y\) misses two points of \(A\), then it misses the corresponding pair in \(\binom{A}{2}\), and conversely any \(L\)-set missing at most one point of \(A\) meets every pair of \(A\).

Since \(Y\neq A\), the live residual complements are exactly

\[
\mathcal R_{\mathrm{live}}
=
\bigl\{(A\setminus\{a\})\cup\{z\}: a\in A,\ z\in Z\bigr\}.
\]

Hence

\[
|\mathcal R_{\mathrm{live}}| = Lh.
\]

## Fully legal relative blockers

Now classify the fully legal Shortener moves \(Q\subseteq P\).

To block the played complement \(A\), we need

\[
Q\cap A\neq\varnothing.
\]

To remain incomparable with every prior blocker \(D\in\binom{A}{2}\), we must have:

- \(Q\) cannot contain two points of \(A\), or else some \(D\subseteq Q\).
- \(Q\) cannot lie entirely inside \(A\) with \(|Q|=1\), or else \(Q\subseteq D\) for some \(D\in\binom{A}{2}\).

Therefore every fully legal relative blocker has the form

\[
Q=\{a\}\cup W,
\qquad
a\in A,\ \varnothing\neq W\subseteq Z.
\]

In particular, every minimal fully legal blocker is a 2-set \(\{a,z\}\) with \(a\in A\), \(z\in Z\).

## Maximum separator capture

Fix a fully legal blocker \(Q=\{a\}\cup W\) with \(W\subseteq Z\), \(|W|=r\ge 1\).

A residual complement

\[
Y_{a',z'}=(A\setminus\{a'\})\cup\{z'\}
\]

is disjoint from \(Q\) iff:

- \(a'=a\), because otherwise \(Y_{a',z'}\) still contains \(a\in Q\cap A\);
- \(z'\notin W\).

So the captured residual family is

\[
\bigl\{(A\setminus\{a\})\cup\{z'\}: z'\in Z\setminus W\bigr\},
\]

and therefore

\[
|\{Y\in\mathcal R_{\mathrm{live}}:Y\cap Q=\varnothing\}| = h-r \le h-1.
\]

The maximum is attained by the minimal blockers \(Q=\{a,z\}\), giving

\[
\max_Q
\frac{|\{Y\in\mathcal R_{\mathrm{live}}:Y\cap Q=\varnothing\}|}{|\mathcal R_{\mathrm{live}}|}
=
\frac{h-1}{Lh}
=
\frac{1}{L}-\frac{1}{Lh}.
\]

At the central packet scale \(L\asymp h/\log h\),

\[
\max_Q \pi_{\mathrm{live}}(Y\cap Q=\varnothing)
\asymp
\frac{1}{L}
\asymp
\frac{\log h}{h}
\to 0.
\]

So this is a genuine no-large-separator regime.

## Why it kills the current universal Case B target

Here

\[
|\mathcal C|=1,
\qquad
|\mathcal R_{\mathrm{live}}|=Lh.
\]

Thus any universal Case B statement of the form

\[
|\mathcal R_{\mathrm{live}}|
\le
\kappa(h,L)\,|\mathcal C|
\]

must satisfy

\[
\kappa(h,L)\ge Lh,
\]

which is enormous in the central regime.

So the current two-outcome program

\[
\text{large separator}
\quad\vee\quad
\text{residual chargeable to Prolonger shadow } \mathcal C
\]

is false for arbitrary \((\mathcal C,\mathcal D)\).

This obstruction is qualitatively different from the R50 examples:

- In the forbidden-core star / cone, \(|\mathcal R_{\mathrm{live}}| \ll |\mathcal C|\), so charge-to-\(\mathcal C\) still works.
- In the parity cube, \(|\mathcal R_{\mathrm{live}}| = |\mathcal C|\), so again charge-to-\(\mathcal C\) is viable.
- Here, prior Shortener blockers alone carve a codimension-1 Johnson shell around one played complement, and the live residual is much larger than \(\mathcal C\) while every fully legal blocker only removes an \(O(1/L)\) fraction.

## Method-by-method implication

This new shell regime explains why the three proposed R50 methods are not yet enough in their current universal formulation.

### Variant A (weighted Kruskal-Katona / LYM)

The residual family is the first Johnson layer around \(A\):

\[
\mathcal R_{\mathrm{live}}
=
\partial^+_1(A)
\cong A\times Z.
\]

The played family \(\mathcal C\) has size 1, so no shadow inequality charging only to \(\mathcal C\) can control \(\mathcal R_{\mathrm{live}}\).

### Variant B (entropy compression)

The live family has entropy

\[
H(\mathcal R_{\mathrm{live}})=\log L + \log h.
\]

An optimal fully legal blocker removes only an \(\asymp 1/L\) fraction, so the per-move entropy decrement is only \(O(1/L)\), not a constant-order collapse. Entropy alone does not recover a charge-to-\(\mathcal C\) conclusion here.

### Variant C (LP duality)

The natural LP can hit the single played complement \(A\) fractionally at tiny cost, but that does not imply a blocker with large residual deletion. The issue is not merely integrality of the hit; it is the mismatch between hitting \(\mathcal C\) and deleting the live Johnson shell generated by \(\mathcal D\).

## Conclusion

The blocker-duality program still looks alive, but the universal two-outcome theorem from the current prompts is not the right statement.

Any viable replacement must do at least one of the following:

1. Restrict \(\mathcal D\) to blocker families actually generated by the intended Shortener strategy, rather than arbitrary prior legal blockers.
2. Add a third outcome capturing a **\(\mathcal D\)-generated shell/junta regime**.
3. Charge not just to the played Prolonger shadow \(\mathcal C\), but to a richer invariant that also records how prior Shortener blockers have concentrated the residual packet.

This obstruction is therefore evidence that the next theorem should be at least a **three-outcome** statement:

\[
\text{large separator}
\quad\vee\quad
\text{\(\mathcal C\)-saturation}
\quad\vee\quad
\text{\(\mathcal D\)-shell / low-codimension junta}.
\]
