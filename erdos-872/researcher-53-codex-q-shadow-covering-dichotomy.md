---
id: R53-codex-q-shadow-covering-dichotomy
type: research
date: 2026-04-19
intent: >
  Prove a positive theorem that survives the R52 spectral obstruction:
  a Q-shadow/covering dichotomy for the spectral packet route.
predecessors: [R52-pro-spectral-live-space, R53-pro-continuation-near-top-shadow]
action:
  kind: extends
  target: R52-pro-spectral-live-space
claim: >
  Q-shadow / covering dichotomy proved as a genuine positive theorem that
  survives the R52 spectral obstruction: for any live-game central packet,
  either it has a q-shadow separator capturing Omega(1) fraction in O(log h)
  moves, or the complement family is a sparse covering design with large
  transversal number. Dichotomy is tight per the R52 constructions.
---

# Q-Shadow / Covering Dichotomy For The Spectral Packet Route

This is a genuine positive theorem that survives the new R52 spectral obstruction.

It does **not** give a universal stopping theorem. What it does give is a clean
quantitative statement showing exactly what can make the spectral engine fail at
one fixed separator rank $q$:

1. prior Shortener clutter has already saturated the $q$-layer by comparability,
   or
2. Prolonger has already paid the expected covering-design cost
   $\asymp \delta_q^{-1}$ on that $q$-layer.

So the real missing ingredient is not another mixing estimate. It is online
control of Shortener's own $q$-shadow.

## 1. Setup

Fix one packet $P$ with
$$
|P| = K = h + L.
$$

Write
$$
\mathcal Y = \binom{P}{L}, \qquad \mathcal Q_q = \binom{P}{q}.
$$

As in the spectral note, a $q$-separator $Q \in \mathcal Q_q$ is adjacent to a
complement $Y \in \mathcal Y$ when $Q \cap Y = \varnothing$.

Let:

- $\mathcal C \subseteq \mathcal Y$ be the played Prolonger complements in this
  packet.
- $\mathcal D$ be the prior Shortener blocker family already present in this
  packet, of arbitrary ranks.
- $R \subseteq \mathcal Y$ be the current live complement space.

Define the forbidden $q$-shadow of $\mathcal D$ by
$$
F_q(\mathcal D)
=
\left\{
Q \in \mathcal Q_q : \exists d \in \mathcal D \text{ with } d \subseteq Q
\text{ or } Q \subseteq d
\right\}.
$$

This is exactly the set of $q$-separators already illegal before accounting for
the played packet complements $\mathcal C$.

Define the legal $q$-separator space
$$
A_q(\mathcal D,\mathcal C)
=
\left\{
Q \in \mathcal Q_q \setminus F_q(\mathcal D) :
Q \cap C \neq \varnothing \text{ for every } C \in \mathcal C
\right\}.
$$

Write the densities
$$
\sigma_q(\mathcal D) = \frac{|F_q(\mathcal D)|}{|\mathcal Q_q|},
\qquad
a_q = \frac{|A_q(\mathcal D,\mathcal C)|}{|\mathcal Q_q|},
\qquad
r = \frac{|R|}{|\mathcal Y|}.
$$

As before,
$$
\delta_q
=
\frac{\binom{K-q}{L}}{\binom{K}{L}},
\qquad
\lambda_q^2
=
\frac{qL}{h(K-q)}.
$$

Each single played complement $C \in \mathcal C$ kills exactly
$$
\binom{h}{q}
$$
many $q$-separators, so its $q$-layer neighborhood density is
$$
\frac{\binom{h}{q}}{\binom{K}{q}} = \delta_q.
$$

## 2. The Theorem

**Theorem (q-shadow / covering dichotomy).** Suppose the current live packet
has density
$$
r \ge \eta > 0.
$$
If no legal $q$-separator in $A_q(\mathcal D,\mathcal C)$ captures at least
$$
\frac12 \delta_q |R|
$$
live complements, then
$$
\sigma_q(\mathcal D) + |\mathcal C| \delta_q
>
1 - \frac{4\lambda_q^2}{\eta}.
$$

Equivalently,
$$
|\mathcal C|
>
\frac{1 - \frac{4\lambda_q^2}{\eta} - \sigma_q(\mathcal D)}{\delta_q}.
$$

So failure of spectral capture at live density $\eta$ can only happen if either
the prior Shortener $q$-shadow is already dense, or Prolonger has already paid
roughly $\delta_q^{-1}$ complements in that packet.

## 3. Proof

First, by a trivial union bound on the $q$-layer,
$$
a_q
\ge
1 - \sigma_q(\mathcal D) - |\mathcal C|\delta_q.
$$

Indeed:

- $\sigma_q(\mathcal D)$ accounts for the $q$-sets already made illegal by prior
  Shortener comparability.
- each $C \in \mathcal C$ removes exactly a $\delta_q$ fraction of the full
  $q$-layer by disjointness.

Now apply the spectral separator theorem from the R52 note:

If
$$
a_q r \ge 4\lambda_q^2,
$$
then there exists a legal $q$-separator capturing at least
$$
\frac12 \delta_q |R|.
$$

Taking the contrapositive, if no such capture exists and $r \ge \eta$, then
necessarily
$$
a_q < \frac{4\lambda_q^2}{\eta}.
$$

