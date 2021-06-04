# MyStudy

***

# TIL

***


  

```swift
var num1:Int? = 30
var num2:Int = 300
//옵셔널 인트형과 그냥 인트형 변수 선언
num1 = nil // OK
num2 = nil // 컴파일 에러 , 옵셔널이 아니므로
//올바른 옵셔널 바인딩? if let or guard let
if let bindingNumber = num1 {
  let sum = bindingNumber + num2
}
```

* 디자인 패턴(http://blog.naver.com/jdub7138/220968244920)
* singleton 패턴:  객체를 하나만 생성하여, 생성된 객체를 어디서든 참조할 수 있도록 하는 패턴

```swift
class RecommendationService {
    static let shared = RecommendationService()
  	private init() {} 

  //통신 코드
  //로그인 정보, 환경 설정 값 등 저장
}
```



* delegate 패턴 설명 https://shark-sea.kr/entry/swift-delegate , https://velog.io/@delmasong/Delegate-pattern-in-iOS-x1k6f9jzx8

  * 델리게이트 패턴은 쉽게 말해서, 객체 지향 프로그래밍에서 하나의 객체가 모든 일을 처리하는 것이 아니라 처리 해야 할 일 중 일부를 다른 객체에 넘기는 것을 뜻 합니다.

    출처: https://zeddios.tistory.com/8 [ZeddiOS]

* https://eunjin3786.tistory.com/31

[1] MVC (Model - View - Controller)

Model( 로직 및 데이터 담당) --(Update ,Notify)--- Controller(Model과 View다리 역할) ---(Delegate , Update)--- View(화면presentation 담당)

애플의 MVC 패턴에서는 View와 Controller가 너무 친함 , Controller가 View life cycle에 관여하기 때문에 완전한 View 와 Controller의 분리가 힘듬

[2] MVVM(Model - View - ViewModel)

ViewModel - Model과 View 다리 역할 (VM은 Model과 interact, Binding으로 인해 VM이 바뀌면 View도 바뀜 보통 ViewModel과View를 Binding할때 RX이용)

Model - Business Logic , Data

View - 화면 담당 안에 Controller --(<-Delegate, ->Update) -- View

***

* 애플의 프레임워크와 라이브러리는 객체지향, Swift는 객체지향을 포함한 함수형 언어 (대표적 예시: 클로저)
  * ***함수형프로그래밍?*** 함수를 메서드의 전달인자로 보내는 일 = 함수형 프로그래밍 패러다임에서 당연한 일
  * 클로저의 실제 프로젝트에서의 예시, 컴플리션 핸들러 및 통신할 때
  * 클로저 표현의 통상적 형식 

```swift
{ (매개변수들) -> 반환 타입 in
    Code
}
```

* 가독이 더 좋은 후행 클로저

```swift
let reversed: [String] = names.sorted {
  return $0 > $1
}
```

* 암시적 반환 표현 ( return 마저 생략 !!)

```swift
let reversed: [String] = names.sorted { $0 > $1 }
```

***

* intrinsic contents size는?

  * https://academy.realm.io/kr/posts/ios-autolayout/

* auto closure는?

  * https://mrgamza.tistory.com/579
  * escaping closure?

  * https://hcn1519.github.io/articles/2017-09/swift_escaping_closure

* Swift iOS APP Store Animation

  * 구성 CollectionView - CollectionViewCell ( ShadowView 안에 CommonView)

  * CommomView는 후에 DetailView와 공통적으료 사용되어짐

  * ShadowView는 셀의 겉부분에 그림자를 주기 위함, 그냥 Cell을 커스텀한 XIB를 이용할시 Shadow가 적용되어지지 않음을 해결하기 위함

  * 덤핑애니메이션을 이용해 DetailView로 전환, 이때 NavigationController를 Custom해서 Animation을 만들어줌, ***NavigationController의 UIPresentationController가 없으면 애니메이션 전환이 불가능***합니다. 이를 통해 사용자 정의 전환 애니메이션을 얻기 위함

  * Animatable이라는 프로토콜을 만들어, sizeAnimator , positionAnimator를 구현하고 이를 이용해 커스텀 애니메이션을 만들어냅니다.

    ```swift
     // Put the completion handler on the longest lasting animator
            if (self.positioningDuration > self.resizingDuration) {
                positionAnimator.addCompletion(completionHandler)
            } else {
                sizeAnimator.addCompletion(completionHandler)
            }
    ```

    * 가장 늦게 끝나는 곳에 핸들러를 대입합니다.
    * 컬렉션뷰의 카드셀을 터치시, 디테일뷰가 셀처럼 보여지면서 화면의 전체크기로 리사이징 되면서 애니메이션이 적용되어집니다.

***

***실제 면접***

* static과 싱글턴 패턴의 차이?
  * 둘다 오버라이딩이 가능한가? (static은 되지 않는다, 싱글턴 패턴은 오버라이딩 되지 않게 하는것)
* 100개의 각기 다른 이미지뷰(스크롤되는)를 통신해서 받아올때, 다 업데이트 되지 않게 과정을 줄여보아라
  * NSCache key값을 이용해 key값이 다른 이미지뷰만 업데이트
* What's git - Cherry-pick and rebase,revert



***

- https://github.com/raywenderlich/swift-style-guide Swift style 공부
- https://zetal.tistory.com/entry/swift-기초문법-15-맵Map-필터Filter-리듀스Reduce /Map Filter 공부




***



