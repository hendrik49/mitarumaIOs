//
//  PhoneLoginUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 14/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class PhoneLoginUseCase: BaseUseCase<CustomRemoteEntity<RemoteOTPEntity>> {

    private var entity: ParamsLoginEntity!
    
    static let shared: PhoneLoginUseCase = PhoneLoginUseCase()
    
    func setParams(entity: ParamsLoginEntity) -> PhoneLoginUseCase {
        self.entity = entity
        return .shared
    }
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return UserApiClient.shared.login(params: entity) as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}
