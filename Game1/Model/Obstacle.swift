//
//  Obstacle.swift
//  Game1
//
//  Created by Александр Андреев on 06.08.2024.
//

import Foundation
import SpriteKit

class Obstacle: SKSpriteNode {
    init(texture: SKTexture) {
        super.init(texture: texture, color: .clear, size: texture.size())
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.isDynamic = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
