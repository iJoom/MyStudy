//
//  main.cpp
//  StudyAlgorithm
//
//  Created by IJ . on 2020/03/11.
//  Copyright © 2020 jun. All rights reserved.
//

#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
int main() {
    // insert code here...
    vector<int> a;
    
    a.push_back(1);
    a.push_back(2);
    
    sort(a.begin(), a.end(),greater<int>());
    
    cout << "Hello, World!\n"<<a[0]<<"      "<<a[1];
    printf("\n a[0]값 = %d\n",a[0]);
    return 0;
}
