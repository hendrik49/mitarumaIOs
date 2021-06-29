//
//  ParamsUpdateProfilePhoneNumberEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 29/06/21.
//

import Foundation

struct ParamsUpdateProfilePhoneNumberEntity : Codable {
    var user_phone_number: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case user_phone_number = "user_phone_number"
    }
}
