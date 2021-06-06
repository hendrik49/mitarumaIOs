//
//  SingleInputFieldView.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 06/06/21.
//

import UIKit

protocol SingleInputFieldViewDelegate {
    func onTextChanged(id: String, text: String)
}

class SingleInputFieldView: UIView, UITextFieldDelegate {

    @IBOutlet var view: UIView!
    @IBOutlet weak var textField: UITextField!
    
    var id: String = ""
    var delegate: SingleInputFieldViewDelegate? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        Bundle.main.loadNibNamed("SingleInputFieldView", owner: self, options: nil)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: ["v1": view!]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics: nil, views: ["v1": view!]))
        
        textField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if (isBackSpace == -92) {
                delegate?.onTextChanged(id: id, text: "")
            }
        }
        return true
    }
    
    func requestFocusTextField() {
        textField.becomeFirstResponder()
    }
    
    func getText() -> String {
        return textField.text ?? ""
    }
    
    @IBAction func onTextFieldChanged(_ sender: Any) {
        delegate?.onTextChanged(id: id, text: textField.text ?? "")
    }
}
