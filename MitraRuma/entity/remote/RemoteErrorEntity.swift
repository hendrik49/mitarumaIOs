//
//  RemoteErrorEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 11/06/21.
//

import Foundation
import RxRetroSwift

struct RemoteErrorEntity: Decodable & HasErrorInfo {
    
    var errorCode: Int?
    
    var errorDetail: String?
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "code"
        case errorDetail = "message"
    }
}
