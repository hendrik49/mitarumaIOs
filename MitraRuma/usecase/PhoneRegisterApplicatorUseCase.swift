//
//  PhoneRegisterApplicatorUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 17/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class PhoneRegisterApplicatorUseCase: BaseUseCase<RemoteUserEntity> {

    private var entity: ParamsLoginEntity!
    
    static let shared: PhoneRegisterApplicatorUseCase = PhoneRegisterApplicatorUseCase()
    
    func setParams(entity: ParamsLoginEntity) -> PhoneRegisterApplicatorUseCase {
        self.entity = entity
        return .shared
    }
    
    override func getObservable<ResultEntity>() -> Observable<Result<CustomRemoteEntity<ResultEntity>, RemoteErrorEntity>> {
        return UserApiClient.shared.registerAsApplicator(params: entity) as! Observable<Result<CustomRemoteEntity<ResultEntity>, RemoteErrorEntity>>
    }
}
