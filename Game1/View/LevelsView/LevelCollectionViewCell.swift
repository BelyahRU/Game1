//
//  LevelCollectionViewCell.swift
//  Game1
//
//  Created by Александр Андреев on 04.08.2024.
//

import Foundation
import UIKit
class LevelCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "LevelCollectionViewCell"
    
    private let item = UIImageView(image: UIImage(named: Resources.Levels.blockedLevel))
    
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
        addSubview(item)
    }
    
    private func setupConstraints() {
        item.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            item.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            item.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            item.topAnchor.constraint(equalTo: self.topAnchor),
            item.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension LevelCollectionViewCell {
    public func setupCell(level: Int?, stars: Int?) {
        if level != nil && stars != nil {
            print(level, stars)
        }
    }
}