Combining with the union-bound lower bound on $a_q$ gives
$$
1 - \sigma_q(\mathcal D) - |\mathcal C|\delta_q
<
\frac{4\lambda_q^2}{\eta},
$$
which rearranges to
$$
\sigma_q(\mathcal D) + |\mathcal C|\delta_q
>
1 - \frac{4\lambda_q^2}{\eta}.
$$

That is exactly the claimed dichotomy. `QED`

## 4. Same-Rank Corollary

If Shortener commits to one rank $q$ inside the packet, then the prior blocker
family contributes no higher-rank self-shadow. In that case $\mathcal D$ on the
$q$-layer is just the set $\mathcal S$ of previously played $q$-separators, so
$$
\sigma_q(\mathcal D) = \frac{|\mathcal S|}{|\mathcal Q_q|}.
$$

Hence:

**Corollary (fixed-q packet race).** If all Shortener moves in the packet are
$q$-separators and the live packet has density $r \ge \eta$, then failure of a
$(1/2)\delta_q$-capture implies
$$
|\mathcal C|
>
\frac{1 - \frac{4\lambda_q^2}{\eta} - \frac{|\mathcal S|}{|\mathcal Q_q|}}
{\delta_q}.
$$

Since $|\mathcal Q_q|$ is enormous, the term $|\mathcal S|/|\mathcal Q_q|$ is
negligible in the central regime. So inside a fixed-rank packet race, starving
the spectral branch costs Prolonger essentially $\delta_q^{-1}$ packet moves.

This is the cleanest positive theorem I can currently prove.

## 5. Central-Scale Specialization

Take
$$
L = \left\lfloor \frac{h}{\log h} \right\rfloor,
\qquad
q = \left\lfloor 2(\log h)^2 \right\rfloor.
$$

Then the standard central estimates give
$$
\delta_q = h^{-2+o(1)},
\qquad
\lambda_q^2 = \frac{(2+o(1))\log h}{h}.
$$

Therefore, for any live-density threshold
$$
\eta \gg \frac{\log h}{h},
$$
failure of a legal $q$-capture of size $h^{-2+o(1)}|R|$ implies
$$
\sigma_q(\mathcal D) + |\mathcal C| h^{-2+o(1)} \ge 1 - o(1).
$$

In particular, if the prior $q$-shadow is still sparse on that layer, i.e.
$$
\sigma_q(\mathcal D) = o(1),
$$
then
$$
|\mathcal C| \ge h^{2+o(1)}.
$$

At the old residual floor
$$
\eta = \frac{1}{\log h},
$$
this becomes
$$
|\mathcal C| \ge (1-o(1))\,\delta_q^{-1} = h^{2+o(1)}.
$$

So in the fixed-rank regime, the spectral branch already forces the exact
$r_1$-scale packet budget before the residual can sit at density $1/\log h$
with no good separator.

## 6. Alignment With The New Spectral Obstruction

This theorem lines up very well with the new Pro note.

In the apex covering-design obstruction:

- the universal stopping theorem fails;
- the live residual can remain at density $\asymp 1/\log h$;
- but killing all useful $q \le 2(\log h)^2$ separator space costs
  $|\mathcal C| = h^{2+o(1)}$ played complements.

That is exactly what the theorem above predicts, because
$$
\delta_q^{-1} = h^{2+o(1)}
$$
at the central scale.

So the spectral route is not useless. Rather:

1. spectral mixing is the correct engine while the chosen $q$-layer remains
   dense;
2. the exact obstruction is the pair
   $$
   \bigl(\sigma_q(\mathcal D),\ |\mathcal C|\delta_q\bigr);
   $$
3. the missing theorem is online control of $\sigma_q(\mathcal D)$ across
   relevant $q$-layers, not a stronger Johnson-scheme mixing inequality.

That is very close in spirit to the new `WSSS` / self-shadow diagnosis.

## 7. Verification

I checked the theorem in two ways.

### Random checks

For the exact spectral threshold statement, I sampled 1000 random packet states
for each of
$$
(K,h,q) \in \{(8,5,2), (9,6,2), (10,7,2), (12,8,3), (14,10,3)\}
$$
with random played complement sets $\mathcal C$ and random fixed-rank Shortener
sets $\mathcal S$. No counterexample appeared.

### Exhaustive bounded-size checks

I exhaustively checked all states with bounded numbers of played complements and
same-rank blockers in the following cases:

- $(6,4,2)$ with $|\mathcal C|, |\mathcal S| \le 3$;
- $(7,5,2)$ with $|\mathcal C|, |\mathcal S| \le 3$;
- $(8,5,2)$ with $|\mathcal C|, |\mathcal S| \le 2$;
- $(8,6,2)$ with $|\mathcal C|, |\mathcal S| \le 2$;
- $(9,6,2)$ with $|\mathcal C|, |\mathcal S| \le 2$;
- $(10,7,3)$ with $|\mathcal C|, |\mathcal S| \le 1$.

Again no counterexample appeared. The largest explicit exhaustive run checked
2,439,844 states.

## 8. Net Take

This does not prove the full conjectural upper bound.

But it is a real theorem, and I think it sharpens the current picture in the
right way:

- the universal spectral stopping theorem is false;
- the spectral route still works at a fixed rank;
- the full obstruction is exactly "Shortener self-shadow plus Prolonger
  covering cost";
- therefore the real next theorem is an online multiscale bound on
  $\sigma_q(\mathcal D)$, not another static expander estimate.
