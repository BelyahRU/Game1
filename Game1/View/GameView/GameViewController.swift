//
//  GameViewController.swift
//  Game1
//
//  Created by Александр Андреев on 05.08.2024.
//

import UIKit
import SpriteKit

protocol PauseViewControllerDelegate: AnyObject {
    func resumeGame()
}

final class GameViewController: UIViewController, GameSceneDelegate, PauseViewControllerDelegate {

    public var scene: GameScene!
    public var blurEffectView: UIVisualEffectView!

    public let gameView = GameView()
    public var pauseButton: UIButton!
    public var restartButton: UIButton!
    
    public var currentLevel: Int = 10 {
        didSet {
            loadLevel()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        configure()
        loadLevel()
    }

    private func setupBlur() {
        let blurEffect = UIBlurEffect(style: .regular)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.5
    }

    private func setupScene() {
        let skView = SKView(frame: .zero)
        skView.translatesAutoresizingMaskIntoConstraints = false
        gameView.addSubview(skView)

        skView.backgroundColor = .clear
        skView.ignoresSiblingOrder = true

        NSLayoutConstraint.activate([
            skView.leadingAnchor.constraint(equalTo: gameView.leadingAnchor),
            skView.trailingAnchor.constraint(equalTo: gameView.trailingAnchor),
            skView.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 100),
            skView.bottomAnchor.constraint(equalTo: gameView.bottomAnchor, constant: -100)
        ])

        skView.layoutIfNeeded()
        let sceneSize = CGSize(width: skView.bounds.width, height: skView.bounds.height)
        scene = GameScene(size: sceneSize)
        scene.scaleMode = .resizeFill
        scene.gameSceneDelegate = self
        skView.presentScene(scene)
    }

    private func configure() {
        setupBlur()
        setupSubviews()
        setupConstraints()
        setupScene()
    }

    private func setupSubviews() {
        view.addSubview(gameView)
    }

    private func setupConstraints() {
        gameView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gameView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gameView.topAnchor.constraint(equalTo: view.topAnchor),
            gameView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func setupButtons() {
        pauseButton = gameView.pauseButton
        restartButton = gameView.restartButton

        pauseButton.addTarget(self, action: #selector(pausePressed), for: .touchUpInside)
        restartButton.addTarget(self, action: #selector(restartPressed), for: .touchUpInside)
    }
    
    private func loadLevel() {
        gameView.levelLabel.text = "Level \(currentLevel)"
        scene?.configure(for: currentLevel)
    }


}
