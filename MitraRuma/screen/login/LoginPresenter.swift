//
//  LoginPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 14/06/21.
//

import Foundation
import SwiftJWT

protocol LoginPresenterDelegate {
    func successLogin(shouldByPassToDashboard: Bool)
    func successRegister(isApplicator: Bool)
    func failed(message: String)
}

class LoginPresenter {
    
    var delegate: LoginPresenterDelegate!
    
    func requestLogin(phone: String) {
        PhoneLoginUseCase.shared.setParams(entity: ParamsLoginEntity(phone: UIGenerator.changePhoneNumber(phoneNumber: phone))).execute { entity in
            self.delegate.successLogin(shouldByPassToDashboard: false)
        } failed: { error in
            self.delegate.failed(message: error)
        }
    }
    
    func requestLoginGoogle(token: String) {
        LoginByGoogleUseCase.shared.setParams(entity: ParamsLoginEntity(googleToken: token)).execute { entity in
            self.delegate.successLogin(shouldByPassToDashboard: true)
        } failed: { error in
            self.delegate.failed(message: error)
        }
    }
    
    func requestRegister(phone: String, isApplicator: Bool) {
        PhoneRegisterUseCase.shared.setParams(entity: ParamsLoginEntity(phone: UIGenerator.changePhoneNumber(phoneNumber: phone))).execute { entity in
            self.delegate.successRegister(isApplicator: isApplicator)
        } failed: { error in
            self.delegate.failed(message: error)
        }
    }
}
