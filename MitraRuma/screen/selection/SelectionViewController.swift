//
//  SelectionViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 10/06/21.
//

import UIKit

class SelectionViewController: UIViewController {

    @IBOutlet weak var coverageInformationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    private let presenter: SelectionPresenter = SelectionPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        
        for a in 0 ..< 5 {
            var item = UIGroupEntity(title: "Title ke \(a + 1)", child: [])
            for b in 0 ..< 10 {
                item.child.append(UIPickerEntity(id: "\(b + 1)", name: "Child ke \(b + 1)", isSelected: false))
            }
            presenter.list.append(item)
        }
        
        tableView.reloadData()
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: String(describing: SearchTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SearchTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: TitleTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TitleTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: SelectionTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SelectionTableViewCell.self))
    }

    @IBAction func onBackPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onNextClicked(_ sender: Any) {
        
    }
}

extension SelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countNumber = 0
        presenter.list.forEach { entity in
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
            for entity in presenter.list {
                if (tempIndex == 0) {
                    let cell: TitleTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleTableViewCell.self), for: indexPath) as! TitleTableViewCell
                    cell.setUpData(text: entity.title)
                    return cell
                } else if (tempIndex <= entity.child.count) {
                    let cell: SelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: SelectionTableViewCell.self), for: indexPath) as! SelectionTableViewCell
                    cell.delegate = self
                    cell.setUpData(entity: entity.child[tempIndex - 1], isSelected: false)
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
}

extension SelectionViewController: SearchTableViewCellDelegate {
    func onSearchTextChanged(text: String) {
        
    }
}

extension SelectionViewController: OnItemSelectedDelegate {
    func onItemSelected(entity: UIPickerEntity) {
        
    }
}
