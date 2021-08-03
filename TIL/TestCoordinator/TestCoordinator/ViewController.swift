//
//  ViewController.swift
//  TestCoordinator
//
//  Created by IJ . on 2021/08/02.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: TestViewModel?
    
    static func instantiate(viewModel: TestViewModel) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(identifier: "Main") as? ViewController else {
            return UIViewController()
        }
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ViewController ViewDidLoad()")
    }

    @IBAction func touchUpButton(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "SecondView", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "SecondView")
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}

