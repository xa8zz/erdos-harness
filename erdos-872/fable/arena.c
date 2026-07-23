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

/* P4 crossing ledger, threshold D=6: crossed[z]=1 once comp<=DTHR.
 * crossX[mover][channel]: channel 0 = multiple-side (a multiple of z died;
 * tau-bounded amplification), channel 1 = divisor-side (a divisor of z died;
 * the cone-admission channel). born6 = comp<=DTHR at start. */
#define DTHR 6
static uint8_t *crossed;
static int64_t crossX[2][2]={{0,0},{0,0}};
static int64_t born6=0;
static int64_t played_crossX[2][2]={{0,0},{0,0}}; /* played z by crossing class */
static uint8_t *crossch;    /* 1=mult-side,2=div-side crossing, 0=born-thin */
static uint8_t *crossmv;    /* mover at crossing time: 0=P,1=S */

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
static void cross_check(int z,int ch){
    if(live[z] && !crossed[z] && deg[z]+ldc[z]<=DTHR){
        crossed[z]=1; crossch[z]=(uint8_t)ch; crossmv[z]=(uint8_t)cur_mover;
        crossX[cur_mover][ch-1]++;
    }
}
static void deg_dec(int d){ bq_unlink(d); deg[d]--; bq_link(d); sever_check(d); cross_check(d,1); }

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
static void ldc_dec(int x){ if(lq_on&&x>n/2){ lq_unlink(x); ldc[x]--; lq_link(x);} else ldc[x]--; sever_check(x); cross_check(x,2); }
static void sever_check(int d){
    if(live[d] && !sevby[d] && deg[d]+ldc[d]<=2) sevby[d]= cur_mover? 2:1;
}

/* top-half fire value: tdeg[d] = # live multiples of d in (n/2, n] */
static int32_t *tdeg;
static int32_t *thead, *tnext, *tprev; static int tmaxb; static int tq_on=0;
static void tq_unlink(int x){
    int p=tprev[x], nx=tnext[x];
    if(p>=0) tnext[p]=nx; else if(thead[tdeg[x]]==x) thead[tdeg[x]]=nx;
    if(nx>=0) tprev[nx]=p;
    tprev[x]=tnext[x]=-1;
}
static void tq_link(int x){
    int b=tdeg[x];
    tprev[x]=-1; tnext[x]=thead[b];
    if(thead[b]>=0) tprev[thead[b]]=x;
    thead[b]=x;
    if(b>tmaxb) tmaxb=b;
}
static void tdeg_dec(int d){ if(tq_on){ tq_unlink(d); tdeg[d]--; tq_link(d);} }

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
    for(int i=0;i<divcnt;i++){ int d=divbuf[i]; if(d>=2&&d<y) { deg_dec(d); if(y>n/2) tdeg_dec(d); maybe_free(d);} }
    for(long long m=2ll*y;m<=n;m+=y){ ldc_dec((int)m); maybe_free((int)m); }
}

static int64_t played_born=0, played_fat=0;
/* K2 wave ledger: omega(x) via spf walk; TK_by_omega[w] = top-half kills by
   S fires of weapons with omega=w; safe_by_omega[w] = top plays at comp 0. */
