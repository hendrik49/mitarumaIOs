//
//  LoginViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 06/06/21.
//

import UIKit
import GoogleSignIn
import Firebase
import DLRadioButton

class LoginViewController: UIViewController {

    @IBOutlet weak var phoneNumberInputView: InputFieldView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var switchLoginButton: UILabel!
    @IBOutlet weak var registerLabel: UILabel!
    @IBOutlet weak var registerAskLabel: UILabel!
    @IBOutlet weak var signInGoogleView: UIView!
    @IBOutlet weak var clientRadioButton: DLRadioButton!
    @IBOutlet weak var applicatorRadioButton: DLRadioButton!
    @IBOutlet weak var registerAsContainerVie: UIView!
    @IBOutlet weak var registerPhoneIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var registerGoogleIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var signInSeparator: UIView!
    
    @IBOutlet weak var topRegisterAsConstraintLayout: NSLayoutConstraint!
    
    private var canRegisterOrLogin: Bool = false
    private var state: String = "Login"
    
    private let presenter: LoginPresenter = LoginPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberInputView.delegate = self
        phoneNumberInputView.setUpData(hint: "Masukkan no hp", type: .numberPad)
        
        presenter.delegate = self
        
        clientRadioButton.contentHorizontalAlignment = .left
        applicatorRadioButton.contentHorizontalAlignment = .left
        
        setUpGoogleSignIn()
        switchState()
        
        loadingState(isLoading: false)
        
        switchLoginButton.onClick {
            if (self.state == "Register") {
                self.state = "Login"
            } else {
                self.state = "Register"
            }
            
            self.switchState()
        }
        
        signInGoogleView.onClick {
            self.loadingState(isLoading: true)
            GIDSignIn.sharedInstance()?.signIn()
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
            registerAsContainerVie.isHidden = true
            signInSeparator.isHidden = false
            signInGoogleView.isHidden = false
            topRegisterAsConstraintLayout.constant = -registerAsContainerVie.frame.height
        } else {
            registerLabel.text = "Register"
            registerButton.setTitle("Register", for: .normal)
            registerAskLabel.text = "Sudah punya akun?"
            switchLoginButton.text = "Login"
            signInSeparator.isHidden = true
            signInGoogleView.isHidden = true
            registerAsContainerVie.isHidden = false
            topRegisterAsConstraintLayout.constant = 16
        }
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func buttonRegisterOrLoginValidation() {
        registerButton.backgroundColor = canRegisterOrLogin ? UIColor(named: "blue_success") : UIColor(named: "gray_button")
    }
    
    private func validateRegister() -> Bool {
        if (applicatorRadioButton.isSelected) {
            return true
        }
        
        if (clientRadioButton.isSelected) {
            return true
        }
        
        return false
    }
    
    private func goToOTPScreen(shouldGoToHomeAfterSuccessOTP: Bool) {
        let viewController: OTPViewController = OTPViewController()
        viewController.phoneNumber = UIGenerator.changePhoneNumber(phoneNumber: phoneNumberInputView.text)
        viewController.shouldGoToHomeAfterSuccess = shouldGoToHomeAfterSuccessOTP
        
        let navigationController: UINavigationController = UINavigationController(rootViewController: viewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setToolbarHidden(true, animated: false)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    private func goToHome() {
        let navigationController: UINavigationController = UINavigationController(rootViewController: HomeViewController())
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setToolbarHidden(true, animated: false)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    private func loadingState(isLoading: Bool) {
        self.registerGoogleIndicatorView.isHidden = !isLoading
        self.registerPhoneIndicatorView.isHidden = !isLoading
        self.registerButton.isHidden = isLoading
        self.signInGoogleView.isHidden = isLoading
    }
    
    @IBAction func onRegisterClicked(_ sender: Any) {
        if (canRegisterOrLogin) {
            loadingState(isLoading: true)
            if (state == "Register") {
                if (validateRegister()) {
                    if (applicatorRadioButton.isSelected) {
                        loadingState(isLoading: false)
                        
                        let viewController: SelectSkillViewController = SelectSkillViewController()
                        viewController.phoneNumber = phoneNumberInputView.text
                        navigationController?.pushViewController(viewController, animated: true)
                        return
                    }
                    
                    presenter.requestRegister(phone: phoneNumberInputView.text, isApplicator: applicatorRadioButton.isSelected)
                }
            } else {
                presenter.requestLogin(phone: phoneNumberInputView.text)
            }
        }
    }
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        loadingState(isLoading: false)
        if (error != nil) {
            return
        }
        
        let token = signIn.currentUser.authentication.idToken ?? ""
        let firebaseToken = Messaging.messaging().fcmToken ?? ""
        presenter.requestLoginGoogle(token: token)
    }
}

extension LoginViewController: LoginPresenterDelegate {
    func successLogin(shouldByPassToDashboard: Bool) {
        if (shouldByPassToDashboard) {
            goToHome()
        } else {
            goToOTPScreen(shouldGoToHomeAfterSuccessOTP: true)
        }
    }
    
    func successRegister(isApplicator: Bool) {
        goToOTPScreen(shouldGoToHomeAfterSuccessOTP: false)
    }
    
    func failed(message: String) {
        print(message)
        loadingState(isLoading: false)
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
