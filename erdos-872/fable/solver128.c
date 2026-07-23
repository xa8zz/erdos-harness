/* Exact minimax solver for the divisibility-antichain game (Erdos 872),
 * 128-bit board: values 2..n for n <= 129.
 *
 * Direct widening of solver.c (validated to n=58 vs reference.py and to
 * n=65 vs the u64 build). Same alpha-beta + TT structure; TT stores the
 * full 128-bit live mask + turn (no key hashing collisions possible).
 *
 * Usage: ./solver128 <nmin> <nmax> [tt_log2=27]
 *        ./solver128 pv <n> [tt_log2=27]
 * Prints CSV: n,L,first_move,nodes,seconds
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

typedef uint64_t u64;
typedef __uint128_t u128;
typedef int8_t i8;

static int N, SZ;
static u128 conflict[130];
static int ordP[130], ordS[130];
static long long nodes;

typedef struct { u64 lo, hi; i8 val, flag, turn; } TTE; /* 24 bytes */
static TTE *tt;
static u64 ttmask;
#define FLAG_EXACT 0
#define FLAG_LOWER 1
#define FLAG_UPPER 2

static inline int pc128(u128 x){
    return __builtin_popcountll((u64)x) + __builtin_popcountll((u64)(x>>64));
}
static u64 mix(u64 x){ x^=x>>33; x*=0xff51afd7ed558ccdULL; x^=x>>33; x*=0xc4ceb9fe1a85ec53ULL; x^=x>>33; return x; }

static void build(int n){
    N=n; SZ=n-1;
    for(int i=0;i<SZ;i++){
        int v=i+2; u128 m=(u128)1<<i;
        for(int j=0;j<SZ;j++){
            int w=j+2;
            if(i!=j && (v%w==0 || w%v==0)) m|=(u128)1<<j;
        }
        conflict[i]=m;
    }
    int idx[130];
    for(int i=0;i<SZ;i++) idx[i]=i;
    for(int a=0;a<SZ;a++)for(int b=a+1;b<SZ;b++){
        int da=pc128(conflict[idx[a]]), db=pc128(conflict[idx[b]]);
        if(db>da){int t=idx[a];idx[a]=idx[b];idx[b]=t;}
    }
    memcpy(ordS,idx,sizeof idx);
    long long burn[130];
    for(int i=0;i<SZ;i++){
        long long b=0;
        for(int j=0;j<SZ;j++) if(j!=i && ((conflict[i]>>j)&1) && (j+2)<=N/2)
            b += pc128(conflict[j]);
        burn[i]=b*100 - pc128(conflict[i]);
    }
    for(int i=0;i<SZ;i++) idx[i]=i;
    for(int a=0;a<SZ;a++)for(int b=a+1;b<SZ;b++)
        if(burn[idx[b]]>burn[idx[a]]){int t=idx[a];idx[a]=idx[b];idx[b]=t;}
    memcpy(ordP,idx,sizeof idx);
}

static inline int all_free(u128 live){
    u128 m=live;
    while(m){
        u64 w=(u64)m; int base=0;
        if(!w){ w=(u64)(m>>64); base=64; }
        int i=base+__builtin_ctzll(w);
        m&=m-1;
        if(conflict[i]&live&~((u128)1<<i)) return 0;
    }
    return 1;
}

static int solve(u128 live, int turn, int alpha, int beta){
    if(!live) return 0;
    nodes++;
    int pc=pc128(live);
    if(pc==1) return 1;
    if(alpha>=pc) return pc;
    if(all_free(live)) return pc;

    u64 lo=(u64)live, hi=(u64)(live>>64);
    u64 key = mix(lo ^ mix(hi ^ (turn? 0x9e3779b97f4a7c15ULL:0)));
    TTE *e = &tt[key & ttmask];
    if(e->lo==lo && e->hi==hi && e->turn==(i8)turn){
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
        if(!((live>>i)&1)) continue;
        int v = 1 + solve(live & ~conflict[i], !turn, a-1, b-1);
        if(!turn){ if(v>best){best=v; if(v>a)a=v;} if(best>=b) break; }
        else     { if(v<best){best=v; if(v<b)b=v;} if(best<=a) break; }
    }
    int flag = FLAG_EXACT;
    if(!turn){ if(best>=beta) flag=FLAG_LOWER; else if(best<=alpha) flag=FLAG_UPPER; }
    else     { if(best<=alpha) flag=FLAG_UPPER; else if(best>=beta) flag=FLAG_LOWER; }
    e->lo=lo; e->hi=hi; e->turn=(i8)turn; e->val=(i8)best; e->flag=(i8)flag;
    return best;
}

static int exact(u128 live,int turn){
    if(!live) return 0;
    return solve(live,turn,-1,126);
}

static void print_pv(int n){
    build(n);
    u128 live = (SZ==128)? ~(u128)0 : (((u128)1<<SZ)-1);
    int turn=0, step=1;
    int total=exact(live,0);
    printf("PV n=%d L=%d\n",n,total);
    while(live){
        int want=exact(live,turn);
        printf("%2d %c:",step,turn?'S':'P');
        int chosen=-1;
        for(int i=0;i<SZ;i++){
            if(!((live>>i)&1)) continue;
            int v=1+exact(live&~conflict[i],!turn);
            if(v==want){
                int deg=pc128(conflict[i]&live)-1;
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
        int lg = argc>3? atoi(argv[3]) : 27;
        ttmask=(1ULL<<lg)-1;
        tt=calloc(1ULL<<lg,sizeof(TTE));
        if(!tt){fprintf(stderr,"tt alloc failed\n");return 1;}
        print_pv(n);
        return 0;
    }
    int nmin=atoi(argv[1]), nmax=atoi(argv[2]);
    int lg = argc>3? atoi(argv[3]) : 27;
    ttmask=(1ULL<<lg)-1;
    tt=calloc(1ULL<<lg,sizeof(TTE));
    if(!tt){fprintf(stderr,"tt alloc failed\n");return 1;}
    printf("n,L,first_move,nodes,seconds\n"); fflush(stdout);
    for(int n=nmin;n<=nmax;n++){
        if(n>129){fprintf(stderr,"n>129 unsupported\n");break;}
        build(n);
        memset(tt,0,(ttmask+1)*sizeof(TTE));
        nodes=0;
        clock_t t0=clock();
        u128 full = (SZ==128)? ~(u128)0 : (((u128)1<<SZ)-1);
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
