/* Exact minimax solver for the divisibility-antichain game (Erdos 872).
 *
 * Game: players alternately pick unused integers from {2..n}, keeping the
 * picked set an antichain under divisibility; game ends when maximal.
 * Prolonger (moves first) maximizes total move count; Shortener minimizes.
 *
 * Independent implementation (Fable-5, 2026-07-22) — deliberately written
 * from scratch as a cross-check of phase1/exact_minimax_v2.py.
 *
 * State: live-move bitmask over values 2..n (bit i <-> value i+2), n <= 65.
 * Playing i removes conflict[i] (all comparables incl. self) from live.
 * Value(live, turn) = remaining moves under optimal play. Alpha-beta + TT.
 *
 * Usage: ./solver <nmin> <nmax> [tt_log2=24]
 * Prints CSV: n,L,first_move,nodes,seconds
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

typedef uint64_t u64;
typedef int8_t i8;

static int N;                 /* board max value */
static int SZ;                /* number of values = N-1 */
static u64 conflict[66];      /* comparability masks incl. self */
static int ordP[66], ordS[66];/* static move orders per player */
static long long nodes;

/* transposition table */
typedef struct { u64 key; i8 val; i8 flag; } TTE; /* flag: 0 exact, 1 lower, 2 upper */
static TTE *tt;
static u64 ttmask;
#define FLAG_EXACT 0
#define FLAG_LOWER 1
#define FLAG_UPPER 2

static u64 mix(u64 x){ x^=x>>33; x*=0xff51afd7ed558ccdULL; x^=x>>33; x*=0xc4ceb9fe1a85ec53ULL; x^=x>>33; return x; }

static void build(int n){
    N=n; SZ=n-1;
    for(int i=0;i<SZ;i++){
        int v=i+2; u64 m=1ULL<<i;
        for(int j=0;j<SZ;j++){
            int w=j+2;
            if(i!=j && (v%w==0 || w%v==0)) m|=1ULL<<j;
        }
        conflict[i]=m;
    }
    /* Shortener order: descending static degree (max-degree heuristic). */
    int idx[66];
    for(int i=0;i<SZ;i++) idx[i]=i;
    for(int a=0;a<SZ;a++)for(int b=a+1;b<SZ;b++){
        int da=__builtin_popcountll(conflict[idx[a]]), db=__builtin_popcountll(conflict[idx[b]]);
        if(db>da){int t=idx[a];idx[a]=idx[b];idx[b]=t;}
    }
    memcpy(ordS,idx,sizeof idx);
    /* Prolonger order: descending "burn value" = sum over comparable lower-half
     * elements of their degree (prefers primorial-like shield burners),
     * tie-break ascending own degree. */
    long long burn[66];
    for(int i=0;i<SZ;i++){
        long long b=0;
        for(int j=0;j<SZ;j++) if(j!=i && (conflict[i]>>j &1) && (j+2)<=N/2)
            b += __builtin_popcountll(conflict[j]);
        burn[i]=b*100 - __builtin_popcountll(conflict[i]);
    }
    for(int i=0;i<SZ;i++) idx[i]=i;
    for(int a=0;a<SZ;a++)for(int b=a+1;b<SZ;b++)
        if(burn[idx[b]]>burn[idx[a]]){int t=idx[a];idx[a]=idx[b];idx[b]=t;}
    memcpy(ordP,idx,sizeof idx);
}

/* if every live element conflicts only with itself, value = popcount */
static inline int all_free(u64 live){
    u64 m=live;
    while(m){
        int i=__builtin_ctzll(m); m&=m-1;
        if(conflict[i]&live&~(1ULL<<i)) return 0;
    }
    return 1;
}