static int omega_of(int x){ int c=0; while(x>1){ int p=spf[x]; c++; while(x%p==0) x/=p; } return c; }
static int64_t TK_by_omega[12]={0}, safe_by_omega[12]={0}, fire_cnt[12]={0};
static void play(int x){
    moves++;
    if(cur_mover) mvS++; else mvP++;
    int om_x = omega_of(x); if(om_x>11) om_x=11;
    int64_t tl0 = top_live;
    int was_free = (deg[x]+ldc[x]==0);
    if(x>n/2 && was_free && safe_by_omega){ safe_by_omega[om_x]++; }
    if(crossed[x]){ if(crossch[x]) played_crossX[crossmv[x]][crossch[x]-1]++; else played_born++; }
    else played_fat++;
    played_sev[sevby[x]]++;
    kill_element(x);
    for(long long m=2ll*x;m<=n;m+=x) if(live[m]){ kills++; kill_element((int)m); }
    gen_divisors(x);
    for(int i=0;i<divcnt;i++){ int d=divbuf[i]; if(d>=2&&d<x&&live[d]){ kills++; kill_element(d);} }
    if(cur_mover==1 && x<=n/2){ /* S fire: top-half coverage by weapon omega */
        int64_t tkilled = tl0 - top_live;
        TK_by_omega[om_x] += tkilled; fire_cnt[om_x]++;
    }
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
static int s_topdeg(void){
    /* pure fire value: max live top-half multiples (interior weapons only) */
    while(tmaxb>0){
        int d=thead[tmaxb];
        while(d>=0){
            int nx=tnext[d];
            if(!live[d]||tdeg[d]!=tmaxb){ if(!live[d]) tq_unlink(d); d=nx; continue; }
            return d;
        }
        tmaxb--;
    }
    return s_maxdeg();
}
static int hcursor=3;
static int s_hunter(void){
    /* leapfrog: fire the smallest ARMED odd interior (anticipates an
       ascending closure sweep); disarmed/dead skipped permanently. */
    while(hcursor<=n/2 && !(live[hcursor]&&tdeg[hcursor]>0)) hcursor+=2;
    if(hcursor<=n/2) return hcursor;
    return s_maxdeg();
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

static int ccursor=3;
static int p_closure_body(int taxfall);
static int p_closure(void){ return p_closure_body(0); }
static int p_closuretax(void){ return p_closure_body(1); }
static int p_closure_body(int taxfall){
    /* closure-sweeper (F25): defuse the ODD interior ascending (most-shared
       weapons first == the clearing-game race under real rules). Vehicle for
       w: prefer the 2-adic pad w*2^a in (n/2,n] (kills w + its surviving
       sub-closure shadow, spends only even stock); else any even-cofactor
       vehicle; else odd vehicle (spends odd stock, last resort). Free stock
       (comp 0) is unkillable and needs no urgency: defuse while weapons
       live, dustman-bank afterwards. */
    while(ccursor<=n/2){
        if(live[ccursor]){
            int w=ccursor;
            long long x=w; while(x<=(long long)n/2) x*=2;
            if(x<=n && live[(int)x]) return (int)x;
            int lo=(int)((long long)n/2/w)+1, hi=(int)((long long)n/w);
            if(lo<2) lo=2;
            for(int m=lo;m<=hi;m++)
                if(!(m&1) && live[(int)((long long)m*w)]) return (int)((long long)m*w);
            for(int m=hi;m>=lo;m--)
                if((m&1) && live[(int)((long long)m*w)]) return (int)((long long)m*w);
            /* orphaned: whole top window of cone(w) is dead; w is harmless
               to odd stock only if its odd cone is dead too — advance. */
        }
        ccursor+=2;
    }
    return taxfall? p_taxman(): p_dustman();
}

static int pcursor=3;
static int p_pack(void){
    /* multi-target closure sweep (F25.2 share collapse): pack the next live
       odd interiors ascending into one vehicle prod <= n; land it in
       (n/2, n] via 2-adic pad if evens alive, else by packing depth alone.
       One play defuses the whole core + cross-products. */
    for(;;){
        while(pcursor<=n/2 && !live[pcursor]) pcursor+=2;
        if(pcursor>n/2) return p_dustman();
        int core[64]; int nc=0;
        long long prod=1;
        for(int w=pcursor; w<=n/2 && nc<60; w+=2){
            if(!live[w]) continue;
            if(prod > (long long)n/w) break;
            core[nc++]=w; prod*=w;
        }
        while(nc>0){
            long long x=prod;
            while(x<=(long long)n/2) x*=2;          /* 2-adic pad */
            if(x<=n && live[(int)x]) return (int)x;
            if(prod>(long long)n/2 && live[(int)prod]) return (int)prod;
            nc--; prod/=core[nc];                    /* shrink and retry */
        }
        /* single-target fallback: any live vehicle for the cursor element */
        int w=pcursor;
        int lo=(int)((long long)n/2/w)+1, hi=(int)((long long)n/w);
        if(lo<2) lo=2;
        for(int m=hi;m>=lo;m--)
            if(live[(int)((long long)m*w)]) return (int)((long long)m*w);
        pcursor+=2;                                  /* orphaned: next target */
    }
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
    crossed=calloc(n+1,1); crossch=calloc(n+1,1); crossmv=calloc(n+1,1);
    for(int d=2;d<=n;d++) if(deg[d]+ldc[d]<=DTHR){ crossed[d]=1; born6++; }
    tdeg=malloc((size_t)(n+1)*4);
    thead=malloc((size_t)(n+1)*4); tnext=malloc((size_t)(n+1)*4); tprev=malloc((size_t)(n+1)*4);
    for(int i=0;i<=n;i++) thead[i]=-1;
    tmaxb=0;
    for(int d=2;d<=n/2;d++){ tdeg[d]=n/d-(n/2)/d; tnext[d]=tprev[d]=-1; tq_link(d); }
    tq_on=1;
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
        if(turn==0) x = strcmp(pp,"burner")==0? p_burner(): (strcmp(pp,"boxer")==0? p_boxer(): (strcmp(pp,"taxman")==0? p_taxman(): (strcmp(pp,"hybrid")==0? p_hybrid(): (strcmp(pp,"race")==0? p_race(): (strcmp(pp,"closure")==0? p_closure(): (strcmp(pp,"closuretax")==0? p_closuretax(): (strcmp(pp,"pack")==0? p_pack():p_dustman())))))));
        else        x = strcmp(sp,"maxdeg")==0? s_maxdeg(): (strcmp(sp,"topdeg")==0? s_topdeg(): (strcmp(sp,"hunter")==0? s_hunter():s_smallest()));
        if(x<0) break;
        play(x);
        if(moves<=256||((long long)moves&63)==0)
            fprintf(prof,"%lld,%c,%d,%lld,%lld\n",(long long)moves,turn?'S':'P',x,(long long)(kills-k0),(long long)top_live);
        if(moves==512||moves==2048||moves==8192||moves==32768||moves==131072||moves==524288||moves==2097152){
            /* tower-stock scan: prepared pairs (near-thin live z, live root d|z),
               banded by dyadic quotient h = n/d; also the single largest root. */
            static int32_t *pcnt=0;
            if(!pcnt) pcnt=malloc((size_t)(n+1)*4);
            memset(pcnt,0,(size_t)(n+1)*4);
            int64_t band[28]; memset(band,0,sizeof band);
            int64_t stock=0; int nthin=0;
            for(int z=2;z<=n;z++){
                if(!(live[z]&&crossed[z])) continue;
                nthin++;
                gen_divisors(z);
                for(int i=0;i<divcnt;i++){
                    int d=divbuf[i];
                    if(d<2||d>=z||!live[d]) continue;
                    pcnt[d]++; stock++;
                    int h=n/d, b=0; while((1<<b)<h && b<27) b++;
                    band[b]++;
                }
            }
            int bd=-1; int64_t bc=0;
            for(int d=2;d<=n;d++) if(pcnt[d]>bc){bc=pcnt[d];bd=d;}
            printf("TOWER move=%lld thin=%d stock=%lld maxroot=(%d,%lld,h=%d) "
                   "bands(h<=2^b) b=1:%lld 2:%lld 3:%lld 4:%lld 5:%lld 6:%lld 7:%lld rest:%lld\n",
                (long long)moves,nthin,(long long)stock,bd,(long long)bc,bd>0?n/bd:0,
                (long long)band[1],(long long)band[2],(long long)band[3],(long long)band[4],
                (long long)band[5],(long long)band[6],(long long)band[7],
                (long long)(stock-band[1]-band[2]-band[3]-band[4]-band[5]-band[6]-band[7]));
            fflush(stdout);
        }
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
    printf("CROSS D=%d: born=%lld  by-P: mult=%lld div=%lld  by-S: mult=%lld div=%lld\n",
        DTHR,(long long)born6,
        (long long)crossX[0][0],(long long)crossX[0][1],
        (long long)crossX[1][0],(long long)crossX[1][1]);
    printf("PLAYED by class: born=%lld fat=%lld  P-mult=%lld P-div=%lld  S-mult=%lld S-div=%lld\n",
        (long long)played_born,(long long)played_fat,
        (long long)played_crossX[0][0],(long long)played_crossX[0][1],
        (long long)played_crossX[1][0],(long long)played_crossX[1][1]);
    printf("P-moves=%lld S-moves=%lld top-half-live-final=%lld race-front=%d\n",
        (long long)mvP,(long long)mvS,(long long)top_live,rcursor);
    printf("WAVES TK_by_omega(w):"); for(int w=1;w<=6;w++) printf(" w%d:%lld(f%lld)",w,(long long)TK_by_omega[w],(long long)fire_cnt[w]); printf("\n");
    printf("WAVES safe_by_omega(z):"); for(int w=1;w<=8;w++) printf(" w%d:%lld",w,(long long)safe_by_omega[w]); printf("\n");
    printf("n=%d S=%s P=%s L=%lld L/n=%.5f kills=%lld sum=%lld (expect %d)\n",
        n,sp,pp,(long long)moves,(double)moves/n,(long long)kills,
        (long long)(moves+kills),n-1);
    return 0;
}
