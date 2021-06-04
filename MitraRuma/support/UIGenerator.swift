//
//  UIGenerator.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 04/06/21.
//

import Foundation

class UIGenerator {
    
    static func generateOnBoarding() -> [UISliderEntity] {
        var list: [UISliderEntity] = []
        list.append(UISliderEntity(imageName: "ic_croods", description: "Lorem ipsum sir dolor amet"))
        list.append(UISliderEntity(imageName: "ic_croods", description: "Lorem ipsum sir dolor amet"))
        list.append(UISliderEntity(imageName: "ic_croods", description: "Lorem ipsum sir dolor amet"))
        return list
    }
}