static int solve(u64 live, int turn, int alpha, int beta){
    if(!live) return 0;
    nodes++;
    int pc=__builtin_popcountll(live);
    if(pc==1) return 1;
    if(alpha>=pc) return pc;      /* value <= popcount: fail-low fast */
    if(all_free(live)) return pc;

    u64 key = mix(live ^ (turn? 0x9e3779b97f4a7c15ULL:0));
    TTE *e = &tt[key & ttmask];
    if(e->key==key){
        if(e->flag==FLAG_EXACT) return e->val;
        if(e->flag==FLAG_LOWER && e->val>=beta) return e->val;
        if(e->flag==FLAG_UPPER && e->val<=alpha) return e->val;
        if(e->flag==FLAG_LOWER && e->val>alpha) alpha=e->val;
        if(e->flag==FLAG_UPPER && e->val<beta)  beta=e->val;
        if(alpha>=beta) return e->val;
    }

    const int *ord = turn? ordS: ordP;
    int best = turn? 127 : -1;
    int a=alpha, b=beta;
    for(int k=0;k<SZ;k++){
        int i=ord[k];
        if(!(live>>i &1)) continue;
        int v = 1 + solve(live & ~conflict[i], !turn, a-1, b-1);
        if(!turn){ if(v>best){best=v; if(v>a)a=v;} if(best>=b) break; }
        else     { if(v<best){best=v; if(v<b)b=v;} if(best<=a) break; }
    }
    int flag = FLAG_EXACT;
    if(!turn){ if(best>=beta) flag=FLAG_LOWER; else if(best<=alpha) flag=FLAG_UPPER; }
    else     { if(best<=alpha) flag=FLAG_UPPER; else if(best>=beta) flag=FLAG_LOWER; }
    e->key=key; e->val=(i8)best; e->flag=(i8)flag;
    return best;
}

/* exact value of a position via full-window solve (TT-accelerated) */
static int exact(u64 live,int turn){
    if(!live) return 0;
    return solve(live,turn,-1,126);
}

/* print principal variation with all optimal moves at each step */
static void print_pv(int n){
    build(n);
    u64 live=(SZ==64)? ~0ULL : ((1ULL<<SZ)-1);
    int turn=0, step=1;
    int total=exact(live,0);
    printf("PV n=%d L=%d\n",n,total);
    while(live){
        int want=exact(live,turn);
        /* collect optimal moves */
        printf("%2d %c:",step,turn?'S':'P');
        int chosen=-1;
        for(int i=0;i<SZ;i++){
            if(!(live>>i &1)) continue;
            int v=1+exact(live&~conflict[i],!turn);
            if(v==want){
                int deg=__builtin_popcountll(conflict[i]&live)-1;
                printf(" %d(d%d)",i+2,deg);
                if(chosen<0)chosen=i;
            }
        }
        printf("\n");
        live &= ~conflict[chosen];
        turn=!turn; step++;
    }
}

int main(int argc,char**argv){
    if(argc>1 && strcmp(argv[1],"pv")==0){
        int n=atoi(argv[2]);
        int lg = argc>3? atoi(argv[3]) : 24;
        ttmask=(1ULL<<lg)-1;
        tt=calloc(1ULL<<lg,sizeof(TTE));
        if(!tt){fprintf(stderr,"tt alloc failed\n");return 1;}
        print_pv(n);
        return 0;
    }
    int nmin=atoi(argv[1]), nmax=atoi(argv[2]);
    int lg = argc>3? atoi(argv[3]) : 24;
    ttmask=(1ULL<<lg)-1;
    tt=calloc(1ULL<<lg,sizeof(TTE));
    if(!tt){fprintf(stderr,"tt alloc failed\n");return 1;}
    printf("n,L,first_move,nodes,seconds\n"); fflush(stdout);
    for(int n=nmin;n<=nmax;n++){
        if(n>65){fprintf(stderr,"n>65 unsupported\n");break;}
        build(n);
        memset(tt,0,(ttmask+1)*sizeof(TTE));
        nodes=0;
        clock_t t0=clock();
        u64 full=(SZ==64)? ~0ULL : ((1ULL<<SZ)-1);
        /* root: Prolonger to move; recover best first move */
        int bestv=-1, bestm=-1;
        for(int k=0;k<SZ;k++){
            int i=ordP[k];
            int v=1+solve(full&~conflict[i],1,bestv-1,126);
            if(v>bestv){bestv=v;bestm=i+2;}
        }
        double dt=(double)(clock()-t0)/CLOCKS_PER_SEC;
        printf("%d,%d,%d,%lld,%.2f\n",n,bestv,bestm,nodes,dt); fflush(stdout);
    }
    return 0;
}
