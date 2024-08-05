//
//  GameView.swift
//  Game1
//
//  Created by Александр Андреев on 05.08.2024.
//

import Foundation
import UIKit
class GameView: UIView {
    
    private let background: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: Resources.Back.mainBackground)
        return view
    }()
    
    public let levelView: UIImageView = {
        let im = UIImageView(image: UIImage(named: Resources.Images.levelView))
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    public let cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Resources.Buttons.cancelButton), for: .normal)
        return button
    }()
    
    private lazy var backgroundsArray: [String] = [
        
    ]
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupLevelBackground()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupLevelBackground() {
        
    }
    
    private func setupSubviews() {
        addSubview(background)
        addSubview(levelView)
//        addSubview(cancelButton)
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
            levelView.topAnchor.constraint(equalTo: self.topAnchor, constant: 64)
            
            
        ])
    }
}
