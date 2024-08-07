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
        shopButton = mainView.shopButton
        
        settingButton.addTarget(self, action: #selector(settingPressed), for: .touchUpInside)
        levelsButton.addTarget(self, action: #selector(levelsPressed), for: .touchUpInside)
        playButton.addTarget(self, action: #selector(playPressed), for: .touchUpInside)
        shopButton.addTarget(self, action: #selector(shopPressed), for: .touchUpInside)
    }
    
    @objc
    func settingPressed() {
        AudioManager.shared.buttonClickEffect()
        let settingVC = SettingsViewController()
        settingVC.modalTransitionStyle = .crossDissolve
        settingVC.modalPresentationStyle = .fullScreen
        self.present(settingVC, animated: true, completion: nil)
    }
    
    @objc
    func levelsPressed() {
        AudioManager.shared.buttonClickEffect()
        let levelsVC = LevelsViewController()
        levelsVC.modalTransitionStyle = .crossDissolve
        levelsVC.modalPresentationStyle = .fullScreen
        self.present(levelsVC, animated: true, completion: nil)
    }
    
    @objc
    func playPressed() {
        AudioManager.shared.buttonClickEffect()
        let gameVC = GameViewController()
        gameVC.currentLevel = LevelManager.shared.getLastUnlockedLevel()?.levelNumber ?? 1
        gameVC.modalPresentationStyle = .overCurrentContext
        gameVC.modalTransitionStyle = .crossDissolve
        present(gameVC, animated: true, completion: nil)
    }
    
    @objc
    func shopPressed() {
        AudioManager.shared.buttonClickEffect()
        let shopVC = ShopViewController()
        shopVC.modalTransitionStyle = .crossDissolve
        shopVC.modalPresentationStyle = .fullScreen
        self.present(shopVC, animated: true, completion: nil)
    }
    
}
