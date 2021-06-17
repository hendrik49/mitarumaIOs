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
    var extensionAttributes: ParamsExtensionAttributesEntity = ParamsExtensionAttributesEntity()
    
    enum CodingKeys: String, CodingKey {
        case phone = "phone_number"
        case googleToken = "google_token"
        case extensionAttributes = "extension_attributes"
    }
}
