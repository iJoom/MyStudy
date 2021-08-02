//
//  AppCoordinator.swift
//  TestCoordinator
//
//  Created by IJ . on 2021/08/02.
//

import UIKit

final class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "Main")
        let navigationController = UINavigationController(rootViewController: nextViewController)
        navigationController.navigationBar.isHidden = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
