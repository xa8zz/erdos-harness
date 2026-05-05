# Program Progress Analysis

Last updated: 2026-04-23

This note answers a meta-question about the Erdos 872 research harness:

- when the program made progress by round cluster;
- what kinds of tasks those progress moments came from;
- where the program failed or hit issues;
- what kind of novel problem solving this workflow appears good at;
- what other problem domains would benefit from the same style.

It is based on the regenerated compiled state view in
[`state_compiled.md`](state_compiled.md), the publication-facing inventory in
[`publication_source_of_truth.md`](publication_source_of_truth.md), the current
round graph, and selected late-round synthesis notes. The round graph currently
contains 269 front-matter-bearing artifacts: 129 research notes, 81 verification
notes, 46 refutation notes, 9 synthesis notes, and 4 diagnostic notes. The
compiler places 206 artifacts in the Established bucket, 22 target artifacts in
Ruled Out, and 2 chains in Retracted. That does not mean "206 theorems"; it means
the artifacts survived as valid contributions to the state graph. Many are
partial reductions, audits, no-go results, or precise gap isolations.

## Executive Summary

The program made its biggest advances in four modes.

1. **Structural reduction and exact accounting.** Early rounds created the
   shield-reduction framework, exact cover quantities, and the first formal
   combinatorial core.
2. **Upper-bound refinement.** The Shortener-side strategy line improved the
   public linear upper-bound constant through 13/36, 5/16, and eventually the
   Round 15 -> Round 57 -> Round 60 sub-0.19 route.
3. **Lower-bound and obstruction discovery.** The fan/capture hierarchy, T1/T2
   lower bounds, sparse obstruction families, and fixed-rank barriers clarified
   why the problem is not a naive sieve problem.
4. **Failure-to-theorem conversion.** From roughly R35 onward, much of the
   program's progress was not "prove the hoped-for theorem" but "turn a failed
   proof class into a named obstruction." R49-R56 are especially strong in this
   sense.

The program failed most often when a static combinatorial inequality was
promoted to an online game-length bound without paying for the dynamics. The
second recurring failure was strategy-dependence: proving something about a
named Shortener strategy, especially sigma^star, then accidentally treating it
as a minimax theorem. The third was game legality: proposed Shortener moves
often divided prior Prolonger moves, or proposed batches contained comparable
integers.

The program appears unusually good at **frontier-map construction**: producing
many plausible proof attempts, stress-testing them adversarially, extracting the
minimal failure mechanism, and converting those mechanisms into a taxonomy of
barriers. That is valuable well beyond this game, especially in domains where
progress means discovering the right obstruction before discovering the final
proof.

## Progress Timeline By Round Cluster

The round numbers are approximate clusters, because several round numbers have
many parallel artifacts and follow-up audits.

