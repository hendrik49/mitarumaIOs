//
//  ParamsProfileEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 29/06/21.
//

import Foundation

struct ParamsProfileEntity : Codable {
    var user_nicename: String = ""
    var user_email: String = ""
    var user_url: String = ""
    var user_phone_number: String = ""
    
    enum CodingKeys: String, CodingKey {
        case user_nicename = "display_name"
        case user_email = "user_email"
        case user_url = "user_url"
        case user_phone_number = "user_phone_number"
    }
}
