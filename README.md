# MyStudy
study iOS

# Animation

 animate함수에서 alpha 값을 0으로 설정해서 이미지가 점점 흐려지게 연출. 
 
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



# Expandable cell , Xib
코드분석




```swift
struct ExpandableNames {
    var isExpanded: Bool
    let country : String
    let cities  : [String]
}
```

```swift
 @objc func handleExpandClose(button: UIButton) {
        
        let section = button.tag 
        // button.tag 값을 이용해 섹션값 정의 , tableview각 버튼의 tag값 0부터 오름차순임
        button.isSelected = !button.isSelected
        
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].cities.indices{
            print(0,row)
            let indexPath = IndexPath(row: row, section:  section)
            indexPaths.append(indexPath)
            
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        
        twoDimensionalArray[section].isExpanded = !isExpanded
        

        if isExpanded{
            tableView.deleteRows(at: indexPaths, with: .fade)
            
        } else{
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
        
    }
```
Section에 있는 Button을 눌렀을때 Data들이 펼쳐지거나, 닫혀지는 것이므로 

각 tableView의 HeaderSection에 있는 Expandable하게 될 Button의 tag 값으로 Data들의 섹션값을 구별한다.

그리고 지정된 더미데이터의 크기 만큼 순차적으로 indexPath 배열을 만들어준다. 

왜 indexPaths 배열을 만드는가?

뒤에 사용될 deleteRows,insertRows 메소드의 indexPaths 파라미터는 indexPath로 이루어진 배열이므로.
