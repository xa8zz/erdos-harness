**Context update.** Two independent parallel threads attacking the same problem converged on the new paradigm below. Your task is to use it to attempt the missing foundational theorem.

**Paradigm summary — blocker duality / legal transversal.** Work inside a squarefree prime packet. Represent rank-$h$ moves as $h$-subsets $B \subseteq P$ of a prime packet $P$. A legal Shortener composite $Q$ is precisely a **minimal transversal** of the complement family $\{C_i := P \setminus B_i : B_i \text{ played by Prolonger}\}$ — i.e., $Q \cap C_i \neq \varnothing$ for every $i$. Cross-activator legal composites like $91 = 7 \cdot 13$ are exactly the minimal transversals the game demands; they are not pathologies. The R35 residual $N_h/\log h$ is a proof-technique artifact of scalar local-facet accounting; in the packet quotient, *claiming the blocker closes the packet with no such residual*.

**Rigorous partial results already in hand:**

- **Blocker duality identity.** $b(b(\mathcal C)) = \mathcal C$ for any clutter $\mathcal C$. Legal Shortener composites are minimal transversals of the Prolonger complement clutter, and claiming the full blocker clutter collapses the packet with no residual.

- **Packet transversal-capture lemma.** For $K = h + L$, $0 < L \le h/4$, and $s \le \exp(cL)$ Prolonger blockers, there exists a legal transversal $Q \subseteq P$ with $|Q| \le 8(K/L)\log(2s)$ such that $\binom{K-|Q|}{h-|Q|} / \binom{K}{h} \ge (2s)^{-C}$. Proof: random hitting set at sampling probability $p = 2\log(2s)/L$, Markov + union bound + elementary-moment descent. For $L \asymp h/\log h$, this gives transversals of size $O(\log h \cdot \log s)$ capturing polynomial-in-$s$ packet fraction.

**Task — prove or refute the Weighted Legal-Separator Theorem (WLST).**

At central rank $h \sim \log\log n$ under the Sathe-Selberg measure, given Prolonger complements $\mathcal C = \{C_1, \ldots, C_s\}$ in the current packet and prior Shortener blockers $\mathcal D = \{D_1, \ldots, D_r\}$ already claimed, there exists a legal relative blocker $Q$ — transversal of $\mathcal C$ with $D_j \not\subseteq Q$ for all $j$ — such that
$$\pi\bigl(\{C : C \cap Q = \varnothing\}\bigr) \ \ge\ \eta(h, s, r)$$
with $\eta$ strong enough that iterated entropy decrements under repeated claim of such $Q$ sum over central ranks to $O(r_1(n)) = O(n(\log\log n)^2/\log n)$.

Return with one of:

1. **Rigorous proof.** Give the explicit $\eta(h, s, r)$ bound, the legal-relative-blocker construction, and the integration to $r_1$. Handle the forbidden prior Shortener blockers $\mathcal D$ explicitly — the packet transversal-capture lemma above does not handle $\mathcal D$, and extending it is the first sub-lemma to prove.

2. **Rigorous refutation.** Construct an explicit packet state (specific $\mathcal C$ and $\mathcal D$) where every legal relative blocker has $\pi(C: C \cap Q = \varnothing) \le \exp(-\operatorname{poly}(h))$. Sandbox-verify. Name the specific new ingredient needed to unblock the paradigm.

3. **Strictly sharper named sub-theorem.** A forbidden-transversal lemma with explicit $(s, r, L)$ parameter dependence, or a specific Shortener meta-strategy implementing the separator choice with an analyzable invariant.

**Constraints.** All constructions must be game-legal: no Shortener claim divides a played Prolonger element. Legal composites of individually-illegal primes must be handled correctly as minimal transversals, not as anomalies. Do not revert to scalar $F_{\text{useful}}$ local accounting — the whole point is to abandon that paradigm. Verify numerical claims in Python sandbox.
