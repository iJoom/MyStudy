import Foundation

//var numbers = [4,3,2,6,1]
//
//numbers = numbers.map { (value) -> Int in
//    var newVal = value + 1
//    print(newVal)
//    return newVal
//}


let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let oddOrEvenArr = digitNames.map { (key, value) -> String in
    var str = ""
    if key % 2 == 0 {
      str = "짝수"
    } else {
      str = "홀수"
    }
 
    return str
}

// oddOrEvenArr = ["짝수", "홀수", ...] (순서가 보장되지는 않습니다.)

let oddOrEvenDict = digitNames.map { (key, value) -> [Int: String] in
    var str = ""
    if key % 2 == 0 {
      str = "짝수"
    } else {
      str = "홀수"
    }
       print(str)
    return [key: str]
}
// oddOrEvenDict = [0:"짝수", 1:"홀수", ...] (순서가 보장되지는 않습니다.)
print(oddOrEvenDict)


class HTML {
    var nameCount: Int? = 4
    
    func printNameCount() -> Void {
        print(self.nameCount)
    }
}
var x: HTML? = HTML()

let testClosure: ()->Void = {
    print(x?.nameCount)
    x?.printNameCount()
    x?.nameCount = 200
}
let ttClosure = { [weak x] in
    x?.nameCount = 500
}
testClosure()
print(x!.nameCount)
