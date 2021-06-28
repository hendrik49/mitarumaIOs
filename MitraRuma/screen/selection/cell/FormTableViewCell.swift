//
//  FormTableViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 28/06/21.
//

import UIKit

class FormTableViewCell: UITableViewCell {

    @IBOutlet weak var singleInputVie: SingleInputFieldWithTitleView!
    
    func setUpData(entity: UIFormBuilderEntity) {
        singleInputVie.setUp(entity: entity)
        
    }
}
