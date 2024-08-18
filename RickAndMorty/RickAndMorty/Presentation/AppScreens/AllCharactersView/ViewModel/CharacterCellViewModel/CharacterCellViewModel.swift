//
//  CharacterCellViewModel.swift
//  RickAndMorty
//
//  Created by Salma Salah on 16/08/2024.
//

import Foundation

class CharacterCellViewModel {
    let characterImageURL: String
    let characterName: String
    let characterSpecies: String
    
    init(characterImageURL: String, characterName: String, characterSpecies: String) {
        self.characterImageURL = characterImageURL
        self.characterName = characterName
        self.characterSpecies = characterSpecies
    }
}
