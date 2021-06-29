//
//  RemoteUserEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 11/06/21.
//

import Foundation

struct RemoteUserEntity: Codable {
    
    var id: Int = 0
    var user_login: String = ""
    var user_nicename: String = ""
    var user_email: String = ""
    var user_url: String = ""
    var user_registered: String = ""
    var user_activation_key: String = ""
    var user_status: Int = 0
    var display_name: String = ""
    var user_phone_number: String = ""
    var created_at: String = ""
    var updated_at: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case user_login = "user_login"
        case user_nicename = "user_nicename"
        case user_email = "user_email"
        case user_url = "user_url"
        case user_registered = "user_registered"
        case user_activation_key = "user_activation_key"
        case user_status = "user_status"
        case display_name = "display_name"
        case user_phone_number = "user_phone_number"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
}
