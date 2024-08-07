//
//  UtilsTableViewCell.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation
import UIKit

class UtilsTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let reuseId = "UtilsTableViewCell"
    
    public var utilsImage: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    // MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupUI() {
        addSubview(utilsImage)
        self.backgroundColor = .clear
        NSLayoutConstraint.activate([
            utilsImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            utilsImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            utilsImage.topAnchor.constraint(equalTo: self.topAnchor),
            utilsImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension UtilsTableViewCell {
    public func setupCell(imageName: String) {
        utilsImage.image = UIImage(named: imageName)
    }
}
