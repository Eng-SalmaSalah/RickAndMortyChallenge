//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var router: Router
             
    private var splashVC: SplashViewController?
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        launchApp()
    }
    
    private func launchApp() {
        let splashVC = SplashViewFactory.createViewController(coordinatorDelegate: self)
        self.splashVC = splashVC
        router.setRootModule(splashVC, animated: false, completion: nil)
    }

    private func coordinateToMain() {
        let mainCoordinator = CoordinatorsFactory.createMainCoordinatorWith(router: router)
        coordinateTo(coordinator: mainCoordinator)
    }
}

extension AppCoordinator: SplashVCCoordinatorDelegate {
    func didFinishSplash() {
        coordinateToMain()
    }
}
