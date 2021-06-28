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
    
    private var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkSession()
    }
    
    private func checkSession() {
        if (!CustomUserDefaults.getAuthToken().isEmpty) {
            let navigationController: UINavigationController = UINavigationController(rootViewController: HomeViewController())
            navigationController.setNavigationBarHidden(true, animated: false)
            navigationController.setToolbarHidden(true, animated: false)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        }
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "SliderContentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SliderContentCollectionViewCell")
        
        pageControl.currentPage = currentIndex
    }
    
    @IBAction func onNextClicked(_ sender: Any) {
        if (currentIndex != 2) {
            currentIndex += 1
            pageControl.currentPage = currentIndex
            collectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .right, animated: true)
            
            if (currentIndex == 2) {
                nextButton.setTitle("Lanjut", for: .normal)
            }
        } else {
            let navigationController: UINavigationController = UINavigationController(rootViewController: LoginViewController())
            navigationController.setNavigationBarHidden(true, animated: false)
            navigationController.setToolbarHidden(true, animated: false)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        }
    }
    
    @IBAction func onSkipClicked(_ sender: Any) {
        let navigationController: UINavigationController = UINavigationController(rootViewController: LoginViewController())
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setToolbarHidden(true, animated: false)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
