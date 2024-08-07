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

// MARK: - GameScene
class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // MARK: - Properties
    public var gun: SKSpriteNode!
    public var box: SKSpriteNode!
    private var boxLabel: SKLabelNode!
    public var bullets: [SKSpriteNode] = []
    private var isShooting = false
    private var hits = 0 // Количество попаданий в коробку
    private var lastShotTime: TimeInterval = 0
    private let shootInterval: TimeInterval = 0.5
    private var topBorder: SKSpriteNode!
    private var debugBox: SKSpriteNode!

    public var totalShots = 60
    public var totalRemainingShots = 60 // Общее количество выстрелов
    public var shotsLabel: SKLabelNode! // Лейбл для отображения оставшихся выстрелов
    
    public var level: Int = 1 // Уровень игры
    
    // MARK: - Delegate
    weak var gameSceneDelegate: GameSceneDelegate?

    
    // MARK: - Methods
    override func didMove(to view: SKView) {
        self.backgroundColor = .clear
        setupGun()
        setupBox()
        setupShotsLabel()
        setupContactDelegate()
        setupDebugBorders()
    }
    
    public func setupHits() {
        boxLabel.text = "\(hits)/\(totalShots / 2)"
    }
    
    public func setupTotalRemainingShots() {
        shotsLabel.text = "\(totalRemainingShots)"
    }
    
    private func setupContactDelegate() {
        physicsWorld.contactDelegate = self
    }

    // Настройка пушки
    private func setupGun() {
        let set = ShopManager.shared.getCurrentSet()
        //
        let gunTexture = SKTexture(imageNamed: set?.cannonImageName ?? "gun")
        gun = SKSpriteNode(texture: gunTexture)
        gun.position = CGPoint(x: size.width / 2, y: size.height - 100)
        addChild(gun)
    }
    
    // Настройка коробки
    private func setupBox() {
        let set = ShopManager.shared.getCurrentSet()
        //
        let boxTexture = SKTexture(imageNamed: set?.boxImageName ?? "box")
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
    
    // Настройка лейбла для коробки
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
    
    // Настройка лейбла для оставшихся выстрелов
    private func setupShotsLabel() {
        let set = ShopManager.shared.getCurrentSet()
        shotsLabel = SKLabelNode(fontNamed: "Modak")
        shotsLabel.fontSize = 20
        shotsLabel.fontColor = .white
        shotsLabel.text = "\(totalRemainingShots)"
        if set!.id == "1" {
            shotsLabel.position = CGPoint(x: 10, y: -20)
        } else if set!.id == "2" {
            shotsLabel.position = CGPoint(x: 3, y: -20)
        } else if set!.id == "3"{
            shotsLabel.position = CGPoint(x: 7, y: -20)
        } else if set!.id == "4"{
            shotsLabel.position = CGPoint(x: 15, y: -10)
        } else {
            shotsLabel.position = CGPoint(x: 20, y: -20)
        }
        shotsLabel.zPosition = 5
        gun.addChild(shotsLabel)
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

        // Обновление позиций отладочных узлов, чтобы они двигались вместе с коробкой
        topBorder.position = CGPoint(x: box.position.x, y: box.position.y + box.size.height / 2)
        debugBox.position = CGPoint(x: box.position.x, y: box.position.y)
    }

    // Переключение паузы
    func togglePause() {
        isPaused = !isPaused
    }
    
    // Увеличение количества попаданий
    public func incrementHits() {
        hits += 1
        boxLabel.text = "\(hits)/\(totalShots / 2)"
        checkGameOver()
    }
    
    // Проверка конца игры
    public func checkGameOver() {
        let requiredHits = totalShots / 2
        if totalRemainingShots == 0 || hits >= requiredHits {
            AudioManager.shared.gameOverEffect()
            gameSceneDelegate?.showGameOver(hits: hits, totalShots: totalShots)
        }
    }

    // Настройка отладочных границ
    private func setupDebugBorders() {
        // Временные границы для проверки попадания в коробку
        let borderColor = UIColor.blue.withAlphaComponent(0.3) // Полупрозрачный синий цвет

        // Верхняя граница (где мячик должен попасть сверху)
        topBorder = SKSpriteNode(color: borderColor, size: CGSize(width: box.size.width - 10, height: 2))
        topBorder.position = CGPoint(x: box.position.x, y: box.position.y + box.size.height / 2)
        topBorder.zPosition = 10 // Убедитесь, что граница выше других узлов
        // addChild(topBorder)

        // Вспомогательные границы, чтобы увидеть область коробки
        let debugBoxFrame = CGRect(
            x: box.frame.origin.x,
            y: box.frame.origin.y - 10,
            width: box.frame.size.width - 50,
            height: box.frame.size.height - 20
        )

        debugBox = SKSpriteNode(color: borderColor, size: CGSize(width: debugBoxFrame.width, height: debugBoxFrame.height))
        debugBox.position = CGPoint(x: debugBoxFrame.midX, y: debugBoxFrame.midY)
        debugBox.zPosition = 9 // Убедитесь, что граница ниже верхней границы
        // addChild(debugBox)
    }
}
