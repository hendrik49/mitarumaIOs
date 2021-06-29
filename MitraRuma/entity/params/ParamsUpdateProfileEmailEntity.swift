//
//  ParamsUpdateProfileEmailEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 29/06/21.
//

import Foundation

struct ParamsUpdateProfileEmailEntity : Codable {
    var user_email: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case user_email = "user_email"
    }
}
