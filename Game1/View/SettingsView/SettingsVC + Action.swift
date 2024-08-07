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
        usagePolicyButton = settingView.usagePolicyButton
        rateAppButton = settingView.rateAppButton
        shareAppButton = settingView.shareAppButton
        
        cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        usagePolicyButton.addTarget(self, action: #selector(usagePolicyPressed), for: .touchUpInside)
        rateAppButton.addTarget(self, action: #selector(rateAppPressed), for: .touchUpInside)
        shareAppButton.addTarget(self, action: #selector(shareAppPressed), for: .touchUpInside)
    }
    
    @objc
    func cancelPressed() {
        AudioManager.shared.buttonClickEffect()
        self.dismiss(animated: true)
    }
    
    @objc
    func usagePolicyPressed() {
        AudioManager.shared.buttonClickEffect()
        if let url = URL(string: "https://www.termsfeed.com/live/811cf998-8d8b-4665-a03b-505a8c35c34d") {
                UIApplication.shared.open(url)
            }
    }
    
    @objc
    func rateAppPressed() {
        AudioManager.shared.buttonClickEffect()
    }
    
    @objc
    func shareAppPressed() {
        AudioManager.shared.buttonClickEffect()
    }
}
