//
//  GameScene.swift
//  Game1
//
//  Created by Александр Андреев on 05.08.2024.
//

import SpriteKit

class GameScene: SKScene {
    private var gun: SKSpriteNode!
    private var box: SKSpriteNode!
    private var boxLabel: SKLabelNode!
    private var bullets = [SKShapeNode]()
    private var isShooting = false
    private var hits = 0 // Количество попаданий в коробку
    private var lastShotTime: TimeInterval = 0
    private let shootInterval: TimeInterval = 0.5
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .clear
        setupGun()
        setupBox()
    }
    
    private func setupGun() {
        let gunTexture = SKTexture(imageNamed: "gun.png")
        gun = SKSpriteNode(texture: gunTexture)
        gun.position = CGPoint(x: size.width / 2, y: size.height - 100)
        addChild(gun)
    }
    
    private func setupBox() {
        let boxTexture = SKTexture(imageNamed: "box.png")
        box = SKSpriteNode(texture: boxTexture)
        box.position = CGPoint(x: size.width / 2, y: 100)
        addChild(box)
        setupBoxLabel()
        startBoxMovement()
    }
    
    private func setupBoxLabel() {
        // Создаем метку и добавляем её в коробку
        let texture = SKTexture(imageNamed: Resources.Game.boxText)
        let boxText = SKSpriteNode(texture: texture)
        boxText.position = CGPoint(x: 0, y: -5)
        boxText.zPosition = 1
        box.addChild(boxText)
        
        boxLabel = SKLabelNode(fontNamed: "Modak")
        boxLabel.fontSize = 32
        boxLabel.fontColor = .white
        boxLabel.text = "0/30"
        
        // Обновляем позицию метки перед добавлением в коробку
        boxLabel.position = CGPoint(x: 0, y: -boxText.centerRect.height / 2 - 10) // Чуть выше центра коробки
        
        // Установите zPosition метки выше, чем у коробки
        boxLabel.zPosition = 2
        boxText.addChild(boxLabel)
    }
    
    // Пауза/возобновление игры
    func togglePause() {
        if isPaused {
            isPaused = false
            // Включить другие элементы управления, если нужно
        } else {
            isPaused = true
            // Отключить другие элементы управления, если нужно
        }
    }
    
    // Передвижение ящика
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
        
        let gunTipPosition = CGPoint(
                x: gun.position.x + 14,
                y: gun.position.y - gun.size.height / 2 + 10
            )
        bullet.position = gunTipPosition
        
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
        // Уменьшаем ширину рамки коробки на 20 пикселей
        let reducedBoxFrame = CGRect(
            x: box.frame.origin.x + 5, // Смещаем вправо на 10 пикселей
            y: box.frame.origin.y - 20, // Без изменений по высоте
            width: box.frame.size.width - 30, // Уменьшаем ширину на 20 пикселей (10 с каждой стороны)
            height: box.frame.size.height // Без изменений по высоте
        )
        
        for bullet in bullets {
            // Проверяем, попадает ли пуля в уменьшенную рамку коробки
            if reducedBoxFrame.contains(bullet.position) {
                // Дополнительная проверка: пуля должна быть выше нижней границы коробки
                if bullet.position.y > box.position.y {
                    bullet.removeFromParent()
                    if let index = bullets.firstIndex(of: bullet) {
                        bullets.remove(at: index)
                    }
                    incrementHits()
                }
            }
        }
    }

    
    private func incrementHits() {
        hits += 1
        boxLabel.text = "\(hits)/30"
    }
}
