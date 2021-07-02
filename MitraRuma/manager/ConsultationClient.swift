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
        let request = RequestModel(httpMethod: .post, path: "consultation", payload: entity.toDictionary()).asURLRequest()
        return apiClient.caller.call(request)
    }
}
