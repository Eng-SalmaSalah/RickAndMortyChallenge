//
//  DefaultFetchAllCharactersUseCase.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation

class DefaultFetchAllCharactersUseCase: FetchAllCharactersUseCase {
    private let repo: FetchAllCharactersRepository
    
    init(repo: FetchAllCharactersRepository) {
        self.repo = repo
    }
    
    func execute(paginator: Paginator,
                 characterStatus: Status?,
                 completion: @escaping (Result<ResponseDTO<[Character]?>, any Error>) -> Void) {
        repo.fetchAllCharacters(paginator: paginator,
                                characterStatus: characterStatus) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
