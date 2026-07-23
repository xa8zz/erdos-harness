/* Real-board policy arena for the antichain game (Erdos 872), exact legality.
 *
 * v2: O(n log n)-ish with bucket queues. See fable-worklog-R172.md Line D.
 *
 * S-bots: maxdeg (canonical: play live x maximizing live comparables ~ deg+ldc)
 * P-bots: burner (bundle-burn top-degree weapons via coprime knapsack * pad prime,
 *         checked live), dustman (free elements / min-damage fallback)
 *
 * Invariant: moves + kills == n-1 at end (every element played xor killed).
 * Usage: ./arena n S P   (S in {maxdeg,smallest}, P in {burner,dustman})
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

static int n;
static uint8_t *live;
static int32_t *deg;    /* # live strict multiples */
static int32_t *ldc;    /* # live strict divisors (>=2) */
static int32_t *spf;
static int64_t moves, kills;
static int64_t top_live;    /* live count in (n/2, n] */
static int64_t mvP, mvS;    /* moves by each player */
static uint8_t *sevby;      /* 0=not severed yet; 1=P severed; 2=S severed */
static int cur_mover=0;     /* 0=P,1=S */
static int64_t played_sev[3]={0,0,0}; /* played elements by severer class */
static int64_t peak_thin=0, peak_thin_move=0;

/* bucket queue over deg values (deg only decreases): doubly linked lists */
static int32_t *bhead, *bnext, *bprev; static int maxb;
static void bq_unlink(int d){
    int p=bprev[d], nx=bnext[d];
    if(p>=0) bnext[p]=nx; else if(bhead[deg[d]]==d) bhead[deg[d]]=nx;
    if(nx>=0) bprev[nx]=p;
    bprev[d]=bnext[d]=-1;
}
static void bq_link(int d){
    int b=deg[d];
    bprev[d]=-1; bnext[d]=bhead[b];
    if(bhead[b]>=0) bprev[bhead[b]]=d;
    bhead[b]=d;
    if(b>maxb) maxb=b;
}
static void sever_check(int d);
static void deg_dec(int d){ bq_unlink(d); deg[d]--; bq_link(d); sever_check(d); }

/* free stack: live elements with deg==0 && ldc==0 (kill nothing when played) */
static int32_t *fstack; static int ftop;
static void maybe_free(int x){ if(live[x]&&deg[x]==0&&ldc[x]==0) fstack[ftop++]=x; }

/* second bucket queue: upper-half elements by ldc (ldc only decreases) */
static int32_t *lhead, *lnext, *lprev; static int lmaxb; static int lq_on=0;
static void lq_unlink(int x){
    int p=lprev[x], nx=lnext[x];
    if(p>=0) lnext[p]=nx; else if(lhead[ldc[x]]==x) lhead[ldc[x]]=nx;
    if(nx>=0) lprev[nx]=p;
    lprev[x]=lnext[x]=-1;
}
static void lq_link(int x){
    int b=ldc[x];
    lprev[x]=-1; lnext[x]=lhead[b];
    if(lhead[b]>=0) lprev[lhead[b]]=x;
    lhead[b]=x;
    if(b>lmaxb) lmaxb=b;
}
static void ldc_dec(int x){ if(lq_on&&x>n/2){ lq_unlink(x); ldc[x]--; lq_link(x);} else ldc[x]--; sever_check(x); }
static void sever_check(int d){
    if(live[d] && !sevby[d] && deg[d]+ldc[d]<=2) sevby[d]= cur_mover? 2:1;
}

static int divcnt; static int divbuf[6144];
static void gen_divisors(int y){
    divcnt=1; divbuf[0]=1;
    int m=y;
    while(m>1){
        int p=spf[m], e=0;
        while(m%p==0){m/=p;e++;}
        int base=divcnt; long long pk=1;
        for(int a=1;a<=e;a++){
            pk*=p;
            for(int b=0;b<base;b++) divbuf[divcnt++]=(int)(divbuf[b]*pk);
        }
    }
}

static void kill_element(int y){
    live[y]=0;
    if(y>n/2) top_live--;
    gen_divisors(y);
    for(int i=0;i<divcnt;i++){ int d=divbuf[i]; if(d>=2&&d<y) { deg_dec(d); maybe_free(d);} }
    for(long long m=2ll*y;m<=n;m+=y){ ldc_dec((int)m); maybe_free((int)m); }
}

