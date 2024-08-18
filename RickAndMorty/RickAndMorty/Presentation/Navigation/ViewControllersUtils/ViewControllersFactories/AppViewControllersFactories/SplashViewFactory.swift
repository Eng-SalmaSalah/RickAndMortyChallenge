//
//  SplashViewFactory.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit

class SplashViewFactory: ViewControllerFactory {
    typealias ViewController = SplashViewController
    typealias ViewControllerArguments = Any?
    typealias VCCoordinatorDelegate = SplashVCCoordinatorDelegate
    
    static func createViewController(arguments: Any? = nil,
                                     coordinatorDelegate: SplashVCCoordinatorDelegate) -> SplashViewController {
        let splashVC = SplashViewController()
        splashVC.coordinatorDelegate = coordinatorDelegate
        return splashVC
    }
}
