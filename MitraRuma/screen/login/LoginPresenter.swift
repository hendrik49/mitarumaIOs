//
//  LoginPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 14/06/21.
//

import Foundation

protocol LoginPresenterDelegate {
    func successLogin()
    func successRegister()
    func failed(message: String)
}

class LoginPresenter {
    
    var delegate: LoginPresenterDelegate!
    
    func requestLogin(phone: String) {
        PhoneLoginUseCase.shared.setParams(entity: ParamsLoginEntity(phone: phone)).execute { entity in
            self.delegate.successLogin()
        } failed: { error in
            self.delegate.failed(message: error)
        }
    }
}
