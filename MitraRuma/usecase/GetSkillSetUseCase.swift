//
//  GetSkillSetUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 27/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class GetSkillSetUseCase: BaseUseCase<CustomRemoteEntity<[RemoteSelectionEntity]>> {
    
    static let shared: GetSkillSetUseCase = GetSkillSetUseCase()
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return ContentApiClient.shared.getSkillSet() as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}
