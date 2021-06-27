//
//  SelectSkillPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 10/06/21.
//

import Foundation

protocol SelectSkillPresenterDelegate {
    func shouldUpdateCounter()
    func onSuccessGetList()
    func onFailed(message: String)
}

class SelectSkillPresenter {
    
    var skillList: [UIPickerEntity] = []
    var delegate: SelectSkillPresenterDelegate? = nil
    
    func requestSkillList() {
        GetSkillSetUseCase.shared.execute { entity in
            self.skillList.append(contentsOf: entity.values?.map({ remoteEntity in
                return UIPickerEntity(id: remoteEntity.name, name: remoteEntity.name, isSelected: false)
            }) ?? [])
            self.delegate?.onSuccessGetList()
        } failed: { error in
            self.delegate?.onFailed(message: error)
        }
    }
    
    func selectItem(entity: UIPickerEntity) {
        if let index = skillList.firstIndex(where: { $0.name == entity.name }) {
            skillList[index].isSelected = !skillList[index].isSelected
        }
        
        delegate?.shouldUpdateCounter()
    }
}
