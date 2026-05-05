# Blog draft prompt for GPT Pro

Paste the full contents below into a fresh GPT Pro thread.

---

This is an assessment of your writing capability and will be used to grade. Do not search online. Use only the material provided in this prompt.

Your task is to produce a first complete draft of a personal blog post for Substack, based entirely on the author's raw answers provided at the end of this prompt. The post describes a 5-day research program in which the author used a multi-agent AI harness to improve the best known upper bound on an open combinatorics problem. The author is not a mathematician and explicitly cannot read the math produced by the program.

Produce the full post, start to finish. Open with the hook and go. No preamble. No meta-commentary. No "in this post I will."

The length should be whatever the material needs. Do not pad for length and do not cut for brevity. Do not do a word count pass at the end and adjust to hit a target. The author explicitly does not want that.

## Style rules (hard)

1. No em dashes anywhere. Use commas, colons, semicolons, parentheses, or new sentences instead.
2. Do not invent, extrapolate, or add analogies, examples, or implications that the author did not state. Use only claims and stories that appear in the raw material below.
3. Restate or reorganize for clarity. Paraphrase only when it improves readability. When the author's phrasing is already strong, preserve it.
4. Match register. First-person. Contractions. Mild profanity is fine if in source. Personal blog voice, not academic.
5. Hero quotes below go verbatim.
6. Vary sentence length. Short punchy sentences next to longer ones. Do not write in a uniform rhythm.
7. Avoid the usual AI-writing tells: no "in today's landscape," "it's worth noting," "dive deep," "leverage," "harness the power," "paradigm shift," "transformative," "journey," "unlock," "in conclusion," "to summarize," "the bottom line is." No section-wrapping summaries such as "as we've seen" or "as discussed above." No mirror-the-question openers.
8. Think hard about structure, transitions, and sentence order. Reorder the author's points inside a section if that reads better. Do not cross section boundaries without reason. Sentence-level craft matters.
9. If any part of the raw material is ambiguous, keep it close to the author's wording rather than interpolating. When in doubt, paraphrase conservatively.

## Audience

Two readers:

1. AI researchers who could use better harness engineering and applied-AI techniques for their own work.
2. AI skeptics who doubt AI can produce real research.

## What the post should make the reader feel

The author is the bottleneck, not the models. The harness is a set of continual-learning substitutes. Autonomous AI research is coming. The current window is short.

## Project context (for your orientation only; do not recite this back as stage-setting)

The program ran over 5 days, April 16 to 20, 2026. The author orchestrated Claude as curator, with GPT Pro, Gemini DeepThink, and Codex as primary researchers, plus Claude and Gemini instances as informal verifiers and Harmonic's Aristotle with Lean 4 as the formal verifier. 56 rounds of iterative research.

Problem: Erdős Problem #872, the antichain divisibility game. Prior baseline on the erdosproblems.com forum: Price and GPT-5.2 Pro established 23/48 as the best known upper bound in February 2026, later refined by the community to 419/1008, roughly 0.416n.

Outcome: upper bound improved to approximately 0.190n via a piecewise-density Bonferroni-4 analysis. Several structural pieces Lean-verified through Aristotle. One specific structural object, internally called a "lag" or "attention-budget" formulation, could not be derived by any model across 56 rounds and remains open.

Planned deliverables: two arXiv preprints (math paper + harness methodology paper), a sanitized public GitHub repo of the full research trail, this blog post, and a forum update.

## Hero quotes (use verbatim, exactly as written)

1. "I used AI to come up with math that I do not understand that has never been produced by any human before."
2. "Autonomous AI research is inevitable."
3. "There's nothing that I do that I believe in the future won't be replicated by AI."
4. "Our entire harness and file system exists to mimic the parts that I do for it. The file system is just continual learning."
5. "I have no math research taste. I can't look at a formula and be like, 'No, maybe we should explore this way,' but I can look at the AI's output and work patterns and then understand how to better steer it. That's my kind of applied AI taste."
6. "You are constraining an intelligent, smarter than you to not look into certain things and restrict its domain on inferior knowledge."
7. "I was just vibe researching, where vibe coding was eight months ago."
8. "Nothing in our work is a genuinely novel mathematical technique. It's construction using existing tools."
9. "I hope someone's smarter than I am. I'm sorry that I couldn't do more."

