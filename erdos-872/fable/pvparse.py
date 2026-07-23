#!/usr/bin/env python3
"""Parse solver pv output; replay the chosen line; extract the
contested/remnant decomposition and the liberation ledger.

Per n: T = number of moves through the last kill>0 move (contested phase),
A = L - T (free endgame plays), sever events (P kills a prime divisor-side),
liberation events (a live element's live-comparable count hits 0), S harvest
profile, and the composite/prime split of the final remnant.
"""
import re, sys, glob

def primes_upto(n):
    s = [True]*(n+1); s[0]=s[1]=False
    for i in range(2,int(n**.5)+1):
        if s[i]: s[i*i::i] = [False]*len(s[i*i::i])
    return s

def parse(fn):
    lines = open(fn).read().strip().split("\n")
    m = re.match(r"PV n=(\d+) L=(\d+)", lines[0])
    n, L = int(m.group(1)), int(m.group(2))
    moves = []
    for ln in lines[1:]:
        mm = re.match(r"\s*(\d+)\s+([PS]):\s+(.*)", ln)
        if not mm: continue
        opts = re.findall(r"(\d+)\(d(\d+)\)", mm.group(3))
        moves.append((mm.group(2), int(opts[0][0]), [(int(a),int(b)) for a,b in opts]))
    return n, L, moves

def replay(n, moves):
    isp = primes_upto(n)
    comp = {v: set() for v in range(2, n+1)}
    for v in range(2, n+1):
        for w in range(2*v, n+1, v):
            comp[v].add(w); comp[w].add(v)
    live = set(range(2, n+1))
    events = []          # per move dicts
    freeborn = {v for v in live if not (comp[v] & live)}
    for idx, (pl, x, opts) in enumerate(moves):
        killed = sorted(comp[x] & live)
        deg = len(killed)
        live.discard(x)
        for k in killed: live.discard(k)
        # liberation: elements whose live-comp count just hit 0
        newly_free = [z for z in live
                      if (comp[z] & live) == set()
                      and (comp[z] & (set(killed) | {x}))]
        sever = [k for k in killed if isp[k]]     # prime killed divisor-side or mult-side
        events.append(dict(i=idx+1, pl=pl, x=x, deg=deg, killed=killed,
                           sever=sever, freed=newly_free, nopts=len(opts)))
    return events, freeborn

def analyze(fn):
    n, L, moves = parse(fn)
    ev, freeborn = replay(n, moves)
    assert len(ev) == L, (fn, len(ev), L)
    lastkill = max((e["i"] for e in ev if e["deg"] > 0), default=0)
    T, A = lastkill, L - lastkill
    kills = sum(e["deg"] for e in ev)
    assert L + kills == n - 1, (fn, L, kills)
    isp = primes_upto(n)
    # remnant = elements PLAYED after the contested phase
    remnant = [e["x"] for e in ev if e["i"] > lastkill]
    remn_comp = [x for x in remnant if not isp[x]]
    remn_prime = [x for x in remnant if isp[x]]
    tophalf_primes = sum(1 for p in range(n//2+1, n+1) if isp[p])
    severed = [(e["i"], e["pl"], e["x"], s) for e in ev for s in e["sever"]]
    freed_total = sum(len(e["freed"]) for e in ev)
    p_kills = sum(e["deg"] for e in ev if e["pl"] == "P")
    s_kills = sum(e["deg"] for e in ev if e["pl"] == "S")
    print(f"n={n:3d} L={L:2d} T={T:2d} A={A:2d}  k(n)={L - sum(1 for v in range(2,n+1) if isp[v]):2d}  "
          f"remnant: {len(remn_prime)}p+{len(remn_comp)}c  topHalfP={tophalf_primes}  "
          f"freeborn={len(freeborn)}  freedInPlay={freed_total}  PK={p_kills} SK={s_kills}")
    print(f"      contested: " + " | ".join(
        f"{e['pl']}{e['x']}k{e['deg']}" for e in ev if e["i"] <= lastkill))
    if severed:
        print(f"      severs: " + ", ".join(f"{pl}@{i}:{x}->kills p{s}" for i,pl,x,s in severed))
    print(f"      remnant comps: {sorted(remn_comp)}")
    return dict(n=n, L=L, T=T, A=A)

if __name__ == "__main__":
    fns = sys.argv[1:] or sorted(glob.glob("pv*.txt"),
                                 key=lambda f: int(re.search(r"\d+", f).group()))
    for fn in fns:
        analyze(fn)
