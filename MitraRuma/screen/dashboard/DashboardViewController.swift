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
    
    private let presenter: DashboardPresenter = DashboardPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setUpData()
        setUpText()
        setUpBannerCollectionView()
    }
    
    private func setUpBannerCollectionView() {
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        pageControl.numberOfPages = presenter.list.count
        
        bannerCollectionView.register(UINib(nibName: String(describing: BannerCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: BannerCollectionViewCell.self))
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

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BannerCollectionViewCell.self), for: indexPath) as! BannerCollectionViewCell
        cell.setUpData(entity: presenter.list[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 48, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
}
