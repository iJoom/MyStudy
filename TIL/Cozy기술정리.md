***

## 2020 여름 독립서점 소개 플랫폼 'Cozy'   [프로젝트링크](https://github.com/OurCozy/cozy-iOS)

***

- 메인탭 추천 리스트 화면과 상세 화면을 구현했습니다.
  - 북마크 탭 통신과 로직에 도움을 주었습니다. 마이페이지 프로필 이미지 통신에 도움을 주었습니다.
- 1View 1Storyboard로, git충돌을 최소화 하기 위해 노력하였습니다.
- 메소드명과 변수명 등 축약을 금지하고 이해가기 쉽도록 네이밍 하게 했으며, 포스 언레핑 금지,  팀이 정한 코드 컨벤션을 지키기 위해 노력했습니다.
- 이슈관리 기능을 이용하여 버그와 해야할 일 들을 적극적으로 관리하였습니다.

***

### 메인 추천 View

<img src="https://user-images.githubusercontent.com/55793344/101466348-62252580-3984-11eb-92c5-30ac66f824c5.png" width="300"> 

### 디테일 View Animation 및 기능

<img src="https://user-images.githubusercontent.com/55793344/101466457-854fd500-3984-11eb-8786-c2899577b9ff.gif" width="300"><img width="300" alt="main3" src="https://user-images.githubusercontent.com/55793344/101466466-87b22f00-3984-11eb-94c4-209818c15591.gif">

***

### APP Store Aniamtion 구현

* 라이브러리를 사용하면, 코드와 동작방식 구조에 대한 이해 없이 사용할 것 같았습니다. 또한 불필요한 라이브러리 사용은 최소화 하고 싶었습니다.
*  UIViewControllerAnimatedTransitioning을 Custom 하는 방식을 찾아서 공부하며 이해하고 사용하기 위해 노력했습니다.

### 고민

- 맨 처음 구조부터 생각을 하고 테스트를 먼저해봄
  - CollectionView를 Vertical Scroll로 만들고 Cell 선택되었을때, 셀이 펼쳐지는 구조로 생각
  - 셀을 눌렀을때 애니메이션과, 스테이터스바 히든 등 아이폰 화면에 꽉차게 구현 완료
  - **그러나!** DetailView는 긴 스크롤이 필요해서, 이러한 구조로 구현시 불가능

***

*UIViewControllerAnimatedTransitioning*: 커스텀 뷰 컨트롤러 전환을위한 애니메이션을 구현하기위한 메소드 set

- 이것을 이용해 원하는 Custom Animation 으로 동작하게 만듭니다. 커스텀NavigationController Class 를 만듭니다.UINavigationControllerDelegate 를 준수하고 AppStore Animation을 따르는 CustomTransitionAnimation로 작동하게 설계합니다. Spring Animation 과 CGAffineTransform 를 이용해 AppStore Animation 효과를 만듭니다.

#### [전체 순서]

추천 탭에서 셀 선택시 : 

1. 셀이 스프링 애니메이션으로 화면 상단으로 이동합니다. 
   * 이때, 사실 Detail View를 추천 탭의 Cell처럼 보이게(모서리 둥글게) 만든 후에 애니메이션을 이용해 Detail View를 꽉찬 화면으로 보여줍니다.
   * 유저 입장에서는 셀이 올라가고 화면이 펼쳐져 보이는 것 처럼 느껴집니다.

2. 선형 애니메이션으로 화면을 채우도록 카드 크기를 조정합니다.
3. 닫기 버튼이 나타나고, 둥근 모서리가 정사각형이 됩니다. (ShadowView, MaskView 활용)

Detail View에서 닫기 버튼을 눌렀을 때 : 

1. 화면이 스프링 애니메이션으로 컬렉션뷰의 원래 셀 위치로 이동합니다.
2.  View가 선형 애니메이션을 사용하여 원래 크기로 크기가 조정됩니다. 
3. 닫기 버튼이 사라집니다. 사각형 모서리가 둥글게됩니다.

<img width="984" alt="설명" src="https://user-images.githubusercontent.com/55793344/101485658-cc4ac400-399e-11eb-9582-8b835c2b3dbe.png">

### 알게된 부분

 UIPresentationController: 뷰 사이를 전환 할 때 전환 수명이 지나도 표시되거나 표시되는 뷰를 조작하려는 경우 사용자 지정 UIPresentationController를 구현해야함.

UIViewPropertyAnimator을 이용해 Detail View를 애니메이션하고 사이즈를 조절합니다.

### Custom push animation 예시

