//
//  MainViewController.swift
//  Game1
//
//  Created by Александр Андреев on 01.08.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    let mainView = MainView()
    
    var settingButton: UIButton!
    var playButton: UIButton!
    var levelsButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    // MARK: - Methods
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

