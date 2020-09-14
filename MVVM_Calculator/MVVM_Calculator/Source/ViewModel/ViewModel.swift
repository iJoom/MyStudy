//
//  ViewModel.swift
//  MVVM_Calculator
//
//  Created by IJ . on 2020/09/11.
//  Copyright © 2020 jun. All rights reserved.
//

import Foundation

class CaculatorViewModel {
    
    var model = Model(beforeValue: 0, nowValue: 0)
    
    func just(){
        
    }
    
    func setModelBeforeValue(beforeValue: Int) {
        model.setBeforeValue(changeValue: beforeValue)
    }
    
    func setModelNowValue(nowValue: Int) {
        model.setNowValue(changeValue: nowValue)
    }
    
    func setOperatorValue(operatorValue: String) {
        model.setOpertaorCalculate(operatorValue: operatorValue)
    }
   
    @objc func getNowValueLabel(_ notification: Notification) {
       // print("viewModel에서\(notification.object ?? 0)")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NowValueViewNotificationCenter"), object: notification.object)
    }
    
    
    init() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(getNowValueLabel), name: Notification.Name("NowValueNotificationCenter"), object: nil)
        print("ViewModel생성자")
    }
}
