//
//  RemoteOTPEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 28/06/21.
//

import Foundation

struct RemoteOTPEntity: Codable {
    var validDate: String = ""
    
    enum CodingKeys: String, CodingKey {
        case validDate = "valid_date"
    }
}