| Rounds | What improved | Type of task | Why it mattered |
|---|---|---|---|
| R01 | Shield Reduction, exact cover perspective, first theorem graph | Structural reduction, formalizable proof core | Established a durable object to reason about: lower-half weighted cover/shield quantities instead of raw play traces. |
| R01-R03 | Fixed-shield and vaccinated-shield barriers | No-go theorem, strategy diagnosis | Showed that simple prefix/shield routes have ceilings. This was progress because it prevented repeated use of weak proof templates. |
| R05-R08 | 13/36 and 5/16 upper-bound line | Explicit Shortener strategy, Bonferroni repair, formalization | Converted odd-prime Shortener openings into real linear upper bounds and created a verification pattern. R08 superseded the 13/36 line with 5/16. |
| R09-R12 | Carrier-capacity, universal block-product, disjoint-carrier theorem | Refutation plus restricted positive theorem | Mapped which carrier ideas were real, which were only barriers, and where overlapping carriers became the hard case. |
| R13 | Fan hierarchy, upper-half fan lower bound, sparse obstruction, second-order lower bound | Parallel proof search, cross-family audit, lower-bound construction | The program discovered that the lower side has serious multiplicative structure. It also killed several overclaims about linearity and matching upper bounds. |
| R14-R15 | Piecewise density model and Round 15 local prime-count lemma | Upper-bound constant optimization, numerical certification | Produced the local density profile that later powered the sub-0.19 theorem path. At this stage it was a strong model plus a known transfer gap. |
| R18-R23 | Matching-upper-bound and certificate-family routes stress-tested | Refutation of natural upper-bound programs | The program learned that residual width and squarefree closure are much harder than static certificate size. Several attractive O(n/log n) or O(n log log n/log n) routes died for precise reasons. |
| R21-R22 | T2 lower-bound repair and activation audit | Proof repair, local-to-global wrapper work | Moved the second-order lower bound toward a rigorous prose theorem with finite-core/formalization support. |
| R24-R34 | Directed rank-3 closure, online race, robust transversal, sigma rule | Model building, toy probes, strategy extraction | Progress was mostly narrowing: the missing theorem became a dynamic closure/transversal statement rather than a vague "upper-bound problem." |
| R35-R39 | Dyadic state estimate, online amortization gap, freshness and packet reductions | Static theorem plus dynamic gap isolation | R35 closed a substantial static estimate, then R36-R39 correctly prevented overpromotion by isolating the online amortization/freshness/packet bottlenecks. |
| R40-R48 | Collision forcing, ST-capture, Carleson/LRQC/endpoint attempts | Adversarial refutation and mechanism extraction | This was a failure-heavy phase, but productive: repeated proof routes were killed by named constructions such as packet-separated cores, single-leaf forcing, legal composites of illegal primes, and Sathe-Selberg cross-composites. |
| R49-R56 | Proof-class barriers and structural negatives | Meta-diagnosis, negative structural theorem, proof-class taxonomy | The program stopped chasing one lemma at a time and identified whole classes of proof techniques that cannot close the target. This is one of the strongest research modes in the repo. |
| R57-R60 | Bonferroni-4 sub-0.19 upper-bound repair | Proof repair, prime-rounding bridge, formal/numerical reconciliation | Returned to a concrete upper-bound deliverable. R57 supplied the finite Bonferroni-4 theorem, the Codex audit located the exact missing comparison theorem, and R60 proved the missing Theorem 2.1 and 4.1 bridge. |
| R58-R59 | R52/R53 audits | External confirmation and sharpening | Confirmed the transversal-integrality/Sherali-Adams barrier and the q-shadow/covering dichotomy, turning late-stage diagnosis into safer paper material. |

## What Counted As Real Progress

The strongest progress moments were rarely "one model solved the whole
problem." They were usually one of these smaller but durable transformations.

### 1. A vague game became a smaller mathematical object

Examples:

- R01 turned game play into shield reduction and beta(P).
- R12/R13 turned carrier overlap into disjoint-carrier and rank questions.
- R22/R29 turned upper-bound closure into robust central transversals.
- R35-R39 turned "prove sublinear" into online amortization, freshness,
  packet-concentration, and pair-reuse sublemmas.
- R52-R53 turned blocker-duality trouble into transversal-integrality and
  q-shadow/covering alternatives.

This is the program's best creative move: it names the right object.

### 2. A candidate proof was repaired by locating the exact missing bridge

Examples:

- R06-R08 repaired the Bonferroni monotonicity issue in the early 13/36 line
  and then improved the strategy to 5/16.
- R57-R60 repaired the Round 15 breakpoint/envelope and comparison-sequence
  gap by separating the prime-sequence Bonferroni-4 comparison theorem from
  the prime-rounding bridge.
- The T2 work repeatedly separated finite Maker-first core algebra from
  activation-stage bookkeeping and the final global wrapper.

The program is good when the task is: "This proof almost works; find the exact
nontrivial lemma it needs, then prove or refute that lemma."

### 3. A false route became a reusable obstruction

Representative examples:

- Carrier capacity failed because intervals in the upper half hit all small
  primes, giving divergent reciprocal mass.
- Static certificate families failed because installation costs and residual
  width were not controlled dynamically.
- Collision forcing failed because Prolonger could accumulate useful scores
  without packet collisions.
- ST-capture failed by single-leaf forcing.
- LRQC and endpoint-incidence failed through packet/coface and legal-composite
  counterexamples.
- Separator-first packet routes failed because upper-half dyadic shielding
  can exhaust small legal separators.

These failures are not waste. They are now the map of what any future proof
must avoid.

### 4. Numerical and toy evidence localized the next lemma

The program did not use computation merely to "support" guesses. It used small
models to discriminate between mechanisms:

- exact or heuristic minimax probes for sigma-like strategies;
- one-cylinder arithmetic models to separate abstract hypergraph failures from
  arithmetic-structure successes;
- Gamma_2 and pair-reuse probes to locate packet bottlenecks;
- Bonferroni and piecewise-density calculators to stabilize constants.

The most useful computations were those that produced a named obstruction or a
specific lemma target, not those that only gave a fitted asymptotic.

### 5. Cross-family and formal verification changed theorem status

