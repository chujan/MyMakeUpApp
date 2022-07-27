//
//  CardView.swift
//  MyMakeUpApp
//
//  Created by Jennifer Chukwuemeka on 28/06/2022.
//

import Foundation
import UIKit
class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initalSetup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initalSetup()
    }
    private func initalSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        cornerRadius = 10
        
    }
}
