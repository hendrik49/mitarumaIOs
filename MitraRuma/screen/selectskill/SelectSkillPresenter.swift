//
//  SelectSkillPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 10/06/21.
//

import Foundation

protocol SelectSkillPresenterDelegate {
    func shouldUpdateCounter()
}

class SelectSkillPresenter {
    
    var skillList: [UIPickerEntity] = []
    var delegate: SelectSkillPresenterDelegate? = nil
    var selectedSkillList: [UIPickerEntity] = []
    
    func selectItem(entity: UIPickerEntity) {
        let temp = selectedSkillList.first(where: { tempEntity in
            tempEntity.id == entity.id
        })
        
        if (temp == nil) {
            selectedSkillList.append(entity)
        } else {
            if let index = selectedSkillList.firstIndex(where: { tempEntity in
                tempEntity.id == entity.id
            }) {
                selectedSkillList.remove(at: index)
            }
        }
        
        delegate?.shouldUpdateCounter()
    }
}
