//
//  RemoteRoomEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 04/07/21.
//

import Foundation

struct RemoteRoomEntity: Codable {
    
    var consultationId: String = ""
    var userId: Int = 0
    var name: String = ""
    var text: String = ""
    var status: String = ""
    var date: String = ""
    
    enum CodingKeys: String, CodingKey {
        case consultationId = "consultationId"
        case userId = "userId"
        case name = "name"
        case text = "text"
        case status = "status"
        case date = "date"
    }
}
