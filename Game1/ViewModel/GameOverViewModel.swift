//
//  GameOverViewModel.swift
//  Game1
//
//  Created by Александр Андреев on 06.08.2024.
//

import Foundation
class GameOverViewModel {
    
    public var hits: Int = 0
    public var totalShots: Int = 0
    public var isFirstTry: Bool = true
    
    public var coefficient: Float {
        if totalShots == 0 {
            return 0
        }
        return Float(hits) / Float(totalShots)
    }
    
    
    func countingMoney() -> Int {
        
        if isFirstTry {
            if coefficient == 1 {
                return 1000
            } else if coefficient > 0.7 {
                return 700
            } else {
                return 500
            }
        } else {
            if coefficient == 1 {
                return 100
            } else if coefficient > 0.7 {
                return 70
            } else {
                return 50
            }
        }
    }
    
    func couningStars() -> Int {
        if coefficient == 1 {
            return 3
        } else if coefficient > 0.7 {
            return 2
        } else {
            return 1
        }
    }
}
