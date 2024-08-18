//
//  MockedFetchAllCharactersUseCase.swift
//  RickAndMorty
//
//  Created by Salma Salah on 17/08/2024.
//

import Foundation
@testable import RickAndMorty

class MockedFetchAllCharactersUseCase: FetchAllCharactersUseCase {
    func execute(paginator: Paginator, 
                 characterStatus: Status?,
                 completion: @escaping (Result<ResponseDTO<[Character]?>, any Error>) -> Void) {
        if let mockedCharactersResponse = MockedCharactersResponseProvider.getMockedCharactersResponse() {
            completion(.success(mockedCharactersResponse))
        }else {
            let error = TestingError.mockFailure("Failed to get mock")
            completion (.failure(error))
        }
    }
    
}
