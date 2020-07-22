# MyStudy

***

# TIL

***

- [x] 2.2 예제 공부
- [x] 2.4 예제 직접 실습 및 코드 분석
- [x] 2.5 Moya 통신 공부 계획
- [x] 2.6 https://hcn1519.github.io/articles/2017-09/swift_escaping_closure escaping 클로저 공부
- [ ] 2.8 부코5 및 개발블로그 구상, 
- [ ] Swift Map 공부
- [x] 2.9 Closure 복습 및 부코5 Movie detail 통신 , View 구성
- [ ] 2.10 부코5 진행 , 서버에서 오는 Data에 따른 유동적인 Label Size 구현
- [x] https://ontheswift.tistory.com/24 Cache 공부
- [x] https://ontheswift.tistory.com/23?category=304724 CollectionView life cycle 및 PreFetching 공부
- [ ] 면접 준비 및 Swift 5책 및 다시 기초 대비
  * 옵셔널, 클로저, Swift 아키텍쳐, iOS 디자인 패턴

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

* https://eunjin3786.tistory.com/31

[1] MVC (Model - View - Controller)

Model( 로직 및 데이터 담당) --(Update ,Notify)--- Controller(Model과 View다리 역할) ---(Delegate , Update)--- View(화면presentation 담당)

애플의 MVC 패턴에서는 View와 Controller가 너무 친함 , Controller가 View life cycle에 관여하기 때문에 완전한 View 와 Controller의 분리가 힘듬

[2] MVVM(Model - View - ViewModel)

ViewModel - Model과 View 다리 역할 (VM은 Model과 interact, Binding으로 인해 VM이 바뀌면 View도 바뀜 보통 ViewModel과View를 Binding할때 RX이용)

Model - Business Logic , Data

View - 화면 담당 안에 Controller --(<-Delegate, ->Update) -- View





- https://github.com/raywenderlich/swift-style-guide Swift style 공부
- https://zetal.tistory.com/entry/swift-기초문법-15-맵Map-필터Filter-리듀스Reduce /Map Filter 공부
- 4.7 뷰컨 데이터별 분기처리 공부
- 5.6 Onboarding 공부



***



