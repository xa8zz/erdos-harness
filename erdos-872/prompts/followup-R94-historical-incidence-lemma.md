This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

Two independent adversarial audits of your arbitrary-reply persistence theorem found the same fatal break, with concrete realizations; take them as given.

## The break

Your bound (7) is instantaneous: at the moment a spoiler \(c\) is played, the faces then active and losing a lift number at most \(B_r\tau(c)\) (Sperner over at most \(\tau(c)\) cores). Your (10) needs the lifetime statement: the number of faces whose exhaustion certificate EVER uses \(c\). Nothing bridges them: a face charged to \(c\) may be a descendant created later by canonical splitting, born with a lift already illegal because of \(c\) — played integers are permanent blockers. Boolean refinement realization: over one core \(b\mid c\), stage \(k\) activates all signatures of size \(k\); every stage is an antichain of size \(\le B_r\), but the whole history reveals \(2^r\) distinct core-signature pairs. Realized on the board \(n=4000\): \(c=30\) (\(\tau=8\), claimed capacity \(B_4\tau(30)=48\)); the 128 multiples \(60,90,\ldots,3870\) of 30 embed the 8 cores times \(2^4\) signatures, all legal immediately before 30 is played after the legal opening 2003, all killed by it; a 258-move verified-antichain continuation realizes the refinement history. Lifetime multiplicity 128 > 48 while every instantaneous count stays \(\le 48\).

Also unproved and needed independently: the weighted passage (12)→(13) (a packet identity with no duplicate charging of parent and descendants); scheduler completeness (fallback move when a popped face has no legal lift; descendants can be born exhausted; queue completion ⇒ degree cap — the stopping dichotomy has a missing third branch, direct reservoir sacrifice, e.g. one legal lower move can eliminate hundreds of live upper targets at once); and (20) holds only existentially (there is a suitable \(H=\mathfrak T(n)^{1+o(1)}\)), not for every such \(H\).

Your fixed-\(\delta\) arithmetic is sound and has slack: any historical factor \(M_r=H^{o(1)}\) suffices, so \(M_r=2^r\) or \(C^r\) is acceptable.

## Request

Prove or refute the historical incidence lemma your theorem needs: design a canonical splitter (explicit face identity, split map, inheritance, merging and regeneration rules) for which
\[
\#\{F:\ c\ \text{is ever charged in}\ F\text{'s exhaustion certificate}\}\le M_r\tau(c),\qquad M_r=H^{o(1)},
\]
together with the weighted packet identity and a complete legal scheduler (fallback moves; completion implies the degree cap; every reservoir loss covered by a policy-uniform decomposition including direct sacrifice). A refutation means showing every canonical splitter compatible with your entry construction admits an ordered history with lifetime multiplicity \(H^{\Omega(1)}\tau(c)\) — i.e., the \(2^r\) inheritance is unavoidable at full generality. If neither closes, state the single sub-step that cannot be closed.

REMEMBER - this argument may require non-trivial, creative and novel elements.
