//
//  GetBannerListUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 05/07/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class GetBannerListUseCase: BaseUseCase<CustomRemoteEntity<[RemoteBannerEntity]>> {
    
    static let shared: GetBannerListUseCase = GetBannerListUseCase()
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return ContentApiClient.shared.getBannerList() as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}
