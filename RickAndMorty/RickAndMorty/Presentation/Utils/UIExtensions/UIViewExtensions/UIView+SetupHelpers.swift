//
//  UIView+SetupHelpers.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit

extension UIView {
    func setCornerRadius(radius: CGFloat){
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func setupWith(cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.masksToBounds = true
    }
}
