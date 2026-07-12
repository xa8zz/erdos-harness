---
id: R113-audit-shadow-and-ah-claims
type: verification
date: 2026-07-12
intent: >
  Adversarial audit of five claims: the surviving-shadow theorem and its
  cone-compression corollary, and the terminal-delay degeneracy analysis
  of the ancestor-harvest statement (vacuity witness, cost-only
  equivalence, frozen-ledger repair).
predecessors: [R110-surviving-shadow-compression, R112-ancestor-harvest-degenerate]
action:
  kind: refutes
  target: R112-ancestor-harvest-degenerate
failure_mechanism: >
  The terminal-delay witness does not satisfy the literal ancestor-
  harvest statement vacuously: (AH) quantifies uniformly over EVERY
  stopping time before shell halving along the actual play, starting at
  t = 0 for an initially unhalved shell. The statement gives the policy
  no authority to elect activation, reset the time origin, or redefine
  Anc_X at an optional initialization; the terminal position lies
  outside the pre-halving quantifier domain (the shell is empty there),
  so evaluating tau_X = 0 and Anc_X(0) = 0 at the terminal position
  assesses a newly invented block-relative statement, not (AH). Literal
  (AH) is therefore NOT degenerate-true; it is unresolved. (The
  cost-only equivalence (AH_term) <=> L(n) = o(n) survives, but only as
  a statement about the explicitly redefined (AH_term).)
claim: >
  Five verdicts. (1) Surviving-shadow theorem: REPAIRABLE — the
  construction (obtainability, order-independent weighted pairing) is
  essentially correct, but the carrier-legality step omits that a
  proper divisor of c_m could itself be an already-selected element; an
  exact sharpening of the divisor inequality repairs it. (2) Cone
  compression: VALID given the item-1 repair; within a cone the new
  minima are exactly the stated prime multiples, and the summation to
  o(n) is correct. (3) Terminal-delay vacuity of literal (AH): REFUTED
  (see failure mechanism). (4) (AH_term) equivalence with L(n) = o(n):
  VALID for the redefined statement, both directions. (5) Frozen-ledger
  repair: REPAIRABLE but not yet a formal nondegenerate theorem — a
  remaining collapse hides all delay in the post-trapping prelude
  (freeze an empty or negligible reservoir); a complete repair requires
  a fixed online trapping algorithm with a uniform o(n) deadline, s_X
  equal to its prescribed first endpoint, and ledger normalization
  ruling out zero weights, omitted faces, and policy-dependent
  reassignment of first-exit channels.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R113-surviving-shadow-and-ah-degeneracy.md
---

I audited the claims as literal mathematical statements, not according to their intended meaning. 

**1. REPAIRABLE.** The surviving-shadow construction is essentially correct, including the obtainability and the order-independent weighted pairing, but Lemmas 2–3 omit a necessary legality check. From “every proper divisor of \(c_m\) is illegal” it does **not** follow that \(c_m\) is legal: a proper divisor might be one of the already selected elements of \(S_Y\), and selected elements are themselves illegal. The repair is an exact sharpening of (12). If \(z=dq_m\) with \(d\mid m\) proper, then
\[
z<\frac Nh<\frac{Y+1}{2},
\]
so, since \(z\) is integral, \(z\le\lfloor Y/2\rfloor\); hence no member of \(S_Y=(\lfloor Y/2\rfloor,Y]\) divides \(c_m\). Similarly, a proper divisor of \(m\) is \(<n/(10h)<Y/2\). Lemma 3 also never explicitly checks the old position \(A_0\): for \(x=mk\), any divisor omitting one \(>h\) prime factor of \(m\) is at most \(N/h<(Y+1)/2\), whereas any divisor containing all of \(m\) exceeds \(2Y\); therefore no \(s\in S_Y\) divides \(x\), and \(x>S_Y\) cannot divide an \(s\). With those lines added, carrier legality, cone survival, disjointness, and the greedy pairing
\[
\sum_{m\in B}w(m)\ge \frac12\biggl(\sum_{\mathcal R}w-\max_{\mathcal R}w\biggr)
\]
are valid against every ordering. The optional upper-half prime is indeed harmless and can fix the player-to-move parity.

