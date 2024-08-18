//
//  FetchAllCharactersEndPoint.swift
//  RickAndMorty
//
//  Created by Salma Salah on 18/08/2024.
//

import Foundation

protocol FetchAllCharactersEndPoint: Endpoint {
    func setFetchAllCharactersQueryParams(queryParams: QueryParameters)
}
