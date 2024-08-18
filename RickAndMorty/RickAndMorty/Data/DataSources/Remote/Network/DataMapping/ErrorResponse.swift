//
//  ErrorResponse.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation

struct ErrorResponse: Codable, Error {
    let timestamp: String
    let status: Int
    let error: String
    let path: String
    
    var errorMessage: Error {
        return NSError(domain: "", code: status, userInfo: [NSLocalizedDescriptionKey: error])
    }
}