static void play(int x){
    moves++;
    if(cur_mover) mvS++; else mvP++;
    played_sev[sevby[x]]++;
    kill_element(x);
    for(long long m=2ll*x;m<=n;m+=x) if(live[m]){ kills++; kill_element((int)m); }
    gen_divisors(x);
    for(int i=0;i<divcnt;i++){ int d=divbuf[i]; if(d>=2&&d<x&&live[d]){ kills++; kill_element(d);} }
}

/* ---------- S ---------- */
static int s_maxdeg(void){
    while(maxb>0){
        int d=bhead[maxb];
        while(d>=0 && !live[d]) { int nx=bnext[d]; bq_unlink(d); d=nx; }
        if(d>=0) return d;
        maxb--;
    }
    /* all degrees 0: any live element (mop-up) */
    if(ftop>0){ while(ftop>0){ int x=fstack[--ftop]; if(live[x]) return x; } }
    for(int x=2;x<=n;x++) if(live[x]) return x;
    return -1;
}
static int scursor=2;
static int s_smallest(void){
    while(scursor<=n && !live[scursor]) scursor++;
    return scursor<=n? scursor : -1;
}

/* ---------- P ---------- */
static int p_dustman(void){
    while(ftop>0){ int x=fstack[--ftop]; if(live[x]&&deg[x]==0&&ldc[x]==0) return x; }
    /* min-damage fallback: scan a bounded window of the upper half */
    int best=1<<30,bx=-1,checked=0;
    for(int x=n;x>=n/2&&checked<4096;x--){
        if(!live[x]) continue;
        checked++;
        int sc=deg[x]+ldc[x];
        if(sc<best){best=sc;bx=x; if(!best)break;}
    }
    if(bx>0) return bx;
    for(int x=n;x>=2;x--) if(live[x]) return x;
    return -1;
}

static int p_boxer(void){
    /* box-burn: build x = prod p_i^{a_i} greedily maximizing burned-threat per
       log-cost; one move burns ALL divisors of x (a lattice box). */
    long long x=1;
    static const int SP[]={2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113,127,131,137,139,149,0};
    for(;;){
        double bestr=0; int bestp=0;
        for(int i=0;SP[i];i++){
            int p=SP[i];
            if(x> (long long)n/p) continue;
            long long x2=x*p;
            /* gain: sum of deg over live weapon-divisors of x2 not dividing x.
               new divisors = {d*p^k_max...}: iterate divisors of x2, keep d%x-new. */
            /* cheap estimate: new divisors are d*(p^new_exp) for d | x... approximate
               by sampling: use exact when tau small. */
            double gain=0;
            if(x2<=1000000000LL){
                gen_divisors((int)(x2<= (long long)n? x2: x2)); /* x2<=n guaranteed */
                for(int j=0;j<divcnt;j++){
                    int d=divbuf[j];
                    if(d>=2 && x % d != 0 && d<=n/2 && live[d] && deg[d]>0) gain+=deg[d];
                }
            }
            double r=gain/log((double)p);
            if(r>bestr){bestr=r;bestp=p;}
        }
        if(!bestp||bestr<=8) break;
        x*=bestp;
    }
    if(x<2) return p_dustman();
    /* pad to upper half with a live prime cofactor */
    long long hi=(long long)n/x;
    for(long long q=hi;q>=2;q--){
        if(spf[q]!=q) continue;
        if(live[x*q]) return (int)(x*q);
    }
    if(live[(int)x]) return (int)x;
    return p_dustman();
}