The harness made progress when outputs were routed through adversarial audits
and, where possible, Lean/Aristotle:

- early formalization gave confidence in the shield and upper-bound cores;
- adversarial audits caught the Bonferroni, antichain, static/dynamic, and
  sigma^star errors;
- late audits upgraded R52/R53/R57/R60 material into safer paper-facing form.

The pattern is important: "model consensus" was useful, but "different families
agreeing on a specific failure mechanism" was much stronger than several
similar proof attempts agreeing on a conclusion.

## Where The Program Failed Or Hit Issues

This section classifies failures by task type rather than by chronology.

| Failure type | Typical task where it appeared | Representative rounds | Diagnosis |
|---|---|---|---|
| Static-to-dynamic promotion | Turning a certificate, cover, state inequality, or density estimate into a game-length theorem | R15-R16, R18-R23, R35-R39, R44 | Static mass bounds did not pay for Prolonger's adaptive move order, installation cost, or Shortener's dynamic unresolved mass. |
| Strategy conflation | Proving a statement against one named strategy or one Prolonger pattern, then reading it as minimax | R12, R35-R54 | The opponent can switch strategy, and sigma^star is not automatically optimal. Strategy-specific facts must stay labeled. |
| Antichain legality errors | Proposing batches or responses without checking divisibility against played moves | R12, R13, R46-R48 | Legal composites of illegal primes and illegal prime divisors of Prolonger activators repeatedly broke attractive arguments. |
| Local-to-global summation gaps | Proving a one-shield or one-packet estimate, then summing over a family | R39, R42-R44, R47-R52 | Shared cofaces, packet reuse, common cores, and covering-design integrality gaps made family sums much larger than local bounds. |
| Toy-model mismatch | Extrapolating from an abstract hypergraph or fixed-band model to the arithmetic game | R33-R37, R41 | Some abstract counterexamples disappear in arithmetic models, while some arithmetic cross-band/cross-composite effects are invisible in abstract models. |
| Numerical-to-theorem transfer | Using a stable constant before proving the comparison sequence/envelope theorem | R14-R15, R57 | The constants were often right before the theorem was ready. The missing work was the monotone envelope, breakpoint excision, or prime-rounding bridge. |
| Proof-class exhaustion | Repeatedly trying variants of a route whose core budget is one-sided | R49-R56 | Many state-inequality and separator-first approaches lacked a Prolonger-side resource accounting. Once amplification is free, the proof class floors out. |
| Process/tooling failure | Capturing verifier outputs, stale state, missing prompt context | R08 verify-open audit3 and scattered notes | The harness improved by making paste capture, frontmatter, compiled state, and per-round commits part of the workflow. |

The biggest mathematical pattern is this:

> If a proposed upper-bound proof has a static object C and then says
> "Shortener can pay for all useful/residual/shadow objects generated by C,"
> the likely missing line is an online amortization theorem. Without that line,
> the proof is probably only a static theorem.

The biggest game-theoretic pattern is this:

> If a proof assumes Shortener will claim a prime, check whether the prime is
> legal and whether a legal composite has higher sigma^star priority. Many
> late-stage failures live exactly there.

## What The Program Is Good At

The harness is good at several kinds of novel research work.

### 1. Frontier-map construction

It can explore many plausible routes and leave behind a durable, queryable map:
what works, what fails, why it fails, and what exact lemma would be needed next.
That is different from solving the headline problem, but it is highly valuable
in an open-ended research setting.

### 2. Adversarial proof debugging

The program is strong at finding the hidden quantifier change:

- fixed strategy vs. minimax strategy;
- one object vs. a family of objects;
- static count vs. online game cost;
- local separator vs. globally legal move;
- fractional cover vs. integral blocker.

This is exactly the kind of bug human researchers also miss when a proof is
close enough to be seductive.

### 3. Converting failures into named negative theorems

R49-R56 show a mature mode: instead of trying another nearby proof, the program
names the proof class and proves or argues that the class cannot reach the
desired target. This creates reusable scientific value even without full
closure.

### 4. Hybrid empirical-theoretical iteration

The program works well when finite experiments are used as microscopes:

- exact small games to discover optimal strategy shape;
- toy arithmetic models to test whether abstract obstructions are real;
- numerical quadrature/certification to stabilize constants;
- counterexample searches to locate the smallest failing configuration.

The key is that the computation is not the conclusion. It is a guide to the
next theorem or refutation.

### 5. Formalization of finite cores

