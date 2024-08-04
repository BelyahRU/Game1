//
//  MainViewController.swift
//  Game1
//
//  Created by Александр Андреев on 01.08.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
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
    public func setupTargets() {
//        mainView.settingButton.addTarget(self, action: #selector(settingPressed), for: .touchUpInside)
        mainView.settingsButtonCompletion = { [weak self] in
            guard let self else { return }
            self.settingPressed()
            
        }
    }
    
    func settingPressed() {
        let settingVC = SettingsViewController() 
        settingVC.modalTransitionStyle = .crossDissolve
        settingVC.modalPresentationStyle = .fullScreen
        self.present(settingVC, animated: true, completion: nil)
    }
}
