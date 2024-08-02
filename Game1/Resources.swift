//
//  Resources.swift
//  Game1
//
//  Created by Александр Андреев on 01.08.2024.
//

import Foundation
import UIKit
enum Resources {
    
    enum Images {
        static let redViewHeader = "redViewHeader"
        static let crazyBallImage = "crazyBallImage"
    }
    
    enum Back {
        static let mainBackButtonsView = "mainBackButtonsView"
        static let mainBackground = "mainBackground"
    }
    
    enum Buttons {
        static let playButton = "playButton"
        static let levelsButton = "levelsButton"
        static let settingButton = "settingButton"
        static let menuButton = "menuButton"
        static let shopButton = "shopButton"
    }
    
    enum RedHeaderView {
        static let backView = "redHeaderView"
        static let clockImage = "clockImage"
        static let coinImage = "coinImage"
    }
    
    enum Colors {
        static let darkRedColor = UIColor(red: 126/255, green: 1/255, blue: 26/255, alpha: 1.0)
        static let redGradientColor1 = UIColor(red: 169/255, green: 2/255, blue: 15/255, alpha: 1.0)
        static let redGradientColor2 = UIColor(red: 248/255, green: 4/255, blue: 36/255, alpha: 1.0)
    }
    
}
