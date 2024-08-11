//
//  NetworkManager.swift
//  Game1
//
//  Created by Александр Андреев on 08.08.2024.
//

import Foundation

enum NetworkManagerError: Error {
    case incorrectURL
    case invaildResponse
    case noDataReceived
    case JSONSerializationError(Error)
    case dataTaskError(Error)
    case unknownError
    
    var localizedDescription: String {
        switch self {
        case .incorrectURL:
            return "NetworkManegerError:   Invalid URL."
        case .invaildResponse:
            return "NetworkManegerError:   Request failed with error."
        case .noDataReceived:
            return "NetworkManegerError:   Invalid response from server.Incorrect status code"
        case .JSONSerializationError(let error):
            return "NetworkManegerError:   Invalid json data: \(error.localizedDescription)"
        case .dataTaskError(let error):
            return "NetworkManegerError:   DataTask error: \(error.localizedDescription)"
        case .unknownError:
            return "NetworkManegerError:   UnknownError"
        }
    }
}
    
class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    //MARK: POST
    public func sendPostRequest(urlString: String, jsonData: Data, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkManagerError.incorrectURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(NetworkManagerError.dataTaskError(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                completion(.failure(NetworkManagerError.invaildResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkManagerError.noDataReceived))
                return
            }
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                print("NetworkManeger:   GET request is SUCCESS")
                completion(.success(jsonObject ?? [:]))
            } catch {
                completion(.failure(NetworkManagerError.JSONSerializationError(error)))
            }
        }
        
        task.resume()
    }
    
    //MARK: GET
    func performGetRequest(urlString: String, completion: @escaping (Result<Any, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkManagerError.incorrectURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(NetworkManagerError.dataTaskError(error)))
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                if let data = data, httpResponse.statusCode == 200 {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print("NetworkManeger:   GET request is SUCCESS")
                        completion(.success(json))
                    } catch {
                        completion(.failure(NetworkManagerError.dataTaskError(error)))
                    }
                } else if let data = data {
                    completion(.failure(NetworkManagerError.unknownError))
                }
            }
        }
        task.resume()
    }
    
}

        
        

