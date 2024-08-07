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
        setupUI()
        setupCollectionView()
        setupButton()
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

//MARK: Action
extension LevelsViewController {
    private func setupButton() {
        cancelButton = levelsView.cancelButton
        cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
    }
    
    @objc
    func cancelPressed() {
        self.dismiss(animated: true)
    }
}
