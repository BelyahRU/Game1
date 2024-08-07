//
//  ShopVC + TableView.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation
import UIKit

extension ShopViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func purchaseSet(at index: Int) {
        let availableSets = shopManager.getAvailableSets()
        guard index < availableSets.count else { return }
        
        let selectedSet = availableSets[index]
        
        if shopManager.purchaseSet(selectedSet) {
            // Successfully purchased
            let alert = UIAlertController(title: "Purchase Successful", message: "You have purchased the set.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else if shopManager.getPurchasedSets().contains(where: { $0.id == selectedSet.id }) {
            shopManager.setCurrentSet(selectedSet)
            // Successfully set as current
            let alert = UIAlertController(title: "Set as Current", message: "This set is now your current set.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            // Not enough coins
            let alert = UIAlertController(title: "Insufficient Funds", message: "You don't have enough coins to purchase this set.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    public func setupTableView() {
        shopView.utilsTableView.delegate = self
        shopView.utilsTableView.dataSource = self
        shopView.utilsTableView.register(UtilsTableViewCell.self, forCellReuseIdentifier: UtilsTableViewCell.reuseId)
        shopView.utilsTableView.backgroundColor = .clear
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        318
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shopManager.getAvailableSets().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UtilsTableViewCell.reuseId,
                                                       for: indexPath) as? UtilsTableViewCell
        else { return UITableViewCell() }
        
        switch indexPath.row {
        case 0:
            cell.setupCell(imageName: "cell8000.pdf")
        case 1:
            cell.setupCell(imageName: "cell20000.pdf")
        case 2:
            cell.setupCell(imageName: "cell32000.pdf")
        case 3:
            cell.setupCell(imageName: "cell44000.pdf")
        default:
            cell.setupCell(imageName: "cell8000.pdf")
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AudioManager.shared.buttonClickEffect()
        purchaseSet(at: indexPath.row)
        shopView.coinsLabel.text = "\(LevelManager.shared.getTotalCoins())"
    }
    
}
