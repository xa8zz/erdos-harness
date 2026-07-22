#!/usr/bin/env python3
"""Line D v2: hybrid discrete/continuum band-race game on the rough tree.

Architecture:
  - DISCRETE region: nodes d <= D0 (exact integers, exact rough-tree structure).
    Node d with roughness r (last chain prime) owns {d*m <= n : P^-(m) >= r}.
    Owned mass via Buchstab: (1/d) * omega(log(n/d)/log r)/log r  (normalized board=1).
  - CONTINUUM region: cohorts keyed by (u_bin, v_bin), u = log d, v = log r.
  - P moves first. Each P move: knapsack bundle of live frontier nodes with
    sum(log d) <= (1-pad)*log n, chosen greedily by saved-mass per log-scale;
    burning d fragments it into children (dq, q), q prime >= r, dq <= n.
  - Each S move: cash the single live frontier node with max cone mass.
    Cash kills node's owned mass; overlap knob lam >= 1 multiplies kill to model
    frontier multiples wiped by the same cone (sensitivity parameter).
  - Discrete phase simulated move-by-move (alternating); when all discrete action
    is exhausted (per-move kills below threshold), continuum cohorts race in
    batched events (S drain rate 1/move vs P push rate floor((1-pad)/u_scale)/move).
  - Mop-up: every remaining live element costs 1 move. c = total moves / n.

This is a MODEL (conjecture generator): asymptotic densities, no legality edge
cases, heuristic v1 policies. Validation: small-LAM discrete phase vs exact PVs.
"""
import math, sys
from collections import defaultdict

EG = 0.5615948103  # e^{-gamma}

def omega_buch(t):
    if t < 1: return 0.0
    if t <= 2: return 1.0/t
    if t <= 3: return (1.0 + math.log(t-1.0))/t
    if t <= 4: return EG + 0.02/t   # smooth-ish approach
    return EG

def small_primes(limit):
    s = list(range(limit+1)); s[0]=s[1]=0
    for i in range(2,int(limit**0.5)+1):
        if s[i]:
            for j in range(i*i,limit+1,i): s[j]=0
    return [p for p in s if p]

