//
//  CharacterImageView.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import SwiftUI
import Kingfisher

struct CharacterImageView: View {
    let characterImageURL: String
    let size: CGSize
    let cornerRadius: CGFloat
    let roundBottomOnly: Bool
    
    var body: some View {
        if let url = URL(string: characterImageURL) {
            KFImage(url)
                .placeholder {
                    ProgressView()
                        .frame(width: size.width, height: size.height)
                }
                .resizable()
                .scaledToFill()
                .frame(width: size.width, height: size.height)
                .clipShape(
                    .rect(
                        topLeadingRadius: roundBottomOnly ? 0 : cornerRadius,
                        bottomLeadingRadius: cornerRadius,
                        bottomTrailingRadius: cornerRadius,
                        topTrailingRadius: roundBottomOnly ? 0 : cornerRadius
                    )
                )
        }
    }
}

#Preview {
    CharacterImageView(characterImageURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                       size: CGSize(width: 30, height: 30),
                       cornerRadius: 62,
                       roundBottomOnly: false)
}
