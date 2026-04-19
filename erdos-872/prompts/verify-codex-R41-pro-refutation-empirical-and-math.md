Test Pro R41's refutation of the collision forcing lemma. Full writeup in `researcher-41-pro-collision-forcing-refuted.md`.

Two tasks: math verification + empirical implementation.

## Task 1 — math verification

Verify Pro's construction step-by-step against the exact main-game definitions:

**Setup.** Non-local defect-2 certificate $D = \{p, q, d_3, \ldots, d_{h-2}\}$ with primes in pairwise distinct dyadic microcells (packets). For each $i = 1, 2, 3$, fresh primes $a_i, b_i, z_i$ in new packets (mutually distinct, distinct from $D$'s packets). Define:
- $E_i = D \cup \{a_i, b_i\}$ (Prolonger's scored support)
- $E_i' = D \cup \{a_i, z_i\}$ (witness for usefulness)
- $c_i = D \cup \{a_i\}$ (legal proper subset)

Prolonger plays $F_i = bA_{E_i}$ sequentially; Shortener plays $\sigma^\star$ between.

**Check each of:**
1. **Freshness.** At time $F_i^-$, is $E_i$ fresh per the stated definition — i.e., $bA_{E_i}$ legal, AND no $bA_c$ with $c \subsetneq E_i$ claimed by Shortener before $t$? Walk through the cases for $i = 2, 3$: what could $\sigma^\star$ claim in rounds $\{F_1, \ldots, F_{i-1}\}$ that might violate this, and why does Pro's $\{a_i, b_i\} \notin X_i$ avoidance sidestep it?
2. **Usefulness.** At time $F_i$, is $c_i = D \cup \{a_i\}$ legal (not killed by prior Prolonger scores, not claimed by Shortener), and does $E_i'$ remain a live residual target containing $c_i$? Verify.
3. **Packet separation.** $\mathrm{coll}(S_{F_i}) = 0$ by construction. Verify explicitly for the $h=4$ case.
4. **$\sigma^\star$ response.** What does $\sigma^\star$ actually claim after $F_1$? Max-live-degree suggests a low-weight singleton $\{q^*\}$ with $q^*$ the smallest unclaimed prime. Does $q^*$ end up in $D$ eventually as iterations progress? If yes at iteration $k$, the construction breaks at iteration $k+1$; if no, scaling proceeds.

Report whether the construction as stated is watertight against $\sigma^\star$ or has a loophole.

## Task 2 — empirical implementation in `phase4/freshness_toy.py`

Implement Pro's packet-separated repeated-core Prolonger strategy explicitly:

- Parameterize by $h$, $M$ (microcell size), $D$-position (non-local core with primes in distinct cells)
- Prolonger iteration $i$: pick $a_i, b_i, z_i$ in fresh cells avoiding all prior plays and $\sigma^\star$'s claims; score $F_i = D \cup \{a_i, b_i\}$
- $\sigma^\star$ responds after each $F_i$ per the existing toy implementation
- Halt when Prolonger can no longer find fresh $\{a_i, b_i, z_i\}$, OR when $D$ itself becomes illegal (some $\sigma^\star$ claim kills $D$ or $F_i$)

**Grids to test:** $(h, M) \in \{(4, 30), (5, 30), (6, 25), (4, 50), (5, 50)\}$ — need enough primes for the repeated-core construction to scale beyond just 3 iterations.

**Measure per grid:**
- $J(D)$ achieved before halting (count of useful $E_i$ produced)
- $\mathrm{coll}(S_{F_i})$ per iteration — should be 0 if Pro's construction holds
- Iteration at which construction fails, if any, and the cause ($\sigma^\star$ claim killing $D$, no fresh primes, $E_i$ failing useful, etc.)
- Ratio $J(D) / (N_h/h)$ — is it $\ll 1$ (construction doesn't refute $(\star)$) or $\gg 1$ (construction refutes $(\star)$)?

**Interpretation:**
- If $J(D) \gg \log\log h$ achievable across grids, $(\star)$ is refuted and route 2 is dead.
- If $\sigma^\star$ consistently kills $D$ before the construction scales, Pro's counterexample is non-scaling and $(\star)$ may still hold under a refined charging argument.
- Intermediate behavior (scales for some but not all grids) is also informative.

Report both the math verification (Task 1) and empirical data (Task 2) in a short writeup.
