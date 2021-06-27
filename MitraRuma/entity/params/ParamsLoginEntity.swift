//
//  ParamsLoginEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 14/06/21.
//

import Foundation

struct ParamsLoginEntity: Codable {
    var phone: String = ""
    var googleToken: String = ""
    var extensionAttributes: [ParamsExtensionAttributesEntity] = []
    
    enum CodingKeys: String, CodingKey {
        case phone = "user_phone_number"
        case googleToken = "token"
        case extensionAttributes = "extension_attributes"
    }
}
