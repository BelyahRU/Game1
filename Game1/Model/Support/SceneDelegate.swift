//
//  SceneDelegate.swift
//  Game1
//
//  Created by Александр Андреев on 01.08.2024.
//

import UIKit
import AppMetricaLog
import AppMetricaCore

class SceneDelegate: UIResponder, UIWindowSceneDelegate, InitialViewDelegate {

    
    var window: UIWindow?
    var loadingVC = LoadingViewController() //загрузочный экран

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        setupLoadingView()
        let manager = BackManager()
        manager.sceneDelegate = self
//        UserDefaults.standard.setValue(1, forKey: "hasNoParent")
//        UserDefaults.standard.removeObject(forKey: "savedURL")
//        UserDefaults.standard.removeObject(forKey: "isNotFirstTime")


    }
    
    //MARK: - ZeroViewController with timeout
    func setupLinkWithTimeout(urlRemoteConfig: String) {
        let vc = ZeroViewController(urlString: urlRemoteConfig)
        vc.view.backgroundColor = .white
        //работа со ссылкой
        window?.rootViewController = vc
        window?.makeKeyAndVisible()

        // Запускаем таймер на 5 секунд
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // Проверяем, загрузилась ли страница
            if vc.isPageLoaded {
                UserDefaults.standard.set(urlRemoteConfig, forKey: "savedURL")
                UserDefaults.standard.set(true, forKey: "isNotFirstTime")
            }
        }
    }
    
//        if let bundleID = Bundle.main.bundleIdentifier {
//                UserDefaults.standard.removePersistentDomain(forName: bundleID)
//                UserDefaults.standard.synchronize()
//            }
    //MARK: - ZeroViewController
    func setupZeroView() {
        let urlString = UserDefaults.standard.string(forKey: "savedURL") ?? "https://www.google.com"
        print("SceneDelegate: \(urlString)")
        let vc = ZeroViewController(urlString: urlString)
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
    
    //MARK: - MainViewController
    func setupInitialView() {
        AppMetrica.reportEvent(name: "did_show_main_screen")
        window?.makeKeyAndVisible()
        window?.rootViewController = MainViewController()
        AudioManager.shared.startBackgroundMusic()
        
    }
    
    //MARK: - LoadingViewController
    func setupLoadingView() {
        window?.makeKeyAndVisible()
        window?.rootViewController = loadingVC
    }
    
    //MARK: - InitialViewDelegate
    func switchToMainScreen() {
        let mainViewController = MainViewController()

        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
    }
}
