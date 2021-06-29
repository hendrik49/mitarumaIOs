//
//  ParamsUpdateAddressEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 29/06/21.
//

import Foundation

struct ParamsUpdateAddressEntity: Codable {
    var id: String = ""
    var street: String = ""
    var city: String = ""
    var zipcode: String = ""

    enum CodingKeys: String, CodingKey {
        case street = "street"
        case city = "city"
        case zipcode = "zipcode"
    }
}
