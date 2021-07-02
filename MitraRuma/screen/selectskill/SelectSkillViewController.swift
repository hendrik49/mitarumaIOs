//
//  SelectSkillViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 10/06/21.
//

import UIKit

class SelectSkillViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectedInformationLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    private let presenter: SelectSkillPresenter = SelectSkillPresenter()
    
    var phoneNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
        
        setUpTableView()
        presenter.requestSkillList()
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onNextClicked(_ sender: Any) {
        var skillSetList: [String] = []
        presenter.skillList.forEach { entity in
            if (entity.isSelected) {
                skillSetList.append(entity.name)
            }
        }
        
        let viewController: CoverageViewController = CoverageViewController()
        viewController.phoneNumber = phoneNumber
        viewController.skillSetList = skillSetList
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: String(describing: TitleTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TitleTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: SelectionTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SelectionTableViewCell.self))
    }
}

extension SelectSkillViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.skillList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0) {
            let cell: TitleTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleTableViewCell.self), for: indexPath) as! TitleTableViewCell
            return cell
        } else {
            let cell: SelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: SelectionTableViewCell.self), for: indexPath) as! SelectionTableViewCell
            cell.delegate = self
            cell.setUpData(entity: presenter.skillList[indexPath.row - 1])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row != 0) {
            presenter.selectItem(entity: presenter.skillList[indexPath.row - 1])
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SelectSkillViewController: SelectSkillPresenterDelegate {
    func onSuccessGetList() {
        tableView.reloadData()
    }
    
    func onFailed(message: String) {
        UIGenerator.showDialog(title: "Error", message: message)
    }
    
    func shouldUpdateCounter() {
        tableView.reloadData()
        
        let count: Int = presenter.skillList.filter { $0.isSelected }.count
        selectedInformationLabel.text = "Kamu memilih \(count) skill"
    }
}

extension SelectSkillViewController: OnItemSelectedDelegate {
    func onItemSelected(entity: UIPickerEntity) {
        presenter.selectItem(entity: entity)
    }
}