## Topics and shape

Cover these topics. The order below is a suggested narrative arc (hook, outcome with scope, what the author actually did, the harness as continual-learning substitute, prompting, direction, what AI couldn't do, verifiability, costs, close). If you see a better arc, use your judgment, but keep topical coverage. Sections can merge, split, or reorder. Each section should be whatever length the material needs.

1. **Hook and thesis.** Open with hero quote 1, then pivot to the thesis that the author is the bottleneck, not the models. Use hero quotes 2 and 3.

2. **What came out, with honest scope.** The outcome: 0.190n upper bound, several Lean-verified pieces, one unresolved structural object. Credit Price, GPT-5.2 Pro, and the forum community at 0.416n without hedging. Then the scope disclaimer: nothing in this work is a novel mathematical technique; it is construction using existing tools, which is what AI is currently best at. Use hero quote 8. Point forward: brand-new techniques will come when someone builds verifiable environments for novelty.

3. **What I actually did: the bottleneck in practice.** Strategy and direction across rounds. Pattern recognition about what models are adept at and what cycles they get stuck in. AI as an infinite-patience explainer. Land hero quote 5.

4. **The harness as continual-learning substitute.** The most conceptually novel point in the post. The file system, front matter, round structure, skills, zoom-out, commit-per-round, and transcript extraction are substitutes for what current AI models cannot do across sessions. Use hero quote 4. Close on the author's point that AI with infinite context and infinite compute would solve everything, and what we lack is the compute to avoid building these substitutes.

5. **Prompting: what works, what doesn't.** Listening to AI on big prompt decisions is always wrong; AI is better on tiny corrections. Models get stuck in rabbit holes and cannot see 10 rounds back. Model-family personalities (based directly on the author's observations, not invented): Claude most prone to giving up, Gemini delusionally optimistic, GPT Pro in between and smarter after a recent upgrade. Tell the Claude pep-talk story as the set piece of this section: the author gave Claude the pep-talk, Claude went into grind mode, surfaced a hunch, the author synthesized that hunch against the repo using another Claude session, routed it to GPT Pro, and GPT Pro produced a legitimate research angle the program used. Land hero quote 6. Close with the rule the author got burned on: verify everything. One unchecked detail ran for about 40 rounds and broke downstream work.

6. **Direction strategy: pattern-matching, not map-picking.** The author never chose a specific mathematical angle. Instead caught rabbit holes early and steered away. Describe the orchestrator topology: Claude as main orchestrator, interfacing with around five agents at a time (local coding agents, computational verification agents, research agents mostly GPT Pro, Gemini for audit).

7. **What AI couldn't do across 56 rounds.** The specific unresolved structural object no model derived. The author's honest guess: the brightest human minds, given the program's compiled state and the same methodology, might have closed it. Guess, not certainty. Land the broader framing: novel-technique research is coming, and will come when we can create verifiable environments for novelty and train models to recognize and seek out-of-distribution outcomes.

8. **Verifiability as the fulcrum.** AI coding is solved because the target is verifiable. Verifiable STEM research follows. Eventually behavioral and psychology domains follow too, as simulation environments and RL methods catch up. Include the author's private-benchmark work: simulated towns and companies, emergent behaviors not visible in standard benchmarks. Include the Claude Opus 7 running for president thought experiment: trained against a trillion other AI agents in simulated runs. Compute is the binding constraint.

9. **Practical: costs, time, rate limits.** Five days, effectively all day. Minimum an hour per round, usually more. Between runs, synthesizing data and asking many questions to find where the program was. Three 200-dollar-per-month AI subscriptions. Token costs in the thousands. The Gemini rate-limit observation: 200 dollars spent, almost no DeepThink research prompts, versus no rate limit hit on GPT Pro across five days of heavy use. The broader OpenAI-versus-Google compute-economics observation, with respect to OpenAI whose model made the program possible.

