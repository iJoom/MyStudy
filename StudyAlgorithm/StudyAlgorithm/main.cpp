#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
int main() {
    char input[100];
    
    int N; // 2~100000
    int K; // 2~N
    cin>>N>>K;
//    printf("%d %d\n",N,K);
    fflush(stdin);
    char ary[N*2];
    char p;
    string ak;
        cin.getline(ary,N*2);
//        cout<<ary<<endl;
    string str(ary);//char배열 -> string으로
//   str.erase(remove(str.begin(), str.end(), isspace), str.end());
   str.erase(remove(str.begin(), str.end(), ' '), str.end());
    char ch[N];
    strcpy(ch, str.c_str());
//    cout<<ch<<endl;
//    cout<<"공백제거문자열:"<<str<<endl;
    int smallest=ch[0];
    int cnt = 0;
    for(int i=1;i<N;i++){
        if(ch[i]<smallest){
            smallest=ch[i];
        }
    }
    while (N>1) {
        N -= (K -1);
        cnt++;
    }
    cout<<cnt;
    return 0;
}
