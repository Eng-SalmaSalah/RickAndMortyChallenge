//
//  CustomAlertView.swift
//  RickAndMorty
//
//  Created by Salma Salah on 13/08/2024.
//

import UIKit

class CustomAlertView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var alertContainerView: UIView! {
        didSet {
            alertContainerView.setCornerRadius(radius: CornerRadius.small.rawValue)
        }
    }
    @IBOutlet weak var alertTitleLabel: UILabel!
    @IBOutlet weak var alertMessageLabel: UILabel!
       @IBOutlet weak var alertPrimaryButton: UIButton!
    
    private var primaryActionClosure: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        contentView = loadViewFromNib(CustomAlertView.nibName)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
    
    func configureWith(alertVM: CustomAlertViewModel) {
        alertTitleLabel.text = alertVM.alertTitle
        alertMessageLabel.text = alertVM.alertMessage
        alertPrimaryButton.setupButtonText(title: alertVM.alertPrimaryButtonTitle)
        self.primaryActionClosure = alertVM.alertPrimaryAction
    }
    
    @IBAction func didPressPrimaryButton(_ sender: UIButton) {
        if let primaryActionClosure = self.primaryActionClosure {
            removeFromSuperview()
            primaryActionClosure()
        }else {
            removeFromSuperview()
        }
    }
    
    @IBAction func didPressDismiss(_ sender: UIButton) {
        removeFromSuperview()
    }
}
