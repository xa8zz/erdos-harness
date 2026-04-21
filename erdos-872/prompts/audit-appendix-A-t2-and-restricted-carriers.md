This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

## Task

Below is an appendix from a mathematics paper containing two independent
bodies of content:

1. **A conditional lower bound proof for the main game** at scale
$n (\log\log n)^2 / \log n$. The proof is conditional on a safe-edge
hypothesis about reachable states in a specific finite capture game; the
general version of that hypothesis has been refuted, so the appendix
includes the refutation as its own proposition and explicitly narrows the
hypothesis to Prolonger-reachable states.

2. **Two propositions on restricted carrier classes** — positive results
showing that Shortener forces $L(n) = O(n/\log n)$ when Prolonger plays
targets with specific multiplicative structure (disjoint small-prime
carriers or squarefree rank-3 carriers).

Audit each body of content at referee standard. Adversarial stance:
these sections were the last to get a theorem-proof-level rewrite and
have not been audited as a whole since that rewrite.

## Specific checks — T2 conditional lower bound

**1. Max-gain domination counterexample.** The appendix opens with a
finite rank-3 capture game state refuting the "max-gain move dominates
every Breaker reply" wrapper (9 captured vertices $z_{ij}$, uncaptured
$u_1, u_2, u_3, v$, unique max-gain live edge $f = \{u_1, u_2, u_3\}$
with $w(f) = 9$, plus $e_{ij} = \{v, u_i, z_{ij}\}$ with $w(e_{ij}) = 4$).
Verify:

(a) The potential function is stated consistently throughout:
$Q = 8S + \sum_{\text{live}} 2^{|e \cap C|} w(e)$.

(b) The computed $\Delta(f) = 135$ and $\Delta(e_{ij}) = 129$ are
arithmetically correct, making $f$ the unique max-gain move.

(c) Breaker's reply (deleting $v$) reduces $Q$ by $9 \cdot 16 = 144 >
135$, so $Q$ strictly decreases.

(d) There is no subtle loophole: after Maker plays $f$, all nine $e_{ij}$
remain live, and their $\Phi$-value is correctly $2^3 \cdot 4 = 32$... WAIT.
The paper claims $\Phi(e_{ij})$ jumps from $8$ to $16$ after Maker plays
$f$, which would be $2^{|e_{ij} \cap C|} \cdot 4 = 2^2 \cdot 4 = 16$ when
two of $u_i$ and $z_{ij}$ are captured. But actually $f$ captures only
$u_1, u_2, u_3$ (not $v$ and not any $z_{ij}$), so the count
$|e_{ij} \cap C|$ after Maker's move is $|\{u_i\}| = 1$ (captured) plus
the $z_{ij}$ already in $C$, total $2$. So $\Phi(e_{ij}) = 2^2 \cdot 4 = 16$.
That matches. Good. Now compute Breaker's loss: each $e_{ij}$ with $v$
deleted has $\Phi$ computed on... hmm, $e_{ij}$ deleted from the live set,
so its $\Phi$ contribution drops from $16$ to $0$, a loss of $16$ per edge,
summing to $9 \cdot 16 = 144$. This matches. Confirm the book-keeping.

**2. K_4 fiber arithmetic refutation.** The appendix then gives an
arithmetic refutation: pick four small primes $\{13, 17, 19, 23\}$ with
pairwise products in $(221, 437)$, and a common prime $q$ with
$n/442 < q \le n/437$, giving six edges $e_{a,c} = \{q, aq, cq\}$ forming
a $K_4$ over $q$. Verify:

(a) For every pair $\{a, c\} \subset \{13, 17, 19, 23\}$, $q \in B_{a,c}$
(i.e., $q$ prime in $(n/(2ac), n/(ac)]$): since $ac \ge 221$, $n/(2ac)
\le n/442$, and since $ac \le 437$, $n/(ac) \ge n/437$. So $n/442 < q \le
n/437$ implies $n/(2ac) < q \le n/(ac)$ for every pair. Confirm the
arithmetic.

(b) The prime $q > Y = n^\delta$ for $\delta < 1/4$: we need $q \ge n/437$
and $Y = n^\delta < n^{1/4}$. For large $n$, $n/437 > n^{1/4}$ iff
$n^{3/4} > 437$, i.e., $n > 437^{4/3} \approx 3600$. Confirm.

(c) Reachability: Maker plays the alternate-scoring move on every OTHER
live edge not in the $K_4$ fiber, which doesn't add slots to $C$. Breaker
responds by deleting outside slots. This is claimed to leave exactly the
six fiber edges live with $C = \emptyset$. Check that this strategy
actually reaches such a state — i.e., that Maker's alternate-scoring move
is always legal when the target outside the fiber is live, and that
Breaker can always find an outside slot to delete without touching the
fiber.

(d) The two-round play: verify $Q$ decreases by $8$ after the final round
as claimed.

**3. Conditional finite scaled capture proposition.** The appendix states
the conditional bound
\[
  S_{\text{fin}} \ge \frac{1}{8} \sum_e w(e)
\]
under the safe-edge hypothesis. Verify:

(a) The proof uses $Q = 8S + \sum_{\text{live}} 2^{|e \cap C|} w(e)$
correctly, and the initial-to-terminal transfer $8 S_{\text{fin}} =
Q_{\text{fin}} \ge Q_0 = \sum_e w(e)$ is correctly derived.

(b) The scored hypergraph variant handles the Breaker score-edge reply
correctly: the claim is that scoring one live $e$ changes $Q$ by
$8 w(e) - 2^{|e \cap C|} w(e) \ge 0$ for rank $\le 3$.

