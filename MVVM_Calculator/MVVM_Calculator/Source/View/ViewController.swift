//
//  ViewController.swift
//  MVVM_Calculator
//
//  Created by IJ . on 2020/09/11.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var operatorButtons: [UIButton]!
    
    
    let viewModel = CaculatorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        for button in numberButtons {
            button.addTarget(self, action: #selector(touchUpNumberButtons(_:)), for: .touchUpInside)
        }
        
        for button in operatorButtons {
            button.addTarget(self, action: #selector(touchUpOperatorButtons(_:)), for: .touchUpInside)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(viewSetNowValue), name: Notification.Name("NowValueViewNotificationCenter"), object: nil)
        //RxCocoa를 사용하지 않아서 바인딩이 안되서, M과 View가 연결되어짐 구조를 먼저 짠뒤 수정예정
        //Model에서 nowValue -> VM에서 노티로 옵저버, 값 전달 -> View
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //viewWillAppear()에서 하면 자몽이 만들어짐...why?
        for numberButton in numberButtons {
            numberButton.layer.cornerRadius = numberButton.bounds.height / 2
        }
        
        for operatorButton in operatorButtons {
            operatorButton.layer.cornerRadius = operatorButton.bounds.height / 2
        }
    }
    
    @IBAction func touchUpPlusButton(_ sender: Any) {
        //test
        viewModel.just()
    }
    
    @objc func viewSetNowValue(_ notification: Notification) {
        //notification.object as? Int
        if let changeValue = notification.object {
            presentLabel.text = "\(changeValue)"
        }
    }
    
    @objc func touchUpNumberButtons(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        guard let buttonNumber = Int(number) else { return }
        
        viewModel.setModelNowValue(nowValue: buttonNumber)
    }
    
    @objc func touchUpOperatorButtons(_ sender: UIButton) {
        guard let operatorValue = sender.titleLabel?.text else { return }
        
        viewModel.setOperatorValue(operatorValue: operatorValue)
        
    }
    
    
}

