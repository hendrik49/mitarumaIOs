//
//  CoverageViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 10/06/21.
//

import UIKit

class CoverageViewController: UIViewController {

    @IBOutlet weak var selectCoverageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectCoverageView.onClick {
            
        }
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
