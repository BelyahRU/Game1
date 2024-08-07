//
//  LevelsView.swift
//  Game1
//
//  Created by Александр Андреев on 04.08.2024.
//

import Foundation
import UIKit
class LevelsView: UIView {
    
    // MARK: - Properties
    private let background: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: Resources.Back.mainBackground)
        return view
    }()
    
    public let headerView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Resources.Images.redViewHeader)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        return view
    }()
    
    public let backView: UIImageView = {
        let im = UIImageView(image: UIImage(named: Resources.RoundedView.roundedView))
        im.translatesAutoresizingMaskIntoConstraints = false
        im.alpha = 0
        return im
    }()
    
    public let legsView: UIImageView = {
        let im = UIImageView(image: UIImage(named: Resources.RoundedView.legsRoundedView))
        im.translatesAutoresizingMaskIntoConstraints = false
        im.alpha = 0
        return im
    }()
    
    public let labelView: UIImageView = {
        let im = UIImageView(image: UIImage(named: Resources.RoundedView.levelsLabel))
        im.translatesAutoresizingMaskIntoConstraints = false
        im.alpha = 0
        return im
    }()
    
    public let coinsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Modak", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0
        label.textColor = .white
        return label
    }()
    
    public let cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Resources.Buttons.cancelButton), for: .normal)
        button.alpha = 0
        return button
    }()
    
    public let levelsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alpha = 0
        return collectionView
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
    }
    
    private func setupSubviews() {
        addSubview(background)
        addSubview(legsView)
        addSubview(backView)
        addSubview(labelView)
        addSubview(cancelButton)
        addSubview(levelsCollectionView)
        addSubview(headerView)
        addSubview(coinsLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            
            backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 166),
            backView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backView.widthAnchor.constraint(equalToConstant: 313),
            backView.heightAnchor.constraint(equalToConstant: 411),
            
            headerView.widthAnchor.constraint(equalToConstant: 279),
            headerView.heightAnchor.constraint(equalToConstant: 143),
            headerView.bottomAnchor.constraint(equalTo: backView.topAnchor, constant: 33),
            headerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                  
            legsView.topAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -17),
            legsView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            legsView.widthAnchor.constraint(equalToConstant: 213),
            legsView.heightAnchor.constraint(equalToConstant: 47),
            
            labelView.topAnchor.constraint(equalTo: self.legsView.bottomAnchor, constant: -17),
            labelView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelView.widthAnchor.constraint(equalToConstant: 323),
            labelView.heightAnchor.constraint(equalToConstant: 88),
            
            cancelButton.heightAnchor.constraint(equalToConstant: 51),
            cancelButton.widthAnchor.constraint(equalToConstant: 51),
            cancelButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cancelButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48),
            
            levelsCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -25),
            levelsCollectionView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 32),
            levelsCollectionView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -32),
            levelsCollectionView.bottomAnchor.constraint(equalTo: legsView.topAnchor, constant: -6),
            
            coinsLabel.leadingAnchor.constraint(equalTo: headerView.centerXAnchor, constant: -24),
            coinsLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 3),
        ])
    }
}
