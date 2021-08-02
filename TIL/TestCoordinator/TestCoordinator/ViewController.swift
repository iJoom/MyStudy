//
//  ViewController.swift
//  TestCoordinator
//
//  Created by IJ . on 2021/08/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("viewDidLoad()")
    }

    @IBAction func touchUpButton(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "SecondView", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "SecondView")
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}

