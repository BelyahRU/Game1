//
//  GameScene + Moving.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation
import SpriteKit

// MARK: - Moving
extension GameScene {
    
    // Начало движения коробки
    public func startBoxMovement() {
        let duration: TimeInterval
        switch level {
        case 1:
            duration = 2.0
        case 2:
            duration = 1.3
        case 3:
            duration = 3.0
        case 10:
            duration = 1.5
        default:
            duration = 2.0
        }
        
        let moveRight = SKAction.moveTo(x: size.width - box.size.width / 2, duration: duration)
        let moveLeft = SKAction.moveTo(x: box.size.width / 2, duration: duration)
        let sequence = SKAction.sequence([moveRight, moveLeft])
        let repeatAction = SKAction.repeatForever(sequence)
        box.run(repeatAction)
    }
    
    // Выстрел мячиком
    public func shootBullet() {
        guard totalRemainingShots > 0 else {
            checkGameOver()
            return
        }
        let bulletImages = ["ball1", "ball2", "ball3", "ball4", "ball5", "ball6"]

        let bullet = SKSpriteNode(imageNamed: bulletImages.randomElement()!) // Замените "bulletImage" на имя вашего изображения мяча
        bullet.size = CGSize(width: 20, height: 20) // Подгоните размер под ваш радиус 10
        
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
        let playSoundAction = SKAction.run {
            AudioManager.shared.ballMissedEffect()
        }
        let sequence = SKAction.sequence([moveAction, playSoundAction, removeAction])
        bullet.run(sequence) { [weak self] in
            if let self = self, let index = self.bullets.firstIndex(of: bullet) {
                self.bullets.remove(at: index)
            }
        }
        
        totalRemainingShots -= 1
        shotsLabel.text = "\(totalRemainingShots)"
        checkGameOver()
    }


    
    // Обработка столкновений
    public func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if contactMask == PhysicsCategory.Bullet | PhysicsCategory.Block {
            if let bullet = contact.bodyA.node as? SKSpriteNode ?? contact.bodyB.node as? SKSpriteNode {
                bullet.removeFromParent()
            }
        }
    }
    // Проверка столкновений
    public func checkCollisions() {
        let reducedBoxFrame = CGRect(
            x: box.frame.origin.x ,
            y: box.frame.origin.y - 10,
            width: box.frame.size.width - 50,
            height: box.frame.size.height - 20
        )
        
        for bullet in bullets {
            let bulletFrame = CGRect(
                x: bullet.position.x - bullet.frame.size.width / 2,
                y: bullet.position.y - bullet.frame.size.height / 2,
                width: bullet.frame.size.width,
                height: bullet.frame.size.height
            )
            
            if reducedBoxFrame.intersects(bulletFrame) {
                if bullet.position.y > box.position.y {
                    bullet.removeFromParent()
                    if let index = bullets.firstIndex(of: bullet) {
                        bullets.remove(at: index)
                    }
                    AudioManager.shared.ballBasketEffect()
                    incrementHits()
                } else {
                    AudioManager.shared.ballMissedEffect()
                }
            }
        }
    }
}
