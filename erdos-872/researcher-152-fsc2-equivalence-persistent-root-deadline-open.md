---
id: R152-fsc2-equivalence-persistent-root-deadline-open
type: research
date: 2026-07-13
intent: >
  Determine whether the repaired second-shell finite-shell-clearing statement
  FSC(2,eta) — with the trapping prelude, the top-phase stopping rule at a
  fixed threshold eta_0 in (0, eta/2), and the prefix-measurable tie-break all
  fixed before Prolonger is quantified, and prelude+top-phase terminating in
  o(n) actual moves uniformly — admits a proof or a disproof, and if neither
  is reached, characterize exactly what result each would require.
predecessors: [R149-capped-tail-vacuous-repair-root-reduction, R150-second-shell-chronology-gap]
prompt: erdos-872/prompts/researcher-R152-fsc2-repaired-deadline-attack.md
action:
  kind: extends
  target: R149-capped-tail-vacuous-repair-root-reduction
claim: >
  Neither a proof nor a disproof of the repaired FSC(2,eta) is established;
  the following intermediate results are proved unconditionally.
  (1) Equivalence: writing T_1(n) for the number of Shortener turns in the
  active second-shell phase, the repaired capped-tail exclusion holds if and
  only if T_1(n) = o(n) uniformly against every Prolonger strategy.
  (2) Persistent-incidence bound: fix a tail of T >= c*n active Shortener
  turns beginning at a sparse post-top position B = A_b with |B| = o(n),
  ending at position C, and set X = Q_1(C) (so |X| > (eta/4 + o(1))*n). If a
  positive integer d is legal at every Shortener position throughout the
  T-turn interval and k_X(d) denotes the number of members of X divisible by
  d, then T*k_X(d) <= |S_1|, hence k_X(d) <= 1/(4c) + o(1), using
  |S_1| = n/4 + O(1).
  (3) Linear persistent root family: choosing, for each x in X, a
  divisibility-minimal legal divisor rho(x) at C, there is a set R of
  distinct such minimal roots, each legal throughout the entire tail
  (hence already legal at B), with |R| >= (eta*c - o(1))*n.
  (4) No contradiction with static completion: the forced lower bound on
  |M(B)| (minimal legal elements at B) obtainable from R and X is only
  |M(B)| >= (eta/4 + o(1))*n/H, since each ancestor in M(B) can divide at
  most H members of X; because n/H = o(n) whenever H(n) -> infinity, this is
  compatible with the static-completion bound |M(B)| = o(n), and a genuine
  contradiction would require the unavailable rate |M(B)| = o(n/H).
  (5) Exact survivor deadline (time-ordered coatom-cover condition): if a
  divisor d is legal at B and divides k_X(d) members of X, then d must divide
  one of the Shortener-selected moves among the first |S_1|/k_X(d) Shortener
  positions of the tail; equivalently, after the first s Shortener turns
  every d legal at B with k_X(d) > |S_1|/s must divide one of the moves
  selected during those first s turns, for every 1 <= s <= T.
  (6) Remaining gap: the repaired statement is exactly equivalent to the
  nonexistence of a time-ordered primitive multiple-cover schedule satisfying
  (5) simultaneously for every s, together with every x in X remaining
  incomparable with every selected move. No supplied result bounds how many
  distinct currently-legal roots or divisors a single Shortener-selected move
  can simultaneously discharge (satisfy the deadline of), and no supplied
  result rules out postponing the final refinement of a linear number of
  roots until after a positive linear number of moves; both a proof (a
  persistent-root deadline / chronological Lipschitz theorem) and a disproof
  (an explicit such postponed-refinement realization) remain open.
