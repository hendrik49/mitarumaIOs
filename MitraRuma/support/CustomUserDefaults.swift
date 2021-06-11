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
}
