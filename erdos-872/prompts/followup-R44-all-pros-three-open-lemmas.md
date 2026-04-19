Update on current state, what was refuted, and where a full solution must now come from.

## New rigorous content

A conditional theorem has been formalized in the lifted harmonic measure framework. Define $\nu_{h,k}(D) = \mu_h(\operatorname{Sh}^{\text{loc}}_h(D))/\binom{h}{k}$ for defect-$k$ lower face $D$ with local shadow in the dyadic expanded window $I_j^\star$ (replacement ratio $q/p \in (1/2, 2)$). Call $D$ **strongly fresh** if its local shadow has not been touched by any prior Shortener claim, prior Prolonger move, or prior Prolonger-scored shield — the stricter condition than weak freshness, explicitly excluding Prolonger-caused pre-sterilization. Call $D$ **locally useful** if its local shadow is nonempty in the unresolved rank-$h$ board and is not already absorbed by the dense-packet projection. For $s(k) = \min\{k-1, \lfloor h/\log h \rfloor\}$, let $\mathcal E_{k,\theta}^{\text{sf,loc}}$ be the family of such defect-$k$ exceptional shields with a coface certificate $C(D) = D \cup Q(D)$, $|Q(D)| = s(k)$, satisfying $\mu_h(\operatorname{Sh}^{\text{loc}}_h(C(D))) \ge c_0 \theta \mu_h(\operatorname{Sh}^{\text{loc}}_h(D))$.

**Conditional theorem (SFLU-E).** Assuming the certificate-packing estimate
$$\sum_{D \in \mathcal E_{k,\theta}^{\text{sf,loc}}} \nu(C(D)) \ll N_h \qquad \text{(CP)}$$
one has $\nu_{h,k}^\Sigma(\mathcal E_{k,\theta}^{\text{sf,loc}}) \ll_C \theta^{-1}(Ck/h)^{s(k)} N_h$.

The per-shield density-increment comparison and the binomial-ratio estimate are rigorous. Only the family-level step (CP) is conditional.

## What was refuted (do not re-attempt)

**1. "Strong freshness + local usefulness ⟹ (CP)."** Refuted by explicit local star construction. Fix $C = \{c_1, \ldots, c_{h-1}\}$ and $W = \{w_1, \ldots, w_M\}$ with $M = \lfloor \log h \rfloor$. Defect-two shields $D_i = C \setminus \{c_i\}$ for $i = 1, \ldots, h-1$ all share the *same* defect-1 coface $C$, all satisfy the density increment at $\theta \asymp 1/\log h$, and all are strongly fresh before Prolonger activates. Union lift $\nu_{h,2}^\cup(\{D_i\}) \asymp M^2/h$ vs coface lift $\nu_{h,1}(C) \asymp M/h$: ratio gap of factor $h$. Strong freshness does not prevent Prolonger from activating many exceptional shields sharing the same coface-lift before Shortener resolves it.

**2. "$\sigma^\star$ + online harmonic domination trivially bound $\mu(F_{\text{useful}})$."** Online harmonic domination $\sum_t \mu(u_t) \le N_h$ bounds the harmonic mass of *Shortener's* claimed moves $u_t$, not Prolonger's useful shields $F_{\text{useful}}$. Any argument that asserts $\sigma^\star$ controls $\mu(F_{\text{useful}})$ without an explicit charging/packing lemma from Prolonger-scored to Shortener-claimed mass is the same hand-wave under different language.

**3. The R35 residual floor is a structural block to the conjectured sharp rate.** Even in the idealized case $\mu(F_{\text{useful}}) = 0$, the R35 inequality $\mu(\operatorname{Cl}_h) \ll (h/\log h) \mu(F_{\text{useful}}) + N_h/\log(h/\log h)$ has residual $\asymp N_h/\log h$, summing to $L(n) \ll n/\log\log\log n$. Since $(\log\log n)^2/\log n = o(1/\log\log\log n)$, the R35 residual alone forbids reaching the conjectured rate $n(\log\log n)^2/\log n$.

**4. Attractor-level pattern errors.** Do not rely on: misreading "single-fiber positive density is *equivalent to* $L(n) = \Omega(n)$" as disproof of $\Omega(n)$; reversing a refutation of an upper-bound proof into proof of a lower bound (e.g., "collision forcing is refuted at defect 2" does not imply Prolonger succeeds at defect 2); reading the empirical $L\log n/n$ drift on $n \in [10^4, 10^7]$ as distinguishing rates ($\log\log n$ only moves $2.2 \to 2.8$ at accessible $n$ and the data explicitly cannot separate candidates).

