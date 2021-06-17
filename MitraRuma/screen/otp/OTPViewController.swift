//
//  OTPViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 06/06/21.
//

import UIKit

class OTPViewController: UIViewController {

    @IBOutlet weak var otpField1View: SingleInputFieldView!
    @IBOutlet weak var otpField2View: SingleInputFieldView!
    @IBOutlet weak var otpField3View: SingleInputFieldView!
    @IBOutlet weak var otpField4View: SingleInputFieldView!
    @IBOutlet weak var otpField5View: SingleInputFieldView!
    @IBOutlet weak var otpField6View: SingleInputFieldView!
    @IBOutlet weak var otpWarningLabel: UILabel!
    @IBOutlet weak var otpResendButton: UIButton!
    
    private let presenter: OTPPresenter = OTPPresenter()
    private var seconds: Int = 60
    var shouldGoToHomeAfterSuccess: Bool = false
    var phoneNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.phoneNumber = phoneNumber
        presenter.delegate = self
        
        otpField1View.id = "1"
        otpField2View.id = "2"
        otpField3View.id = "3"
        otpField4View.id = "4"
        otpField5View.id = "5"
        otpField6View.id = "6"
        
        otpField1View.delegate = self
        otpField2View.delegate = self
        otpField3View.delegate = self
        otpField4View.delegate = self
        otpField5View.delegate = self
        otpField6View.delegate = self
        
        setUpWording()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(onTimerEnd), userInfo: nil, repeats: seconds == 0 ? false : true)
    }
    
    private func setUpWording() {
        otpWarningLabel.text = "Kami telah mengirimkan kode OTP ke nomor anda (0\(seconds == 60 ? "1" : "0"):\(seconds == 60 ? "00" : "\(seconds)"))"
    }
    
    private func goToHome() {
        let navigationController: UINavigationController = UINavigationController(rootViewController: HomeViewController())
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setToolbarHidden(true, animated: false)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func onResendOTPButton(_ sender: Any) {
        otpResendButton.backgroundColor = UIColor(named: "gray_button")
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(onTimerEnd), userInfo: nil, repeats: seconds == 0 ? false : true)
    }
    
    @objc func onTimerEnd() {
        seconds -= 1
        setUpWording()
        
        if (seconds == 0) {
            otpResendButton.backgroundColor = UIColor(named: "blue_success")
        }
    }
}

extension OTPViewController: SingleInputFieldViewDelegate {
    func onTextChanged(id: String, text: String) {
        if (id == "1") {
            if (text.count == 1) {
                otpField2View.requestFocusTextField()
            }
        } else if (id == "2") {
            if (text.count == 1) {
                otpField3View.requestFocusTextField()
            } else {
                otpField1View.requestFocusTextField()
            }
        } else if (id == "3") {
            if (text.count == 1) {
                otpField4View.requestFocusTextField()
            } else {
                otpField2View.requestFocusTextField()
            }
        } else if (id == "4") {
            if (text.count == 1) {
                otpField5View.requestFocusTextField()
            } else {
                otpField3View.requestFocusTextField()
            }
        } else if (id == "5") {
            if (text.count == 1) {
                otpField6View.requestFocusTextField()
            } else {
                otpField4View.requestFocusTextField()
            }
        } else if (id == "6") {
            if (text.count == 1) {
                let code = "\(otpField1View.getText())\(otpField2View.getText())\(otpField3View.getText())\(otpField4View.getText())\(otpField5View.getText())\(otpField6View.getText())"
                presenter.sendOTP(otp: code)
            } else {
                otpField5View.requestFocusTextField()
            }
        }
    }
}

extension OTPViewController: OTPPresenterDelegate {
    func successOTP() {
        if (shouldGoToHomeAfterSuccess) {
            goToHome()
        }
    }
    
    func failed(message: String) {
        print(message)
    }
}
