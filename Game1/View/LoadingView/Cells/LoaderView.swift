//
//  LoaderView.swift
//  Game1
//
//  Created by Александр Андреев on 04.08.2024.
//

import Foundation
import UIKit
final class LoaderView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 4
        view.layer.borderColor = UIColor(red: 113/255, green: 21/255, blue: 25/255, alpha: 1).cgColor
        return view
    }()
    
    private lazy var progressView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 195/255, green: 42/255, blue: 40/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 4
        view.layer.borderColor = UIColor(red: 113/255, green: 21/255, blue: 25/255, alpha: 1).cgColor
        return view
    }()
    
    private weak var progressViewLeadingConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
//        containerView
    }
    
    func configure(_ withValue: CGFloat) {
        
        
        let fullWidth = containerView.frame.width // 100%
        let onePercentWidth = fullWidth / 100 // 1%
        
        progressViewLeadingConstraint?.constant = withValue * onePercentWidth // set needed width
        
        layoutIfNeeded()
        
    }
    
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(progressView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 20),
            
            progressView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 20),
            progressView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            
        ])
        
        progressViewLeadingConstraint = progressView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        progressViewLeadingConstraint?.isActive = true
        progressViewLeadingConstraint?.constant = 0
    }
    
    
    
}
