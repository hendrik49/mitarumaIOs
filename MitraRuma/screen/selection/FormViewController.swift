//
//  FormViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 28/06/21.
//

import UIKit

protocol FormViewControllerDelegate {
    func onSaveClicked(id: String, list: [UIFormBuilderEntity])
}

class FormViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var id: String = ""
    var toolbarTitle: String = ""
    var list: [UIFormBuilderEntity] = []
    var delegate: FormViewControllerDelegate!
    private let presenter: FormPresenter = FormPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        presenter.id = id
        
        titleLabel.text = toolbarTitle
        setUpTableView()
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: String(describing: FormTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FormTableViewCell.self))
    }

    @IBAction func onBackPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onSaveClicked(_ sender: Any) {
        let tempName: String = list.first { entity in
            return entity.id == "name"
        }?.text ?? ""
        
        let tempEmail: String = list.first { entity in
            return entity.id == "email"
        }?.text ?? ""
        
        let tempPhoneNumber: String = list.first { entity in
            return entity.id == "phoneNumber"
        }?.text ?? ""
        
        let tempAddress: String = list.first { entity in
            return entity.id == "alamat"
        }?.text ?? ""
        
        let tempCity: String = list.first { entity in
            return entity.id == "kecamatan"
        }?.text ?? ""
        
        let tempZipCode: String = list.first { entity in
            return entity.id == "kode_pos"
        }?.text ?? ""
        
        presenter.update(name: tempName, email: tempEmail, phoneNumber: tempPhoneNumber, address: tempAddress, city: tempCity, zipCode: tempZipCode)
    }
}

extension FormViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FormTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: FormTableViewCell.self), for: indexPath) as! FormTableViewCell
        cell.setUpData(entity: list[indexPath.row], delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension FormViewController: SingleInputFieldWithTitleViewDelegate {
    func onTextChanged(id: String, text: String) {
        if let tempEntity: UIFormBuilderEntity = list.first(where: { entity in
            return entity.id == id
        }) {
            var temp = tempEntity
            temp.text = text
            
            let index: Int = list.firstIndex { indexEntity in
                return indexEntity.id == temp.id
            } ?? -1
            
            if (index != -1) {
                list[index] = temp
            }
        }
    }
}

extension FormViewController: FormPresenterDelegate {
    func onSuccessChange() {
        delegate.onSaveClicked(id: id, list: list)
        navigationController?.popViewController(animated: true)
    }
    
    func onFailed(message: String) {
        
    }
}
