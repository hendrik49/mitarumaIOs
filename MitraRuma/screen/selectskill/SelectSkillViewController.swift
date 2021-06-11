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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
        
        setUpTableView()
        
        presenter.skillList.append(UIPickerEntity(id: "1", name: "Memasak", isSelected: false))
        presenter.skillList.append(UIPickerEntity(id: "2", name: "Menggunjing", isSelected: false))
        presenter.skillList.append(UIPickerEntity(id: "3", name: "Menanak", isSelected: false))
        presenter.skillList.append(UIPickerEntity(id: "4", name: "Bercocok tanam", isSelected: false))
        
        tableView.reloadData()
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onNextClicked(_ sender: Any) {
        navigationController?.pushViewController(SelectionViewController(), animated: true)
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
            let isSelected = presenter.selectedSkillList.first { entity in
                entity.id == presenter.skillList[indexPath.row - 1].id
            }
            
            let cell: SelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: SelectionTableViewCell.self), for: indexPath) as! SelectionTableViewCell
            cell.delegate = self
            cell.setUpData(entity: presenter.skillList[indexPath.row - 1], isSelected: isSelected != nil)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row != 0) {
            presenter.selectItem(entity: presenter.skillList[indexPath.row - 1])
        }
    }
}

extension SelectSkillViewController: SelectSkillPresenterDelegate {
    func shouldUpdateCounter() {
        tableView.reloadData()
        selectedInformationLabel.text = "Kamu memilih \(presenter.selectedSkillList.count) skill"
    }
}

extension SelectSkillViewController: OnItemSelectedDelegate {
    func onItemSelected(entity: UIPickerEntity) {
        presenter.selectItem(entity: entity)
    }
}
