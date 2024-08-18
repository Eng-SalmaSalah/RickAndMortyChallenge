//
//  AppRouter.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit

class AppRouter: Router {
    var navigationController: UINavigationController

    private var navigationStack: [UINavigationController] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: true)
        navigationStack.append(navigationController)
    }
    
    func present(_ module: Presentable, animated: Bool, presentationStyle: UIModalPresentationStyle, completion: (() -> Void)?) {
        guard let currentNavigationController = navigationStack.last else {
            assertionFailure("No navigation controller found")
            return
        }
        let navController = UINavigationController(rootViewController: module.toPresent())
        navController.setNavigationBarHidden(true, animated: true)
        navController.modalPresentationStyle = presentationStyle
        currentNavigationController.present(navController, animated: animated, completion: completion)
        navigationStack.append(navController)
    }
    
    func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?) {
        guard let currentNavigationController = navigationStack.last else {
            assertionFailure("No navigation controller found")
            return
        }
        currentNavigationController.pushViewController(module.toPresent(), animated: animated)
        if let completion = completion {
            completion()
        }
    }
        
    func setRootModule(_ module: Presentable, animated: Bool, completion: (() -> Void)?) {
        guard let currentNavigationController = navigationStack.last else {
            assertionFailure("No navigation controller found")
            return
        }
        currentNavigationController.setViewControllers([module.toPresent()], animated: animated)
        if let completion = completion {
            completion()
        }
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        guard let currentNavigationController = navigationStack.last else {
            assertionFailure("No navigation controller found")
            return
        }
        currentNavigationController.dismiss(animated: animated, completion: completion)
        navigationStack.removeLast()
    }
    
    func popModule(animated: Bool, completion: (() -> Void)?) {
        guard let currentNavigationController = navigationStack.last else {
            assertionFailure("No navigation controller found")
            return
        }
        currentNavigationController.popViewController(animated: animated)
        
        if let completion = completion {
            completion()
        }
    }
    
    func resetNavigationStack() {
        while let lastNavController = navigationStack.last, lastNavController != navigationController {
            lastNavController.dismiss(animated: false, completion: nil)
            navigationStack.removeLast()
        }
    }

}
