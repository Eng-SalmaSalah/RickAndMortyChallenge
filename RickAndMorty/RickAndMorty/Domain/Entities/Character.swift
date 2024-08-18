//
//  Character.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let image: String
    let species: String
    let status: Status
    let gender: Gender
    let location: Location
}
