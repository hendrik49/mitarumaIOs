//
//  LoginViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 06/06/21.
//

import UIKit
import GoogleSignIn
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var phoneNumberInputView: InputFieldView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var switchLoginButton: UILabel!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var registerAskLabel: UILabel!
    @IBOutlet weak var signInGoogleView: UIView!
    
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
        
        signInGoogleView.onClick {
            GIDSignIn.sharedInstance()?.signIn()
//            let navigationController: UINavigationController = UINavigationController(rootViewController: OTPViewController())
//            navigationController.setNavigationBarHidden(true, animated: false)
//            navigationController.setToolbarHidden(true, animated: false)
//            navigationController.modalPresentationStyle = .fullScreen
//            self.present(navigationController, animated: true, completion: nil)
        }
    }
    
    private func setUpGoogleSignIn() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    private func switchState() {
        if (state == "Login") {
            registerLabel.text = "Login"
            registerButton.setTitle("Login", for: .normal)
            registerAskLabel.text = "Belum punya akun?"
            switchLoginButton.text = "Register"
        } else {
            registerLabel.text = "Register"
            registerButton.setTitle("Register", for: .normal)
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

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error != nil) {
            return
        }
        
        
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
