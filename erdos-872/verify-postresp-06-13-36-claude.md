---
id: R06-verify-13-36-claude
type: verification
date: 2026-04-17
intent: >
  Adversarial Claude audit of the 13/36 upper bound from R05-shortener-13-36,
  focusing on the Bonferroni step where S can grow to log log n.
predecessors: [R05-shortener-13-36]
action:
  kind: refutes
  target: R05-shortener-13-36
claim: >
  Proof broken at Bonferroni step: f(S) = 1 - S + S^2/2 is an upward parabola
  requiring S in [1/3, 5/3] for the 13/18 bound to hold, but S can grow to
  log log n in practice. Strategy likely correct, constant likely correct,
  proof does not handle full S range.
failure_mechanism: >
  Second-order Bonferroni polynomial f(S) is not monotone beyond S=1; Pro
  only proves S >= 1/3 - o(1) but actual S can be log log n. For large S,
  f(S) blows up, so the 13/36 bound does not follow. Superseded by the
  truncation fix in R07-13-36-closeout.
siblings: [R06-verify-13-36-chatgpt, R06-verify-13-36-gemini]
---

# Audit — Claude on Pro's 13/36 upper bound (Round 6, Prompt 6B)

**Source:** Claude (web tab, extended-thinking). Extracted 2026-04-18.
**Prompt sent:** `prompts/verify-postresp-06-shortener-13-36.md`.
**Verdict:** **PROOF BROKEN at the Bonferroni step — independently confirming Gemini's catch.** Same diagnosis: $f(S) = 1 - S + S^2/2 \le 13/18$ requires $S \in [1/3, 5/3]$, but $S$ can grow to $\log\log n$. This is now 2/3 verifiers flagging the same bug; ChatGPT is the outlier. Adds a nice conceptual frame: **the $13/36$ bound captures the worst-case regime for Shortener**, where Prolonger blocks just aggressively enough to keep $S \approx 1/3$. If Prolonger blocks less (small primes remain available), $S$ grows and the true $N_D$ becomes small via Mertens. **The strategy is likely right and the constant is likely right; the proof just doesn't handle the full range of $S$ correctly.**

---

Here's a clean, high-level summary of what that very long chain of reasoning actually *found*, stripped of all the exploration, false starts, and re-checks:

---

## **Core Claim Being Analyzed**

The argument tries to prove an **upper bound**
$$L(n) \le \frac{13}{36}n + o(n) \approx 0.361n$$
for the divisibility antichain game, using a specific **Shortener strategy**:

* Play the **smallest legal odd prime** for the first $k \sim \sqrt{n}/\log n$ turns.

---

## **What the Argument Successfully Establishes**

### 1. **Prime growth bound (Chebyshev-style induction)**

It shows that Shortener's primes satisfy:
$$q_j \le (3/2 + \varepsilon) j \log n$$

**Meaning:**

* Prolonger cannot block primes "too efficiently."
* Shortener is always able to find a relatively *small* legal prime.

---

### 2. **Lower bound on reciprocal sum**

From that, it derives:
$$S = \sum_{j \le k} \frac{1}{q_j} \ge \frac{1}{3} - o(1)$$

**Interpretation:**

* The chosen primes collectively impose a **nontrivial density constraint** on remaining integers.
* This is the key "sieve lever" in the argument.

---

### 3. **Compression argument (odd-part map)**

A mapping $\phi(x) = $ odd part of $x$ shows:

* The remaining moves correspond injectively to **odd integers avoiding the chosen primes**.

So:
$$|A'| \le N_D(n)$$
where $N_D(n) = $ count of odd integers not divisible by any $q_j$.

---

### 4. **Second-order sieve (Bonferroni)**

Using inclusion-exclusion up to pairs:
$$N_D(n) \le \frac{n}{2}\left(1 - S + \frac{S^2}{2}\right) + o(n)$$

Plugging $S \ge 1/3$:
$$N_D(n) \le \frac{13}{36}n + o(n)$$

---

### 5. **Final bound**

Total moves:
$$L(n) = 2k + |A'| \le \frac{13}{36}n + o(n)$$

---

## **The Big Insight (Strategic Interpretation)**

There is a **tension between two regimes**:

### If Prolonger blocks aggressively:

* Forces Shortener to pick **large primes**
* ⇒ $S \approx 1/3$
* ⇒ Remaining numbers are **dense**
* ⇒ Game is **long (~0.36n)**

### If Prolonger doesn't block:

* Shortener picks **small primes**
* ⇒ $S \sim \log\log n$
* ⇒ Remaining numbers are **very sparse**
* ⇒ Game is **short ($o(n)$)**

**Conclusion:**

* The *worst case* for Shortener (i.e., longest game) happens when
  $S \approx 1/3$, giving the $13/36$ bound.

---

## **Critical Weakness (Important!)**

The reasoning **breaks in one key place**:

### ❌ Bonferroni step is not globally valid

The bound
$$1 - S + \frac{S^2}{2} \le \frac{13}{18}$$
only holds when:
$$S \in [1/3,\ 5/3]$$

But:

* In many plausible game trajectories,
  $S$ can grow as large as $\log\log n$
* When $S > 5/3$, the bound **fails completely**

---

## **How the Argument Tries to Patch This**

It implicitly relies on:

* For large $S$, a **different mechanism (Mertens / sieve theory)** kicks in:
  $$N_D(n) \approx \frac{n}{2} e^{-S}$$
* Which becomes **much smaller than $13n/36$**

So:

* The conclusion might still be **true**
* But the **proof does not properly justify it**

---

## **Final Verdict**

### ✔ What is likely correct:

* The *strategy idea* is strong
* The *constant $13/36$* is plausible as a worst-case upper bound
* The structural decomposition (prefix + sieve tail) is meaningful

### ❌ What is broken:

* The proof **incorrectly uses Bonferroni outside its valid range**
* It **never proves an upper bound on $S$** (only a lower bound)
* It **does not formally combine Bonferroni with Mertens/sieve bounds**

---

## **Bottom Line**

* The argument **identifies the right mechanism and likely the right constant**.
* But as written, it is **not a complete proof**.

### Weakest link (explicit):

> The transition
> $$S \ge 1/3 \Rightarrow N_D(n) \le \frac{13}{36}n$$
> is **invalid without controlling $S \le 5/3$** — which the proof never establishes.
