//
//  PhoneRegisterUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 14/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class PhoneRegisterUseCase: BaseUseCase<RemoteUserEntity> {

    private var entity: ParamsLoginEntity!
    
    static let shared: PhoneRegisterUseCase = PhoneRegisterUseCase()
    
    func setParams(entity: ParamsLoginEntity) -> PhoneRegisterUseCase {
        self.entity = entity
        return .shared
    }
    
    override func getObservable<ResultEntity>() -> Observable<Result<CustomRemoteEntity<ResultEntity>, RemoteErrorEntity>> {
        return UserApiClient.shared.register(params: entity) as! Observable<Result<CustomRemoteEntity<ResultEntity>, RemoteErrorEntity>>
    }
}
