//
//  OTPPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 17/06/21.
//

import Foundation
import SwiftJWT

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
                let jwt = try JWT<UIUserEntity>(jwtString: entity.token)
                CustomUserDefaults.setEmail(email: jwt.claims.user_email)
                CustomUserDefaults.setName(name: jwt.claims.user_nicename)
                CustomUserDefaults.setPhoto(photo: jwt.claims.user_picture_url ?? "")
                CustomUserDefaults.setAuthToken(token: entity.token)
                CustomUserDefaults.setPhoneNumber(phoneNumber: jwt.claims.user_phone_number)
                CustomUserDefaults.setType(type: jwt.claims.user_type)
                self.delegate.successOTP()
            } catch {
                self.delegate.failed(message: "Failed to decode")
            }
        } failed: { message in
            self.delegate.failed(message: message)
        }
    }
}