```swift
let positionAnimator = UIViewPropertyAnimator(duration: self.positioningDuration, dampingRatio: 0.7)
        positionAnimator.addAnimations {
            fromView.transform = CGAffineTransform(translationX: 0, y: yDiff)
        }
```

* Detail View가 밑으로 펼쳐져야 하기 때문에 CGAffineTransform을 이용해서 Y값을 이동시킵니다.

```swift
let sizeAnimator = UIViewPropertyAnimator(duration: self.resizingDuration, curve: .easeInOut)
        sizeAnimator.addAnimations {
            fromView.frame.size = destinationFrame.size
            fromView.layoutIfNeeded()
            fromView.transform = fromView.transform.concatenating(CGAffineTransform(translationX: xDiff, y: 0))
        }
```

***

### [추천탭에서 사용자 닉네임과 추천멘트 부분을 다른 셀을 사용하여 다음과 같이 처리하였습니다.]

```swift
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if 0 == section {
            return logoSearchCheck
        } else {
            return RecommendationList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let guideCell = collectionView.dequeueReusableCell(withReuseIdentifier: "logoSearchCell", for: indexPath) as! LogoSearchCollectionViewCell
            guideCell.guideLabel1.text = "\(self.RecommendationList[0].nickname)님,"
            
            return guideCell
        } else {
            let cardCell = collectionView.dequeueReusableCell(for: indexPath, cellType: CardCollectionViewCell.self)
            
            DispatchQueue.global().async {
              
                DispatchQueue.main.async {
                    cardCell.commonView.mainRecommendImageView.setImage(from: self.RecommendationList[indexPath.row].profile)
                }
            }
            
        //데이터 처리부분
            
            return cardCell
        }
    }
```

***

### 네이버지도 라이브러리 사용

* Xcode에서 한글로 설명이 나와서 놀랍고 쉽고 강력한 기능에 감격함.
* 홈브루 및 lfs(대용량 파일 관리 라이브러리) 설치
* API사용 가능한 clientID 값 발급 받고 AppDelegate에 추가하거나, info.plist에 추가하는 방식 중 택1 (프로젝트 중간에 API를 추가해야해서 info.plist의 충돌을 막고자 AppDelegate에 code 추가)

```swift
NMFAuthManager.shared().clientId = "본인 clientId값"
```

***

* 스토리보드 or 코드로 네이버 NFMapView 만들어준다.
* 그리고 아래와 같이 위도 경도를 이용해 마커지정이 가능하다.
* ***그러나 실제로 테스트 해보면 마커가 표시되지 않는다.***

```swift
        let marker = NMFMarker()
        
        let bookstoreLatitude:Double = Double( self.detailBookStoreModel[0].latitude)
        let bookstoreLongitude:Double = Double(self.detailBookStoreModel[0].longitude)
        
        marker.position = NMGLatLng(lat: bookstoreLatitude, lng: bookstoreLongitude)
```

* 다음과 같이 지도의 확대 레벨 및 카메라를 이동 시켜주면 원하는 곳의 위도 경도값의 마커를 지도뷰로 표현 가능

```swift
  let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: bookstoreLatitude, lng: bookstoreLongitude))
        
        cameraUpdate.reason = 3
        cameraUpdate.animation = .fly
        cameraUpdate.animationDuration = 2
        
        detailNaverMapView.mapType = .basic
        detailNaverMapView.minZoomLevel = 5.0
        detailNaverMapView.maxZoomLevel = 18.0
        detailNaverMapView.zoomLevel = 15.0
        detailNaverMapView.moveCamera(cameraUpdate, completion: { (isCancelled) in
            if isCancelled {
                print("카메라 이동 취소")
            } else {
                print("카메라 이동 성공")
            }
        })
        
        
        marker.mapView = detailNaverMapView
```

* NaverMapAPI 설명이 한글로도 나와서 너무 잘표현 되어있음
* CarmeraUpdate의 애니메이션 방식이 설정가능하고, 애니메이션를 얼마의 기간에 설정할지(Duration)까지 설정이 가능
* NaverMapView의 mapType은 위성(새틀라이트),하이브리드(2D+3D위성을 섞은), basic은 우리가 흔히 보는 지도의 형태
* 어떠한 줌단계의 래밸로 보여질지도 설정이 가능하며, 최소 최대의 줌레벨을 설정해서 과도하게 줌이 되거나 풀리는 경우를 제한 할 수 있다. ***minZoomLevel을 설정안해보고 최대한 zoom을 뒤로 땡겨보았는데, 전국 단위를 넘어서까지 줌레벨이 낮아진다.***

***

### 마커 터치시 이벤트 발생이 가능, Swift 클로저 문법을 따라서 코드 가독성도 좋으며 구현성도 좋음

