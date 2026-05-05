Original reorder with bracketed suggestions inline. Sources in brackets: `[B]` brain dump ([author-raw-transcript.md](author-raw-transcript.md) / [author-answers.md](author-answers.md)), `[S1/S2/S3]` the three recent scribble notes, `[P]` the paper, `[R]` the repo/harness.

---

**§1 — Bio + "Why?" hook**

> [ADD: sharpen the incompetence — `[B]` "I have no math research taste. I can't look at a formula and say 'maybe we should explore this way.'" That specific disclaimer is the most load-bearing sentence in the whole piece.]
> [ADD: foreshadow the answer — applied-AI + harness-engineering taste. You use this phrase in the brain dump and it's the bridge the "Why?" wants.]
> [CONSIDER: promote one line from the tweet draft here as the second sentence — "Last night I submitted a partial contribution to a 33-year-old unresolved Erdős problem using only a custom agent research harness" `[S2]`. It turns the "Why?" from rhetorical to urgent.]

Prior to AI, I had never done math research in my life. In high school I did well in all of my math and science classes without much effort and I placed well in some local competitions. This does not compare at all to the level of competency it takes to do frontier research well and the peer group that leads frontier research. They are OOMs more competent than me in this - yet I can contribute. Why?

---

**§2 — Grounding: "It took me five days"**

> [ADD: concrete deliverables, because right now the reader has no ground truth about what "contribution" means. `[P]` Upper bound L(n) < 0.19n (W₄/2, certified ≤ 0.1897…). First unconditional lower bound strictly above n/log n: (1/8) n log log n / log n. Shield reduction theorem, exact 5n/24 first-hit cover, intermediates 13/36 and 5/16. Theorem A polynomial shield-weight lower bound. Three §8 obstructions as negative deliverables. Lean zero-sorry artifacts for Shield Reduction, exact 5/24, 13/36 core, W₄/2 endgame.]
> [ADD: prior public record `[P]` — no non-trivial upper bound in the public record until early 2026. 23/48 (Price + GPT-5.2 Pro, who also named Prolonger and Shortener) → 419/1008 ≈ 0.416 (forum thread: Adenwalla, StijnC, natso26, Xiao_Hu, Desmond Weisenberg). This is the baseline I moved.]
> [ADD: cost `[B][S2]` — 3 × $200/mo AI subs; thousands of token-equivalents; ≥1 hour per round on average. "It genuinely could have been done in one or two [days] if I had parallelized like five times as fast and if Gemini Deep Think didn't have rate limits and I didn't have my job" `[B]`. The effort-bottleneck framing `[S3]` wants to appear here.]
> [ADD scope disclaimer `[B]`: "Nothing in our work is a genuinely novel mathematical technique. It's construction using existing tools, which is something AI is better at." This is the most honest line in your brain dump and belongs near the deliverables, not hidden at the end.]

It took me five days

---

**§3 — Thesis**

> [OPTIONAL: one foreshadowing clause — "…because the domain is verifiable, and the harness primitives are indistinguishable from coding agents." Currently the thesis lands without a reason attached; the reason comes later in §9. Either leave it to build or give a one-line teaser.]

Fully autonomous research systems are inevitable.

---

**§4 — Positioning**

> [SHARPEN: "prompt death pendent" is likely a transcription glitch for "prompt-dependent" — flagging so you don't lose the word.]
> [OPTIONAL ADD: one concrete example of spiky performance `[B]` — e.g., Claude in one session saying "I don't think I can do this, but I'll help you synthesize a prompt for GPT Pro"; same Claude after a pep talk producing the legitimate angle that unblocked a round. That's the spikiness, made real.]

The state of AI-driven research is where AI for coding was 8 to 12 months ago. Inconsistent moments of amazement with spiky task and prompt death pendent performance.

---

**§5 — Primitive-now + anti–research-taste**

> [NEW SUBSECTION WORTH INSERTING BEFORE OR AFTER THIS: the tool-shaped / skill-issue frame `[S1]`. "Without autonomous long-horizon capability, AI in productive settings remains tool-shaped. All utility is an amplifier of the wielder. If someone is incompetent with AI or thinks it's unproductive, it is a skill issue." This is sharper than "research taste is unnecessary" because it's about the *user*, not the model, and it pairs with the long-term bottleneck section at §14.]
> [ADD: the amplifier-of-distributions claim `[S1]` — "AI is the great unequalizer in the short term; amplifier of any and all distributions." Either here (short-term claim) or paired with §14 (long-term claim) as a short/long diptych.]
> [ADD: what steering actually looks like `[B]` — "I never decided on a specific map. I never looked at a result and said 'I think this map angle is what will work.' That never happened once. I could just tell by the responses and how there are patterns to it. I very quickly caught on to when rabbit holes were starting, and I would just steer it." This is the operational definition of applied-AI taste and the draft currently has no example of it.]

Right now AI-driven research is very primitive. You need a human handling the systems end-to-end. Like all of ML, the more narrow a problem space, the better any given model can perform. Most AI-driven research today is from humans fitting the AI within a narrow enough problem space for it to help. The mistake that some people make here, is assuming that humans will always be necessary for this and there this is some kind of abstract "research taste" will be necessary in the near term future to do SOTA research. We are simply at an intersection between what humans can do and what AI systems can do where we are helpful to them.

---

**§6 — What I provide (list)**

> [RECONCILE: the current 5-item list (mistake analysis / verification / coordination / compute access / process) is the *operational* layer. Scribble 3 names a *strategic* layer: prompt strategy + direction strategy `[S3]`. These don't conflict — they're different altitudes. Consider presenting as nested: two strategic levers (prompt, direction), each enacted through the five operational tasks. Or: pick one altitude and be consistent.]
> [ADD: the meta-layer from `[S3]` — "continual learning on progress to a solution and realizing/utilizing AI researcher patterns." Second half (noticing model-behavior patterns, not just problem-state) is the sharper claim and not yet in the draft.]
> [ADD: concrete examples per bullet so the list isn't abstract:]
> [  · mistake analysis → the 40-round detour from one unverified detail `[B]`]
> [  · verification → Aristotle/Lean zero-sorry artifacts as the strongest filter `[R]`]
> [  · coordination → orchestrator Claude + ~5 specialist agents (coding, compute-verify, research GPT Pro, Gemini audit) `[B]`]
> [  · process → round docs + YAML front-matter + `compile_rounds.py` auto-synthesis `[R]`]
> [ADD: the Claude pep-talk story `[B]` as the anchor example for "coordination" or "mistake analysis." It's the single most memorable anecdote in the brain dump and currently lives nowhere. Would anchor this whole section.]
> [ADD: "AIs don't respect intent; don't constrain a smarter model" `[B]` — this is an operational rule that belongs in this section, since it's a thing *you provide* (knowing when not to constrain).]

When I do research with AIs, this is what I provide them:
- Mistake analysis
- Verification
- Coordination
- Compute access
- Process

---

**§7 — Why it's all solvable + file trees**

> [COMPLETE THE TRAIL-OFF: "…there is no reason to assume that through model advances, RL, and larger effective context, each of these provisions won't be absorbed by the model itself." You can finish the sentence directly from the brain dump: "If AI had an infinite context window, all human research and endeavors would be solved; that is purely a compute-engineering issue." `[B]`]
> [ADD: the synthesis-is-an-AI-task claim `[B]` — "The synthesis I do in my head of 'here's everything that's happened and here's the conclusion I draw from it' can be done by AI. I can make an AI do it all by putting front-matter per text and reading one giant document." This is the concrete version of "file trees are a hacky continual-learning substitute" and currently you just gesture at it.]
> [OPTIONAL ONE-LINER: "The RL reward is the result" `[S1]` drops in here or in §9 as a pull quote.]

Over all of those tasks I also provide continual learning and pattern recognition. The point being not that I am providing any value, the point being that all of these are solvable (and are being solved as we speak). File trees are a hacky, inefficient way for models to build continual learning. It works and can generalize a model's ability far more than its in-context learning window. There is no reason to assume that through model advances, RL, 

---

**§8 — Harness-engineering principles**

> [REPLACE PLACEHOLDERS: "system XYZ" and "instead aY" are unfilled. Probably meant something like: "the farthest I could go with the system I have"; "…would be an ad-hoc script [or: a scaffold] instead of a harness." Flagging so they don't ship as-is.]
> [ADD CONCRETE PRIMITIVES `[R]` — this section is currently abstract, and the mechanics are the most interesting thing in the repo:]
> [  · round doc = atomic unit; every dispatch produces exactly one]
> [  · YAML front-matter on every round doc with an action graph (refutes / supersedes / extends)]
> [  · `compile_rounds.py` synthesizes the full front-matter graph into a single `state_compiled.md`]
> [  · skills for reusable workflows (zoom-out, write-audit-prompt, commit-round, progress-zoom-out)]
> [  · three verifier layers: informal tabs (Claude/Gemini/GPT-thinking), cross-family convergence signal, formal (Aristotle/Lean 4) as strongest filter]
> [  · per-round git commits as the durability layer (saved-but-uncommitted = lost)]
> [ADD: factual-completeness doctrine `[R]` — "Compress vague prose, never compress factual detail. Specific primes, shield sets, lemmas, constants are the whole point." This is a working principle the draft doesn't name.]
> [ADD: "I guarantee the research systems publicly written about and displayed today will not be used in the slightest a year from now" — already in draft, good. Could ground with one example of a current system you're skeptical of, if willing.]

I work in harness engineering and this is the farthest I Could go with the system XYZ and what I did. I would not trust it going further because … The system would break harness engineering principles because it would not be an extensible system and instead aY, which is not a harness and just control its behaviour. When a better research model comes out, a new harness needs to be built. A good harness is where new models coming in means you need to add better tools to the original one. Most autonomous research harnesses are not built like that and break conventions. I guarantee the research systems publicly written about and displayed today will not be used in the slightest a year from now, inclusive of using them with model upgrades.

---

**§9 — Coding parallel + universal harness**

> [INSERT BEFORE OR INSIDE: verifiability-as-shared-drive reframe `[S1]` — "AI seeks verifiability by its nature. So do humans, in a separate form." This turns the coming claim from "we should make things verifiable" to "both intelligences are already climbing this gradient."]
> [PROMOTE THE TAIL CLAUSE: the last sentence ("the great task … making *all* domains verifiable") is buried but is the most important claim in the section. Pull it out as a standalone short paragraph. Sharpen with scribble 3 `[S3]`: "The object of our global systems will centralize to: can we make this verifiable?" Literal question form.]
> [ADD: domain-extension question `[S2]` — "How do we make obscure systems (psychology, economics, mechinterp) verifiable?" Either before the answer in §10–13 or as the closing line of this section.]

The harness/agent primitives that I use are *extremely* similar to what's used in coding agents. This is because math, similar to coding, is a verifiable domain. This points to another reason autonomous research is not yet possible, because it's not possible in coding yet. Even in verifiable coding domains like optimization and algorithms, fully autonomous systems do not yet exist. It's very unlikely there will be some special one-off harness that can perform more autonomously in research than SOTA coding agents can. It is much more likely that verifiable domains will converge to a single, universal harness. And also likely that the great task for diffusion, acceleration, society, etc. over the coming decade with AI advances will be making *all* domains verifiable to AI systems to fit this trend line of how real progress gets made with AI.

---

**§10 — Bottlenecks bridge (currently outline-only)**

> [This is a stub. Turn into an actual section. What belongs:]
> [  · current weaknesses `[B]` — models can't invent genuinely new objects ("online covering-design interdiction" was what this problem needed and no model could reach it from existing canon)]
> [  · what to be wary of `[B]` — rabbit holes (the zoom-out skill is the counter), models giving up without a pep talk, AIs not respecting intent, static-vs-dynamic bound conflation `[R]`, the σ*-trap at 10+ rounds of theorem-and-refutation `[R]`]
> [  · what it's similar to — already covered by positioning]
> [  · what future systems need — continual learning without file-tree hacks, self-zoom-out, out-of-distribution reasoning, invention-not-just-completion]
> [  · name the effort-bottleneck `[S3]` explicitly here]

The bottlenecks are. Current weaknesses and strengths, what to be wary of. What it's similar to, what future autonomous systems need.

---

**§11 — "All I provide is" fragment**

> [DECISION: this fragment is doing bridge work between §10 (bottlenecks) and §12 (verifiability will be solved). If you finish it, the natural completion from scribble 1 is: "All I provide is amplification. The RL reward is the result." `[S1]` That collapses the whole "what I provide" thread into the verifiability thesis.]
> [ALTERNATIVE: delete and let §10 flow into §12.]

All I provide is

---

**§12 — Verifiability will be solved**

> [ADD: the shared-drive reframe `[S1]` "AI seeks verifiability by its nature. So do humans, in a separate form" could equally live here if you don't place it in §9.]
> [ADD one-liner `[S1]`: "Gets solved by a human right now or eventually by any AI." This collapses the human/AI distinction in the long run and is a strong closer for this beat.]

There is no reason to doubt that verifiability etc. won't be solved in the future

---

**§13 — How: world-model sims, RL, scaling**

> [ADD: the private-RL-benchmarks sidebar `[B]` — "In my spare time I build private benchmarks simulating running a town or a set of companies; you see emergent behaviors that don't come out in other benchmarks. The future of RL environments is: how do we make this verifiable?" This is a concrete, differentiating anecdote and is nowhere in the draft.]
> [ADD: the Claude-Opus-7-running-for-president thought experiment `[B]` — "How does Claude Opus 7 know it's doing a good job running for president? Because in simulation it's run for president against a trillion other agents, improving over a million iterations." Memorable, plants the frame that verifiability scales via compute.]
> [ADD: the OOD-training claim `[B]` — "Train models to know what out-of-distribution outcomes look like and when and how to seek them. That's the shape of genuinely novel research."]

How I think it will be solved: world model sims, RL, scaling, etc. I'm not a researcher, but I can bet on this. 

---

**§14 — Long-term human bottleneck**

> [COMPLETE THE TRAIL-OFF: "…as has occurred with economic diffusion of AI and every prior general-purpose technology. Adoption is downstream of human attention and skill, and that lag is the bottleneck even after capability is solved."]
> [PAIR WITH §5 as short/long diptych `[S1]`: short-term = AI is an amplifier and unequalizer; long-term = humans are the adoption bottleneck. Name the symmetry explicitly if you want the structural payoff.]
> [ADD closing humility beat `[B]` — "Someone smarter will look at this and see something I missed, and I hope that happens. If it does, it points to humans being a larger bottleneck than I think." This is the single most honest paragraph in your brain dump and currently lives nowhere.]

Humans are the ultimate bottleneck to these systems long-term, as has occurred with economic diffusion of AI and 

---

**§15 — Acknowledgments**

> [KEEP THE JOKE, ADD THE SERIOUS VERSION `[S2]` — "This would not have been possible without Codex and GPT Pro. OpenAI's devotion to public access is singular: a 4× smaller org mogging Google on consumer AI inference is the story of 2025–26. Gemini Deep Think's rate limits made every Gemini round feel like rationing." You can land this playful or earnest.]
> [CONSIDER: thank the forum thread `[P]` — Price, Adenwalla, StijnC, natso26, Xiao_Hu, Desmond Weisenberg. They moved the public record from no-upper-bound to 0.416 before you started. Acknowledgment matters and also grounds the "AI-augmented public refinement" frame.]

Special ack:
- openai
- ant a bit
- fuck you google

---

**Content surfaced in the transcripts that isn't placed anywhere yet**

> [These are high-signal beats from the brain dumps that currently have no section. Slot as fits:]
>
> · **Model personalities** `[B]` — Claude gives up without a pep talk, Gemini delusionally optimistic, GPT Pro most willing to grind. Fits in §4 (positioning, as concrete spikiness) or §6 (what I provide, as context for "coordination"). Most memorable single passage in the brain dump.
>
> · **Claude pep-talk story** `[B]` — the "would you be proud if ten Claudes reference this transcript and see you didn't try your hardest" monologue that unblocked a round. Anchor anecdote for §6 or its own beat.
>
> · **Zoom-out skill** `[B][R]` — "There's a skill called zoom-out; it distills continual-learning context to the AI and unblocks rounds." First-run failure mode mitigation. Fits in §8 (harness primitives) or §10 (what to be wary of).
>
> · **Cross-family convergence as truth signal** `[R][B]` — "Agreement among Pro + Gemini + Claude is stronger than within-family agreement." Fits in §6 or §8.
>
> · **σ\*-trap / long-horizon audit** `[R][B]` — the meta-pattern that when 10+ rounds of theorem-and-refutation fail to close, the assumed adversary strategy may be the problem. Fits in §10.
>
> · **What AI couldn't do** `[B][P]` — the "online covering-design interdiction" diagnosis. The missing object is genuinely new, not in existing canon. Fits in §10 or §13.
>
> · **Progress visualizations** `[B][R]` — "Remind me: we should do cool visuals for our writeup, progress graph, branch graph." You already have `docs/blog/progress-graph.{svg,png}` and `progress-branches.html`. These exist — just embed.
>
> · **Closing invitation** — harness is not Erdős-specific; generalizes across math problems `[B]`. Could close the piece. Also pairs with an offer to open-source or help readers run the harness on their own problem.
