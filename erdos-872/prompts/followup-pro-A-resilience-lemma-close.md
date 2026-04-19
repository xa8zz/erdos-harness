Your R29 narrowing — correcting the random-cover calculation to $g(h) = O(\log h)$, proving the static-vs-online lower principle, and isolating the resilience statement
$$|\operatorname{Cl}_h(R, C)| \le O(\log h \cdot \mathfrak{B}_h(R, C) + \text{already scored})$$
as the exact missing theorem — is the sharpest the program has been. $g(h) = O(1)$ is ruled out from top-facet cleanup alone, and $g(h) = O(\log h)$ is enough to close $L(n) = o(n)$.

Push on closing the resilience lemma directly.

Specific attacks worth trying:

1. **Static + local repair with martingale accounting.** Start with the $O(\log h)$ static random cover $T_0$ from the corrected calculation. Track $|\operatorname{Cl}_h(R, C)|$ as a stochastic process under Prolonger's stealing. Each stolen edge $S$ removes $h$ top facets from $T_0$; expected number of newly fully-closed targets is bounded by second-moment independence across shared top facets (a hyperedge $S'$ becomes newly closed only if ALL $h$ of its top facets are among stolen-plus-already-scored). If the shared-facet degree is bounded uniformly by $O(\log h)$, the expected per-steal increase in $|\operatorname{Cl}_h|$ is $O(\log h)$, which closes the lemma.

2. **Weighted potential with cross-layer coupling.** Define
$$\Phi(R, C) = \sum_{k=1}^h w_k |C_{h-k}| + w_{\text{score}} \cdot (\text{scored targets}),$$
with weights $w_k$ chosen so that each Prolonger steal and each Shortener claim have bounded amortized effect on $\Phi$. The rate identity $V_{h,k}/\binom{h}{k} = N_h/D_{h,k}$ gives no drift at a fixed layer, but cross-layer coupling $w_k/w_{k+1} = h/k$ or similar may give positive drift when the potential is summed. Check whether any $w_k$ choice forces $\Phi$ Maker-first nondecreasing up to a $\log h$ factor.

3. **Second-moment estimate on fully-closed targets.** A rank-$h$ target $S$ is in $\operatorname{Cl}_h(R, C)$ iff all $h$ top-facet certificates lie in $C$. Under independent captures with probability $p$, $\Pr[S \in \operatorname{Cl}_h] = p^h$. The expected count is $N_h p^h$. For Shortener's claimed fraction $p = (\text{vertices claimed})/V \sim \log h/h$, expected count is $N_h (\log h/h)^h = N_h e^{h \log\log h - h \log h} = N_h e^{-h(\log h - \log\log h)} \to 0$ rapidly. The second moment needs dependence control — key question is whether the $h$ captures for a given target are nearly independent under Prolonger's adversarial stealing.

4. **Direct derandomization of the static cover via method of conditional expectations.** The static $O(\log h)$ cover is probabilistic; derandomizing it to an explicit online construction is the final step. Shortener claims vertices in order that maintains the conditional-expected uncovered-target count at its initial value; after a Prolonger steal, the conditional expectations adjust and Shortener picks the next vertex to minimize increase in expected $|\operatorname{Cl}_h|$. Prove that this greedy scheme stays within $O(\log h \cdot N_h/H)$ total vertices claimed.

5. **Refutation / sharper negative.** If the resilience lemma is false, construct an explicit Prolonger stealing sequence against any online Shortener strategy that forces $|\operatorname{Cl}_h|$ to grow by $\omega(\log h)$ per $\mathfrak B_h$-unit. This would refute $L(n) = o(n)$ via this framework (leaves open other sublinear frameworks, but closes the transversal route).

6. **Partial result with weaker $g(h)$.** Any $g(h) = O(h^{1-\varepsilon})$ or even $g(h) = O(h/\log h)$ is strictly better than trivial and gives sublinear $L(n)$. Partial results of this form are immediately promotable.

Numerical sanity checks at small $h$ (3, 4, 5) on the online transversal game — if you produce explicit Shortener strategies and test against various Prolonger stealing patterns, the empirical $g(h)$ trend is useful signal for whether $O(\log h)$ is achievable.
