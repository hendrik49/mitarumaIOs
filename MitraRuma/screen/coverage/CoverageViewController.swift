//
//  CoverageViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 10/06/21.
//

import UIKit

class CoverageViewController: UIViewController {

    @IBOutlet weak var coverageInformationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var noDataFoundLabel: UILabel!
    @IBOutlet weak var loadingRegisterIndicatorView: UIActivityIndicatorView!
    
    var phoneNumber: String = ""
    var skillSetList: [String] = []
    private let presenter: CoveragePresenter = CoveragePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        presenter.delegate = self
        presenter.getCoverageList()
        
//        for a in 0 ..< 5 {
//            var item = UIGroupEntity(title: "Title ke \(a + 1)", child: [])
//            for b in 0 ..< 10 {
//                item.child.append(UIPickerEntity(id: "\(b + 1)", name: "Child ke \(b + 1)", isSelected: false))
//            }
//            presenter.list.append(item)
//        }
        
//        presenter.onSearch(text: "")
        
//        tableView.reloadData()
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: String(describing: SearchTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SearchTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: TitleTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TitleTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: SelectionTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SelectionTableViewCell.self))
    }
    
    private func goToOTPScreen() {
        let navigationController: UINavigationController = UINavigationController(rootViewController: OTPViewController())
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setToolbarHidden(true, animated: false)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    private func setLoadingState(isLoading: Bool) {
        loadingRegisterIndicatorView.isHidden = !isLoading
        nextButton.isHidden = isLoading
    }

    @IBAction func onBackPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onNextClicked(_ sender: Any) {
        setLoadingState(isLoading: true)
        presenter.register(phoneNumber: phoneNumber, skillSet: skillSetList)
    }
}

extension CoverageViewController: CoveragePresenterDelegate {
    func successLoadCoverage() {
        tableView.reloadData()
    }
    
    func successFilter() {
        noDataFoundLabel.isHidden = presenter.viewedList.count != 0
        tableView.reloadData()
    }
    
    func successRegister() {
        setLoadingState(isLoading: false)
        goToOTPScreen()
    }
    
    func failed(message: String) {
        setLoadingState(isLoading: false)
        present(UIGenerator.showDialog(title: "Error", message: message), animated: true, completion: nil)
    }
}

extension CoverageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countNumber = 0
        presenter.viewedList.forEach { entity in
            countNumber += entity.child.count + 1
        }
        
        return countNumber + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0) {
            let cell: SearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchTableViewCell.self), for: indexPath) as! SearchTableViewCell
            cell.delegate = self
            return cell
        } else {
            var tempIndex = indexPath.row - 1
            for entity in presenter.viewedList {
                if (tempIndex == 0) {
                    let cell: TitleTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleTableViewCell.self), for: indexPath) as! TitleTableViewCell
                    cell.setUpData(text: entity.title)
                    return cell
                } else if (tempIndex <= entity.child.count) {
                    let cell: SelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: SelectionTableViewCell.self), for: indexPath) as! SelectionTableViewCell
                    cell.delegate = self
                    cell.setUpData(entity: entity.child[tempIndex - 1])
                    return cell
                } else {
                    tempIndex -= entity.child.count + 1
                }
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 112
        }
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if (indexPath.row != 0) {
            var tempIndex = indexPath.row - 1
            for entity in presenter.list {
                if (tempIndex <= entity.child.count) {
                    if let index = presenter.list.firstIndex(where: { $0.title == entity.title }) {
                        presenter.list[index].child[tempIndex - 1].isSelected = !presenter.list[index].child[tempIndex - 1].isSelected
                        tableView.reloadData()
                        return
                    }
                } else {
                    tempIndex -= entity.child.count + 1
                }
            }
        }
    }
}

extension CoverageViewController: SearchTableViewCellDelegate {
    func onSearchTextChanged(text: String) {
        presenter.onSearch(text: text)
    }
}

extension CoverageViewController: OnItemSelectedDelegate {
    func onItemSelected(entity: UIPickerEntity) {
        var groupIndex: Int = 0
        var childIndex: Int = 0
        
        presenter.viewedList.forEach { groupEntity in
            groupEntity.child.forEach { tempEntity in
                if (entity.name == tempEntity.name) {
                    presenter.viewedList[groupIndex].child[childIndex].isSelected = !presenter.viewedList[groupIndex].child[childIndex].isSelected
                    tableView.reloadData()
                    return
                }
                
                childIndex += 1
            }
            
            groupIndex += 1
            childIndex = 0
        }
    }
}
