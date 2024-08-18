//
//  CharacterLocationView.swift
//  RickAndMorty
//
//  Created by Salma Salah on 16/08/2024.
//

import SwiftUI

struct CharacterLocationView: View {
    let location: String
    
    var body: some View {
        HStack (alignment: .top){
            Text("locationTitle".localized)
                .font(.system(size: AppFontSize.smallTitle.rawValue, weight: .semibold))

            
            Text(location)
                .font(.system(size: AppFontSize.smallTitle.rawValue, weight: .semibold))
                .foregroundColor(.darkPurple)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    CharacterLocationView(location: "Earth")
}
