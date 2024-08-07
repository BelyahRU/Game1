//
//  MainView.swift
//  Game1
//
//  Created by Александр Андреев on 04.08.2024.
//

import Foundation
import UIKit

class MainView: UIView {
    
    // MARK: - Properties
    public let background: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Resources.Back.mainBackground)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let headerView: UIImageView = {
        let view = UIImageView()
        view.alpha = 0
        view.image = UIImage(named: Resources.Images.redViewHeader)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let coinsLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.font = UIFont(name: "Modak", size: 40)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let backView: UIImageView = {
        let view = UIImageView()
        view.alpha = 0
        view.image = UIImage(named: Resources.Back.mainBackButtonsView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var playButton: UIButton = {
        let button = UIButton()
        button.alpha = 0
        button.setImage(UIImage(named: Resources.Buttons.playButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var levelsButton: UIButton = {
        let button = UIButton()
        button.alpha = 0
        button.setImage(UIImage(named: Resources.Buttons.levelsButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var settingButton: UIButton = {
        let button = UIButton()
        button.alpha = 0
        button.setImage(UIImage(named: Resources.Buttons.settingButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let menuButton: UIImageView = {
        let im = UIImageView()
        im.alpha = 0
        im.image = UIImage(named: Resources.Buttons.menuButton)
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    public let shopButton: UIButton = {
        let button = UIButton()
        button.alpha = 0
        button.setImage(UIImage(named: Resources.Buttons.shopButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
        setupSubviews()
        setupConstraints()
        animateIntro()
    }
    
    private func setupSubviews() {
        addSubview(background)
        addSubview(backView)
        addSubview(menuButton)
        addSubview(headerView)
        addSubview(shopButton)
        addSubview(playButton)
        addSubview(levelsButton)
        addSubview(settingButton)
        addSubview(coinsLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            headerView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            headerView.heightAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 142.5/279), // Пропорции оригинального изображения
            
            backView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            backView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
            backView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            
            playButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: 30),
            playButton.widthAnchor.constraint(equalTo: backView.widthAnchor, multiplier: 0.8),
            playButton.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 0.2),
            playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            levelsButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 15),
            levelsButton.widthAnchor.constraint(equalTo: playButton.widthAnchor),
            levelsButton.heightAnchor.constraint(equalTo: playButton.heightAnchor),
            levelsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            settingButton.topAnchor.constraint(equalTo: levelsButton.bottomAnchor, constant: 15),
            settingButton.widthAnchor.constraint(equalTo: playButton.widthAnchor),
            settingButton.heightAnchor.constraint(equalTo: playButton.heightAnchor),
            settingButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            menuButton.widthAnchor.constraint(equalTo: backView.widthAnchor),
            menuButton.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 0.2),
            menuButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            menuButton.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: 10),
            
            shopButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shopButton.heightAnchor.constraint(equalTo: settingButton.heightAnchor),
            shopButton.widthAnchor.constraint(equalTo: shopButton.heightAnchor),
            shopButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            coinsLabel.leadingAnchor.constraint(equalTo: headerView.centerXAnchor, constant: -24),
            coinsLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 3)
        ])
    }
}
