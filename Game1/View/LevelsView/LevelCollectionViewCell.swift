//
//  LevelCollectionViewCell.swift
//  Game1
//
//  Created by Александр Андреев on 04.08.2024.
//

import Foundation
import UIKit
class LevelCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let reuseId = "LevelCollectionViewCell"
    
    private var item = UIImageView(image: UIImage(named: Resources.Levels.blockedLevel))
    
    private var levelLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.font = UIFont(name: "Modak", size: 40)
        label.textColor = UIColor(red: 169/255, green: 2/255, blue: 15/255, alpha: 1.0)
        return label
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
        addSubview(item)
        addSubview(levelLabel)
    }
    
    private func setupConstraints() {
        item.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            item.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            item.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            item.topAnchor.constraint(equalTo: self.topAnchor),
            item.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            levelLabel.centerXAnchor.constraint(equalTo: item.centerXAnchor),
            levelLabel.topAnchor.constraint(equalTo: item.topAnchor, constant: 23)
        ])
    }
}

// MARK: - Settings for cell
extension LevelCollectionViewCell {
    public func setupCell(level: Level?) {
        guard let level = level else {
            return
        }
        
        if level.isUnlocked == true  {
            switch level.stars {
            case 1:
                item.image = UIImage(named: Resources.GameOver.LevelViews.level1Star)
            case 2:
                item.image = UIImage(named: Resources.GameOver.LevelViews.level2Star)
            case 3:
                item.image = UIImage(named: Resources.GameOver.LevelViews.level3Star)
            default:
                item.image = UIImage(named: Resources.GameOver.LevelViews.level0Star)
            }
            
            levelLabel.text = "\(level.levelNumber)"
            levelLabel.isHidden = false
        }
    }
}
