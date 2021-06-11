//
//  CustomRemoteEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 11/06/21.
//

import Foundation

struct CustomRemoteEntity<T: Codable>: Decodable {
    
    var code: Int = 200
    var message = ""
    var values: T? = nil
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case values = "values"
    }
    
    init() {
        code = 200
        message = ""
        values = nil
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try container.decode(String.self, forKey: .message)
        values = try container.decode(T.self, forKey: .values)
    }
}
