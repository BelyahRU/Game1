//
//  GameScene + levels.swift
//  Game1
//
//  Created by Александр Андреев on 06.08.2024.
//

import Foundation
import SpriteKit

extension GameScene {
    // Level-specific setup
    public func setupLevel1() {
        // Настройка для уровня 1
        box.size = CGSize(width: 100, height: 100)
        box.position = CGPoint(x: size.width / 2, y: 100)
        startBoxMovement()
    }
    
    public func setupLevel2() {
        // Настройка для уровня 2
        box.size = CGSize(width: 120, height: 120)
        box.position = CGPoint(x: size.width / 2, y: 150)
        startBoxMovement()
    }
    
    public func setupLevel3() {
        // Настройка для уровня 3
        box.size = CGSize(width: 150, height: 150)
        box.position = CGPoint(x: size.width / 2, y: 100)
        
        // Создаем движущийся блок с изображением
        let movingBlockTexture = SKTexture(imageNamed: "badBlock4") // Имя вашего изображения
        let movingBlock = SKSpriteNode(texture: movingBlockTexture)
        movingBlock.size = CGSize(width: 128, height: 51) // Установите размер спрайта
        movingBlock.position = CGPoint(x: size.width / 2, y: size.height / 1.5)
        movingBlock.zPosition = 1
        
        // Добавляем физику для блока
        let movingBlockPhysicsBody = SKPhysicsBody(texture: movingBlockTexture, size: movingBlock.size)
        movingBlockPhysicsBody.categoryBitMask = PhysicsCategory.Block
        movingBlockPhysicsBody.isDynamic = false
        movingBlockPhysicsBody.friction = 0.5  // Настройте трение
        movingBlockPhysicsBody.restitution = 0.0  // Настройте упругость
        movingBlock.physicsBody = movingBlockPhysicsBody
        
        addChild(movingBlock)
        
        // Запускаем движение блока и коробки
        startBoxMovement()
        startMovingBlock(movingBlock, duration: 1)
//        startBoxMovement()
    }
    
    public func setupLevel4() {
        // Настройка для уровня 4
        // Измените размеры и позицию коробки при необходимости
        box.size = CGSize(width: 150, height: 150)
        box.position = CGPoint(x: size.width / 2, y: 200)
        
        // Создаем спрайт для наклонного препятствия с изображением
        let obstacleTexture = SKTexture(imageNamed:
                                            Resources.Game.redBlock) // Замените на имя вашего изображения
        let obstacle = SKSpriteNode(texture: obstacleTexture)
        obstacle.size = CGSize(width: 100, height: 30) // Установите размер спрайта
        obstacle.position = CGPoint(x: size.width / 2, y: 300)
        obstacle.zPosition = 1
        obstacle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // Создаем наклонное препятствие
        let angle: CGFloat = .pi / 6 // 30 градусов
        let rotation = SKAction.rotate(byAngle: angle, duration: 0)
        obstacle.run(rotation)
        
        addChild(obstacle)
        
        // Добавляем физику для наклонного препятствия
        let obstaclePhysicsBody = SKPhysicsBody(texture: obstacleTexture, size: obstacle.size)
        obstaclePhysicsBody.isDynamic = false
        obstacle.physicsBody = obstaclePhysicsBody
        
        startBoxMovement()
    }
    
