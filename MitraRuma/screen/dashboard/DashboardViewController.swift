//
//  DashboardViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 07/06/21.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bannerLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpText()
    }
    
    private func setUpText() {
        let string: NSMutableAttributedString = NSMutableAttributedString()
        
        let boldAttribute = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        
        string.append(NSAttributedString(string: "Konsultasikan hunian anda kepada "))
        string.append(NSAttributedString(string: "Mitra Ruma", attributes: boldAttribute))
        
        bannerLabel.attributedText = string
        bannerLabel.textColor = UIColor(named: "white")
    }
    
    @IBAction func onConsultationClicked(_ sender: Any) {
    }
}
