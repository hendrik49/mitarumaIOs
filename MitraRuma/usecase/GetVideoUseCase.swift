//
//  GetVideoUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 05/07/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class GetVideoUseCase: BaseUseCase<RemoteVideoEntity> {
    
    static let shared: GetVideoUseCase = GetVideoUseCase()
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return ConsultationClient.shared.getVideo() as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}
