//
//  ResponseDTO.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation

struct ResponseDTO<T: Codable>: Codable {
    let info: PageInfoDTO?
    let results: T?
}

struct PageInfoDTO: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

