//
//  RemoteMessageEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 02/07/21.
//

import Foundation

struct RemoteMessageEntity: Codable {
    var message: String = ""
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
    }
}
