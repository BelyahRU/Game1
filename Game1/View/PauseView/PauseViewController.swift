//
//  PauseViewController.swift
//  Game1
//
//  Created by Александр Андреев on 05.08.2024.
//

import Foundation
import UIKit

class PauseViewController: UIViewController {
    
    // MARK: - Properties
    weak var delegate: PauseViewControllerDelegate?
    
    public let pauseView = PauseView()
    
    public var resumeButton: UIButton!
    public var homeButton: UIButton!
    public var usagePolicyButton: UIButton!
    public var rateAppButton: UIButton!
    public var shareAppButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Methods
    private func configure() {
        setupButtons()
        setupUI()
    }
    
    private func setupUI() {
        pauseView.translatesAutoresizingMaskIntoConstraints = false
        pauseView.backgroundColor = .clear
        view.addSubview(pauseView)
        NSLayoutConstraint.activate([
            pauseView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pauseView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pauseView.topAnchor.constraint(equalTo: view.topAnchor),
            pauseView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

