//
//  UpdateProfileUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 29/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class UpdateProfileUseCase: BaseUseCase<RemoteUserEntity> {

    private var entity: ParamsProfileEntity!
    
    static let shared: UpdateProfileUseCase = UpdateProfileUseCase()
    
    func setParams(entity: ParamsProfileEntity) -> UpdateProfileUseCase {
        self.entity = entity
        return .shared
    }
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        if (!entity.user_email.isEmpty) {
            return UserApiClient.shared.updateProfileEmail(params: ParamsUpdateProfileEmailEntity(user_email: entity.user_email)) as! Observable<Result<ResultEntity, RemoteErrorEntity>>
        } else if (!entity.user_nicename.isEmpty) {
            return UserApiClient.shared.updateProfileName(params: ParamsUpdateProfileNameEntity(user_nicename: entity.user_nicename)) as! Observable<Result<ResultEntity, RemoteErrorEntity>>
        } else {
            return UserApiClient.shared.updateProfilePhone(params: ParamsUpdateProfilePhoneNumberEntity(user_phone_number: entity.user_phone_number)) as! Observable<Result<ResultEntity, RemoteErrorEntity>>
        }
    }
}
