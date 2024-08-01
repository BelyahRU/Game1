//
//  RedHeaderView.swift
//  Game1
//
//  Created by Александр Андреев on 01.08.2024.
//

import Foundation
import UIKit

class RedHeaderView: UIView {
    
    private let backgroundView: UIImageView = {
        let view = UIImageView(image: UIImage(named: Resources.RedHeaderView.backView))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let coinImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: Resources.RedHeaderView.coinImage))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let clockImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: Resources.RedHeaderView.clockImage))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(backgroundView)
        backgroundView.backgroundColor = .red
        backgroundView.addSubview(coinImageView)
        backgroundView.addSubview(clockImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
            coinImageView.heightAnchor.constraint(equalToConstant: 38),
            coinImageView.widthAnchor.constraint(equalToConstant: 42),
            coinImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 59),
            coinImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 53),
            
    
        ])
    }
}
