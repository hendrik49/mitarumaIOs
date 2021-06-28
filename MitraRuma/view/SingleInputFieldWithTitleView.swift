//
//  SingleInputFieldWithTitleView.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 28/06/21.
//

import UIKit

protocol SingleInputFieldWithTitleViewDelegate {
    func onTextChanged(id: String, text: String)
}

class SingleInputFieldWithTitleView: UIView, UITextFieldDelegate {

    @IBOutlet var view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var entity: UIFormBuilderEntity!
    var delegate: SingleInputFieldWithTitleViewDelegate? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        Bundle.main.loadNibNamed("SingleInputFieldWithTitleView", owner: self, options: nil)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: ["v1": view!]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics: nil, views: ["v1": view!]))
        
        textField.delegate = self
    }
    
    @IBAction func onTextFieldChanged(_ sender: Any) {
        entity.text = getText()
        delegate?.onTextChanged(id: entity.id, text: entity.text)
    }
    
    func setUp(entity: UIFormBuilderEntity) {
        self.entity = entity
        titleLabel.text = entity.title
        textField.placeholder = entity.hint
        textField.text = entity.text
    }
    
    func requestFocusTextField() {
        textField.becomeFirstResponder()
    }
    
    func getText() -> String {
        return textField.text ?? ""
    }
}
