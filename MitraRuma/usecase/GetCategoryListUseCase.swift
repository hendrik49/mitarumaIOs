//
//  GetCategoryListUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 05/07/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class GetCategoryListUseCase: BaseUseCase<CustomRemoteEntity<[RemoteCategoryEntity]>> {
    
    static let shared: GetCategoryListUseCase = GetCategoryListUseCase()
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return ContentApiClient.shared.getCategoryList() as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}
