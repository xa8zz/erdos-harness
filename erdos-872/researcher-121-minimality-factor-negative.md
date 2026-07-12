---
id: R121-minimality-factor-negative
type: research
date: 2026-07-12
intent: >
  Full solution attempt with the post-formulation-war dossier (deep-layer
  theorem, audited surviving-shadow, eleven collapse families): prove or
  disprove L(n) = o(n).
predecessors: []
action:
  kind: standalone
claim: >
  No unconditional proof or disproof. The deep-layer theorem does not
  complete the upper bound (bounded depth does not bound the per-layer
  mass), the continuation lemma does not repair it (minimality does not
  supply the missing n/H factor), and the degree theorem does not
  self-amortize. Contributes a genuine chronology-sensitive lemma
  (Boolean-cube chronology with amortization charging regeneration to
  arithmetic factor growth) and isolates the exact global multiplicity
  statement still missing; any shortcut re-commits the lifetime-
  capacity, static-moment, or little-o-composition errors already ruled
  out. Fifth independent free-roam concurrence on the separator.
implications:
  - The missing global multiplicity statement matches the online-area
    object identified by the concurrent formulation-loop terminus.
verifiers_at_time: []
confidence_at_time: medium
strategy_dependence: independent
prompt: erdos-872/prompts/researcher-R121-freeroam-post-formulation-war.md
---

# Verdict

I do not have a valid unconditional proof or disproof of \(L(n)=o(n)\). More importantly, the collection of established results in the prompt does **not** yet imply either conclusion. An unconditional argument would have to prove a new chronology-sensitive theorem beyond the supplied facts. Claiming that the static-completion, peeling, degree, or fortress results already settle the problem would introduce a genuine quantifier error. 

Below is the precise audit, followed by a new first-blocker lemma that isolates the remaining multiplicity problem.

## 1. Why the deep-layer theorem does not complete the upper bound

Let

\[
\Phi_n(\alpha)=
 \sup_{\substack{P\text{ primitive}\\ |P|\le \alpha n}}
 \frac{|\mathcal M(P)|}{n}.
\]

The static-completion theorem says exactly that

\[
\alpha_n\longrightarrow0
\quad\Longrightarrow\quad
\Phi_n(\alpha_n)\longrightarrow0.
\tag{1}
\]

After peeling through \(n/H\), the selected position has density \(O(1/H)\). Sweeping one minimal layer can add as many as twice its cardinality, because every Shortener move may be accompanied by one Prolonger move. Hence the only formal recurrence supplied by static completion is of the form

\[
\alpha_{j+1}\le \alpha_j+2\Phi_n(\alpha_j).
\tag{2}
\]

For every fixed \(j\), (1) implies \(\alpha_j=o(1)\). But the deep-layer theorem requires control through

\[
j\le C\log\log H,
\]

which grows with \(H\).

The inference from fixed \(j\) to \(C\log\log H\) is invalid. To see this rigorously, note that (1) is compatible with the modulus

\[
\Phi(\alpha)=\sqrt{\alpha}.
\]

Even under the more favorable recurrence

\[
\alpha_{j+1}=\sqrt{\alpha_j},\qquad \alpha_0=H^{-1},
\]

one obtains

\[
\alpha_j=H^{-1/2^j}.
\]

At

\[
j=\left\lfloor\log_2\log H\right\rfloor,
\]

we have \(2^j\asymp\log H\), and consequently

\[
\alpha_j=\exp\!\left(-\frac{\log H}{2^j}\right)
        =\Theta(1).
\]

Thus an \(o(n)\)-sized layer at every fixed depth is compatible with a positive-density layer by depth \(O(\log\log H)\). The quadratic semiprime-regeneration mechanism in the prompt is a concrete divisibility analogue of precisely this possible iteration.

So the combination

\[
\text{static completion}+\text{deep-layer theorem}
\]

does not prove \(L(n)=o(n)\).

## 2. Why the continuation lemma does not repair this

After the \(n/H\)-peel, suppose \(C\) is a maximal legal completion. The continuation lemma gives

\[
\text{remaining moves}\le (2H+1)|C|.
\tag{3}
\]

Static completion supplies only \(|C|=o(n)\). It does not supply

\[
|C|=o(n/H),
\tag{4}
\]

which is what (3) requires.

There is no valid “choose \(H\) slowly” argument. For instance, the modulus

\[
|C|=\frac{n}{\log H}
\]

is compatible with \(|C|=o(n)\) whenever \(H\to\infty\), but then

\[
\frac{H|C|}{n}=\frac{H}{\log H}\longrightarrow\infty.
\]

This is a real fixed-point obstruction, not merely a missing choice of parameters.

## 3. Why the degree theorem does not self-amortize

If the selected position has density about \(1/H\), the available degree lower bound may be only on the order of

\[
r(H)=O(\log\log H).
\]

Over \(n/H\) Shortener turns, the resulting guaranteed direct progress is only

\[
\frac nH\,r(H)
   =n\,\frac{O(\log\log H)}{H}
   =o(n).
\]

More abstractly, if the degree modulus at selected density \(\alpha\) is \(g(\alpha)\to\infty\), then the progress before density \(\alpha\) is controlled only by

\[
n\int_0^\alpha g(s)\,ds.
\]

A divergent \(g(s)\), such as \(g(s)=\log\log(1/s)\), may still be integrable at zero:

\[
\int_0^\alpha \log\log(1/s)\,ds
   \sim \alpha\log\log(1/\alpha)
   \longrightarrow0.
\]

Therefore pointwise degree divergence does not imply that a positive fraction of a shell is removed in sublinear time. This is exactly why the chronological area \(\sum_i\Delta_i\), rather than the endpoint degree, is load-bearing.

