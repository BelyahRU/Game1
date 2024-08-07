//
//  LevelsViewModel.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation
class LevelsViewModel {
    
    
    func getLevel(by index: Int) -> Level? {
        return LevelManager.shared.level(for: index)
    }
    
    
}
