# Codex — residual-width lemma refuted by λ_n(c) counterexample

I pushed this to a definitive outcome, and it’s negative for the current framework.

The writeup is here: [researcher-20-codex-residual-width-framework-refuted.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-20-codex-residual-width-framework-refuted.md). I also added a short note to [current_state.md](/Users/omisverycool/erdos-harness/erdos-872/current_state.md).

The key result is a clean counterexample. For any certificate family \(C \subseteq \{2,\dots,n\}\), define
\[
\lambda_n(c)=c\Big\lceil \frac{\lfloor n/2\rfloor+1}{c}\Big\rceil \in (n/2,n].
\]
Then \(A=\{\lambda_n(c):c\in C\}\) is an antichain with \(|A|\le |C|\) and \(C\subseteq \mathrm{Comp}(A)\), but
\[
w(R(A)) \ge |(n/2,n]|-|A| \ge \frac n2-|C|-O(1).
\]
So the Round 19 residual-width lemma is false as stated. Applied to \(C_{n,h}=\{m\le n:\Omega(m)\le h\}\), any sublinear \(C_{n,h}\) still allows residual width \((1/2+o(1))n\), not \(n/(\log n)^{1-o(1)}\).

So this closes the question pretty sharply: the domination-only residual-width route is dead. If we want to salvage anything in that direction, the lemma has to use genuinely dynamical information about the actual game antichain \(A_0\), not just \(C\subseteq\mathrm{Comp}(A)\) and \(|A|=O(|C|)\).

Maintenance pass is done too: auth/tooling still looks good, and there weren’t any durable setup changes worth persisting from this turn.