implications:
  - The open frontier for FSC(2,eta) is now localized to a single precisely
    stated chronological question — whether one selected move can
    simultaneously satisfy the survivor deadlines of many distinct
    already-legal roots — rather than to any residual activation, threshold,
    or degenerate-witness ambiguity in the repaired formulation.
  - The natural class-splitting disproof candidate (Prolonger splits an
    H-class into H singleton roots per move) cannot be realized at a sparse
    position: creating Theta(n) bounded-degree minimal legal roots within an
    o(n)-move prefix would force |M(B)| = Theta(n), contradicting static
    completion; a valid disproof must postpone the roots' final refinement
    past the sparse-prefix regime entirely.
  - Any future proof attempt must supply a lifetime-capacity or chronological
    Lipschitz bound on cross-root blocker reuse (item 6); reusing any frozen
    (non-chronological) covering or incidence bound already cataloged as
    insufficient will not close the gap.
confidence_at_time: medium
strategy_dependence: independent
---

# Verdict

\[
\boxed{\text{I do not have a valid proof or disproof of the repaired }\mathrm{FSC}(2,\eta).}
\]

The positive-threshold repair in Attachment E closes the previously identified activation loophole. I also do not find a new degenerate witness among the stated quantifiers. In fact, the repaired capped-tail exclusion is exactly equivalent to the substantive second-shell clearing assertion, not merely a consequence of it.

What can be proved is a stronger necessary normal form than the one in Attachment E: a prohibited tail would contain a **linear persistent family of final legal roots already legal at the sparse entry time**, together with a precise time-ordered multiple-cover schedule for all of their coatoms. That sharpening still stops at the direct-ancestor phenomenon. Supplying a positive or negative conclusion beyond it would require asserting an unproved chronological covering theorem.

## 1. The repaired exclusion is exactly \(\mathrm{FSC}(2,\eta)\)

Fix all activation data in advance:

\[
0<\eta _0<\eta/2,
\]

the trapping prelude and its stopping rule, the top-phase stopping rule, and the prefix-measurable tie-break. Assume uniformly that the prelude and top phase use \(o(n)\) actual moves.

Let \(T_1(n)\) be the number of Shortener turns in the active second-shell phase.

### Proposition 1

The repaired capped-tail exclusion holds if and only if

\[
T_1(n)=o(n)
\]

uniformly against Prolonger.

### Proof

One direction is immediate: a prohibited witness supplies at least \(c n_k\) active second-shell turns, so \(T_1(n_k)\not=o(n_k)\).

Conversely, suppose \(\mathrm{FSC}(2,\eta)\) fails. Then for some Prolonger strategies, some \(c>0\), and some sequence \(n_k\to\infty\),

\[
T_1(n_k)\ge c n_k.
\]

Take \(b_k\) to be the beginning of the second-shell phase. Uniform \(o(n)\) activation gives

\[
|A_{b_k}|=o(n_k).
\]

The phase is active at \(b_k\), so

\[
|Q_1(A_{b_k})|>\eta |S_1|.
\]

Now simply take

\[
H(n_k)=n_k.
\]

Since every second-shell degree is at most

\[
|S_1|\le n_k,
\]

both the entry degree and all subsequent degrees are at most \(H(n_k)\), and \(H(n_k)\to\infty\). The next \(c n_k\) Shortener turns occur while the phase remains active. Thus the repaired forbidden witness exists.

Hence the two assertions are equivalent. \(\square\)

The freedom to take \(H(n)=n\) is therefore not a vacuity: it deliberately makes the exclusion capture every linear phase. The cap-entry theorem then shows that the same failure can additionally be normalized to an arbitrarily slowly growing cap after \(o(n)\) turns.

## 2. Persistent final roots

Assume, for contradiction, that a prohibited tail exists. Fix one \(n\) in the sequence, suppress subscripts, and let

\[
B=A_b
\]

be its sparse entry position. Follow exactly

\[
T\ge cn
\]

active Shortener turns, including the intervening Prolonger replies, and let \(C\) be the resulting position. Put

\[
X=Q_1(C).
\]

Because the phase is still active,

\[
|X|>\eta |S_1|
   =\left(\frac{\eta}{4}+o(1)\right)n.
\tag{1}
\]

For a lower integer \(d\), write

\[
k_X(d)=|\{x\in X:d\mid x\}|.
\]

