//
//  FetchAllCharactersUseCase.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation

protocol FetchAllCharactersUseCase {
    func execute(paginator: Paginator,
                 characterStatus: Status?,
                 completion: @escaping (Result<ResponseDTO<[Character]?>, any Error>) -> Void)
}
