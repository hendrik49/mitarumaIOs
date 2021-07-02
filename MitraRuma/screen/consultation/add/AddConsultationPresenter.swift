//
//  AddConsultationPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 01/07/21.
//

import Foundation
import FirebaseStorage

protocol AddConsultationPresenterDelegate {
    func onSuccessUploadImage()
}

class AddConsultationPresenter {
    
    var photoList: [UIUriEntity] = []
    
    var delegate: AddConsultationPresenterDelegate!
    
    func uploadImage() {
        if let entity = photoList.first(where: { !$0.isUploaded }) {
            let reference = Storage.storage().reference()
            let child = reference.child("consultation/\(UUID.init().uuidString)-\(entity.url.lastPathComponent)")
            child.putFile(from: entity.url, metadata: nil) {
                (metadata, error) in
                
                child.downloadURL(completion: { url, error in
                    if let index: Int = self.photoList.firstIndex(where: { tempEntity in
                        return tempEntity.url == entity.url
                    }) {
                        self.photoList[index].remoteUrl = url?.absoluteString ?? ""
                        self.delegate.onSuccessUploadImage()
                    }
                })
            }
        }
    }
    
    func book(detail: String, estimatedBudget: Int, name: String, contact: String, address: String) {
        print(detail)
        print("\(estimatedBudget)")
        print(name)
        print(contact)
        print(address)
    }
}
