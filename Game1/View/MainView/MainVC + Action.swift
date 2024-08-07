//
//  MainVC + Action.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation
import UIKit

//MARK: Action
extension MainViewController {
    public func setupButtons() {
        settingButton = mainView.settingButton
        playButton = mainView.playButton
        levelsButton = mainView.levelsButton
        
        settingButton.addTarget(self, action: #selector(settingPressed), for: .touchUpInside)
        levelsButton.addTarget(self, action: #selector(levelsPressed), for: .touchUpInside)
        playButton.addTarget(self, action: #selector(playPressed), for: .touchUpInside)
    }
    
    @objc
    func settingPressed() {
        let settingVC = SettingsViewController()
        settingVC.modalTransitionStyle = .crossDissolve
        settingVC.modalPresentationStyle = .fullScreen
        self.present(settingVC, animated: true, completion: nil)
    }
    
    @objc
    func levelsPressed() {
        let levelsVC = LevelsViewController()
        levelsVC.modalTransitionStyle = .crossDissolve
        levelsVC.modalPresentationStyle = .fullScreen
        self.present(levelsVC, animated: true, completion: nil)
    }
    
    @objc
    func playPressed() {
        let gameVC = GameViewController()
        gameVC.currentLevel = LevelManager.shared.getLastUnlockedLevel()?.levelNumber ?? 1
        gameVC.modalPresentationStyle = .overCurrentContext
        gameVC.modalTransitionStyle = .crossDissolve
        present(gameVC, animated: true, completion: nil)
    }
    
}
