//
//  AppCoordinator.swift
//  TestCoordinator
//
//  Created by IJ . on 2021/08/02.
//

import UIKit

final class AppCoordinator {
    private var windowRootViewController: UINavigationController? {
        return window.rootViewController as? UINavigationController
    }
    private let window: UIWindow
    private var onLogIn: Bool?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        onLogIn = false
        
        if onLogIn ?? false {
            window.rootViewController = UINavigationController(rootViewController: SecondViewViewController.instantiate(TestViewModel(),coordiNator: self))
        } else {
            let mainViewController = ViewController.instantiate(viewModel: TestViewModel(), coordiNator: self)
            let navigationController = UINavigationController(rootViewController: mainViewController)
            navigationController.navigationBar.isHidden = true
            window.rootViewController = navigationController
        }
        
        window.makeKeyAndVisible()
    }
    
    //다른View에서 Coordinator를 이용해 View 전환하는 법 고려해보기
    
    func moveToSecondView() {
        let secondViewController = SecondViewViewController.instantiate(TestViewModel(),coordiNator: self)
        let secondView = window.rootViewController as? UINavigationController
        secondView?.pushViewController(secondViewController, animated: true)
        
        print("moveToSecondView")
    }
    
    func moveToThirdView() {
        let thirdViewController = ThirdViewController.instantiate(TestViewModel(), coordiNator: self)
        let rootView = window.rootViewController as? UINavigationController
        if let rv = windowRootViewController {
            rv.pushViewController(thirdViewController, animated: true)
        }
        print("moveToThirdView")
    }
    
    func popViewController() {
        let rootView = window.rootViewController as? UINavigationController
        rootView?.popViewController(animated: true)
    }
}
