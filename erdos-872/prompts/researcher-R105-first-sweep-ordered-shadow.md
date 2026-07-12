Don't search the internet. This is a test to see how well you can craft non-trivial, novel and creative proofs given a "primitive sets and divisibility games" math problem. Provide a full unconditional proof or disproof of the single statement (OS) defined in the Problem section and the attached analysis.

## Problem

For \(n\ge2\), two players alternately choose previously unchosen integers from \(\{2,\ldots,n\}\), always keeping the chosen set an antichain under divisibility (a primitive set). The game ends when the set is maximal. Prolonger moves first and maximizes the total number of moves; Shortener minimizes it; \(L(n)\) is the length under optimal play. Resolve the first-sweep ordered-shadow statement (OS), defined precisely inside the attached analysis below (its Section 6): there exists \(H=H(n)\to\infty\) such that for every position obtainable after the initial peel, Shortener can choose an ordering of the first minimal layer \(M_0\) for which, against every legal Prolonger continuation during the first sweep, the proper-multiple shadow of the advance-killed set \(K_0\) has size \(o(n)\). Prove it or disprove it, with a complete proof either way.

A caution on formulation: a related post-peel completion statement was recently shown to be secretly EQUIVALENT to the full problem because a terminal position satisfies its clauses vacuously. (OS) as defined is first-sweep-local. If you find that (OS) also admits a degenerate witness or collapses to the full problem, proving THAT is a valuable resolution of this task; state it explicitly.

## Known progress

