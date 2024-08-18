//
//  CustomAlertViewModel.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import Foundation

class CustomAlertViewModel {
    let alertTitle: String
    let alertMessage: String
    let alertPrimaryButtonTitle: String
    let alertPrimaryAction: (() -> Void)?
    
    init(alertTitle: String, 
         alertMessage: String,
         alertPrimaryButtonTitle: String = "btn_Ok".localized,
         alertPrimaryAction: (() -> Void)? = nil) {
        self.alertTitle = alertTitle
        self.alertMessage = alertMessage
        self.alertPrimaryButtonTitle = alertPrimaryButtonTitle
        self.alertPrimaryAction = alertPrimaryAction
    }
}
