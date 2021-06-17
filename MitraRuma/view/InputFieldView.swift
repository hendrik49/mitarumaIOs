//
//  InputFieldView.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 06/06/21.
//

import UIKit

protocol InputFieldViewDelegate {
    func onTextChanged(text: String)
}

class InputFieldView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    
    var text: String = ""
    var delegate: InputFieldViewDelegate? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        Bundle.main.loadNibNamed("InputFieldView", owner: self, options: nil)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: ["v1": view!]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1]|", options: [], metrics: nil, views: ["v1": view!]))
    }
    
    func setUpData(hint: String, type: UIKeyboardType? = nil) {
        inputTextField.attributedPlaceholder = NSAttributedString(string: hint)
        inputTextField.keyboardType = .default
        if let type = type {
            inputTextField.keyboardType = type
        }
    }
    
    @IBAction func onTextFieldChanged(_ sender: Any) {
        text = inputTextField.text ?? ""
        delegate?.onTextChanged(text: text)
    }
}
