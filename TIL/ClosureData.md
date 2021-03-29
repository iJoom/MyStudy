### Closure Data 전달

```swift
//First ViewController
@IBAction func touchUpNextVC(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "secondVC") as? SecondViewController else { return }
        nextVC.didTapData = { [weak self] data in
            self?.nameLabel.text = String(data)
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
```

```swift
//Second ViewController
var didTapData: ( (String) -> Void )?

  @objc func didTapDataButton() -> Void {
        didTapData?("Closure Data")
        self.navigationController?.popViewController(animated: true)
    }

```

