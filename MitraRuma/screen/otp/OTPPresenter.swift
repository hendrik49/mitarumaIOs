//
//  OTPPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 17/06/21.
//

import Foundation
import JWTDecode

protocol OTPPresenterDelegate {
    func successOTP()
    func failed(message: String)
}

class OTPPresenter {
    
    var phoneNumber: String = ""
    var delegate: OTPPresenterDelegate!
    
    func sendOTP(otp: String) {
        SendOTPUseCase.shared.setParams(entity: ParamsOTPEntity(phone: phoneNumber, otp: otp)).execute { entity in
            do {
                let jwt = try decode(jwt: entity.token)
                CustomUserDefaults.setEmail(email: jwt.claim(name: "user_email").string ?? "")
                CustomUserDefaults.setName(name: jwt.claim(name: "user_nicename").string ?? "")
                CustomUserDefaults.setPhoto(photo: jwt.claim(name: "user_picture_url").string ?? "")
                CustomUserDefaults.setAuthToken(token: entity.token)
                CustomUserDefaults.setPhoneNumber(phoneNumber: jwt.claim(name: "user_phone_number").string ?? "")
                CustomUserDefaults.setType(type: jwt.claim(name: "user_email").string ?? "")
                self.delegate.successOTP()
            } catch {
                self.delegate.failed(message: "Failed to decode")
            }
        } failed: { message in
            self.delegate.failed(message: message)
        }
    }
}
