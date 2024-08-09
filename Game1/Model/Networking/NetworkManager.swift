//
//  NetworkManager.swift
//  Game1
//
//  Created by Александр Андреев on 08.08.2024.
//

import Foundation
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    public func sendPostRequest(urlString: String, jsonData: Data, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Некорректный URL"])))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                let error = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Invalid response from server"])
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                completion(.success(jsonObject ?? [:]))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }

    
    func performGetRequest(urlString: String, completion: @escaping (Result<Any, Error>) -> Void) {
        // Проверяем корректность URL
        guard let url = URL(string: urlString) else {
            print("Некорректный URL")
            return
        }
        // Создаем запрос
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // Выполняем запрос
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Проверяем на ошибки
            if let error = error {
                completion(.failure(error))
                return
            }
            // Проверяем статус-код ответа
            if let httpResponse = response as? HTTPURLResponse {
                print("Статус-код: \(httpResponse.statusCode)")
                if let data = data, httpResponse.statusCode == 200 {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        completion(.success(json))
                    } catch {
                        completion(.failure(error))
                    }
                } else if let data = data {
                    // Если запрос не успешен, возвращаем ошибку с текстом ответа
                    let errorMessage = String(data: data, encoding: .utf8) ?? "Unknown error"
                    let error = NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    
}
