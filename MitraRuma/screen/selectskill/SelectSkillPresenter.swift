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
    
    func selectItem(entity: UIPickerEntity) {
        if let index = skillList.firstIndex(where: { $0.name == entity.name }) {
            skillList[index].isSelected = !skillList[index].isSelected
        }
        
        delegate?.shouldUpdateCounter()
    }
}
