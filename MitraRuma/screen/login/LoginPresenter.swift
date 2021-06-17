//
//  LoginPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 14/06/21.
//

import Foundation

protocol LoginPresenterDelegate {
    func successLogin()
    func successRegister(isApplicator: Bool)
    func failed(message: String)
}

class LoginPresenter {
    
    var delegate: LoginPresenterDelegate!
    
    func requestLogin(phone: String) {
        PhoneLoginUseCase.shared.setParams(entity: ParamsLoginEntity(phone: changePhoneNumber(phoneNumber: phone))).execute { entity in
            self.delegate.successLogin()
        } failed: { error in
            self.delegate.failed(message: error)
        }
    }
    
    func requestRegister(phone: String, isApplicator: Bool) {
        PhoneRegisterUseCase.shared.setParams(entity: ParamsLoginEntity(phone: changePhoneNumber(phoneNumber: phone))).execute { entity in
            self.delegate.successRegister(isApplicator: isApplicator)
        } failed: { error in
            self.delegate.failed(message: error)
        }
    }
    
    private func changePhoneNumber(phoneNumber: String) -> String {
        return phoneNumber.replace("+62", at: 0)
    }
}
