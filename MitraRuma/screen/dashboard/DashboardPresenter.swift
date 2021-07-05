//
//  DashboardPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 17/06/21.
//

import Foundation

protocol DashboardPresenterDelegate {
    func successLoadBanner()
    func successLoadCategory()
    func onFailed(message: String)
}

class DashboardPresenter {
    
    var list: [RemoteBannerEntity] = []
    var categoryList: [RemoteCategoryEntity] = []
    var delegate: DashboardPresenterDelegate!
    
    func getBannerList() {
        GetBannerListUseCase.shared.execute { response in
            self.list.removeAll()
            self.list.append(contentsOf: response.values ?? [])
            self.delegate.successLoadBanner()
        } failed: { error in
            self.delegate.onFailed(message: error)
        }
    }
    
    func getCategoryList() {
        GetCategoryListUseCase.shared.execute { respose in
            self.categoryList.removeAll()
            self.categoryList.append(contentsOf: respose.values ?? [])
            self.delegate.successLoadCategory()
        } failed: { error in
            self.delegate.onFailed(message: error)
        }
    }
}
