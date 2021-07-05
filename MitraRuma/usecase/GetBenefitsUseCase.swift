//
//  GetBenefitsUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 05/07/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class GetBenefitsUseCase: BaseUseCase<RemoteBenefitsListEntity> {
    
    static let shared: GetBenefitsUseCase = GetBenefitsUseCase()
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return ConsultationClient.shared.getBenefitsList() as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}
