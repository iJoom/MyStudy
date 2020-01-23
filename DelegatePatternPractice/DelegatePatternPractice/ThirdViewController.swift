//
//  ThirdViewController.swift
//  DelegatePatternPractice
//
//  Created by LeeSeungsoo on 2019/12/29.
//  Copyright © 2019 soogoon. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
  
  @IBOutlet weak var firstDataLabel: UILabel!
  @IBOutlet weak var secondDataLabel: UILabel!
  
  var firstData: String?
  var secondData: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    firstDataLabel.text = firstData
    secondDataLabel.text = secondData
  }
  
  
}
