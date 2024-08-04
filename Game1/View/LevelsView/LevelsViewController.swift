//
//  LevelsViewController.swift
//  Game1
//
//  Created by Александр Андреев on 04.08.2024.
//

import Foundation
import UIKit
class LevelsViewController: UIViewController {
    
    let levelsView = LevelsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupUI()
        setupCollectionView()
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
