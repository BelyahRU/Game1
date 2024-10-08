//
//  Resources.swift
//  Game1
//
//  Created by Александр Андреев on 01.08.2024.
//

import Foundation
import UIKit
enum Resources {
    
    enum GameOver {
        static let backView = "backView"
        static let gameOverLabel = "gameOverLabel"
        static let confetie = "confetie"
        static let moneyView = "moneyView"
        static let star = "star"
        
        enum LevelViews {
            static let level1Star = "level1Star"
            static let level2Star = "level2Star"
            static let level3Star = "level3Star"
            static let level0Star = "level0Star"
        }
    }
    
    enum Game {
        static let boxText = "boxText"
        static let redBlock = "redBlock"
    }
    
    enum GameBackgrounds {
        static let bg1 = "bg1"
        static let bg2 = "bg2"
        static let bg3 = "bg3"
        static let bg4 = "bg4"
        static let bg5 = "bg5"
    }
    
    enum Levels {
        static let blockedLevel = "blockedLevel"
    }
    
    enum RoundedView {
        static let levelsLabel = "levelsLabel"
        static let legsRoundedView = "legsRoundedView"
        static let roundedView = "roundedView"
    }
    
    enum Images {
        static let redViewHeader = "redViewHeader"
        static let crazyBallImage = "crazyBallImage"
        static let levelsView = "levelsView"
        static let levelView = "levelView"
        static let pauseLabel = "pauseLabel"
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
        static let rateAppButton = "rateAppButton"
        static let usagePolicyButton = "usagePolicyButton"
        static let settingLabel = "settingLabel"
        static let shareAppButton = "shareAppButton"
        static let cancelButton = "cancelButton"
        
        
        //GameViewController
        static let restartButton = "restartButton"
        static let pauseButton = "pauseButton"
        //PauseViewController
        static let startButton = "startButton"
        static let homeButton = "homeButton"
        
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
