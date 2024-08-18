//
//  UITableViewCell+CreationHelpers.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var reuseID: String {
        return String(describing: self)
    }
}