```swift
        marker.touchHandler = { (overlay) in
            
            print("마커 클릭됨")
            self.goToNaverMap()
            
            return true
        }
```

* 앱의 스키마URL을 통해 실제 네이버 지도앱으로 이동
* 지도에 표시되는 이름은 string값을 urlstring값으로 인코딩해야함 (ex: %95%98....)

```swift
    func goToNaverMap(){
        let appStoreURL = URL(string: "http://itunes.apple.com/app/id311867728?mt=8")!
        
        let latitude: Double = Double(self.detailBookStoreModel[0].latitude)
        let longtitude: Double = Double(self.detailBookStoreModel[0].longitude)
        
        if let detailMapURL = URL(string: "nmap://place?lat=\(latitude)&lng=\(longtitude)&name=Cozy%ea%b0%80%20%ec%b6%94%ec%b2%9c%ed%95%98%eb%8a%94%20%ec%84%9c%ec%a0%90&gamsung.Cozy=Cozy"), UIApplication.shared.canOpenURL(detailMapURL)
        { // 유효한 URL인지 검사합니다.
            if #available(iOS 10.0, *) { //iOS 10.0부터 URL를 오픈하는 방법이 변경 되었습니다.
                UIApplication.shared.open(detailMapURL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appStoreURL)   
            }
        }
    }
```

***

#### [지도앱 갔다 돌아왔을때 탭바가 다시 생겨지는 이슈]

지도 기능을 구현해, 원하는 서점의 길찾기 기능을 네이버지도 앱을 통해 제공했습니다. 이때 지도 앱을 갔다온 다음에 상세 화면에서 사라져 있는 탭바가 다시 보여지는 이슈가 있었습니다.

```swift
let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willEnterForegroundNotification, object: nil)
```

NotificationCenter를 이용해 다시 원래 Cozy앱이 Foreground 상태로 돌아올때 다시금 탭바를 사라지게 해주었습니다.

***

#### [이슈관리 링크]

[이와 같이 이슈를 사용하였습니다.](https://github.com/OurCozy/cozy-iOS/issues?q=is%3Aissue+is%3Aclosed+author%3AiJoom)

***

#### 북마크 탭

<img src="https://user-images.githubusercontent.com/55793344/101469643-59cee980-3988-11eb-9df9-a8ef23bcb11a.gif" width="300">

* 테이블뷰의 맞는 셀에 북마크가 되고 해제 되도록 Delegate 패턴을 이용하여 도움을 주었습니다.

```swift
extension InterestViewController: ButtonActionDelegate {
    func bookmarkButtonClick(at indexPath: IndexPath) {
        bookStoreList.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .right)
        for index in indexPath.row..<bookStoreList.count {
            guard let eachCell = tableView.cellForRow(at: indexPath) as? BookStoreTableViewCell else { return print("error") }
            eachCell.indexPath = IndexPath(row: index, section: 0)
        }
    }
}
```

* 기존의 indexPath를 만들어서 배열을 만드는 방식과 달리

```swift
extension InterestViewController: BookMarkButtonDelegate {
    func interestCell(at cell: TestTableViewCell,didTapClickBookMarkButton: UIButton) {
        
        let indexPath = interestTableView.indexPath(for: cell)
       
        if let indexPaths = indexPath {
            bookStoreList.remove(at: indexPaths.row)
            self.tableView.deleteRows(at: [indexPaths], with: .fade)
        }
        
    }
```

* 셀을 받아서 indexPath를 찾고 deleteRows 해주는 방식으로 변경
* 자연스러운 애니메이션을 위해 .fade 사용
* Swift Delegate에 맞는 함수명을 네이밍하기 위해 노력

***

### 마이페이지 탭 프로필 사진 업로드

<img src="https://user-images.githubusercontent.com/55793344/101469576-402da200-3988-11eb-8b44-266ada62a3a1.png" width="350"><img src="https://user-images.githubusercontent.com/55793344/101469586-4459bf80-3988-11eb-846d-0f055b76b630.gif" width="300"> 

* 팀원이 이미지 피커를 이용해 사진을 업로드 할 수 있도록 도움을 주었습니다.

```swift
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            
            guard let token = UserDefaults.standard.object(forKey: "token") as? String else { return }
            UploadService.shared.uploadImage(token, image, url.lastPathComponent) { networkResult in
                switch networkResult {
                case .success(let profileData):
                    guard let profileData = profileData as? [UserProfile] else { return }
                    print(profileData[0].profile)
                    
                case .requestErr(let failMessage):
                    guard let message = failMessage as? String else { return }
                    print(message)
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                }
            }
            //guard let profileCell = self.freindTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? MyProfileCell else { return }
            profileImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
```

***