    public func setupLevel5() {
        // Настройка для уровня 5
        box.size = CGSize(width: 150, height: 150)
        box.position = CGPoint(x: size.width / 2, y: 100)
        
        // Создаем первое наклонное препятствие (наклон влево)
        let obstacleTexture1 = SKTexture(imageNamed: Resources.Game.redBlock) // Замените на имя вашего изображения
        let obstacle1 = SKSpriteNode(texture: obstacleTexture1)
        obstacle1.size = CGSize(width: 200, height: 30) // Установите размер спрайта
        obstacle1.position = CGPoint(x: size.width / 3, y: size.width )
        obstacle1.zPosition = 1
        obstacle1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // Устанавливаем наклон влево (30 градусов)
        let angle1: CGFloat = -.pi / 6 // -30 градусов
        let rotation1 = SKAction.rotate(byAngle: angle1, duration: 0)
        obstacle1.run(rotation1)
        
        addChild(obstacle1)
        
        // Добавляем физику для первого наклонного препятствия
        let obstaclePhysicsBody1 = SKPhysicsBody(texture: obstacleTexture1, size: obstacle1.size)
        obstaclePhysicsBody1.isDynamic = false
        obstacle1.physicsBody = obstaclePhysicsBody1

        // Создаем второе наклонное препятствие (наклон вправо)
        let obstacleTexture2 = SKTexture(imageNamed: Resources.Game.redBlock) // Замените на имя вашего изображения
        let obstacle2 = SKSpriteNode(texture: obstacleTexture2)
        obstacle2.size = CGSize(width: 300, height: 30) // Установите размер спрайта
        obstacle2.position = CGPoint(x: size.width * 2 / 3, y: size.width - 100) // Позиция ниже, чтобы игрок попал на второе препятствие после первого
        obstacle2.zPosition = 1
        obstacle2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // Устанавливаем наклон вправо (30 градусов)
        let angle2: CGFloat = .pi / 6 // 30 градусов
        let rotation2 = SKAction.rotate(byAngle: angle2, duration: 0)
        obstacle2.run(rotation2)
        
        addChild(obstacle2)
        
        // Добавляем физику для второго наклонного препятствия
        let obstaclePhysicsBody2 = SKPhysicsBody(texture: obstacleTexture2, size: obstacle2.size)
        obstaclePhysicsBody2.isDynamic = false
        obstacle2.physicsBody = obstaclePhysicsBody2

        startBoxMovement()
    }

    
    public func setupLevel6() {
            // Настройка для уровня 6
            box.size = CGSize(width: 150, height: 150)
            box.position = CGPoint(x: size.width / 2, y: 100)
            
            // Создаем полумесяц с изображением
            let crescentTexture = SKTexture(imageNamed: "buba.png") // Имя вашего изображения
            let crescent = SKSpriteNode(texture: crescentTexture)
            crescent.size = CGSize(width: 100, height: 100) // Установите размер спрайта
            crescent.position = CGPoint(x: size.width / 2, y: size.height / 2)
            crescent.zPosition = 1
            
            // Поворот полумесяца на 120 градусов (в радианах)
            let rotationAngle: CGFloat = 120.0 * .pi / 180.0 // Преобразуем градусы в радианы
            crescent.zRotation = rotationAngle
            
            // Добавляем физику для полумесяца
            let crescentPhysicsBody = SKPhysicsBody(texture: crescentTexture, size: crescent.size)
            crescentPhysicsBody.isDynamic = false
            crescentPhysicsBody.friction = 0.5  // Настройте трение
            crescentPhysicsBody.restitution = 0.0  // Настройте упругость
            crescent.physicsBody = crescentPhysicsBody
            
            addChild(crescent)
            
            // Создаем движущийся блок с изображением
            let movingBlockTexture = SKTexture(imageNamed: "badBlock5") // Имя вашего изображения
            let movingBlock = SKSpriteNode(texture: movingBlockTexture)
            movingBlock.size = CGSize(width: 155, height: 51) // Установите размер спрайта
            movingBlock.position = CGPoint(x: size.width / 2, y: size.height / 3)
            movingBlock.zPosition = 1
            
            // Добавляем физику для блока
            let movingBlockPhysicsBody = SKPhysicsBody(texture: movingBlockTexture, size: movingBlock.size)
            movingBlockPhysicsBody.categoryBitMask = PhysicsCategory.Block
            movingBlockPhysicsBody.isDynamic = false
            movingBlockPhysicsBody.friction = 0.5  // Настройте трение
            movingBlockPhysicsBody.restitution = 0.0  // Настройте упругость
            movingBlock.physicsBody = movingBlockPhysicsBody
            
            addChild(movingBlock)
            
            // Запускаем движение блока и коробки
            startBoxMovement()
            startMovingBlock(movingBlock, duration: 4)
        }

    // Функция для движения блока влево и вправо
    private func startMovingBlock(_ block: SKSpriteNode, duration: TimeInterval) {
        let moveRight = SKAction.moveTo(x: size.width - block.size.width / 2, duration: duration)
        let moveLeft = SKAction.moveTo(x: block.size.width / 2, duration: duration)
        let sequence = SKAction.sequence([moveRight, moveLeft])
        let repeatAction = SKAction.repeatForever(sequence)
        block.run(repeatAction)
    }
    
