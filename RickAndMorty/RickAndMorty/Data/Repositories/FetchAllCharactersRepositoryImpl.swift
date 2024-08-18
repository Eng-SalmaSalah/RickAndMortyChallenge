//
//  FetchAllCharactersRepositoryImpl.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation

class FetchAllCharactersRepositoryImpl: FetchAllCharactersRepository {
    private var fetchAllCharactersEndPoint: FetchAllCharactersEndPoint
    
    init(fetchAllCharactersEndPoint: FetchAllCharactersEndPoint) {
        self.fetchAllCharactersEndPoint = fetchAllCharactersEndPoint
    }
    
    func fetchAllCharacters(paginator: Paginator,
                            characterStatus: Status?,
                            completion: @escaping (Response<[Character]?>)) {
        let queryParams = getQueryParams(paginator: paginator, characterStatus: characterStatus)
        fetchAllCharactersEndPoint.setFetchAllCharactersQueryParams(queryParams: queryParams)
        fetchAllCharactersEndPoint.request(completion: completion)
    }
    
    private func getQueryParams(paginator: Paginator,
                                characterStatus: Status?) -> QueryParameters {
        var queryParamsDict = [String: Any]()
        queryParamsDict["page"] = paginator.currentPageNumber
        if let status = characterStatus {
            queryParamsDict["status"] = status
        }
        return QueryParameters(parameters: queryParamsDict)
    }
}
