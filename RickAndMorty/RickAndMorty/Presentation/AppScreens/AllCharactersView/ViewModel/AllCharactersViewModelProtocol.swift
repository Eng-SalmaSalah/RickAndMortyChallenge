//
//  AllCharactersViewModelProtocol.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation
import Combine

protocol AllCharactersViewModelProtocol {
    var showLoadingPublisher: AnyPublisher<Bool, Never> { get }
    var reloadCharactersTablePublisher: AnyPublisher<Void, Never> { get }
    var showErrorPublisher: AnyPublisher<Error, Never> { get }

    var charactersVMList: [CharacterCellViewModel] { get }
    var charactersList: [Character] { get }
    var hasMoreToLoad: Bool { get }
    var selectedStatus: Status? { get set }
    var shouldShowLoading: Bool { get }
    var statusFilters: [Status] { get }
    func getCharacters(completion: (() -> Void)?)
}