static long long taxval(int x){ /* sum of live-deg over live divisors of x */
    gen_divisors(x); long long s=0;
    for(int i=0;i<divcnt;i++){ int d=divbuf[i]; if(d>=2&&d<x&&live[d]) s+=1+deg[d]; }
    return s;
}
static int p_taxman(void){
    /* threat-weighted protect-the-top via ldc bucket queue: among top-64 by ldc,
       maximize sum of (1+deg) over live divisors killed. */
    int cand[64],nc=0;
    int b=lmaxb;
    while(b>0&&nc<64){
        int x=lhead[b];
        while(x>=0&&nc<64){
            int nx=lnext[x];
            if(!live[x]||ldc[x]!=b){ if(!live[x]) lq_unlink(x); x=nx; continue; }
            cand[nc++]=x; x=nx;
        }
        b--;
    }
    if(b>lmaxb) ; else if(nc>0&&lhead[lmaxb]<0) lmaxb=b;
    long long bv=0; int bx=-1;
    for(int i=0;i<nc;i++){ long long v=taxval(cand[i]); if(v>bv){bv=v;bx=cand[i];} }
    if(bx>0&&bv>0) return bx;
    return p_dustman();
}
static int p_burner(void);
static int p_hybrid(void){
    /* pick better of taxman candidate vs burner bundle by weapons-threat removed */
    int tx=p_taxman();
    long long tv= (tx>0&&tx>n/2)? taxval(tx):0;
    int bxm=p_burner();
    long long bvv=0;
    if(bxm>0){ gen_divisors(bxm); for(int i=0;i<divcnt;i++){int d=divbuf[i]; if(d>=2&&d<bxm&&live[d]) bvv+=1+deg[d]; } }
    if(tv>=bvv) return tx>0?tx:bxm;
    return bxm>0?bxm:tx;
}

static int rcursor=2;
static int p_race(void){
    /* 2-adic greedy front burner (R174): core = smallest live primes with
       prod <= n/2; play x = core * 2^a in (n/2, n]. Burned-but-unplayed primes
       remain legal FACTORS, so this is legal all the way to the n/2 wall. */
    while(rcursor<=n/2 && !(live[rcursor]&&spf[rcursor]==rcursor)) rcursor++;
    if(rcursor>n/2) return p_dustman();          /* wall reached: pass phase */
    long long prod=1; int core[64]; int nc=0;
    for(int p=rcursor; p<=n/2 && nc<60; p++){
        if(!(live[p]&&spf[p]==p)) continue;
        if(prod > (long long)(n/2)/p) break;
        core[nc++]=p; prod*=p;
    }
    while(nc>0){
        long long x=prod;
        while(x<=(long long)n/2) x*=2;           /* unique 2-adic pad into (n/2, n] */
        if(x<=n && live[(int)x]) return (int)x;
        nc--; prod/=core[nc];                    /* rare: x dead; shrink core */
    }
    return p_dustman();
}

static int p_burner(void){
    /* walk buckets downward; greedily pack coprime high-degree weapons */
    long long prod=1;
    int used[64],nu=0;
    int b=maxb;
    int scanned=0;
    while(b>=8 && nu<60 && scanned<20000){
        for(int d=bhead[b]; d>=0 && nu<60 && scanned<20000; d=bnext[d]){
            scanned++;
            if(!live[d]||deg[d]!=b) continue;
            if(d> n/2) continue;
            if(prod > (long long)n/d) continue;
            int ok=1;
            for(int i=0;i<nu;i++){ int a=used[i],bb=d; while(bb){int t=a%bb;a=bb;bb=t;} if(a>1){ok=0;break;} }
            if(!ok) continue;
            used[nu++]=d; prod*=d;
        }
        b--;
    }
    if(nu==0) return p_dustman();
    /* pad: find live x = prod*q (q prime), largest q first (fewest multiples) */
    long long hi=(long long)n/prod;
    for(long long q=hi;q>=2;q--){
        if(spf[q]!=q) continue;
        long long x=prod*q;
        if(live[x]) return (int)x;
    }
    if(prod<=n && prod>=2 && live[(int)prod]) return (int)prod;
    return p_dustman();
}

