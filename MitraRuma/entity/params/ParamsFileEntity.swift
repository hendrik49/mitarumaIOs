//
//  ParamsFileEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 02/07/21.
//

import Foundation

struct ParamsFileUrl: Codable {
    var pathUrl: String = ""
    
    enum CodingKeys: String, CodingKey {
        case pathUrl = "pathUrl"
    }
}
