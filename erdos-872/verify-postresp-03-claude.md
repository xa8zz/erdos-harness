# Audit — Claude cross-compare of S* Shortener response (Round 3) + Vaccinated Shield (Round 4)

**Source:** Claude (re-run of the earlier audit that got cut off by API error).
**Scope:** cross-compares Round 3 Pro response (`researcher-02-shortener-response.md`) with Round 4 Pro response (`researcher-03-vaccinated-shield.md`), assessing both + their alignment.
**Extracted:** 2026-04-17 late.

---

This new document is interesting because it operates on a **different axis** than my audit — and once you see which axis, the alignment and the gap both become clear.

## Axis

My audit was Shortener-side and empirical: "are the Pro response's simulations of $P_{\text{pb}}, P_{\text{sh}}$ vs $S^\star$ actually good evidence for $L(n) \in \Theta(n/\log n)$?" I concluded they're not (heuristics were shown to be ~80% of optimal Pro-vs-$S^\star$ already at $n \in [30, 40]$; the "stable constant" shifted from 1.5 to 1.87 when I swapped in $P_{\text{harm}}$).

The new document is Prolonger-side and theoretical: "if Prolonger wants to prove $L(n) \ge \varepsilon n$ using a shield-style certificate with a small lower prefix, what does the certificate have to look like?" It doesn't simulate anything; it proves a clean obstruction theorem.

Neither answers the other's question. Both are valid; they're orthogonal.

## Where we genuinely converge

The single most striking agreement is the **central quantity**. My $P_{\text{harm}}$ weights blocked small primes by $1/p$. The new document's entire obstruction turns on $\sigma(D) = \sum_{d \in D} 1/d$ and the Mertens sum $\sum_{p \in Q_\delta} 1/p$. That isn't coincidence — it's because Mertens-type density is the combinatorially correct weighting on both sides of this problem. My empirical result that weight-by-$1/p$ beats weight-by-1 by 14-21% in simulation is essentially the same fact as the document's requirement that $\sigma(D) \to 1$ be measured harmonically. The new document lends after-the-fact theoretical support to the specific Prolonger strategy I reconstructed.

That's a nice cross-check on a structural level.

## What the new document actually establishes

Carefully: it proves that **a particular proof technique fails in a particular regime**. Specifically: shield-based proofs of linearity where the lower prefix $D_n$ has $|D_n| = n^{o(1)}$ are vacuous unless $\sigma(D_n) = 1 - o(1)$. The corollary ("any $D_n \subseteq [n^\varepsilon, n/2]$ subpolynomial is ruled out") is clean and useful.

But notice what it is *not*:

1. **It is not a proof that $L(n) = o(n)$.** It closes off one attack vector on the linear lower bound. It does not construct a Shortener strategy forcing sublinearity. The central open question is untouched.

2. **It is not even a proof that no shield-based linear lower bound exists.** The restriction $|D_n| + |P_n| = n^{o(1)}$ is doing real work. If Prolonger plays $|P| = n^{1/2}$ uppers and $|D| = n^{0.1}$ lowers, the obstruction theorem as stated doesn't apply. The document acknowledges this implicitly ("subpolynomial") but doesn't explore the polynomial regime.

3. **A fixed finite $D$ can get remarkably close to $\sigma = 1$.** The Sylvester–Fibonacci sequence $\{2, 3, 7, 43, 1807, \ldots\}$ gives $\sigma_k = 1 - 1/(a_1 \cdots a_k)$, which is $1 - 6 \times 10^{-7}$ by $k = 5$. The document's language — "forces many genuinely small numbers into play" — slightly oversells the difficulty. "Many" is doing a lot of work there; five fixed small numbers get you within $10^{-6}$ of 1, and the obstruction becomes quantitative rather than qualitative.

Put differently: the document's conclusion "$\sigma(D_n) = 1 - o(1)$" is necessary, but it can be achieved with $|D_n| = O(\log \log n)$ or even a fixed constant with pre-chosen elements. So the obstruction rules out a *family* of proof attempts, but not all subpolynomial-$|D|$ attempts.

## What it doesn't address that my audit did

