//
//  PauseView.swift
//  Game1
//
//  Created by Александр Андреев on 05.08.2024.
//

import Foundation
import UIKit

class PauseView: UIView {
    
    // MARK: - Properties
    private let pauseLabel: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: Resources.Images.pauseLabel)
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    public let usagePolicyButton: UIButton = {
        let button = UIButton()
        button.alpha = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Resources.Buttons.usagePolicyButton), for: .normal)
        return button
    }()
    
    public let rateAppButton: UIButton = {
        let button = UIButton()
        button.alpha = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Resources.Buttons.rateAppButton), for: .normal)
        return button
    }()
    
    public let shareAppButton: UIButton = {
        let button = UIButton()
        button.alpha = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Resources.Buttons.shareAppButton), for: .normal)
        return button
    }()
    
    public let homeButton: UIButton = {
        let button = UIButton()
        button.alpha = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Resources.Buttons.homeButton), for: .normal)
        return button
    }()
    
    public let resumeButton: UIButton = {
        let button = UIButton()
        button.alpha = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Resources.Buttons.startButton), for: .normal)
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
        addSubview(pauseLabel)
        addSubview(usagePolicyButton)
        addSubview(rateAppButton)
        addSubview(shareAppButton)
        addSubview(resumeButton)
        addSubview(homeButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            pauseLabel.widthAnchor.constraint(equalToConstant: 323),
            pauseLabel.heightAnchor.constraint(equalToConstant: 88),
            pauseLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pauseLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 64),
            
            resumeButton.widthAnchor.constraint(equalToConstant: 51),
            resumeButton.heightAnchor.constraint(equalToConstant: 51),
            resumeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48),
            resumeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -124),
            
            homeButton.widthAnchor.constraint(equalToConstant: 51),
            homeButton.heightAnchor.constraint(equalToConstant: 51),
            homeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48),
            homeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 124),
            
            usagePolicyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            rateAppButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shareAppButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            usagePolicyButton.widthAnchor.constraint(equalToConstant: 260),
            usagePolicyButton.heightAnchor.constraint(equalToConstant: 73),
            
            rateAppButton.widthAnchor.constraint(equalToConstant: 260),
            rateAppButton.heightAnchor.constraint(equalToConstant: 73),
            
            shareAppButton.widthAnchor.constraint(equalToConstant: 260),
            shareAppButton.heightAnchor.constraint(equalToConstant: 73),
            
            usagePolicyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -49),
            rateAppButton.topAnchor.constraint(equalTo: usagePolicyButton.bottomAnchor, constant: 15),
            shareAppButton.topAnchor.constraint(equalTo: rateAppButton.bottomAnchor, constant: 15),
        ])
    }
}
