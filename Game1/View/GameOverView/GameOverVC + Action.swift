//
//  GameOverVC + Action.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation
import UIKit

// MARK: - Action
extension GameOverViewController {
    func setupButtons() {
        homeButton = gameOverView.homeButton
        homeButton.addTarget(self, action: #selector(homePressed), for: .touchUpInside)
    }
    
    @objc
    func homePressed() {
        AudioManager.shared.buttonClickEffect()
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            
                    sceneDelegate.switchToMainScreen()
                }
    }
}
