//
//  ContentApiClient.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 27/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class ContentApiClient {
    
    static var shared: ContentApiClient = ContentApiClient()
    private let apiClient: ApiClient = ApiClient.init()
    
    func getSkillSet() -> Observable<Result<CustomRemoteEntity<[RemoteSelectionEntity]>, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .get, path: "cms/3", payload: nil).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func getCoverageArea() -> Observable<Result<CustomRemoteEntity<[RemoteGroupEntity]>, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .get, path: "cms/1", payload: nil).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func getBannerList() -> Observable<Result<CustomRemoteEntity<[RemoteBannerEntity]>, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .get, path: "cms/name/banner", payload: nil).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func getCategoryList() -> Observable<Result<CustomRemoteEntity<[RemoteCategoryEntity]>, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .get, path: "cms/name/category-list", payload: nil).asURLRequest()
        return apiClient.caller.call(request)
    }
}
