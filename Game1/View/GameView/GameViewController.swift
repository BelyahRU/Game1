//
//  GameViewController.swift
//  Game1
//
//  Created by Александр Андреев on 05.08.2024.
//

import Foundation
import UIKit
import SpriteKit

final class GameViewController: UIViewController {

    private var scene: GameScene!
    
    public let gameView = GameView()
    
    override func viewWillAppear(_ animated: Bool) {
//        setupScene()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func setupScene() {
      view = SKView(frame: view.bounds)
      let skView = view as! SKView
        skView.showsNodeCount = false
      scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .resizeFill
      skView.presentScene(scene)
    }
    
    private func configure() {
        setupSubviews()
        setupConstraints()
    }
    
    
    private func setupSubviews() {
        view.addSubview(gameView)
    }
    
    private func setupConstraints() {
        gameView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gameView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gameView.topAnchor.constraint(equalTo: view.topAnchor),
            gameView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    

}
