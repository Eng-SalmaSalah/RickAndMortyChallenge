//
//  UIViewController+CreationHelpers.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit

extension UIViewController {
    static var xibName: String {
        return String(describing: self)
    }
}
