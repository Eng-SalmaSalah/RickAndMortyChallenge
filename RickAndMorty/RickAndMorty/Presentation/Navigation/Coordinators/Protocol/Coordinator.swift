//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var router: Router { get set }
    
    func start()
    func coordinateTo(coordinator: Coordinator)
    
    func goBack(animated: Bool)
    func dismiss(animated: Bool)
}

extension Coordinator {
    func coordinateTo(coordinator: Coordinator){
        coordinator.start()
    }
    func goBack(animated: Bool = true) {
        router.popModule(animated: animated, completion: nil)
    }
    
    func dismiss(animated: Bool = true) {
        router.dismissModule(animated: animated, completion: nil)
    }
}

