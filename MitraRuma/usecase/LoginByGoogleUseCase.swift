//
//  LoginByGoogleUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 27/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class LoginByGoogleUseCase: BaseUseCase<RemoteGoogleLoginEntity> {

    private var entity: ParamsLoginEntity!
    
    static let shared: LoginByGoogleUseCase = LoginByGoogleUseCase()
    
    func setParams(entity: ParamsLoginEntity) -> LoginByGoogleUseCase {
        self.entity = entity
        return .shared
    }
    
    override func getObservable<ResultEntity>() -> Observable<Result<CustomRemoteEntity<ResultEntity>, RemoteErrorEntity>> {
        return UserApiClient.shared.loginWithGoogle(params: entity) as! Observable<Result<CustomRemoteEntity<ResultEntity>, RemoteErrorEntity>>
    }
}
