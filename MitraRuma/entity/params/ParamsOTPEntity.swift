//
//  ParamsOTPEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 17/06/21.
//

import Foundation

struct ParamsOTPEntity: Codable {
    var phone: String = ""
    var otp: String = ""
    
    enum CodingKeys: String, CodingKey {
        case phone = "phone_number"
        case otp = "otp"
    }
}
