//
//  LoginViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 06/06/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var phoneNumberInputView: InputFieldView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var googleButton: UIView!
    @IBOutlet weak var switchLoginButton: UILabel!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var registerAskLabel: UILabel!
    @IBOutlet weak var registerWithGoogleLabel: UILabel!
    
    private var canRegisterOrLogin: Bool = false
    private var state: String = "Register"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberInputView.delegate = self
        phoneNumberInputView.setUpData(title: "No. HP", hint: "Masukkan no hp", type: .numberPad)
        
        switchLoginButton.onClick {
            if (self.state == "Register") {
                self.state = "Login"
            } else {
                self.state = "Register"
            }
            
            self.switchState()
        }
        
        googleButton.onClick {
            let navigationController: UINavigationController = UINavigationController(rootViewController: OTPViewController())
            navigationController.setNavigationBarHidden(true, animated: false)
            navigationController.setToolbarHidden(true, animated: false)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true, completion: nil)
        }
    }
    
    private func switchState() {
        if (state == "Login") {
            registerLabel.text = "Login"
            registerButton.setTitle("Login", for: .normal)
            registerWithGoogleLabel.text = "Login dengan Google"
            registerAskLabel.text = "Belum punya akun?"
            switchLoginButton.text = "Register"
        } else {
            registerLabel.text = "Register"
            registerButton.setTitle("Register", for: .normal)
            registerWithGoogleLabel.text = "Register dengan Google"
            registerAskLabel.text = "Sudah punya akun?"
            switchLoginButton.text = "Login"
        }
    }
    
    private func buttonRegisterOrLoginValidation() {
        registerButton.backgroundColor = canRegisterOrLogin ? UIColor(named: "blue_success") : UIColor(named: "gray_button")
    }
    
    @IBAction func onRegisterClicked(_ sender: Any) {
    }
}

extension LoginViewController: InputFieldViewDelegate {
    func onTextChanged(text: String) {
        if (text.contains("08") && text.count > 9) {
            canRegisterOrLogin = true
        } else {
            canRegisterOrLogin = false
        }
        
        buttonRegisterOrLoginValidation()
    }
}
