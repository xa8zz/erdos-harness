---
id: R112-ancestor-harvest-degenerate
type: research
date: 2026-07-12
intent: >
  Prove or disprove the ancestor-harvest statement (AH): a fully
  specified legal online Shortener policy under which cumulative
  first-exit direct-ancestor mass satisfies Anc_X(t) <= o(X) + O(Ht)
  uniformly at stopping times before the degree cap or shell halving.
predecessors: [R98-policy-reduction-ancestor-harvest]
action:
  kind: extends
  target: R98-policy-reduction-ancestor-harvest
claim: >
  (AH), literally as stated, is TRUE for a degenerate reason and
  therefore not the nondegenerate theorem the conditional argument
  needs. Terminal-delay witness: a legal policy (trapping sweep, then
  least-legal-integer forever, batch branches specified but never
  reached) postpones shell-block activation until the terminal
  position, where every shell is empty, every cap is 0, there are no
  admissible stopping times, and the inequality holds vacuously.
  Cost-only repair fails too: requiring activation within o(n) moves
  but still allowing a terminal activation point gives (AH_term), and
  (AH_term) is EQUIVALENT to L(n) = o(n) (forward: the stipulated
  reduction; reverse: follow an optimal strategy to the terminal
  position and activate there). The nondegenerate formulation must
  freeze, at a prescribed post-trapping time s_X independent of future
  play: the reservoir Q_X^0, the full canonical latent-face family, and
  the face weights — with no reinitialization or rebasing of blocks —
  and require immediate processing.
implications:
  - Third formulation collapse of the night (after the post-peel
    completion statement and cost-only repairs): any statement whose
    activation or stopping data is strategy-chosen collapses via
    terminal delay. Prompts must prescribe activation times and frozen
    ledgers in advance.
  - The o(n)-side separator is now the FROZEN-LEDGER ancestor-harvest
    statement (AH*) as specified; the R98 reduction implicitly assumed
    exactly this.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R112-ancestor-harvest.md
---

# Verdict

\[
\boxed{\text{(AH), literally as stated, is true for a degenerate reason.}}
\]

It admits a **terminal-delay witness**: Shortener may postpone activation of every shell-processing block until the game is already terminal. At that moment every shell is already empty, so there are no stopping times before shell halving and no first-exit ancestor mass to count. Consequently the inequality holds vacuously.

Therefore the displayed (AH) is **not** the nondegenerate ancestor-harvest theorem needed by the conditional argument. The passage from (AH) to \(L(n)=o(n)\) silently uses an additional requirement: every relevant nonempty shell block must be initialized at a prescribed post-trapping position, with its canonical faces and weights frozen before future play, and then processed immediately. That requirement does not appear in the stated formulation. 

## 1. The terminal-delay policy

Fix \(n\). Define a deterministic Shortener policy \(\sigma^\dagger\) as follows.

First, Shortener may execute the stipulated smooth/rough trapping sweep. After that, she does **not** open any shell-processing block. On each subsequent Shortener turn, she plays the least currently legal integer.

This is a fully specified legal online rule. Since the board contains only \(n-1\) integers, every continuation against every Prolonger strategy reaches a terminal position \(A^\ast\) after finitely many moves.

To make the batch and fallback parts formally explicit, define:

- whenever an active batch has an admissible legal batch move, choose the least such move;
- otherwise choose the least legal integer as the fallback.

Under \(\sigma^\dagger\), no batch is activated before termination, so these branches are never needed on the realized history, but they are nevertheless completely specified on every possible decision node.

Only when \(A^\ast\) is reached does the policy declare the shell blocks activated.

## 2. Evaluation at the terminal position

At \(A^\ast\), no integer is legal. Hence for every dyadic shell \(S_X\),

\[
Q_X(A^\ast)=\varnothing .
\]

In particular, the shell is already halved. Equivalently, with the standard convention that the maximum degree of an empty legal family is zero, the degree cap also already holds:

\[
\Delta_X(A^\ast)=0.
\]

Let \(\tau_X\) be the first shell-block time at which either the degree-cap stopping condition or the shell-halving stopping condition holds. Because the block is initialized at \(A^\ast\),

\[
\tau_X=0.
\]

Thus the collection of stopping times satisfying

\[
t<\tau_X
\]

is empty. The asserted uniform inequality is therefore automatically true.

Even under a convention that also tests \(t=0\), one has

\[
\operatorname{Anc}_X(0)=0,
\]

because no face has a first exit strictly before the block begins. Taking, for example,

\[
\varepsilon(H)=0,\qquad C=1,
\]

gives

\[
\operatorname{Anc}_X(0)
=0
\le
\varepsilon(H)X
+
C\sum_{i<0}\Delta_i
+
CH\cdot0
=0.
\]

Hence, uniformly over every Prolonger continuation, every shell, and every relevant stopping time,

\[
\operatorname{Anc}_X(t)
\le o(X)+O(Ht).
\]

This proves the literal existential statement unconditionally.

## 3. Why this does not prove \(L(n)=o(n)\)

