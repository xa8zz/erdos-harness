---
id: R44-pro-1-honest-no-proof
type: research
date: 2026-04-19
intent: >
  Assess whether any of the three R44 open lemmas can be proved or refuted
  with the supplied ingredients; provide an honest verdict.
predecessors: [R43-pro-area-C-sharpening-k2-theta, R43-pro-area-B-dense-packet-refuted-common-core]
action:
  kind: standalone
claim: >
  Honest no-proof verdict: the three open lemmas (SFLU-E estimate, full
  freshness, pair-multiplicity O(1) bound) cannot be proved or refuted from
  the supplied ingredients. The state-inequality paradigm is blocked at the
  current level of formulation; no closure is available.
---

I did not search online.

The honest conclusion from the material supplied is:

[
\boxed{\frac{n(\log\log n)^2}{\log n}\ \ll\ L(n)\ \le\ 0.18969,n+o(n)}
]

and the sharp asymptotic order is **not determined** by the established facts listed in the prompt. The natural conjectural answer is

[
\boxed{L(n)=\Theta!\left(\frac{n(\log\log n)^2}{\log n}\right)}
]

which would in particular give (L(n)=o(n)), but the upper bound needed for that conclusion is not presently supplied by the rigorous ingredients as stated.

Here is the precise reason.

Let

[
H=\log\log n,\qquad K(n)=\frac{nH^2}{\log n}.
]

The established Maker/Prolonger construction already gives

[
L(n)\ge c_\delta K(n)
]

for every fixed (\delta<1/4). This is a genuine obstruction to any (O(n/\log n)) upper bound. It comes from rank-three capture: the number of integers up to (n) with three prime factors is of order

[
#{m\le n:\Omega(m)=3}
\asymp \frac{n(\log\log n)^2}{\log n},
]

so the lower-bound scale is exactly the Landau/Sathe–Selberg rank-three scale.

The missing part is the matching upper bound

[
L(n)\ll K(n).
]

The listed tools are very close to such an upper bound, but they do not close it. In particular, the state inequality gives, schematically,

[
\mu(\operatorname{Cl}*h)
\ll
\frac{h}{\log h},\mu(F*{\mathrm{useful}})
+
\frac{N_h}{\log(h/\log h)}.
]

The online harmonic domination estimate

[
\sum_t \mu(u_t)\le N_h
]

controls Shortener’s max-degree choices, but it does **not** by itself give the required bound on the whole weakly useful family (F_{\mathrm{useful}}). One needs a genuinely harmonic useful-shield count, with strong enough freshness/locality, to prevent Prolonger-stale or marker-prime witnesses from accumulating mass outside the charged local windows.

The obstruction list pinpoints exactly why the usual completions fail:

[
\text{weak freshness} \quad+\quad \text{dense/sparse decomposition}
]

does not work, because the common-core Prolonger construction produces weak-fresh useful witnesses with zero local packet collisions and no small-defect absorbers.

Likewise, a fixed expanded-window locality assumption fails because marker-prime families carry positive harmonic mass outside every fixed dyadic-expanded window. The sharpened dense-packet projection still leaves an exceptional family (\mathcal E), and none of the stated rigorous facts bounds (\mu(\mathcal E)) at the scale needed to sum to (O(K(n))).

So the current rigorous implication is only

[
c,\frac{n(\log\log n)^2}{\log n}
\le
L(n)
\le
0.18969,n+o(n),
]

not

[
L(n)=\Theta!\left(\frac{n(\log\log n)^2}{\log n}\right).
]

A complete solution would require an additional theorem of roughly the following form:

[
\sum_{\text{dyadic windows }h}
\mu(F_{\mathrm{useful}}^{(h)})
\ll
\sum_h \frac{N_h}{h}
]

or an equivalent harmonic strong-freshness/local-usefulness estimate that also controls the exceptional low-dimensional degeneracies (\mathcal E). With such a theorem, the state inequality would sum over ranks/windows and give the matching upper bound

[
L(n)\ll \frac{n(\log\log n)^2}{\log n},
]

hence the conjectural sharp rate. But that theorem is not among the established inputs, and several plausible substitutes are explicitly refuted in the obstruction list.

Therefore the strongest rigorous answer supported by the prompt is:

[
\boxed{
L(n)\text{ is known to be at least }
\Omega!\left(\frac{n(\log\log n)^2}{\log n}\right)
\text{ and at most }O(n),
}
]

with the best stated upper bound

[
\boxed{L(n)\le 0.18969,n+o(n).}
]

The evidence and the lower-bound mechanism strongly suggest the sharp rate

[
\boxed{\frac{n(\log\log n)^2}{\log n}},
]

but the supplied rigorous results do not prove (L(n)=o(n)), nor do they rule out (L(n)=\Theta(n)).
