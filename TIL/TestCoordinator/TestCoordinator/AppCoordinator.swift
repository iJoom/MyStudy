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
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "Main")
        
        let secondStoryBoard = UIStoryboard(name: "SecondView", bundle: nil)
        let secondViewController = secondStoryBoard.instantiateViewController(identifier: "SecondView")
        
        
        let navigationController = UINavigationController(rootViewController: nextViewController)
        navigationController.navigationBar.isHidden = true
        
        onLogIn = true
        
        if onLogIn ?? false {
            window.rootViewController = UINavigationController(rootViewController: secondViewController)
        } else {
            window.rootViewController = navigationController
        }
        
        
        window.makeKeyAndVisible()
    }
}