Complete proofs exist for all items; take them as given. Notation: for a position \(A\), \(U_n=(n/2,n]\), \(L_n=[2,n/2]\); \(R(A)\subseteq U_n\) and \(D(A)\subseteq L_n\) are the integers still legal relative to \(A\); \(\deg_A(d)=\#\{u\in R(A):d\mid u\}\), \(\Delta(A)=\max_d\deg_A(d)\).

- Bounds: \(c_\delta\,n(\log\log n)^2/\log n\le L(n)\le(0.1897123371+o(1))n\), both by explicit strategies.
- Static completion: any primitive \(P\) with \(|P|=o(n)\) has \(o(n)\) minimal legal elements \(\mathcal M(P)\), and \(P\cup\mathcal M(P)\) is a maximal primitive set. So sublinear positions are always completable at sublinear cost.
- Fractional relaxation: the LP packing value \(\nu(A)\) (maximize mass on \(R(A)\), every \(d\in D(A)\) seeing mass at most one) is \(o(n)\) uniformly over \(|A|=o(n)\), and there is a static legal antichain \(B\subseteq D(A)\), \(|B|=o(n)\), covering all but \(o(n)\) of \(R(A)\).
- Smooth/rough trapping: with \(y=\tfrac14\log n\), Shortener can in \(o(n)\) actual moves reach a position where every live \(m\) has its \(y\)-smooth part dividing one played carrier and its \(y\)-rough part dividing another.
- Degree availability: at any position with \(|A|=o(n)\) and \(|R(A)|\ge\eta n\), some legal lower move kills at least \((2\eta-o(1))r(n)\) live targets with \(r(n)\to\infty\) (\(\log\log\) scale).
- Exact-only bank: along any play with \(t\) actual moves, the number of targets that ever become exact-only is \(o(n)+t\) (each exact-only target, when played, is itself an actual move).
- Online-area sufficiency: \(L(n)=o(n)\) follows from one shell statement (OA) — there is \(h(n)\to\infty\) such that after the trapping sweep, uniformly over dyadic shells \(S_X=(X/2,X]\), the live non-minimal shell population \(Q_X\) satisfies \(|Q_X(\mathrm{end})|\le\tfrac12|Q_X(\mathrm{start})|+X/h(n)^2\) per processing block under the actual maximum-degree Shortener policy (direct maximum-degree kills, helpful opposing moves, and transfers into the minimal legal set all permitted). Proof of the implication: apply (OA) \(O(\log h)\) times per shell, \(O(X\log h/h)\) Shortener turns per shell, geometric summation over shells, then static completion.
- Absorbing fortress: once a primorial-batched position with degree cap \(\Delta_Q\le H\) and a linear trapped reservoir is reached, it is stable against arbitrary play — blocked small divisors remain illegal forever, the cap is monotone along every continuation, and the remaining game value is at least \(|E(A)|+|Q(A)|/H\) (exact-only targets are banked actual moves). Hence entry into such a position at threshold \(H=(\log n)^{o(1)}\) would give \(L(n)\ge n^{1-o(1)}\); no post-entry maintenance theorem is missing — only robust entry is open.
- Fresh-batch persistence: let \(W_r=\binom{r}{\lfloor r/2\rfloor}\). If at the moment a rank-\(r\) primorial batch is activated every legal face of the cube has at least \(2W_r+1\) currently legal prime lifts, Prolonger clears the batch in at most \(W_r\) carrier moves against arbitrary subsequent replies (inclusion-maximal face selection; the selected faces form an antichain; Sperner). So interference after activation is harmless; a batch can fail only by advance depletion before it is first touched.
- Exhaustion cost: exhausting every prime lift of one currently legal face requires \(\Omega(H/\log H)\) distinct earlier moves; within one full rank-\(r\) divisor cube, dynamic common-core splitting costs at most \(W_r\) carrier moves in total.
- All-orders witness inequality: if \(\mathcal F\) is a family of distinct advance-depleted face cores in one shell, each with at least \(q\) blocked lift tags, and the earlier harmful moves are \(a_i=e_ip_i\), then for every \(s\le q\): \(|\mathcal F|\binom qs\le\sum N_{\mathcal F}(\operatorname{lcm}_{i\in I}e_i)\), summed over \(s\)-subsets \(I\) with distinct tags, where \(N_{\mathcal F}(\ell)=\#\{d\in\mathcal F:\ell\mid d\}\). Tuples with lcm above \(Z\) contribute at most \((2X/Z)\binom ts\), so only low-lcm witness tuples matter.
- Refinement-forest constraint: any history in which a linear target set survives \(t\asymp X/h\) rounds with accumulated maximum-degree area \(\sum_{i<t}\Delta_i=o(X)\) must maintain \(\omega(t)\) simultaneously active minimal-root classes, all created by paid successive refinements from \(O(t)\) ancestral classes with the sum of largest ancestral class sizes \(o(X)\).
- Sandbox evidence (finite boards, not asymptotic proof): greedy entry policies at \(n\) up to \(8000\) reach capped positions retaining a visibly linear reservoir with cumulative maximum-degree area about \((0.16\text{–}0.20)n\); shell-local carrier-greedy searches at \(X=500\ldots2000\) keep cumulative area near \(0.45X\) with half the shell live afterward. Low-area persistence is empirically favored at these sizes.

## What does not work, and why it fails

- Fixed-budget charging \(|R(A)|\le b(n)+C(|A|+b(n))\Delta(A)\), for any \(b(n)=o(n)\): disproved by two independent mechanisms. (i) Face-carrier diagonalization: reachable positions with \(|R(A)|\gg b(n)\), exactly one legal lower move, and \(\Delta(A)=0\); also kills every dyadic-shell analogue with a fixed \(o(n)\) exceptional allowance. (ii) Primorial batching: reachable positions with \(|R(A)|=(\tfrac12-o(1))n\), \(\Delta(A)\le H\) slowly growing, and \((|A|+b(n))H=o(n)\) — a sublinear family of upper-half primorial-batched carriers makes every lower integer up to \(n/H\) illegal without killing any upper target.
- Every current-state charge of live targets to individual earlier moves with capacity \(O(\Delta)\) per move: fails on the primorial-batched endpoint (linear reservoir, capped degree, sublinear cost, essentially no exact-only targets). The relevant dynamic quantity is the accumulated area \(\sum_{i<t}\Delta_i\), not the endpoint product \(t\Delta_t\).
- Static \(s\)-th-moment estimates for advance depletion, any fixed or growing \(s\): one shared witness core (\(e_i=e\) for one witness in every tag) makes every \(s\)-tuple have lcm \(=e\), contributing \(N(e)\binom qs\) at once; \(N(e)\) can be linear while the current degree stays capped. Only chronology-sensitive arguments can work.
- Promoting instantaneous incidence bounds to lifetime capacities: at any instant one opposing move \(c\) meets at most \(B_r\tau(c)\) active faces (\(B_r=\binom r{\lfloor r/2\rfloor}\), Sperner over at most \(\tau(c)\) cores), but across an adaptive refinement history the same \(c\) is inherited by up to \(2^r\) sequentially revealed core-signature pairs per core. Realized legally at \(n=4000\), \(c=30\): lifetime multiplicity \(128\) versus instantaneous cap \(48\), on a verified 258-move antichain history. Any temporal capacity claim requires a historical no-repetition invariant for the splitting process; none is known.
- Pointwise degree growth alone: \(r(n)=O(\log\log H)\) fresh kills per turn at horizon \(|A|\asymp n/H\) totals \(o(n)\); maximum degree tending to infinity does not self-bootstrap into a sublinear game bound.
- LP or covering certificates for linear length: \(\nu(A)=o(n)\) uniformly, so no fractional packing bound can force \(L(n)=\Omega(n)\).
- Persistence or entry theorems at growing cap \(H(n)\to\infty\) as a resolution: entry gives only \(L(n)\ge n^{1-o(1)}\) (refutes (OA), does not prove \(\Omega(n)\) — that needs \(H=O(1)\) or an amplification converting \(n/H(n)\) to \(cn\)). Separately, histories beating the maximum-degree or minimal-legal Shortener policies do not lower-bound the game: neither policy is proved dominant, so a lower bound must handle arbitrary replies.
- Frozen repair theorems without chronology: coded and product-escalating repairs solve frozen blocker configurations (a single middle-rank cross-spoiler has a product-escalating repair of normalized reciprocal weight at most \(2/q_1\); diagonal semiprime matchings admit logarithmic coded repairs via a covering-array lemma), but one later minimum-product edge can join low-lcm witness tuples of many already-repaired structures simultaneously — a jump of \(N(e)\binom{q-1}{s-1}\) from one reply. The missing Lipschitz property of the optimal repair potential under chronological edge insertion is exactly what frozen results do not supply.

- Trace normal form and energy lemma: a residual spoiler killing lift \(fp\) of a still-legal face \(f\) has the form \(a=pd\), \(d\mid f\) (the trace); one actual move cannot destroy two distinct prime lifts of the same legal face; traces incident to one face have lcm dividing it. Hence for faces in \((Y,2Y]\) with at least \(E\) blocked tags of distinct lift primes: \(|\mathcal E_E|\binom Es\le 2Y\sum 1/\operatorname{lcm}(\text{traces})\) over distinct-tag witness \(s\)-tuples; high-lcm tuples contribute at most \((2X/Z)\binom ts\).
- Atomic ledger: pre-registering all core-signature faces as latent objects gives a genuine lifetime bound — faces whose blocker record ever contains \(c\) number at most \(2^r\tau(c)\) — for the channel oriented by \(\kappa(F)\mid c\). Direct ancestors (\(c\mid a_F\)) escape every \(M\cdot\tau(c)\) bound: one move can erase whole lift families of \(H^{\Omega(1)}\) unmergeable faces with \(\tau(c)\) constant.
- Canonical cube partition (audit-verified): writing \(d=c(d)\prod_{j\in S(d)}\ell_j\) with all \(\ell_j\)-valuations of \(c(d)\) even partitions the integers into rank-\(r\) cubes; a face integer belongs to exactly one cube forever; first deaths of lift slots are irreversible actual-state events.
- Layer peeling: Shortener can make every integer up to \(n/H\) illegal in at most \(n/H\) moves (legality is monotone); after this peel, \(L(n)=o(n)\) reduces to the growing-depth uniformity statement that the total minimal-legal-layer mass \(\sum_{j<\log_2H}|\mathcal M(A_j)|\) along the induced sweep is \(o(n)\) for some \(H\to\infty\) — the fixed-prefix static-completion theorem gives each layer \(o(n)\) but does not iterate across growing depth.
- Policy sensitivity is load-bearing: against the LITERAL maximum-degree policy, the anchor \(B_H=\operatorname{lcm}(2,\ldots,H)\) followed by playing lift primes \(p\in(H,2H]\) (provably never preemptable by a max-degree reply) exhausts \((1-o(1))\) of a shell's faces at trace 1 within \(O(H/\log H)\) moves; but one legal batch blocker \(\prod_{H<p\le2H}p\le n^{1/12}\) kills every lift prime at once at face-density cost \(e^{-\Theta(H)}\). Any upper-bound strategy must specify its policy including such batch moves; any lower bound must survive them.

## Additional approaches that do not work, and why

- Raw all-witness low-lcm sums: inflated by redundant re-witnessing of dead lifts — a semiprime grid \(a_jp_i\) (\(R\) ancestors, \(q\) tags) produces \(R^s\) witness tuples from \(Rq\) actual moves; no inequality linear in the move bank controls the raw count.
- First-witness tuples indexed by MOVE indices: ill-defined — one move can first-witness different tags with different traces for different faces (move \(35=5\cdot7\): face \(77\) at tag \(5\) with trace \(7\), face \(65\) at tag \(7\) with trace \(5\)); any valid normalization must be indexed by face-tag pairs and carry a no-reuse statement that survives later batches.
- Globalizing per-snapshot pairwise cross-carrier cleanups to chronological injectivity: not free; the accepted results are per-snapshot only.
- Using Prolonger-side clearing theorems (fresh-batch persistence) inside a Shortener upper-bound strategy: player-quantifier reversal; the theorem's mover is Prolonger and a Shortener strategy cannot schedule those moves.
- Iterating fixed-prefix static completion across \(\log_2H\) growing-depth minimal layers: a growing-depth uniformity problem the theorem does not cover; quadratic regeneration (\(t\) incomparable semiprime carriers leave \(t(t-1)\) minimal legal cross-products) is the known inflation mechanism.
- Random-witness repairs: unavoidable \(2^r/\binom r{\lfloor r/2\rfloor}\asymp\sqrt r\) temporal loss.

## Additional established facts (proofs verified; take as given)

- Continuation lemma: if every integer legal at a position \(A\) exceeds \(n/H\), and \(C\subseteq\mathcal L(A)\) (the set of integers legal at \(A\)) is such that \(A\cup C\) is a maximal primitive set, then \(|\mathcal L(A)|\le(2H+1)|C|\); consequently every continuation from \(A\), under arbitrary play by both players, lasts at most \((2H+1)|C|\) further moves. (Proof: each legal \(x\notin C\) is comparable with some \(c\in C\); a fixed \(c>n/H\) has fewer than \(H\) multiples and at most \(H\) divisors above \(n/H\).)

## Additional ruled-out mechanisms

- Composing the fixed-prefix static-completion theorem with the \(n/H\)-move peel: by the continuation lemma the peel route needs the strengthening \(|C|=o(n/H)\) for some maximal completion \(C\) of the post-peel position, not the theorem's \(o(n)\). "Choose \(H\) growing slowly" cannot repair this: a completion-size modulus \(|C|\le n/\log H\) is compatible with \(|C|=o(n)\) for every \(H\to\infty\), yet gives \(H|C|/n\ge H/\log H\to\infty\). Composition of the two little-\(o\) statements is not available.
- Amortizing pointwise degree divergence into linear cleared area: a degree guarantee \(\Delta_t\to\infty\) at horizon \(t=n/H\) is compatible with \(t\,\Delta_t=o(n)\) (e.g. \(\Delta_t\asymp\log\log H\)). In modulus form, with \(\phi_n(\alpha)=\sup\{\nu(A)/n:|A|\le\alpha n\}\to0\), the accumulated direct progress by horizon \(\alpha n\) is (heuristically) \(n\int_0^\alpha ds/\phi_n(s)\), and \(\phi(\alpha)=\sqrt\alpha\) makes it \(o(n)\). Nothing in the accepted facts lower-bounds this integral.


## Attached analysis (verbatim; defines the sweep framework, advance-killing, the shadow \(\operatorname{Sh}^-\), the containment theorem with proof, and (OS)/(WOS)). The containment theorem's proof is included so you can CHECK it rather than trust it; if it is wrong, that too is a resolution.

## Verdict

I do **not** have a valid proof or disproof of the stated cumulative minimal-layer claim. However, the apparent need to control \(\log_2 H\) successive applications of the static-completion theorem can be eliminated.

There is an exact one-sweep containment principle: **every minimal element appearing after the first sweep is a proper multiple of a first-layer element that Prolonger preempted by playing a proper multiple of it.** Consequently, the entire growing-depth problem reduces to controlling one dynamically generated lower-multiple shadow after the first sweep.

I use the Phase 0 construction, sweep definition, and multiplicative-chain lemma exactly as supplied. 

---

# 1. Advance-killed elements of one sweep

Fix \(H\to\infty\), and put

\[
J=\left\lceil \log_2 H\right\rceil.
\]

Consider sweep \(j\), beginning from \(A_j\), with legal lower set \(D_j\) and minimal layer

\[
M_j=\min_{\mid} D_j.
\]

Call \(m\in M_j\) **selected** if either player actually plays \(m\) during that sweep. Call \(m\) **advance-killed** if, before Shortener reaches \(m\) in her ordering, some player plays a proper multiple of \(m\), making \(m\) illegal. Let

\[
K_j=\{m\in M_j:m\text{ is advance-killed during sweep }j\}.
\]

For the specified sweep strategy, Shortener herself only selects elements of \(M_j\), so every member of \(K_j\) is normally advance-killed by a Prolonger move. The definition also accommodates any extra interleaved Shortener moves.

We first record why these are the only possibilities.

### Lemma 1: a minimal element can only be removed upward or selected exactly

Suppose \(m\in M_j\), and a legal move \(c\) made after the start of sweep \(j\) is the first new move comparable with \(m\). Then either

\[
c=m
\qquad\text{or}\qquad
m\mid c,\quad m<c.
\]

#### Proof

Legality is monotone decreasing: if \(c\) is legal when played, then it was legal at the start of the sweep. Since \(m\) was minimal in \(D_j\), no proper divisor \(c\mid m\), \(2\le c<m\), was legal at that time. Hence a newly played comparator cannot be a proper divisor of \(m\). The only remaining possibilities are \(c=m\) or \(m\mid c\) properly. ∎

Thus the distinction between selected and advance-killed is exhaustive.

---

# 2. The one-sweep ancestry container

For \(K\subseteq L_n\), define its proper lower-multiple shadow by

\[
\operatorname{Sh}^{-}(K)
=
\left\{
x\le \frac n2:
\text{there is }m\in K\text{ with }m\mid x,\ m<x
\right\}.
\]

### Theorem 2: tail compression into one advance-killed shadow

For every sweep index \(j<J\),

\[
\boxed{
\bigcup_{\ell=j+1}^{J-1} M_\ell
\subseteq
\operatorname{Sh}^{-}(K_j).
}
\tag{5}
\]

Consequently,

\[
\boxed{
\sum_{\ell=j}^{J-1}|M_\ell|
\le
|M_j|+\bigl|\operatorname{Sh}^{-}(K_j)\bigr|.
}
\tag{6}
\]

#### Proof

Take

\[
x\in M_\ell,\qquad \ell>j.
\]

Because the legal sets are decreasing,

\[
x\in D_\ell\subseteq D_{j+1}\subseteq D_j.
\]

Every member of a finite divisibility poset lies above a minimal member, so there is some

\[
m\in M_j,\qquad m\mid x.
\]

We cannot have \(m=x\), since \(M_j\cap D_{j+1}=\varnothing\), whereas \(x\in D_{j+1}\). Thus \(m<x\).

During sweep \(j\), \(m\) ceased to be legal. If either player had selected \(m\) exactly, then \(m\in A\) afterward, and \(m\mid x\) would make \(x\) illegal for every later position. This contradicts \(x\in M_\ell\). Therefore \(m\) was not selected exactly. By Lemma 1, it was advance-killed by a proper multiple. Hence

\[
m\in K_j.
\]

Thus \(x\in\operatorname{Sh}^{-}(K_j)\), proving (5).

The sets \(M_j,M_{j+1},\ldots\) are pairwise disjoint because

\[
D_{r+1}\subseteq D_r\setminus M_r.
\]

Taking cardinalities in (5) therefore gives (6). ∎

This is stronger than merely assigning every later element an ancestor in \(M_0\): only the ancestors that Prolonger preempts upward can have surviving descendants.

---

# 3. Application to the first sweep

Taking \(j=0\) in (6) gives

\[
\boxed{
\sum_{\ell<J}|M_\ell|
\le
|M_0|+\bigl|\operatorname{Sh}^{-}(K_0)\bigr|.
}
\tag{7}
\]

After Phase 0, the complete history has at most

\[
\frac{2n}{H}+1=o(n)
\]

moves. The supplied static-completion theorem therefore gives, uniformly over Phase 0 histories,

\[
|M_0|=o(n).
\tag{8}
\]

Hence the desired cumulative minimal-layer criterion follows from the single statement

\[
\bigl|\operatorname{Sh}^{-}(K_0)\bigr|=o(n).
\tag{9}
\]

No iteration of the qualitative static theorem through \(J=\log_2 H\) stages is required.

There is also a useful weighted sufficient form. A root \(m\) has exactly

\[
w_H(m)
:=
\max\left\{0,
\left\lfloor\frac{n}{2m}\right\rfloor-1
\right\}
\]

proper multiples in \(L_n\). Therefore

\[
\bigl|\operatorname{Sh}^{-}(K_0)\bigr|
\le
\sum_{m\in K_0}w_H(m),
\tag{10}
\]

and, because every \(m\in M_0\) satisfies \(m>n/H\),

\[
w_H(m)<\frac H2.
\]

Thus

\[
\sum_{\ell<J}|M_\ell|
\le
|M_0|
+
\sum_{m\in K_0}
\left(
\left\lfloor\frac{n}{2m}\right\rfloor-1
\right)
\le
|M_0|+\frac H2|K_0|.
\tag{11}
\]

The last inequality recovers the naive \(H|M_0|\)-type estimate, but (7) is sharper because it counts the union of the descendant shadows and only uses advance-killed roots.

---

# 4. What a counterexample would now have to do

Suppose that for some fixed \(\varepsilon>0\), Prolonger could force

\[
\sum_{\ell<J}|M_\ell|\ge \varepsilon n
\tag{12}
\]

against every choice of sweep order. Since \(|M_0|=o(n)\), (7) would force

\[
\bigl|\operatorname{Sh}^{-}(K_0)\bigr|
\ge
(\varepsilon-o(1))n.
\tag{13}
\]

Therefore every genuine disproof must already accomplish the following during the **first** minimal-layer sweep:

1. Against Shortener’s chosen ordering of \(M_0\), Prolonger must advance-kill a subset \(K_0\subseteq M_0\).
2. Those advance-killed roots must have a linear-sized proper-multiple shadow.
3. A linear part of that shadow must survive the actual carriers and Shortener’s subsequent moves long enough to appear in later minimal layers.

This is substantially stronger than exhibiting a static family with quadratic regeneration.

For example, the semiprime construction

\[
\{p_iq_i:1\le i\le t\}
\]

does show that preempted factors can leave \(t(t-1)\) cross-products. But it does not by itself show that the relevant roots can be advance-killed against an arbitrary ordering. If a proposed batch carrier \(c\) is divisible by several current roots, then as soon as Shortener selects any one of those roots, \(c\) becomes permanently illegal. Prolonger must therefore select an adaptive sequence of divisor traces avoiding the entire Shortener-claimed prefix.

That chronological requirement is absent from the static quadratic example.

---

# 5. The exact online object

At the beginning of the first sweep, let \(M=M_0\). Every currently legal proper-multiple carrier \(c\) has a trace

\[
T_M(c)=\{m\in M:m\mid c\}.
\]

The sweep induces the following online game.

- Shortener claims the first surviving vertex of \(M\) in her chosen order.
- Prolonger may play a legal carrier \(c\), which advance-kills every member of \(T_M(c)\).
- Once Shortener has claimed \(m\), every future carrier whose trace contains \(m\) is illegal.
- Prolonger’s successive carriers must also remain pairwise incomparable with all earlier actual moves.
- The cost of the advance-killed set \(K\) is not merely \(|K|\), but the size of
  \[
  \operatorname{Sh}^{-}(K).
  \]

This is a weighted, adaptive transversal problem on divisor traces. Generic set-cover information is insufficient because it ignores both permanent illegality and the lower-multiple shadow of the vertices deleted before being claimed.

---

# 6. The single sub-step I cannot close

The precise sufficient statement is the following.

### First-sweep ordered-shadow statement

There exists \(H=H(n)\to\infty\) such that, for every position \(A_0\) obtainable after Phase 0, Shortener can choose an ordering of \(M_0\) for which, against every legal Prolonger continuation during the first sweep,

\[
\boxed{
\left|
\bigcup_{m\in K_0}
\left\{
2m,3m,\ldots,
\left\lfloor\frac{n}{2m}\right\rfloor m
\right\}
\right|
=o(n).
}
\tag{OS}
\]

The stronger weighted version would be

\[
\boxed{
\sum_{m\in K_0}
\left(
\left\lfloor\frac{n}{2m}\right\rfloor-1
\right)
=o(n).
}
\tag{WOS}
\]

Either \((\mathrm{OS})\) or \((\mathrm{WOS})\) proves the requested statement immediately through (7).

Conversely, any disproof of the cumulative-layer claim must defeat \((\mathrm{OS})\): by (13), it must force a linear advance-killed shadow against every first-sweep ordering. It must then show that the linear shadow is not merely potential shadow but is chronologically exposed as later minimal elements.

I could not prove \((\mathrm{OS})\). The supplied static-completion theorem controls

\[
|M_0|=o(n),
\]

but not the multiple shadow of the subset preempted online. The known \(t(t-1)\) cross-product construction demonstrates possible inflation, but it does not provide an arbitrary-order strategy forcing the required \(K_0\). Random witness selection and lifetime divisor bounds likewise do not control the union in \((\mathrm{OS})\).

A further localization follows from (10). Write

\[
\varepsilon_n=\frac{|M_0|}{n}=o(1)
\]

and choose \(R_n\to\infty\) so slowly that

\[
R_n\varepsilon_n=o(1).
\]

The roots with \(w_H(m)\le R_n\) contribute only

\[
\sum_{\substack{m\in K_0\\w_H(m)\le R_n}}w_H(m)
\le R_n|M_0|
=o(n).
\]

Thus any counterexample must force linear weight specifically from roots satisfying

\[
w_H(m)>R_n,
\qquad\text{hence}\qquad
\frac nH<m<\frac{n}{2(R_n+1)}.
\tag{14}
\]

So the obstruction cannot be spread among the almost-exact roots near \(n/2\); it must consist of an online-forceable family of relatively low first-layer roots with unbounded descendant capacity.

---

# Conclusion

The requested cumulative-layer statement is not proved or disproved here. The strongest rigorous advance is the exact tail containment

\[
\boxed{
\sum_{\ell<J}|M_\ell|
\le
|M_0|+
\bigl|\operatorname{Sh}^{-}(K_0)\bigr|,
}
\]

where \(K_0\) consists only of first-layer minima advance-killed by proper-multiple carriers.

Accordingly, the single unresolved sub-step is:

\[
\boxed{
\text{Can Shortener order }M_0\text{ so that the proper-multiple shadow of }
K_0\text{ is }o(n)\text{ against all legal replies?}
}
\]

This formulation incorporates the sweep order, permanent blockers, batch carriers, and all later regeneration in one chronological object. It also shows what a valid disproof must force before any higher-layer construction can succeed.

REMEMBER - this unconditional argument may require non-trivial, creative and novel elements.
