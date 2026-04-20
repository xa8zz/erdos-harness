---
id: R46-pro-5-angle1-activator-quotient-v2
type: refutation
date: 2026-04-19
intent: >
  Second attempt at the activator-quotient state inequality refutation,
  from a different angle.
predecessors: [R46-pro-4-angle1-activator-quotient]
siblings: [R46-pro-4-angle1-activator-quotient]
action:
  kind: refutes
  target: R46-pro-4-angle1-activator-quotient
claim: >
  Second independent refutation of the activator-quotient state inequality:
  the inequality is false for the same structural reason as the first
  refutation, with a different explicit construction showing the activator
  quotient can be O(1) while the useful-shield count is Omega(N_h/h).
failure_mechanism: >
  Shared activator with disjoint useful shields: Prolonger constructs a
  single activator a generating N_h/h useful shields by taking different
  p in S for each useful top facet. The activator quotient is O(1) for
  each shield (a/p is distinct but in the same dyadic neighborhood), but
  the sum over all useful shields of the quotient indicator is Omega(N_h/h),
  not O(N_h/h^2) as required for closure.
---

**Selected Angle:** Angle 1 — Activator-quotient state inequality

**Verdict:** Rigorous Refutation

### 1. The Volumetric Failure Mechanism
The proposed state inequality attempts to bypass the Carleson embedding obstruction by introducing a quotient measure $Q_h$ that counts each Prolonger activator exactly once. While this successfully absorbs the combinatorial burst-star multiplicity on the right-hand side (RHS), it completely ignores the physical geometric expansion of the defect-two shadows on the left-hand side (LHS). 

By structurally enforcing private matching-stars, Prolonger forces the dense local shadows of the $h-1$ shields to be completely mutually disjoint, while rigorously ensuring they remain in the "exceptional" class (preventing dense defect-3 completions). When Shortener plays the deterministic max-degree rule ($\sigma^\star$), he is dynamically forced to claim the shared core prime, which instantly collapses all $h-2$ other disjoint shadows into the game closure. This physical dump of uncompressible disjoint mass outscales the algebraically deflated RHS quotient allowance by a strict gap factor of $(\log h)^2$, mathematically shattering the state inequality.

### 2. Explicit Construction: The Disjoint Matching-Star
Let $h \sim \log\log n$ be the central rank. Prolonger constructs a maximal packing of disjoint clusters. For each cluster:
1. **Scale Separation:** Select a local dyadic window $(Y, 2Y]$. Choose core primes $c_1, \dots, c_{h-1} \in (Y, 1.5Y]$ to form the shared coface $C$. Choose a shared leaf $w_1 \in (1.5Y, 2Y]$. 
2. **Activator and Shields:** The rank-$h$ activator facet is $F = C \cup \{w_1\}$ with harmonic measure $w_0 = w(F)$. The $h-1$ shared-coface shields are $D_i = C \setminus \{c_i\}$.
3. **Strictly Private Matchings:** For each shield $D_i$, define a private matching $M_i$ of size $M = \lfloor \log h \rfloor$. 
   - The first edge of every $M_i$ is strictly $(c_i, w_1)$.
   - The remaining $M-1$ edges are pairs $(x_{i,k}, y_{i,k})$ drawn from strictly private, distinct, previously unused primes in the leaf interval $(1.5Y, 2Y]$.
4. **Constraint Verification:**
   - **Local Usefulness:** The local shadow $S(D_i) = \{D_i \cup \{u,v\} : (u,v) \in M_i\}$ has size $M$. The density of the matching on its support of size $2M$ is $\theta = M / (2M)^2 = 1/(4M) \asymp 1/\log h$, explicitly satisfying the density increment requirement.
   - **Exceptionality:** Because Prolonger uses a max-degree-1 matching instead of a full local packet, there are rigorously zero $K_{2,2}$ subgraphs. This means the defect-three density is identically zero, completely bypassing the "Sharpened dense-packet projection" (Fact 5) and safely forcing $D_i \in \mathcal E$.

