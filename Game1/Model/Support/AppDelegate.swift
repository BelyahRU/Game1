//
//  AppDelegate.swift
//  Game1
//
//  Created by Александр Андреев on 01.08.2024.
//

import UIKit
import ApphudSDK
import OneSignalFramework
import AppMetricaLog
import AppMetricaCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupSDK()
        return true
    }
    private func setupSDK() {
//       OneSignal.initialize(<#T##newAppId: String##String#>, withLaunchOptions: <#T##[AnyHashable : Any]?#>)
        let configuration = AppMetricaConfiguration.init(apiKey: "6064a64d-29c3-4be8-b1ad-161d2734c2a0")
        AppMetrica.activate(with: configuration!)

    }
    
    

    // Функция для извлечения значения по ключу из JSON
    func extractValue(from data: Data, forKey key: String) -> Any? {
        do {
            // Преобразуем данные в JSON словарь
            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                // Извлекаем значение по ключу
                return jsonObject[key]
            }
        } catch {
            print("Ошибка при парсинге JSON: \(error.localizedDescription)")
        }
        return nil
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

