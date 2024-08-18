//
//  UIView+CreationHelpers.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit

extension UIView {
    static var nibName: String {
        return String(describing: self)
    }
    
    func loadViewFromNib(_ nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
}
