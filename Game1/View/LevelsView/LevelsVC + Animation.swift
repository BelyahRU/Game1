//
//  LevelsVC + Animation.swift
//  Game1
//
//  Created by Александр Андреев on 08.08.2024.
//

import Foundation
import UIKit

extension LevelsViewController {
    
    public func animateViews() {
        // Анимация legsView, labelView, cancelButton и levelsCollectionView
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.levelsView.legsView.alpha = 1
                self.levelsView.labelView.alpha = 1
                self.levelsView.cancelButton.alpha = 1
                self.levelsView.backView.alpha = 1
            }) { _ in
                // Анимация headerView
                UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut, animations: {
                    self.levelsView.headerView.alpha = 1
                    self.levelsView.coinsLabel.alpha = 1
                    self.levelsView.levelsCollectionView.alpha = 1
                })
            }
        }
    }
}
