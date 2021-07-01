//
//  ConsultationItemTableViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 30/06/21.
//

import UIKit

class ConsultationItemTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setUpData(title: String) {
        descriptionLabel.text = title
    }
}
