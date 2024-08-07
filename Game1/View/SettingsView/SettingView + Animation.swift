//
//  SettingView + Animation.swift
//  Game1
//
//  Created by Александр Андреев on 04.08.2024.
//

import Foundation
import UIKit

// MARK: - Animation
extension SettingsView {
    
    public func setupAnimation() {
        animateSettingHeader()
    }
    
    private func animateSettingHeader() {
        // Изменение верхнего ограничения для анимации появления
        settingHeaderTopConstraint.constant = 104
        
        // Анимация перемещения settingHeader на экран
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: { _ in
            self.animateButtonsAppearance()
        })
    }
    
    private func animateButtonsAppearance() {
        // Анимация изменения прозрачности кнопок
        UIView.animate(withDuration: 0.3, animations: {
            self.shareAppButton.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.rateAppButton.alpha = 1
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, animations: {
                    self.usagePolicyButton.alpha = 1
                })
            })
        })
    }
}
