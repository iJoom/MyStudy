```swift

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {

    completionHandlers.append(completionHandler)

}


func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()    // 함수 안에서 끝나는 클로저
}

class SomeClass {

    var x = 10
    func doSomething() {

        someFunctionWithEscapingClosure { self.x = 100 } 
        // 명시적으로 self를 적어줘야 합니다.
        someFunctionWithNonescapingClosure { x = 200 }

    }

}

let instance = SomeClass()

instance.doSomething()

print(instance.x)
// Prints "200"

completionHandlers.first?()
// completionHandlers[0]()
print(instance.x)
// Prints "100"
```

