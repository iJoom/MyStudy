//
//  DoubleComponentPickerViewController.swift
//  Picker
//
//  Created by IJ . on 2020/12/21.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    

    @IBOutlet weak var doublePickerView: UIPickerView!
   
    private let fillingComponent = 0
    private let breadComponent = 1
    private let fillingTypes = [
    "Ham", "Turkey", "Peanut Butter", "Tuna Salad",
    "Chicken Salad", "Roast Beef", "Vegemite"]
    private let breadTypes = [
    "White", "Whole Wheat", "Rye", "Sourdough",
    "Seven Grain"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        doublePickerView.delegate = self
        doublePickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == breadComponent {
        return breadTypes.count
        } else {
        return fillingTypes.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == breadComponent {
        return breadTypes[row]
        } else {
        return fillingTypes[row]
        }
    }
    
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let fillingRow =
        doublePickerView.selectedRow(inComponent: fillingComponent)
        let breadRow =
        doublePickerView.selectedRow(inComponent: breadComponent)
        let filling = fillingTypes[fillingRow]
        let bread = breadTypes[breadRow]
        let message = "Your \(filling) on \(bread) bread will be right up."
        let alert = UIAlertController(
        title: "Thank you for your order",
        message: message,
        preferredStyle: .alert)
        let action = UIAlertAction(
        title: "Great",
        style: .default,
        handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}
