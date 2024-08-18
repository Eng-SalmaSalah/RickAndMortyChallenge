//
//  QueryParameters.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation

struct QueryParameters {
    private var parameters: [String: Any]
    
    init(parameters: [String: Any]) {
        self.parameters = parameters
    }
    
    func queryString() -> String? {
        guard !parameters.isEmpty else { return nil }
        return parameters.map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
    }
}
