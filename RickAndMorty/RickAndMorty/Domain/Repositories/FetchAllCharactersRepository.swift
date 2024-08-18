//
//  FetchAllCharactersRepository.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation

protocol FetchAllCharactersRepository {
    func fetchAllCharacters(paginator: Paginator,
                            characterStatus: Status?,
                            completion: @escaping (Response<[Character]?>))
}
