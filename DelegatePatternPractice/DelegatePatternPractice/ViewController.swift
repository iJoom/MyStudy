//
//  ViewController.swift
//  DelegatePatternPractice
//
//  Created by LeeSeungsoo on 2019/12/29.
//  Copyright © 2019 soogoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var textField: UITextField!
  
  var selectedCategory: [Int] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToSecond" {
      let vc = segue.destination as! SecondViewController
      vc.firstData = textField.text
    }
  }
  
  @IBAction func goToSecond(_ sender: Any) {
//    performSegue(withIdentifier: "goToSecond", sender: nil)
    guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
    self.navigationController?.pushViewController(nextVC, animated: true)
    
  }
  
  @IBAction func goToCategory(_ sender: Any) {
    
    if let nextCategory = selectedCategory.first {
      if nextCategory == 1 {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FirstCategoryViewController") as! FirstCategoryViewController
        var nextCategory = self.selectedCategory
        nextCategory.remove(at: 0)
        vc.selectedCategory = nextCategory
        self.navigationController?.pushViewController(vc, animated: true)
      }
      
      if nextCategory == 2 {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondCategoryViewController") as! SecondCategoryViewController
        var nextCategory = self.selectedCategory
        nextCategory.remove(at: 0)
        vc.selectedCategory = nextCategory
        self.navigationController?.pushViewController(vc, animated: true)
      }
      
      if nextCategory == 3 {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ThirdCategoryViewController") as! ThirdCategoryViewController
        var nextCategory = self.selectedCategory
        nextCategory.remove(at: 0)
        vc.selectedCategory = nextCategory
        self.navigationController?.pushViewController(vc, animated: true)
      }
    }
  }
  
  
  
  @IBAction func firstSwitch(_ sender: UISwitch) {
    if sender.isOn {
      selectedCategory.append(1)
    } else {
      for (i, v) in selectedCategory.enumerated() {
        if v == 1 {
          selectedCategory.remove(at: i)
        }
      }
    }
    selectedCategory.sort()
  }
  
  @IBAction func secondSwitch(_ sender: UISwitch) {
    if sender.isOn {
      selectedCategory.append(2)
    } else {
      for (i, v) in selectedCategory.enumerated() {
        if v == 2 {
          selectedCategory.remove(at: i)
        }
      }
    }
    selectedCategory.sort()
  }
  
  @IBAction func thirdSwitch(_ sender: UISwitch) {
    if sender.isOn {
      selectedCategory.append(3)
    } else {
      for (i, v) in selectedCategory.enumerated() {
        if v == 3 {
          selectedCategory.remove(at: i)
        }
      }
    }
    selectedCategory.sort()
  }
}

