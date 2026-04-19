# Codex adversarial audit of the R35 closure candidates

## Verdict

**Both candidate proofs break at the same load-bearing step: the jump from a state inequality to a game-length bound, i.e., the online amortization of useful scored/stolen boundary mass.** The static arithmetic closure estimate is probably the real advance; the closure of $L(n) = o(n)$ is NOT yet proved.

This audit independently confirms the critique from Pro A R35 (researcher-35-pro-A-online-domination-partial-with-critique.md). Both the fresh Pro and Codex candidate proofs stop at the static estimate; neither proves the required online cardinality bound.

## The specific gap

Both candidates establish:
$$\mu(\operatorname{Cl}_h) \ll (h/\log h) \cdot (\text{useful boundary mass}) + N_h/\log h.$$

To get $\text{rank-}h\text{ contribution} \ll N_h/\log h$, one must prove
$$|F_{\text{useful}}| \ll N_h/h$$
under $\sigma$. Without this, the state inequality is self-referential and does not bound game length.

Pro A proved a WEIGHTED online domination lemma ($\sum_t d_t'(u) \le \binom{h}{k} N_h$) but that's degree-weighted, not cardinality. Neither fresh Pro nor Codex bridges from weighted to cardinality.

## Four independent findings

1. **Fatal gap**: both proofs go from "state inequality" to "translate to $L(n)$" without proving the cardinality bound. The repo's own accepted R35 note flags this exact step as not automatic.

2. **Codex's "interleaving doesn't create load" is the unproved claim.** Candidate 2 (Codex) asserts move order is irrelevant; the accepted R35 note says the ONLY surviving obstruction is dynamic ordering. Codex does not solve item (3); it asserts it away.

3. **Fresh Pro's weighted counting lemma does not bypass the R34 obstruction alone.** Even granting the weighted incidence bound, you still need an online bound on the mass of USEFUL captured top facets. The factor-$\log h$ issue from R34 was only part; the real issue is dynamic usefulness.

4. **The two proofs are not independent.** Both use the same arithmetic locality $q/p \asymp 1$, same thick/thin split, same $N_h/\log h$ entropy term. Cross-derivation of the static estimate, not cross-derivation of the closure.

## What looks sound

**The static arithmetic estimate may well be correct.** No fatal asymptotic mistake in:
- Locality claim $q/p \in (1/2, 2)$ (follows from both witness and target lying in upper half).
- Thick-case fractional charging.
- Thin-case $N_h/\log h$ entropy calculation.

So the RIGHT READING is: **static state estimate may be correct; closure claim is not.**

## Precise remaining gap

The theorem that's still needed (Pro A already spelled it out):
$$|F_{\text{useful}}| \ll N_h/h$$
or equivalently: Prolonger cannot accumulate more than $O(N_h/h)$ locally useful stolen boundaries before Shortener's max-degree replies erase comparable mass. That is the real online promotion.

## Literature connections

- **Thin-part entropy** resembles friable/smooth-number technology (Hildebrand-Tenenbaum).
- **Local replacement-window** step resembles divisor-in-an-interval geometry (Ford 2008).
- **Online step** is NOT an off-the-shelf corollary of online set cover (Alon-Awerbuch-Azar-Buchbinder-Naor 2003, Gupta-Krishnaswamy-Kumar-Panigrahi 2016 are too weak or wrong model).
- **No contradiction** with primitive-set literature (Vijay 2018, Liu-Pach-Palincza 2021).

## Implication for the program

- Static state estimate (dyadic windows + thickness + exponential tilting): promotable as an intermediate theorem.
- Full closure $L(n) = o(n)$: NOT proved by R35 candidates.
- Next step: prove the online amortization cardinality bound, either via a "lower-defect star-breaker" (Pro A's proposed form) or an equivalent dynamic mechanism.

## Corresponding update to harness state

The R35 closures should be downgraded from "cross-derived candidate closure, pending verification" to "cross-derived static estimate, genuine advance; online amortization remains open." The gap is now even more sharply isolated than before R35, because the static portion is confirmed as sound (pending further verification) and only the dynamic amortization remains.
