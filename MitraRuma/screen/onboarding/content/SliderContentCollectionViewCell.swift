//
//  SliderContentCollectionViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 04/06/21.
//

import UIKit

class SliderContentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setUpData(entity: UISliderEntity) {
        descriptionLabel.text = entity.description
        imageView.image = UIImage(named: entity.imageName)
    }
}
