//
//  SelectionTableViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 10/06/21.
//

import UIKit
import SimpleCheckbox

protocol OnItemSelectedDelegate {
    func onItemSelected(entity: UIPickerEntity)
}

class SelectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkBox: Checkbox!
    @IBOutlet weak var label: UILabel!
    
    private var entity: UIPickerEntity!
    var delegate: OnItemSelectedDelegate? = nil
    
    override func awakeFromNib() {
        checkBox.addTarget(self, action: #selector(checkboxValueChanged(sender:)), for: .valueChanged)
    }
    
    @objc func checkboxValueChanged(sender: Checkbox) {
        delegate?.onItemSelected(entity: entity)
    }
    
    func setUpData(entity: UIPickerEntity, isSelected: Bool) {
        self.entity = entity
        label.text = entity.name
        checkBox.isChecked = isSelected
    }
}