The Lean/Aristotle work is strongest when the target is a finite combinatorial
core, an algebraic identity, or a local legal-live-edge criterion. It is weaker
as a first-pass tool for long analytic-number-theory wrappers. The right pattern
is: isolate the finite core, formalize that, and keep classical analytic inputs
as named assumptions or prose lemmas until they justify their cost.

### 6. Conservative theorem-status management

The action graph helps avoid an ordinary research failure mode: treating a
beautiful partial as if it were a theorem. The program repeatedly demoted
itself correctly after audits. That is a real capability.

## What The Program Is Not Good At Yet

The repo also shows limits.

1. **One-shot closure of a hard dynamic theorem.** Fresh threads often produce
   plausible closure claims, but the harness earns its keep by auditing them,
   not by trusting them.
2. **Unlabeled strategy dependence.** If the prompt does not force
   strategy-independence labels, results about sigma^star or a named strategy
   can be overpromoted.
3. **Static-to-dynamic bridges.** The program can find and name these bridges,
   but they remain the hardest actual proof obligations.
4. **Long proof-class formalization.** Lean is useful for finite cores, but full
   paper-level analytic wrappers still require careful prose and targeted
   audits.
5. **Prompt drift.** When the compiled state is stale or the prompt carries too
   much narrative anchoring, fresh researchers re-derive old dead ends.

## Other Problem Domains Where This Would Be Useful

The workflow transfers best to domains with all of these properties:

- there are many plausible proof/algorithm/design routes;
- local evidence can be generated cheaply;
- failure mechanisms are valuable if named precisely;
- adversarial examples matter;
- the final answer depends on a subtle dynamic or quantifier issue.

Strong fits:

1. **Extremal combinatorics and combinatorial games.** Especially problems with
   hypergraph containers, online hitting, saturation games, Maker-Breaker
   variants, or divisibility/additive structure.
2. **Online algorithms and adversarial scheduling.** The static-to-dynamic gap
   in this repo is closely analogous to competitive-analysis mistakes where a
   static LP or potential does not survive adaptive arrivals.
3. **Proof complexity and integrality gaps.** The late blocker-duality,
   Sherali-Adams, covering-design, and fractional-vs-integral themes are natural
   proof-complexity territory.
4. **Security protocol and cryptographic proof review.** The harness is good at
   finding hidden quantifier changes, adversary-strategy assumptions, and
   "works against this attacker" vs. "works against all attackers" mistakes.
5. **Distributed systems correctness.** Many bugs there are static invariant vs.
   asynchronous execution bugs. The harness's adversarial audit loop maps well
   to invariant proof, counter-schedule search, and model-checker-guided repair.
6. **Mechanism design and market design.** Strategy-dependence and adversarial
   response are central. A similar round graph could track candidate mechanisms,
   incentive counterexamples, and restricted positive theorems.
7. **Optimization and solver research.** The workflow could classify when a
   relaxation, rounding scheme, or primal-dual argument fails because of an
   integrality gap, bad dynamic ordering, or missing resource accounting.
8. **ML evaluation and agent-harness design.** The same method is useful for
   discovering where an apparent model capability is only prompt-specific,
   benchmark-specific, or vulnerable to an adversarial transcript.
9. **Program synthesis and formal methods.** The "finite core plus prose
   wrapper" pattern is especially good for separating machine-checkable kernels
   from domain assumptions.

The broad lesson is that this harness is not merely a math-output generator. It
is a **research-state machine**: it accumulates attempts, audits, refutations,
formal cores, and synthesis into a durable structure. Its strongest export to
other domains is the discipline of making every failure mechanism precise enough
that the next attempt starts beyond it.

## Practical Lessons For Future Rounds

1. Start every dispatch from the compiled state, not from memory.
2. Ask for theorem status explicitly: strategy-independent, strategy-specific,
   conditional, diagnostic, or refutation.
3. When a proof uses a static inequality, require the exact online amortization
   lemma as a separate line item.
4. When a proof uses sigma^star, require a paragraph explaining whether the
   statement survives replacement by an arbitrary Shortener strategy.
5. When a proof proposes a Shortener response, run a legality check before any
   asymptotic accounting.
6. Prefer prompts that ask for "full proof or named obstruction." This repo's
   best work often came from accepting a rigorous obstruction as success.
7. Keep toy probes tied to a decision: what theorem would this support, and
   what counterexample would kill it?
8. Formalize finite cores, not sprawling papers. Make the wrapper explicit in
   prose, then decide whether it deserves Lean.
9. Preserve negative results in the action graph. They are the research program,
   not debris around it.
