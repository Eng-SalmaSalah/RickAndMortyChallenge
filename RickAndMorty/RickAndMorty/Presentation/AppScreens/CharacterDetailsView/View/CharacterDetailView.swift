//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Salma Salah on 16/08/2024.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    var onBackSelected: (() -> Void)

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .topLeading) {
                    CharacterImageView(characterImageURL: character.image,
                                       size: CGSize(width: geometry.size.width, height: geometry.size.height * 0.55),
                                       cornerRadius: CornerRadius.veryLarge.rawValue,
                                       roundBottomOnly: true)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.55)
                    .edgesIgnoringSafeArea(.top)
                    
                    Button(action: {
                        onBackSelected()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                    .padding(.top, 24)
                    .padding(.leading, 16)
                }
                
                HStack(alignment: .center, spacing: 0) {
                    Text(character.name)
                        .font(.system(size: AppFontSize.mediumTitle.rawValue, weight: .bold))
                    .padding(.leading, 18)
                                        
                    CharacterStatusLabelView(statusText: character.status.rawValue.capitalizingFirstLetter())
                    .padding(.trailing, 18)
                }
                .padding(.bottom, 8)
                
                CharacterInfoView(gender: character.gender.rawValue.capitalizingFirstLetter(), species: character.species)
                .padding(.leading, 18)
                .padding(.bottom, 38)

                
                CharacterLocationView(location: character.location.name)
                .padding(.horizontal, 18)
            }
        }
    }
}

#Preview {
    let character = Character(id: 1, name: "Zephyr", image: "", species: "elf", status: .alive, gender: .male, location: Location(name: "earth"))
    return CharacterDetailView(character: character, onBackSelected: {})
}
