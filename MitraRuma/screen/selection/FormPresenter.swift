//
//  FormPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 29/06/21.
//

import Foundation

protocol FormPresenterDelegate {
    func onSuccessChange()
    func onFailed(message: String)
}

class FormPresenter {
    
    var delegate: FormPresenterDelegate!
    var id: String = ""
    
    func update(name: String, email: String, phoneNumber: String, address: String, city: String, zipCode: String) {
        var tempName: String = name
        var tempEmail: String = email
        var tempPhoneNumber: String = phoneNumber
        let tempAddress: String = address
        let tempCity: String = city
        let tempZipCode: String = zipCode
        
        if (tempName.isEmpty) {
            tempName = CustomUserDefaults.getName()
        }
        
        if (tempEmail.isEmpty) {
            tempEmail = CustomUserDefaults.getEmail()
        }
        
        if (tempPhoneNumber.isEmpty) {
            tempPhoneNumber = CustomUserDefaults.getPhoneNumber()
        }
        
        if (tempAddress.isEmpty) {
            UpdateProfileUseCase.shared.setParams(entity: ParamsProfileEntity(user_nicename: tempName, user_email: tempEmail, user_phone_number: tempPhoneNumber)).execute { response in
                if (!tempName.isEmpty) {
                    CustomUserDefaults.setName(name: tempName)
                }
                
                if (!tempEmail.isEmpty) {
                    CustomUserDefaults.setEmail(email: tempEmail)
                }
                
                if (!tempPhoneNumber.isEmpty) {
                    CustomUserDefaults.setPhoneNumber(phoneNumber: tempPhoneNumber)
                }
                
                self.delegate?.onSuccessChange()
            } failed: { error in
                self.delegate?.onFailed(message: error)
            }
        } else {
            
        }
    }
}
