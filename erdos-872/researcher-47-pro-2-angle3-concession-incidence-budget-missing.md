The angle closes, for me, as the third permitted outcome: **a precise concession**. The stated hypotheses are not strong enough to prove the activator-quotient budget. The exact missing ingredient is not “more density” or another static matching estimate; it is a legal-exposure Carleson inequality that ties sparse residue mass to actual future legal (\sigma^\star) claims.

Here is the missing statement in a form strong enough to imply the desired SMRP packing.

**Missing lemma: Legal Activator-Quotient Incidence Budget Lemma.**

Fix an (h)-block and delete clusters already absorbed by the dense-packet projection and clusters with
[
\nu_{h,2}^{\cup}(\mathcal F)\ll N_h/h.
]
For every remaining sparse matching-residue cluster (\mathcal F), write its common coface as (C_\mathcal F), its arms as (D_i=C_\mathcal F\setminus{c_i}), and its residue graphs as (G_i). Let (q_{\mathcal F,i,e}) be the defect-two lifted mass of a residue edge (e={a,b}\in G_i), normalized so that
[
\sum_{i}\sum_{e\in G_i} q_{\mathcal F,i,e}
\asymp \nu_{h,2}^{\cup}(\mathcal F).
]

Then there must exist coefficients
[
\alpha_{\mathcal F,i,e,t}\in[0,1]
]
assigned to Shortener’s legal (\sigma^\star)-claims (s_t), with (\alpha_{\mathcal F,i,e,t}=0) unless (s_t\in e), such that:

[
\sum_t \alpha_{\mathcal F,i,e,t}=1
\qquad\text{for every counted sparse residue edge }e,
]
and, for every Shortener turn (t),
[
\sum_{\mathcal F,i,e}
\alpha_{\mathcal F,i,e,t},q_{\mathcal F,i,e}
\le C\kappa_h,\mu(u_t),
]
where (u_t) is the rank-(h) mass newly removed by Shortener’s legal claim, and
[
\kappa_h=\frac1h
]
for the coarse SMRP estimate, while the sharp version requires
[
\kappa_h
========

H^2\log h,\frac{e^{-h}}{\log n}.
]

If this lemma were available, the desired packing would follow immediately from online harmonic domination:
[
\sum_{\mathcal F\text{ sparse}}
\nu_{h,2}^{\cup}(\mathcal F)
\asymp
\sum_{\mathcal F,i,e}q_{\mathcal F,i,e}
\le
C\kappa_h\sum_t\mu(u_t)
\le
C\kappa_h N_h.
]
With (\kappa_h=1/h), this gives
[
\sum_{\mathcal F\text{ sparse}}
\nu_{h,2}^{\cup}(\mathcal F)
\ll N_h/h.
]
With the sharp (\kappa_h), it gives
[
\sum_{\mathcal F\text{ sparse}}
\nu_{h,2}^{\cup}(\mathcal F)
\ll
N_h H^2\log h,\frac{e^{-h}}{\log n}.
]

The important point is that this lemma has two genuinely new requirements:

1. **Completeness of exposure:** every counted sparse residue edge must be incident to some actual legal (\sigma^\star)-claim.

2. **Per-claim quotient capacity:** the total lifted residue mass assigned to one legal Shortener claim must be at most (\kappa_h\mu(u_t)).

Neither follows from strong freshness, local usefulness, nor the smallest-legal-prime dynamic.

To see the failure mechanism concretely, take a common coface
[
C={c_1,\dots,c_h}
]
and arms
[
D_i=C\setminus{c_i}.
]
Let (m=\lfloor\log h\rfloor), (J=m^2), and put on each arm a private matching residue graph
[
G_i=\bigl{{a_{i,k},b_{i,k}}:1\le k\le J\bigr}.
]
With packet weights essentially constant, one has
[
B_i\asymp J,\qquad
\sigma_i\asymp 2J,\qquad
\Delta_w(G_i)\asymp 1.
]
Thus
[
\sigma_i^3\asymp J^3\gg \theta^{-1}J\asymp \theta^{-1}B_i
]
when (\theta\asymp1/\log h), and
[
\Delta_w(G_i)\ll B_i.
]
So this is genuinely sparse matching-residue.

Meanwhile the defect-three density is of order
[
\frac{B_i}{\sigma_i^3}
\asymp
\frac{1}{J^2}
\asymp
\frac1{(\log h)^4}
=o(\theta),
]
so the dense defect-three alternative does not fire.

Using the normalization from the prompt, the shared-coface matching-star gives
[
\nu_{h,2}^{\cup}(\mathcal F)
\asymp
\frac{m^2}{h}N_h,
]
which is larger than (N_h/h) by a factor ((\log h)^2). Therefore the first alternative also fails.

The only possible way to control it is to prove that this residue mass is legally exposed and budgeted through (\sigma^\star)-claims. That is exactly the missing Legal Activator-Quotient Incidence Budget Lemma above.

I also checked the relevant game-legal forcing pattern in the Python sandbox. A finite verified instance used
[
n=10^{10},\qquad C={211,223,227},
]
packet primes
[
101,103,107,109,113,127,131,137,139,149,\dots
]
and burn-in Prolonger moves by primes (>n/2), forcing (\sigma^\star) to claim all primes below (101). Then Prolonger plays activators
[
211\cdot223\cdot227\cdot101,\quad
211\cdot223\cdot227\cdot107,\quad
211\cdot223\cdot227\cdot113,\dots
]
and (\sigma^\star) is forced to claim respectively
[
103,\quad 109,\quad 127,\quad 137,\quad 149,\dots
]
The script verified after each Prolonger activator that every smaller prime was either already claimed or divided a previous Prolonger move, while the displayed Shortener prime was legal. No Shortener move divides the immediately preceding activator.

The verified transcript segment was:

[
\begin{aligned}
P &: 211\cdot223\cdot227\cdot101, & S &: 103,\
P &: 211\cdot223\cdot227\cdot107, & S &: 109,\
P &: 211\cdot223\cdot227\cdot113, & S &: 127,\
P &: 211\cdot223\cdot227\cdot131, & S &: 137,\
P &: 211\cdot223\cdot227\cdot139, & S &: 149.
\end{aligned}
]

This confirms the relevant legality mechanism: (\sigma^\star) walks through the packet by smallest legal primes, and its legal moves need not claim any prime divisor of a played activator.

So the precise obstruction is this:

Strong freshness says the residue objects have not already been spoiled.
Local usefulness says they can be activated.
The (\sigma^\star) lemma says which legal prime Shortener will claim.

But none of these says that the entire sparse matching-residue mass being counted is actually incident to legal Shortener claims with capacity
[
O(\mu(u_t)/h)
]
or with the sharp factor
[
O!\left(\mu(u_t),H^2\log h,e^{-h}/\log n\right).
]

That incidence-capacity statement is the missing inequality. Without it, the activator-quotient route has an unclosed gap at exactly the sparse private-matching residue mass: the mass can be strongly fresh, locally useful, non-dense, and game-legally compatible with the smallest-legal-prime dynamics, while still lacking a proven quotient budget.
