//
//  FormPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 29/06/21.
//

import Foundation

protocol FormPresenterDelegate {
    func onSuccessChange()
    func onFailed(message: String)
    func onSuccessLoadAddress()
}

class FormPresenter {
    
    var list: [UIFormBuilderEntity] = []
    var delegate: FormPresenterDelegate!
    var addressId: Int = 0
    var id: String = ""
    
    func onTextChanged(id: String, text: String) {
        if let tempEntity: UIFormBuilderEntity = list.first(where: { entity in
            return entity.id == id
        }) {
            var temp = tempEntity
            temp.text = text
            
            let index: Int = list.firstIndex { indexEntity in
                return indexEntity.id == temp.id
            } ?? -1
            
            if (index != -1) {
                list[index] = temp
            }
        }
    }
    
    func getAddress() {
        if (list.first(where: { entity in
            return entity.id == "alamat"
        }) == nil) {
            return
        }
        
        GetAddressUseCase.shared.execute { response in
            self.addressId = response.id
            if let indexAddress: Int = self.list.firstIndex(where: { entity in
                return entity.id == "alamat"
            }) {
                var tempAddress = self.list[indexAddress]
                tempAddress.text = response.street
                self.list[indexAddress] = tempAddress
            }
            
            if let indexCity: Int = self.list.firstIndex(where: { entity in
                return entity.id == "kecamatan"
            }) {
                var tempCity = self.list[indexCity]
                tempCity.text = response.street
                self.list[indexCity] = tempCity
            }
            
            if let indexZipCode: Int = self.list.firstIndex(where: { entity in
                return entity.id == "kode_pos"
            }) {
                var tempZipCode = self.list[indexZipCode]
                tempZipCode.text = response.street
                self.list[indexZipCode] = tempZipCode
            }
            
            self.delegate.onSuccessLoadAddress()
        } failed: { error in
            self.delegate.onFailed(message: error)
        }
    }
    
    func update(name: String, email: String, phoneNumber: String, address: String, city: String, zipCode: String) {
        var tempName: String = name
        var tempEmail: String = email
        var tempPhoneNumber: String = phoneNumber
        let tempAddress: String = address
        let tempCity: String = city
        let tempZipCode: String = zipCode
        
        if (tempName.isEmpty) {
            tempName = CustomUserDefaults.getName()
        }
        
        if (tempEmail.isEmpty) {
            tempEmail = CustomUserDefaults.getEmail()
        }
        
        if (tempPhoneNumber.isEmpty) {
            tempPhoneNumber = CustomUserDefaults.getPhoneNumber()
        }
        
        if (tempAddress.isEmpty) {
            UpdateProfileUseCase.shared.setParams(entity: ParamsProfileEntity(user_nicename: tempName, user_email: tempEmail, user_phone_number: tempPhoneNumber)).execute { response in
                if (!tempName.isEmpty) {
                    CustomUserDefaults.setName(name: tempName)
                }
                
                if (!tempEmail.isEmpty) {
                    CustomUserDefaults.setEmail(email: tempEmail)
                }
                
                if (!tempPhoneNumber.isEmpty) {
                    CustomUserDefaults.setPhoneNumber(phoneNumber: tempPhoneNumber)
                }
                
                self.delegate?.onSuccessChange()
            } failed: { error in
                self.delegate?.onFailed(message: error)
            }
        } else {
            if (addressId == 0) {
                AddAddressUseCase.shared.setParams(entity: ParamsUpdateAddressEntity(id: 0, street: tempAddress, city: tempCity, zipcode: tempZipCode)).execute { response in
                    self.delegate?.onSuccessChange()
                } failed: { error in
                    self.delegate?.onFailed(message: error)
                }
            } else {
                UpdateAddressUseCase.shared.setParams(entity: ParamsUpdateAddressEntity(id: addressId, street: tempAddress, city: tempCity, zipcode: tempZipCode)).execute { response in
                    self.delegate?.onSuccessChange()
                } failed: { error in
                    self.delegate?.onFailed(message: error)
                }
            }
        }
    }
}