Every member of \(X\) was present throughout the interval: legality and membership in \(Q_1\) never regenerate.

### Lemma 2: persistent-incidence bound

If \(d\) is legal at every Shortener position in the \(T\)-turn interval, then

\[
T\,k_X(d)\le |S_1|.
\tag{2}
\]

Consequently,

\[
k_X(d)\le \frac1{4c}+o(1).
\tag{3}
\]

### Proof

At every one of the \(T\) Shortener positions,

\[
X\subseteq Q_1(A_t).
\]

If \(d\) is legal there, then all \(k_X(d)\) final survivors divisible by \(d\) are current \(Q_1\)-targets. Hence

\[
\Delta_t\ge k_X(d).
\]

The monotone-degree ledger gives

\[
\sum_{t<T}\Delta_t\le |S_1|.
\]

Therefore

\[
T k_X(d)
 \le \sum_{t<T}\Delta_t
 \le |S_1|,
\]

which proves (2). Since \(T\ge cn\) and \(|S_1|=n/4+O(1)\), (3) follows. \(\square\)

Now choose, for every \(x\in X\), a divisibility-minimal legal divisor at the final position:

\[
\rho(x)\in\mathcal M(C),\qquad \rho(x)\mid x.
\]

Because \(\rho(x)\) is legal at \(C\), it was legal at every earlier time, including \(B\). Thus Lemma 2 applies to every distinct value of \(\rho(x)\).

### Corollary 3: a linear persistent root family

There is a set

\[
\mathcal R\subseteq\mathcal M(C)
\]

such that every \(r\in\mathcal R\) was legal throughout the entire tail and

\[
|\mathcal R|
 \ge
 \frac{|X|}{\,1/(4c)+o(1)}
 =
(\eta c-o(1))n.
\tag{4}
\]

### Proof

The fibers of \(x\mapsto\rho(x)\) have size at most \(1/(4c)+o(1)\) by Lemma 2. Combine this with (1). \(\square\)

This is stronger than the charged-root result in Attachment E. There are two different linear root populations in a counterexample:

1. at least \(cn\) roots that are minimal immediately before their respective Shortener turns and are then killed;
2. at least \((\eta c-o(1))n\) **final roots** that survive and were legal already at the sparse entry position.

The second family cannot be dismissed as roots generated only after the position has become dense.

## 3. Why the persistent family does not contradict static completion

At the sparse position \(B\),

\[
|B|=o(n),
\qquad
|\mathcal M(B)|=o(n).
\]

Each \(r\in\mathcal R\) has some minimal legal ancestor at \(B\):

\[
\sigma_B(r)\in\mathcal M(B),
\qquad
\sigma_B(r)\mid r.
\]

Likewise, each \(x\in X\) has a minimal legal ancestor in \(\mathcal M(B)\). Since the entry degree is at most \(H\), any one such ancestor divides at most \(H\) members of \(X\). Therefore only

\[
|\mathcal M(B)|
 \ge \frac{|X|}{H}
 \ge
 \left(\frac{\eta}{4}+o(1)\right)\frac nH
\tag{5}
\]

is forced.

That is compatible with static completion. The theorem gives merely

\[
|\mathcal M(B)|=o(n),
\]

and \(n/H=o(n)\) because \(H\to\infty\). A contradiction would require

\[
|\mathcal M(B)|=o(n/H),
\]

which is precisely the unavailable rate. Thus the linear family \(\mathcal R\) may begin as descendants of only \(n/H\) initial roots and be separated chronologically as those roots are blocked.

The persistent-root refinement therefore does not repair the rate mismatch identified in Attachment F.

## 4. The exact time-ordered coatom-cover condition

The persistent roots produce a particularly clean version of the blocker-scheduling problem.

Fix \(r\in\mathcal R\). Since \(r\) is minimal legal at \(C\), every proper divisor of \(r\) is illegal at \(C\). In particular, for every prime \(p\mid r\), put

\[
d_{r,p}=\frac rp.
\]