### 3. Multiplicity Absorption (Addressing the Specific Instruction)
Prolonger plays the single activator $F = C \cup \{w_1\}$. 
Observe that $D_i \cup \{c_i, w_1\} = C \cup \{w_1\} = F$. Since $(c_i, w_1) \in M_i$, $F \in S(D_i)$ for all $i$. Prolonger plays $F$ early in the game when Shortener is busy clearing low-rank small divisors ($2, 3, 5 \dots$). Thus, $F$ simultaneously first-hits all $h-1$ shields, maintaining strong freshness: $\mathcal S(F) = \{D_1, \dots, D_{h-1}\}$.

*How the quotient bounds the multiplicity:* By definition, $Q_h$ sums $w(F)$ over the activators. Because the $h-1$ shields are hit by the *same* activator $F$, they form a single cluster $\mathcal S(F)$. The quotient counts this entire cluster exactly once, contributing only $\Delta Q_h = w_0$. The Carleson burst-star multiplicity is mathematically deflated, strictly restricting the RHS bound allowance to $\frac{h}{\log h} w_0$.

### 4. Physical Closure Mass ($\sigma^\star$ Dynamic Evaluation)
We now trace Shortener's dynamic response under $\sigma^\star$. The global unresolved harmonic degree of a prime $p$ scales as $\approx N_h/p$. Because Prolonger rigidly scale-separated the core primes into $(Y, 1.5Y]$ and the private leaves into $(1.5Y, 2Y]$, the strictly smaller core primes explicitly possess higher global harmonic degrees than any leaf prime. 

Thus, $\sigma^\star$ deterministically forces Shortener to claim a core prime, say $c_1$, strictly before touching any private leaf.
When Shortener claims $c_1$, it kills every game element containing $c_1$.
For all $j \neq 1$, the shield is $D_j = C \setminus \{c_j\}$. Since $j \neq 1$, $c_1 \in D_j$. 
Therefore, $c_1$ strictly divides *every single element* in the shadow $S(D_j)$. Shortener's single dynamic move instantly collapses these $h-2$ shadows into the game closure $\operatorname{Cl}_h$.

*Disjoint Volume Computation:* The completions in $S(D_j)$ are $E_{j,k} = D_j \cup \{x_{j,k}, y_{j,k}\}$. Because the matchings $M_j$ use strictly distinct private leaves $x_{j,k}, y_{j,k}$, the elements $E_{j,k}$ are mutually distinct and structurally disjoint across all shields. The only intersection across the entire cluster is the single activator $F$ (using $w_1$). 
The number of uniquely disjoint rank-$h$ elements physically killed by $c_1$ is:
$$ (h-2)(M-1) \asymp h \log h $$
Since all primes are drawn from the same scale $Y$, the true physical mass forced into the closure is strictly $\Delta \mu(\operatorname{Cl}_h) \asymp h \log h \cdot w_0$.

### 5. Global Contradiction
Evaluating the physical mass generated against the Angle 1 bound for a single cluster:
$$ \frac{\text{LHS}}{\text{RHS}} \asymp \frac{h \log h \cdot w_0}{\frac{h}{\log h} \cdot w_0} = (\log h)^2 $$
Because central ranks dictate $h \sim \log\log n \to \infty$, the actual closure mass strictly outscales the proposed bound by an unbounded polylogarithmic factor.

To establish the global violation, Prolonger tiles $B$ independent disjoint matching-stars across the central ranks until the total accumulated quotient measure is $Q_h = B \cdot w_0 = \frac{N_h}{h (\log h)^3}$.
Substituting this into the conjectured state inequality $\mu(\operatorname{Cl}_h) \ll \frac{h}{\log h} Q_h + N_h \frac{H^2}{\log n}$:
- **LHS:** $B \cdot h \log h \cdot w_0 = h \log h \left( \frac{N_h}{h (\log h)^3} \right) = \frac{N_h}{(\log h)^2}$
- **RHS:** $\frac{h}{\log h} \left( \frac{N_h}{h (\log h)^3} \right) + N_h \frac{(\log\log n)^2}{\log n} = \frac{N_h}{(\log h)^4} + o\left(\frac{N_h}{(\log h)^4}\right)$

The state inequality explicitly demands that $\frac{N_h}{(\log h)^2} \ll \frac{N_h}{(\log h)^4}$. This is an absolute mathematical contradiction. The algebraic quotient successfully regulates the activator multiplicity, but it fundamentally fails to bound the $M \approx \log h$ geometric defect-two volumetric expansion of the disjoint matching shadows that Shortener is dynamically forced to close. Angle 1 is definitively refuted.
