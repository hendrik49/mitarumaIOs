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
        headerRequest["user-agent"] = "ios"
        return headerRequest
    }
    
    static func changePhoneNumber(phoneNumber: String) -> String {
        return phoneNumber.replace("+62", at: 0)
    }
    
    static func showDialog(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        return alert
    }
    
    static func downloadImage(from url: URL, imageView: UIImageView) {
        UIGenerator.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
            }
        }
    }
    
    static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
