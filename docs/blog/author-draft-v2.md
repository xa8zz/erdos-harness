# Fully autonomous research systems are inevitable.

The harness primitives I used for math research are almost indistinguishable from the ones used by coding agents. This is not a coincidence. Math and coding are both verifiable domains, and verifiable domains will converge to a single universal harness. The great task of the coming decade is making more domains verifiable. If that thesis is right, research becomes a compute and tooling problem, and the human stops being necessary.

Right now, autonomous AI research does not work. You need a human handling the systems end-to-end. This essay is about why that is temporary, what the human actually provides in the meantime, why none of what the human provides is "research taste," and why my own case is evidence rather than a demonstration of human indispensability.

## Where we are

AI-driven research today is where AI-driven coding was eight to twelve months ago. Inconsistent moments of amazement with spiky, prompt-dependent performance. Most visible wins come from humans fitting the AI into a narrow enough problem space that the model can succeed. The narrower the problem, the better the models do. That is true of machine learning in general and it is true of research.

The common mistake is reading that as permanence. People look at current AI-driven research, notice that a human is always in the loop, and conclude that humans will always be necessary because there is some abstract "research taste" only we have. That is wrong. We are sitting at a temporary intersection between what humans can do and what AI systems can do where we happen to be helpful. The intersection is narrowing fast.

## A supporting case

I had never done math research in my life before this project. In high school I did well in my classes without much effort and placed in local competitions. That does not compare to the competency it takes to move frontier mathematics. The peer group that moves frontier mathematics is orders of magnitude more competent than me.

Five days ago I started working on Erdős Problem 872, an unresolved question posed in 1992 and catalogued as problem 872 in Bloom's list. No non-trivial upper bound on the game value appeared in the public record until early 2026. Price and GPT-5.2 Pro published the first linear upper bound of 23/48 and introduced the Prolonger / Shortener terminology. A forum thread of refinements by Adenwalla, StijnC, natso26, Xiao_Hu, and Desmond Weisenberg moved the public record to 419/1008, approximately 0.416n.

Last night I submitted a paper containing:

- A linear upper bound of L(n) < 0.19n, driven by an explicit fourth-order Bonferroni constant certified under 0.1897.
- The first unconditional lower bound of order strictly larger than n / log n, specifically (1/8) n log log n / log n.
- A shield reduction theorem that converts terminal game positions into a weighted antichain problem.
- An exact first-hit cover theorem of size 5n/24 + O(1), with a matching lower-half packing.
- Intermediate upper-bound constants of 13/36 and 5/16.
- A polynomial shield-weight lower bound (Theorem A).
- Three obstructions recorded for future attempts, each with a specific refutation mechanism.
- Lean 4 zero-sorry formalizations of the shield reduction, the exact 5/24 cover, the 13/36 upper-bound core, and the W₄/2 endgame reduction. Machine-checked.

The cost was three $200-per-month AI subscriptions. Token equivalents at list price would run into the thousands. Every round in the program was at least an hour on average, often longer. I worked on it essentially full time for five days.

I understand almost none of the novel math I just published. I have no research taste. I cannot look at a formula and say "maybe we should explore this way." That never happened once during the project. The work is construction using existing tools, which is something AI is good at. Nothing here is a genuinely novel mathematical technique.

The point is not that I did this. The point is that if someone with no domain competence can contribute at this level, then "research taste" is not the bottleneck it looks like, and the parts of the process that are actually load-bearing are mechanical, explicit, and transferable.

## What the human actually provides

There are two altitudes.

Strategically, I provide two things:

- **Prompt strategy.** How to frame a problem for a specific model. What context to include, what to leave out, how many angles to request, how to structure a follow-up after a refutation. Prompt strategy varies by model and by round.
- **Direction strategy.** Which angle to dispatch next given where the program currently is. When to push deeper into a lemma, when to retire a strategy, when to dispatch the contrarian angle, when to zoom out, when to formalize.

Operationally, both altitudes are enacted through five tasks:

- **Mistake analysis.** After a round finishes, what went wrong and why. Most of the thinking between rounds is this.
- **Verification.** Cross-family informal audits in parallel tabs of Claude, Gemini, and GPT-thinking. Formal verification in Lean 4 via Aristotle for anything promotion-grade.
- **Coordination.** An orchestrator session in Claude Code talking to roughly five specialist agents per round: coding, computational verification, primary research (usually GPT Pro), adversarial audit (usually Gemini), synthesis.
- **Compute access.** The subscriptions, the Lean toolchain, local simulation compute for empirical probes.
- **Process.** The repo itself. Every round produces exactly one round document with YAML front-matter. A script compiles all front-matter into a single source-of-truth state document. Skills capture reusable workflows. Per-round git commits as the durability layer.

