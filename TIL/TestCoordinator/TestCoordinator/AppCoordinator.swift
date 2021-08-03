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
        
        let secondStoryBoard = UIStoryboard(name: "SecondView", bundle: nil)
        let secondViewController = secondStoryBoard.instantiateViewController(identifier: "SecondView")
        
        
       
        
        onLogIn = true
        
        if onLogIn ?? false {
            window.rootViewController = UINavigationController(rootViewController: secondViewController)
        } else {
            let navigationController = UINavigationController(rootViewController: ViewController.instantiate(viewModel: TestViewModel()))
            navigationController.navigationBar.isHidden = true
            window.rootViewController = navigationController
        }
        
        
        window.makeKeyAndVisible()
    }
}
