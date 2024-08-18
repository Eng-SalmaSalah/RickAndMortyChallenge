//
//  MockedCharactersDataProvider.swift
//  RickAndMorty
//
//  Created by Salma Salah on 17/08/2024.
//

import Foundation
@testable import RickAndMorty

final class MockedCharactersDataProvider {
    static func getMockedAllCharactersData() -> Data? {
        guard let url = Bundle(for: MockedCharactersDataProvider.self).url(forResource: "MockedAllCharactersResponse", withExtension: "json") else {
            print("Mocked JSON file not found.")
            return nil}
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
