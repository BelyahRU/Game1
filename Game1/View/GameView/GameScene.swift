//
//  GameScene.swift
//  Game1
//
//  Created by Александр Андреев on 05.08.2024.
//


import SpriteKit

struct PhysicsCategory {
    static let Bullet: UInt32 = 0x1 << 0
    static let Obstacle: UInt32 = 0x1 << 1
    static let Block: UInt32 = 0x1 << 2
    static let Box: UInt32 = 0x1 << 3
}

protocol GameSceneDelegate: AnyObject {
    func showGameOver(hits: Int, totalShots: Int)
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    public var gun: SKSpriteNode!
    public var box: SKSpriteNode!
    private var boxLabel: SKLabelNode!
    private var bullets = [SKShapeNode]()
    private var isShooting = false
    private var hits = 0 // Количество попаданий в коробку
    private var lastShotTime: TimeInterval = 0
    private let shootInterval: TimeInterval = 0.5
    
    private var totalShots = 60
    private var totalRemainingShots = 60 // Общее количество выстрелов
    private var shotsLabel: SKLabelNode! // Лейбл для отображения оставшихся выстрелов
    
    private var level: Int = 1 // Уровень игры
    
    weak var gameSceneDelegate: GameSceneDelegate?

    override func didMove(to view: SKView) {
        self.backgroundColor = .clear
        setupGun()
        setupBox()
        setupShotsLabel()
        physicsWorld.contactDelegate = self
    }
    
    func configure(for level: Int) {
        self.level = level
        // Настройка уровня
        switch level {
        case 1:
            totalRemainingShots = 60
            totalShots = 60
            setupLevel1()
        case 2:
            totalRemainingShots = 30
            totalShots = 30
            setupLevel2()
        case 3:
            totalRemainingShots = 6
            totalShots = 6
            setupLevel3()
        case 4:
            totalRemainingShots = 30
            totalShots = 30
            setupLevel4()
        case 5:
            totalRemainingShots = 30
            totalShots = 30
            setupLevel5()
        case 6:
            totalRemainingShots = 30
            totalShots = 30
            setupLevel6()
        case 7:
            totalRemainingShots = 8
            totalShots = 8
            setupLevel7()
        case 8:
            totalRemainingShots = 16
            totalShots = 16
            setupLevel8()
        case 9:
            totalRemainingShots = 16
            totalShots = 16
            setupLevel9()
        case 10:
            totalRemainingShots = 30
            totalShots = 30
            setupLevel10()
        default:
            totalRemainingShots = 60
            totalShots = 60
            setupLevel1()
        }
        shotsLabel.text = "\(totalRemainingShots)"
        boxLabel.text = "\(hits)/\(totalShots / 2)"
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
        
        // Добавляем физическое тело для коробки
        let boxPhysicsBody = SKPhysicsBody(texture: boxTexture, size: box.size)
        boxPhysicsBody.categoryBitMask = PhysicsCategory.Box
        boxPhysicsBody.isDynamic = false
        box.physicsBody = boxPhysicsBody
        
        addChild(box)
        setupBoxLabel()
    }
    
    private func setupBoxLabel() {
        let texture = SKTexture(imageNamed: Resources.Game.boxText)
        let boxText = SKSpriteNode(texture: texture)
        boxText.position = CGPoint(x: 0, y: -5)
        boxText.zPosition = 1
        box.addChild(boxText)
        
        boxLabel = SKLabelNode(fontNamed: "Modak")
        boxLabel.fontSize = 32
        boxLabel.fontColor = .white
        boxLabel.text = "\(hits)/\(totalShots / 2)"
        boxLabel.position = CGPoint(x: 0, y: -boxText.centerRect.height / 2 - 10)
        boxLabel.zPosition = 2
        boxText.addChild(boxLabel)
    }
    
    private func setupShotsLabel() {
        shotsLabel = SKLabelNode(fontNamed: "Modak")
        shotsLabel.fontSize = 20
        shotsLabel.fontColor = .white
        shotsLabel.text = "\(totalRemainingShots)"
        shotsLabel.position = CGPoint(x: 20, y: -20)
        shotsLabel.zPosition = 5
        gun.addChild(shotsLabel)
    }
    
    public func startBoxMovement() {
        let duration: TimeInterval
        switch level {
        case 1:
            duration = 2.0
        case 2:
            duration = 1.3
        case 3:
            duration = 3.0
        default:
            duration = 2.0
        }
        
        let moveRight = SKAction.moveTo(x: size.width - box.size.width / 2, duration: duration)
        let moveLeft = SKAction.moveTo(x: box.size.width / 2, duration: duration)
        let sequence = SKAction.sequence([moveRight, moveLeft])
        let repeatAction = SKAction.repeatForever(sequence)
        box.run(repeatAction)
    }
    
    private func shootBullet() {
        guard totalRemainingShots > 0 else {
            checkGameOver()
            return
        }

        let bullet = SKShapeNode(circleOfRadius: 10)
        bullet.fillColor = .yellow
        
        // Добавляем физическое тело для мячика
        let bulletPhysicsBody = SKPhysicsBody(circleOfRadius: 10)
        bulletPhysicsBody.categoryBitMask = PhysicsCategory.Bullet
        bulletPhysicsBody.contactTestBitMask = PhysicsCategory.Obstacle | PhysicsCategory.Box | PhysicsCategory.Block
        bulletPhysicsBody.collisionBitMask = PhysicsCategory.Obstacle
        bullet.physicsBody = bulletPhysicsBody
        
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
        
        totalRemainingShots -= 1
        shotsLabel.text = "\(totalRemainingShots)"
        checkGameOver()
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
    
    func togglePause() {
        isPaused = !isPaused
    }
    
    private func checkCollisions() {
        let reducedBoxFrame = CGRect(
            x: box.frame.origin.x + 5,
            y: box.frame.origin.y - 20,
            width: box.frame.size.width - 30,
            height: box.frame.size.height
        )
        
        for bullet in bullets {
            if reducedBoxFrame.contains(bullet.position) {
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
        boxLabel.text = "\(hits)/\(totalShots / 2)"
        checkGameOver()
    }
    
    private func checkGameOver() {
        let requiredHits = totalShots / 2
        if totalRemainingShots == 0 || hits >= requiredHits {
            gameSceneDelegate?.showGameOver(hits: hits, totalShots: totalShots)
        }
    }

    // Обработка столкновений
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if contactMask == PhysicsCategory.Bullet | PhysicsCategory.Block {
            if let bullet = contact.bodyA.node as? SKShapeNode ?? contact.bodyB.node as? SKShapeNode {
                bullet.removeFromParent()
            }
        }
    }
}
