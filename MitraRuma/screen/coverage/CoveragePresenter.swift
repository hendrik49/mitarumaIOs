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
}

class CoveragePresenter {
    
    var list: [UIGroupEntity] = []
    var delegate: CoveragePresenterDelegate!
    
    func register(phoneNumber: String, skillSet: [String]) {
        PhoneRegisterApplicatorUseCase.shared.setParams(entity: ParamsLoginEntity(phone: phoneNumber, extensionAttributes: buildExtensionAttributes(skillSet: skillSet))).execute { entity in
            self.delegate.successRegister()
        } failed: { error in
            self.delegate.failed(message: error)
        }
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
