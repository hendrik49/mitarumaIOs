//
//  RemoteAddressEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 29/06/21.
//

import Foundation

struct RemoteAddressEntity: Codable {
    
    var street: String = ""
    var city: String = ""
    var zipcode: String = ""
    var id: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case street = "street"
        case city = "city"
        case zipcode = "zipcode"
        case id = "id"
    }
}
