# Current Research — Turán's Tetrahedron Conjecture (π(K₄⁽³⁾)) — Erdős Problem #500

Last updated: 2026-04-23. Working literature survey — not a round doc. Update when new results appear.

**erdosproblems.com:** [Problem #500](https://www.erdosproblems.com/forum/thread/500) — OPEN, $500 prize.
**Original references:** [Er61], [Er71, p.104], [Er74c, p.81], [Er81].
**General case:** [Problem #712](https://www.erdosproblems.com/forum/thread/712) — π(K_k^r) for all k > r > 2; $500 per (k, r), $1000 for the whole family.
**Forum activity:** 0 comments on #500 as of 2026-04-23.
**Lean formalisation status:** none on erdosproblems.com as of 2026-04-23.

## 1. The problem in one paragraph

Let K₄⁽³⁾ denote the complete 3-uniform hypergraph on 4 vertices (4 vertices, all 4 triples — the "tetrahedron"). For a 3-uniform hypergraph H on n vertices containing no K₄⁽³⁾ sub-hypergraph, set

$$\mathrm{ex}_3(n, K_4^{(3)}) = \max |E(H)|.$$

The **Turán density** is

$$\pi(K_4^{(3)}) = \lim_{n \to \infty} \frac{\mathrm{ex}_3(n, K_4^{(3)})}{\binom{n}{3}}.$$

Turán (1941) conjectured π(K₄⁽³⁾) = 5/9. It is arguably the oldest unresolved problem in extremal hypergraph theory. The exact problem as posed on erdosproblems.com asks for $\mathrm{ex}_3(n, K_4^3)$, not just the density — a stronger question than the limit constant.

## 2. Current best bounds

- **Lower bound (Turán 1941):** π(K₄⁽³⁾) ≥ 5/9 ≈ 0.55555…
  - **Construction.** Partition [n] into three classes V₁, V₂, V₃ of roughly equal size. Include the triple {a, b, c} iff two of a, b, c lie in some Vᵢ and the third in V_{i+1 mod 3}.
  - **Status.** No density > 5/9 construction has been found since 1941.
- **Upper bound (Razborov 2010, flag-algebra SDP):** π(K₄⁽³⁾) ≤ ~0.5615–0.5617. (Razborov's published number is ≈ 0.5611666; subsequent refinements have been minor and consistent with the 0.5615 ceiling.)
- **Gap:** absolute ~0.006; relative ~1%.

## 3. Historical upper-bound line

Intermediate pre-flag-algebra bounds lived in the low 0.59s:
- Turán (1941): trivial ≤ 3/4.
- de Caen (1994): ≤ 0.5936.
- Giraud, Chung–Lu and others: successive improvements between 0.593 and 0.595.
- Razborov (2010): flag-algebra SDP to ≈ 0.5616. First break below 0.57.

Post-Razborov flag-algebra refinements (Baber, Falgas-Ravry–Vaughan, Pikhurko, others) have not pushed the ceiling below ~0.5615 despite much larger SDP computations.

## 4. Adjacent problems and recent movement (2024–2026)

Listed because each is either a direct relative, a competing paradigm, or a test of whether a method generalizes.

- **K₄⁽³⁾⁻ (tetrahedron minus one edge).** π = 2/9 (Frankl–Füredi). **Solved.**
- **Uniform Turán density of K₄⁽³⁾⁻.** Equals 1/4 (Glebov–Král'–Volec; Reiher–Rödl–Schacht). **Solved.**
- **Uniform Turán density of K₄⁽³⁾** (variant, requires density uniformly across "dense" vertex sets, due to Erdős–Sós). **Open** — not equivalent to the classical Turán density but parallel.
- **Tight 3-uniform cycles and short-length variants** (IMRN 2024, arXiv 2506.03223, arXiv 2412.21011 for 5-cycle minus an edge). **Partially moved** via flag algebras 2024–2026.
- **Palette classification of uniform Turán densities** (arXiv 2408.09643, arXiv 2505.17325, 2024–2025). New combinatorial framework; does not directly attack K₄⁽³⁾ density but is the most active adjacent thread.
- **Hypergraphs with quarter uniform Turán density** (Springer JORSC 2025, DOI 10.1007/s40305-025-00619-7).
- **Entropy meets Turán** (Chao, J. London Math. Soc. 2026, DOI 10.1112/jlms.70473). Alternative proofs of known Turán-type results; does not break the π(K₄⁽³⁾) ceiling.
- **Beyond the broken tetrahedron** (arXiv 2211.12747, CPC 2023). Extends the K₄⁽³⁾⁻ line; flag-algebra territory.

## 5. Paradigms attempted on the main problem

| Paradigm | Best bound produced | Status |
|---|---|---|
| Flag algebras (Razborov and successors) | ~0.5615 | Stalled at this ceiling for ~15 years |
| Lagrangian method (Motzkin–Straus-style) | ≥ 0.593 | Subsumed by flag algebras |
| Stability / iterated reduction | no sharper bound | Techniques help near-extremal analysis but no ceiling break |
| Hypergraph regularity (Rödl–Skokan, Gowers) | no sharper bound directly | Machinery for many extremal results but not π(K₄⁽³⁾) |
| Blow-ups of finite configurations | 5/9 (matches) | No > 5/9 configuration found |
| Polynomial method | n/a | Broke cap set (2016); no analog for K₄⁽³⁾ |
| Entropy methods | no sharper bound | Re-derives known results |

## 6. Why the problem resists

- **The 5/9 lower-bound construction appears unique.** 80+ years without a rival construction is strong circumstantial evidence the bound is tight. No natural algebraic structure has suggested an alternative.
- **The 0.5615 flag-algebra ceiling appears to be a structural limit.** Increasing the flag basis adds dimensions but no new arguments; SDP optimizations asymptote. A theorem that flag algebras *cannot* beat 0.5615 (analogue of Sherali–Adams integrality gap) would be genuine meta-progress — paradigm exhaustion in the R49/R52-zoom style even without closure.
- **No obvious algebraic acceleration.** Unlike cap set (F₃ⁿ-linear structure admits polynomial method), K₄⁽³⁾ lives on [n] with no natural group action to exploit.
- **Resists one-shot AI attacks.** Not on the current GPT-5.2/Aristotle solved or partial-solved Erdős-problems lists as of 2026-04-23.

## 7. Open sub-problems and companion problems

- **π(K_s⁽³⁾) for s ≥ 5.** All open. Turán conjectured π(K_s⁽³⁾) = 1 − (1/(s−1))².
- **π(K_s⁽ʳ⁾) for general r, s.** Largely open; π(K₄⁽⁴⁾), π(K₅⁽³⁾) etc. conjectured but unproven.
- **Exact Turán number ex(n, K₄⁽³⁾) for finite n.** Open for all sufficiently large n.
- **Supersaturation / counting.** Number of K₄⁽³⁾-free hypergraphs near the extremal density; exponent conjectures.

## 8. Active communities and people

Best-guess — verify before dispatch.

- Keevash (Oxford) — survey-level machinery, hypergraph Turán general.
- Reiher / Rödl / Schacht (Hamburg) — uniform Turán density and related variants.
- Falgas-Ravry / Vaughan — flag-algebra SDP.
- Pikhurko (Warwick) — stability methods.
- Mubayi (UIC) — hypergraph extremal, related Turán problems.
- Lidický (Iowa State) — flag algebras, computer-assisted extremal.
- Frankl, Füredi — classical extremal foundations.

## 9. Candidate harness attack plan (sketch — to be refined by R01)

**Dispatch A (continuation / structural).** Given Razborov's 0.5615 SDP certificate, what structural theorem — stability of near-extremal configurations plus iterated reduction — would plug into the SDP to shave ε off the bound? Analogue of the R01 Shield Reduction for 872.

**Dispatch B (explicit construction).** Search for K₄⁽³⁾-free 3-uniform hypergraphs with density > 5/9. Empirical: evolutionary search on small n (FunSearch-style, as succeeded for cap-set lower bound). Analogue of the R13 fan-hunt.

**Dispatch C (paradigm-exhaustion diagnostic).** Does flag-algebra SDP floor at 0.5615 for a specific structural reason — integrality gap of an associated LP, Sherali–Adams rank lower bound, dimension-of-type-basis obstruction? Analogue of R49 / R52-zoom.

**Cross-family audit.** Each dispatch to Pro + DeepThink + Codex in parallel. Three-independent-source convergence is strong promotion signal (R41 pattern).

## 10. Pending capture

- erdosproblems.com forum transcript — captured from #500 page (0 comments) in `_forum_transcript.md`.
- Erdős-problem-number on erdosproblems.com — **#500** (located 2026-04-23). General case: **#712**.
- Phase 0 empirical probe: exact ex₃(n, K₄³) for small n (8 ≤ n ≤ ~15 likely computationally feasible).
- Razborov's exact SDP certificate — pull the explicit dual object for potential Lean formalization of the upper bound.

## Sources

- [Hypergraph Turán Problems survey — Keevash](https://people.maths.ox.ac.uk/keevash/papers/turan-survey.pdf)
- [Hypergraph Turán Problem: Open Questions — Mubayi](https://homepages.warwick.ac.uk/~maskat/Papers/TuranQuestions.pdf)
- [Applications of the Semi-Definite Method to the Turán Density Problem for 3-Graphs (Razborov)](https://www.researchgate.net/publication/259428466_Applications_of_the_Semi-Definite_Method_to_the_Turan_Density_Problem_for_3-Graphs)
- [Turán density of tight cycles in 3-uniform hypergraphs (IMRN 2024)](https://academic.oup.com/imrn/article/2024/6/4804/7240726)
- [Turán density of short tight cycles (arXiv 2506.03223)](https://arxiv.org/html/2506.03223)
- [Turán density of the tight 5-cycle minus one edge (arXiv 2412.21011)](https://arxiv.org/html/2412.21011)
- [Hypergraphs with quarter uniform Turán density (JORSC 2025)](https://link.springer.com/article/10.1007/s40305-025-00619-7)
- [Palettes determine uniform Turán density (arXiv 2408.09643)](https://arxiv.org/html/2408.09643)
- [Uniform Turán density — palette classification (arXiv 2505.17325)](https://arxiv.org/html/2505.17325)
- [Beyond the broken tetrahedron (arXiv 2211.12747)](https://arxiv.org/abs/2211.12747)
- [When entropy meets Turán (Chao, JLMS 2026)](https://londmathsoc.onlinelibrary.wiley.com/doi/10.1112/jlms.70473)
- [Hypergraph Turán problem workshop report (AIM)](https://www.aimath.org/pastworkshops/hypergraphturanrep.pdf)
