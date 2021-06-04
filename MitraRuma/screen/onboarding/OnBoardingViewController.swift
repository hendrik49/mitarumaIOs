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
    }
    
    @IBAction func onNextClicked(_ sender: Any) {
        
    }
    
    @IBAction func onSkipClicked(_ sender: Any) {
    
    }
}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SliderContentCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderContentCollectionViewCell", for: indexPath) as! SliderContentCollectionViewCell
        cell.setUpData(entity: UIGenerator.generateOnBoarding()[indexPath.row])
        return cell
    }
}
