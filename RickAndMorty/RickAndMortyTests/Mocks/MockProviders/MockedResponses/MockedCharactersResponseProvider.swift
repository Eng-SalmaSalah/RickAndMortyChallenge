//
//  MockedCharactersResponseProvider.swift
//  RickAndMorty
//
//  Created by Salma Salah on 17/08/2024.
//

import Foundation
@testable import RickAndMorty

final class MockedCharactersResponseProvider {
    static func getMockedCharactersResponse() -> ResponseDTO<[Character]?>? {
        guard let url = Bundle(for: MockedCharactersResponseProvider.self).url(forResource: "MockedAllCharactersResponse", withExtension: "json") else {
            print("Mocked JSON file not found.")
            return nil}
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let charactersResponse = try decoder.decode(ResponseDTO<[Character]?>.self, from: data)
            return charactersResponse
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
