//
//  SettingsViewController.swift
//  Game1
//
//  Created by Александр Андреев on 02.08.2024.
//

import Foundation
import UIKit
class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    private let settingView = SettingsView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Methods
    private func configure() {
        setupUI()
        setupTargets()
    }
    
    private func setupUI() {
        view.addSubview(settingView)
        settingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingView.topAnchor.constraint(equalTo: view.topAnchor),
            settingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: Action
extension SettingsViewController {
    public func setupTargets() {
        settingView.cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
    }
    
    @objc
    func cancelPressed() {
        self.dismiss(animated: true)
    }
}

