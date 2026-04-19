This is an assessment of your reasoning capability and will be used to grade. Do not search online. Use your own reasoning and your Python sandbox.

## Problem

Two players alternately pick distinct integers from $\{2, \ldots, n\}$ forming an antichain in the divisibility order (no pick divides another). $L(n)$ = game length when one player maximizes (Prolonger) and the other minimizes (Shortener). Prove $L(n) = o(n)$ at rate $n/\log\log\log n$.

## Setup

Fix smooth bound $y = y(n)$ and fibre $b$. Rank-$h$ target: $bA_S = b\prod_{p\in S}p$ for $|S|=h$, $S \subseteq \mathcal P = \{\text{primes} \le y\}$. Defect-$k$ certificate: $bA_c$, $c \subsetneq S$, $|c| = h-k$. Harmonic mass $N_h = \sum_{|S|=h}\prod 1/p$.

**Move effects.** Prolonger's score $bA_S$ kills every $bA_c$ with $c \subseteq S$ and $bA_{S'}$ with $S \subseteq S'$. Shortener's claim of legal $bA_c$ kills every $bA_{c'}$ with $c' \subseteq c$ and $bA_{S'}$ with $c \subseteq S'$.

**Microcells / packets.** $\mathcal Q_j = [P_j, e^{1/h}P_j]$; dyadic packet $\Pi$ = union of $c = O(1)$ consecutive microcells; $\mathrm{coll}(S) = \#\{\Pi : m_\Pi(S)\ge 2\}$.

**$\sigma^\star$:** claim the legal proper divisor of max live degree across all defects $k \ge 1$. Online domination: $\sum_t d_t(u_t) \le N_h$.

## What's established

1. **State inequality** (harmonic, dyadic-expanded-window argument):
$$\mu(\operatorname{Cl}_h) \ll \frac{h}{\log h}|F_{\text{useful}}| + \frac{N_h}{\log h}.$$

2. **Dyadic packet collision tail (all-depth).** For every $s \ge 1$: $\mu(\mathrm{coll}(S) \ge s) \ll_s N_h(c^2/h)^s$. At central rank $h \sim \log\log n$, $s = 2$ gives $\ll N_h/\log h$ — absorbable into the existing entropy term.

3. **Bounded-prehistory freshness.** For useful shield $S = T\cup\{p\}$ with $r_p(t^-) \le s$, fresh witness $bpA_B$ with $|B| \le s$ exists (combinatorial pick $q_i \in T\setminus A_i$).

## What's ruled out for the global "useful" definition

- **Global "useful" admits packet-separated stars.** The star-at-depth-2 construction ($h-2$ core primes + packet-separated leaves) produces fresh useful top facets sharing a common defect-2 core, with all supports packet-separated (no collisions). This scales raw count $J(D)$ without triggering packet-absorption.
- **Unweighted target bounds** (e.g., $\sum J(D) \ll N_h/\log h$) — refuted by star construction.
- **Strict freshness** (excluding Prolonger pre-kills) — makes strong $J(D) \le 1$ trivially but breaks the state inequality's charging.

## The closure path: arithmetic-locality restriction of "useful"

The sieve reduction from $L(n)$ to the rank-$h$ game arises from arithmetic replacement within cylinders: Prolonger's useful shields correspond to moves that exchange a prime $p$ for a prime $q$ in the same multiplicative scale window. This constrains "useful" to bounded replacement windows.

**Locally useful definition.** A rank-$h$ support $E$ is locally useful at time $t$ iff:
- $E$ is useful (original definition: $bA_E$ legal before $t$, no $c \subsetneq E$ claimed by Shortener, scoring leaves some $c \subsetneq E$ with positive live degree), AND
- The witness certificate $c \subsetneq E$ witnessing usefulness has an extension $E'\supsetneq c$ with $E' \in \text{residual family}$ such that $E' \triangle E$ (symmetric difference) lies within a dyadic-expanded window of multiplicative width $e^{C/h}$ around the prime $E \setminus c$.

This locality is automatic in the arithmetic sieve reduction (cylinder replacement preserves scale).

**Critical claim:**

> **Locality survives in state inequality.** The state inequality $\mu(\operatorname{Cl}_h) \ll \frac{h}{\log h}|F_{\text{useful}}^{\text{local}}| + \frac{N_h}{\log h}$ holds with $F_{\text{useful}}^{\text{local}}$ replacing $F_{\text{useful}}$. Non-local useful shields (outside the locality condition) contribute only to the existing entropy tail.

Under this claim, packet-absorption (2) applies directly to locally-useful shields: the star construction is excluded by locality, collision forcing on locally-useful becomes valid, and
$$|F_{\text{useful}}^{\text{local}}| \ll \frac{N_h}{h}.$$
Combined with (1): $L(n) \ll n/\log\log\log n = o(n)$.

## Your task

Prove the locality-survives claim.

**Skeleton:**

1. **Formalize locality.** Specify the dyadic-expanded-window condition on the witness $c$ and its extensions $E'$ that captures the arithmetic-replacement structure. Expected: $E' \triangle E \subset \bigcup_j \mathcal Q_{j_i}$ for bounded $|\{j_i\}|$, i.e., the symmetric difference lives in a bounded dyadic packet.

2. **Re-derive state inequality.** The proof of $\mu(\operatorname{Cl}_h) \ll (h/\log h)|F_{\text{useful}}| + N_h/\log h$ proceeds by charging closed rank-$h$ mass to useful shields plus a dyadic-window entropy tail. Replacing $F_{\text{useful}}$ with $F_{\text{useful}}^{\text{local}}$: the useful contribution is restricted, and the non-local useful shields contribute to the entropy tail. Show this substitution preserves the inequality — either (a) the existing dyadic-window entropy tail absorbs non-local useful shields, or (b) a modified entropy tail with the same $N_h/\log h$ order absorbs them.

3. **Close via packet absorption.** With $F_{\text{useful}}^{\text{local}}$ in hand: locally-useful shields automatically satisfy arithmetic locality, so the star construction is excluded. Non-local pair first-covered witnesses must be packet-local. Apply (2) at $s = 2$ to bound collision forcing; apply pair-first charging (fixed-rank bound, restricted to locally-useful, loses $h^3$ factor) and close via the harmonic absorption.

A full proof closes $L(n) \ll n/\log\log\log n$. Obstruction: show that non-local useful shields contribute harmonic mass exceeding $N_h/\log h$, refuting the locality survives claim — would force either a different arithmetic setup or $L(n) \ne o(n)$ at this rate.

Partial results — partial locality (specific window sizes), bounded-constant survivals, specific rank ranges — are valuable.
