**Converged state.** WLST as originally stated is refuted by three independent constructions (forbidden-core star, parity-cube, relative cone). All three show that a single prior Shortener blocker can force every legal relative blocker to be a full rank-$h$ atom, killing separator capture to $\exp(-\Omega(h/\log h))$. All three converge on the same missing ingredient: a **two-outcome dichotomy** — either a large legal separator exists, or the live residual packet is chargeable to the played Prolonger complement shadow.

**Positive half (Case A) already proved.** Pro #3's Bernoulli Legal-Separator Lemma: if $x_p \in [0,1]$ with $X = \sum x_p$ satisfies
$$\sum_i \prod_{p \in C_i}(1-x_p) + \sum_j \prod_{p \in D_j} x_p \le 1/4, \qquad 2X \le h/2,$$
then a legal relative blocker $Q$ with $|Q| \le 2X$ and $\pi(\{C : C \cap Q = \varnothing\}) \ge \exp(-4XL/h)$ exists.

**Your task — unified LP duality formulation.** Use LP duality / fractional relaxation to handle both cases simultaneously:

Set up the weighted fractional hitting-set problem: minimize $\sum_p w_p \xi_p$ subject to $\sum_{p \in C_i} \xi_p \ge 1$ for all $i$, $\sum_{p \in D_j} \xi_p \le 1 - \epsilon$ for all $j$, $\xi_p \in [0, 1]$. The dual is a fractional packing of complements-vs-forbidden-sets with capacity $w_p$. Integer rounding yields either (i) an integral legal relative blocker (Case A) with small support, or (ii) a fractional packing certificate demonstrating saturation (Case B) with bounded fractional cover number.

**Unified two-outcome theorem via LP integrality gap.** Prove: the LP optimum $\xi^\ast$ either rounds to an integral $Q$ with $|Q|$ small enough for Case A, OR the dual packing value forces $|\mathcal R_\text{live}|_\pi \le \kappa \cdot |\mathcal C|_\pi$ via Hall's theorem / König's theorem / Menger-style duality applied to the weighted complement hypergraph.

**Obstruction cases as LP instances:**
- **Apex-star:** LP has optimum $\xi_x^\ast = 1 - \epsilon$ (would hit all $C_i$'s via $\{x\}$) but forbidden by $D = \{x\}$. Dual packing forces integer solution to size $h$. Case B kicks in: fractional cover number is $1$, packing dual gives $|\mathcal R_\text{live}| \asymp |\mathcal C| \cdot L/h$.
- **Parity-cube:** LP has fractional optimum $\xi_p^\ast = 1/2$ at every prime, but every integer rounding fails both legality constraints. Dual packing yields parity-obstruction certificate.

**Constructive Shortener strategy.** Implement the LP online via multiplicative weights update (Freund-Schapire style) or primal-dual scheme. At each turn Shortener solves (or approximates) the current LP; Case A integer rounding gives the entropy decrement; Case B fractional certificate charges against Prolonger's accumulated move count.

**Return with:**
- A rigorous formulation of the unified LP with explicit primal-dual pair.
- Integer rounding theorem (Case A) matching the Bernoulli lemma up to constants.
- Duality certificate (Case B) proving $|\mathcal R_\text{live}|_\pi \le \kappa(h, L) |\mathcal C|_\pi$ via LP/Hall machinery.
- Online implementation of the Shortener strategy with regret/concentration analysis.
- Integration to $L(n) \le O(r_1(n))$ or a named gap, especially characterizing when the integrality gap bites.
- Or a rigorous refutation: explicit LP instance with constant integrality gap *and* large packing value (both halves fail simultaneously), with required third ingredient named.

Verify numerical claims in Python sandbox with small-case LP solves. Do not return until definitive.
