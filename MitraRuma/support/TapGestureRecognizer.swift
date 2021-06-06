//
//  TapGestureRecognizer.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 06/06/21.
//

import Foundation
import UIKit

class TapGestureRecognizer: UITapGestureRecognizer {
    var action : (()->Void)? = nil
}
