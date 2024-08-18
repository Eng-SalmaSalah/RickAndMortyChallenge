//
//  CharacterCellContentView.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import SwiftUI
struct CharacterCellContentView: View {
    let characterCellVM: CharacterCellViewModel
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            CharacterImageView(characterImageURL: characterCellVM.characterImageURL,
                               size: CGSize(width: 86, height: 86),
                               cornerRadius: CornerRadius.regular.rawValue,
                               roundBottomOnly: false)
            
            VStack(alignment: .leading, spacing: 8) {
                // Character Name
                Text(characterCellVM.characterName)
                    .font(.system(size: AppFontSize.smallTitle.rawValue, weight: .bold))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                
                // Character Species
                Text(characterCellVM.characterSpecies)
                    .font(.system(size: AppFontSize.large.rawValue, weight: .semibold))
                    .foregroundColor(.darkPurple)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
        }
    }
}


#Preview {
    let characterCellVM = CharacterCellViewModel(characterImageURL: "", characterName: "Zeypher", characterSpecies: "Human")
    return CharacterCellContentView(characterCellVM: characterCellVM)
}
