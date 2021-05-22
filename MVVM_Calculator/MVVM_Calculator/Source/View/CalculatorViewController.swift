//
//  CalculatorViewController.swift
//  MVVM_Calculator
//
//  Created by IJ . on 2020/09/11.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {
    @IBOutlet private var presentLabel: UILabel!
    @IBOutlet private var numberButtons: [UIButton]!
    @IBOutlet private var commandButtons: [UIButton]!

    private var viewModel: CalculatorViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        for button in numberButtons {
            button.addTarget(self, action: #selector(touchUpNumberButtons(_:)), for: .touchUpInside)
        }
        
        for button in commandButtons {
            button.addTarget(self, action: #selector(touchUpOperatorButtons(_:)), for: .touchUpInside)
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        for numberButton in numberButtons {
            numberButton.layer.cornerRadius = numberButton.bounds.height / 2
        }

        for operatorButton in commandButtons {
            operatorButton.layer.cornerRadius = operatorButton.bounds.height / 2
        }
    }

    func setViewModel(_ viewModel: CalculatorViewModel) {
        self.viewModel = viewModel
        viewModel.bindingObject = self
    }
}

// MARK: - Data Binding

extension CalculatorViewController: CalculatorViewModelBinding {
    func calculatorDidFinishCalculation(with result: String) {
        presentLabel.text = result
    }
}

// MARK: - Action

private extension CalculatorViewController {
    @objc func touchUpNumberButtons(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        guard let buttonNumber = Int(number) else { return }

        viewModel.setNowValue(buttonNumber)
    }

    @objc func touchUpOperatorButtons(_ sender: UIButton) {
        guard let operatorValue = sender.titleLabel?.text else { return }

        viewModel.setCommand(operatorValue)
    }
}