    func setupLevel7() {
    // Создаем движущийся блок с изображением
        let movingBlockTexture1 = SKTexture(imageNamed: "badBlock4") // Имя вашего изображения
        let movingBlock1 = SKSpriteNode(texture: movingBlockTexture1)
        movingBlock1.size = CGSize(width: 128, height: 51) // Установите размер спрайта
        movingBlock1.position = CGPoint(x: size.width / 4, y: size.height / 3)
        movingBlock1.zPosition = 1
        
        // Добавляем физику для блока
        let movingBlockPhysicsBody1 = SKPhysicsBody(texture: movingBlockTexture1, size: movingBlock1.size)
        movingBlockPhysicsBody1.categoryBitMask = PhysicsCategory.Block
        movingBlockPhysicsBody1.isDynamic = false
        movingBlockPhysicsBody1.friction = 0.5  // Настройте трение
        movingBlockPhysicsBody1.restitution = 0.0  // Настройте упругость
        movingBlock1.physicsBody = movingBlockPhysicsBody1
        
        addChild(movingBlock1)
        
        // Создаем движущийся блок с изображением
        let movingBlockTexture = SKTexture(imageNamed: "badBlock2") // Имя вашего изображения
        let movingBlock = SKSpriteNode(texture: movingBlockTexture)
        movingBlock.size = CGSize(width: 76, height: 51) // Установите размер спрайта
        movingBlock.position = CGPoint(x: size.width-100, y: size.height / 2)
        movingBlock.zPosition = 1
        
        // Добавляем физику для блока
        let movingBlockPhysicsBody = SKPhysicsBody(texture: movingBlockTexture, size: movingBlock.size)
        movingBlockPhysicsBody.categoryBitMask = PhysicsCategory.Block
        movingBlockPhysicsBody.isDynamic = false
        movingBlockPhysicsBody.friction = 0.5  // Настройте трение
        movingBlockPhysicsBody.restitution = 0.0  // Настройте упругость
        movingBlock.physicsBody = movingBlockPhysicsBody
        
        addChild(movingBlock)
        
        // Запускаем движение блока и коробки
        startBoxMovement()
        startMovingBlock(movingBlock, duration: 4)
        
        // Запускаем движение блока и коробки
//        startBoxMovement()
        startMovingBlock(movingBlock1, duration: 3)
    }

    func setupLevel8() {
        // Настройка для уровня 5
        box.size = CGSize(width: 150, height: 150)
        box.position = CGPoint(x: size.width / 2, y: 100)
        
        

        // Создаем второе наклонное препятствие (наклон вправо)
        let obstacleTexture2 = SKTexture(imageNamed: Resources.Game.redBlock) // Замените на имя вашего изображения
        let obstacle2 = SKSpriteNode(texture: obstacleTexture2)
        obstacle2.size = CGSize(width: 200, height: 30) // Установите размер спрайта
        obstacle2.position = CGPoint(x: size.width / 1.7, y: size.width - 20) // Позиция ниже, чтобы игрок попал на второе препятствие после первого
        obstacle2.zPosition = 1
        obstacle2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // Устанавливаем наклон вправо (30 градусов)
        let angle2: CGFloat = .pi / 2.5 // 30 градусов
        let rotation2 = SKAction.rotate(byAngle: angle2, duration: 0)
        obstacle2.run(rotation2)
        
        addChild(obstacle2)
        
        // Добавляем физику для второго наклонного препятствия
        let obstaclePhysicsBody2 = SKPhysicsBody(texture: obstacleTexture2, size: obstacle2.size)
        obstaclePhysicsBody2.isDynamic = false
        obstacle2.physicsBody = obstaclePhysicsBody2
        
        // Создаем движущийся блок с изображением
        let movingBlockTexture = SKTexture(imageNamed: "badBlock1") // Имя вашего изображения
        let movingBlock = SKSpriteNode(texture: movingBlockTexture)
        movingBlock.size = CGSize(width: 76, height: 51) // Установите размер спрайта
        movingBlock.position = CGPoint(x: size.width-300, y: size.height / 4)
        movingBlock.zPosition = 1
        
        // Добавляем физику для блока
        let movingBlockPhysicsBody = SKPhysicsBody(texture: movingBlockTexture, size: movingBlock.size)
        movingBlockPhysicsBody.categoryBitMask = PhysicsCategory.Block
        movingBlockPhysicsBody.isDynamic = false
        movingBlockPhysicsBody.friction = 0.5  // Настройте трение
        movingBlockPhysicsBody.restitution = 0.0  // Настройте упругость
        movingBlock.physicsBody = movingBlockPhysicsBody
        
        addChild(movingBlock)
        
        startBoxMovement()
        startMovingBlock(movingBlock, duration: 1)
    }

