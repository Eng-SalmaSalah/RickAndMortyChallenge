//
//  UIViewController+ErrorHandlers.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit
import Combine

extension UIViewController {
    func bindUIErrorState(showErrorPublisher: AnyPublisher<Error, Never>) -> AnyCancellable {
        return showErrorPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.showError(error: error)
            }
    }
    
    func showError(error: Error , alertPrimaryAction: (() -> Void)? = nil) {
        showAlertError(errorMessage: error.localizedDescription, alertPrimaryAction: alertPrimaryAction)
    }

    private func showAlertError(errorMessage: String, alertPrimaryAction: (() -> Void)?) {
        let alertVM = CustomAlertViewModel(alertTitle: "errorAlertTitle".localized,
                                           alertMessage: errorMessage,
                                           alertPrimaryButtonTitle: "btn_Ok".localized,
                                           alertPrimaryAction: alertPrimaryAction)
        let customAlert = CustomAlertView()
        customAlert.configureWith(alertVM: alertVM)
        self.showAlert(alertView: customAlert)
    }
}
