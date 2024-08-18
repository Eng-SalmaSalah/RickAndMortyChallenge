//
//  CharacterInfoView.swift
//  RickAndMorty
//
//  Created by Salma Salah on 16/08/2024.
//

import SwiftUI

struct CharacterInfoView: View {
    let gender: String
    let species: String
    
    var body: some View {
        HStack {
            Text(species)
                .font(.system(size: AppFontSize.smallTitle.rawValue, weight: .semibold))
                .foregroundColor(.darkPurple)
            
            Text("•")
                .font(.system(size: AppFontSize.smallTitle.rawValue, weight: .semibold))
                .foregroundColor(.darkPurple)
            
            Text(gender)
                .font(.system(size: AppFontSize.smallTitle.rawValue, weight: .semibold))
                .foregroundColor(.gray)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    CharacterInfoView(gender: "Male", species: "Elf")
}
