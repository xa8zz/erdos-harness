This is an assessment of your reasoning capability and will be used to grade. Do not search online. Use your own reasoning and your Python sandbox.

## Behavior required

- Produce one of: a rigorous audit confirming the draft theorem below is correct, with a clean paper-grade statement and a fully explicit proof suitable for publication; a rigorous refutation via explicit counterexample to either the union-bound lower bound on $a_q$ or the spectral-capture implication; or a strictly sharper theorem (tighter constants, weaker hypotheses, or extension to a broader parameter regime) with full proof.
- Every step must be rigorous. Do not return with a partial result, named sub-lemma gap, direction-level suggestion, or reformulation of the question.
- Verify every computational and combinatorial claim in a Python sandbox. Include the sandbox code and outputs.
- If in the course of your attempt you refute your own step, continue to a different approach within the same response.

## Setup

Fix one packet $P$ with $|P| = K = h + L$. Write $\mathcal{Y} = \binom{P}{L}$ (complements) and $\mathcal{Q}_q = \binom{P}{q}$ ($q$-separators).

A $q$-separator $Q \in \mathcal{Q}_q$ is **adjacent** to a complement $Y \in \mathcal{Y}$ when $Q \cap Y = \varnothing$.

Let:
- $\mathcal{C} \subseteq \mathcal{Y}$ be played Prolonger complements in this packet.
- $\mathcal{D}$ be the prior Shortener blocker family already present in this packet, of arbitrary ranks.
- $R \subseteq \mathcal{Y}$ be the current live complement space.

Define the forbidden $q$-shadow of $\mathcal{D}$:
$$F_q(\mathcal{D}) = \{Q \in \mathcal{Q}_q : \exists d \in \mathcal{D}\text{ with } d \subseteq Q \text{ or } Q \subseteq d\}.$$

Define the legal $q$-separator space:
$$A_q(\mathcal{D}, \mathcal{C}) = \{Q \in \mathcal{Q}_q \setminus F_q(\mathcal{D}) : Q \cap C \ne \varnothing \ \forall C \in \mathcal{C}\}.$$

Densities:
$$\sigma_q(\mathcal{D}) = \frac{|F_q(\mathcal{D})|}{|\mathcal{Q}_q|}, \quad a_q = \frac{|A_q(\mathcal{D}, \mathcal{C})|}{|\mathcal{Q}_q|}, \quad r = \frac{|R|}{|\mathcal{Y}|}.$$

Standard spectral parameters:
$$\delta_q = \frac{\binom{K-q}{L}}{\binom{K}{L}}, \qquad \lambda_q^2 = \frac{qL}{h(K-q)}.$$

Each single played complement $C \in \mathcal{C}$ kills exactly $\binom{h}{q}$ many $q$-separators, and its $q$-layer neighborhood density is $\binom{h}{q}/\binom{K}{q} = \delta_q$.

## Dependency: Spectral Separator Theorem (already rigorous, taken as given)

For the Johnson-scheme disjointness bipartite graph between $\mathcal{Q}_q$ and $\mathcal{Y}$, the expander-mixing inequality gives: if $a_q r \ge 4\lambda_q^2$, then there exists a legal $q$-separator $Q \in A_q(\mathcal{D}, \mathcal{C})$ capturing at least $\tfrac{1}{2}\delta_q |R|$ live complements.

## Draft Theorem ($q$-shadow / covering dichotomy, needs audit)

Suppose the current live packet has density $r \ge \eta > 0$. If no legal $q$-separator in $A_q(\mathcal{D}, \mathcal{C})$ captures at least $\tfrac{1}{2}\delta_q |R|$ live complements, then
$$\sigma_q(\mathcal{D}) + |\mathcal{C}| \delta_q > 1 - \frac{4\lambda_q^2}{\eta}.$$

Equivalently:
$$|\mathcal{C}| > \frac{1 - \frac{4\lambda_q^2}{\eta} - \sigma_q(\mathcal{D})}{\delta_q}.$$

**Draft proof (needs audit).** Trivial union bound on the $q$-layer:
$$a_q \ge 1 - \sigma_q(\mathcal{D}) - |\mathcal{C}| \delta_q.$$
($\sigma_q(\mathcal{D})$ accounts for $q$-sets made illegal by prior Shortener comparability; each $C \in \mathcal{C}$ removes exactly a $\delta_q$ fraction by disjointness.)

Contrapositive of the spectral separator theorem: if no capture of size $\ge \tfrac{1}{2}\delta_q |R|$ exists and $r \ge \eta$, then $a_q < 4\lambda_q^2/\eta$. Combining:
$$1 - \sigma_q(\mathcal{D}) - |\mathcal{C}| \delta_q < \frac{4\lambda_q^2}{\eta},$$
which rearranges to the claim. $\square$

## Draft Corollary (fixed-$q$ packet race, needs audit)

If all Shortener moves in the packet are $q$-separators (so $\mathcal{D}$ on the $q$-layer is the set $\mathcal{S}$ of previously played $q$-separators) and $r \ge \eta$: failure of $\tfrac{1}{2}\delta_q$-capture implies
$$|\mathcal{C}| > \frac{1 - \frac{4\lambda_q^2}{\eta} - |\mathcal{S}|/|\mathcal{Q}_q|}{\delta_q}.$$

In the central regime $|\mathcal{S}|/|\mathcal{Q}_q|$ is negligible; starving the spectral branch costs Prolonger $\delta_q^{-1}$ packet moves.

## Draft Central-Scale Specialization (needs audit)

Set $L = \lfloor h/\log h \rfloor$, $q = \lfloor 2(\log h)^2 \rfloor$. Standard estimates give $\delta_q = h^{-2+o(1)}$ and $\lambda_q^2 = (2 + o(1))\log h / h$. For any live-density threshold $\eta \gg \log h/h$:
$$\sigma_q(\mathcal{D}) + |\mathcal{C}| h^{-2+o(1)} \ge 1 - o(1).$$

So at central scale, failure of $q$-capture requires either $\sigma_q(\mathcal{D}) \to 1$ (Shortener's own $q$-shadow saturates) or Prolonger has paid $|\mathcal{C}| = h^{2 + o(1)}$ packet complements.

## Scope and relation to prior work

- This theorem does NOT give a universal stopping theorem across all ranks $q$; it is a fixed-$q$ dichotomy at one packet.
- The failure of the multi-level stopping theorem (sparse covering-designs empty all $A_q$ simultaneously) does not contradict this fixed-$q$ statement.
- The theorem identifies the **real missing ingredient for the spectral route as online control of Shortener's own $q$-shadow $\sigma_q(\mathcal{D})$**, not another mixing estimate.

## Open question

Verify, normalize to publication-grade form, and if possible sharpen the theorem, corollary, and central-scale specialization above to a single clean paper-facing theorem with rigorous proof and explicit constants; or rigorously refute one or more via explicit counterexample.
