//
//  BannerCollectionViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 17/06/21.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    var entity: RemoteBannerEntity!

    func setUpData(entity: RemoteBannerEntity) {
        self.entity = entity
        if let url = URL(string: entity.image) {
            UIGenerator.downloadImage(from: url, imageView: imageView)
        }
    }
}
