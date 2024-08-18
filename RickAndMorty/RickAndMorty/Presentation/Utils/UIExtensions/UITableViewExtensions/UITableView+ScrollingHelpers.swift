//
//  UITableView+ScrollingHelpers.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation
import UIKit

extension UITableView {
    func scrollToTop() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if self.numberOfSections > 0, self.numberOfRows(inSection: 0) > 0 {
                self.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            } else {
                self.setContentOffset(.zero, animated: true)
            }
        }
    }
}