## Where a full solution must come from — three precisely stated lemmas

**(A) Certificate-packing theorem.**
$$\sum_{D \in \mathcal E_{k,\theta}^{\text{sf,loc}}} \nu(C(D)) \ll N_h \qquad \text{(uniform in } 2 \le k \le Ch/\log h, \theta \asymp 1/\log h\text{)}.$$
The lemma must handle simultaneous activation and shared cofaces. Candidate approaches include: a Carleson-style packing bound in the lifted harmonic measure; a structural theorem showing high-multiplicity shared-coface stars are already absorbed by the dense-packet projection; a dynamic injective-charging lemma under $\sigma^\star$ that assigns each exceptional shield to a distinct piece of newly-killed Shortener mass. Strong freshness + local usefulness alone are insufficient (see refutation 1 above).

**(B) Sharper defect-two estimate.** $\mu(\mathcal E_{2, 1/\log h}^{\text{sf,loc}}) \ll N_h/h$ (rather than the $(\log h/h) N_h$ from conditional (SFLU-E) at $k=2$, which loses a factor $\log h$ against the $L = h/\log h$ multiplier in the R35 inequality). Requires a sharper dense-packet projection at $k=2$ specifically, or an argument that the defect-two residue is absorbed elsewhere before entering $F_{\text{useful}}$.

**(C) Replacement state inequality.** $\mu(\operatorname{Cl}_h) \ll L \mu(F_{\text{useful}}) + R(h)$ with $R(h) \ll N_h \cdot (\log\log n)^2/\log n$ at central rank $h \sim \log\log n$. This is the residual needed to reach the conjectured sharp rate. Alternative valid resolution: **rigorously refute (C)** by showing no such inequality can exist, concluding that the true sharp rate is $n/\log\log\log n$ and the conjectured $\Theta(n(\log\log n)^2/\log n)$ rate is wrong.

Implications:
- (A) + (B) ⟹ $\mu(F_{\text{useful}}) \ll N_h/h$ ⟹ $L(n) \ll n/\log\log\log n$ ⟹ closes $L(n) = o(n)$.
- (A) + (B) + (C) ⟹ $L(n) \ll n(\log\log n)^2/\log n$ ⟹ closes the sharp conjectured rate.
- Refutation of (C) with (A) + (B) proved ⟹ sharp rate is $n/\log\log\log n$, conjecture is wrong.

## What not to return with

Do not return with any of:

- A claimed closure that invokes "$\sigma^\star$ + online harmonic domination trivially bound $\mu(F_{\text{useful}})$" in any form. This is the attractor hand-wave; it is refuted.
- An argument that strong freshness and locality imply the certificate-packing estimate (CP). This is refuted by the explicit local star construction above.
- A claimed match to $\Theta(n(\log\log n)^2/\log n)$ that does not directly address the R35 residual floor. If your argument yields only $N_h/\log h$ after summation, the result is at most $n/\log\log\log n$, not the conjectured rate.
- A patched version of any of the above that shares the same structural weakness. Re-deriving the same hand-wave in different notation is not progress.
- An appeal to the numerical data to distinguish rates. The data cannot separate candidates at accessible $n$; this is explicit in the established evidence.

## Return only with one of the following

- A rigorous proof of one of (A), (B), or (C) as precisely stated above. The proof must address the specific failure mechanisms in the refuted items — in particular, for (A) it must handle the local star construction, for (B) it must save a factor $\log h$ over conditional (SFLU-E) at $k=2$, and for (C) it must produce a residual strictly smaller than $N_h/\log h$ at central rank.

- A rigorous refutation of (A), (B), or (C) with an explicit construction and failure mechanism. A refutation of (C) in particular would resolve the asymptotic-order question by establishing $L(n) \asymp n/\log\log\log n$.

- A precise concession identifying the specific additional ingredient needed — named mathematically, not as a direction. "The missing step is a Carleson-type packing bound of the form X" is useful; "one needs a better charging argument" is not.

No other response is useful at this stage. The program has narrowed to exactly these three lemmas and cannot close without a definitive answer on at least one of them.
