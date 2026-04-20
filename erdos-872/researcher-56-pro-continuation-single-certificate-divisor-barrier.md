Let [n]={1,2,…,n} and the game be the usual divisibility-antichain game on {2,…,n}: a move x is legal iff for every previously played a we have a∤x and x∤a. Let

U:={⌊n/2⌋+1,…,n}.

Key fact used repeatedly: U is an antichain (if u<v both >n/2 and u∣v, then v≥2u>n, impossible).

Also recall your scale

r
1
	

(n)=
logn
n(loglogn)
2
	

,

so

r
1
	

(n)
∣U∣
	

=
n(loglogn)
2
/logn
⌈n/2⌉
	

=
2(loglogn)
2
logn
	

⋅(1+o(1))
n→∞
	

∞,

hence any Θ(n) lower bound is automatically ω(r
1
	

(n)).

Below are two fully specified dynamic Shortener strategies with concrete composite-claim rules allowing arbitrary packet-prime support (not bounded by q
0
	

), and in each case a fully explicit Prolonger attack that forces

L
τ
	

(n) ≥ ∣U∣ = ⌈n/2⌉ = ω(r
1
	

(n)).

Strategy τ
pkt
	

: full packet-support divisor rule

Fix h=⌊loglogn⌋ (take h≥1 for small n). Let

Y:=n
1/(2h)
.

Choose a “packet” P={p
1
	

,…,p
h
	

} of h distinct primes in [Y,2Y]. (Existence for all sufficiently large n follows from the prime number theorem: π(2Y)−π(Y)∼Y/logY and Y/logY≫h since Y=exp(
2h
logn
	

) while h=loglogn.)

Define the packet product

M:=
p∈P
∏
	

p.

Define the “packet-support composites” set

D
pkt
	

:={d:d∣M, 2≤d≤n/2}.

This includes every squarefree product of an arbitrary-sized subset of the packet primes (support size 1,2,…,h); i.e. not bounded by q
0
	

.

Shortener strategy τ
pkt
	

 (dynamic): on each Shortener turn, play

the smallest legal d∈D
pkt
	

 if any exist;
otherwise play the smallest legal element of U (if none exist, pass).

That is a fully concrete composite-claim rule: “claim packet-supported composites (arbitrary support) when possible; else go to U.”

Prolonger attack against τ
pkt
	

: a one-move multiplier preemption

Prolonger’s first move:

Let a be maximal with 2
a
M≤n, and play

m:=2
a
M.

By maximality, 2
a+1
M>n, hence m>n/2, so m∈U. This move is legal on the empty position.

Then Prolonger’s subsequent moves: play any unused element of U (e.g. in increasing order).

Why this defeats τ
pkt
	

 (complete proof, no gaps):

Because m is played first, any d with d∣m becomes illegal forever (it would divide a previously played number).
For every d∈D
pkt
	

, we have d∣M∣m. Therefore every d∈D
pkt
	

 is immediately illegal after Prolonger’s first move.
Hence on every Shortener turn after move 1, τ
pkt
	

 finds no legal move in D
pkt
	

 and must play in U.
From that point on, all moves by both players lie in U. Since U is an antichain, every unused element of U remains legal regardless of which other elements of U have been played.
The game therefore lasts until U is exhausted. So the total number of moves is exactly ∣U∣=⌈n/2⌉.

Thus

L
τ
pkt
	

	

(n)=∣U∣=⌈n/2⌉=ω(r
1
	

(n)).

This is exactly the “single multiplier kills an entire packet-support divisor family” phenomenon your T
PS
	

 barrier isolates.

Strategy τ
sm
	

: small-prime-support divisor rule (structurally different packet choice)

Instead of a medium/large packet around Y=n
1/(2h)
, take a low packet of all primes up to a threshold y=y(n) such that the primorial stays sublinear.

Let

y:=⌊loglogn⌋(any y→∞ with y=o(logn) would do).

Let S:={p prime:p≤y} and define the primorial

M
y
	

:=
p≤y
∏
	

p.

Define the composite-claim family

D
sm
	

:={d:d∣M
y
	

, 2≤d≤n/2}.

This again contains arbitrary-support squarefree composites over the small-prime packet S.

Shortener strategy τ
sm
	

: on each Shortener turn, play

the smallest legal d∈D
sm
	

 if any exist;
otherwise play the smallest legal element of U (else pass).

Prolonger attack (again one-move preemption): play m=2
a
M
y
	

∈U as the first move (with a maximal such that 2
a
M
y
	

≤n), then fill U.

We must only check that M
y
	

≤n so such an a exists, and that the resulting m∈U.

Since y=⌊loglogn⌋, we have the trivial bound π(y)≤y and p≤y for each prime in the product, so

M
y
	

=
p≤y
∏
	

p ≤ y
π(y)
 ≤ y
y
.

Taking logs,

logM
y
	

≤ylogy=(loglogn)⋅logloglogn=o(logn).

Hence M
y
	

=n
o(1)
, in particular M
y
	

≤n for all sufficiently large n. (For any fixed constant c>0, eventually ylogy≤clogn, so M
y
	

≤n
c
.)

