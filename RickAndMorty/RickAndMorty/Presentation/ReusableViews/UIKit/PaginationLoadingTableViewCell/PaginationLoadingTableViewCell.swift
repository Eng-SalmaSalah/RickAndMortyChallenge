//
//  PaginationLoadingTableViewCell.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import UIKit
import NVActivityIndicatorView

class PaginationLoadingTableViewCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: NVActivityIndicatorView! {
        didSet {
            activityIndicator.type = .lineSpinFadeLoader
            activityIndicator.color = .mainBlue
        }
    }
    
    func startAnimating() {
        activityIndicator.startAnimating()
    }

    override func prepareForReuse() {
        activityIndicator.stopAnimating()
    }
}
