//
//  RemoteSelectionEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 27/06/21.
//

import Foundation

class RemoteSelectionEntity: Codable {
    
    var name: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
