//
//  String+Attributed.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation
import UIKit

extension String {
    func getAttributedString(textColor: UIColor,
                             font: UIFont,
                             isUnderlined: Bool) -> NSAttributedString {
        var attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: textColor,
            .font: font
        ]
        
        if isUnderlined {
            attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
        }
        
        return NSAttributedString(string: self, attributes: attributes)
    }
}
