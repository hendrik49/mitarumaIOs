//
//  GetAddressUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 29/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class GetAddressUseCase: BaseUseCase<[RemoteAddressEntity]> {
    
    static let shared: GetAddressUseCase = GetAddressUseCase()
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return UserApiClient.shared.getAddress() as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}

