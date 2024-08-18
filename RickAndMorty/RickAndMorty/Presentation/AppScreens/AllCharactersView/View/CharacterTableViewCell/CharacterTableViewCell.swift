//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Salma Salah on 16/08/2024.
//

import UIKit
import SwiftUI

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var frameView: UIView! {
        didSet {
            frameView.setupWith(cornerRadius: CornerRadius.large.rawValue,
                                borderColor: .lightGrey,
                                borderWidth: BorderWidth.small.rawValue)
        }
    }
    @IBOutlet weak var cellContentView: UIView!
    
    private var hostingController: UIHostingController<CharacterCellContentView>?

       func configure(with characterCellVM: CharacterCellViewModel) {
           let characterCellContentView = CharacterCellContentView(characterCellVM: characterCellVM)

           if hostingController == nil {
               hostingController = UIHostingController(rootView: characterCellContentView)
               guard let hostingController = hostingController else { return }
               cellContentView.addConstrainedSubview(subview: hostingController.view)
           } else {
               hostingController?.rootView = characterCellContentView
           }
       }
}
