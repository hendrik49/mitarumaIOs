//
//  RemoteBenefitsListEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 05/07/21.
//

import Foundation

struct RemoteBenefitsListEntity: Codable {
    
    var id: Int = 0
    var name: String = ""
    var value: [String] = []
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case value = "value"
    }
}
