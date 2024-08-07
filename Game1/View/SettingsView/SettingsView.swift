//
//  SettingsView.swift
//  Game1
//
//  Created by Александр Андреев on 04.08.2024.
//

import Foundation
import UIKit

class SettingsView: UIView {
    
    // MARK: - Properties
    private let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: Resources.Back.mainBackground)
        return view
    }()
    
    private let settingHeader: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: Resources.Buttons.settingLabel)
        return view
    }()
    
    public let usagePolicyButton: UIButton = {
        let button = UIButton()
        button.alpha = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Resources.Buttons.usagePolicyButton), for: .normal)
        return button
    }()
    
    public let rateAppButton: UIButton = {
        let button = UIButton()
        button.alpha = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Resources.Buttons.rateAppButton), for: .normal)
        return button
    }()
    
    public let shareAppButton: UIButton = {
        let button = UIButton()
        button.alpha = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Resources.Buttons.shareAppButton), for: .normal)
        return button
    }()
    
    private let buttonsSV: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 15
        sv.axis = .vertical
        return sv
    }()
    
    public let cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Resources.Buttons.cancelButton), for: .normal)
        return button
    }()
    
    public var settingHeaderTopConstraint: NSLayoutConstraint!
    
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
        setupAnimation()
    }
    
    private func setupSubviews() {
        addSubview(backgroundImage)
        addSubview(settingHeader)
        addSubview(buttonsSV)
        addSubview(usagePolicyButton)
        addSubview(rateAppButton)
        addSubview(shareAppButton)
        addSubview(cancelButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            settingHeader.widthAnchor.constraint(equalToConstant: 323),
            settingHeader.heightAnchor.constraint(equalToConstant: 88),
            settingHeader.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            buttonsSV.topAnchor.constraint(equalTo: self.topAnchor, constant: 297),
            buttonsSV.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Calculate the middle Y point between pauseLabel and homeButton
            usagePolicyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            rateAppButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shareAppButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            usagePolicyButton.widthAnchor.constraint(equalToConstant: 260),
            usagePolicyButton.heightAnchor.constraint(equalToConstant: 73),
            
            rateAppButton.widthAnchor.constraint(equalToConstant: 260),
            rateAppButton.heightAnchor.constraint(equalToConstant: 73),
            
            shareAppButton.widthAnchor.constraint(equalToConstant: 260),
            shareAppButton.heightAnchor.constraint(equalToConstant: 73),
            
            // Position buttons between pauseLabel and homeButton
            usagePolicyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -49),
            rateAppButton.topAnchor.constraint(equalTo: usagePolicyButton.bottomAnchor, constant: 15),
            shareAppButton.topAnchor.constraint(equalTo: rateAppButton.bottomAnchor, constant: 15),
            
            cancelButton.heightAnchor.constraint(equalToConstant: 51),
            cancelButton.widthAnchor.constraint(equalToConstant: 51),
            cancelButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cancelButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48)
        ])
        
        // Установка начального значения верхнего ограничения settingHeader за пределы экрана
        settingHeaderTopConstraint = settingHeader.topAnchor.constraint(equalTo: self.topAnchor, constant: -100)
        settingHeaderTopConstraint.isActive = true
    }
    
}
