//
//  RoomChildListViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 04/07/21.
//

import UIKit

class RoomChildListViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    private let presenter: RoomChildListPresenter = RoomChildListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        setUpTable()
        
        presenter.getChatRoomList()
    }
    
    private func setUpTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: String(describing: RoomListTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: RoomListTableViewCell.self))
    }
    
    @IBAction func onSearchChanged(_ sender: Any) {
        
    }
}

extension RoomChildListViewController: RoomChildListPresenterDelegate {
    func successLoadRoomList() {
        tableView.reloadData()
    }
    
    func onFailed(message: String) {
        present(UIGenerator.showDialog(title: "Error", message: message), animated: true, completion: nil)
    }
}

extension RoomChildListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RoomListTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: RoomListTableViewCell.self), for: indexPath) as! RoomListTableViewCell
        cell.setUpData(entity: presenter.list[indexPath.row], isApplicator: false)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