On top of both altitudes I do one meta thing: continual learning across rounds. I notice patterns in how each model fails. Gemini is delusionally optimistic and will work on anything you give it. Claude gives up first and sometimes needs a pep talk. GPT Pro is the most willing to grind. AIs do not respect the intent of an instruction, so telling a smarter-than-you model "do not try this approach" is constraining a superior intellect with your inferior priors, and it is almost always the wrong call.

I notice that all current models are bad at context engineering and harness engineering, and they will stay bad at it until their base-model training runs catch up to recent tooling. I noticed, on round forty of a single sub-program, that one unverified micro-detail had been loadbearing the whole time. That round cost me forty rounds of downstream work. The rule I burned on was not AI-specific: verify everything. AI just makes the consequences of skipping verification cheaper to incur and more expensive to find.

None of that is taste. All of it is mechanical. All of it is solvable.

## Why all of it is solvable

Continual learning across rounds is the part I do that the models cannot yet do for themselves. The entire harness exists to simulate it for them. The file tree is continual learning. The front-matter is so that thirty round documents compile into one state doc. The synthesis I do in my head of "here is everything that has happened and here is the conclusion I draw from it" is an AI task given front-matter on every doc and enough context.

File trees are a hacky, inefficient substitute for continual learning. They work. They generalize a model's effective capability far beyond its in-context window. There is no reason to believe that through model advances, RL, and growing effective context, each of the things I provide will not be absorbed into the model. If AI had infinite context, most human research and endeavors would be solved. That is purely a compute engineering problem.

The RL reward is the result. If you can verify the result, you can train toward it.

## Tool-shaped AI, skill issues, and the great unequalizer

Without the ability to autonomously plan and work over long horizons, AI in productive settings remains tool-shaped. Its total utility is an amplifier of the wielder. When someone finds AI unproductive, or thinks it is overhyped, or cannot produce good outputs from it, in almost every case this is a skill issue. They are a worse wielder.

This is true in the same way that an experienced engineer gets dramatically more out of a coding agent than a first-time user, not because the model behaves differently but because the experienced engineer knows what to ask, when to trust the output, and how to recover when the agent goes off the rails. Every productivity tool amplifies the distribution of its users.

In the short term, AI is the great unequalizer. It widens gaps rather than closing them. The competent get much faster. The less competent get slightly faster or stay the same. Distributions that were close together separate. This is an uncomfortable claim, and I think it is obviously true, and it is why the interesting long-term question is not whether AI is productive but how to get more people past the skill floor.

## A real harness absorbs new models; it doesn't wrap them

I work in harness engineering professionally, so I want to be precise.

The harness I built has these mechanics:

- **Round docs.** One dispatched prompt produces exactly one round doc. Round docs are atomic and immutable once committed.
- **YAML front-matter.** Every round doc carries a status, an action graph (refutes, supersedes, extends, with pointers to prior round IDs), and metadata.
- **Auto-compile.** A script reads every front-matter block and produces one state document describing what is established, what is conditional, what is ruled out, and what is open. Nobody hand-edits the state. It is derived.
- **Skills.** Reusable workflows captured as triggered procedures. Zoom out when you notice a rabbit hole. Write an audit prompt for verifier tabs. Commit the round before moving on.
- **Three verification layers.** Informal cross-family tabs, cross-family convergence as a stronger truth signal than within-family agreement, and formal verification in Lean 4 via Aristotle for promotion-grade claims.
- **Per-round git commits.** Saved-but-uncommitted work is as lost as non-existent work.

That is the farthest I could take the harness I have. I would not trust it past that point without adding tools, because pushing it beyond its design envelope would break a core principle: a real harness is a spine. When a better model arrives, you add tools to the spine. The spine does not change. You do not rebuild the harness per model release.

Most autonomous research systems publicly written about today are not harnesses. They are ad-hoc scaffolds built tightly to the behavior of a specific model, often with brittle orchestration loops and implicit assumptions about what the model will do. They will not survive a model upgrade. I will put it plainly: I guarantee the research systems displayed today will not be used in the slightest a year from now, whether as-is or ported to newer models. The primitives do not generalize, which means each new model release resets the harness.

## The verifiability triangle

The harness and agent primitives I use for math research are extremely similar to the ones used by coding agents. This is because math and coding are both verifiable domains. It also points to a second reason autonomous research does not yet work: it does not work in coding yet either. Even in verifiable coding subdomains like optimization and algorithms, fully autonomous systems do not exist. They are close. They are not there.

