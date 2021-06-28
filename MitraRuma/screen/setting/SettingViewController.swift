//
//  SettingViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 28/06/21.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var changeNameView: UIView!
    @IBOutlet weak var changeEmailView: UIView!
    @IBOutlet weak var changePhoneNumberView: UIView!
    @IBOutlet weak var changeAddressView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpOnClick()
    }
    
    private func setUpOnClick() {
        changeNameView.onClick {
            var list: [UIFormBuilderEntity] = []
            list.append(UIFormBuilderEntity(id: "", title: "Masukkan nama baru kamu", hint: "Nama", text: ""))
            
            let viewController: FormViewController = FormViewController()
            viewController.delegate = self
            viewController.list = list
            viewController.title = "Ubah nama"
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        changeEmailView.onClick {
            
        }
        
        changePhoneNumberView.onClick {
            
        }
        
        changeAddressView.onClick {
            
        }
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension SettingViewController: FormViewControllerDelegate {
    func onSaveClicked(list: [UIFormBuilderEntity]) {
        print("ok")
    }
}
