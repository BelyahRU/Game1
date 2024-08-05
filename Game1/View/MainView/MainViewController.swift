//
//  MainViewController.swift
//  Game1
//
//  Created by Александр Андреев on 01.08.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    private var settingButton: UIButton!
    private var playButton: UIButton!
    private var levelsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    private func configure() {
        setupButtons()
        setupUI()
        setupTargets()
    }
    
    private func setupUI() {
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

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
