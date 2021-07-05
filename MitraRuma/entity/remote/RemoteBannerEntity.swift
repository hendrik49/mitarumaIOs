//
//  RemoteBannerEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 17/06/21.
//

import Foundation

struct RemoteBannerEntity: Codable {
    var id: Int = 0
    var image: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case image = "image"
    }
}
