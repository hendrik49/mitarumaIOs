//
//  ConsultationViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 30/06/21.
//

import UIKit

class ConsultationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let presenter: ConsultationPresenter = ConsultationPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        setUpTableView()
        
        presenter.requestVideo()
        presenter.requestBenefits()
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: String(describing: ConsultationVideoTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ConsultationVideoTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: ConsultationTitleTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ConsultationTitleTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: ConsultationItemTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ConsultationItemTableViewCell.self))
    }
    
    @IBAction func onBookClicked(_ sender: Any) {
        let viewController: AddConsultationViewController = AddConsultationViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension ConsultationViewController: ConsultationPresenterDelegate {
    func successLoadBenefitsList() {
        tableView.reloadData()
    }
    
    func successLoadVideo() {
        tableView.reloadData()
    }
    
    func onFailed(message: String) {
        present(UIGenerator.showDialog(title: "error", message: message), animated: true, completion: nil)
    }
}

extension ConsultationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + presenter.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0) {
            let cell: ConsultationVideoTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConsultationVideoTableViewCell.self), for: indexPath) as! ConsultationVideoTableViewCell
            cell.setUpData(title: "Renovate your home easily with MitraRuma", video: "8oC5NPMQzoc")
            return cell
        } else if (indexPath.row == 1) {
            let cell: ConsultationTitleTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConsultationTitleTableViewCell.self), for: indexPath) as! ConsultationTitleTableViewCell
            return cell
        } else {
            let cell: ConsultationItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConsultationItemTableViewCell.self), for: indexPath) as! ConsultationItemTableViewCell
            cell.setUpData(title: presenter.list[indexPath.row - 2])
            return cell
        }
    }
}
