# Round 19 Codex closeout handoff — Lemma A false; 2-shadow control is the remaining gap

A codex also came back:
I wrote the closeout here: [researcher-19-codex-matching-T2-closeout.md](/Users/omisverycool/erdos-harness/erdos-872/researcher-19-codex-matching-T2-closeout.md:1).

The outcome is negative but much sharper. The “\(k\le 2\) because \(\alpha>1/3\)” idea is false: the real maximum number of small prime factors is
\[
k_{\max}(n,y)=(1+o(1))\frac{\log n}{\log\log n},
\]
because the only real constraint is the primorial bound \(p_k^\#\le n\), and \(p_k\sim \log n\ll y=n^\alpha\).

More importantly, the harmonic-sum route fails decisively. I proved that for
\[
\mathcal D_y(n)=\{d\le n:\ d\text{ squarefree},\ P^+(d)\le y,\ \omega(d)\ge 2\},
\]
one actually has
\[
\sum_{d\in\mathcal D_y(n)}\frac1d \asymp_\alpha \log n,
\]
not \(O((\log\log n)^2)\). So the canonical-core charging idea cannot close T2 in its current form.

I also checked Route B. The raw count of small semiprimes is well within budget, but dynamic installation still does not close: a single high-support Prolonger move can preempt many semiprimes at once, and a semiprime killed by divisibility is not in the antichain, so it does not automatically kill the whole future fiber. So the matching-T2 upper bound still does not follow from my framework. The remaining obstruction is now very precise: we need an online theorem controlling the 2-shadow of high-support small-prime Prolonger moves.
