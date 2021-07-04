//
//  ChatApiClient.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 04/07/21.
//

import Foundation
import RxSwift
import RxRetroSwift

class ChatApiClient {
    
    static var shared: ChatApiClient = ChatApiClient()
    private let apiClient: ApiClient = ApiClient.init()
    
    func getRoomList() -> Observable<Result<[RemoteRoomEntity], RemoteErrorEntity>> {
        let request = RequestModel(httpMethod: .get, path: "user/chatroom").asURLRequest()
        return apiClient.caller.call(request)
    }
}