int main(int argc,char**argv){
    n=atoi(argv[1]);
    const char*sp=argv[2], *pp=argv[3];
    live=malloc(n+1); memset(live,1,n+1); live[0]=live[1]=0;
    deg=malloc((size_t)(n+1)*4); ldc=malloc((size_t)(n+1)*4);
    bhead=malloc((size_t)(n+1)*4); bnext=malloc((size_t)(n+1)*4); bprev=malloc((size_t)(n+1)*4);
    fstack=malloc((size_t)(n+1)*4);
    sevby=calloc(n+1,1);
    spf=malloc((size_t)(n+1)*4);
    for(int i=0;i<=n;i++) spf[i]=0;
    for(int i=2;i<=n;i++) if(!spf[i]) for(long long j=i;j<=n;j+=i) if(!spf[j]) spf[j]=(int)i;
    for(int i=0;i<=n;i++){ bhead[i]=-1; }
    maxb=0;
    for(int d=2;d<=n;d++){
        deg[d]=n/d-1;
        int m=d, om=0; /* ldc = tau(d)-2 (all proper divisors >=2 are live initially) */
        /* count divisors */
        int td=1, mm=d;
        while(mm>1){int p=spf[mm],e=0;while(mm%p==0){mm/=p;e++;}td*=(e+1);}
        ldc[d]=td-2;
        (void)m;(void)om;
        bnext[d]=bprev[d]=-1;
    }
    for(int d=2;d<=n;d++) bq_link(d);
    lhead=malloc((size_t)(n+1)*4); lnext=malloc((size_t)(n+1)*4); lprev=malloc((size_t)(n+1)*4);
    for(int i=0;i<=n;i++) lhead[i]=-1;
    lmaxb=0;
    for(int x=n/2+1;x<=n;x++){ lnext[x]=lprev[x]=-1; lq_link(x); }
    lq_on=1;
    ftop=0;
    moves=0;kills=0;
    int turn=0;
    FILE*prof=fopen("arena_profile.csv","w");
    fprintf(prof,"move,player,x,killed_now,top_live\n");
    top_live = n - n/2;
    while(moves+kills < n-1){
        int x;
        int64_t k0=kills;
        cur_mover=turn;
        if(turn==0) x = strcmp(pp,"burner")==0? p_burner(): (strcmp(pp,"boxer")==0? p_boxer(): (strcmp(pp,"taxman")==0? p_taxman(): (strcmp(pp,"hybrid")==0? p_hybrid(): (strcmp(pp,"race")==0? p_race():p_dustman()))));
        else        x = strcmp(sp,"maxdeg")==0? s_maxdeg():s_smallest();
        if(x<0) break;
        play(x);
        if(moves<=256||((long long)moves&63)==0)
            fprintf(prof,"%lld,%c,%d,%lld,%lld\n",(long long)moves,turn?'S':'P',x,(long long)(kills-k0),(long long)top_live);
        if(((long long)moves&8191)==0 || moves==512 || moves==2048){
            /* hereditary thin: thin AND all live comparables thin */
            static uint8_t *thinf=0;
            if(!thinf) thinf=malloc(n+1);
            for(int z=2;z<=n;z++) thinf[z]= live[z]&&(deg[z]+ldc[z]<=2);
            int64_t hered=0;
            for(int z=2;z<=n;z++){
                if(!thinf[z]) continue;
                int ok=1;
                for(long long m=2ll*z;m<=n&&ok;m+=z) if(live[m]&&!thinf[m]) ok=0;
                if(ok){
                    gen_divisors(z);
                    for(int i=0;i<divcnt&&ok;i++){int d=divbuf[i]; if(d>=2&&d<z&&live[d]&&!thinf[d]) ok=0;}
                }
                if(ok) hered++;
            }
            if(hered>peak_thin){peak_thin=hered;peak_thin_move=moves;}
        }
        turn^=1;
    }
    fclose(prof);
    printf("peak HEREDITARY thin-live=%lld (%.4f of n) at move %lld\n",
        (long long)peak_thin,(double)peak_thin/n,(long long)peak_thin_move);
    printf("severing of PLAYED elements: unsev(thin-from-start)=%lld  by-P=%lld  by-S=%lld\n",
        (long long)played_sev[0],(long long)played_sev[1],(long long)played_sev[2]);
    printf("P-moves=%lld S-moves=%lld top-half-live-final=%lld race-front=%d\n",
        (long long)mvP,(long long)mvS,(long long)top_live,rcursor);
    printf("n=%d S=%s P=%s L=%lld L/n=%.5f kills=%lld sum=%lld (expect %d)\n",
        n,sp,pp,(long long)moves,(double)moves/n,(long long)kills,
        (long long)(moves+kills),n-1);
    return 0;
}
