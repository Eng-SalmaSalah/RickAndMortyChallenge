//
//  CharacterStatusFilterView.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import SwiftUI

struct CharacterStatusFilterView: View {
    let statuses: [Status]
    @State private var selectedFilter: Status?
    var onStatusSelected: ((Status) -> Void)?
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(statuses, id: \.self) { status in
                CharacterStatusTabView(
                    title: status.rawValue,
                    isSelected: selectedFilter == status,
                    action: {
                        selectedFilter = status
                        onStatusSelected?(status)
                    }
                )
                .onTapGesture {
                    selectedFilter = status
                }
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}

#Preview {
    CharacterStatusFilterView(statuses: Status.allCases)
}
