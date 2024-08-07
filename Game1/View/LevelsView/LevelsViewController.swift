//
//  LevelsViewController.swift
//  Game1
//
//  Created by Александр Андреев on 04.08.2024.
//

import Foundation
import UIKit
class LevelsViewController: UIViewController {
    
    // MARK: - Properties
    let levelsView = LevelsView()
    let viewModel = LevelsViewModel()
    var cancelButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Methods
    private func configure() {
        setupCoins()
        setupUI()
        setupCollectionView()
        setupButton()
        animateViews()
    }
    
    private func setupCoins() {
        levelsView.coinsLabel.text = "\(LevelManager.shared.getTotalCoins())"
    }
    
    private func setupUI() {
        levelsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(levelsView)
        NSLayoutConstraint.activate([
            levelsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            levelsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            levelsView.topAnchor.constraint(equalTo: view.topAnchor),
            levelsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

