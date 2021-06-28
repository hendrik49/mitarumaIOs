//
//  SendOTPUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 17/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class SendOTPUseCase: BaseUseCase<RemoteGoogleLoginEntity> {

    private var entity: ParamsOTPEntity!
    
    static let shared: SendOTPUseCase = SendOTPUseCase()
    
    func setParams(entity: ParamsOTPEntity) -> SendOTPUseCase {
        self.entity = entity
        return .shared
    }
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return UserApiClient.shared.sendOTP(params: entity) as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}
