//
//  SceneDelegate.swift
//  Game1
//
//  Created by Александр Андреев on 01.08.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        window?.rootViewController = LoadingViewController()
        AudioManager.shared.startBackgroundMusic()
    }
    
    func switchToMainScreen() {
        let mainViewController = MainViewController()

        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
    }



}

