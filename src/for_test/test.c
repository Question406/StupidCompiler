/*
Test Package: Optim
Author: Rongyu You, 14
//#input humble.in
//#output humble.ans
ExitCode: 0
InstLimit: -1
*/

// USACO 3.1.3 humble
int MAXK = 105;
int MAXN = 100005;

int main(){
    int point = 0;
    int k;
    int MIN;
    int K;
    int N;
    int i;
    int[] primes = new int[MAXK];
    int[] pindex = new int[MAXK];
    int[] ans = new int[MAXN];
    K = getInt();
    N = getInt();
    for (i = 0; i < K; ++i) {
        primes[i] = getInt();
    }
    ans[0] = 1;
    while(point <= N){
        MIN = 2139062143;
        for (i = 0 ; i < K; ++i){
            while(ans[point] >= primes[i] * ans[pindex[i]]) pindex[i]++;
            if (primes[i] * ans[pindex[i]] < MIN){
                MIN = primes[i] * ans[pindex[i]];
                k = i;
            }
        }
        ans[++point] = MIN;
    }
    print(toString(ans[N]));
    return 0;
}