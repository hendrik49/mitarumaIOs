//
//  GetRoomListUseCase.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 04/07/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class GetRoomListUseCase: BaseUseCase<[RemoteRoomEntity]> {
    
    static let shared: GetRoomListUseCase = GetRoomListUseCase()
    
    override func getObservable<ResultEntity>() -> Observable<Result<ResultEntity, RemoteErrorEntity>> {
        return ChatApiClient.shared.getRoomList() as! Observable<Result<ResultEntity, RemoteErrorEntity>>
    }
}
