//
//  LevelManager.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation

class LevelManager {
    static let shared = LevelManager()
    
    private let totalLevels = 10
    private var levels: [Level] = []
    private var totalCoins: Int = 0

    private init() {
        // Загрузка данных из UserDefaults при инициализации менеджера уровней
        loadLevels()
        loadCoins()
    }
    
    /// Возвращает уровень по его номеру.
    /// - Parameter number: Номер уровня (начиная с 1).
    /// - Returns: Объект `Level`, если уровень существует, или `nil`, если нет.
    func level(for number: Int) -> Level? {
        guard number > 0 && number <= totalLevels else { return nil }
        return levels.first { $0.levelNumber == number }
    }
    
    /// Обновляет данные уровня.
    /// - Parameter level: Уровень, который нужно обновить.
    func updateLevel(level: Level) {
        if let index = levels.firstIndex(where: { $0.levelNumber == level.levelNumber }) {
            levels[index] = level
        }
    }
    
    /// Отмечает уровень как пройденный, присваивая ему количество звездочек.
    /// Также открывает следующий уровень и добавляет монеты к общему количеству.
    /// - Parameters:
    ///   - levelNumber: Номер пройденного уровня.
    ///   - stars: Количество заработанных звездочек.
    ///   - coins: Количество заработанных монет (учитываются отдельно).
    func markLevelAsCompleted(levelNumber: Int, stars: Int, coins: Int) {
        if var level = level(for: levelNumber) {
            level.isCompleted = true
            level.stars = stars
            updateLevel(level: level)
            
            totalCoins += coins
            unlockNextLevel(levelNumber: levelNumber)
            saveLevels()
            saveCoins()
        }
    }
    
    /// Разблокирует следующий уровень.
    /// - Parameter levelNumber: Номер только что пройденного уровня.
    private func unlockNextLevel(levelNumber: Int) {
        let nextLevelNumber = levelNumber + 1
        if nextLevelNumber <= totalLevels, var nextLevel = level(for: nextLevelNumber) {
            nextLevel.isCompleted = false // Сделать доступным для прохождения
            updateLevel(level: nextLevel)
        }
    }
    
    /// Загружает данные об уровнях из UserDefaults.
    /// Если данные отсутствуют, инициализирует уровни по умолчанию.
    private func loadLevels() {
        if let data = UserDefaults.standard.data(forKey: "levels"),
           let savedLevels = try? JSONDecoder().decode([Level].self, from: data) {
            levels = savedLevels
        } else {
            // Инициализируем уровни по умолчанию
            levels = (1...totalLevels).map { Level(levelNumber: $0, isCompleted: $0 == 1, stars: 0) }
        }
    }
    
    /// Загружает количество монет из UserDefaults.
    private func loadCoins() {
        totalCoins = UserDefaults.standard.integer(forKey: "totalCoins")
    }
    
    /// Сохраняет данные об уровнях в UserDefaults.
    private func saveLevels() {
        if let data = try? JSONEncoder().encode(levels) {
            UserDefaults.standard.set(data, forKey: "levels")
        }
    }
    
    /// Сохраняет количество монет в UserDefaults.
    private func saveCoins() {
        UserDefaults.standard.set(totalCoins, forKey: "totalCoins")
    }
    
    /// Возвращает текущее количество монет у пользователя.
    /// - Returns: Общее количество монет.
    func getTotalCoins() -> Int {
        return totalCoins
    }
    
    /// Добавляет монеты к общему количеству.
    /// - Parameter amount: Количество добавляемых монет.
    func addCoins(_ amount: Int) {
        totalCoins += amount
        saveCoins()
    }
    
    /// Тратит монеты из общего количества, если их достаточно.
    /// - Parameter amount: Количество монет для траты.
    /// - Returns: `true`, если операция успешна, иначе `false`.
    func spendCoins(_ amount: Int) -> Bool {
        guard totalCoins >= amount else { return false }
        totalCoins -= amount
        saveCoins()
        return true
    }
}
