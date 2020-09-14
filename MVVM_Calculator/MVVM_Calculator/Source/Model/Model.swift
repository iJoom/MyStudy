//
//  Model.swift
//  MVVM_Calculator
//
//  Created by IJ . on 2020/09/11.
//  Copyright © 2020 jun. All rights reserved.
//

import Foundation

struct Model {
    
    var beforeValue: Int
    var nowValue: Int {
        didSet { //값이 변경되기 직전 호출, 프로퍼티 옵저버
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NowValueNotificationCenter"), object: self.nowValue)
        }
    }
    var beforeOperationType: OperationType?
    var operationType: OperationType?
    var isOperationCheck: Bool = false
    
    private func calculatePlus() -> Int {
       return beforeValue + nowValue
    }
    
    mutating func setBeforeValue(changeValue: Int) {
        self.beforeValue = changeValue
    }
    
    mutating func setNowValue(changeValue: Int){
        if isOperationCheck {
            self.nowValue = changeValue
        } else {
             self.nowValue = self.nowValue * 10 + changeValue
        }
        
        if isOperationCheck {
            self.isOperationCheck = false
        }
    }
    
    mutating func setOpertaorCalculate(operatorValue: String) {
        if let operation = OperationType(rawValue: operatorValue) {
             switch operation {
             case .plus:
                calculate(.plus)
             case .divide:
                calculate(.divide)
             case .minus:
                calculate(.minus)
             case .multiply:
                calculate(.multiply)
             case .result:
                if let beforeOperation = beforeOperationType {
                    switch beforeOperation {
                    case .plus:
                        self.nowValue = self.beforeValue + self.nowValue
                    case .divide:
                        self.nowValue = self.beforeValue / self.nowValue
                    case .minus:
                        self.nowValue = self.beforeValue - self.nowValue
                    case .multiply:
                        self.nowValue = self.beforeValue * self.nowValue
                    default: print("4칙연산 이외의 케이스 감지 ERROR")
                        break
                    }
                }
                
             case .initialize:
                self.nowValue = 0
                self.beforeValue = 0
                   default:
                       break
                   }
        }
       
    }
    private mutating func calculate(_ beforeOperationType: OperationType) {
        self.setBeforeValue(changeValue: self.nowValue)
        self.isOperationCheck = true
        self.beforeOperationType = beforeOperationType
    }
    
    private func getNowValue() -> Int {
        return self.nowValue
    }
    
    private func getBeforeValue() -> Int {
        return self.beforeValue
    }
    
}
