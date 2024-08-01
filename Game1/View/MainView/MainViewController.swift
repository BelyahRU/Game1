//
//  MainViewController.swift
//  Game1
//
//  Created by Александр Андреев on 01.08.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private let background: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Resources.Back.mainBackground)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Resources.Images.redViewHeader)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Resources.Back.mainBackButtonsView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mainSV: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 15
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.playButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let levelsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.levelsButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.settingButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.menuButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shopButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Resources.Buttons.shopButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupSV()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSV() {
        mainSV.addArrangedSubview(playButton)
        mainSV.addArrangedSubview(levelsButton)
        mainSV.addArrangedSubview(settingButton)
    }
    
    private func setupSubviews() {
        view.addSubview(background)
        view.addSubview(backView)
        backView.addSubview(mainSV)
        view.addSubview(menuButton)
        view.addSubview(headerView)
        view.addSubview(shopButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 53),
            headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 142.5),
            headerView.widthAnchor.constraint(equalToConstant: 279),
            
            backView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backView.widthAnchor.constraint(equalToConstant: 323),
            backView.heightAnchor.constraint(equalToConstant: 363),
            backView.topAnchor.constraint(equalTo: view.topAnchor, constant: 208),
            
            mainSV.widthAnchor.constraint(equalToConstant: 260),
            mainSV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
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
            menuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuButton.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: -24),
            
            shopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shopButton.heightAnchor.constraint(equalToConstant: 51),
            shopButton.widthAnchor.constraint(equalToConstant: 51),
            shopButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48)
        ])
    }
    

}
