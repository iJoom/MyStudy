//
//  CalculatorViewModel.swift
//  MVVM_Calculator
//
//  Created by IJ . on 2020/09/11.
//  Copyright © 2020 jun. All rights reserved.
//

protocol CalculatorViewModelBinding: class {
    func calculatorDidFinishCalculation(with result: String)
}

final class CalculatorViewModel {
    weak var bindingObject: CalculatorViewModelBinding?
    
    private var model = CalculatorModel()

    init() {
        model.delegate = self
    }
}

// MARK: - Input

extension CalculatorViewModel {
    func setBeforeValue(_ beforeValue: Int) {
        model.setBeforeValue(beforeValue)
    }

    func setNowValue(_ nowValue: Int) {
        model.setNowValue(nowValue)
    }

    func setCommand(_ command: String) {
        model.setCommand(command)
    }
}

// MARK: - Output

extension CalculatorViewModel: CalculatorModelDelegate {
    func calculatorModelDidChangeNowValue(with value: Int) {
        bindingObject?.calculatorDidFinishCalculation(with: String(value))
    }
}
