//
//  ViewControllerFactory.swift
//  RickAndMorty
//
//  Created by Salma Salah on 15/08/2024.
//

import Foundation
import UIKit

protocol ViewControllerFactory {
    associatedtype ViewController: UIViewController
    associatedtype ViewControllerArguments
    associatedtype VCCoordinatorDelegate

    static func createViewController(arguments: ViewControllerArguments,
                                     coordinatorDelegate: VCCoordinatorDelegate) -> ViewController
}
