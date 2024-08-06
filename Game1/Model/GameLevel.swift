//
//  GameLevel.swift
//  Game1
//
//  Created by Александр Андреев on 06.08.2024.
//

import Foundation
struct GameLevel {
    let levelNumber: Int //номер уровня
    let boxSpeed: TimeInterval //скорость ящика
    let obstacles: [Obstacle] //припятствия
    let maxShots: Int // количество выстрелов
    let hitsToWin: Int
}
