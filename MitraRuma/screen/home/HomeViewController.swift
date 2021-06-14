//
//  HomeViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 14/06/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var transactionView: UIView!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var accountView: UIView!
    
    @IBOutlet weak var transactionLabel: UILabel!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var transactionImageVIew: UIImageView!
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var accountImageView: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
