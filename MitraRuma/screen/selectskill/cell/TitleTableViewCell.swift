//
//  TitleTableViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 10/06/21.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    func setUpData(text: String) {
        titleLabel.text = text
    }
}
