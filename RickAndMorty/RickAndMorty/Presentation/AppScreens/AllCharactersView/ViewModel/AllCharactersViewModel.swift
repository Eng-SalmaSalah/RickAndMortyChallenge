//
//  AllCharactersViewModel.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation
import Combine

class AllCharactersViewModel: AllCharactersViewModelProtocol {
    
    private var showLoadingSubject = PassthroughSubject<Bool, Never>()
    var showLoadingPublisher: AnyPublisher<Bool, Never> {
        showLoadingSubject.eraseToAnyPublisher()
    }
    
    private var showErrorSubject = PassthroughSubject<Error, Never>()
    var showErrorPublisher: AnyPublisher<Error, Never> {
        showErrorSubject.eraseToAnyPublisher()
    }
    
    private var reloadCharactersTableSubject = PassthroughSubject<Void, Never>()
    var reloadCharactersTablePublisher: AnyPublisher<Void, Never> {
        reloadCharactersTableSubject.eraseToAnyPublisher()
    }
    
    var charactersVMList: [CharacterCellViewModel] = [CharacterCellViewModel]()
    
    var charactersList: [Character] = [Character]()
    
    var hasMoreToLoad: Bool = false {
        didSet {
            if hasMoreToLoad {
                paginator.currentPageNumber += 1
            }
        }
    }
    
    var selectedStatus: Status? {
        didSet {
            resetCharacters()
        }
    }
    
    var shouldShowLoading: Bool {
        return paginator.currentPageNumber == 1
    }
    
    private let paginator = Paginator()
    
    private let fetchAllCharactersUseCase: FetchAllCharactersUseCase
    
    
    var statusFilters: [Status] {
        return Status.allCases
    }
    
    init(fetchAllCharactersUseCase: FetchAllCharactersUseCase) {
        self.fetchAllCharactersUseCase = fetchAllCharactersUseCase
    }
    
    func getCharacters(completion: (() -> Void)?) {
        if shouldShowLoading {
            self.showLoadingSubject.send(true)
        }
        fetchAllCharactersUseCase.execute(paginator: paginator,
                                          characterStatus: selectedStatus) { [weak self] result in
            guard let self = self else { return }
            if shouldShowLoading {
                self.showLoadingSubject.send(false)
            }
            switch result {
            case .success(let model):
                handleSuccessfulResponse(response: model)
                completion?()
            case .failure(let error):
                self.showErrorSubject.send(error)
            }
        }
    }
    
    private func handleSuccessfulResponse(response: ResponseDTO<[Character]?>?) {
        guard let response = response,
        let results = response.results as? [Character],
        !results.isEmpty else {
            return
        }
        
        if let pagesNumber = response.info?.pages {
            self.hasMoreToLoad = pagesNumber > paginator.currentPageNumber
        }
        
        let characterCellVMs = results.map { character in
            return CharacterCellViewModel(characterImageURL: character.image,
                                          characterName: character.name,
                                          characterSpecies: character.species)
        }
        charactersList.append(contentsOf: results)
        charactersVMList.append(contentsOf: characterCellVMs)
        
        reloadCharactersTableSubject.send()
    }
    
    private func resetCharacters() {
        charactersList.removeAll()
        charactersVMList.removeAll()
        paginator.currentPageNumber = 1
    }
    
}
