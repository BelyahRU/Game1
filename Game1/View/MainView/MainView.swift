//
//  MainView.swift
//  Game1
//
//  Created by Александр Андреев on 04.08.2024.
//

import Foundation
import UIKit

class MainView: UIView {
    
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
    
    public let backView: UIImageView = {
        let view = UIImageView()
        view.alpha = 0
        view.image = UIImage(named: Resources.Back.mainBackButtonsView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let mainSV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 15
        sv.isUserInteractionEnabled = true
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    public let playButton: UIButton = {
        let button = UIButton()
        button.alpha = 0
        button.setImage(UIImage(named: Resources.Buttons.playButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let levelsButton: UIButton = {
        let button = UIButton()
        button.alpha = 0
        button.setImage(UIImage(named: Resources.Buttons.levelsButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let settingButton: UIButton = {
        let button = UIButton()
        button.alpha = 0
        button.setImage(UIImage(named: Resources.Buttons.settingButton), for: .normal)
        button.addTarget(MainView.self, action: #selector(settingButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let menuButton: UIButton = {
        let button = UIButton()
        button.alpha = 0
        button.setImage(UIImage(named: Resources.Buttons.menuButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let shopButton: UIButton = {
        let button = UIButton()
        button.alpha = 0
        button.setImage(UIImage(named: Resources.Buttons.shopButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var settingsButtonCompletion: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func settingButtonPressed() {
        settingsButtonCompletion?()
    }
    
    private func configure() {
        setupSubviews()
        setupSV()
        setupConstraints()
        animateIntro()
    }
    
    private func setupSubviews() {
        addSubview(background)
        addSubview(backView)
        backView.addSubview(mainSV)
        addSubview(menuButton)
        addSubview(headerView)
        addSubview(shopButton)
    }
    
    private func setupSV() {
        mainSV.addArrangedSubview(playButton)
        mainSV.addArrangedSubview(levelsButton)
        mainSV.addArrangedSubview(settingButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
            headerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 53),
            headerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 142.5),
            headerView.widthAnchor.constraint(equalToConstant: 279),
            
            backView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backView.widthAnchor.constraint(equalToConstant: 323),
            backView.heightAnchor.constraint(equalToConstant: 363),
            backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 208),
            
            mainSV.widthAnchor.constraint(equalToConstant: 260),
            mainSV.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainSV.heightAnchor.constraint(equalToConstant: 255),
            mainSV.topAnchor.constraint(equalTo: backView.topAnchor, constant: 30),
            
            playButton.widthAnchor.constraint(equalToConstant: 260),
            playButton.heightAnchor.constraint(equalToConstant: 73),
            levelsButton.widthAnchor.constraint(equalToConstant: 260),
            levelsButton.heightAnchor.constraint(equalToConstant: 73),
            settingButton.widthAnchor.constraint(equalToConstant: 260),
            settingButton.heightAnchor.constraint(equalToConstant: 73),
            
            menuButton.widthAnchor.constraint(equalToConstant: 323),
            menuButton.heightAnchor.constraint(equalToConstant: 88),
            menuButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            menuButton.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: -24),
            
            shopButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shopButton.heightAnchor.constraint(equalToConstant: 51),
            shopButton.widthAnchor.constraint(equalToConstant: 51),
            shopButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48)
        ])
    }
}
