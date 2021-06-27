//
//  RemoteGoogleLoginEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 27/06/21.
//

import Foundation

struct RemoteGoogleLoginEntity: Codable {
    
    var token: String = ""
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
    }
}
