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
    
    func login(params: ParamsLoginEntity) -> Observable<Result<CustomRemoteEntity<RemoteUserEntity>, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .post, path: "user/login", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func register(params: ParamsLoginEntity) -> Observable<Result<CustomRemoteEntity<RemoteUserEntity>, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .post, path: "user/register", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func registerAsApplicator(params: ParamsLoginEntity) -> Observable<Result<CustomRemoteEntity<RemoteUserEntity>, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .post, path: "applicator/register", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func sendOTP(params: ParamsOTPEntity) -> Observable<Result<CustomRemoteEntity<RemoteUserEntity>, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .post, path: "user/login/otp", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
}
