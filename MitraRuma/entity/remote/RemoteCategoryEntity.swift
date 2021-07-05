//
//  RemoteCategoryEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 05/07/21.
//

import Foundation

struct RemoteCategoryEntity: Codable {
    
    var id: Int = 0
    var name: String = ""
    var icon: String = ""
    var link: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case icon = "icon"
        case link = "link"
    }
}
