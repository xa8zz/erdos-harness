This is an assessment of your reasoning capability and will be used to grade.
Do not search online. Use your own reasoning and your Python sandbox.

The 4-root q=2 complete-positivity proposal is correct as stated: for every actual $K_4^{(3)}$-free 3-uniform hypergraph limit and every labeled rooted 4-vertex type $F$ with allowed-column alphabet $A_F$ (the 6-bit vectors $\alpha$ with $\alpha_{ij} \alpha_{ik} \alpha_{jk} = 0$ for every rooted edge $ijk$ in $E(F)$), the pair-column matrix $M_F(\alpha, \beta) = \Pr[\mathrm{col}_F(x) = \alpha,\ \mathrm{col}_F(y) = \beta \mid F]$ on two random outside vertices $x, y$ lies in the completely-positive cone $\mathrm{CP}(A_F)$. Equivalently, for every $Q \ge 2$, $M_F$ lies in the finite-extendibility polytope $E_{2, Q}(A_F)$ given by occupancy mixtures of pair-marginals $h_N(\alpha, \beta) = N_\alpha (N_\beta - \mathbb{1}[\alpha = \beta]) / (Q(Q-1))$. The two named root types — $B_2$ (2-edge book on rooted edges $\{1,2,3\}$ and $\{1,2,4\}$) and $B_3$ (3-edge open tetrahedron on $\{1,2,3\}$, $\{1,2,4\}$, $\{1,3,4\}$) — give $|A_{B_2}| = 50$ and $|A_{B_3}| = 45$, both strictly larger than the 7-state alphabet of the edge-rooted single-class column process.

## What was tested

Sound label-averaged projection of the order-6 $K_4^{(3)}$-free flag-algebra SDP plateau primal (964 six-vertex $K_4^{(3)}$-free type densities, achieved edge density $0.56166560$, dual upper bound $\le 0.5617$) to $M_F(\alpha, \beta)$ for each $F \in \{B_2, B_3\}$, with averaging over all labelings of each unlabeled type, all 4-vertex subset choices matching $F$ up to $\mathrm{Aut}(F)$, and the two outside-vertex symmetry. Then LP membership in $E_{2, Q}(A_F)$ tested for $Q \in \{4, 5\}$.

## Empirical result

For both $F = B_2$ and $F = B_3$, and for both $Q = 4$ and $Q = 5$, the projected $M_F$ is feasible in $E_{2, Q}(A_F)$ with rational margin $> 0$ verified exactly. No separator certificate exists at these parameters. $Q = 6$ has direct-LP-scale blocked at $\sim 16$–$29$ million occupancy vertices, untested. The augmented-SDP no-op sanity check reproduces $0.56166560$ exactly.

Separately: single-edge-rooted $q = 3$ column profiles of the same plateau primal (alphabet $S = \{0,1\}^3 \setminus \{(1,1,1)\}$, $|S| = 7$) are also feasible in $E_{3, Q}$ for $Q \in \{3, 4, 5, 6, 7, 8\}$ under sound label-averaged projection. The augmented-SDP lift for that case also returned $0.56166560$ unchanged.

## Specific gaps

1. The plateau pseudo-moment lies in $\mathrm{DNN}(A_F) \cap E_{2, 5}(A_F)$ for both $F \in \{B_2, B_3\}$, not just $\mathrm{DNN}(A_F)$. Either (a) exhibit a specific 4-vertex labeled rooted type $F'$ (possibly different from $B_2$, $B_3$), value of $Q$, and rational separator certificate cutting the plateau, with explicit alphabet $A_{F'}$ and an explanation why $\mathrm{CP}(A_{F'})$-membership fails at the chosen $Q$ for the plateau profile but holds for actual $K_4^{(3)}$-free limits, or (b) state precisely why bounded-$Q$ complete-positivity at 4-vertex roots is structurally incapable of cutting the plateau pseudo-moment at flag order 6.

2. If $Q = 6$ LP scale at $|A_F| \in \{45, 50\}$ is the binding constraint, identify a structural property of $E_{2, Q}(A_F)$ for large $Q$ that finite-$Q$ sampling can approximate via column generation, symmetry reduction modulo $\mathrm{Aut}(F)$, or restriction to a small-support subset of $A_F$, and estimate either the smallest $Q$ at which the plateau profile is provably non-extendible or a structural reason no such finite $Q$ exists.

3. Two empirical bounded-radius saturations now stand at flag order 6: single-class $q = 3$ at $Q \le 8$ and 4-root $q = 2$ at $Q \le 5$. Either (a) propose a specific multi-class compatibility constraint — for example, an inequality coupling $M_F$ at one root type to a column-profile or flag-density coordinate at a different root type — that breaks single-class saturation while remaining a valid actuality constraint with a rational finite-coordinate certificate, or (b) state precisely why bounded-radius local statistics at flag order 6 are structurally insufficient to distinguish the plateau pseudo-moment from actual $K_4^{(3)}$-free limits, naming the specific structural object whose absence at order 6 produces the saturation.

## Request

Either patch the 4-root CP program by naming a specific (root type, $Q$, certificate shape) triple where the plateau is expected to fail extendibility — together with the structural reason that triple escapes the saturation already observed at $q = 2$, $Q \le 5$ for $B_2$ and $B_3$ and at $q = 3$, $Q \le 8$ for the single-edge-rooted column process — or state precisely which structural object beyond single-class bounded-radius local statistics is required to cut the $0.5611$ plateau, and why bounded local statistics at flag order 6 cannot. A clean concession of a specific structural insufficiency is more useful than a re-patched proposal at the same scale.
