//
//  AddPhotoCollectionViewCell.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 01/07/21.
//

import UIKit

protocol AddPhotoCollectionViewCellDelegate {
    func onAddPhotoClicked()
}

class AddPhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var baseView: UIView!
    
    var delegate: AddPhotoCollectionViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let yourViewBorder = CAShapeLayer()
        yourViewBorder.strokeColor = #colorLiteral(red: 0.5099999905, green: 0.5099999905, blue: 0.5099999905, alpha: 1)
        yourViewBorder.lineDashPattern = [5, 5]
        yourViewBorder.frame = baseView.bounds
        yourViewBorder.fillColor = nil
        yourViewBorder.path = UIBezierPath(rect: baseView.bounds).cgPath
        baseView.layer.addSublayer(yourViewBorder)
        
        baseView.onClick {
            self.delegate.onAddPhotoClicked()
        }
    }
}
