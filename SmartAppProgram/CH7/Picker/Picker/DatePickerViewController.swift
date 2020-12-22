//
//  DatePickerViewController.swift
//  Picker
//
//  Created by IJ . on 2020/12/21.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let date = NSDate()
        
        let date2 = Date()
        datePicker.setDate(date as Date, animated: false)
    }
    
    @IBAction func onBUttonPressed(_ sender: UIButton) {

        
        var date = datePicker.date
        //date.addTimeInterval(-10800)
        
        //print(datePicker.date)
       
        
        let message = "The date and time you selected is \(date)"
        let alert = UIAlertController(
            title: "Date and Time Selected",
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "That's so true!",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        
    }
    
}
