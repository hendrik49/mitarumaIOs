//
//  AccountViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 22/06/21.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var skillSetButton: UIButton!
    @IBOutlet weak var coverageButton: UIButton!
    @IBOutlet weak var logoutView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }
    
    private func setUpData() {
        nameLabel.text = CustomUserDefaults.getName().isEmpty ? "-" : CustomUserDefaults.getName()
        emailLabel.text = CustomUserDefaults.getEmail().isEmpty ? "-" : CustomUserDefaults.getEmail()
        phoneNumberLabel.text = CustomUserDefaults.getPhoneNumber().isEmpty ? "-" : CustomUserDefaults.getPhoneNumber()
        addressLabel.text = CustomUserDefaults.getAddress().isEmpty ? "-" : CustomUserDefaults.getAddress()
        
        logoutView.onClick {
            CustomUserDefaults.setType(type: "")
            CustomUserDefaults.setAddress(address: "")
            CustomUserDefaults.setPhoto(photo: "")
            CustomUserDefaults.setAuthToken(token: "")
            CustomUserDefaults.setName(name: "")
            CustomUserDefaults.setEmail(email: "")
            CustomUserDefaults.setPhoneNumber(phoneNumber: "")
            
            self.goToLogin()
        }
    }
    
    private func goToLogin() {
        let navigationController: UINavigationController = UINavigationController(rootViewController: LoginViewController())
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setToolbarHidden(true, animated: false)
        navigationController.modalPresentationStyle = .fullScreen
        parent?.present(navigationController, animated: true, completion: nil)
    }
}
