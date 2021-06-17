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
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var dashboardContentView: UIView!
    @IBOutlet weak var transactionContentView: UIView!
    @IBOutlet weak var accountContentView: UIView!
    
    private var activeIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        scrollView.delegate = self
        setOnClick()
        setUpIndicator()
    }
    
    private func setUpView() {
        let dashboardViewController: UIViewController = DashboardViewController()
        addChild(dashboardViewController)
        dashboardViewController.view.frame = CGRect(x: 0, y: 0, width: dashboardContentView.frame.width, height: dashboardContentView.frame.height)
        view.addSubview(dashboardViewController.view)
        
        let dashboardViewController2: UIViewController = DashboardViewController()
        addChild(dashboardViewController2)
        dashboardViewController2.view.frame = CGRect(x: 0, y: 0, width: transactionContentView.frame.width, height: transactionContentView.frame.height)
        view.addSubview(dashboardViewController2.view)
        
        let dashboardViewController3: UIViewController = DashboardViewController()
        addChild(dashboardViewController3)
        dashboardViewController3.view.frame = CGRect(x: 0, y: 0, width: accountContentView.frame.width, height: accountContentView.frame.height)
        view.addSubview(dashboardViewController3.view)
    }
    
    private func setOnClick() {
        homeView.onClick {
            self.activeIndex = 0
            self.shouldScrollTo()
        }
        
        transactionView.onClick {
            self.activeIndex = 1
            self.shouldScrollTo()
        }
        
        accountView.onClick {
            self.activeIndex = 2
            self.shouldScrollTo()
        }
    }
    
    private func shouldScrollTo() {
        var position: CGFloat = 0
        if (activeIndex == 1) {
            position = UIScreen.main.bounds.width
        } else if (activeIndex == 2) {
            position = UIScreen.main.bounds.width * 2
        }
        
        scrollView.setContentOffset(CGPoint(x: position, y: 0), animated: true)
    }
    
    private func setUpIndicator() {
        setHomeIndicator(isActive: activeIndex == 0)
        setTransactionIndicator(isActive: activeIndex == 1)
        setAccountIndicator(isActive: activeIndex == 2)
    }
    
    private func setHomeIndicator(isActive: Bool) {
        homeImageView.image = UIImage(named: isActive ? "ic_home_active" : "ic_home_inactive")
        homeLabel.textColor = UIColor(named: isActive ? "red_active" : "indicator_inactive")
    }
    
    private func setTransactionIndicator(isActive: Bool) {
        transactionImageVIew.image = UIImage(named: isActive ? "ic_transaction_active" : "ic_transaction_inactive")
        transactionLabel.textColor = UIColor(named: isActive ? "red_active" : "indicator_inactive")
    }
    
    private func setAccountIndicator(isActive: Bool) {
        accountImageView.image = UIImage(named: isActive ? "ic_account_active" : "ic_account_inactive")
        accountLabel.textColor = UIColor(named: isActive ? "red_active" : "indicator_inactive")
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.x == 0) {
            activeIndex = 0
        } else if (scrollView.contentOffset.x == UIScreen.main.bounds.width) {
            activeIndex = 1
        } else if (scrollView.contentOffset.x == UIScreen.main.bounds.width * 2) {
            activeIndex = 2
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        setUpIndicator()
    }
}
