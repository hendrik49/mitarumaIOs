//
//  ApiClient.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 11/06/21.
//

import Foundation
import RxRetroSwift

class ApiClient {
    static var shared: ApiClient = ApiClient()
    var caller: RequestCaller = RequestCaller.init()
    
    init() {
        RequestModel.defaults.baseUrl = "http://149.28.148.227:8080"
        RequestModel.defaults.headers = UIGenerator.generateHeaders()
    }
}

