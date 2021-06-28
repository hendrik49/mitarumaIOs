//
//  GetCoverageUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 27/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class GetCoverageUseCase: BaseUseCase<CustomRemoteEntity<[RemoteGroupEntity]>> {
    
    static let shared: GetCoverageUseCase = GetCoverageUseCase()
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return ContentApiClient.shared.getCoverageArea() as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}
