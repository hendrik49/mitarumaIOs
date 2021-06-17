//
//  OTPPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 17/06/21.
//

import Foundation

protocol OTPPresenterDelegate {
    func successOTP()
    func failed(message: String)
}

class OTPPresenter {
    
    var phoneNumber: String = ""
    var delegate: OTPPresenterDelegate!
    
    func sendOTP(otp: String) {
        SendOTPUseCase.shared.setParams(entity: ParamsOTPEntity(phone: phoneNumber, otp: otp)).execute { entity in
            self.delegate.successOTP()
        } failed: { message in
            self.delegate.failed(message: message)
        }
    }
}
