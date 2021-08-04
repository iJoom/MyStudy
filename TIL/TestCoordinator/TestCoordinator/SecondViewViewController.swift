//
//  SecondViewViewController.swift
//  TestCoordinator
//
//  Created by IJ . on 2021/08/02.
//

import UIKit

class SecondViewViewController: UIViewController {

    private var viewModel: TestViewModel?
    weak var coordiNator: AppCoordinator?
    //static func로 ViewModel VC생성과 함께 초기화
    static func instantiate(_ viewModel: TestViewModel,coordiNator: AppCoordinator ) -> UIViewController {
        let secondStoryBoard = UIStoryboard(name: "SecondView", bundle: nil)
        guard let secondViewController = secondStoryBoard.instantiateViewController(identifier: "SecondView") as? SecondViewViewController else {
            return UIViewController()
        }
        secondViewController.viewModel = viewModel
        secondViewController.coordiNator = coordiNator
        return secondViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
