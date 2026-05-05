Verdict: fix is valid and sufficient for the Lemma 7.15 substitution gap; no analogous log-denominator gap remains in Lemmas 7.15--7.18, but Lemma 7.16 still has a wording-level ambiguity in the truncated-final-bin sentence.

## 1. Verdict

The new sentence at `erdos-872/paper/sections/07-main-upper-bound.tex:1067-1074` correctly closes the auditor's substitution-gap objection in Lemma 7.15. The denominator swap from `\log(Aa^\ell)` to `\log A` is uniformly valid on the finite prefix `0 \le j \le s+1`, and the resulting multiplicative error is `1+o_{H,a}(1)`, hence absorbable into the pre-chosen `(1\pm\eta)` margins for all sufficiently large `n`.

## 2. Item-by-item findings

### Check 1: uniform substitution expansion

Write `A=A_h=n^{\alpha_h}` with
`\alpha_h=\frac1{h+1}+\tau_H \ge \alpha_{H-1}=\frac1H+\tau_H > 0`
for every `1 \le h \le H-1`, where `H` is fixed before `n \to \infty`.
Since `s=s(a)` is also fixed, for `0 \le j \le s+1`,
```tex
\frac{\log(Aa^j)}{\log A}
= 1 + \frac{j\log a}{\alpha_h \log n}
= 1 + O_{H,a}\!\left(\frac1{\log n}\right).
```
The bound is uniform in both `h` and `j` because `j \le s(a)+1 = O_a(1)` and
`\alpha_h` has the positive lower bound `\alpha_{H-1}`. Therefore
```tex
\log(Aa^j)=(1+o_{H,a}(1))\log A
```
uniformly for `0 \le j \le s+1`, exactly as claimed.

Equivalently,
```tex
\frac1{\log(Aa^j)}=\frac{1+o_{H,a}(1)}{\log A}
```
uniformly on that range. Because `j \ge 0`, one can sharpen this to
`\frac1{\log(Aa^j)} \le \frac1{\log A}`, but the weaker `1+o(1)` form is all the proof needs.

### Check 2: absorption into `(1\pm\eta)`

For `1 \le t \le s`, Lemma 7.14 gives
```tex
P_\ell
=
\left(1+\varepsilon_{\ell,n}\right)
\frac{(a-1)Aa^\ell}{\log(Aa^\ell)},
\qquad
\max_{0\le \ell \le s} |\varepsilon_{\ell,n}| \to 0.
```
Combining this with the uniform denominator expansion gives
```tex
P_\ell
=
\left(1+\theta_{\ell,n}\right)
\frac{(a-1)Aa^\ell}{\log A},
\qquad
\max_{0\le \ell \le s} |\theta_{\ell,n}| \to 0,
```
so, after summing the finite geometric series,
```tex
\sum_{\ell=t}^s P_\ell
=
\left(1+o_{H,a}(1)\right)\frac{A(a^{s+1}-a^t)}{\log A}.
```
Since `\eta>0` is chosen first and then `n \to \infty`, we may shrink to sufficiently large `n` so that the final multiplicative error is at least `1-\eta`, yielding
```tex
\sum_{\ell=t}^s P_\ell
\ge
(1-\eta)\frac{A(a^{s+1}-a^t)}{\log A}.
```

For the demand side, Lemma 7.13 with `c=a` and `X=Aa^k` gives, for each full bin,
```tex
d_k
\le
\left(1+o_{H,a}(1)\right)\frac{(a-1)Aa^k}{(h+1)\log(Aa^k)} + O(1).
```
Using the same denominator substitution and `1/(h+1)\le 1/2`,
```tex
d_k
\le
\left(1+o_{H,a}(1)\right)\frac{(a-1)Aa^k}{2\log A}+O(1).
```
Summing only finitely many `k=t-1,\dots,s-1` gives
```tex
\sum_{k=t-1}^{s-1} d_k
\le
\left(1+o_{H,a}(1)\right)\frac{A(a^s-a^{t-1})}{2\log A}+O(1),
```
and the `O(1)` term is negligible because `A/\log A \to \infty` uniformly in `h`.
Hence, for all sufficiently large `n`,
```tex
\sum_{k=t-1}^{s-1} d_k
\le
(1+\eta)\frac{A(a^s-a^{t-1})}{2\log A}.
```

So the displayed suffix-ratio computation in Lemma 7.15 is valid: the proof is using a genuine `1+o(1)` perturbation of the exact geometric identity, and that perturbation is uniformly swallowed by the fixed `(1\pm\eta)` slack.

### Check 3: the `t=0` case

The same substitution works here.

From Lemma 7.13,
```tex
f_h \le \left(1+o_H(1)\right)\frac{A}{(h+1)\log A},
```
and for `k=0,\dots,s-1`,
```tex
\sum_{k=0}^{s-1} d_k
\le
\left(1+o_{H,a}(1)\right)\frac{A(a^s-1)}{(h+1)\log A}+O(1).
```
Therefore
```tex
f_h+\sum_{k=0}^{s-1} d_k
\le
\left(1+o_{H,a}(1)\right)\frac{Aa^s}{(h+1)\log A}+O(1)
\le
\left(1+o_{H,a}(1)\right)\frac{Aa^s}{2\log A}+O(1),
```
which is absorbable into
```tex
(1+\eta)\frac{Aa^s}{2\log A}.
```

On the supply side,
```tex
\sum_{\ell=0}^s P_\ell
=
\left(1+o_{H,a}(1)\right)\frac{A(a^{s+1}-1)}{\log A},
```
so for all sufficiently large `n`,
```tex
\sum_{\ell=0}^s P_\ell
\ge
(1-\eta)\frac{A(a^{s+1}-1)}{\log A}.
```
Thus the `t=0` inequality is justified by the same uniform substitution plus the queue-clearing choice
`(1-\eta)(a^{s+1}-1)>(1+\eta)a^s/2`.

