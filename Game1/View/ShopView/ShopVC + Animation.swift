//
//  ShopVC + Animation.swift
//  Game1
//
//  Created by Александр Андреев on 08.08.2024.
//

import Foundation
import UIKit

extension ShopViewController {
    public func animateViews() {
        // Анимация labelView
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
                self.shopView.labelView.transform = .identity
                self.shopView.cancelButton.alpha = 1
            }) { _ in
                // Анимация headerView и coinsLabel
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.shopView.headerView.alpha = 1
                    self.shopView.coinsLabel.alpha = 1
                }) { _ in
                    // Анимация utilsTableView
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                        self.shopView.utilsTableView.transform = .identity
                    })
                }
            }
        }
    }
}