Let a be maximal with 2
a
M
y
	

≤n. Then 2
a+1
M
y
	

>n, hence 2
a
M
y
	

>n/2, so m∈U.

After that, the same divisibility argument applies:
every d∈D
sm
	

 divides M
y
	

∣m, so Shortener cannot play any d∈D
sm
	

, and is forced into U for the remainder. Therefore

L
τ
sm
	

	

(n)=∣U∣=⌈n/2⌉=ω(r
1
	

(n)).

This refutation is structurally different from τ
pkt
	

: it uses a small-prime packet rather than a Y=n
1/(2h)
-scale packet. The Prolonger counter is still the same structural weakness: “your composite rule is the divisor set of one multiplicative certificate; I can place that certificate into U and instantly invalidate the entire family.”

A single-shot structural barrier covering both strategies

Both refutations are instances of the following exact statement.

Let D⊆{2,…,⌊n/2⌋} be any family of “allowed composite claims” satisfying

D⊆{d:d∣M}

for some integer M≤n. Consider any Shortener strategy τ with the property that whenever it plays outside U, it always chooses a move from D (in any dynamic/online way).

Then Prolonger can force L
τ
	

(n)=∣U∣ by playing m=2
a
M∈U on move 1 (with a maximal such that 2
a
M≤n) and then playing out the rest of U. After the first move, every d∈D is illegal because d∣m; hence Shortener is confined to U, and U lasts exactly ∣U∣ moves.

Since ∣U∣=Θ(n)=ω(r
1
	

(n)), no divisor-family composite rule of the form “play within divisors of a single multiplicative certificate” can ever close L(n)≤O(r
1
	

(n)).

Sandbox verification (explicit legality check)

Below is a concrete simulation/verification for n=2000 and n=5000 showing:

Prolonger’s first move m∈U is legal,
the full sequence consisting of that m plus all remaining elements of U is legal,
the length equals ∣U∣ exactly.
import math
import sympy as sp

def is_legal(move, played):
    for a in played:
        if a % move == 0 or move % a == 0:
            return False
    return True

def verify_sequence_legal(seq):
    played=[]
    for x in seq:
        if not is_legal(x, played):
            return False
        played.append(x)
    return True

def packet_primes(n):
    h=max(1, int(math.floor(math.log(math.log(n)))))
    Y=int(math.floor(n**(1/(2*h))))
    if Y<2: Y=2
    primes=list(sp.primerange(Y, 2*Y+1))
    if len(primes)<h:
        x=2*Y+1
        while len(primes)<h and x<=n:
            if sp.isprime(x): primes.append(x)
            x+=1
    return h, Y, primes[:h]

def divisor_strategy_first_move(n, M):
    m=M
    while 2*m<=n:
        m*=2
    if m<=n//2:
        m=n//2+1
    return m

def demo_packet(n):
    h,Y,P = packet_primes(n)
    M=math.prod(P)
    m=divisor_strategy_first_move(n,M)
    U=list(range(n//2+1, n+1))
    seq=[m]+[x for x in U if x!=m]
    return {
        "n":n, "packet":P, "M":M, "first_move":m,
        "|U|":len(U), "len(seq)":len(seq), "seq_legal":verify_sequence_legal(seq)
    }

def primorial_primes_upto_y(y):
    return list(sp.primerange(2, y+1))

def demo_smooth(n):
    # choose y as large as possible with primorial <= sqrt(n) (for this finite-n demo)
    limit=int(n**0.5)
    prod=1
    y=1
    for p in sp.primerange(2, n+1):
        if prod*p <= limit:
            prod*=p
            y=p
        else:
            break
    primes=primorial_primes_upto_y(y)
    M=1
    for p in primes: M*=p
    m=divisor_strategy_first_move(n,M)
    U=list(range(n//2+1, n+1))
    seq=[m]+[x for x in U if x!=m]
    return {
        "n":n, "y":y, "primes<=y":primes, "M":M, "first_move":m,
        "|U|":len(U), "len(seq)":len(seq), "seq_legal":verify_sequence_legal(seq)
    }

print(demo_packet(2000))
print(demo_packet(5000))
print(demo_smooth(2000))
print(demo_smooth(5000))

Expected output from the sandbox run:

For n=2000, packet [7,11], M=77, first move m=1232∈U, ∣U∣=1000, full U-sequence legal, length 1000.
For n=5000, packet [11,13], M=143, first move m=4576∈U, ∣U∣=2500, full sequence legal, length 2500.
For the smooth strategy demo, M=30 (primes [2,3,5]), first move m∈U, and again the legal sequence fills U with length ∣U∣.

That matches the proofs: once Prolonger drops a single U-multiplier containing the full prime-support certificate, Shortener’s entire intended composite-claim family becomes illegal, and the game degenerates to playing out the antichain U.

If you want a next step inside the same framework, the only way to stop this one-move preemption is to make the set of below-half composite claims not simultaneously divisors of any single integer that Prolonger can embed into U; any strategy whose composite rule has that “single-certificate divisor closure” property is provably linear by the argument above.
