//
//  MockedFetchAllCharactersRepository.swift
//  RickAndMorty
//
//  Created by Salma Salah on 17/08/2024.
//

import Foundation
@testable import RickAndMorty

class MockedFetchAllCharactersRepository: FetchAllCharactersRepository {
    
    func fetchAllCharacters(paginator: Paginator, 
                            characterStatus: Status?,
                            completion: @escaping (Response<[Character]?>)) {
        if let mockedCharactersResponse = MockedCharactersResponseProvider.getMockedCharactersResponse() {
            completion(.success(mockedCharactersResponse))
        }else {
            let error = TestingError.mockFailure("Failed to get mock")
            completion (.failure(error))
        }
    }
}
