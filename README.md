# MyStudy
study iOS

# Animation

### animate함수에서 alpha 값을 0으로 설정해서 이미지가 점점 흐려지게 연출
### transform.translatedBy를 이용해 원하는 방향으로 이미지가 이동하게 연출

```
func animate2() {
    UIView.animate(withDuration: animationDuration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
        self.airPlane.alpha = 0
        self.airPlane.transform =
            self.airPlane.transform.translatedBy(x: 100, y: -200)
    }  )
    //오른쪽 대각선으로 이동하며 사라지는 애니메이션
    
}
```


