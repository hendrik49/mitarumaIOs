//
//  UpdateAddressUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 29/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class UpdateAddressUseCase: BaseUseCase<RemoteAddressEntity> {

    private var entity: ParamsUpdateAddressEntity!
    
    static let shared: UpdateAddressUseCase = UpdateAddressUseCase()
    
    func setParams(entity: ParamsUpdateAddressEntity) -> AddAddressUseCase {
        self.entity = entity
        return .shared
    }
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return UserApiClient.shared.updateAddress(params: entity) as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}
