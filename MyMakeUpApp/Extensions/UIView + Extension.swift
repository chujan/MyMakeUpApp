//
//  UIView + Extension.swift
//  MyMakeUpApp
//
//  Created by Jennifer Chukwuemeka on 28/06/2022.
//

import Foundation
import UIKit
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
