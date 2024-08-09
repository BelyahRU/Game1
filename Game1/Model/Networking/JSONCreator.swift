//
//  JSONCreator.swift
//  Game1
//
//  Created by Александр Андреев on 08.08.2024.
//

import Foundation
class JSONCreator {
    static let shared = JSONCreator()
    
    private init() {}
    
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
            return jsonData
        } catch {
            print("Ошибка при кодировании JSON: \(error)")
            return nil
        }
    }
    
    // Метод для декодирования JSON данных
        func decodeUserData(from jsonData: Data) -> UserData? {
            let decoder = JSONDecoder()
            
            do {
                let userDataWrapper = try decoder.decode(UserDataWrapper.self, from: jsonData)
                return userDataWrapper.userData
            } catch {
                print("Ошибка при декодировании JSON: \(error)")
                return nil
            }
        }
}
