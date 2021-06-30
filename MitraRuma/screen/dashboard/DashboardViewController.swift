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
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var categoryHeightConstraint: NSLayoutConstraint!
    private let presenter: DashboardPresenter = DashboardPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setUpData()
        setUpText()
        setUpBannerCollectionView()
        setUpMenuCollectionView()
        
        notificationView.onClick {
            self.navigationController?.pushViewController(NotificationViewController(), animated: true)
        }
    }
    
    private func setUpBannerCollectionView() {
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        pageControl.numberOfPages = presenter.list.count
        
        bannerCollectionView.register(UINib(nibName: String(describing: BannerCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: BannerCollectionViewCell.self))
    }
    
    private func setUpMenuCollectionView() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        let size = (UIScreen.main.bounds.width - 48) / 5
        categoryHeightConstraint.constant = (size * 4)
        
        categoryCollectionView.register(UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: CategoryCollectionViewCell.self))
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
        
        nameLabel.text = "Hi \(CustomUserDefaults.getName().isEmpty ? "-" : CustomUserDefaults.getName())"
    }
    
    @IBAction func onConsultationClicked(_ sender: Any) {
        let viewController: ConsultationViewController = ConsultationViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == categoryCollectionView) {
            return 8
        } else {
            return presenter.list.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == categoryCollectionView) {
            let size = (UIScreen.main.bounds.width - 48) / 5
            let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionViewCell.self), for: indexPath) as! CategoryCollectionViewCell
            cell.setUpData(imageUrl: "https://apexwebmarketing.com/wp-content/uploads/2020/09/Banner-Designing-Services1.jpg", title: "Test Category", size: size)
            return cell
        } else {
            let cell: BannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BannerCollectionViewCell.self), for: indexPath) as! BannerCollectionViewCell
            cell.setUpData(entity: presenter.list[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == categoryCollectionView) {
            let size = (UIScreen.main.bounds.width - 48) / 5
            return CGSize(width: size, height: size * 2)
        } else {
            return CGSize(width: collectionView.frame.width - 48, height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
}
