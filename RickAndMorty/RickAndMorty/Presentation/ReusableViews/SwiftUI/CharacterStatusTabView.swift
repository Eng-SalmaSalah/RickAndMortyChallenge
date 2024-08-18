//
//  CharacterStatusTabView.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import SwiftUI

struct CharacterStatusTabView: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title.capitalizingFirstLetter())
                .font(.system(size: AppFontSize.large.rawValue, weight: .semibold))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .foregroundColor(.black)
                .background(isSelected ? Color.mediumGrey : Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke( Color("mediumGrey"), lineWidth: 2)
                )
            .fixedSize()
        }
    }
}

#Preview {
    CharacterStatusTabView(title: "Unknown",
                           isSelected: false) {
        print("alive")
    }
}
