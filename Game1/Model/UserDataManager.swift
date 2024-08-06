//
//  UserDataManager.swift
//  Game1
//
//  Created by Александр Андреев on 06.08.2024.
//

import Foundation

class UserDataManager {
    
    // MARK: - Properties
    
    static let shared = UserDataManager()
    
    private let userDefaults = UserDefaults.standard
    
    private enum Keys: String {
        case money
        case levelData
    }
    
    // MARK: - Initializer
    
    private init() {}
    
    // MARK: - Money
    
    var money: Int {
        get {
            return userDefaults.integer(forKey: Keys.money.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: Keys.money.rawValue)
        }
    }
    
    
    var levelData: [LevelData] {
            get {
                if let data = UserDefaults.standard.data(forKey: Keys.levelData.rawValue) {
                    return (try? JSONDecoder().decode([LevelData].self, from: data)) ?? []
                }
                return []
            }
            set {
                if let data = try? JSONEncoder().encode(newValue) {
                    UserDefaults.standard.set(data, forKey: Keys.levelData.rawValue)
                }
            }
        }
        
    func updateLevelData(levelNumber: Int, stars: Int) {
        var updatedData = levelData
        if let index = updatedData.firstIndex(where: { $0.levelNumber == levelNumber }) {
            updatedData[index].stars = stars
        } else {
            updatedData.append(LevelData(levelNumber: levelNumber, stars: stars))
        }
        levelData = updatedData
    }
    
    // MARK: - Methods
    
    func addMoney(_ amount: Int) {
        money += amount
    }
}