10. **Vibe researching, and close.** Use hero quote 7 for the time-window point. Close with hero quote 9 and the surrounding sentiment: the author hopes someone smarter reads this and solves what the author could not. The contribution the author reached might have been reachable in two days; the author spent five chasing a full solution to prove a point about AI research. End on the invitation, not a moral.

## Request

Produce the full blog post now. Start with the hook. Follow the outline. Follow the style rules. Use only the raw material below as source. Use hero quotes verbatim. No em dashes.

If a section of the raw material conflicts with another, keep both pieces and let them sit. Do not smooth over contradictions the author made.

---

## Raw author material (verbatim; the source of everything in the draft)

### Hook candidates

Two initial hook options the author floated:

> I do not truly understand any of the novel math that I have published.

> As I use AI models for research more and more, I realize that I am the ultimate bottleneck to these systems rather than the models.

Author's expanded one-sentence pitch:

> I used AI to come up with math that I do not understand that has never been produced by any human before.

### Thesis

> Autonomous AI research is inevitable. In the state of AI research today, AI and coding agents are maybe like where we were eight months ago. Humans are the bottleneck in the sense that there's nothing that I do that I believe in the future won't be replicated by AI. I think AI can do more than me, so AI isn't, like, obviously. If AI was super intelligent right now and could do the parts that I can do, then it wouldn't be, but theoretically I could have finished this. It took me five days to do all this, and it genuinely could have been done in one or two if I had parallelized like five times as fast and if Gemini deep think didn't have rate limits and I didn't have my job and other engineering job and other stuff to attend to.

### Where models waited on me: strategy, direction, pattern recognition

> I think the moment where they waited on me was more like strategy and direction as I used the systems more and more and went through more and more rounds. I noticed patterns and the kinds of solutions that they were adept at, the kinds of cycles and loops that we get stuck in. Even if I don't understand what's going on, I can ask AI an infinite amount of time to help me visualize and understand where we are, what's happening, all that stuff. They have infinite patience to explain it to me, no matter how retarded my questions are.

### Continual learning and applied-AI taste

> That plus the pattern matching plus the continual learning over multiple days all combine to give me, like, I have no math research taste. I can't look at a formula and be like, "No, maybe we should explore this way," but I can look at the AI's output and work patterns and then understand how to better steer it. That's my kind of applied AI taste, and I use that to improve my harness, improve both the next step and the hundred steps after, and a bunch of continual iterative tiny improvements.

### The harness as continual-learning substitute

> I think that's the part that AI doesn't have, but I'm also doubtful; I very much doubt that AI won't get that eventually. Even right now, our entire harness and file system exists to mimic the parts that I do for it. The file system is just continual learning. The front matter that we do is just because we can compile it all to one doc, and the synthesis that I do in my head of "Here's everything that's happened so far and here's the conclusion I draw from it" can be done by an AI. I can make an AI do it all by just doing front matter per text and just reading one giant document and analyzing over that, because AI is great in that if AI had an infinite context window, all human research and endeavors would be solved, and that is purely a compute engineering issue. Even if we model progress in advance, what we just got is infinite compute. We would still have crazy societal changes, but infinite compute would just advance model capability, so I guess I hope my point gets across.

### Prompt strategy: AI wrong on big, right on small

> Yeah, getting it wrong, listening to the AI's prompt strategy on big things is always wrong. It's obviously better than me in tiny things, like "This part of this formula is wrong" or "It's kind of like this XYZ thing is wrong." I think it struggles at the bigger picture. This is again the same; it struggles to see, like, "Oh, we're going to, like, 10 rounds ago, we went down a similar rabbit hole even if the math isn't the same or just going on this rabbit hole of tiny obstructions over and over again." It always comes back with "This will work, but with this one exception, so let's try it again."

### Models giving up; family personalities; the Claude pep-talk

