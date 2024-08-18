//
//  UIView+SubviewsHandlers.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit

extension UIView {
    func removeAllSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
    
    func addConstrainedSubview(subview: UIView) {
        self.addSubview(subview)
        subview.frame = self.frame
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: self.topAnchor),
            subview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            subview.widthAnchor.constraint(equalTo: self.widthAnchor)

        ])
    }
    
    func addTopConstrainedView(subview: UIView) {
        self.addSubview(subview)
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: self.topAnchor),
            subview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }

}
