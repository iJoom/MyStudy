import UIKit

var ary: [Int] = []

ary.append(0)
ary.append(2)
// ary[0] = 1 안됨 , 안에 item들이 없기에 정말 빈 배열!
print("\(ary[0]) \(ary[1])")

struct test {
    var value: Int
}

var ary2: [Int] = [1,2,3,4,5]
// element와 index를 가지고 있는 배열
var ary3 = [test(value: 0), test(value: 3), test(value: 5)]
//구조체를 가지는 가변배열
ary2[0] = 1204

print(ary2[0])

print(ary3[0])




