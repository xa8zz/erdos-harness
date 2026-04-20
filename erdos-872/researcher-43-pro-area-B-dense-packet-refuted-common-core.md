---
id: R43-pro-area-B-dense-packet-refuted-common-core
type: refutation
date: 2026-04-19
intent: >
  Test whether the R42 large-prime chain defeats the dense-packet
  self-absorption; refute the dense-packet/sparse-recursion lemma as stated.
predecessors: [R42-attack-B-refutation, R39-pro-dense-packet-projection]
action:
  kind: refutes
  target: R39-pro-dense-packet-projection
claim: >
  Split outcome: (1) R42 large-prime chain does NOT defeat self-absorption --
  its harmonic mass is absorbed by the high-window entropy tail. (2) The
  dense-packet/sparse-recursion lemma as stated IS refutable: common-core
  Prolonger strategy keeps Gamma_k sparse for every k <= C*log(h), produces
  arbitrarily many weak-fresh useful top scores with no packet collisions.
failure_mechanism: >
  Common-core construction: Prolonger builds useful top scores sharing a
  common defect-2 core c_0. Each useful top score S has bA_{S\c_0} as a
  lower-defect witness; Prolonger pre-kills these witnesses sequentially
  without creating packet collisions. Weak freshness allows c_0 to be
  reused across Omega(N_h/h) useful top scores since the definition of
  useful does not bound the replacement window.
---

I get a split outcome.

The canonical **R42 large-prime chain does not defeat self-absorption**: its harmonic mass is swallowed by the high-window entropy tail.

But the **dense-packet/sparse-recursion lemma, as stated, is refutable**. There is a common-core Prolonger strategy that keeps (\Gamma_k) sparse for every (k\le C\log h), produces arbitrarily many weak-fresh useful top scores, and creates no packet collisions. The failure mechanism is exactly the one suspected earlier: weak freshness allows Prolonger-prekilled cores to be reused, and “useful” does not impose a bounded replacement window.

Let

[
\omega(S)=\prod_{p\in S}\frac1p,\qquad
e_m(U)=\sum_{\substack{S\subseteq U\ |S|=m}}\omega(S),
\qquad
N_h=e_h(\mathcal P).
]

For the top window

[
W=(y/2,y]\cap\mathcal P,
]

write

[
\beta_W=\sum_{p\in W}\frac1p.
]

By Mertens’ estimate,

[
\beta_W
=======

\log\log y-\log\log(y/2)+o(1)
\asymp \frac1{\log y}.
]

So even the total harmonic mass of **all** rank-(h) supports using only primes from (W) is bounded by

[
e_h(W)\le \frac{\beta_W^h}{h!}.
]

Since

[
N_h\asymp \frac{B^h}{h!},
\qquad
B:=\sum_{p\le y}\frac1p,
]

the ratio is

[
\frac{e_h(W)}{N_h/\log h}
\ll
\log h\left(\frac{\beta_W}{B}\right)^h.
]

In the central regime (B\asymp h), this is

[
\ll
\log h\left(\frac{1}{h\log y}\right)^h=o(1).
]

More generally, if the chain only forces (s) primes into the high window, then

[
\mu{S: |S\cap W|\ge s}
\ll
N_h\sum_{\ell\ge s}\binom{h}{\ell}
\left(\frac{\beta_W}{B}\right)^\ell.
]

For (s=C\log h) and (B\asymp h),

[
\mu{S: |S\cap W|\ge C\log h}
\ll
N_h
\left(\frac{e\beta_W}{C\log h}\right)^{C\log h}
=o!\left(\frac{N_h}{\log h}\right).
]

So the R42 large-prime chain may have small (\sigma^\star)-degree, but its harmonic contribution is tiny. Raw abundance of primes in ((y/2,y]) does not matter; the relevant quantity is their reciprocal mass, and that is only (\asymp 1/\log y). This route is absorbed by R35.

Now for the route that does refute the dense-packet lemma.

Fix the depth cutoff (C\log h), and choose

[
L:=\lceil C\log h\rceil+1.
]

Choose a packet-separated core

[
R={r_1,\dots,r_{h-L}},
\qquad |R|=h-L,
]

and choose an initial packet-separated (L)-set (T_0), disjoint from (R). Prolonger first scores

[
F_0=bA_{R\cup T_0}.
]

This kills every certificate supported inside (R). In particular, after (F_0), Shortener can never legally claim any certificate (C\subseteq R), including singletons from (R).

Now iterate. After Shortener’s previous claims (C_1,\dots,C_{i-1}), define the forbidden outside set

[
Y_i:=\bigcup_{\ell<i}(C_\ell\setminus R),
]

and choose a new packet-separated (L)-set

[
T_i={t_{i,1},\dots,t_{i,L}}
]

disjoint from (R), (T_0), previous auxiliary sets, and (Y_i). Then Prolonger scores

[
E_i:=R\cup T_i,
\qquad
F_i=bA_{E_i}.
]

This works against (\sigma^\star), not merely against a cooperative Shortener. The maximum-degree rule only determines which (C_\ell) is added to the forbidden set. Prolonger chooses (T_i) after seeing that claim.

For legality and weak freshness, suppose some prior Shortener claim (C_\ell) satisfies

[
C_\ell\subseteq E_i=R\cup T_i.
]

If (C_\ell\subseteq R), impossible, because every certificate inside (R) was killed by (F_0). If (C_\ell\not\subseteq R), then

