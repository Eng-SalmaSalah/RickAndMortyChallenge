//
//  UIViewController+LoadingHandlers.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit
import Combine

extension UIViewController {
    private var overlayTag: Int { return 999 }

    func bindLoadingState(showLoadingPublisher: AnyPublisher<Bool, Never>) -> AnyCancellable {
        return showLoadingPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] showLoading in
                guard let self = self else { return }
                if showLoading {
                    self.startLoading()
                } else {
                    self.stopLoading()
                }
            }
    }
    
    func startLoading(in frame: CGRect = UIScreen.main.bounds) {
        self.startActivityIndicator(frame: frame)
    }
    
    func stopLoading() {
        self.stopActivityIndicator()
    }
   
    private func startActivityIndicator(frame: CGRect) {
        DispatchQueue.main.async {
            let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
            activityIndicator.style = .large
            activityIndicator.color = .mainBlue
            activityIndicator.startAnimating()
            
            let overlayView = UIView(frame: frame)
            overlayView.tag = self.overlayTag
            
            overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            overlayView.addSubview(activityIndicator)
            
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            activityIndicator.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor).isActive = true
            activityIndicator.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor).isActive = true
            
            self.view.addSubview(overlayView)
        }
    }
    
    private func stopActivityIndicator() {
        DispatchQueue.main.async {
            if let overlayView = self.view.subviews.first(where: { $0.tag == self.overlayTag }) {
                overlayView.removeFromSuperview()
            }
        }
    }
}

