//
//  SplashViewController.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet private weak var whiteCircleView: UIView!
    @IBOutlet private weak var appLogoImageView: UIImageView!
    
    var coordinatorDelegate: SplashVCCoordinatorDelegate?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    required init() {
        super.init(nibName: SplashViewController.xibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whiteCircleView.setCornerRadius(radius: CornerRadius.splashLogo.rawValue)
        startAnimation()
    }
    
    private func startAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            UIView.animate(withDuration: 1.5, animations: {
                let scale = UIScreen.main.bounds.width / 100
                let transform = CGAffineTransform(scaleX: scale, y: scale)
                self.whiteCircleView.transform = transform
            }) { (_) in
                // Animation completed, move to the next screen
                self.coordinatorDelegate?.didFinishSplash()
            }
        }
    }

}
