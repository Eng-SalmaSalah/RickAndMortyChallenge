//
//  Router.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit

protocol Router: AnyObject {
    var navigationController: UINavigationController { get set }
        
    func present(_ module: Presentable, animated: Bool, presentationStyle: UIModalPresentationStyle, completion: (() -> Void)?)

    func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?)
    
    func setRootModule(_ module: Presentable, animated: Bool, completion: (() -> Void)?)
    
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    
    func popModule(animated: Bool, completion: (() -> Void)?)
    
    func resetNavigationStack()
}

