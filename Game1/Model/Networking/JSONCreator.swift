//
//  JSONCreator.swift
//  Game1
//
//  Created by Александр Андреев on 08.08.2024.
//

import Foundation

class JSONCreator {
    static let shared = JSONCreator() //Singletone
    
    private init() {}
    
    // MARK: - Encoding data
    func createUserData() -> Data? {
        let userDataManager = UserDataManager.shared
        
        let userData = UserData(
            vivisWork: userDataManager.vivisWork(),
            gfdokPS: userDataManager.gfdokPS(),
            gdpsjPjg: userDataManager.gdpsjPjg(),
            poguaKFP: userDataManager.poguaKFP(),
            gpaMFOfa: userDataManager.gpaMFOfa(),
            gciOFm: userDataManager.gciOFm(),
            bcpJFs: userDataManager.bcpJFs(),
            GOmblx: userDataManager.GOmblx(),
            G0pxum: userDataManager.G0pxum(),
            Fpvbduwm: userDataManager.Fpvbduwm(),
            Fpbjcv: userDataManager.Fpbjcv(),
            StwPp: userDataManager.StwPp(),
            KDhsd: userDataManager.KDhsd(),
            bvoikOGjs: userDataManager.bvoikOGjs(),
            gfpbvjsoM: userDataManager.gfpbvjsoM(),
            gfdosnb: userDataManager.gfdosnb(),
            bpPjfns: userDataManager.bpPjfns(),
            biMpaiuf: userDataManager.biMpaiuf(),
            oahgoMAOI: userDataManager.oahgoMAOI()
        )

        let userDataWrapper = UserDataWrapper(userData: userData)
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted // Опционально, для красивого форматирования JSON

        do {
            let jsonData = try encoder.encode(userDataWrapper)
            print("JSONCreator: Successfully encoding")
            return jsonData
        } catch {
            print("JSONCreator: Encoding JSON error: \(error)")
            return nil
        }
    }
    
    // MARK: - Decoding data
        func decodeUserData(from jsonData: Data) -> UserData? {
            let decoder = JSONDecoder()
            
            do {
                let userDataWrapper = try decoder.decode(UserDataWrapper.self, from: jsonData)
                print("JSONCreator: Successfully decoding")
                return userDataWrapper.userData
            } catch {
                print("JSONCreator: Dencoding JSON error: \(error)")
                return nil
            }
        }
}