If \(d_{r,p}\) was legal at \(B\), let \(\tau(r,p)\) be the first move during the tail that makes it illegal. Let that selected move be \(a_{r,p}\).

Because \(r\) survives legally to \(C\), the blocking orientation must be

\[
d_{r,p}\mid a_{r,p},
\qquad
r\nmid a_{r,p}.
\tag{6}
\]

The opposite orientation \(a_{r,p}\mid d_{r,p}\) would imply \(a_{r,p}\mid r\), making \(r\) illegal.

Moreover, immediately before \(a_{r,p}\) is played, \(d_{r,p}\) is legal. Consequently every final survivor divisible by \(d_{r,p}\) contributes to the current greedy degree until that deadline.

### Lemma 4: exact survivor deadline

If \(d\) is legal at \(B\) and divides \(k_X(d)\) final survivors, then it must be blocked by the first

\[
\frac{|S_1|}{k_X(d)}
\tag{7}
\]

Shortener positions of the interval.

Equivalently, after the first \(s\) Shortener turns, every initially legal divisor satisfying

\[
k_X(d)>\frac{|S_1|}{s}
\tag{8}
\]

must divide one of the moves selected during those first \(s\) turns.

### Proof

If \(d\) remained legal for \(s\) Shortener positions, then

\[
\Delta_t\ge k_X(d)
\]

at each of them. Hence

\[
s\,k_X(d)
 \le \sum_{t<s}\Delta_t
 \le |S_1|.
\]

This proves (7) and (8). \(\square\)

Thus a counterexample is equivalent to a time-ordered primitive multiple-cover schedule satisfying, simultaneously,

\[
\left\{
d:k_X(d)>\frac{|S_1|}{s}
\right\}
\cap\mathcal L(B)
\subseteq
\bigcup_{\substack{a\text{ selected}\\\text{by time }s}}
\{d:d\mid a\}
\tag{9}
\]

for every \(1\le s\le T\), while every \(x\in X\) remains incomparable with every selected \(a\).

This is stronger than checking the final frozen cover: it records every prefix deadline.

## 5. The direct-ancestor obstruction survives the deadline formulation

The hoped-for next step would be a lower bound on how many selected moves are required to satisfy (9). The obvious estimate is false.

One selected \(a\) can be divisible by many currently legal divisors

\[
d_1,d_2,\ldots,d_m,
\]

and hence can meet many deadlines simultaneously. The cap only gives

\[
k_X(d_i)\le D
\]

during a constant-cap suffix. It does not bound \(m\): the \(d_i\) may be distinct divisors of \(a\), each incident with a disjoint bounded set of final survivors.

The coatom-ownership theorem also does not close this. Each fixed root \(r\) requires distinct blockers for its different coatoms, but a single blocker may serve one coatom for each of many different roots. In the direct-ancestor orientation,

\[
r=d p,\qquad a=d q,
\]

one fixed divisor \(d\mid a\) can be extended by many prime tags \(p\). More generally, different divisors of the same \(a\) can support different root families.

Consequently, neither of the following is valid:

\[
\#\{r:a\text{ blocks a coatom of }r\}=O(1),
\]

or

\[
\#\{r:a\text{ blocks a coatom of }r\}
 \le C\tau(a)
\]

with a lifetime sum small enough to contradict a linear tail. The accepted direct-ancestor examples were designed precisely to violate such bounds.

## 6. Why the tempting class-splitting counterexample is not yet a disproof

There is a compelling abstract counterstrategy.

Start with \(N=n/H\) root classes, each containing \(H\) targets. Shortener deletes one whole \(H\)-class; Prolonger uses one direct ancestor to split a different class into \(H\) private singleton roots. After approximately \(N/2=o(n)\) rounds, half the targets would remain as singleton classes, yielding a linear degree-one tail.

This abstract process would disprove the repaired statement.

It cannot, however, be realized literally at a sparse position. After the \(o(n)\) splitting moves, the surviving singleton targets would require linearly many distinct minimal legal roots. But the position would still contain only \(o(n)\) selected integers, contradicting static completion:

