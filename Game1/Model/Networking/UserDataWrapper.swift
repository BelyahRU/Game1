//
//  UserDataWrapper.swift
//  Game1
//
//  Created by Александр Андреев on 08.08.2024.
//

import Foundation

struct UserData: Codable {
    var vivisWork: Bool
    var gfdokPS: String
    var gdpsjPjg: String
    var poguaKFP: String?
    var gpaMFOfa: String?
    var gciOFm: String?
    var bcpJFs: String
    var GOmblx: String?
    var G0pxum: String?
    var Fpvbduwm: Bool
    var Fpbjcv: String
    var StwPp: Bool
    var KDhsd: Bool
    var bvoikOGjs: [String: String]?
    var gfpbvjsoM: Int?
    var gfdosnb: [String]?
    var bpPjfns: String?
    var biMpaiuf: Bool?
    var oahgoMAOI: Bool
}

struct UserDataWrapper: Codable {
    var userData: UserData
}
