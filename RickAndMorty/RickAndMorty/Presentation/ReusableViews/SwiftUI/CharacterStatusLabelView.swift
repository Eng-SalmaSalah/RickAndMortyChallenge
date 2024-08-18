//
//  CharacterStatusLabelView.swift
//  RickAndMorty
//
//  Created by Salma Salah on 16/08/2024.
//

import SwiftUI

struct CharacterStatusLabelView: View {
    let statusText: String
    
    var body: some View {
        Text(statusText)
            .font(.system(size: AppFontSize.smallTitle.rawValue, weight: .semibold))
            .foregroundColor(.black)
            .padding(.horizontal, 18)
            .padding(.vertical, 10)
            .background(.brightBlue)
            .cornerRadius(CornerRadius.veryLarge.rawValue)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
}

#Preview {
    CharacterStatusLabelView(statusText: "Unknown")
}
