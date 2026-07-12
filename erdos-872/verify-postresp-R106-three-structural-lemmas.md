---
id: R106-audit-three-structural-lemmas
type: verification
date: 2026-07-12
intent: >
  Adversarial audit of three structural lemmas before promotion: the
  prime-product legality lemma with the residual-channel lifetime count,
  the one-sweep shadow containment theorem, and the equivalence of the
  post-peel completion statement with L(n) = o(n).
predecessors: [R98-policy-reduction-ancestor-harvest, R101-one-sweep-shadow-containment, R103-postpeel-statement-equivalence]
action:
  kind: confirms
  target: R101-one-sweep-shadow-containment
claim: >
  Verdicts on the three audited proofs. One-sweep containment theorem:
  VALID as written (legality monotonicity, correct poset D_j in the
  minimal-ancestor step, exact selection permanently blocks multiples,
  layers pairwise disjoint). Post-peel equivalence: VALID, including the
  terminal-position converse (vacuous legality clause, empty completion
  allowed) and the pointwise-to-uniform epsilon(n) conversion. Prime-
  product legality lemma with residual count: REPAIRABLE with a cosmetic
  fix only — S must be nonempty (the empty product 1 is not a board
  integer); with S nonempty the equality case a = B_S is covered, and
  the residual double count (4) is a genuine lifetime bound because the
  pre-registered atomic ledger capacity 2^r tau(c) is a lifetime
  statement and one move cannot first-kill two distinct lifts of one
  still-legal face (gcd/orientation argument). The instantaneous
  W_r tau(c) bound would NOT suffice in (4); the proof does not use it.
implications:
  - The one-sweep containment theorem and the ordered-shadow reduction
    (OS) may be treated as established in future dispatches.
  - The prime-product guard is established with the nonempty-S proviso.
  - The equivalence lesson stands; targeted statements must exclude the
    terminal-position witness.
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/audit-R106-three-structural-lemmas.md
---

I audited the three arguments exactly as written in the uploaded text. 

### Item 1 — **REPAIRABLE**

The residual double count is sound, but the prime-product lemma has one literal quantifier defect: \(S\) is allowed to be empty, in which case \(B_S=1\), which is not an available integer and hence is not legal. The repair is simply to assume \(S\neq\varnothing\), and to make no guard move when no legal primes remain. With that repair, the allegedly missing equality case is actually covered: if \(a=B_S\in A\), then for any \(p\in S\), \(p\mid a\); when \(|S|=1\), this says \(p=a\), contradicting that \(p\) is unchosen, and when \(|S|>1\), \(p\) is a proper divisor of the chosen \(a\), contradicting incomparability. The same reasoning handles both \(a\mid B_S\) and \(B_S\mid a\). Inequality (4) does **not** improperly promote an instantaneous bound, provided (3) is the stated atomic-ledger theorem in its genuine lifetime form: “\(c\) ever appears” for at most \(2^r\tau(c)\) pre-registered faces. Moreover, a fixed move \(c\) cannot first-kill two distinct lifts \(Fp,Fq\) while \(F\) remains legal: if \(c\) divides both, then \(c\mid\gcd(Fp,Fq)=F\); if both divide \(c\), then \(F\mid c\); and either mixed orientation would imply \(Fq\mid Fp\) or \(Fp\mid Fq\), impossible for distinct lift primes not dividing \(F\). Thus each face contributes \(q_H\) incidences with \(q_H\) distinct first-killing moves, and the lifetime capacity sums exactly as in (4). Using only the instantaneous \(W_r\tau(c)\) bound would be fatal, but that is not what (3) asserts.

### Item 2 — **VALID**

All four potentially delicate steps are correct under the stated full-sweep definition. Legality is monotone decreasing because the chosen set only grows, so an integer legal when played later was legal at the start of the sweep; consequently, a proper divisor of \(m\in M_j\) cannot newly become playable later, since it would already have contradicted the minimality of \(m\) in \(D_j\). For \(x\in M_\ell\), \(\ell>j\), the proof correctly applies the finite-poset fact to \(D_j\), not \(D_\ell\): since \(x\in D_\ell\subseteq D_j\), it has some \(m\in M_j\) with \(m\mid x\). The sweep removes every member of \(M_j\) from legality, so \(M_j\cap D_{j+1}=\varnothing\), forcing \(m<x\). If \(m\) was selected exactly, it remains permanently in the chosen set and therefore makes every multiple \(x\) permanently illegal; hence a later legal \(x\) can descend only from an \(m\) advance-killed by a proper multiple. Finally, the layers are pairwise disjoint: for \(k>j\), \(M_k\subseteq D_k\subseteq D_{j+1}\), while \(M_j\cap D_{j+1}=\varnothing\). Therefore the containment and the cardinality inequality (6) follow without repair.

### Item 3 — **VALID**

The terminal-position converse is legitimate and the uniformity argument is correct under the stated uniform interpretation of (S). Assuming \(L(n)=o(n)\), an optimal Shortener strategy guarantees terminal length at most \(L(n)\) against every Prolonger strategy. With \(H(n)=n/(L(n)+1)\), one has \(H(n)\to\infty\) and the terminal position is reached in fewer than \(n/H=L(n)+1\) moves. At a terminal position there are no legal integers, so “every legal integer exceeds \(n/H\)” is vacuously true; \(C=\varnothing\) is allowed because the empty set is a subset of the legal set, \(A\cup C=A\) is already maximal, and \(0=o(n/H)\). Conversely, the \(O(n/H)\) prefix plus the continuation bound gives \(o(n)\) total length exactly as calculated. The conversion to a single \(\varepsilon(n)\to0\) is also valid: if the supremum, over Prolonger strategies at size \(n\), of the smallest normalized witness \(|C|/(n/H)\) did not tend to zero, one could choose an offending strategy separately for each \(n\) in an infinite subsequence, forming a valid Prolonger strategy family that violates the asserted little-\(o\) condition. No hidden pointwise-to-uniform leap remains.

### Cross-cutting observation

Of the specifically flagged issues, only the empty-\(S\) edge case is a real defect, and it is cosmetic. Equality with the product is already handled by the definition of legality; legality genuinely decreases over time; exact selection permanently blocks all multiples; the one-sweep proof uses the correct earlier poset \(D_j\); and terminality genuinely makes both the legality condition and the empty completion legitimate. The important substantive distinction is in Item 1: \(W_r\tau(c)\) would be merely instantaneous and unusable in (4), whereas the pre-registered \(2^r\tau(c)\) atomic ledger is explicitly a lifetime bound.