    func setupLevel9() {
        
        // Создаем первое наклонное препятствие (наклон влево)
        let obstacleTexture1 = SKTexture(imageNamed: Resources.Game.redBlock) // Замените на имя вашего изображения
        let obstacle1 = SKSpriteNode(texture: obstacleTexture1)
        obstacle1.size = CGSize(width: 200, height: 30) // Установите размер спрайта
        obstacle1.position = CGPoint(x: size.width / 2, y: size.width / 2 )
        obstacle1.zPosition = 1
        obstacle1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // Устанавливаем наклон влево (30 градусов)
        let angle1: CGFloat = -.pi / 8 // -30 градусов
        let rotation1 = SKAction.rotate(byAngle: angle1, duration: 0)
        obstacle1.run(rotation1)
        
        addChild(obstacle1)
        
        // Добавляем физику для первого наклонного препятствия
        let obstaclePhysicsBody1 = SKPhysicsBody(texture: obstacleTexture1, size: obstacle1.size)
        obstaclePhysicsBody1.isDynamic = false
        obstacle1.physicsBody = obstaclePhysicsBody1
        
        // Создаем движущийся блок с изображением
        let movingBlockTexture = SKTexture(imageNamed: "badBlock1") // Имя вашего изображения
        let movingBlock = SKSpriteNode(texture: movingBlockTexture)
        movingBlock.size = CGSize(width: 51, height: 51) // Установите размер спрайта
        movingBlock.position = CGPoint(x: size.width-100, y: size.height / 1.5)
        movingBlock.zPosition = 1
        
        // Добавляем физику для блока
        let movingBlockPhysicsBody = SKPhysicsBody(texture: movingBlockTexture, size: movingBlock.size)
        movingBlockPhysicsBody.categoryBitMask = PhysicsCategory.Block
        movingBlockPhysicsBody.isDynamic = false
        movingBlockPhysicsBody.friction = 0.5  // Настройте трение
        movingBlockPhysicsBody.restitution = 0.0  // Настройте упругость
        movingBlock.physicsBody = movingBlockPhysicsBody
        
        addChild(movingBlock)
        
        let movingBlockTexture1 = SKTexture(imageNamed: "badBlock2") // Имя вашего изображения
        let movingBlock1 = SKSpriteNode(texture: movingBlockTexture1)
        movingBlock1.size = CGSize(width: 76, height: 51) // Установите размер спрайта
        movingBlock1.position = CGPoint(x: size.width-300, y: size.height / 2)
        movingBlock1.zPosition = 1
        
        // Добавляем физику для блока
        let movingBlockPhysicsBody1 = SKPhysicsBody(texture: movingBlockTexture1, size: movingBlock1.size)
        movingBlockPhysicsBody1.categoryBitMask = PhysicsCategory.Block
        movingBlockPhysicsBody1.isDynamic = false
        movingBlockPhysicsBody1.friction = 1  // Настройте трение
        movingBlockPhysicsBody1.restitution = 0.5  // Настройте упругость
        movingBlock1.physicsBody = movingBlockPhysicsBody1
        
        addChild(movingBlock1)
        
        startBoxMovement()
        startMovingBlock(movingBlock, duration: 1)
        startMovingBlock(movingBlock1, duration: 1.5)
    }




    func setupLevel10() {
        // Создаем первое наклонное препятствие (наклон влево)
        let obstacleTexture1 = SKTexture(imageNamed: Resources.Game.redBlock) // Замените на имя вашего изображения
        let obstacle1 = SKSpriteNode(texture: obstacleTexture1)
        obstacle1.size = CGSize(width: 100, height: 30) // Установите размер спрайта
        obstacle1.position = CGPoint(x: size.width / 2, y: size.height / 1.5 )
        obstacle1.zPosition = 1
        obstacle1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // Устанавливаем наклон влево (30 градусов)
        let angle1: CGFloat = -.pi / 5 // -30 градусов
        let rotation1 = SKAction.rotate(byAngle: angle1, duration: 0)
        obstacle1.run(rotation1)
        
        addChild(obstacle1)
        
        // Добавляем физику для первого наклонного препятствия
        let obstaclePhysicsBody1 = SKPhysicsBody(texture: obstacleTexture1, size: obstacle1.size)
        obstaclePhysicsBody1.isDynamic = false
        obstacle1.physicsBody = obstaclePhysicsBody1
        
        
        // Создаем второе наклонное препятствие (наклон вправо)
        let obstacleTexture2 = SKTexture(imageNamed: Resources.Game.redBlock) // Замените на имя вашего изображения
        let obstacle2 = SKSpriteNode(texture: obstacleTexture2)
        obstacle2.size = CGSize(width: 200, height: 30) // Установите размер спрайта
        obstacle2.position = CGPoint(x: size.width * 2 / 3, y: size.height / 3) // Позиция ниже, чтобы игрок попал на второе препятствие после первого
        obstacle2.zPosition = 1
        obstacle2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // Устанавливаем наклон вправо (30 градусов)
        let angle2: CGFloat = .pi / 6 // 30 градусов
        let rotation2 = SKAction.rotate(byAngle: angle2, duration: 0)
        obstacle2.run(rotation2)
        
        addChild(obstacle2)
        
        // Добавляем физику для второго наклонного препятствия
        let obstaclePhysicsBody2 = SKPhysicsBody(texture: obstacleTexture2, size: obstacle2.size)
        obstaclePhysicsBody2.isDynamic = false
        obstacle2.physicsBody = obstaclePhysicsBody2
        
    }





}