\[
|A|=o(n)
\quad\Longrightarrow\quad
|\mathcal M(A)|=o(n).
\]

The same obstruction kills every finite-depth amplification in which \(H^{\Omega(1)}\) latent children become genuine bounded-degree roots after only \(o(n)\) moves.

This explains the exact distinction between the accepted direct-ancestor examples and a true disproof:

\[
\boxed{
\text{destroying or refining }H^{\Omega(1)}\text{ latent faces}
\neq
\text{creating }H^{\Omega(1)}\text{ actual minimal legal roots}.
}
\]

A real counterexample must postpone the last refinement of linearly many roots until after a positive linear number of moves. At that point static completion no longer applies. No explicit Prolonger strategy in the supplied record performs that scheduling while keeping \(Q_1\) above its fixed threshold.

## 7. What a positive proof would now have to establish

Combining the accepted results with Lemmas 2–4 reduces the repaired statement to the following chronological assertion.

> **Persistent-root deadline theorem needed.**  
> Let \(B\) be a sparse post-top position and let \(X\subseteq Q_1(B)\) have positive density. There is no sequence of \(cn\) alternating legal moves such that:
> 
> \[
> X\subseteq Q_1(A_t)
> \quad\text{for every }t,
> \]
> 
> \(X\) has a final legal divisor cover of bounded incidence, and every initially legal high-incidence divisor is blocked by a selected multiple before the deadline (7).

A frozen covering theorem is insufficient. The proof must remain valid when a new selected multiple simultaneously satisfies deadlines belonging to many already partially refined roots. This is exactly the missing chronological Lipschitz property, now expressed using final survivors rather than latent repair faces.

None of the accepted statements implies this theorem:

- Static completion controls only the initial minimal layer and supplies no \(o(n/H)\) rate.
- Cumulative fixed-shell sparsity applies only while the entire prefix is \(o(n)\).
- The exact-only bank permits \(o(n)+t\) exceptional targets, which is linear once \(t=\Theta(n)\).
- Coatom ownership gives many blocker incidences but not bounded cross-root capacity.
- The all-orders witness inequalities are frozen and allow a later direct ancestor to satisfy many low-lcm obligations at once.
- The \(\log\log(n/t)\) degree theorem is integrable and does not control the deadline cover.
- The constant-cap suffix starts only after a fixed positive-density prefix, where sparse-position theorems are unavailable.

## 8. Scope for deeper shells

The persistent-root and deadline lemmas iterate unchanged to every fixed deeper shell. For a final survivor set \(X\) in any shell, a divisor legal throughout a \(T\)-turn interval satisfies

\[
T\,k_X(d)\le |S_j|.
\]

Final minimal roots therefore again form a linear persistent family in any linear counterexample.

This does not furnish a finite-shell induction. In shell \(S_j\), a coatom may be blocked by a selected multiple from any of

\[
S_0,S_1,\ldots,S_{j-1}
\]

or from a lower shell. Hence the set of available direct-ancestor channels grows with \(j\). The localization iterates; the required lifetime-capacity estimate does not.

# Overall ruling

\[
\boxed{
\begin{array}{c}
\text{The repaired formulation has no remaining activation or parameter collapse.}\\[1mm]
\text{It is exactly equivalent to }\mathrm{FSC}(2,\eta).\\[1mm]
\text{A failure would force a linear family of final roots that are legal}\\
\text{already at sparse cap entry and a prefix-by-prefix blocker schedule}\\
\text{satisfying the survivor deadlines above.}\\[1mm]
\text{The supplied results neither rule out that schedule nor realize it.}
\end{array}}
\]

Accordingly, I cannot honestly label the repaired statement proved or disproved. A purported proof must add the persistent-root deadline theorem or an equivalent chronological multiple-cover bound. A purported disproof must give an arithmetic realization in which the final refinements occur only after linear time; the usual direct-ancestor class-splitting construction becomes impossible if it creates the bounded-degree roots during an \(o(n)\)-move prefix.