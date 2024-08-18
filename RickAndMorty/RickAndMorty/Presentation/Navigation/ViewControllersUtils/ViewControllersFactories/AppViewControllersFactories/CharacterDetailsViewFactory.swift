//
//  CharacterDetailsViewFactory.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import SwiftUI
import UIKit

class CharacterDetailsViewFactory: ViewControllerFactory {
    typealias ViewController = UIHostingController<CharacterDetailView>
    typealias ViewControllerArguments = Character
    typealias VCCoordinatorDelegate = CharacterDetailsVCCoordinatorDelegate

    static func createViewController(arguments: Character,
                                     coordinatorDelegate: CharacterDetailsVCCoordinatorDelegate) -> UIHostingController<CharacterDetailView> {
        let detailView = CharacterDetailView(character: arguments) { [weak coordinatorDelegate] in
            coordinatorDelegate?.goBackToAllCharacters()
        }
        let hostingController = UIHostingController(rootView: detailView)
        return hostingController
    }
}
