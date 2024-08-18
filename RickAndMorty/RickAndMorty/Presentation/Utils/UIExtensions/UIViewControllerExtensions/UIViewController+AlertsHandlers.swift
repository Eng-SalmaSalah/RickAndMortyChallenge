//
//  UIViewController+AlertsHandlers.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(alertView: CustomAlertView) {
        view.addConstrainedSubview(subview: alertView)
    }
    
    func removeErrorView(_ errorView: UIView) {
        errorView.removeFromSuperview()
    }
}