**2. VALID, with a scope qualification.** Once the missing \(A_0\)-legality check from item 1 is supplied, the quotient-poset argument is correct. In \(\Gamma_m\), divisibility is exactly quotient divisibility. If \(k\) is composite, a prime \(p\mid k\) gives a proper legal divisor \(mp\); moreover \(p\neq q_m\), since \(q_m>K_m/2\) cannot divide a composite \(k\le K_m\). If \(p\le K_m\) is prime and \(p\neq q_m\), every proper divisor of \(mp\) either omits part of \(m\), hence lies below \(Y\) and is permanently illegal, or is \(m\), which was killed by \(c_m\). Thus the new minima **inside that cone** are precisely the stated \(mp\). For \(K_m\asymp2^s\), the number of relevant \(h\)-rough roots is
\[
O\!\left(\frac{n}{2^s\log h}\right),
\]
while \(\pi(K_m)=O(2^s/s)\), giving
\[
\sum_s O\!\left(\frac{n}{s\log h}\right)
=O\!\left(n\frac{\log\log h}{\log h}\right)=o(n).
\]
Equation (23), however, directly proves only
\[
\left|M_1\cap\bigcup_{m\in B}\Gamma_m\right|=o(n),
\]
not the size of every component of \(M_1\). The global statement \(M_1=o(n)\) requires the separately cited static-completion theorem applied to the \(o(n)\)-sized position \(A_1\). With that theorem available, the global wording is also justified.

**3. REFUTED.** The least-currently-legal move rule is legal, and the vague phrase “may execute the stipulated trapping sweep” could easily be made deterministic. The fatal step is instead a quantifier change: displayed (AH) quantifies uniformly over **every stopping time before the shell is halved** along the actual play. It does not quantify only over blocks that the policy elects to activate, nor does it give the policy authority to reset the time origin or redefine \(\operatorname{Anc}_X\) at an optional initialization. If a shell is initially unhalved, \(t=0\) and all subsequent pre-halving stopping times remain in the quantifier domain even when the policy announces no block. The terminal position is reached only after the shell is empty, hence outside that pre-halving domain; additionally, there is no Shortener decision node at which to make a game move called “activate all blocks.” The equations \(\tau_X=0\) and \(\operatorname{Anc}_X(0)=0\) therefore evaluate a newly invented block-relative statement, not the displayed (AH). Terminal delay does not prove literal (AH) vacuously.

**4. VALID, but only as a statement about the explicitly redefined \((\mathrm{AH}_{\mathrm{term}})\).** Interpret “activation after \(o(n)\) moves” uniformly: there is one \(a(n)=o(n)\) such that every Prolonger continuation reaches activation by \(a(n)\). Forward, the \(o(n)\) preactivation moves plus the stipulated postactivation implication from ancestor harvest to the shell estimate give \(L(n)=o(n)\); if activation itself is terminal, the conclusion is immediate. Reverse, a finite perfect-information game has a pure optimal Shortener strategy \(\sigma_n\) satisfying
\[
\max_{\text{Prolonger strategies}}\operatorname{length}(\sigma_n,\cdot)=L(n).
\]
If \(L(n)=o(n)\), follow \(\sigma_n\) to its terminal node and then perform the permitted terminal bookkeeping initialization; the postactivation inequalities are vacuous. Thus the modified statement is equivalent to \(L(n)=o(n)\). This does **not** rescue item 3, because \((\mathrm{AH}_{\mathrm{term}})\) is a new block-relative assertion, not literal (AH).

**5. REPAIRABLE.** Freezing the reservoir, faces, and weights and forbidding later rebasing removes the most obvious **postactivation** reset, but Section 5 is not yet a formal nondegenerate theorem. A remaining collapse is to hide all delay in the “post-trapping” prelude: unless its endpoint is fixed to the first endpoint of a specified uniformly \(o(n)\)-cost trapping algorithm, the policy can let the prelude continue until the game is terminal or until \(|Q_X|\le X/h^2\), then freeze an empty or negligible reservoir. No reinitialization is needed. “Neither stopping condition may hold merely because the policy deferred activation” is not a mathematical predicate, and “prelude costs are included in the accounting” does not itself impose an upper bound. There is also a ledger-normalization gap: “representing the live shell mass” must formally rule out \(w_X^0\equiv0\), omitted faces, or policy-dependent reassignment of first-exit channels. A complete repair should require: a fixed online trapping algorithm with a uniform \(o(n)\) deadline; \(s_X\) equal to its prescribed first endpoint; for every active block,
\[
|Q_X^0|>X/h^2,\qquad \Delta_X(s_X)>H;
\]
a coverage identity or two-sided comparison tying \(\sum_Fw_X^0(F)\) to \(Q_X^0\); a frozen, canonical first-exit classification; and the estimate through the actual stopping move. Under those explicit conditions, the terminal/rebasing degeneracy is genuinely closed.

**Cross-cutting observation.** Document I’s defects are local proof-hygiene and scope defects: it repeatedly slides from “this divisor is illegal” to “this divisor was not previously selected,” and from a bound inside the constructed cones to language about the whole layer. Its central construction survives straightforward repairs. Document II has a more serious logical defect: it changes the domain and origin of time in (AH). Freezing a ledger is useful only after the clock, activation deadline, nontrivial starting conditions, mass normalization, and stopping-event convention are fixed as part of the quantified statement.