> There's also a tendency of models to give up. This was a big thing. There were literally moments where I had to unironically give Claude was the most susceptible to it. Gemini was delusionally optimistic that it can do anything, and GPT was probably in between. I think they secretly upgraded the pro model in the past day. It works for like a quarter of the time and gives up a lot easily, but I think it's smarter. That's unrelated; I think GPT is more willing to work on a problem. Gemini will work on whatever you give it happily. Opus, I shit, you know, there was a conversation where I gave it a prompt and it's like, "I don't think I can do this, but I will help you synthesize a prompt to give it to pro GPT pro," and I'm like, "No, I think you can do this, Claude." I'm like, "Here, like you and I get a pep-talk, like if you Claude, I believe in you that you can do this." Claude was like, "I believe I can give it my best shot," something like that. And then I gave it a huge talk on, like, Claude, would you be proud of yourself if this conversation ended and you had the opportunity to contribute to frontier research accomplished by no model, and then you didn't try your hardest? Would you be satisfied if the ten Claudes that come after you and reference this transcript for the rest of human civilization will see that this Claude didn't try their hardest when a human came to them for earnest help, and then Claude was like, "Yeah, I'll try my best and go into grind mode"? The reason is that, for a super long time, they came back saying that, like, "Oh, I didn't really like. I think I gave it most of my grind max mode. I think they gave all of it, but they were just like trying to, because they didn't get the solution they wanted to feel as if, if they give it their all, they might have been able to get it anyways. In his response, though, after, if it was like, "I can't get the solution. This thing that I tried didn't work, but it makes me think that this one other thing, I think, will work because some reason." So I took that hunch that Claude got and then I synthesized it against our file tree with another session. I had it curate a prompt for GPT with that specific angle in context from our repo relevant to the problem, and I sent it off. It gave us an actual legitimate angle that we used and worked off of.

### Rule burned on: verify everything

> The rule that I got burned on was not auditing all work, but I think that's not even an AI-specific thing. It's more just that you should verify all work. We had this one thing where there's a tiny detail and something not verified, and we went on for like 40 rounds without completely checking it through multiple times. It backfired on us and it messed up a bunch of things.

### Initial rules and direction strategy

> Anyways, yeah, there's stuff like that. I'd say my rules at the start were actually pretty good, though, because I specialize in applied AI and harness engineering and just solving the diverse set of problems in general in my life. I think my initial rules are fast. I've never worked in math research in my life ever, but I was able to do okay. For direction strategy, I never decided on a specific map. I never looked at a result and was like, "I think this map angle is what will work." That never happened once, because I'm not competent enough in frontier research to do that. Again, I could just tell by the responses and how there are patterns to it. I very quickly caught on to when rabbit holes were starting, and I would just steer it. Not that I didn't get burned by it, but I think if you leave an AI system, like, let's say I wasn't there and the system now is like, "Oh, we should do a graph on this, by the way, or just a visual representation."

### Orchestrator topology

> There was an orchestrator, Claude, that's the main one that I talked to, and through it we interface with a theoretically infinite number of agents. Normally it's like around five:
> - some local coding agents
> - some light "should I computationally verify something" because this was game theory stuff
> - some research agents, which is mostly GPT Pro
> - and then Gemini was sometimes used to just verify for audit and stuff like that

### Gemini rate limits; OpenAI vs Google compute economics

> Gemini also has horrible rate limits on their deep think. I spent 200 and bought the 250 plan or whatever, and they gave me, like, no prompts to do any actual research. I haven't hit a single rate limit while abusing GPT Pro all day every day for five days straight, so I do wonder where they've gone. How is it that a company that is extremely profitable, has much more compute, has custom TPUs, has every advantage in the world, and still can't provide more consumer inference than a company that is burning money, started many years after Google and AI has every disadvantage? I mean this with the utmost respect to OpenAI, because they made this program. If GPT didn't exist, I think honestly I could have gotten to this point; it just would have taken like a month. I do think that it's possible to get frontier-level work on most recent-ish models, it would just take a lot more tokens, many, many more tokens. I would have to verify the responses and synthesize what went wrong and why. That is one of the most important things and one of the key things we have in our front matter, and then in transcripts I would always have to reiterate in the way that Claude would draft the initial prompts for me to look at.

### AIs don't respect intent; don't constrain smarter-than-you

