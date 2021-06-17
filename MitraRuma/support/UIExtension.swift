//
//  UIExtension.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 06/06/21.
//

import Foundation
import UIKit

extension UIView {
    func onClick(onClick: @escaping () -> Void) {
        let gesture = TapGestureRecognizer(target: self, action:  #selector (self.onClickedAction (_:)))
        gesture.action = onClick
        addGestureRecognizer(gesture)
    }
    
    @objc func onClickedAction(_ sender: TapGestureRecognizer) {
        sender.action!()
    }
    
    func rotate(degree: Int) {
        if (degree == 1) {
            // 90
            transform = CGAffineTransform(rotationAngle: .pi / 2)
        } else if (degree == 2) {
            // 180
            transform = CGAffineTransform(rotationAngle: .pi)
        } else if (degree == 3) {
            // 270
            transform = CGAffineTransform(rotationAngle: .pi * 1.5)
        }
    }
    
    @IBInspectable
    var maskToBound: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
    
    @IBInspectable
    var rotate: Int {
        get {
            return -1
        }
        set {
            rotate(degree: newValue)
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            clipsToBounds = true
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var roundTL: Bool {
        get {
            return false
        }
        set {
            if (newValue) {
                layer.maskedCorners = [layer.maskedCorners, .layerMinXMinYCorner]
            } else {
                layer.maskedCorners.remove(.layerMinXMinYCorner)
            }
        }
    }
    
    @IBInspectable
    var roundTR: Bool {
        get {
            return false
        }
        set {
            if (newValue) {
                layer.maskedCorners = [layer.maskedCorners, .layerMaxXMinYCorner]
            } else {
                layer.maskedCorners.remove(.layerMaxXMinYCorner)
            }
        }
    }
    
    @IBInspectable
    var roundBL: Bool {
        get {
            return false
        }
        set {
            if (newValue) {
                layer.maskedCorners = [layer.maskedCorners, .layerMinXMaxYCorner]
            } else {
                layer.maskedCorners.remove(.layerMinXMaxYCorner)
            }
        }
    }
    
    @IBInspectable var roundBR: Bool {
        get {
            return false
        }
        set {
            if (newValue) {
                layer.maskedCorners = [layer.maskedCorners, .layerMaxXMaxYCorner]
            } else {
                layer.maskedCorners.remove(.layerMaxXMaxYCorner)
            }
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        set {
            layer.shadowColor = newValue!.cgColor
        }
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        set {
            layer.shadowOpacity = newValue
        }
        get {
            return layer.shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGPoint {
        set {
            layer.shadowOffset = CGSize(width: newValue.x, height: newValue.y)
        }
        get {
            return CGPoint(x: layer.shadowOffset.width, y:layer.shadowOffset.height)
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        set {
            layer.shadowRadius = newValue
        }
        get {
            return layer.shadowRadius
        }
    }
}

extension Encodable {
    func toDictionary() -> [String: Any] {
        return try! JSONSerialization.jsonObject(with: JSONEncoder().encode(self), options: []) as! [String: Any]
    }
}

extension String {
    func htmlToAttributedString(font: UIFont?) ->  NSAttributedString? {
        guard
            let data = data(using: .utf8)
            else { return nil }
        do {

            let string = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)

            let newString = NSMutableAttributedString(attributedString: string)
            string.enumerateAttributes(in: NSRange.init(location: 0, length: string.length), options: .reverse) { (_: [NSAttributedString.Key : Any], range, _) in
                newString.removeAttribute(.foregroundColor, range: range)
                newString.addAttribute(.foregroundColor, value: UIColor(red: CGFloat(0.098), green: CGFloat(0.165), blue: CGFloat(0.337), alpha: CGFloat(1)), range: range)
                if let font = font {
                    newString.removeAttribute(.font, range: range)
                    newString.addAttribute(.font, value: font, range: range)
                }
            }
        
            return newString
            
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    
    func replace(_ with: String, at index: Int) -> String {
        var modifiedString = String()
        for (i, char) in self.enumerated() {
            modifiedString += String((i == index) ? with : String(char))
        }
        return modifiedString
    }
}
