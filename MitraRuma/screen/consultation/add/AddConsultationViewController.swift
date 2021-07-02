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
        
        presenter.delegate = self
        
        estimatedBudgetFieldView.setUp(entity: UIFormBuilderEntity(id: "budget", title: "Estimated budget", hint: "Enter estimated budget"))
        nameFieldView.setUp(entity: UIFormBuilderEntity(id: "name", title: "Name", hint: "Enter name"))
        contactFieldView.setUp(entity: UIFormBuilderEntity(id: "contact", title: "Contact", hint: "Enter contact"))
        
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        updatePhotoCollectionView.delegate = self
        updatePhotoCollectionView.dataSource = self
        
        updatePhotoCollectionView.register(UINib(nibName: String(describing: AddPhotoCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: AddPhotoCollectionViewCell.self))
        updatePhotoCollectionView.register(UINib(nibName: String(describing: PhotoCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: PhotoCollectionViewCell.self))
    }
    
    @IBAction func onBookClicked(_ sender: Any) {
        let detail: String = detailTextView.text
        let estimatedBudget: Int = try! Int(value: estimatedBudgetFieldView.getText().isEmpty ? "0" : estimatedBudgetFieldView.getText())
        let name: String = nameFieldView.getText()
        let contact: String = contactFieldView.getText()
        let address: String = addressFieldView.text
        
        presenter.book(detail: detail, estimatedBudget: estimatedBudget, name: name, contact: contact, address: address)
    }
}

extension AddConsultationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.photoList.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row == presenter.photoList.count) {
            let cell: AddPhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AddPhotoCollectionViewCell.self), for: indexPath) as! AddPhotoCollectionViewCell
            cell.delegate = self
            return cell
        } else {
            let cell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotoCollectionViewCell.self), for: indexPath) as! PhotoCollectionViewCell
            cell.setUpData(entity: presenter.photoList[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}

extension AddConsultationViewController: AddConsultationPresenterDelegate {
    func onSuccessUploadImage() {
        updatePhotoCollectionView.reloadData()
    }
}

extension AddConsultationViewController: AddPhotoCollectionViewCellDelegate {
    func onAddPhotoClicked() {
        let viewController: UIImagePickerController = UIImagePickerController()
        viewController.delegate = self
        present(viewController, animated: true, completion: nil)
    }
}

extension AddConsultationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }

        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
            presenter.photoList.append(UIUriEntity(url: imagePath))
            updatePhotoCollectionView.reloadData()
            presenter.uploadImage()
        }

        dismiss(animated: true)
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
