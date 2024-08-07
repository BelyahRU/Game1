//
//  LevelsVC + Action.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation
import UIKit

//MARK: Action
extension LevelsViewController {
    public func setupButton() {
        cancelButton = levelsView.cancelButton
        cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
    }
    
    @objc
    func cancelPressed() {
        AudioManager.shared.buttonClickEffect()
        self.dismiss(animated: true)
    }
}

