//
//  GameScene.swift
//  Game1
//
//  Created by Александр Андреев on 05.08.2024.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    private var gun: SKSpriteNode!
    private var box: SKSpriteNode!
    private var bullets = [SKShapeNode]()
    private var isShooting = false
    private var scoreLabel: SKLabelNode!
    private var score = 0
    private var lastShotTime: TimeInterval = 0
    private let shootInterval: TimeInterval = 0.5
    
    override func didMove(to view: SKView) {
        setupGun()
        setupBox()
        setupScoreLabel()
    }
    
    private func setupGun() {
        gun = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
        gun.position = CGPoint(x: size.width / 2, y: size.height - 100)
        addChild(gun)
    }
    
    private func setupBox() {
        box = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 50))
        box.position = CGPoint(x: size.width / 2, y: 100)
        addChild(box)
        startBoxMovement()
    }
    
    private func setupScoreLabel() {
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.fontSize = 24
        scoreLabel.fontColor = .white
        scoreLabel.position = CGPoint(x: size.width / 2, y: size.height - 40)
        scoreLabel.text = "Score: 0"
        addChild(scoreLabel)
    }
    
    private func startBoxMovement() {
        let moveRight = SKAction.moveTo(x: size.width - box.size.width / 2, duration: 2.0)
        let moveLeft = SKAction.moveTo(x: box.size.width / 2, duration: 2.0)
        let sequence = SKAction.sequence([moveRight, moveLeft])
        let repeatAction = SKAction.repeatForever(sequence)
        box.run(repeatAction)
    }
    
    private func shootBullet() {
        let bullet = SKShapeNode(circleOfRadius: 10)
        bullet.fillColor = .yellow
        bullet.position = gun.position
        addChild(bullet)
        bullets.append(bullet)
        
        let moveAction = SKAction.moveTo(y: -bullet.frame.size.height / 2, duration: 1.5)
        let removeAction = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction, removeAction])
        bullet.run(sequence) { [weak self] in
            if let self = self, let index = self.bullets.firstIndex(of: bullet) {
                self.bullets.remove(at: index)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isShooting = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isShooting = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        if isShooting && currentTime - lastShotTime >= shootInterval {
            shootBullet()
            lastShotTime = currentTime
        }
        checkCollisions()
    }
    
    private func checkCollisions() {
        for bullet in bullets {
            if box.frame.contains(bullet.position) {
                bullet.removeFromParent()
                if let index = bullets.firstIndex(of: bullet) {
                    bullets.remove(at: index)
                }
                incrementScore()
            }
        }
    }
    
    private func incrementScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
}
