//
//  ParamsExtensionAttributesEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 17/06/21.
//

import Foundation

struct ParamsExtensionAttributesEntity: Codable {
    var name: String = ""
    var values: [String] = []
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case values = "value"
    }
}
