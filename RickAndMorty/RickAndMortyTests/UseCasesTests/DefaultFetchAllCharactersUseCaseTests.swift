//
//  DefaultFetchAllCharactersUseCaseTests.swift
//  RickAndMorty
//
//  Created by Salma Salah on 17/08/2024.
//

import Foundation
import XCTest
@testable import RickAndMorty

final class DefaultFetchAllCharactersUseCaseTests: XCTestCase {
    private var sut: DefaultFetchAllCharactersUseCase?
    
    override func setUp() {
        prepareSut()
    }

    override func tearDown() {
        sut = nil
    }
    
    private func prepareSut() {
        let mockedFetchAllCharactersRepository = MockedFetchAllCharactersRepository()
        sut = DefaultFetchAllCharactersUseCase(repo: mockedFetchAllCharactersRepository)
    }
    
    //MARK: - test methods
    func testExecute() {
        sut?.execute(paginator: Paginator(),
                     characterStatus: nil,
                     completion: { [weak self] result in
            guard let self = self else {
                XCTFail("Sut failed to get characters")
                return
            }
            switch result {
            case .success(let charactersResponse):
                if let characters = charactersResponse.results as? [Character] {
                    self.validateResponse(characters: characters)
                }else {
                    XCTFail("Sut failed to get characters")
                }
            case .failure(_):
                XCTFail("Sut failed to get characters")
            }
        })
    }
    
    private func validateResponse(characters: [Character]) {
        let charactersResult = characters
        let expectedCharacters = MockedCharactersResponseProvider.getMockedCharactersResponse()?.results as? [Character]

        XCTAssertEqual(charactersResult.count, expectedCharacters?.count)
       
        XCTAssertEqual(charactersResult.first?.name, expectedCharacters?.first?.name)
        XCTAssertEqual(charactersResult.first?.id, expectedCharacters?.first?.id)
        XCTAssertEqual(charactersResult.first?.species, expectedCharacters?.first?.species)

        XCTAssertEqual(charactersResult.last?.name, expectedCharacters?.last?.name)
        XCTAssertEqual(charactersResult.last?.id, expectedCharacters?.last?.id)
        XCTAssertEqual(charactersResult.last?.species, expectedCharacters?.last?.species)
    }
}
