//
//  GameVC + Action.swift
//  Game1
//
//  Created by Александр Андреев on 06.08.2024.
//

import Foundation
import UIKit
import SpriteKit

// MARK: - Action
extension GameViewController {
    
    @objc
    func pausePressed() {
        scene?.togglePause()
        view.addSubview(blurEffectView)

        let pauseVC = PauseViewController()
        pauseVC.delegate = self
        pauseVC.modalPresentationStyle = .overCurrentContext
        pauseVC.modalTransitionStyle = .crossDissolve
        present(pauseVC, animated: true, completion: nil)
    }

    func resumeGame() {
        blurEffectView.removeFromSuperview()
        scene?.togglePause()
    }

    @objc
    func restartPressed() {
        restartGame()
    }

    private func restartGame() {
        guard let skView = gameView.subviews.compactMap({ $0 as? SKView }).first else {
            print("SKView not found!")
            return
        }

        // Создаем новую сцену
        let newScene = GameScene(size: skView.bounds.size)
        newScene.scaleMode = .resizeFill
        newScene.gameSceneDelegate = self
        
        // Создаем и добавляем сцену
        skView.presentScene(newScene)
        
        // Обновляем ссылку на текущую сцену
        scene = newScene
        
        // Вызываем метод конфигурации, чтобы настроить уровень и элементы
        scene?.configure(for: currentLevel)
    }


    // MARK: - GameSceneDelegate
    func showGameOver(hits: Int, totalShots: Int) {
        AudioManager.shared.gameOverEffect()
        scene?.togglePause()
        view.addSubview(blurEffectView)
        let gameOverVC = GameOverViewController(hits: hits, totalShots: totalShots, level: currentLevel)
        gameOverVC.modalPresentationStyle = .overCurrentContext
        gameOverVC.modalTransitionStyle = .crossDissolve
        present(gameOverVC, animated: true, completion: nil)
    }
}
