//
//  File.swift
//  Game1
//
//  Created by Александр Андреев on 06.08.2024.
//

import Foundation

struct LevelData: Encodable, Decodable {
    var levelNumber: Int
    var stars: Int
}
