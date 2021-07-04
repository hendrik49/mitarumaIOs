//
//  RoomChildListPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 04/07/21.
//

import Foundation

protocol RoomChildListPresenterDelegate {
    func successLoadRoomList()
    func onFailed(message: String)
}

class RoomChildListPresenter {
    
    var list: [RemoteRoomEntity] = []
    var delegate: RoomChildListPresenterDelegate!
    
    func getChatRoomList() {
        GetRoomListUseCase.shared.execute { response in
            self.list.removeAll()
            self.list.append(contentsOf: response)
            self.delegate.successLoadRoomList()
        } failed: { error in
            self.delegate.onFailed(message: error)
        }
    }
}