class Hybrid:
    def __init__(self, LAM, D0=2048, pad=0.06, lam_overlap=1.0, verbose=0):
        self.LAM=LAM; self.n=math.exp(LAM); self.D0=min(D0,int(self.n)); self.pad=pad
        self.lam=lam_overlap; self.vb=verbose
        self.primes=small_primes(max(3,self.D0))
        self.moves=0.0; self.killed=0.0   # normalized by n (mass units)
        # discrete frontier: d -> [rough r, owned mass, alive]
        self.disc={}
        # continuum cohorts: (ub,vb) -> [count, mass]; bins over (0, LAM]
        self.B=max(30,int(2*LAM)); self.du=LAM/self.B
        self.cont=defaultdict(lambda:[0.0,0.0])
        self.trace=[]
        self._seed()

    # ---------- mass helpers ----------
    def rough_dens(self, logM, r):
        """density of {m<=M : P^-(m)>=r}; r an actual number (prime)."""
        if r<=2: return 1.0
        lr=math.log(r)
        if logM<=0: return 0.0
        if logM<lr:  return 0.0          # no m in (1,M]
        return omega_buch(logM/lr)/lr

    def disc_mass(self,d,r):
        """normalized owned mass of discrete node (d, r): cone {d*m<=n, P^-(m)>=r},
        including m=1 (the element d itself)."""
        logM=self.LAM-math.log(d)
        if logM<0: return 0.0
        dens=self.rough_dens(logM,r)
        return (1.0/d)*dens + 1.0/self.n

    def _seed(self):
        # frontier = prime nodes. discrete: p <= D0; continuum: above.
        for p in self.primes:
            if p> self.n: break
            self.disc[p]=[p,self.disc_mass(p,p),1]
        # continuum primes p in (D0, n]:
        lo=math.log(self.D0)
        for i in range(self.B):
            u=(i+0.5)*self.du
            if u<=lo or u>self.LAM: continue
            cnt=math.exp(u)/u*self.du
            logM=self.LAM-u
            pm=(math.exp(-u))*self.rough_dens(logM,math.exp(u)) + 1.0/self.n
            k=(i,i)
            self.cont[k][0]+=cnt; self.cont[k][1]+=cnt*pm

    # ---------- structure ----------
    def disc_children(self,d,r):
        """fragment discrete node: children (d*q, q) for q prime >= r, d*q <= n."""
        out=[]
        for q in self.primes:
            if q<r: continue
            if d*q>self.n: break
            if d*q<=self.D0: out.append((d*q,q))
            else:
                u=math.log(d*q); v=math.log(q)
                out.append(((min(self.B-1,int(u/self.du)),min(self.B-1,int(v/self.du))),
                            'cont', d*q, q))
        # continuum children beyond D0/d... handled above via cont key; also children
        # with q > D0 (q from continuum primes):
        qlo=max(r,self.D0+1)
        if d*qlo<=self.n:
            llo=math.log(qlo); lhi=self.LAM-math.log(d)
            nb=max(2,int((lhi-llo)/self.du))
            dt=(lhi-llo)/nb
            for j in range(nb):
                t=llo+(j+0.5)*dt
                cnt=math.exp(t)/t*dt
                u=math.log(d)+t
                pm=math.exp(-u)*self.rough_dens(self.LAM-u,math.exp(t))+1.0/self.n
                k=(min(self.B-1,int(u/self.du)),min(self.B-1,int(t/self.du)))
                out.append((k,'contmass',cnt,cnt*pm))
        return out

    def burn_disc(self,d):
        r,m,alive=self.disc[d]
        assert alive
        self.disc[d][2]=0
        kids=self.disc_children(d,r)
        massout=0.0
        for k in kids:
            if isinstance(k[0],tuple):
                if k[1]=='cont':
                    u=math.log(k[2]); q=k[3]
                    pm=math.exp(-u)*self.rough_dens(self.LAM-u,q)+1.0/self.n
                    self.cont[k[0]][0]+=1; self.cont[k[0]][1]+=pm; massout+=pm
                else:
                    self.cont[k[0]][0]+=k[2]; self.cont[k[0]][1]+=k[3]; massout+=k[3]
            else:
                dd,q=k
                if dd in self.disc and self.disc[dd][2]:
                    continue
                pm=self.disc_mass(dd,q)
                self.disc[dd]=[q,pm,1]; massout+=pm
        # element d itself dies with the burn (divisor of the burn move) - negligible
        # mass 1/n, count it killed:
        self.killed+=1.0/self.n

    # ---------- policies ----------
    def best_S(self):
        bm,bd=-1,None
        for d,(r,m,alive) in self.disc.items():
            if alive and m>bm: bm,bd=m,d
        bk=None
        for k,(c,m) in self.cont.items():
            if c>1e-12 and m>1e-18:
                pm=m/c
                if pm>bm: bm,bd,bk=pm,None,k
        return bd,bk,bm

    def p_bundle(self):
        """greedy knapsack: score = mass/logd among live discrete non-dust nodes;
        continuum handled in batch phase, but include representative pushes."""
        cands=[]
        for d,(r,m,alive) in self.disc.items():
            if not alive: continue
            if self.LAM-math.log(d)<math.log(max(r,2)): continue   # dust
            if m<=2.0/self.n: continue
            cands.append((m/math.log(d),d,m))
        cands.sort(reverse=True)
        cap=(1-self.pad)*self.LAM; out=[]
        for s,d,m in cands:
            ld=math.log(d)
            if ld<=cap: out.append(d); cap-=ld
        return out

    # ---------- phases ----------
    def discrete_phase(self):
        """alternate: P bundle-burn, S single cash, until discrete kills dry up."""
        guard=0
        while guard<200000:
            guard+=1
            # P move
            bundle=self.p_bundle()
            if bundle:
                for d in bundle: self.burn_disc(d)
                self.moves+=1.0/self.n
                if self.vb and self.n<200: self.trace.append(("P",tuple(bundle)))
            else:
                self.moves+=1.0/self.n   # P mops dust / passes
                if self.vb and self.n<200: self.trace.append(("P","pass"))
            # S move
            bd,bk,bm=self.best_S()
            if bm<=3.0/self.n:
                # battle over: nothing fat left anywhere
                self.moves+=1.0/self.n
                return
            if bd is not None:
                r,m,_=self.disc[bd]
                self.disc[bd]=[r,0.0,0]
                kill=min(m*self.lam, m)  # overlap knob (capped: can't kill more than exists... cross-node extra handled crudely)
                self.killed+=m
                extra=(self.lam-1.0)*m
                self._bleed(extra)
                self.moves+=1.0/self.n
                if self.vb and self.n<200: self.trace.append(("S",bd))
            else:
                # S's best is continuum: leave to continuum phase if P also done
                if not bundle:
                    return
                c,m=self.cont[bk]; pm=m/c
                self.cont[bk][0]-=1; self.cont[bk][1]-=pm
                self.killed+=pm; self._bleed((self.lam-1)*pm)
                self.moves+=1.0/self.n
                if self.vb and self.n<200: self.trace.append(("S","cont",bk))

    def _bleed(self,extra):
        """overlap: cross-cone kills bleed mass out of surviving frontier, prorated."""
        if extra<=0: return
        tot=sum(m for _,(r,m,a) in self.disc.items() if a)+sum(m for c,m in self.cont.values())
        if tot<=extra:
            self._wipe(); self.killed+=tot; return
        f=1-extra/tot
        for d in self.disc:
            if self.disc[d][2]: self.disc[d][1]*=f
        for k in self.cont:
            self.cont[k][1]*=f
        self.killed+=extra

    def _wipe(self):
        for d in self.disc: self.disc[d][1]=0; self.disc[d][2]=0
        for k in self.cont: self.cont[k]=[0.0,0.0]

    def continuum_phase(self):
        """batched racing on cohorts."""
        guard=0
        while guard<500000:
            guard+=1
            # S target
            bk,bpm=None,3.0/self.n
            for k,(c,m) in self.cont.items():
                if c>1e-9 and m>0:
                    pm=m/c
                    if pm>bpm: bpm,bk=pm,k
            if bk is None: break
            # P target: max mass/(u) among non-dust
            pk,ps=None,-1
            for k,(c,m) in self.cont.items():
                if c<=1e-9 or m<=0: continue
                u=(k[0]+0.5)*self.du; v=(k[1]+0.5)*self.du
                if self.LAM-u<v: continue      # dust cohort
                if m/c<=3.0/self.n: continue   # not worth defending
                sc=(m/c)/u
                if sc>ps: ps,pk=sc,k
            cS,mS=self.cont[bk]
            if pk is None:
                self.moves+=2*cS/self.n
                self.killed+=mS; self.cont[bk]=[0.0,0.0]
                self._bleed((self.lam-1)*mS)
                continue
            uP=(pk[0]+0.5)*self.du
            bw=max(1.0,(1-self.pad)*self.LAM/uP/ (self.LAM) * self.LAM/1.0)  # nodes per move: (1-pad)*LAM/uP... careful
            bw=max(1.0,(1-self.pad)*self.LAM/uP)
            if pk==bk:
                T=cS/(1+bw)
                self.moves+=2*T/self.n
                kfrac=T/cS
                self.killed+=mS*kfrac
                self._push_cont(pk,T*bw,mS*min(1-kfrac,T*bw/cS))
                self.cont[bk]=[0.0,0.0]
                continue
            cP,mP=self.cont[pk]
            T=min(cS, cP/bw)
            self.moves+=2*T/self.n
            kfrac=T/cS
            self.killed+=mS*kfrac
            self.cont[bk][0]-=T; self.cont[bk][1]-=mS*kfrac
            pushed=min(T*bw,cP); pfrac=pushed/cP
            self._push_cont(pk,pushed,mP*pfrac)
            self.cont[pk][0]-=pushed; self.cont[pk][1]-=mP*pfrac
        # anything left with per-node mass <= threshold: mop-up handled by run()

    def _push_cont(self,k,count,mass):
        """fragment continuum nodes into children cohorts."""
        u=(k[0]+0.5)*self.du; v=(k[1]+0.5)*self.du
        lhi=self.LAM-u
        if lhi<=v or mass<=0:
            return  # dust: stays as is (will be mopped)
        nb=max(2,int((lhi-v)/self.du)); dt=(lhi-v)/nb
        ws=[]
        for j in range(nb):
            t=v+(j+0.5)*dt
            cc=math.exp(t)/t*dt
            uu=u+t
            pm=math.exp(-uu)*self.rough_dens(self.LAM-uu,math.exp(t))+1.0/self.n
            ws.append((t,cc,pm))
        wt=sum(cc*pm for _,cc,pm in ws)
        if wt<=0: return
        for t,cc,pm in ws:
            share=cc*pm/wt
            kk=(min(self.B-1,int((u+t)/self.du)),min(self.B-1,int(t/self.du)))
            self.cont[kk][0]+=count*cc
            self.cont[kk][1]+=mass*share

    def run(self):
        self.discrete_phase()
        self.continuum_phase()
        rem=sum(m for _,(r,m,a) in self.disc.items() if a)+sum(m for c,m in self.cont.values())
        self.moves+=rem     # mop-up: 1 move per element; mass fraction = element count/n
        return self.moves,self.killed,rem

if __name__=="__main__":
    lam=float(sys.argv[1]) if len(sys.argv)>1 else 1.0
    print(f"overlap lam={lam}")
    print(f"{'LAM':>5} {'n':>10} {'c=L/n':>8} {'killed':>8} {'rem(mop)':>9}")
    for LAM in (4.06, 6, 9, 12, 16, 21, 27, 35, 46, 60, 80, 105):
        h=Hybrid(LAM, lam_overlap=lam)
        mv,kl,rem=h.run()
        print(f"{LAM:5.1f} {math.exp(LAM):10.3g} {mv:8.4f} {kl:8.4f} {rem:9.4f}")
