//
//  CalculatorModel.swift
//  MVVM_Calculator
//
//  Created by IJ . on 2020/09/11.
//  Copyright © 2020 jun. All rights reserved.
//

protocol CalculatorModelDelegate: class {
    func calculatorModelDidChangeNowValue(with value: Int)
}

struct CalculatorModel {
    private(set) var beforeValue: Int = 0
    private(set) var nowValue: Int = 0 {
        didSet {
            delegate?.calculatorModelDidChangeNowValue(with: nowValue)
        }
    }

    weak var delegate: CalculatorModelDelegate?

    private var beforeCommand: Command?
    private var hasCommandUpdated: Bool = false
    
    mutating func setBeforeValue(_ beforeValue: Int) {
        self.beforeValue = beforeValue
    }
    
    mutating func setNowValue(_ nowValue: Int){
        if hasCommandUpdated {
            self.nowValue = nowValue
        } else {
            self.nowValue = self.nowValue * 10 + nowValue
        }
        
        if hasCommandUpdated {
            hasCommandUpdated = false
        }
    }
    
    mutating func setCommand(_ command: String) {
        guard let command = Command(rawValue: command) else { return }

        switch command {
        case .plus:
            performOperatorCommand(.plus)
        case .divide:
            performOperatorCommand(.divide)
        case .minus:
            performOperatorCommand(.minus)
        case .multiply:
            performOperatorCommand(.multiply)
        case .result:
            guard let beforeCommand = beforeCommand else { return }

            switch beforeCommand {
            case .plus:
                nowValue = beforeValue + nowValue
            case .divide:
                nowValue = beforeValue / nowValue
            case .minus:
                nowValue = beforeValue - nowValue
            case .multiply:
                nowValue = beforeValue * nowValue
            default:
                print("4칙연산 이외의 케이스 감지 ERROR")
            }
        case .initialize:
            initialize()
        }
    }
}

// MARK: - Private Method

private extension CalculatorModel {
    mutating func performOperatorCommand(_ command: Command) {
        setBeforeValue(nowValue)
        beforeCommand = command
        hasCommandUpdated = true
    }

    mutating func initialize() {
        nowValue = 0
        beforeValue = 0
    }
}
