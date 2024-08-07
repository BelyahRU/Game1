//
//  SettingsVC + Action.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation
import UIKit

//MARK: Action
extension SettingsViewController {
    public func setupButtons() {
        cancelButton = settingView.cancelButton
        cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
    }
    
    @objc
    func cancelPressed() {
        self.dismiss(animated: true)
    }
}
