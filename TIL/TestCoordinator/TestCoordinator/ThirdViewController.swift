//
//  ThirdViewController.swift
//  TestCoordinator
//
//  Created by IJ . on 2021/08/05.
//

import UIKit

class ThirdViewController: UIViewController {

    private var viewModel: TestViewModel?
    private weak var coordiNator: AppCoordinator?
    //static func로 ViewModel VC생성과 함께 초기화
    static func instantiate(_ viewModel: TestViewModel,coordiNator: AppCoordinator ) -> UIViewController {
        let secondStoryBoard = UIStoryboard(name: "ThirdStoryboard", bundle: nil)
        guard let thirdViewController = secondStoryBoard.instantiateViewController(identifier: "ThirdView") as? ThirdViewController else {
            return UIViewController()
        }
        thirdViewController.viewModel = viewModel
        thirdViewController.coordiNator = coordiNator
        return thirdViewController
    }
    
    deinit {
        print("Third View Disappear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    @IBAction func touchUpBackButton(_ sender: Any) {
        coordiNator?.popViewController()
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
