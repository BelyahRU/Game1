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
    var shopButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        ShopManager.shared.resetPurchases()
//        LevelManager.shared.addCoins(200000)
        configure()
        
    }
    
    // MARK: - Methods
    private func configure() {
        setupCoins()
        setupButtons()
        setupUI()
    }
    
    private func setupCoins() {
        let coins = LevelManager.shared.getTotalCoins()
        mainView.coinsLabel.text = "\(coins)"
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

