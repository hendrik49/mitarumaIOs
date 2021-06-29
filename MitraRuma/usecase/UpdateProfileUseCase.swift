//
//  UpdateProfileUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 29/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class UpdateProfileUseCase: BaseUseCase<RemoteGoogleLoginEntity> {

    private var entity: ParamsProfileEntity!
    
    static let shared: UpdateProfileUseCase = UpdateProfileUseCase()
    
    func setParams(entity: ParamsProfileEntity) -> UpdateProfileUseCase {
        self.entity = entity
        return .shared
    }
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return UserApiClient.shared.updateProfile(params: entity) as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}
