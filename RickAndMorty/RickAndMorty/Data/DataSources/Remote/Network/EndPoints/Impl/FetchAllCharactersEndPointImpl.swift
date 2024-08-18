//
//  FetchAllCharactersEndPointImpl..swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation
import Alamofire

class FetchAllCharactersEndPointImpl: FetchAllCharactersEndPoint {
    private var fetchCharactersQueryParameters: QueryParameters?
    
    func setFetchAllCharactersQueryParams(queryParams: QueryParameters) {
        self.fetchCharactersQueryParameters = queryParams
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
