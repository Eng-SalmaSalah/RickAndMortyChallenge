//
//  CoordinatorsFactory.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation

class CoordinatorsFactory {
    static func createMainCoordinatorWith(router: Router) -> MainCoordinator {
        let mainCoordinator = MainCoordinator(router: router)
        return mainCoordinator
    }
}
