//
//  ViewController.swift
//  TestCoordinator
//
//  Created by IJ . on 2021/08/02.
//

import UIKit

final class ViewController: UIViewController {
    
    private weak var coordiNator: AppCoordinator?
    private weak var viewModel: TestViewModel?
    
    static func instantiate(viewModel: TestViewModel, coordiNator: AppCoordinator) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(identifier: "Main") as? ViewController else {
            return UIViewController()
        }
        viewController.viewModel = viewModel
        viewController.coordiNator = coordiNator
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ViewController ViewDidLoad()")
        viewModel?.sayHello()
    }

    @IBAction func touchUpButton(_ sender: Any) {
        
        coordiNator?.moveToSecondView()
//        let storyBoard = UIStoryboard(name: "SecondView", bundle: nil)
//        let nextViewController = storyBoard.instantiateViewController(identifier: "SecondView")
//        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}

