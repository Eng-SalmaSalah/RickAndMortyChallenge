//
//  AllCharactersViewController.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import UIKit
import SwiftUI
import Combine

class AllCharactersViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "charactersTitle".localized
        }
    }
    
    @IBOutlet weak var statusTabsView: UIView!
    @IBOutlet weak var charactersTableView: UITableView!
    
    var coordinatorDelegate: AllCharactersVCCoordinatorDelegate?
    private var cancellables = Set<AnyCancellable>()
    private var viewModel: AllCharactersViewModelProtocol
        
    required init(viewModel: AllCharactersViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: AllCharactersViewController.xibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStatusFilterView()
        setupTableView()
        bindViewModel()
        viewModel.getCharacters(completion: nil)
    }
    
    private func setupStatusFilterView() {
        let characterStatusFilterView = CharacterStatusFilterView(statuses: viewModel.statusFilters) { [weak self] status in
            guard let self = self else { return }
            viewModel.selectedStatus = status
            self.viewModel.getCharacters { [weak self] in
                guard let self = self else { return }
                self.charactersTableView.scrollToTop()
            }
        }
        let swiftUIView = UIHostingController(rootView: characterStatusFilterView)
        addChild(swiftUIView)
        statusTabsView.addSubview(swiftUIView.view)
        statusTabsView.addConstrainedSubview(subview: swiftUIView.view)
        swiftUIView.didMove(toParent: self)
    }
    
    private func setupTableView(){
        charactersTableView.register(UINib(nibName: CharacterTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CharacterTableViewCell.reuseID)
        charactersTableView.register(UINib(nibName: PaginationLoadingTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: PaginationLoadingTableViewCell.reuseID)
        charactersTableView.rowHeight = UITableView.automaticDimension
        charactersTableView.estimatedRowHeight = 88
    }
    
    private func bindViewModel() {
        bindLoadingState(showLoadingPublisher: viewModel.showLoadingPublisher).store(in: &cancellables)
        bindTableReload(tableView: charactersTableView, reloadPublisher: viewModel.reloadCharactersTablePublisher).store(in: &cancellables)
        bindUIErrorState(showErrorPublisher: viewModel.showErrorPublisher).store(in: &cancellables)
    }
    
    private func showCharacterDetails(atIndex index: Int) {
        guard let characterToShow = viewModel.charactersList[safe: index] else { return }
        coordinatorDelegate?.goToCharacterDetails(character: characterToShow)
    }
}

extension AllCharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.charactersVMList.count + (viewModel.hasMoreToLoad ? 1 : 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < viewModel.charactersVMList.count  {
            return configureCharacterCell(for: tableView, at: indexPath)
        } else {
            if viewModel.charactersVMList.count != 0 {
                return configureLoadingCell(for: tableView, at: indexPath)
            }else {
                return UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.charactersVMList.count {
            viewModel.getCharacters(completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showCharacterDetails(atIndex: indexPath.row)
    }
    
    private func configureCharacterCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let reuseID = CharacterTableViewCell.reuseID
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? CharacterTableViewCell,
              let cellVM = viewModel.charactersVMList[safe: indexPath.row]
        else { return UITableViewCell() }
        cell.configure(with: cellVM)
        return cell
    }

    private func configureLoadingCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let reuseID = PaginationLoadingTableViewCell.reuseID
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? PaginationLoadingTableViewCell
        else { return UITableViewCell() }
        cell.startAnimating()
        return cell
    }
}