- **$S^\star$'s actual minimax-Shortener status.** I flagged that $S^\star$ is a predictability-maximizing strategy and that no alternative Shortener strategies were tested. The new document operates inside a framework where the Shortener is essentially implicit. If the true minimax Shortener is something adaptive or composite-heavy, neither the Pro response's simulations nor this document touch it.

- **The $\Theta(n/\log n)$ vs $\Theta(n)$ ambiguity at visible scales.** The document doesn't do new computation. It can't distinguish my $L^\star/n \approx 0.42$ at $n = 40$ from sublinear extrapolation any better than I could.

- **Prolonger heuristics far from optimal.** My central audit finding — that the heuristic-to-optimal Pro gap at $n \le 40$ is ~20% and unexplored at scale — is completely outside the document's scope.

## One technical step worth checking carefully

The document's main calculation:
$$w_{D_n}(p) \ge \frac{(1-\sigma(D_n)) n}{2p} + O(|D_n|)$$
relies on the union bound step: "multiples of $p$ in $U$ killed by $D$" $\le \sum_{d \in D} |\{u : pd \mid u\} \cap U|$. I verified this: if $d$ is played in $A$, multiples of $d$ in $U$ are killed, so multiples of $pd$ in $U$ (which are both multiples of $p$ and of $d$) are killed. Union bound applies. Arithmetic from $\lfloor n/p \rfloor - \lfloor n/2p \rfloor - \sum_d (\lfloor n/pd \rfloor - \lfloor n/2pd \rfloor)$ to $\frac{(1-\sigma(D))n}{2p} - O(|D|)$ is straightforward. The Mertens step to get $\sum_{p \in Q_\delta} 1/p \ge \log(\log n / \log(m_n \log n)) + O(1)$ uses the correct log-mass-to-harmonic-sum optimization (smallest primes maximize $\sum 1/p$ for fixed $\sum \log p$).

Math checks out. This is a correct theorem.

## One framing concern

The document writes: "Any strategy of the form 'play a subpolynomial number of medium/large lower-half moves, then invoke a shield argument' is asymptotically ruled out." This is technically about proof strategies (ways to *argue* $L \ge \varepsilon n$), not game strategies (ways to *play*). A Prolonger who plays subpolynomial medium lowers could still force linear game length; it just can't *prove* so via shield. The language sometimes conflates the two.

Also — the implicit tilt of the document is toward Shortener: "a successful shield-after-prefix strategy cannot come from bounded local cleanup" reads as support for the sublinear hypothesis. But strictly, it's neutral: blocking one proof direction doesn't make the opposite conclusion more true. Bayesian update in that direction is warranted but small.

## How the picture looks after both

Three pieces now on the table:

1. **Pro response's original simulations**: weak evidence for $\Theta(n/\log n)$ against $S^\star$, using suboptimal Prolongers. My audit: over-updating, data is noisier than stated.

2. **My $P_{\text{harm}}$ extension**: 14-21% better than $P_{\text{pb}}$, stable constant around 1.87 instead of 1.5. Also consistent with both $\Theta(n/\log n)$ with a larger constant, and with $\Theta(n)$.

3. **New document's obstruction**: rules out a broad class of Prolonger shield-based proofs of linearity. Weak evidence tilt toward sublinear; not a proof.

Taken together, the state of the question is:

- We have no proof $L(n) = o(n)$.
- We have no proof $L(n) = \Theta(n)$.
- A specific broad family of Prolonger proof attempts for $\Theta(n)$ is now rigorously closed.
- Simulations with non-optimal heuristics against one Shortener strategy remain consistent with either answer.
- The central combinatorial quantity on both sides is harmonic ($\sum 1/p$, $\sum 1/d$), which is the real technical content both pieces of work independently converge on.

Net: my audit's main complaint — that the epistemic shift to "very plausibly $\Theta(n/\log n)$" was over-confident — is **unchanged**. The new document doesn't supply the missing evidence. It does supply a genuine theoretical advance that sharpens what the open question actually is.

Honest update: I'd now say "sublinearity is the slightly more plausible outcome, but the evidence is still weak, and the asymptotic is genuinely unresolved." That's a small shift in the same direction the Pro response was pushing, but not to the confidence level they claimed.
