//
//  SearchTableViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 10/06/21.
//

import UIKit

protocol SearchTableViewCellDelegate {
    func onSearchTextChanged(text: String)
}

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var delegate: SearchTableViewCellDelegate? = nil
    
    @IBAction func onSearchTextChanged(_ sender: Any) {
        delegate?.onSearchTextChanged(text: searchTextField.text ?? "")
    }
    
    
    @IBAction func onSearchClicked(_ sender: Any) {
        delegate?.onSearchTextChanged(text: searchTextField.text ?? "")
    }
}
