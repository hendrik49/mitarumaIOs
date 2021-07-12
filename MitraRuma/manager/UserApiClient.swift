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
    
    func login(params: ParamsLoginEntity) -> Observable<Result<CustomRemoteEntity<RemoteOTPEntity>, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .post, path: "login", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func register(params: ParamsLoginEntity) -> Observable<Result<CustomRemoteEntity<RemoteGoogleLoginEntity>, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .post, path: "user/register", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func registerAsApplicator(params: ParamsLoginEntity) -> Observable<Result<CustomRemoteEntity<RemoteGoogleLoginEntity>, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .post, path: "applicator/register", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func sendOTP(params: ParamsOTPEntity) -> Observable<Result<RemoteGoogleLoginEntity, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .post, path: "login/otp", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func loginWithGoogle(params: ParamsLoginEntity) -> Observable<Result<RemoteGoogleLoginEntity, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .post, path: "login/google/token", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func updateProfileName(params: ParamsUpdateProfileNameEntity) -> Observable<Result<RemoteUserEntity, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .put, path: "user/profile", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func updateProfileEmail(params: ParamsUpdateProfileEmailEntity) -> Observable<Result<RemoteUserEntity, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .put, path: "user/profile", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func updateProfilePhone(params: ParamsUpdateProfilePhoneNumberEntity) -> Observable<Result<RemoteUserEntity, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .put, path: "user/profile", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func addAddress(params: ParamsUpdateAddressEntity) -> Observable<Result<RemoteAddressEntity, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .post, path: "user/profile/address", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func updateAddress(params: ParamsUpdateAddressEntity) -> Observable<Result<RemoteAddressEntity, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .put, path: "user/profile/address/\(params.id)", payload: params.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func getAddress() -> Observable<Result<[RemoteAddressEntity], RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .get, path: "user/profile/address").asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func update() {
        apiClient.updateHeader()
    }
}
