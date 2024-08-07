//
//  GameOverView.swift
//  Game1
//
//  Created by Александр Андреев on 06.08.2024.
//

import Foundation
import UIKit

class GameOverView: UIView {
    
    // MARK: - Properties
    private let gameOverLabel: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.image = UIImage(named: Resources.GameOver.gameOverLabel)
        return im
    }()
    
    private let backView: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.image = UIImage(named: Resources.GameOver.backView)
        return im
    }()
    
    private let confetieView: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.image = UIImage(named: Resources.GameOver.confetie)
        return im
    }()
    
    public let levelView: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.image = UIImage(named: Resources.GameOver.LevelViews.level3Star)
        return im
    }()
    
    public let levelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Modak", size: 40)
        label.textColor = .red
        label.text = "10"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let moneyView: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.image = UIImage(named: Resources.GameOver.moneyView)
        return im
    }()
    
    public let moneyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Modak", size: 40)
        label.textColor = .white
        label.text = "+100"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let star1: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.image = UIImage(named: Resources.GameOver.star)
        return im
    }()
    
    public let star2: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.image = UIImage(named: Resources.GameOver.star)
        return im
    }()
    
    public let star3: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.image = UIImage(named: Resources.GameOver.star)
        return im
    }()
    
    public let homeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.homeButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let restartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.restartButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func configure() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(gameOverLabel)
        addSubview(backView)
        addSubview(confetieView)
        addSubview(levelView)
        addSubview(levelLabel)
        addSubview(moneyView)
        addSubview(moneyLabel)
        addSubview(star1)
        addSubview(star2)
        addSubview(star3)
        addSubview(homeButton)
        addSubview(restartButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            gameOverLabel.widthAnchor.constraint(equalToConstant: 323),
            gameOverLabel.heightAnchor.constraint(equalToConstant: 88),
            gameOverLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            gameOverLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 64),
            
            backView.widthAnchor.constraint(equalToConstant: 323),
            backView.heightAnchor.constraint(equalToConstant: 330),
            backView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backView.topAnchor.constraint(equalTo: gameOverLabel.bottomAnchor, constant: 105),
            
            confetieView.widthAnchor.constraint(equalTo: self.widthAnchor),
            confetieView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -99),
            confetieView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            confetieView.topAnchor.constraint(equalTo: self.topAnchor, constant: 152),
            
            levelView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            levelView.widthAnchor.constraint(equalToConstant: 116),
            levelView.heightAnchor.constraint(equalToConstant: 116),
            levelView.centerYAnchor.constraint(equalTo: backView.topAnchor),
            
            levelLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            levelLabel.centerYAnchor.constraint(equalTo: levelView.centerYAnchor, constant: -10),
            
            moneyView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            moneyView.widthAnchor.constraint(equalToConstant: 279),
            moneyView.heightAnchor.constraint(equalToConstant: 143),
            moneyView.topAnchor.constraint(equalTo: levelView.bottomAnchor, constant: 7),
            
            moneyLabel.topAnchor.constraint(equalTo: moneyView.topAnchor, constant: 44),
            moneyLabel.leadingAnchor.constraint(equalTo: moneyView.leadingAnchor, constant: 115),
            
            star1.widthAnchor.constraint(equalToConstant: 68),
            star1.heightAnchor.constraint(equalToConstant: 65),
            star1.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 23),
            star1.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -63),
            
            star2.widthAnchor.constraint(equalToConstant: 68),
            star2.heightAnchor.constraint(equalToConstant: 65),
            star2.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            star2.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -42),
            
            star3.widthAnchor.constraint(equalToConstant: 68),
            star3.heightAnchor.constraint(equalToConstant: 65),
            star3.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -23),
            star3.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -63),
            
            restartButton.widthAnchor.constraint(equalToConstant: 51),
            restartButton.heightAnchor.constraint(equalToConstant: 51),
            restartButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48),
            restartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -124),
            
            homeButton.widthAnchor.constraint(equalToConstant: 51),
            homeButton.heightAnchor.constraint(equalToConstant: 51),
            homeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48),
            homeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 124),
        ])
    }
}
