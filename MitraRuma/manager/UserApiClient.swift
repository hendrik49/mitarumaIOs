//
//  UserApiClient.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 11/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class UserApiClient {
    
    static var shared: UserApiClient = UserApiClient()
    private let apiClient: ApiClient = ApiClient.init()
    
    func login() -> Observable<Result<CustomRemoteEntity<RemoteUserEntity>, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .post, path: "v1/auth", payload: nil).asURLRequest()
        return apiClient.caller.call(request)
    }
    
}
