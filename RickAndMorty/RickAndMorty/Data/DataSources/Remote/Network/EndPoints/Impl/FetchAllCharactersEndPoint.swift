//
//  AllCharactersEndPoint.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation
import Alamofire

class FetchAllCharactersEndPoint: Endpoint {
    private let fetchCharactersQueryParameters: QueryParameters
    
    init(fetchCharactersQueryParameters: QueryParameters) {
        self.fetchCharactersQueryParameters = fetchCharactersQueryParameters
    }
    
    var serviceURL: String {
        return "/api/character/"
    }
    
    var queryParameters: QueryParameters? {
        return fetchCharactersQueryParameters
    }
        
    var method: HTTPMethod {
        return .get
    }
}
