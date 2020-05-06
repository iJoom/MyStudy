//
//  소마연습.cpp
//  StudyAlgorithm
//
//  Created by IJ . on 2020/04/01.
//  Copyright © 2020 jun. All rights reserved.
//

#include <iostream>
#include <vector>

using namespace std;
int main(){
//    vector<int> a[10];
//    a[0].push_back(0);
//    a[0].push_back(1);
//    a[1].push_back(3);
//    cout<<a[0][0]<<endl;
//    cout<<a[0][1]<<endl;
//    cout<<a[1][0]<<endl;
    
    vector<long long> k;
    k.push_back(1);
    long long i=1;
    k[1] = k[1-1] + k[1-2];
    cout<<k[-1]<<endl;
    return 0;
}
