//
//  MainCoordinator.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var router: Router
    private var mainTabbarVC: UITabBarController?

    init(router: Router) {
        self.router = router
    }
    
    func start() {
        goToAllCharactersView()
    }
    
    private func goToAllCharactersView() {
        let allCharactersVC = AllCharactersViewFactory.createViewController(coordinatorDelegate: self)
        router.setRootModule(allCharactersVC,
                             animated: true,
                             completion: nil)
    }
}

extension MainCoordinator: AllCharactersVCCoordinatorDelegate {
    func goToCharacterDetails(character: Character) {
        let characterDetailsVC = CharacterDetailsViewFactory.createViewController(arguments: character,
                                                                                  coordinatorDelegate: self)
        router.push(characterDetailsVC, animated: true, completion: nil)
    }
}

extension MainCoordinator: CharacterDetailsVCCoordinatorDelegate {
    func goBackToAllCharacters() {
        goBack()
    }
}
