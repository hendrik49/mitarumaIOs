//
//  CategoryCollectionViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 19/06/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heightSizeConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthSizeConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var label: UILabel!
    
    func setUpData(imageUrl: String, title: String, size: CGFloat) {
        if let url = URL(string: imageUrl) {
            UIGenerator.downloadImage(from: url, imageView: imageView)
        }
        heightSizeConstraint.constant = size
        widthSizeConstraint.constant = size
        containerView.cornerRadius = size / 2
        label.text = title
    }
}
