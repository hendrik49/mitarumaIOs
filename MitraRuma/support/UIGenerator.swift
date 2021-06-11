//
//  UIGenerator.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 04/06/21.
//

import Foundation
import UIKit

class UIGenerator {
    
    static func generateOnBoarding() -> [UISliderEntity] {
        var list: [UISliderEntity] = []
        list.append(UISliderEntity(imageName: "ic_croods", description: "Lorem ipsum sir dolor amet"))
        list.append(UISliderEntity(imageName: "ic_croods", description: "Lorem ipsum sir dolor amet"))
        list.append(UISliderEntity(imageName: "ic_croods", description: "Lorem ipsum sir dolor amet"))
        return list
    }
    
    static func generateHeaders() -> [String: String] {
        var headerRequest: [String: String] = [:]
        headerRequest["Authorization"] = "Bearer \(CustomUserDefaults.getAuthToken())"
        return headerRequest
    }
}
