//
//  SelectionPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 11/06/21.
//

import Foundation

protocol CoveragePresenterDelegate {
    func successRegister()
    func failed(message: String)
    func successFilter()
    func successLoadCoverage()
}

class CoveragePresenter {
    
    var list: [UIGroupEntity] = []
    var viewedList: [UIGroupEntity] = []
    var delegate: CoveragePresenterDelegate!
    
    func register(phoneNumber: String, skillSet: [String]) {
        PhoneRegisterApplicatorUseCase.shared.setParams(entity: ParamsLoginEntity(phone: UIGenerator.changePhoneNumber(phoneNumber: phoneNumber), extensionAttributes: buildExtensionAttributes(skillSet: skillSet))).execute { entity in
            self.delegate.successRegister()
        } failed: { error in
            self.delegate.failed(message: error)
        }
    }
    
    func getCoverageList() {
        GetCoverageUseCase.shared.execute { entity in
            self.list.append(contentsOf: entity.values?.map({ groupEntity in
                var group = UIGroupEntity()
                group.title = groupEntity.title
                group.child.append(contentsOf: groupEntity.child.map({ text in
                    UIPickerEntity(id: text, name: text, isSelected: false)
                }))
                
                return group
            }) ?? [])
            
            self.viewedList.append(contentsOf: self.list)
            self.delegate.successLoadCoverage()
        } failed: { error in
            self.delegate.failed(message: error)
        }
    }
    
    func onSearch(text: String) {
        viewedList.removeAll()
        if (text.count == 0) {
            viewedList.append(contentsOf: list)
            delegate.successFilter()
            return
        }
        
        list.forEach { groupEntity in
            let result = groupEntity.child.filter { $0.name.lowercased().contains(text.lowercased()) }
            if (result.count > 0) {
                var tempGroupEntity: UIGroupEntity = UIGroupEntity(title: groupEntity.title, child: [])
                tempGroupEntity.child.append(contentsOf: result)
                viewedList.append(tempGroupEntity)
            }
        }
        
        delegate.successFilter()
    }
    
    private func buildExtensionAttributes(skillSet: [String]) -> [ParamsExtensionAttributesEntity] {
        var list: [ParamsExtensionAttributesEntity] = []
        list.append(ParamsExtensionAttributesEntity(name: "SKILLSET", values: skillSet))
        list.append(ParamsExtensionAttributesEntity(name: "Coverage", values: getSelectedSkills()))
        return list
    }
    
    private func getSelectedSkills() -> [String] {
        var selectedSkills: [String] = []
        list.forEach {
            $0.child.forEach { entity in
                if (entity.isSelected) {
                    selectedSkills.append(entity.name)
                }
            }
        }
        
        return selectedSkills
    }
}
