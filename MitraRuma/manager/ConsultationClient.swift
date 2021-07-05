//
//  ConsultationClient.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 02/07/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class ConsultationClient {
    
    static var shared: ConsultationClient = ConsultationClient()
    private let apiClient: ApiClient = ApiClient.init()
    
    func submitConsultation(entity: ParamsSubmitConsultationEntity) -> Observable<Result<RemoteMessageEntity, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .post, path: "user/consultation", payload: entity.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func getBenefitsList() -> Observable<Result<RemoteBenefitsListEntity, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .get, path: "cms/name/benefits-list").asURLRequest()
        return apiClient.caller.call(request)
    }
    
    func getVideo() -> Observable<Result<RemoteVideoEntity, RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .get, path: "cms/name/benefit-video").asURLRequest()
        return apiClient.caller.call(request)
    }
}
