//
//  ParamsSubmitConsultationEntity.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 02/07/21.
//

import Foundation

struct ParamsSubmitConsultationEntity: Codable {
    
    var estimatedBudget: Int = 0
    var description: String = ""
    var city: String = ""
    var street: String = ""
    var zipcode: String = ""
    var name: String = ""
    var photos: [ParamsFileUrl] = []
    var contact: String
    
    enum CodingKeys: String, CodingKey {
        case estimatedBudget = "estimated_budget"
        case description = "description"
        case city = "city"
        case street = "street"
        case zipcode = "zipcode"
        case photos = "photos"
        case name = "name"
        case contact = "contact"
    }
}
