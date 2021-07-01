//
//  AddConsultationViewController.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 01/07/21.
//

import UIKit

class AddConsultationViewController: UIViewController {

    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var updatePhotoCollectionView: UICollectionView!
    @IBOutlet weak var estimatedBudgetFieldView: SingleInputFieldWithTitleView!
    @IBOutlet weak var nameFieldView: SingleInputFieldWithTitleView!
    @IBOutlet weak var contactFieldView: SingleInputFieldWithTitleView!
    @IBOutlet weak var addressFieldView: UITextView!
    
    private let presenter: AddConsultationPresenter = AddConsultationPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        estimatedBudgetFieldView.setUp(entity: UIFormBuilderEntity(id: "budget", title: "Estimated budget", hint: "Enter estimated budget"))
        nameFieldView.setUp(entity: UIFormBuilderEntity(id: "budget", title: "Estimated budget", hint: "Enter estimated budget"))
        contactFieldView.setUp(entity: UIFormBuilderEntity(id: "budget", title: "Estimated budget", hint: "Enter estimated budget"))
        
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        updatePhotoCollectionView.delegate = self
        updatePhotoCollectionView.dataSource = self
        
        updatePhotoCollectionView.register(UINib(nibName: String(describing: AddPhotoCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: AddPhotoCollectionViewCell.self))
    }
    
    @IBAction func onBookClicked(_ sender: Any) {
        
    }
}

extension AddConsultationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.photoList.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AddPhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AddPhotoCollectionViewCell.self), for: indexPath) as! AddPhotoCollectionViewCell
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (UIScreen.main.bounds.width - 32) / 5
        return CGSize(width: 80, height: 80)
    }
}

extension AddConsultationViewController: AddPhotoCollectionViewCellDelegate {
    func onAddPhotoClicked() {
        
    }
}
