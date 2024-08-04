//
//  MainView + Animation.swift
//  Game1
//
//  Created by Александр Андреев on 04.08.2024.
//

import Foundation
import UIKit

//MARK: Animation
extension MainView {
    
    public func animateIntro() {
        // Анимация backView, shopButton и menuButton одновременно
        UIView.animate(withDuration: 0.5, animations: {
            self.backView.alpha = 1
            self.shopButton.alpha = 1
            self.menuButton.alpha = 1
        }) { _ in
            // После завершения первой анимации запускаем анимацию headerView
            UIView.animate(withDuration: 0.5, animations: {
                self.headerView.alpha = 1
            }) { _ in
                // После завершения анимации headerView по очереди запускаем анимации для остальных кнопок
                UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                    self.settingButton.alpha = 1
                }, completion: { _ in
                    UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                        self.levelsButton.alpha = 1
                    }, completion: { _ in
                        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                            self.playButton.alpha = 1
                        })
                    })
                })
            }
        }
    }
}
