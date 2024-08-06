//
//  LevelManager.swift
//  Game1
//
//  Created by Александр Андреев on 06.08.2024.
//

import Foundation

class LevelManager {
    
    static let shared = LevelManager()
    
    private init() {}
    
    private let levelsCount = 10 // Общее количество уровней
    
    // MARK: - Current Level
    
    var currentLevel: Int {
        get {
            return UserDefaults.standard.integer(forKey: Keys.currentLevel.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.currentLevel.rawValue)
        }
    }
    
    private enum Keys: String {
        case currentLevel
    }
    
    // MARK: - Methods
    
    func getLevelData(levelNumber: Int) -> LevelData? {
        return UserDataManager.shared.levelData.first { $0.levelNumber == levelNumber }
    }
    
    func saveLevelData(levelNumber: Int, stars: Int) {
        UserDataManager.shared.updateLevelData(levelNumber: levelNumber, stars: stars)
    }
    
    func getNextLevel() -> Int? {
        let nextLevel = currentLevel + 1
        return nextLevel <= levelsCount ? nextLevel : nil
    }
    
    func resetProgress() {
        UserDefaults.standard.removeObject(forKey: Keys.currentLevel.rawValue)
        UserDataManager.shared.levelData = []
    }
    
    func initializeLevels() {
        // Проверяем, были ли уже инициализированы уровни
        if UserDataManager.shared.levelData.isEmpty {
            // Инициализация данных уровней
            var initialLevelData: [LevelData] = []
            for levelNumber in 1...levelsCount {
                let levelData = LevelData(levelNumber: levelNumber, stars: 0)
                initialLevelData.append(levelData)
            }
            UserDataManager.shared.levelData = initialLevelData
            UserDefaults.standard.set(1, forKey: Keys.currentLevel.rawValue) // Начальный уровень
        }
    }
}
