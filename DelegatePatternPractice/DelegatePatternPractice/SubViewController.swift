//
//  SubViewController.swift
//  DelegatePatternPractice
//
//  Created by LeeSeungsoo on 2019/12/29.
//  Copyright © 2019 soogoon. All rights reserved.
//

import UIKit

protocol DataFlowDelegate {
  func didSetData(text: String)
}


class SubViewController: UIViewController {
  
  var delegate: DataFlowDelegate?
  
  @IBOutlet weak var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  @IBAction func backToSecondAction(_ sender: Any) {
    if let text = textField.text {
      self.delegate?.didSetData(text: text)
      dismiss(animated: true)
    }
  }
  
  
}
