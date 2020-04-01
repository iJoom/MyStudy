//
//  ViewController.swift
//  studyGDC
//
//  Created by IJ . on 2020/03/21.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    let myQueue = DispatchQueue(label: <#T##String#>, qos: <#T##DispatchQoS#>, attributes: <#T##DispatchQueue.Attributes#>, autoreleaseFrequency: <#T##DispatchQueue.AutoreleaseFrequency#>, target: <#T##DispatchQueue?#>)
    
    let mineQueue = DispatchQueue(label: "bbb", attributes: .concurrent)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.global(qos:.default).async { print("1") }
        print("2")
        DispatchQueue.global().async { print("3") }
        print("4")
        DispatchQueue.global().async { print("5") }
        print("6")
        
        
        
    }


}

