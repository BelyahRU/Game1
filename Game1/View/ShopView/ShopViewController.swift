//
//  ShopViewController.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation
import UIKit

class ShopViewController: UIViewController {
    
    // MARK: - Properties
    public var shopManager = ShopManager.shared
    public let shopView = ShopView()
    
    public var cancelButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Methods
    private func configure() {
//        if let bundleID = Bundle.main.bundleIdentifier {
//                UserDefaults.standard.removePersistentDomain(forName: bundleID)
//                UserDefaults.standard.synchronize()
//            }
        setupButton()
        setupCoins()
        setupTableView()
        setupUI()
        animateViews()
    }
    
    private func setupCoins() {
        shopView.coinsLabel.text = "\(LevelManager.shared.getTotalCoins())"
    }
    
    private func setupUI() {
            view.addSubview(shopView)
            shopView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                shopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                shopView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                shopView.topAnchor.constraint(equalTo: view.topAnchor),
                shopView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            
            // Устанавливаем начальные состояния
            shopView.labelView.transform = CGAffineTransform(translationX: 0, y: -view.frame.height)
            shopView.headerView.alpha = 0
            shopView.coinsLabel.alpha = 0
            shopView.cancelButton.alpha = 0
            shopView.utilsTableView.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        }
        
    
    
}
