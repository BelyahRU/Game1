//
//  JSONManager.swift
//  Game1
//
//  Created by Александр Андреев on 08.08.2024.
//

import Foundation
import UIKit
class UserDataManager {
    
    //MARK: - Properties
    static let shared = UserDataManager()
    
    //MARK: - Initialize
    private init() {}
    
    //MARK: - Methods
//    Состояние VPN
    public func vivisWork() -> Bool{
        if let settings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? Dictionary<String, Any>,
                let scopes = settings["__SCOPED__"] as? [String:Any] {
                for (key, _) in scopes {
                 if key.contains("tap") || key.contains("tun") || key.contains("ppp") || key.contains("ipsec") {
                        return true
                    }
                }
            }
            return false
    }
    
//    Имя девайса
    public func gfdokPS() -> String {
        return UIDevice.current.name
    }

//    Имя модели    
    public func gdpsjPjg() -> String {
        return UIDevice.current.model
    }
//    Уник. номер
    public func poguaKFP() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
//    Wi-Fi адрес    
    public func gpaMFOfa() -> String? {
        var address: String?
            var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil

            if getifaddrs(&ifaddr) == 0 {
                var ptr = ifaddr
                while ptr != nil {
                    let interface = ptr!.pointee
                    let addrFamily = interface.ifa_addr.pointee.sa_family

                    if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                        if let name = String(validatingUTF8: interface.ifa_name), name == "en0" {
                            var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                            if getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                           &hostname, socklen_t(hostname.count),
                                           nil, socklen_t(0), NI_NUMERICHOST) == 0 {
                                address = String(cString: hostname)
                            }
                        }
                    }
                    ptr = interface.ifa_next
                }
                freeifaddrs(ifaddr)
            }

            return address
    }
//    Сим-карта
    public func gciOFm() -> String? {
        //?
        return nil
    }
    
//    Версия iOS
    public func bcpJFs() -> String {
        return UIDevice.current.systemVersion
    }
    
//    Язык девайса   
    public func GOmblx() -> String? {
        return Locale.preferredLanguages.first
    }
//    Тайм-зона    
    public func G0pxum() -> String? {
        return TimeZone.current.identifier
    }
//    Заряжается ли    
    public func Fpvbduwm() -> Bool {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        || device.batteryState == .full
        return device.batteryState == .charging
    }
//    Обьем памяти    
    public func Fpbjcv() -> String {
        return String(ProcessInfo.processInfo.physicalMemory)
    }
//    Скриншот ли
    public func StwPp() -> Bool {
       return false
    }
//    Скринкаст ли
    public func KDhsd() -> Bool {
        return false
    }
    
//    Наличие прил
    public func bvoikOGjs() -> [String: String] {
        return [:]
    }
//    Уровень заряда
    public func gfpbvjsoM() -> Int {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        return Int(device.batteryLevel)
    }
//    Клавиатуры    
    public func gfdosnb() -> [String] {
        return UITextInputMode.activeInputModes.compactMap { $0.primaryLanguage }
    }
//    Регион    
    public func bpPjfns() -> String? {
        let currentLocale = Locale.current
        let regionCode = currentLocale.regionCode
        return regionCode
    }
//    Метрическая ли    
    public func biMpaiuf() -> Bool? {
        let currentLocale = Locale.current
        if #available(iOS 16, *) {
            let measurementSystem = currentLocale.measurementSystem
            return measurementSystem == .metric
        } else {
            return nil
        }
    }
    
//    Полная ли зарядка
    public func oahgoMAOI() -> Bool {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        return device.batteryState == .full
    }
}
