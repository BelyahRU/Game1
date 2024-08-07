//
//  LevelsVC + CollectionView.swift
//  Game1
//
//  Created by Александр Андреев on 04.08.2024.
//

import Foundation
import UIKit

// MARK: - CollectionView
extension LevelsViewController:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        levelsView.levelsCollectionView.dataSource = self
        levelsView.levelsCollectionView.delegate = self
        levelsView.levelsCollectionView.register(LevelCollectionViewCell.self, forCellWithReuseIdentifier: LevelCollectionViewCell.reuseId)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if viewModel.getLevel(by: indexPath.row + 1)!.isCompleted == true {
            let gameVC = GameViewController()
            gameVC.currentLevel = indexPath.row + 1
            gameVC.modalPresentationStyle = .overCurrentContext
            gameVC.modalTransitionStyle = .crossDissolve
            present(gameVC, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Ячейки для задач с дедлайнами
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LevelCollectionViewCell.reuseId,
                                        for: indexPath)
                as? LevelCollectionViewCell else {
            return UICollectionViewCell()
        }
        let level = viewModel.getLevel(by: indexPath.row + 1)
        print(level)
        cell.setupCell(level: level)
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 116, height: 116)
       }
    
}
