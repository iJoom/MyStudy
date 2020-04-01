//
//  Problems.cpp
//  StudyAlgorithm
//
//  Created by IJ . on 2020/03/13.
//  Copyright © 2020 jun. All rights reserved.
//

//#include <queue>
//#include <vector>
//#include <iostream>
//#include <algorithm>
//using namespace std;
//
//vector<int> solution(vector<int> progresses, vector<int> speeds) {
//    vector<int> answer;
//    queue <int> q;
//
//    int bound, rest, day, i, cnt = 0;
//
//    for (i = 0; i < progresses.size(); i++) {
//        rest = 100 - progresses[i];
//        if (rest % speeds[i] == 0) day = rest / speeds[i];
//        else day = rest / speeds[i] + 1;
//        q.push(day);
//    }
//
//    bound = q.front();
//
//    while (!q.empty()) {
//        if (q.front() <= bound) {
//            cnt++;
//            q.pop();
//        }
//        else {
//            bound = q.front();
//            answer.push_back(cnt);
//            cnt = 0;
//        }
//    }
//    answer.push_back(cnt);
//    return answer;
//}
//
//
//int main(void)
//{
//    vector<int> myV{ 93,30,55 };
//    vector<int> speed{ 1,30,5 };
//    vector<int> answer;
//
//    answer = solution(myV, speed);
//
//
//    for (int i = 0; i < answer.size(); i++) {
//        cout << answer[i]<<endl;
//
//
//    }
//    //myV.push_back(333);
//
//    int *p;
//    p = find(myV.begin(), myV.end(), 30);
//    cout <<"프론트" << *p << endl;
//
//    return 0;
//
//}
//
//
////[93,30,55]    [1,30,5]
 
#include <algorithm>  // std::find
#include <iostream>   // std::cout
#include <vector>     // std::vector
#include <string>
using namespace std;
//int main() {
//    // using std::find with array and pointer:
//    int myints[] = { 10, 20, 30, 40 };
//    int* p;
//    vector<int> student(5, 1);
//    cout << student[0];
//
//
//    p = std::find(myints, myints + 4, 30);
//    if (p != myints + 4)
//        std::cout << "Element found in myints: " << *p << '\n';
//    else
//        std::cout << "Element not found in myints\n";
//
//    // using std::find with vector and iterator:
//    std::vector<int> myvector(myints, myints + 4);
//    std::vector<int>::iterator it;
//
//    it = find(myvector.begin(), myvector.end(), 30);
//    if (it != myvector.end())
//        std::cout << "Element found in myvector: " << *it << '\n';
//    else
//        std::cout << "Element not found in myvector\n";
//
//    return 0;
//}
 
////모의고사 문제
//void main() {
//
//    vector<int> answers{ 1,3,2,4,2,1 };
//        vector<int> answer(3, 0);
//        vector<int> result(3);
//        vector<int> p1{ 1,2,3,4,5 };
//        vector<int> p2{ 2,1,2,3,2,4,2,5 };
//        vector<int> p3{ 3,3,1,1,2,2,4,4,5,5 };
//
//        for (int i = 0; i < answers.size(); i++) {
//
//            if (answers[i] == p1[i % 5])answer[0] += 1;
//            if (answers[i] == p2[i % 8])answer[1] += 1;
//            if (answers[i] == p3[i % 10])answer[2] += 1;
//
//        }
//
//        sort(answer.begin(), answer.end());
//        // sort(answer.begin(), answer.end(), greater<int>()); //내림차순
//        cout << answer[0] << "   " << answer[1] << "      " << answer[2]<<endl;
//
//        int minimum = answer[0];
//        int maximum = answer[0];
//
//        for (int i = 1; i < answer.size(); i++) {
//            minimum = min(minimum, answer[i]);
//            maximum = max(maximum, answer[i]);
//
//        }
//        cout << "max:" << maximum << "minimum: " << minimum << endl;
//
//
//
//        for (int i = 0; i < answer.size(); i++) {
//            if (answer[i] == maximum) {
//
//                result.push_back(i + 1);
//            }
//        }
//
//        sort(result.begin(), result.end());
//
//        cout << *max_element(answer.begin(), answer.end());
//        //*주의 max_element는 값을 리턴하지 않고 주소값 리턴이므로 *붙여주는게 필수!!
//
//}
 
////백준 로또 알고리즘
//int p;
//void main() {
//
//
//        // 1부터 6까지 담을 벡터
//        vector<int> n{ 1,2,3,4,5,6,7 };
//
//        // 0과1을 저장 할 벡터 생성
//        vector<int> ind;
//
//        // k=4, 4개를 뽑으니까
//        int k = 6;
//
//        // k개의 1 추가
//        for (int i = 0; i < k; i++) {
//            ind.push_back(1);
//        }
//
//        // 2개(6개-2개)의 0 추가
//        for (int i = 0; i < n.size() - k; i++) {
//            ind.push_back(0);
//        }
//
//        // 정렬
//        sort(ind.begin(), ind.end());
//
//        //순열
//        do {
//            // 출력
//            for (int i = 0; i < ind.size(); i++) {
//                if (ind[i] == 1) {
//                    printf("%d ", n[i]);
//                }
//            }
//
//            printf("\n");
//
//        } while (next_permutation(ind.begin(), ind.end()));
//
//
//        printf("전역p값: %d\n", p);
//
//
//
//}
 
using namespace std;
 
string solution(vector<string> participant, vector<string> completion) {
    string answer = "";
    int particiCheck = 0;
    int chk = 0;
    
    sort(participant.begin(), participant.end());
    sort(completion.begin(), completion.end());
 
    for (int i = 0; i < participant.size()-1; i++) {
        cout << "participant: "<< participant[i] << endl;
        cout << "compeltion: "<<completion[i] << endl;
        if (participant[i] != completion[i]) {
            return participant[i];
        }
    }
    return participant[participant.size() - 1];
    //index 에러때매 for문에서 끝에를 빼버림
}
 
int main() {
    vector<string> part{ "mislav", "stanko", "mislav", "ana" };
    vector<string> comple{ "stanko", "ana", "mislav" };
    vector<int> input;
    char ab[100];
    string a;
     a=solution(part, comple);
    cout<<a<<endl;
//    a = "asdfbzxc";
//    string b;
//    b = part[0].substr(1, 1);
//    cout << b << endl;
//
//    cin >> ab;
//    cin >> ab;
//    cout << "11"<<ab[0] << endl;
//    cout << "22"<<ab[1] << endl;
//    cout << "33"<<ab[2] << endl;
 
    
 
    return 0;
}
