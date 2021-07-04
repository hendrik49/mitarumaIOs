//
//  RoomListViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 04/07/21.
//

import UIKit

class RoomListViewController: UIViewController {

    @IBOutlet weak var chatView: UIView!
    @IBOutlet weak var applicatorView: UIView!
    @IBOutlet weak var bottomIndicator: UIView!
    @IBOutlet weak var adminAndApplicatorLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var leadingConstraintView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        let viewController: RoomChildListViewController = RoomChildListViewController()
        viewController.view.frame = CGRect(x: 0, y: 0, width: chatView.bounds.width, height: chatView.bounds.height)
        addChild(viewController)
        chatView.addSubview(viewController.view)
        
        let viewController2: RoomChildListViewController = RoomChildListViewController()
        viewController2.view.frame = CGRect(x: 0, y: 0, width: applicatorView.bounds.width, height: applicatorView.bounds.height)
        addChild(viewController2)
        applicatorView.addSubview(viewController2.view)
        
        chatLabel.onClick {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
        
        adminAndApplicatorLabel.onClick {
            self.scrollView.setContentOffset(CGPoint(x: UIScreen.main.bounds.width, y: 0), animated: true)
        }
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension RoomListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.x == 0) {
            chatLabel.textColor = #colorLiteral(red: 0.9219999909, green: 0.3409999907, blue: 0.3409999907, alpha: 1)
            adminAndApplicatorLabel.textColor = #colorLiteral(red: 0.5099999905, green: 0.5099999905, blue: 0.5099999905, alpha: 1)
            leadingConstraintView.constant = 0
        } else if (scrollView.contentOffset.x == UIScreen.main.bounds.width) {
            adminAndApplicatorLabel.textColor = #colorLiteral(red: 0.9219999909, green: 0.3409999907, blue: 0.3409999907, alpha: 1)
            chatLabel.textColor = #colorLiteral(red: 0.5099999905, green: 0.5099999905, blue: 0.5099999905, alpha: 1)
            leadingConstraintView.constant = UIScreen.main.bounds.width / 2
        }
    }
}
