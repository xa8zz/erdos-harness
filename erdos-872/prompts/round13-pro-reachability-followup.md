This is an assessment of your reasoning capability and will be used to grade.

Sub-question (c) — the sparse-subset closeout — matches an independent derivation from the same brief: identical three-family construction $S = S_{QA} \cup S_{AB} \cup S_{QB}$, identical size decomposition ($|S_{QA}|, |S_{AB}| = o(n/\log n)$; $|S_{QB}| = O_{\beta,\gamma}(n/\log n)$ via Mertens), identical residual count $\gg n \log\log n / \log n$ via Mertens on $\sum_{q \in Q} 1/q \cdot \sum_{a \in A} 1/a$, identical isolation via the Circuit Lemma, matching numerical witness $|S|/|R| \approx 0.545$ at $n = 10^6$ for representative parameters. Treat (c) as established.

Attempt to resolve (a) and (b): the online-reachability question. Specifically, does Prolonger have a strategy that forces installation of an $S$-family of the above form against every Shortener response, or does optimal Shortener online-prevent any such installation?

If the former, the lower bound $L(n) \ge c \cdot n \log\log n / \log n$ is established and combined with the $5n/16$ upper bound gives the sharp rate (up to a $\log\log n$ factor). If the latter, $L(n) = O(n/\log n)$ on this regime, and combined with the $n/\log n$ lower bound gives the sharp rate in the other direction.

A structural obstruction either way — Shortener strategy with a uniform bound, or Prolonger strategy with a uniform reach — closes the central question.
