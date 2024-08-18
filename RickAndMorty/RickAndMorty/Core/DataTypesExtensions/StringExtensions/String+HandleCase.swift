//
//  String+HandleCase.swift
//  RickAndMorty
//
//  Created by Salma Salah on 16/08/2024.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        guard let firstLetter = self.first else {
            return self
        }
        return firstLetter.uppercased() + self.dropFirst()
    }
}
