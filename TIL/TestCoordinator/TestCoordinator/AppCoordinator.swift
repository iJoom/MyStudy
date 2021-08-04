//
//  AppCoordinator.swift
//  TestCoordinator
//
//  Created by IJ . on 2021/08/02.
//

import UIKit

final class AppCoordinator {
    private var rvc: UINavigationController? {
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
            navigationController.navigationBar.isHidden = false
            window.rootViewController = navigationController
        }
        
        
        window.makeKeyAndVisible()
    }
    
    //다른View에서 Coordinator를 이용해 View 전환하는 법 고려해보기
    //Coordinator 싱글턴... 흠?
    
    func moveToSecondView() {
        let secondViewController = SecondViewViewController.instantiate(TestViewModel(),coordiNator: self)
//        window.rootViewController.pushViewController(secondViewController, animated: true)
        let secondView = window.rootViewController as? UINavigationController
            secondView?.pushViewController(secondViewController, animated: true)
        
        print("moveToSecondView")
    }
}
