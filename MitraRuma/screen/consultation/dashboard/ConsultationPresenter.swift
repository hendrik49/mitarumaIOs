//
//  ConsultationPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 30/06/21.
//

import Foundation

protocol ConsultationPresenterDelegate {
    func successLoadBenefitsList()
    func successLoadVideo()
    func onFailed(message: String)
}

class ConsultationPresenter {
    
    var list: [String] = []
    var video: String = ""
    var delegate: ConsultationPresenterDelegate!
    
    func requestBenefits() {
        GetBenefitsUseCase.shared.execute { response in
            self.list.append(contentsOf: response.value)
            self.delegate.successLoadBenefitsList()
        } failed: { error in
            self.delegate.onFailed(message: error)
        }
    }
    
    func requestVideo() {
        GetVideoUseCase.shared.execute { response in
            self.video = response.value
            self.delegate.successLoadVideo()
        } failed: { error in
            self.delegate.onFailed(message: error)
        }
    }
}
