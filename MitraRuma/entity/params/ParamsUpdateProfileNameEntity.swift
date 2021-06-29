//
//  ParamsUpdateProfileNameEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 29/06/21.
//

import Foundation

struct ParamsUpdateProfileNameEntity : Codable {
    var user_nicename: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case user_nicename = "display_name"
    }
}
