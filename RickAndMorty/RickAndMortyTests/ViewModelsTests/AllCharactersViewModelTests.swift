//
//  AllCharactersViewModelTests.swift
//  RickAndMorty
//
//  Created by Salma Salah on 17/08/2024.
//

import Foundation
import XCTest
@testable import RickAndMorty

final class AllCharactersViewModelTests: XCTestCase {
    private var sut: AllCharactersViewModel?
    
    override func setUp() {
        prepareSut()
    }

    override func tearDown() {
        sut = nil
    }
    
    private func prepareSut() {
        let mockedFetchAllCharactersUseCase = MockedFetchAllCharactersUseCase()
        sut = AllCharactersViewModel(fetchAllCharactersUseCase: mockedFetchAllCharactersUseCase)
    }
    
    //MARK: - test methods
    func testGetCharacters() {
        let expectedCharacters = MockedCharactersResponseProvider.getMockedCharactersResponse()?.results as? [Character]
        
        sut?.getCharacters(completion: nil)
        
        XCTAssertNotNil(sut?.charactersVMList)
        XCTAssertNotNil(sut?.charactersList)

        XCTAssertEqual(sut?.charactersVMList.count, expectedCharacters?.count)
       
        XCTAssertEqual(sut?.charactersVMList.first?.characterName, expectedCharacters?.first?.name)
        XCTAssertEqual(sut?.charactersVMList.first?.characterSpecies, expectedCharacters?.first?.species)

        XCTAssertEqual(sut?.charactersVMList.last?.characterName, expectedCharacters?.last?.name)
        XCTAssertEqual(sut?.charactersVMList.last?.characterSpecies, expectedCharacters?.last?.species)

    }
}