[
C_\ell\setminus R\subseteq T_i,
]

contradicting (T_i\cap Y_i=\varnothing). Thus no prior Shortener claim lies below (E_i). Prior Prolonger scores have the same rank (h) and are distinct from (E_i), so they do not divide (E_i). Hence (E_i) is legal and weak-fresh.

For usefulness, pick one element (u_i\in T_i) and set

[
c_i:=E_i\setminus{u_i}.
]

The same avoidance argument shows that (c_i) is legal immediately before (F_i). Choose a fresh prime (z_i), again outside all forbidden outside supports, and define

[
W_i:=c_i\cup{z_i}.
]

After Prolonger scores (E_i), the top (W_i) is still a live rank-(h) residual containing (c_i). Therefore (c_i) still has positive live degree in the remaining rank-(h) residuals, so (E_i) is useful.

If the architecture requires the witness to survive Shortener’s immediate reply, use two witnesses

[
W_i^{(1)}=c_i\cup{z_i^{(1)}},
\qquad
W_i^{(2)}=c_i\cup{z_i^{(2)}}.
]

A single legal Shortener claim cannot kill both unless it is contained in

[
W_i^{(1)}\cap W_i^{(2)}=c_i,
]

but every subcertificate of (c_i) has just been killed by (F_i). So at least one witness survives.

Now examine the sparse-recursion condition relative to the first shield (F_0). For every later target

[
E_i=R\cup T_i,
]

we have

[
E_i\cap F_0=R.
]

A defect-(k) face (B\subseteq E_i) has size

[
|B|=h-k.
]

For such a face to be first-shielded by (F_0), it must be contained in (F_0\cap E_i=R). But

[
|R|=h-L.
]

Therefore, if (k<L), then

[
h-k>h-L=|R|,
]

so no such (B) can be contained in (R). Hence

[
\Gamma_k(E_i,F_0)=\varnothing
\qquad
\text{for every }k<L.
]

Since (L>C\log h),

[
\Gamma_k(E_i,F_0)=\varnothing
\qquad
\text{for every }k\le C\log h.
]

Thus the family is maximally sparse at every depth checked by the dense-packet lemma.

There are also no packet collisions: choose (R), (T_0), every (T_i), and every witness prime packet-separated inside each support. Then

[
m_\Pi(E_i)\le 1
]

for every packet (\Pi) and every (i).

The number of iterations is limited only by the available reservoir. In a crude worst-case accounting, each Shortener claim forbids at most (h) outside primes, and each Prolonger iteration consumes (L+O(1)) new primes. So from (Q) available packet-compatible primes, Prolonger gets at least

[
M\gg \frac{Q}{h+L}
]

useful sparse targets over the same first shield (F_0). In the usual central smooth window, (Q) is vastly larger than (N_h), so one can make

[
|\mathcal S(F_0)|=M
]

larger than the raw target (N_h/h), and even larger than the total harmonic Shortener budget (N_h), if the reservoir is large enough.

This is a genuine refutation of the dense-packet lemma in its raw-count form.

The exact failure mechanism is:

[
\boxed{\text{Sparse shallow prehistory does not force high-window entropy.}}
]

The construction hides the first shield at codimension

[
L>C\log h.
]

Every shallow defect layer (k\le C\log h) sees nothing:

[
\Gamma_k=0.
]

But the replacement primes (T_i) need not lie in a high-prime entropy tail. They can be drawn from ordinary harmonic-mass regions. The only reason the construction works is that the first Prolonger move (F_0) has already sterilized the common core (R), so (\sigma^\star) cannot attack it later.

A useful static mass stress test makes the same point. Split the prime set into two packet-separated pools (A,B) with harmonic masses

[
\beta(A)\approx h-L,\qquad \beta(B)\approx L.
]

The class of rank-(h) supports with (h-L) primes from (A) and (L) primes from (B) has harmonic mass approximately

[
e_{h-L}(A)e_L(B)
\approx
\frac{(h-L)^{h-L}}{(h-L)!}
\frac{L^L}{L!}.
]

Compared with

[
N_h\approx \frac{h^h}{h!},
]

this is a binomial central slice of size

[
\asymp \frac{N_h}{\sqrt L}.
]

For (L\asymp \log h),

[
\frac{N_h}{\sqrt L}\gg \frac{N_h}{\log h}.
]

So “codimension (L)” is not itself an entropy tail. It becomes a tail only if the (L) replacement primes are forced into a genuinely small harmonic window, such as ((y/2,y]). The stated usefulness condition does not force that.

So my conclusion is:

[
\boxed{\text{R42 does not refute self-absorption; it is harmonically absorbed.}}
]

But

[
\boxed{\text{the dense-packet/sparse-recursion lemma is false under the supplied weak freshness/usefulness definitions.}}
]

To salvage the architecture, one needs an additional load-bearing hypothesis, for example:

[
\text{strong freshness,}
]

so a reused Prolonger-killed core (R) disqualifies later (E_i);

or

[
\text{local usefulness / bounded replacement window,}
]

so the witness (W_i) must replace primes inside a controlled dyadic neighborhood;

or a genuinely harmonic version of the useful-shield count, rather than a raw count.

Without one of those additions, sparse recursive pre-shielding across a pre-killed common core gives a legal Prolonger strategy that stays invisible to all shallow (\Gamma_k) tests and avoids the collision conclusion entirely.
