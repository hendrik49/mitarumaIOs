//
//  BaseUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 14/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

protocol BaseUseCaseProtocol {
    func getObservable<ResultEntity: Codable>() -> Observable<Result<CustomRemoteEntity<ResultEntity>, RemoteErrorEntity>>
}

class BaseUseCase<ResultEntity: Codable>: BaseUseCaseProtocol {
    func getObservable<ResultEntity>() -> Observable<Result<CustomRemoteEntity<ResultEntity>, RemoteErrorEntity>> where ResultEntity : Decodable, ResultEntity : Encodable {
        fatalError("Should implement observable")
    }
    
    func execute(success: @escaping (_ entity: CustomRemoteEntity<ResultEntity>) -> Void, failed: @escaping (_ message: String) -> Void) {
        _ = (getObservable() as Observable<Result<CustomRemoteEntity<ResultEntity>, RemoteErrorEntity>>).subscribe { result in
            DispatchQueue.main.async {
                if let error = result.error {
                    var defaultMessage: String = "Error"
                    if let errorCode = error.errorCode {
                        defaultMessage = "Error with code \(errorCode)"
                    }
                    
                    if let errorDetail = error.errorDetail {
                        defaultMessage = errorDetail
                    }
                    
                    failed(defaultMessage)
                    return
                }
                
                if let value = result.value {
                    success(value)
                    return
                }
            }
        } onError: { error in
            DispatchQueue.main.async {
                failed(error.localizedDescription)
            }
        }
    }
}

