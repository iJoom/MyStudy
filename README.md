# MyStudy
study iOS

# Animation

 animate함수에서 alpha 값을 0으로 설정해서 이미지가 점점 흐려지게 연출.<br />
 transform.translatedBy를 이용해 원하는 방향으로 이미지가 이동하게 연출. 

```swift
func animate2() {
    UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
        self.airPlane.alpha = 0
        self.airPlane.transform =
            self.airPlane.transform.translatedBy(x: 100, y: -200)
    }  )
    //오른쪽 대각선으로 이동하며 사라지는 애니메이션
    
}
```

***
### ExpandableCell
* [1차 발표자료- ExpandableCell](https://github.com/iOS-SOPT-iNNovation/iJoom/blob/master/1차%20발표내용%20(ExpandableCell).md)



***


### drag and drop
* [2차 발표자로 - drag and drop](https://github.com/iOS-SOPT-iNNovation/iJoom/blob/master/2차%20스터디%20내용.md)





***


# 공부
https://www.hackingwithswift.com/example-code/uikit/how-to-add-drag-and-drop-to-your-app

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
- 문서작성
- https://github.com/raywenderlich/swift-style-guide Swift style 공부
- 3.1 UnixSystem 공부
- https://zetal.tistory.com/entry/swift-기초문법-15-맵Map-필터Filter-리듀스Reduce /Map Filter 공부
***

- Cache 처리

  ```swift
  private let cache = NSCache<NSString, NSData>()
  .....
  func downloadImage(url: String, handler: @escaping(Data?, Error?) -> Void){
              let cacheID = NSString(string: url)
  
              if let cachedData = cache.object(forKey: cacheID) {
                  handler((cachedData as Data), nil)
              }else{
                  if let url = URL(string: url) {
                      let session = URLSession(configuration: urlSessionConfig)
                      var request = URLRequest(url: url)
                      request.cachePolicy = .returnCacheDataElseLoad
                      request.httpMethod = "get"
                      session.dataTask(with: request) { (data, response, error) in
                          if let _data = data {
                              self.cache.setObject(_data as NSData, forKey: cacheID)
                              handler(_data, nil)
                          }else{
                              handler(nil, error)
                          }
                          }.resume()
                  } else {
                      // NetworkError is a custom error
                      handler(nil, NetworkError.invalidURL)
                  }
              }
          }
      }
  ```

  
