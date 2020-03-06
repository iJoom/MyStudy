import UIKit


func solution(_ heights:[Int]) -> [Int]{
    
    var intAry = [Int](repeating: 0, count: heights.count)
    var reverseIndex: Int = heights.count-1
    var n:Int
    
    for reverseIndex in stride(from: reverseIndex, through: 0, by: -1) {
        print(reverseIndex)
        n = reverseIndex - 1
        for n  in stride(from: n, through: 0, by: -1){
//            print("n값:   \(n)")
            if heights[n] > heights[reverseIndex] {
                intAry[reverseIndex] = n + 1
                // 난 index값을 넣었지만, 문제에서는 수신탑이 12345 순임
                break
            }
            if n == 0{
                intAry[reverseIndex] = 0
            }
        }
    }
    
    
    return intAry
}


var test: [Int] = [6,9,5,7,4]

solution(test)

