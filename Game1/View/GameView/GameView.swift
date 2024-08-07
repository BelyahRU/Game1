//
//  GameView.swift
//  Game1
//
//  Created by Александр Андреев on 05.08.2024.
//

import Foundation
import UIKit
class GameView: UIView {
    
    // MARK: - Properties
    private let background: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var levelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Modak", size: 40)
        label.text = "Level 1"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let levelView: UIImageView = {
        let im = UIImageView(image: UIImage(named: Resources.Images.levelView))
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    public let pauseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.pauseButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let restartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.restartButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var backgroundsArray: [String] = [
        Resources.GameBackgrounds.bg1,
        Resources.GameBackgrounds.bg2,
        Resources.GameBackgrounds.bg3,
        Resources.GameBackgrounds.bg4,
        Resources.GameBackgrounds.bg5
    ]
        
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func configure() {
        setupLevelBackground()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupLevelBackground() {
        background.image = UIImage(named: backgroundsArray.randomElement()!)
    }
    
    private func setupSubviews() {
        addSubview(background)
        addSubview(levelView)
        levelView.addSubview(levelLabel)
        addSubview(pauseButton)
        addSubview(restartButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            levelView.widthAnchor.constraint(equalToConstant: 323),
            levelView.heightAnchor.constraint(equalToConstant: 88),
            levelView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            levelView.topAnchor.constraint(equalTo: self.topAnchor, constant: 64),
            
            levelLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            levelLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            
            pauseButton.widthAnchor.constraint(equalToConstant: 51),
            pauseButton.heightAnchor.constraint(equalToConstant: 51),
            pauseButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48),
            pauseButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -124),
            
            restartButton.widthAnchor.constraint(equalToConstant: 51),
            restartButton.heightAnchor.constraint(equalToConstant: 51),
            restartButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48),
            restartButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 124),
        ])
    }
}