### Check 4: adjacent Lemmas 7.16, 7.17, 7.18

Lemma 7.16 does not repeat the illegal substitution. Its core comparison keeps the logarithms explicit:
```tex
d_k
\le
(1+o)\frac{(a-1)Aa^k}{(h+1)\log(Aa^k)}
<
(1-o)\frac{(a-1)Aa^{k+1}}{\log(Aa^{k+1})}
\le
P_{k+1}.
```
The strict middle inequality is valid for all large `n`: its right/left ratio is
```tex
\frac{1-o}{1+o}\,a(h+1)\,\frac{\log(Aa^k)}{\log(Aa^{k+1})},
```
and this tends uniformly to `a(h+1)`, which is at least `2a>1` because
`1/(h+1)\le 1/2 < a`. So there is fixed slack, not a knife-edge estimate.

Lemma 7.17 has no analogous denominator substitution issue. Its use of
`\Cref{lem:cell-reciprocal-mass}` is direct: each exceptional bin is a fixed-ratio cell of ratio `a`, so its reciprocal mass is `O_{H,a}(1/\log n)`. Its use of
`\Cref{lem:product-strip-reciprocal}` is also literal, with fixed parameters
`C=\lambda^r` and `c=a`. I found no parallel "replace `\log(\cdot)` by `\log A`" step there.

Proposition 7.18 is just the assembly of Lemmas 7.15--7.17. It introduces no new asymptotic manipulation beyond those upstream results.

### Check 5: truncated-final-bin closure in Lemma 7.16

This is the one place I would still tighten.

There is no new substitution gap here, but the current sentence is imprecise:
it says the final truncated bin has demand at most the "full-bin estimate
`d_{k^\star}` of Lemma 7.13." As written, that is awkward because Lemma 7.13 actually defines `d_k` using the last bin **already truncated at `B_h`**. So `d_{k^\star}` is the truncated-bin count itself, not a separate full-bin quantity.

If one instead reads that sentence as invoking the formal upper bound `(7.2)` on the untruncated interval `[X,Aa^{k^\star+1})`, then that is not literally justified: `(7.2)` is stated only for intervals `[X,cX]` contained in `[A_h,B_h]`, and here `Aa^{k^\star+1}` may exceed `B_h`.

That said, this is a wording/justification issue, not a fatal gap. The needed estimate is still available by the same derivative argument used in Lemma 7.13, integrated only over `[X,B_h]`. Since `B_h/X \le a`, one gets
```tex
d_{k^\star}
\le
\left(1+o_{H,a}(1)\right)\frac{B_h-X}{(h+1)\log X}+O(1)
\le
\left(1+o_{H,a}(1)\right)\frac{(a-1)X}{(h+1)\log X}+O(1),
```
which is the same upper bound used for full bins, and therefore still gives
`d_{k^\star}<P_{k^\star+1}`.

## 3. Any new gaps found

I did **not** find another illegal denominator substitution in Lemmas 7.15--7.18.

I **did** find one nearby cleanup item:

`erdos-872/paper/sections/07-main-upper-bound.tex:1137-1145` currently blurs the distinction between the actual truncated-bin count `d_{k^\star}` and a hypothetical "full-bin estimate." That sentence should be tightened so an auditor does not think the proof is appealing to `(7.2)` outside its stated hypothesis.

I would classify this as a presentation-level ambiguity with an easy local repair, not as a structural failure of Lemma 7.16.

## 4. Recommended follow-up edits

No change is needed to the new Lemma 7.15 insertion.

I do recommend tightening the truncated-bin sentence in Lemma 7.16. A concrete patch would be:

```diff
diff --git a/erdos-872/paper/sections/07-main-upper-bound.tex b/erdos-872/paper/sections/07-main-upper-bound.tex
@@
-using $1/(h+1)\le1/2<a$.  The final truncated source bin
-$[X,B_h]\subseteq[Aa^{k^\star},Aa^{k^\star+1})$ (with $X=Aa^{k^\star}$ and
-$B_h<Aa^{k^\star+1}$) has demand at most the full-bin estimate $d_{k^\star}$
-of \Cref{lem:bin-demand-estimate}, since its contributing indices are a subset
-of those for the full bin.  The next prime bin above $B_h$ is contained in
-$[Aa^{k^\star+1},Aa^{k^\star+2})$ with supply
-$P_{k^\star+1}$ from \Cref{lem:bin-prime-supply-estimate}, so the inequality
-$d_{k^\star}<P_{k^\star+1}$ applies unchanged and the truncated-bin assignment
-proceeds by the same greedy rule.
+using $1/(h+1)\le1/2<a$.  For the final truncated source bin
+$[X,B_h]\subseteq[Aa^{k^\star},Aa^{k^\star+1})$ (with $X=Aa^{k^\star}$ and
+$B_h<Aa^{k^\star+1}$), the same derivative bound used in
+\Cref{lem:bin-demand-estimate} over $[X,B_h]$ gives
+\[
+  d_{k^\star}
+  \le
+  (1+o_{H,a}(1))\frac{B_h-X}{(h+1)\log X}+O(1)
+  \le
+  (1+o_{H,a}(1))\frac{(a-1)X}{(h+1)\log X}+O(1)
+  <
+  P_{k^\star+1},
+\]
+since $B_h/X\le a$ and the next prime bin above $B_h$ is contained in
+$[Aa^{k^\star+1},Aa^{k^\star+2})$.  Thus the truncated-bin assignment
+proceeds by the same greedy rule.
```

This would make the final-bin step audit-clean in the same explicit style as the new Lemma 7.15 preamble.
