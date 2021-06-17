//
//  DashboardPresenter.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 17/06/21.
//

import Foundation

class DashboardPresenter {
    
    var list: [RemoteBannerEntity] = []
    
    func setUpData() {
        list.append(RemoteBannerEntity(imageUrl: "https://apexwebmarketing.com/wp-content/uploads/2020/09/Banner-Designing-Services1.jpg", clickUrl: "https://www.google.com"))
        list.append(RemoteBannerEntity(imageUrl: "https://apexwebmarketing.com/wp-content/uploads/2020/09/Banner-Designing-Services1.jpg", clickUrl: "https://www.google.com"))
        list.append(RemoteBannerEntity(imageUrl: "https://apexwebmarketing.com/wp-content/uploads/2020/09/Banner-Designing-Services1.jpg", clickUrl: "https://www.google.com"))
    }
}