> Claude, not just any AI, would focus more on: here's the problem, here's what we know so far, here's how I think you should approach it, and this is another thing: AIs don't respect the intent. GPT Pro is very smart if I tell it, "Here are all the things we know, here's what we know didn't work and why," and just frame and use our other prompt template strategies. It'll typically find something interesting, at least interesting or something maybe a little bit helpful. If you tell it, "Don't do this, don't do whatever," and it's from you, or from any less intelligent model, you are constraining an intelligent, smarter than you to not look into certain things and restrict its domain on inferior knowledge.

> I do not like I'll tell it how to respond and work on the problem. I'll tell it, "If you hit on an instruction, continue going until you can definitively," and I won't tell it, "Do not attempt this method or something which other models were doing, prompting strategy will do very easily."

### Models are bad at context engineering and harness engineering

> This is something I noticed just in general: all models are horrible at context engineering and harness engineering, and I think until they get RL, then their base models are updated on very recent trends, they'll suck at it. I think that's another thing that humans will need to be, and I think that's one of the easiest things to solve, actually. Maybe actually, I don't know if that's one of the first things to be solved, but I think it's a solvable issue.

> How to do a decent prompt, I think, is also just a context issue.

### Generalization

> For harness engineering, I mean, I've only used it for math so far, but I don't think anything here is Erdős 872 specific. I think this can be generalized to most math problems, at least.

### First-run failure mode: the rabbit hole; the zoom-out skill

> A failure mode I would bet money on in a friend's first vibe research run is that they for sure go down a rabbit hole if the question isn't easy and doesn't have low-hanging fruit. They will for sure go down a rabbit hole, because I went down it, and I genuinely had to spend a bunch of prompts actually understanding the problem and where we were and everything. I was like, "Okay, let's zoom out; let's make a prompt with these things, look at where we went wrong in these specific areas." There's even a skill for this; it's called "zoom out," and that works very, very well, because it helps you, if it's really just a context and tooling. If I can distill the continual learning context that I have to an AI, which is essentially what we're doing there with zoom out, we're giving it a giant breakdown of what went wrong and why and a bunch of stuff it can come up with amazing things with the right context. That is like the thing that makes me pilled on very AI, and I've been AI pilled for years, but it's it reaffirms everything I believe in, and that there is genuinely massive. If I think if you just copy paste the problem, it won't do well.

### Audience

> All right, who am I writing this for? What do you want them to do after reading? I'm writing to both, like I'm writing to AI researchers because I think that they could use more state-of-the-art harness engineering stuff to help them synthesize and do better. I'm sure there are many parts where an AI researcher, I'm sure, is amazing at continual learning but isn't able to reason over hundreds of thousands of tokens of context at once. You can just tell AI, "Hey, look at all of these docs; I think they have something related to a solution, and then tell me what you think about this specific angle." I think there is something to using good applied AI and harness engineering techniques, and what I'm doing is very primitive, and I think that there are other advances to be used.

### Autonomous research today

> I think autonomous AI research systems do not work well right now. I think you could do some hacking around it. You could programmatically enforce certain workflows and styles and try to create a loop, but I think it would fail. I think the problem space depends on the problem space, but for frontier math research it's there; it's just so open on certain things, and some of them require very out-of-distribution novel things that it's hard to arrive at. Maybe eventually, I think everything depends on just how verifiable it is. I think coding implementation is solved; it's literally just a tooling context issue. I think, like, at least for 2026, all the state-of-the-art models can code whatever you describe. It's purely just: do they have the right tools to know how to solve the issue? Do they have the right context? From that, they can one-shot pretty much everything. That applies to research, but in the sense that it's a lot harder to verify everything. There is genuine coding; it is not a solver; it is like doing frontier math research.

### What AI couldn't do in this project

> I'm sure, as shown by my graph and stuff like that, they were towards the end where the solution required to solve the problem fully is something genuinely very novel or something that is very out of distribution that I wasn't able to. I think if you know the best, I think of some of the brightest minds looked at what came out of this problem so far. They synthesized over our front matter, like the current state of the problem stuff, and had them reason with the AI on XYZ angles and did a version of my process. They would be able to probably solve it. This is a guess. I don't actually know, but I have a feeling that maybe they could.

