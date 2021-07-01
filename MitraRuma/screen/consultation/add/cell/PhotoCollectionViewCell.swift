//
//  PhotoCollectionViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 01/07/21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    func setUpData(image: URL) {
        UIGenerator.downloadImage(from: image, imageView: imageView)
    }
}
