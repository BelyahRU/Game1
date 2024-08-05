//
//  GameViewController.swift
//  Game1
//
//  Created by Александр Андреев on 05.08.2024.
//

import Foundation
import UIKit
import SpriteKit

protocol PauseViewControllerDelegate: AnyObject {
    func resumeGame()
}

final class GameViewController: UIViewController {

    private var scene: GameScene!
    
    public var blurEffectView: UIVisualEffectView!
    
    public let gameView = GameView()
    
    public var pauseButton: UIButton!
    public var restartButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupScene()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        configure()
    }
    
    private func setupBlur() {
        let blurEffect = UIBlurEffect(style: .regular) // Используем стиль, который можно настроить
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Настроить прозрачность размытости, чтобы сделать эффект менее заметным
        blurEffectView.alpha = 0.5 // Уменьшить прозрачность
    }
    
    private func setupScene() {
        let skView = SKView(frame: .zero)
        skView.translatesAutoresizingMaskIntoConstraints = false
        gameView.addSubview(skView)
        
        // Включаем поддержку прозрачности
        skView.backgroundColor = .clear
        skView.ignoresSiblingOrder = true
        
        NSLayoutConstraint.activate([
            skView.leadingAnchor.constraint(equalTo: gameView.leadingAnchor),
            skView.trailingAnchor.constraint(equalTo: gameView.trailingAnchor),
            skView.topAnchor.constraint(equalTo: gameView.topAnchor, constant: 100),
            skView.bottomAnchor.constraint(equalTo: gameView.bottomAnchor, constant: -100)
        ])
        
        // Установим размер сцены с учетом отступов
        skView.layoutIfNeeded() // Обновляем layout для получения корректных размеров
        let sceneSize = CGSize(width: skView.bounds.width, height: skView.bounds.height)
        scene = GameScene(size: sceneSize)
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
    
    private func configure() {
        setupBlur()
        setupSubviews()
        setupConstraints()
        
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
}


//MARK: Action
extension GameViewController: PauseViewControllerDelegate {
    public func setupButtons() {
        pauseButton = gameView.pauseButton
        restartButton = gameView.restartButton
        
        pauseButton.addTarget(self, action: #selector(pausePressed), for: .touchUpInside)
        restartButton.addTarget(self, action: #selector(restartPressed), for: .touchUpInside)
    }
    
    @objc
    func pausePressed() {
        scene?.togglePause()
        view.addSubview(blurEffectView)
        
        // Создание и отображение контроллера паузы
        let pauseVC = PauseViewController()
        pauseVC.delegate = self
        pauseVC.modalPresentationStyle = .overCurrentContext
        pauseVC.modalTransitionStyle = .crossDissolve
        present(pauseVC, animated: true, completion: nil)
    }
    
    // MARK: - PauseViewControllerDelegate
    func resumeGame() {
        blurEffectView.removeFromSuperview()
        scene?.togglePause() // Возобновите игру
    }

    
    @objc
    func restartPressed() {
        restartGame()
    }
    
    private func restartGame() {
        // Убедитеждаемся, что skView присутствует
        guard let skView = gameView.subviews.compactMap({ $0 as? SKView }).first else {
            print("SKView not found!")
            return
        }
        
        // Создаем новую сцену
        let newScene = GameScene(size: skView.bounds.size)
        newScene.scaleMode = .resizeFill
        
        scene = newScene
        skView.presentScene(scene)
    }

}

