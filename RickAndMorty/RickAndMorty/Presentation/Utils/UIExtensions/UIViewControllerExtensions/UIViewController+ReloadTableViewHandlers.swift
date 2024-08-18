//
//  UIViewController+ReloadTableViewHandlers.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit
import Combine

extension UIViewController {
    func bindTableReload(tableView: UITableView, reloadPublisher: AnyPublisher<Void, Never>) -> AnyCancellable {
        return reloadPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak tableView] in
                tableView?.isHidden = false
                tableView?.reloadData()
            }
    }
}
