//
//  SubmitConsultationUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 02/07/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class SubmitConsultationUseCase: BaseUseCase<RemoteMessageEntity> {

    private var entity: ParamsSubmitConsultationEntity!
    
    static let shared: SubmitConsultationUseCase = SubmitConsultationUseCase()
    
    func setParams(entity: ParamsSubmitConsultationEntity) -> SubmitConsultationUseCase {
        self.entity = entity
        return .shared
    }
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return ConsultationClient.shared.submitConsultation(entity: entity) as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}
