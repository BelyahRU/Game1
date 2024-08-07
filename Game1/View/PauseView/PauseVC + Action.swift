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
        
        resumeButton.addTarget(self, action: #selector(resumePressed), for: .touchUpInside)
        homeButton.addTarget(self, action: #selector(homePressed), for: .touchUpInside)
    }
    
    
    @objc
    func resumePressed() {
        delegate?.resumeGame()
        self.dismiss(animated: true)
    }
    
    @objc
    func homePressed() {
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.switchToMainScreen()
        }
    }
}
