//
//  GameOverViewModel.swift
//  Game1
//
//  Created by Александр Андреев on 06.08.2024.
//

import Foundation
class GameOverViewModel {
    
    private var hits: Int = 0
    private var totalShots: Int = 0
    public var level: Level?
    private var isFirstTry: Bool = true
    
    private var coins = 0
    private var stars = 0
    
    public var coefficient: Float {
        if totalShots == 0 {
            print(0)
            return 0
        }
        print(Float(hits) / (Float(totalShots) / 2))
        return Float(hits) / (Float(totalShots) / 2)
    }
    
    public func setupHits(hits: Int) {
        self.hits = hits
    }
    
    public func setupTotalShots(shots: Int) {
        self.totalShots = shots
    }
    
    public func setupLevel(levelId: Int) {
        guard let level = LevelManager.shared.level(for: levelId) else {
            print("Error: Level with id \(levelId) not found")
            return
        }
        self.level = level
    }
    
    func countingMoney() -> Int {
        if coefficient == 1 {
            self.coins = 1000
        } else if coefficient >= 0.7 {
            self.coins = 700
        } else if coefficient >= 0.5{
            self.coins = 500
        } else {
            self.coins = 300
        }
        
        if let level = level, level.isCompleted {
            self.coins /= 10
        }
        
        return self.coins
    }
    
    func countingStars() -> Int {
        if coefficient == 1 {
            self.stars = 3
        } else if coefficient >= 0.7 {
            self.stars = 2
        } else if coefficient >= 0.5{
            self.stars = 1
        } else {
            self.stars = 0
        }
        
        return self.stars
    }
    
    func reloadLevelManager() {
        LevelManager.shared.addCoins(self.coins)
        
        guard var level = self.level else {
            print("Error: Level is not set")
            return
        }
        print(level, stars)
        if stars > level.stars {
            level.stars = stars
        }
        if level.stars > 0 && level.isCompleted == false {
            level.isCompleted = true
        }
        
        LevelManager.shared.updateLevel(level: level)
    }
}
