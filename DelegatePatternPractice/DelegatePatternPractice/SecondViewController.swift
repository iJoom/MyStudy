//
//  SecondViewController.swift
//  DelegatePatternPractice
//
//  Created by LeeSeungsoo on 2019/12/29.
//  Copyright © 2019 soogoon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  var firstData: String?
  
  @IBOutlet weak var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToSub" {
      if let vc = segue.destination as? SubViewController {
        vc.delegate = self
      }
    }
  }
  
  
  @IBAction func goToNext(_ sender: Any) {
    let vc = storyboard?.instantiateViewController(identifier: "ThirdViewController") as! ThirdViewController
    vc.firstData = firstData
    vc.secondData = textField.text
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  @IBAction func goToSub(_ sender: Any) {
    performSegue(withIdentifier: "goToSub", sender: nil)
  }
  
}

extension SecondViewController: DataFlowDelegate {
  func didSetData(text: String) {
    self.textField.text = text
  }
}
