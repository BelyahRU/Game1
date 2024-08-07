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
    }
    
    public func setupTargets() {
        settingButton.addTarget(self, action: #selector(settingPressed), for: .touchUpInside)
        levelsButton.addTarget(self, action: #selector(levelsPressed), for: .touchUpInside)
        
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
}
