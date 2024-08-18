//
//  AllCharactersViewFactory.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation

class AllCharactersViewFactory: ViewControllerFactory {
    typealias ViewController = AllCharactersViewController
    typealias ViewControllerArguments = Any?
    typealias VCCoordinatorDelegate = AllCharactersVCCoordinatorDelegate
    
    static func createViewController(arguments: Any? = nil,
                                     coordinatorDelegate: AllCharactersVCCoordinatorDelegate) -> AllCharactersViewController {
        let allCharactersVM = createAllCharactersViewModel()
        let allCharactersVC = AllCharactersViewController(viewModel: allCharactersVM)
        allCharactersVC.coordinatorDelegate = coordinatorDelegate
        return allCharactersVC
    }
    
    private static func createAllCharactersViewModel() -> AllCharactersViewModelProtocol {
        return AllCharactersViewModel(fetchAllCharactersUseCase: getFetchAllCharactersUseCase())
    }
    
    private static func getFetchAllCharactersUseCase() -> FetchAllCharactersUseCase {
        return DefaultFetchAllCharactersUseCase(repo: getFetchAllCharactersRepository())
    }
    
    private static func getFetchAllCharactersRepository() -> FetchAllCharactersRepository {
        return FetchAllCharactersRepositoryImpl(fetchAllCharactersEndPoint: FetchAllCharactersEndPointImpl())
    }
}
