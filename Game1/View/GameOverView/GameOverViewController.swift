//
//  GameOverViewController.swift
//  Game1
//
//  Created by Александр Андреев on 06.08.2024.
//

import Foundation
import UIKit


class GameOverViewController: UIViewController {

    // MARK: - Properties
    var currentLevel: Int = 0
    
    public let gameOverView = GameOverView()
    public var viewModel = GameOverViewModel()
    
    public var homeButton: UIButton!
    public var restartButton: UIButton!
    
    // MARK: - Initialize
    init(hits: Int, totalShots: Int, level: Int) {
        super.init(nibName: nil, bundle: nil)
        self.currentLevel = level
        self.viewModel.setupHits(hits: hits)
        self.viewModel.setupTotalShots(shots: totalShots)
        self.viewModel.setupLevel(levelId: level)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    // MARK: - Methods
    private func configure() {
        setupButtons()
        setupData()
        setupUI()
    }
    
    private func setupData() {
        guard viewModel.level != nil else {
            print("Error: Level is not set in viewModel")
            return
        }
        
        let stars = viewModel.countingStars()
        let money = viewModel.countingMoney()
        
        gameOverView.moneyLabel.text = "+\(money)"
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
            gameOverView.star1.isHidden = true
            gameOverView.star2.isHidden = true
            gameOverView.star3.isHidden = true
            
            gameOverView.levelView.image = UIImage(named:
                        Resources.GameOver.LevelViews.level0Star)
        }
        
        gameOverView.levelLabel.text = "\(currentLevel)"
        
        viewModel.reloadLevelManager()
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
