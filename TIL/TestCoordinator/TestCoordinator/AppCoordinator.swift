//
//  AppCoordinator.swift
//  TestCoordinator
//
//  Created by IJ . on 2021/08/02.
//

import UIKit

final class AppCoordinator {
    
    private let window: UIWindow
    private var onLogIn: Bool?
    
    init(window: UIWindow) {
        self.window = window
        self.onLogIn = false
    }
    
    func start() {
        
        onLogIn = false
        
        if onLogIn ?? false {
            window.rootViewController = UINavigationController(rootViewController: SecondViewViewController.instantiate(TestViewModel()))
        } else {
            let mainViewController = ViewController.instantiate(viewModel: TestViewModel(), coordiNator: self)
            let navigationController = UINavigationController(rootViewController: mainViewController)
            navigationController.navigationBar.isHidden = true
            window.rootViewController = navigationController
        }
        
        
        window.makeKeyAndVisible()
    }
    
    //다른View에서 Coordinator를 이용해 View 전환하는 법 고려해보기
    //Coordinator 싱글턴... 흠?
    
    func moveToSecondView() {
        print("go second view")
    }
}
