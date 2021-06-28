//
//  CustomUserDefaults.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 11/06/21.
//

import Foundation

class CustomUserDefaults {
    
    static func getAuthToken() -> String {
        return UserDefaults.standard.string(forKey: "auth_token") ?? ""
    }
    
    static func setAuthToken(token: String) {
        UserDefaults.standard.setValue(token, forKey: "auth_token")
    }
    
    static func getName() -> String {
        return UserDefaults.standard.string(forKey: "name") ?? ""
    }
    
    static func setName(name: String) {
        UserDefaults.standard.setValue(name, forKey: "name")
    }
    
    static func getAddress() -> String {
        return UserDefaults.standard.string(forKey: "address") ?? ""
    }
    
    static func setAddress(address: String) {
        UserDefaults.standard.setValue(address, forKey: "address")
    }
    
    static func getEmail() -> String {
        return UserDefaults.standard.string(forKey: "email") ?? ""
    }
    
    static func setEmail(email: String) {
        UserDefaults.standard.setValue(email, forKey: "email")
    }
    
    static func getPhoneNumber() -> String {
        return UserDefaults.standard.string(forKey: "phoneNumber") ?? ""
    }
    
    static func setPhoneNumber(phoneNumber: String) {
        UserDefaults.standard.setValue(phoneNumber, forKey: "phoneNumber")
    }
    
    static func getPhoto() -> String {
        return UserDefaults.standard.string(forKey: "photo") ?? ""
    }
    
    static func setPhoto(photo: String) {
        UserDefaults.standard.setValue(photo, forKey: "photo")
    }
    
    static func getType() -> String {
        return UserDefaults.standard.string(forKey: "photo") ?? ""
    }
    
    static func setType(type: String) {
        UserDefaults.standard.setValue(type, forKey: "user_type")
    }
}