## 4. A genuine chronology-sensitive lemma

There is nevertheless a useful no-reuse fact that is stronger than the invalid move-indexed first-witness normalization.

### Lemma: prime-co-divisor no reuse

Let \(u\) be currently legal, and let \(p\ne q\) be distinct prime divisors of \(u\). Put

\[
d_p=\frac{u}{p},
\qquad
d_q=\frac{u}{q}.
\]

No selected move \(a\), while \(u\) remains legal, can be a multiple of both \(d_p\) and \(d_q\).

### Proof

For distinct primes \(p,q\mid u\),

\[
\operatorname{lcm}\left(\frac{u}{p},\frac{u}{q}\right)=u.
\]

Indeed, at the \(p\)-adic valuation the second co-divisor retains the full valuation of \(u\), at the \(q\)-adic valuation the first one does, and at every other prime both retain it.

If both \(d_p\mid a\) and \(d_q\mid a\), then

\[
u=\operatorname{lcm}(d_p,d_q)\mid a.
\]

But a selected \(a\) with \(u\mid a\) makes \(u\) illegal. This contradicts the assumption that \(u\) remains legal. ∎

Consequently, if \(u\) remains legal while \(r\) different co-divisors \(u/p\) become illegal, those \(r\) first deaths require \(r\) distinct selected moves. Unlike the invalid move-index normalization described in the prompt, this statement is indexed by the face–prime pair \((u,p)\), and it is immune to the example where one move has different traces for different faces.

## 5. The exact global multiplicity still missing

The preceding lemma controls reuse **for one target**. It does not control how many different targets one move can serve.

Indeed, a selected move \(a\) can first block \(u/p\) precisely when there is an integer \(q\ge2\) such that

\[
a=\frac{u}{p}\,q,
\qquad\text{or equivalently}\qquad
u=a\,\frac pq .
\tag{5}
\]

For a shell \(u\in(X/2,X]\), the possible incidences of a fixed \(a\) are therefore parametrized by divisors \(q\mid a\) and primes \(p\) satisfying

\[
\frac{Xq}{2a}<p\le\frac{Xq}{a},
\qquad p\nmid q.
\tag{6}
\]

Thus even though a fixed move contributes at most one co-divisor death to each surviving \(u\), it may contribute one death to many different \(u\)'s. Shared-core grids and Boolean refinement histories exploit exactly this second multiplicity.

A chronology theorem strong enough to settle the upper bound would have to establish something like the following. Let \(b(u,p)\) be the first move that makes \(u/p\) illegal, and let \(\Delta_i\) be the shell maximum degree immediately before move \(i\). For a suitably large certificate family \(\mathcal P(u)\), one would need

\[
\sum_i
 \#\{(u,p):u\in Q_{\rm surv},\ p\in\mathcal P(u),\
                    b(u,p)=i\}
 \le
 o\!\left(\sum_{u\in Q_{\rm surv}}|\mathcal P(u)|\right)
 +O\!\left(
       \overline{|\mathcal P|}
       \sum_i\Delta_i
     \right).
\tag{CF}
\]

The first term permits the usual sieve and Rankin exceptions. The second must charge first-blocker incidences to **accumulated maximum-degree area**, not to \(t\Delta_t\), not to the final degree, and not to a lifetime capacity attached to one old spoiler.

Why would (CF) settle the problem? Suppose a block has \(T=X/h\) turns and the surviving population is still a fixed fraction of \(X\). If the certificates have average size \(\mu\gg h\), then the left-hand side is \(\gg X\mu\). Since \(\Delta_i\) is nonincreasing for a fixed residual shell population,

\[
X\Delta_T
 \le X\frac{\sum_{i<T}\Delta_i}{T}
 =h\sum_{i<T}\Delta_i.
\]

Combining this with (CF), and taking \(\mu/h\to\infty\), forces

\[
\sum_{i<T}\Delta_i\gg X.
\]

But that area consists of actual direct kills, so a fixed fraction of the shell has disappeared. This is precisely the contraction required by (OA).

The supplied lifetime counterexamples show why the known instantaneous Sperner bound does not prove (CF): a single old spoiler may contribute once to each of exponentially many targets exposed at different refinement times. The co-divisor lemma prevents reuse within one target but does not prevent this grid-like reuse across targets.

## 6. The lower-bound direction also remains incomplete

The available fortress theorem cannot disprove \(L(n)=o(n)\).

At a growing cap \(H(n)\to\infty\), it yields only

\[
L(n)\ge \frac{c n}{H(n)}
\]

or, for subpolynomial \(H\),

\[
L(n)\ge n^{1-o(1)}.
\]

But \(n^{1-o(1)}\) need not be \(\Omega(n)\). For example,

\[
\frac{n}{\exp(\sqrt{\log n})}=n^{1-o(1)}
\]

is still \(o(n)\).

Obtaining a positive-density lower bound would require either:

\[
H=O(1),
\]

which is ruled out by the fixed-cap entry theorem, or a new amplification that converts \(n/H(n)\) protected moves into \(c n\) moves. No such amplification is among the established facts. Moreover, a lower bound must survive arbitrary Shortener replies, so the policy-specific trace-anchor histories do not suffice.

# Conclusion

The supplied results establish neither

\[
L(n)=o(n)
\]

nor

\[
L(n)\not=o(n).
\]

The exact unresolved obstruction is global chronological multiplicity: one must control how many different surviving targets can reuse the same earlier blocker through successive refinements, with the charge paid from the accumulated degree area. The prime-co-divisor lemma above gives a true no-reuse invariant per target, but the cross-target inequality (CF) is still missing. Presenting a “full proof” without that step would repeat one of the lifetime-capacity, static-moment, or little-\(o\)-composition errors already ruled out in the prompt.