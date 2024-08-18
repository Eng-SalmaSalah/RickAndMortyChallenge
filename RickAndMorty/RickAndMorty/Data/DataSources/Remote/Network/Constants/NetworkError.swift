//
//  NetworkError.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation

enum AppError: Error {
    case serverError(message: String, errorCode: String)
    case rechabilityError(message: String)
}
