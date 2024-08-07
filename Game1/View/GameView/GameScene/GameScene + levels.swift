//
//  GameScene + levels.swift
//  Game1
//
//  Created by Александр Андреев on 06.08.2024.
//

import Foundation
import SpriteKit

// MARK: - Levels
extension GameScene {
    
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
        setupHits()
       
    }

    // Настройка для уровня 1
    public func setupLevel1() {
        configureBox(size: CGSize(width: 120, height: 120), position: CGPoint(x: size.width / 2, y: 100))
        startBoxMovement()
    }
    
    // Настройка для уровня 2
    public func setupLevel2() {
        configureBox(size: CGSize(width: 120, height: 120), position: CGPoint(x: size.width / 2, y: 150))
        startBoxMovement()
    }
    
    // Настройка для уровня 3
    public func setupLevel3() {
        configureBox(size: CGSize(width: 120, height: 120), position: CGPoint(x: size.width / 2, y: 100))
        
        let movingBlock = createMovingBlock(imageName: "badBlock4", size: CGSize(width: 128, height: 51), position: CGPoint(x: size.width / 2, y: size.height / 1.5))
        addChild(movingBlock)
        
        startBoxMovement()
        startMovingBlock(movingBlock, duration: 1)
    }
    
    // Настройка для уровня 4
    public func setupLevel4() {
        configureBox(size: CGSize(width: 120, height: 120), position: CGPoint(x: size.width / 2, y: 200))
        
        let obstacle = createObstacle(imageName: Resources.Game.redBlock, size: CGSize(width: 100, height: 30), position: CGPoint(x: size.width / 2, y: 300), angle: .pi / 6)
        addChild(obstacle)
        
        startBoxMovement()
    }
    
    // Настройка для уровня 5
    public func setupLevel5() {
        configureBox(size: CGSize(width: 120, height: 120), position: CGPoint(x: size.width / 2, y: 100))
        
        let obstacle1 = createObstacle(imageName: Resources.Game.redBlock, size: CGSize(width: 200, height: 30), position: CGPoint(x: size.width / 3, y: size.width), angle: -.pi / 6)
        addChild(obstacle1)
        
        let obstacle2 = createObstacle(imageName: Resources.Game.redBlock, size: CGSize(width: 300, height: 30), position: CGPoint(x: size.width * 2 / 3, y: size.width - 100), angle: .pi / 6)
        addChild(obstacle2)
        
        startBoxMovement()
    }

    // Настройка для уровня 6
    public func setupLevel6() {
        configureBox(size: CGSize(width: 150, height: 150), position: CGPoint(x: size.width / 2, y: 100))
        
        let crescent = createRotatedSprite(imageName: "buba.png", size: CGSize(width: 100, height: 100), position: CGPoint(x: size.width / 2, y: size.height / 2), rotationAngle: 120.0 * .pi / 180.0)
        addChild(crescent)
        
        let movingBlock = createMovingBlock(imageName: "badBlock5", size: CGSize(width: 155, height: 51), position: CGPoint(x: size.width / 2, y: size.height / 3))
        addChild(movingBlock)
        
        startBoxMovement()
        startMovingBlock(movingBlock, duration: 4)
    }

    // Настройка для уровня 7
    public func setupLevel7() {
        let movingBlock1 = createMovingBlock(imageName: "badBlock4", size: CGSize(width: 128, height: 51), position: CGPoint(x: size.width / 4, y: size.height / 3))
        addChild(movingBlock1)
        
        let movingBlock2 = createMovingBlock(imageName: "badBlock2", size: CGSize(width: 76, height: 51), position: CGPoint(x: size.width - 100, y: size.height / 2))
        addChild(movingBlock2)
        
        startBoxMovement()
        startMovingBlock(movingBlock1, duration: 3)
        startMovingBlock(movingBlock2, duration: 4)
    }

    // Настройка для уровня 8
    public func setupLevel8() {
        configureBox(size: CGSize(width: 150, height: 150), position: CGPoint(x: size.width / 2, y: 100))
        
        let obstacle = createObstacle(imageName: Resources.Game.redBlock, size: CGSize(width: 200, height: 30), position: CGPoint(x: size.width / 1.7, y: size.width - 20), angle: .pi / 2.5)
        addChild(obstacle)
        
        let movingBlock = createMovingBlock(imageName: "badBlock1", size: CGSize(width: 76, height: 51), position: CGPoint(x: size.width - 300, y: size.height / 4))
        addChild(movingBlock)
        
        startBoxMovement()
        startMovingBlock(movingBlock, duration: 1)
    }

    // Настройка для уровня 9
    public func setupLevel9() {
        let obstacle = createObstacle(imageName: Resources.Game.redBlock, size: CGSize(width: 200, height: 30), position: CGPoint(x: size.width / 2, y: size.width / 2), angle: -.pi / 8)
        addChild(obstacle)
        
        let movingBlock1 = createMovingBlock(imageName: "badBlock1", size: CGSize(width: 51, height: 51), position: CGPoint(x: size.width - 100, y: size.height / 1.5))
        addChild(movingBlock1)
        
        let movingBlock2 = createMovingBlock(imageName: "badBlock2", size: CGSize(width: 76, height: 51), position: CGPoint(x: size.width - 300, y: size.height / 2))
        addChild(movingBlock2)
        
        startBoxMovement()
        startMovingBlock(movingBlock1, duration: 1)
        startMovingBlock(movingBlock2, duration: 1.5)
    }

    // Настройка для уровня 10
    public func setupLevel10() {
        let crescent = createRotatedSprite(imageName: "buba.png", size: CGSize(width: 80, height: 80), position: CGPoint(x: size.width / 3, y: size.height / 3.2), rotationAngle: 40.0 * .pi / 180.0)
        addChild(crescent)
        
        let obstacle1 = createObstacle(imageName: Resources.Game.redBlock, size: CGSize(width: 100, height: 30), position: CGPoint(x: size.width / 2, y: size.height / 1.5), angle: -.pi / 5)
        addChild(obstacle1)
        
        let obstacle2 = createObstacle(imageName: Resources.Game.redBlock, size: CGSize(width: 200, height: 30), position: CGPoint(x: size.width * 2 / 3, y: size.height / 2), angle: .pi / 6)
        addChild(obstacle2)
        
        startBoxMovement()
    }

    // Функция для настройки коробки
    private func configureBox(size: CGSize, position: CGPoint) {
        box.size = size
        box.position = position
    }

    // Функция для создания движущегося блока
    private func createMovingBlock(imageName: String, size: CGSize, position: CGPoint) -> SKSpriteNode {
        let texture = SKTexture(imageNamed: imageName)
        let block = SKSpriteNode(texture: texture)
        block.size = size
        block.position = position
        block.zPosition = 1
        
        let physicsBody = SKPhysicsBody(texture: texture, size: size)
        physicsBody.categoryBitMask = PhysicsCategory.Block
        physicsBody.isDynamic = false
        physicsBody.friction = 0.5
        physicsBody.restitution = 0.0
        block.physicsBody = physicsBody
        
        return block
    }

    // Функция для создания препятствия
    private func createObstacle(imageName: String, size: CGSize, position: CGPoint, angle: CGFloat) -> SKSpriteNode {
        let texture = SKTexture(imageNamed: imageName)
        let obstacle = SKSpriteNode(texture: texture)
        obstacle.size = size
        obstacle.position = position
        obstacle.zPosition = 1
        obstacle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let rotation = SKAction.rotate(byAngle: angle, duration: 0)
        obstacle.run(rotation)
        
        let physicsBody = SKPhysicsBody(texture: texture, size: size)
        physicsBody.isDynamic = false
        obstacle.physicsBody = physicsBody
        
        return obstacle
    }

    // Функция для создания вращающегося спрайта
    private func createRotatedSprite(imageName: String, size: CGSize, position: CGPoint, rotationAngle: CGFloat) -> SKSpriteNode {
        let texture = SKTexture(imageNamed: imageName)
        let sprite = SKSpriteNode(texture: texture)
        sprite.size = size
        sprite.position = position
        sprite.zPosition = 1
        sprite.zRotation = rotationAngle
        
        let physicsBody = SKPhysicsBody(texture: texture, size: size)
        physicsBody.isDynamic = false
        sprite.physicsBody = physicsBody
        
        return sprite
    }

    // Функция для запуска движения блока
    private func startMovingBlock(_ block: SKSpriteNode, duration: TimeInterval) {
            let moveRight = SKAction.moveTo(x: size.width - block.size.width / 2, duration: duration)
            let moveLeft = SKAction.moveTo(x: block.size.width / 2, duration: duration)
            let sequence = SKAction.sequence([moveRight, moveLeft])
            let repeatAction = SKAction.repeatForever(sequence)
            block.run(repeatAction)
        }
}
