//
//  PhotoCollectionViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 01/07/21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    func setUpData(entity: UIUriEntity) {
        if (entity.remoteUrl.isEmpty) {
            UIGenerator.downloadImage(from: entity.url, imageView: imageView)
        } else {
            if let url = URL(string: entity.remoteUrl) {
                UIGenerator.downloadImage(from: url, imageView: imageView)
            }
        }
    }
}
