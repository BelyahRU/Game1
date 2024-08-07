//
//  ShopView.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation
import UIKit

class ShopView: UIView {
    
    // MARK: - Properties
    private let background: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: Resources.Back.mainBackground)
        return view
    }()
    
    public let labelView: UIImageView = {
        let im = UIImageView(image: UIImage(named: "shopLabel"))
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    public let headerView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Resources.Images.redViewHeader)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let coinsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Modak", size: 40)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let utilsTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    public let cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Resources.Buttons.cancelButton), for: .normal)
        return button
    }()
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    private func configure() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(background)
        addSubview(labelView)
        addSubview(utilsTableView)
        addSubview(headerView)
        addSubview(coinsLabel)
        addSubview(cancelButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            labelView.widthAnchor.constraint(equalToConstant: 323),
            labelView.heightAnchor.constraint(equalToConstant: 88),
            labelView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelView.topAnchor.constraint(equalTo: self.topAnchor, constant: 104),
            
            headerView.widthAnchor.constraint(equalToConstant: 279),
            headerView.heightAnchor.constraint(equalToConstant: 143),
            headerView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 11),
            headerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            utilsTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -44),
            utilsTableView.widthAnchor.constraint(equalToConstant: 323),
            utilsTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            utilsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            coinsLabel.leadingAnchor.constraint(equalTo: headerView.centerXAnchor, constant: -24),
            coinsLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 3),
            
            cancelButton.heightAnchor.constraint(equalToConstant: 51),
            cancelButton.widthAnchor.constraint(equalToConstant: 51),
            cancelButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cancelButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48),
        ])
    }
}
