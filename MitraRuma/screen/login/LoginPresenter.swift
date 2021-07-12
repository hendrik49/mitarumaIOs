//
//  LoginPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 14/06/21.
//

import Foundation
import JWTDecode

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
            do {
                let jwt = try decode(jwt: entity.token)
                CustomUserDefaults.setEmail(email: jwt.claim(name: "user_email").string ?? "")
                CustomUserDefaults.setName(name: jwt.claim(name: "user_nicename").string ?? "")
                CustomUserDefaults.setPhoto(photo: jwt.claim(name: "user_picture_url").string ?? "")
                CustomUserDefaults.setAuthToken(token: entity.token)
                CustomUserDefaults.setPhoneNumber(phoneNumber: jwt.claim(name: "user_phone_number").string ?? "")
                CustomUserDefaults.setType(type: jwt.claim(name: "user_email").string ?? "")
                self.delegate.successLogin(shouldByPassToDashboard: true)
            } catch let error {
                print(error.localizedDescription)
                self.delegate.failed(message: "Please relogin")
            }
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
