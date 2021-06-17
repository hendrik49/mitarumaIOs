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
        let url = URL(string: entity.imageUrl)
        let data = try? Data(contentsOf: url!)
        imageView.image = UIImage(data: data!)
    }
}
