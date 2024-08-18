//
//  UITableView+ReloadingHelpers.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation
import UIKit

extension UITableView {
    func reloadTableRow(at rowIndex: Int, inSection sectionIndex: Int = 0) {
        guard sectionIndex < self.numberOfSections ,
              rowIndex < self.numberOfRows(inSection: sectionIndex) else { return }
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: rowIndex, section: sectionIndex)
            self.reloadRows(at: [indexPath], with: .none)
        }
    }
}
