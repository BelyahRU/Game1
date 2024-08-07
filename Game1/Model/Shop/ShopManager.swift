//
//  ShopManager.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation

class ShopManager {
    static let shared = ShopManager()

    private var availableSets: [CannonBoxSet] = []
    private var purchasedSets: [String] = []
    private var currentSet: CannonBoxSet? = CannonBoxSet(id: "0", cannonImageName: "gun", boxImageName: "box", price: 0)

    private init() {
        loadStoreItems()
        loadPurchases()
        loadCurrentSet()
    }

    // MARK: - Store Management Methods
    
    private func loadStoreItems() {
        // Пример доступных наборов
        availableSets = [
            CannonBoxSet(id: "1", cannonImageName: "gun2", boxImageName: "box2", price: 8000),
            CannonBoxSet(id: "2", cannonImageName: "gun3", boxImageName: "box3", price: 20000),
            CannonBoxSet(id: "3", cannonImageName: "gun4", boxImageName: "box4", price: 32000),
            CannonBoxSet(id: "4", cannonImageName: "gun5", boxImageName: "box5", price: 44000)
        ]
    }

    private func loadPurchases() {
        if let purchasedSetsData = UserDefaults.standard.data(forKey: "purchasedSets"),
           let purchasedSets = try? JSONDecoder().decode([String].self, from: purchasedSetsData) {
            self.purchasedSets = purchasedSets
        }
    }

    private func savePurchases() {
        if let purchasedSetsData = try? JSONEncoder().encode(purchasedSets) {
            UserDefaults.standard.set(purchasedSetsData, forKey: "purchasedSets")
        }
    }

    private func loadCurrentSet() {
        if let currentSetData = UserDefaults.standard.data(forKey: "currentSet"),
           let currentSet = try? JSONDecoder().decode(CannonBoxSet.self, from: currentSetData) {
            self.currentSet = currentSet
        }
    }

    private func saveCurrentSet() {
        if let currentSet = currentSet,
           let currentSetData = try? JSONEncoder().encode(currentSet) {
            UserDefaults.standard.set(currentSetData, forKey: "currentSet")
        }
    }

    // MARK: - Purchase Methods

    func purchaseSet(_ set: CannonBoxSet) -> Bool {
        guard !purchasedSets.contains(set.id), LevelManager.shared.getTotalCoins() >= set.price else {
            return false
        }
        print(LevelManager.shared.spendCoins(set.price))
        purchasedSets.append(set.id)
        savePurchases()
        return true
    }

    // MARK: - Public Methods

    func getAvailableSets() -> [CannonBoxSet] {
        return availableSets
    }

    func getPurchasedSets() -> [CannonBoxSet] {
        return availableSets.filter { purchasedSets.contains($0.id) }
    }

    func setCurrentSet(_ set: CannonBoxSet) {
        guard purchasedSets.contains(set.id) else { return }
        currentSet = set
        saveCurrentSet()
    }

    func getCurrentSet() -> CannonBoxSet? {
        return currentSet
    }

    // MARK: - Debug Methods

    func purchaseDebugSet(_ set: CannonBoxSet) {
        purchasedSets.append(set.id)
        savePurchases()
    }
    
    func resetPurchases() {
        // Очистить список купленных наборов
        purchasedSets.removeAll()
        savePurchases()

        currentSet = CannonBoxSet(id: "0", cannonImageName: "gun", boxImageName: "box", price: 0)
        saveCurrentSet()
    }

    
    
}
