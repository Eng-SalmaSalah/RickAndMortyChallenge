//
//  UIButton+Styling.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation
import UIKit

extension UIButton {
    func setupButtonText(title: String, 
                         titleColor: UIColor = .white,
                         titleFont: UIFont = .systemFont(ofSize: AppFontSize.regular.rawValue),
                         buttonColor: UIColor = .mainBlue,
                         cornerRadius: CGFloat = CornerRadius.small.rawValue,
                         isUnderlined: Bool = false) {
        backgroundColor = buttonColor
        if cornerRadius > 0 {
            setCornerRadius(radius: cornerRadius)
        }
        let attributedTitle = title.getAttributedString(textColor: titleColor,
                                                        font: titleFont,
                                                        isUnderlined: isUnderlined)
        setAttributedTitle(attributedTitle, for: .normal)
    }
}
