//
//  GameOverViewController.swift
//  Game1
//
//  Created by Александр Андреев on 06.08.2024.
//

import Foundation
import UIKit

class GameOverViewController: UIViewController {

    //FROM GameScene
    var hits: Int = 0
    var totalShots: Int = 0
    
    public let gameOverView = GameOverView()
    public var viewModel = GameOverViewModel()
    
    init(hits: Int, totalShots: Int) {
        super.init(nibName: nil, bundle: nil)
        self.hits = hits
        self.totalShots = totalShots
        self.viewModel.hits = hits
        self.viewModel.totalShots = totalShots
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure() {
        setupData()
        setupUI()
    }
    
    private func setupData() {
        let stars = viewModel.couningStars()
        let money = viewModel.countingMoney()
        
        gameOverView.moneyLabel.text = "+\(money)"
//        gameOverView.levelLabel.text
        switch stars {
        case 1:
            gameOverView.star1.isHidden = false
            gameOverView.star2.isHidden = true
            gameOverView.star3.isHidden = true
            
            gameOverView.levelView.image = UIImage(named:
                        Resources.GameOver.LevelViews.level1Star)
        case 2:
            gameOverView.star1.isHidden = false
            gameOverView.star2.isHidden = false
            gameOverView.star3.isHidden = true
            
            gameOverView.levelView.image = UIImage(named:
                        Resources.GameOver.LevelViews.level2Star)
        case 3:
            gameOverView.star1.isHidden = false
            gameOverView.star2.isHidden = false
            gameOverView.star3.isHidden = false
            
            gameOverView.levelView.image = UIImage(named:
                        Resources.GameOver.LevelViews.level3Star)
        default:
            print("error")
        }
    }

    private func setupUI() {
        view.addSubview(gameOverView)
        gameOverView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameOverView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gameOverView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gameOverView.topAnchor.constraint(equalTo: view.topAnchor),
            gameOverView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    @objc private func retryPressed() {
        dismiss(animated: true, completion: nil)
    }
}
