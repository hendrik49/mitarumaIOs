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
            list.append(UIFormBuilderEntity(id: "name", title: "Masukkan nama baru kamu", hint: "Nama", text: ""))
            
            let viewController: FormViewController = FormViewController()
            viewController.delegate = self
            viewController.list = list
            viewController.id = "name"
            viewController.toolbarTitle = "Ubah nama"
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        changeEmailView.onClick {
            var list: [UIFormBuilderEntity] = []
            list.append(UIFormBuilderEntity(id: "email", title: "Masukkan alamat email baru kamu", hint: "Email", text: ""))
            
            let viewController: FormViewController = FormViewController()
            viewController.delegate = self
            viewController.list = list
            viewController.id = "email"
            viewController.toolbarTitle = "Ubah email"
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        changePhoneNumberView.onClick {
            var list: [UIFormBuilderEntity] = []
            list.append(UIFormBuilderEntity(id: "phoneNumber", title: "Masukkan nomor telepon baru", hint: "Nomor telepon", text: ""))
            
            let viewController: FormViewController = FormViewController()
            viewController.delegate = self
            viewController.list = list
            viewController.id = "phone"
            viewController.toolbarTitle = "Ubah nama"
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        changeAddressView.onClick {
            var list: [UIFormBuilderEntity] = []
            list.append(UIFormBuilderEntity(id: "alamat", title: "Masukkan Alamat", hint: "Alamat", text: ""))
            list.append(UIFormBuilderEntity(id: "kecamatan", title: "Masukkan Kota/Kecamatan", hint: "Kota/Kecamatan", text: ""))
            list.append(UIFormBuilderEntity(id: "kode_pos", title: "Kode Pos", hint: "Kode Pos", text: ""))
            
            let viewController: FormViewController = FormViewController()
            viewController.delegate = self
            viewController.list = list
            viewController.id = "address"
            viewController.toolbarTitle = "Ubah alamat"
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension SettingViewController: FormViewControllerDelegate {
    func onSaveClicked(id: String, list: [UIFormBuilderEntity]) {
        
    }
}
