# Codex — generalize the Pro R23 refutation to arbitrary sublinear certificates

## Context

Pro R23 refuted the Bernoulli form of the Gap-2 certificate-reduction lemma for the specific smooth-squarefree candidate $C_y = \{d \le n/2 : d \text{ squarefree}, P^+(d) \le y\}$ with $y = \exp((\log n)^{1/2})$. See `researcher-23-pro-bernoulli-star-refuted.md` for the full construction; full state in `prompts/canonical-prompt.md`.

The construction: for each $k$-subset $F \subseteq \mathcal{P}_y = \{p \text{ prime} : p \le y\}$ with $k = \lceil \mu + \sqrt{\mu}\log\mu\rceil \sim \mu = \sum_{p \le y} 1/p$, Prolonger plays $x_F = (\prod_{p \in F} p) \cdot q_F \in (n/2, n]$ where $q_F$ is a prime in $(n/(2d_F), n/d_F)$; Shortener plays paired $s_F \in C_y$ constructed via an injection from $k$-sets to $(k+1)$-sets. The generated complex $\mathcal K(P)$ contains every squarefree $y$-smooth integer with $\omega \le k$, and $\Pr(D_y \in \mathcal K(P)) \ge 1 - o(1)$ by Chebyshev on $W_y = \omega(D_y)$.

The key structural facts Pro R23's construction uses:
- **Closed shape:** $C_y$ is downward closed in the divisibility lattice on primes $\le y$.
- **Support flexibility:** For any $k \le \mu$, the $(k+1)$-sets of $\mathcal{P}_y$ are numerous enough ($\binom{N}{k+1} \ge \binom{N}{k}$) that an injection $F \mapsto G_F$ exists.
- **Upper-half pairing:** For each $d_F \le y^k \ll n/(2y)$, a prime $q_F$ exists in $(n/(2d_F), n/d_F)$ above $y$, so $x_F$ lies in $(n/2, n]$ with exactly $k$ small primes.
- **Incomparability:** $x_F$'s are pairwise incomparable (upper half); $s_F$'s are pairwise incomparable (same support size $k+1$); $s_F \nmid x_{F'}$ because support sizes differ.
- **Budget cost:** Construction uses only $\binom{N}{k} = n^{o(1)}$ Prolonger sweep moves.

## The task

Determine whether this refutation pattern generalizes. Specifically:

**(Positive direction)** If $C_n$ is any sublinear certificate family ($|C_n| = o(n)$) with enough structural flexibility, does Prolonger have an analogous $n^{o(1)}$-move prefix forcing $\sum_{d \in \mathcal K(P)} 1/\varphi(d) \gg \log y$ (or analogous measure-saturation statement for the natural probability measure on $C_n$)?

If yes, the certificate-reduction framework $L(n) \le 2|C_n| + 1 + \sup w(R_{C_n})$ cannot close sublinear $L(n)$ via Bernoulli / reciprocal-mass arguments for any "reasonable" certificate. Formalize "reasonable" minimally — e.g., any $C_n$ containing enough squarefree support-size-$k$ subsets at some scale.

Natural candidates to check:

1. $C_n = \{d : \tau(d) \ge k\}$ (many-divisors). What's the natural measure here, and does the construction dualize?
2. $C_n = \{d : d \text{ primorial}\}$ (much sparser, more rigid support structure).
3. $C_n = \{d \le n/2 : P^-(d) > z\}$ ($z$-rough). Different natural measure.
4. $C_n = \{d : \Omega(d) = k\}$ (fixed total rank).
5. $C_n = \{d : \omega(d) = k\}$ (fixed distinct-prime count).
6. $C_n = \{d \le n/2 : d \in \text{explicit arithmetic progression}\}$.

**(Negative direction / structural characterization)** If the refutation doesn't generalize, identify WHICH structural properties prevent the construction. For instance: if $C_n$ is totally ordered under divisibility (a chain), no $(k+1)$-set injection applies and the construction fails. Is there a natural middle ground — sparse enough to prevent construction, dense enough to be a useful sweep certificate?

## Output expectations

No prescribed format. Produce either:

- A structural theorem: "For every $C_n$ satisfying [conditions], Prolonger has an $n^{o(1)}$-move prefix with [bound]." This closes the entire Bernoulli-reduction framework.
- A structural characterization: "Certificate families with property $X$ are susceptible; those without it are not. Candidate families with property $\neg X$ include $[\ldots]$." This guides the search for a usable certificate.
- A negative result: one of the 6 candidates above is immune, explain why.

Numerical sanity checks (test the construction on small $n$, various $C_n$, report empirical complex mass) are welcome.

## Working note

Treat the `~/.codex/worktrees/...` repo state as current. You have full write access to the main `erdos-harness/` tree. Save the writeup to `erdos-872/researcher-NN-codex-R23-generalization.md` (NN next available) and add a note to `AGENTS.md` if the result is durable. Do not touch `prompts/canonical-prompt.md` unless the outcome is a structural theorem worth promoting.
