//
//  RemoteGroupEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 27/06/21.
//

import Foundation

struct RemoteGroupEntity: Codable {
    
    var title: String = ""
    var child: [String] = []
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case child = "child"
    }
}