It is unlikely that some special-case research harness will outrun the best coding harnesses. The primitives are too similar. The more likely outcome is that all verifiable domains converge onto a single universal harness, and autonomous coding and autonomous research cross the threshold at approximately the same time.

That reframes the question. It is not "when will autonomous research work?" It is "can we make this obscure system verifiable for AI?" Psychology, economics, political science, mechanistic interpretability, governance. These are not verifiable in the sense that math and coding are. The great task of the coming decade, if the thesis is right, collapses to one question: can we make this verifiable?

## How verifiability gets solved

My bet: simulation and world models combined with RL, plus training models to know what out-of-distribution outcomes look like and when to seek them. I am not a researcher. I cannot predict the shape. I can predict the direction.

In my spare time I build private benchmarks that simulate running a town or a collection of companies. You see emergent behaviors in those simulations that do not appear in standard benchmarks. The future of RL environments is not "better test questions." It is "how do we make this domain verifiable?" Build the simulated environment, let the model iterate inside it, measure outcomes, close the loop.

Consider the thought experiment. If Claude Opus 7 runs for president in 2036, how does it know it is doing a good job? Because in simulation it has run for president a trillion times against a trillion other agents, iterating a million times over. It might not understand how any single real-world run maps to the simulations, but it generalizes across every scenario the simulation produced. The constraint to getting there is not algorithmic. It is compute.

Gets solved by a human right now, or eventually by any AI. The distinction collapses.

## Bottlenecks

Short-term, the models cannot invent genuinely new mathematical objects. They pattern-complete over the existing canon. Every thread of this project that required inventing a categorically new object failed. The specific gap I converged on after forty rounds is an object I now call online covering-design interdiction. Nothing in the existing combinatorial, number-theoretic, or adversarial game-theoretic literature gives this. The models could classify adjacent pieces, refine partial statements, refute bad candidates, and find cross-family convergence on the gap, but they could not produce the object itself.

Short-term, the failure modes are real but manageable. Rabbit holes. Models giving up without pep talks. Models not respecting intent. Static state inequalities read as dynamic game bounds without a translation argument. After ten or more rounds on a single thread, the assumed adversary strategy can silently trap you: every theorem you prove might depend on a strategy assumption that is not optimal, and you will not see it until you zoom out and audit the assumption explicitly.

Effort is its own bottleneck. Five days could have been one or two with more parallelism, if Gemini Deep Think had not rate-limited me into rationing, if I did not have a day job, if I were five times as fast. That is a human constraint on a system that wants to run faster than any one human can push it.

Long-term, the bottleneck changes. Once capability is solved, the bottleneck is human adoption. As with every prior general-purpose technology, the rate of diffusion lags capability because it is downstream of human attention, skill, and trust. Short-term, AI is an amplifier and an unequalizer. Long-term, AI is gated by human adoption speed. The bottleneck travels from capability to distribution, but the bottleneck is always human.

## An apology

I did not fully solve Erdős Problem 872. I want to name that clearly.

I had the paper-level contribution about two days in. I could have stopped, written up what I had, and shipped. Instead I spent three more days chasing the full solution because I wanted to prove a point about autonomous research more than I wanted to scope my contribution honestly. I failed to close the problem.

Someone smarter than me, running a similar or better harness on this same compiled state, could probably finish it. I am guessing. I do not know. But I have the feeling that some of the brightest minds in extremal combinatorics or multiplicative number theory, given the front-matter compiled state of the program and the same tools I had, could take the online covering-design interdiction diagnosis and produce the missing object. I would not be surprised if a stronger reader looks at the round docs and asks "why didn't you try this instead?" I hope that happens. If it does, it is further evidence for the thesis of this essay, not against it. The remaining gap is me, not the system.

I tried as hard as I could for five days. I am sorry it was not enough to close the problem. I hope the partial contribution is useful, that the harness is useful to anyone with more competence than I have, and that the next person closes it.

## Acknowledgments

This project would not have been possible without OpenAI's Codex and GPT Pro. OpenAI's ongoing devotion to public AI access is one of the more underrated stories of this cycle. A company four times smaller than Google, with less compute and a much shorter history, served more consumer AI inference to me over the last five days than Google's Deep Think rate limits allowed in the same window. I do not understand the economics. I am not sure Google does either. I love you, OpenAI. Please do not change.

Anthropic's Claude was the orchestrator for every session in this project. It is also the model I gave pep talks to. Thank you.

To the forum thread that moved the public record before I started, Price, Adenwalla, StijnC, natso26, Xiao_Hu, and Desmond Weisenberg: your work was the launchpad. Thank you.

To Google: please fix the rate limits. I really did want to use Deep Think more than you allowed.
