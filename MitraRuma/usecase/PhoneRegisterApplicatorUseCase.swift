//
//  PhoneRegisterApplicatorUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 17/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class PhoneRegisterApplicatorUseCase: BaseUseCase<CustomRemoteEntity<RemoteGoogleLoginEntity>> {

    private var entity: ParamsLoginEntity!
    
    static let shared: PhoneRegisterApplicatorUseCase = PhoneRegisterApplicatorUseCase()
    
    func setParams(entity: ParamsLoginEntity) -> PhoneRegisterApplicatorUseCase {
        self.entity = entity
        return .shared
    }
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return UserApiClient.shared.registerAsApplicator(params: entity) as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}
