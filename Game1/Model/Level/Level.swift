//
//  Level.swift
//  Game1
//
//  Created by Александр Андреев on 07.08.2024.
//

import Foundation

struct Level: Encodable, Decodable {
    let levelNumber: Int
    var isCompleted: Bool
    var stars: Int
    var isUnlocked: Bool
}