**4. Initial target mass.** The appendix claims
\[
  W_0 = \sum_{a < c \in \mathcal P_Y} |B_{a,c}| \gg_\delta
  \frac{n (\log\log n)^2}{\log n}.
\]
Verify:

(a) $|B_{a,c}| \gg \kappa_\delta n / (ac \log n)$ uniformly on the PNT
range $n/(ac) \ge n^{1-2\delta}$.

(b) Mertens gives $\sum_{p \le Y} 1/p = \log\log Y + O(1) = \log\log n +
O_\delta(1)$.

(c) $\sum_{a < c \in \mathcal P_Y} 1/(ac) = \frac{1}{2}[(\sum 1/p)^2 -
\sum 1/p^2] = (1/2 + o(1)) (\log\log n)^2$. Confirm.

**5. Residual divisibility embedding.** The appendix claims that given
subfamily $\mathcal T^* \subseteq \mathcal T$ with $a, c, ac$ unavailable
for each $t = acb \in \mathcal T^*$, the residual game is at least as
favorable as a rank-3 scored hypergraph on $\{e_t = \{b, ab, cb\}\}$.
Verify:

(a) The proper divisors of $t = acb$ in $\{2, \ldots, n\}$ are exactly
$\{a, c, ac, b, ab, cb\}$; with $a, c, ac$ unavailable, only $b, ab, cb,
t$ can kill $t$.

(b) Distinct targets $t, u$ in $\mathcal T^*$ are incomparable: since
$t, u > n/2$, the only possible relation is $t = u$, by the $t \mid u$
implying $u \ge 2t > n$ argument.

(c) Slot incidence: $b \in e_t \cap e_{t'}$ iff $b = b'$. $ab \in
e_{t'}$ iff (by factorization) $b' = b$ and one of $a', c'$ equals $a$.

**6. Activation-stage potential Q_end ≥ W_0/8 - E.** Verify the
token-counting argument: during activation, each off-model Shortener
move (one not modeled as a graph vertex or edge deletion) deletes at
most one live token, so reduces $Q_t$ by at most $1$, hence by at most
$E$ total.

**7. Activation deletion budget.** The appendix claims
\[
  E \ll Y^4 / \log^4 Y = o(n (\log\log n)^2 / \log n).
\]
Verify:

(a) At most $R \ll Y^2 / \log^2 Y$ activation rounds.

(b) Each off-model Shortener move deletes at most $O(Y^2/\log^2 Y)$
tokens (the worst case: Shortener plays a large prime $b$, killing at
most one target per pair $(a, c)$).

(c) Product $E \ll R \cdot Y^2/\log^2 Y \ll Y^4/\log^4 Y$.

(d) For $\delta < 1/4$, $Y^4/\log^4 Y = o(n (\log\log n)^2/\log n)$:
indeed $Y^4 = n^{4\delta}$ and $4\delta < 1$, so $n^{4\delta}/n \to 0$.

**8. Residual mass on secured pairs.** Verify $M = \sum_{e \text{ secured}}
w_{\text{end}}(e) \gg_\delta n (\log\log n)^2 / \log n$, following from
$Q_{\text{end}} \ge W_0/8 - E$, $S_{\text{end}} = o(\cdot)$, $W_0$ lower
bound, and $E$ upper bound.

**9. Conditional T2 final proposition.** Verify the residual-stage
application of the conditional finite scaled capture to the slot
hypergraph with total edge weight $M$, giving scored residual weight $\ge
M/8$, which converts (via the comparison proposition) to at least this
many actual moves.

## Specific checks — Restricted carrier propositions

**10. Disjoint small-prime carrier class.** State the proposition: for
Prolonger restricted to targets $ab$ with $a, b$ primes in disjoint
ranges, Shortener forces $L(n) = O_\alpha(n / \log n)$. Verify:

(a) The range-separation hypothesis is stated precisely.

(b) Shortener's strategy is given explicitly and proved legal.

(c) The counting gives the claimed bound.

**11. Squarefree rank-3 carrier class.** State the proposition: for
Prolonger restricted to targets with exactly three distinct prime
factors, Shortener forces $L(n) = O_\alpha(n / \log n)$. Verify:

(a) The casework handles all legality regimes (e.g., the "phase-2 repair
move $p^{e(p)+1}$ in range" issue that an earlier audit flagged).

(b) The prior auditor specifically flagged that targets $C = p^2 q$ with
$p$ large and $q$ small may have $p^3 > n$, making $p^{e(p)+1}$ not a
legal board move. Verify this case is explicitly handled or the
hypothesis is narrowed to exclude it.

## General anti-patterns to check

Independently of the specific checks above, run the general referee
passes:

- `o(1)` and $O(1)$ claims with hidden uniformity assumptions.
- Lemma citations where the lemma isn't stated.
- Quantifier orderings.
- Error aggregation where errors are bounded pointwise but not summed.

## Verdict format

If the appendix holds up, say so plainly.

If any step does not, name it specifically and distinguish:

- (i) fatal — the conditional T2 bound or a restricted-carrier bound
  does not follow from the arguments as written
- (ii) repairable — a specific step needs strengthening; state the
  strengthening
- (iii) presentation — the math is right but the reader would struggle

Pay particular attention to #11's restricted carrier class handling, as
an earlier audit flagged legality-range issues there that may or may not
have been addressed.

## Content to audit

[PASTE THE FULL CURRENT CONTENT OF
`erdos-872/paper/sections/appendix-A-deferred-proofs.tex` HERE.]