The policy \(\sigma^\dagger\) may use linearly many moves before it opens the shell blocks. More importantly, it never processes a **nonempty** shell. Therefore its vacuous ancestor estimate supplies no shell-halving progress whatsoever.

The conditional argument in the attachment passes from

\[
\operatorname{Anc}_X(t)
\le
o(X)+O(Ht)+C\sum_{i<t}\Delta_i
\]

to the online-area conclusion

\[
|Q_X(\mathrm{end})|
\le
\frac12|Q_X(\mathrm{start})|
+
\frac{X}{h(n)^2}.
\]

That passage requires a nonempty processing interval beginning from the actual post-trapping shell state. For the terminal-delay policy there is no such interval: its “start” and “end” are both the already-terminal state.

The exact missing premise is therefore:

\[
\boxed{
\begin{minipage}{0.88\linewidth}
Every relevant shell block must be opened at a prescribed nonterminal
post-trapping state, before observing any subsequent Prolonger moves,
and must then be run without postponement or reinitialization until its
specified stopping event.
\end{minipage}}
\]

Without this premise, “uniformly over every stopping time before halving” can quantify over the empty family.

This is the first invalid inference in the claimed unconditional implication: an estimate valid on whatever blocks the policy chooses to open is treated as an estimate on the prescribed nonempty blocks required by (OA).

## 4. A cost-only repair collapses to the full problem

Suppose one tries to repair (AH) only by requiring that the policy reach its shell-block activation point after \(o(n)\) moves, while still permitting the activation point to be terminal. Call this statement \((\mathrm{AH}_{\mathrm{term}})\).

Then, using the implication stipulated in the problem,

\[
\boxed{
(\mathrm{AH}_{\mathrm{term}})
\quad\Longleftrightarrow\quad
L(n)=o(n).
}
\]

### Forward implication

This is exactly the implication the prompt asks us to accept:

\[
(\mathrm{AH}_{\mathrm{term}})\Longrightarrow L(n)=o(n).
\]

### Reverse implication

Assume \(L(n)=o(n)\). For each \(n\), the finite perfect-information game has an optimal Shortener strategy \(\sigma_n\) that guarantees termination after at most \(L(n)\) total moves against every Prolonger strategy.

Shortener follows \(\sigma_n\) until the terminal position \(A^\ast\). Since

\[
L(n)=o(n),
\]

the terminal activation point is reached after \(o(n)\) moves. She then initializes all shell blocks. As above,

\[
Q_X(A^\ast)=\varnothing,\qquad
\tau_X=0,\qquad
\operatorname{Anc}_X(0)=0,
\]

so the ancestor-harvest inequality holds vacuously for every shell. Thus \((\mathrm{AH}_{\mathrm{term}})\) follows.

Therefore adding only a sublinear activation deadline does not create a useful intermediate theorem; it merely reformulates the original question.

## 5. The nondegenerate formulation actually needed

To obtain a genuine ancestor-harvest statement, the following data must be fixed independently of future Prolonger play.

At the prescribed post-trapping time \(s_X\), one must freeze:

\[
Q_X^0:=Q_X(s_X),\qquad
\mathscr F_X^0,\qquad
w_X^0(F),
\]

where \(\mathscr F_X^0\) is the full canonical latent-face family representing the live shell mass. No face may later be removed from the ledger merely by restarting or rebasing the block.

The statement must then require:

1. The block starts immediately at \(s_X\), unless \(Q_X^0\) is already within the allowed \(X/h^2\) error.
2. At \(s_X\), neither designated stopping condition may already hold merely because the policy deferred activation.
3. On every Shortener turn before the genuine stopping time \(\tau_X\), the policy executes its specified batch rule or fallback rule.
4. The estimate
   \[
   \operatorname{Anc}_X(t)
   \le
   \varepsilon(H)X
   +
   C\sum_{i<t}\Delta_i
   +
   CHt
   \]
   holds for every stopping time \(0\le t\le\tau_X\), with \(C\) absolute and \(\varepsilon(H)\to0\) uniformly over \(n,X\), the starting history, and Prolonger’s continuation.
5. The scheduling and prelude costs are included in the global move accounting.

Call this strengthened assertion \((\mathrm{AH}^{\sharp})\). The residual-channel and prime-guard calculations in the attachment can plausibly be combined with \((\mathrm{AH}^{\sharp})\) to obtain (OA), because \((\mathrm{AH}^{\sharp})\) applies to the actual nonempty blocks. They cannot be combined with the literal (AH), because the literal statement permits the terminal-delay policy.

# Conclusion

The requested statement is resolved as follows:

\[
\boxed{
\begin{aligned}
&\text{Literal (AH): unconditionally true but vacuous;}\\
&\text{(AH) plus only an }o(n)\text{ activation deadline: equivalent to }L(n)=o(n);\\
&\text{the intended fixed-start, nonresettable }(\mathrm{AH}^{\sharp})
\text{ is a different statement.}
\end{aligned}}
\]

Thus the attached analysis has not isolated a standalone intermediate theorem as written. It has isolated a meaningful direct-ancestor problem only after adding the fixed nonterminal activation and no-reinitialization requirements.