//
//  PauseVC + Action.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation
import UIKit

//MARK: - Action
extension PauseViewController {
    public func setupButtons() {
        resumeButton = pauseView.resumeButton
        homeButton = pauseView.homeButton
        usagePolicyButton = pauseView.usagePolicyButton
        rateAppButton = pauseView.rateAppButton
        shareAppButton = pauseView.shareAppButton
        
        resumeButton.addTarget(self, action: #selector(resumePressed), for: .touchUpInside)
        homeButton.addTarget(self, action: #selector(homePressed), for: .touchUpInside)
        usagePolicyButton.addTarget(self, action: #selector(usagePolicyPressed), for: .touchUpInside)
        rateAppButton.addTarget(self, action: #selector(rateAppPressed), for: .touchUpInside)
        shareAppButton.addTarget(self, action: #selector(shareAppPressed), for: .touchUpInside)
    }
    
    
    @objc
    func resumePressed() {
        AudioManager.shared.buttonClickEffect()
        delegate?.resumeGame()
        self.dismiss(animated: true)
    }
    
    @objc
    func homePressed() {
        AudioManager.shared.buttonClickEffect()
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.switchToMainScreen()
        }
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
