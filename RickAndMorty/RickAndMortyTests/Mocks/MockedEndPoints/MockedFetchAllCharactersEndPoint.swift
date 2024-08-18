//
//  MockedFetchAllCharactersEndPoint.swift
//  RickAndMorty
//
//  Created by Salma Salah on 17/08/2024.
//

import Foundation
import Alamofire
@testable import RickAndMorty

class MockedFetchAllCharactersEndPoint: FetchAllCharactersEndPoint {
    var serviceURL: String {
        return ""
    }

    var method: HTTPMethod {
        return .get
    }
    
    func setFetchAllCharactersQueryParams(queryParams: QueryParameters) {}
        
    func request<T: Codable>(completion: @escaping Response<T>) {
        guard let data = MockedCharactersResponseProvider.getMockedCharactersResponse() as? ResponseDTO<T> else {
              let error = TestingError.mockFailure("Failed to get mock characters data")
              completion(.failure(error))
              return
          }
          completion(.success(data))
    }
}
