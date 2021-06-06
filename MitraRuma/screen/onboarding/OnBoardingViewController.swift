//
//  OnBoardingViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 04/06/21.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "SliderContentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SliderContentCollectionViewCell")
        
        pageControl.currentPage = 0
    }
    
    @IBAction func onNextClicked(_ sender: Any) {
        
    }
    
    @IBAction func onSkipClicked(_ sender: Any) {
    
    }
}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UIGenerator.generateOnBoarding().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SliderContentCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderContentCollectionViewCell", for: indexPath) as! SliderContentCollectionViewCell
        cell.setUpData(entity: UIGenerator.generateOnBoarding()[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
}