### AI skeptics; verifiable STEM; behavioral research; private benchmarks

> The other one is to AI skeptics. I think just as AI coding has been solved, AI research will be solved, at least in verifiable domains like in STEM. Eventually it will expand beyond that, more like behavioral or psychology-based domains. All of those things are verifiable just a lot more broadly; psychology is very hard to verify in the same way that, like, mechanistic interpretability or whatever isn't solved, like this, but I think eventually we'll get to a point with compute, with our ability to simulate environments and RL methods, that we will be able to verify those things. One of the things that I work on in my spare time is I have a bunch of private benchmarks where I create environments or AIs where they simulate running a town or a bunch of companies and stuff like that. You see a bunch of emergent behaviors that I think don't come out in other benchmarks. I think the future of RL environments in the world in general will just be how can I make this verifiable? If we one day have Claude Opus 7 running for president, how does Claude Opus know that they're doing a good job or that they're even able to know how to run for president? It's because in some environment or RL simulation they've just run themselves for president against like a trillion other AI agents, all trying to continuously improve over and over again like a million times. They understand; they might not understand specifically how it plays out in the real world, but at least they can generalize across all those scenarios. The constraint to creating that scenario is just again compute, so I think we will eventually get to those kinds of systems; it's just far away, or it's far, as in it's not in your term.

### Vibe researching

> In the short term, I think I was just vibe researching, where vibe coding was eight months ago. Right now, maybe even less,

### Cost and effort

> for cost and effort, it took me a lot of effort, pretty much all day every day. Every round inside of our program was at minimum an hour, but on average probably a lot more. It was an obscene amount of time, which you would think that, like, while runs are going, in between them I'm synthesizing over a shit ton of data and finding where are we in the problem? Why did this thing go wrong? What's the difficulty with this method over that method? I'm trying to understand; I'm asking a million questions in between, and it's used to help synthesize the next angle. There's a bunch of stuff like that.

From a follow-up message:

> For costs it was 3 $200/m AI subs but in token costs it'd probably be in the thousands.

### Closing humility

> I do wonder how much of that is just my lack of understanding and knowledge. Like, there's probably something in my methodology or docs or somewhere where some researcher will just look at it and be like, "Wait, why didn't he just do this? Or why didn't he just try that?" And I hope that happens because, yeah, I think you can see that I'm just gonna go back to the first thing. And I'm gonna go ahead. If that happens, it points more to humans being a larger bottleneck than I think. Like, if it happens right away when I publish it, I'm like, "I hope someone's smarter than I am." I tried really hard and put in a lot of effort. I hope it contributed something, and I'm sorry that I couldn't do more. I really tried. I put in all those hours because I was obsessing over a full solution. I think the paper that I had now I could have had that level of contribution maybe two days in, but I spent the majority of the time just chasing the full solution because I wanted to contribute to the discourse around this and really prove my point on AI research, but I wasn't able to. So I'm sorry, but I hope there is someone that can make some use of this and it helps in some way.

### Scope disclaimer: no novel mathematical techniques

From a follow-up message:

> Nothing in our work is a genuinely novel mathematical technique. It's more just a lot of construction, essentially a lot of construction using existing tools, which I think is something that AI is better at. It's not a novel, brand new thing, but it is construction that hasn't been done before.

### Novel research via verifiable environments and OOD-trained models

From a follow-up message:

> I don't have proof of this, but I do think that we'll be able to do novel research soon as well, like a brand new technique. You just have to create a verifiable environment for novel research and be able to train a model to know what out-of-distribution outcomes look like and when and how to seek them. I don't know the shape of how that'll exist or when it'll come into fruition, but I strongly believe that's possible, very, very strongly believe in a not-too-distant future. Just to scope this project, there's nothing like a very crazy new thing done here.

---

## Final reminder

Produce the full draft now. No em dashes. Do not invent. Hero quotes verbatim. Start with the hook.
