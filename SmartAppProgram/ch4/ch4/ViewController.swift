//
//  ViewController.swift
//  ch4
//
//  Created by IJ . on 2020/10/23.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var doSomethingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sliderLabel.text = "50"
    }
    
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        nameTextField.resignFirstResponder()
        numberTextField.resignFirstResponder()
        
    }
    @IBAction func valueChangeSlider(_ sender: UISlider) {
        
        sliderLabel.text = "\(lroundf(sender.value*100))"
    }
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        let setting = sender.isOn
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { // "Switch" is selected
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            doSomethingButton.isHidden = true
        } else { // "Button" is selected
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            doSomethingButton.isHidden = false
        }
    }
    
    @IBAction func touchUpDoSomethingButton(_ sender: UIButton) {
        let controller = UIAlertController(title: "Are You Sure?", message:nil, preferredStyle: .actionSheet)
        let yesAction = UIAlertAction(title: "Yes, I'm sure!", style: .destructive, handler: { action in
                                        let msg = self.nameTextField.text!.isEmpty
                                            ? "You can breathe easy, everything went OK."
                                            : "You can breathe easy, \(self.nameTextField.text ?? "0"),"
                                            + "everything went OK."
                                        let controller2 = UIAlertController(
                                            title:"Something Was Done",
                                            message: msg, preferredStyle: .alert)
                                        let cancelAction = UIAlertAction(title: "Phew!",
                                            style: .cancel, handler: nil)
                                        controller2.addAction(cancelAction)
                                        self.present(controller2, animated: true, completion: nil)
        })
        let noAction = UIAlertAction(title: "No way!",
            style: .cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
            ppc.permittedArrowDirections = .down
        }
        present(controller, animated: true, completion: nil)
        
    }
    
}

