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
static void deg_dec(int d){ bq_unlink(d); deg[d]--; bq_link(d); }

/* free stack: live elements with deg==0 && ldc==0 (kill nothing when played) */
static int32_t *fstack; static int ftop;
static void maybe_free(int x){ if(live[x]&&deg[x]==0&&ldc[x]==0) fstack[ftop++]=x; }

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
    gen_divisors(y);
    for(int i=0;i<divcnt;i++){ int d=divbuf[i]; if(d>=2&&d<y) { deg_dec(d); maybe_free(d);} }
    for(long long m=2ll*y;m<=n;m+=y){ ldc[m]--; maybe_free((int)m); }
}

static void play(int x){
    moves++;
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
    ftop=0;
    moves=0;kills=0;
    int turn=0;
    FILE*prof=fopen("arena_profile.csv","w");
    fprintf(prof,"move,player,x,killed_now\n");
    while(moves+kills < n-1){
        int x;
        int64_t k0=kills;
        if(turn==0) x = strcmp(pp,"burner")==0? p_burner(): (strcmp(pp,"boxer")==0? p_boxer():p_dustman());
        else        x = strcmp(sp,"maxdeg")==0? s_maxdeg():s_smallest();
        if(x<0) break;
        play(x);
        if(moves<=256||((long long)moves&63)==0)
            fprintf(prof,"%lld,%c,%d,%lld\n",(long long)moves,turn?'S':'P',x,(long long)(kills-k0));
        turn^=1;
    }
    fclose(prof);
    printf("n=%d S=%s P=%s L=%lld L/n=%.5f kills=%lld sum=%lld (expect %d)\n",
        n,sp,pp,(long long)moves,(double)moves/n,(long long)kills,
        (long long)(moves+kills),n-1);
    return 0;
}
